from django.conf.urls import patterns, url


urlpatterns = patterns(
    '',
    url(r'^$', 'viron.views.browser', name='home')
)
