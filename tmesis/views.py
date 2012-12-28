import django.http
from django.utils import simplejson

import models


def nearby(request, content_id):
    ret = models.Content.get_nearby_content(
        content_id, 5, 5, 5, 5)

    return django.http.HttpResponse(
        mimetype='application/json',
        content=simplejson.dumps(ret))
