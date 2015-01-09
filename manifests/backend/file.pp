#
# used to configure file backends for glance
#
#  $filesystem_store_datadir - Location where dist images are stored when
#  default_store == file.
#  Optional. Default: /var/lib/glance/images/
class glance::backend::file(
  $filesystem_store_datadir = '/var/lib/glance/images/',
  $default_store            = true,
) inherits glance::api {

  glance_api_config {
    'DEFAULT/filesystem_store_datadir': value => $filesystem_store_datadir;
  }

  if $default_store {
    glance_api_config {
      'DEFAULT/default_store': value => 'file';
    }
  }

  glance_cache_config {
    'DEFAULT/filesystem_store_datadir': value => $filesystem_store_datadir;
  }
}
