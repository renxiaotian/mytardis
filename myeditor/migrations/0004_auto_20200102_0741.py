# Generated by Django 3.0.1 on 2020-01-02 07:41

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('myeditor', '0003_auto_20200102_0712'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='programa',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, related_name='art_programa', to='myeditor.Topnav'),
        ),
    ]
