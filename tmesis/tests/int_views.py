from django.test import TestCase
from django.test.client import Client
from django.utils import simplejson

from shared import create_test_data


class TestNearby(TestCase):

    def setUp(self):
        create_test_data()

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

        self.assertEquals(ret['data']['id'], 1)
