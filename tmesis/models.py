from django.db import models


class Content(models.Model):
    title = models.CharField(max_length=255)

    @classmethod
    def get_nearby_content(self, up_limit, up_depth, down_limit, down_depth):
        pass


class ContentRelation(models.Model):
    parent = models.ForeignKey('Content', related_name='parent_relation')
    child = models.ForeignKey('Content', related_name='child_relation')
