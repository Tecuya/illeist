from django.contrib import admin
from models import Content, ContentRelation


class ContentParentInline(admin.TabularInline):
    model = ContentRelation
    fk_name = 'child'


class ContentChildInline(admin.TabularInline):
    model = ContentRelation
    fk_name = 'parent'


class ContentAdmin(admin.ModelAdmin):
    inlines = [ContentParentInline,
               ContentChildInline]


admin.site.register(Content, ContentAdmin)

# admin.site.register(ContentRelation) # , ContentAdmin)
