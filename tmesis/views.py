import django.http
from django.utils import simplejson

import models


def nearby(request):
    ret = models.Content.get_nearby_content()

    return django.http.HttpResponse(
        mimetype='application/json',
        content=simplejson.dumps(ret))
