CREATE DATABASE IF NOT EXISTS local_authorization DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER IF NOT EXISTS 'authorization_server_user'@'%' IDENTIFIED BY 'local_pass';
GRANT ALL PRIVILEGES ON local_authorization.* TO 'authorization_server_user'@'%' IDENTIFIED BY 'local_pass';
FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS identity_provider DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER IF NOT EXISTS 'identity_provider_user'@'%' IDENTIFIED BY 'local_pass';
GRANT ALL PRIVILEGES ON identity_provider.* TO 'identity_provider_user'@'%' IDENTIFIED BY 'local_pass';
FLUSH PRIVILEGES;
