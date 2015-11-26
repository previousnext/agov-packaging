<?php

$settings['hash_salt'] = getenv('AGOV_HASH_SALT') ?: '';
$settings['container_yamls'][] = __DIR__ . '/services.yml';

// Connection to persistent storage.
$databases['default']['default'] = array (
  'database' => getenv('AGOV_DB_NAME') ?: '',
  'username' => getenv('AGOV_DB_USER') ?: '',
  'password' => getenv('AGOV_DB_PASS') ?: '',
  'prefix' => getenv('AGOV_DB_PREFIX') ?: '',
  'host' => getenv('AGOV_DB_HOST') ?: '',
  'port' => getenv('AGOV_DB_PORT') ?: '3306',
  'namespace' => getenv('AGOV_DB_NAMESPACE') ?: 'Drupal\\Core\\Database\\Driver\\mysql',
  'driver' => getenv('AGOV_DB_DRIVER') ?: 'mysql',
);

$settings['install_profile'] = 'agov';

$config_directories = array(
  'sync' => getenv('AGOV_DIR_CONFIG_SYNC') ?: '',
);

// Allows for a "last say" on an environments configuration.
if (file_exists(__DIR__ . '/settings.local.php')) {
  include __DIR__ . '/settings.local.php';
}
