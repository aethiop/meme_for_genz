from django.urls import path
from .views import registration_view, user_detail_view, user_update_view, ObtainAuthTokenView
from rest_framework.authtoken.views import obtain_auth_token
app_name = 'user_api'

urlpatterns = [
    path('register', registration_view, name='register'),
    path('detail', user_detail_view, name='detail'),
    path('update', user_update_view, name='update'),
    path('login', ObtainAuthTokenView.as_view(), name='login'),
]
