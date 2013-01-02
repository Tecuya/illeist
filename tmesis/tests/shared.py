
from tmesis.models import Content, ContentRelation


# might want to extend django TestCase to do this automatically
def create_data():
    tc = Content.objects.create(
        title='test content')

    tc2 = Content.objects.create(
        title='test child content')

    ContentRelation.objects.create(
        parent=tc, child=tc2)
