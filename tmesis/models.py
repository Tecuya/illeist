from django.db import models


class Content(models.Model):
    title = models.CharField(max_length=255)


class ContentRelation(models.Model):
    parent = models.ForeignKey('Content', related_name='parent_relation')
    child = models.ForeignKey('Content', related_name='child_relation')
