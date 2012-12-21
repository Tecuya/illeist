import unittest

from mock import MagicMock, patch, call
import django.http
from django.utils import simplejson

# system under test
import tmesis.views


class TestAPI(unittest.TestCase):

    @patch('tmesis.views.models.Content.get_nearby_content')
    def test_should_format_get_nearby_content_response_to_json(self, mock_gnc):
        mock_request = MagicMock()
        mock_gnc.return_value = {'abc': 123}
        ret = tmesis.views.nearby(mock_request)

        respjsonobj = simplejson.loads(ret.content)

        self.assertIs(type(ret), django.http.HttpResponse)
        self.assertEquals(mock_gnc.return_value['abc'],
                          respjsonobj['abc'])
        self.assertIn(call(), mock_gnc.mock_calls)
