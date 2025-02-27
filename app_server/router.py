from django.shortcuts import render
from django.http import HttpResponse, HttpRequest
# Create your views here.
def index(request: HttpRequest):
    print(request)
    return HttpResponse("Hello World!")