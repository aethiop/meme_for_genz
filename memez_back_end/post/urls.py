from django.urls import path
from .views import api_get_post_view, api_create_post_view, APIListView

app_name = 'post_api'
urlpatterns = [
    path('get/<id>/', api_get_post_view, name='detail'),
    path('create', api_create_post_view, name='create'),
    path('list', APIListView.as_view(), name='list')
]
