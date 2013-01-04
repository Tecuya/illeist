# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'Content.date_create'
        db.add_column('tmesis_content', 'date_create',
                      self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, default=datetime.datetime(2013, 1, 4, 0, 0), db_index=True, blank=True),
                      keep_default=False)

        # Adding field 'Content.content'
        db.add_column('tmesis_content', 'content',
                      self.gf('django.db.models.fields.TextField')(default=datetime.datetime(2013, 1, 4, 0, 0)),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting field 'Content.date_create'
        db.delete_column('tmesis_content', 'date_create')

        # Deleting field 'Content.content'
        db.delete_column('tmesis_content', 'content')


    models = {
        'tmesis.content': {
            'Meta': {'object_name': 'Content'},
            'content': ('django.db.models.fields.TextField', [], {}),
            'date_create': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'db_index': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        'tmesis.contentrelation': {
            'Meta': {'object_name': 'ContentRelation'},
            'child': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'child_relation'", 'to': "orm['tmesis.Content']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'parent': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'parent_relation'", 'to': "orm['tmesis.Content']"})
        }
    }

    complete_apps = ['tmesis']