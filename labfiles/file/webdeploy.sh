#! /bin/bash

sudo mv /tmp/bookapp.conf /etc/apache2/sites-available
sudo chown -R www-data:www-data /var/www/html/bookapp
sudo a2ensite bookapp.conf
sudo systemctl reload apache2
