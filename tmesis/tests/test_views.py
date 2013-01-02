import unittest

from mock import MagicMock, patch
import django.http
from django.test.client import Client
from django.utils import simplejson
import django.test

from shared import create_data
import tmesis.views


class SpecNearby(unittest.TestCase):
    "tmesis.views::nearby - spec"

    @patch('tmesis.views.models.Content.get_nearby_content')
    def test_should_format_get_nearby_content_response_to_json(self, mock_gnc):
        mock_request = MagicMock()
        mock_gnc.return_value = {'abc': 123}
        ret = tmesis.views.nearby(mock_request, 123)

        respjsonobj = simplejson.loads(ret.content)

        self.assertIs(type(ret), django.http.HttpResponse)
        self.assertEquals(mock_gnc.return_value['abc'],
                          respjsonobj['abc'])

        # self.assertIn(call(), mock_gnc.mock_calls)


class TestViewsNearby(django.test.TestCase):
    "tmesis.views::nearby - integration"

    def setUp(self):
        create_data()

    def test_nearby_works(self):

        # >>> from django.test.client import Client
        # >>> c = Client()
        # >>> response = c.post('/login/', {
        # 'username': 'john', 'password': 'smith'})
        # >>> response.status_code
        # 200
        # >>> response = c.get('/customer/details/')
        # >>> response.content

        c = Client()
        resp = c.get('/api/nearby/1')

        ret = simplejson.loads(resp.content)

        self.assertEquals(ret[0]['id'], 2)
