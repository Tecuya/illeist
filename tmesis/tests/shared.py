
from tmesis.models import Content, ContentRelation


# might want to extend django TestCase to do this automatically
def create_test_data():
    tc = Content.objects.create(
        title='test content')
    return tc
