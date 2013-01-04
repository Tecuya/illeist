# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Content'
        db.create_table('tmesis_content', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=255)),
        ))
        db.send_create_signal('tmesis', ['Content'])

        # Adding model 'ContentRelation'
        db.create_table('tmesis_contentrelation', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('parent', self.gf('django.db.models.fields.related.ForeignKey')(related_name='parent_relation', to=orm['tmesis.Content'])),
            ('child', self.gf('django.db.models.fields.related.ForeignKey')(related_name='child_relation', to=orm['tmesis.Content'])),
        ))
        db.send_create_signal('tmesis', ['ContentRelation'])


    def backwards(self, orm):
        # Deleting model 'Content'
        db.delete_table('tmesis_content')

        # Deleting model 'ContentRelation'
        db.delete_table('tmesis_contentrelation')


    models = {
        'tmesis.content': {
            'Meta': {'object_name': 'Content'},
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