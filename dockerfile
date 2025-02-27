FROM node:20-alpine as frontend
WORKDIR /app
COPY package.json .
# Install pnpm globally
RUN npm install -g pnpm
RUN pnpm install
COPY . .
RUN pnpm run build

FROM python:3.11-alpine as backend
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
COPY --from=frontend /app/dist ./dist

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

