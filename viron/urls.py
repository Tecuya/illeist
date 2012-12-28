from django.conf.urls import patterns, url


urlpatterns = patterns(
    'viron.views',
    url(r'^$', 'browser', name='home')
)
