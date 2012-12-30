from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

import backbone
backbone.autodiscover()

urlpatterns = patterns(
    '',

    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/', include(admin.site.urls)),

    url(r'^api/', include('tmesis.urls')),
    url(r'^backbone/', include(backbone.site.urls)),

    url(r'^spec', 'viron.views.showtpl', {'template': 'spec.html'}),

    url(r'^.*', include('viron.urls')),
)
