import backbone
from models import Content


class ContentAPIView(backbone.views.BackboneAPIView):
    model = Content
    display_fields = ('id', 'title')
    ordering = ('-id',)


backbone.site.register(ContentAPIView)
