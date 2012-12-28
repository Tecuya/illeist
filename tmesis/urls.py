from django.conf.urls import patterns, url


urlpatterns = patterns(
    'tmesis.views',
    url(r'^nearby/(?P<content_id>[0-9]+)$', 'nearby', name='home')
)
