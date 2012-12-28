from django.db import models


class Content(models.Model):
    title = models.CharField(max_length=255)

    def __unicode__(self):
        return self.title

    def jsonify(self):
        return {
            'id': self.pk,
            'title': self.title}

    @classmethod
    def get_nearby_content(
            cls, content_id, up_limit, up_depth, down_limit, down_depth):

        def add_for_content_id(content_id, depth=1):
            children = Content.objects.filter(
                child_relation__parent_id=content_id)[:down_limit]

            ret = []

            if depth < down_limit:
                for content in children:
                    ret.append(
                        {'data': content.jsonify(),
                         'children': add_for_content_id(
                             content.id, depth + 1)})

            return ret

        return {'data': Content.objects.get(id=content_id).jsonify(),
                'children': add_for_content_id(content_id)}


class ContentRelation(models.Model):
    parent = models.ForeignKey('Content', related_name='parent_relation')
    child = models.ForeignKey('Content', related_name='child_relation')

    def __unicode__(self):
        return '%s > %s' % (self.parent, self.child)
