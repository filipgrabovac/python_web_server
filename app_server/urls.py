from django.urls import path
from . import router

urlpatterns = [
    path("index", router.index, name="index"),
]