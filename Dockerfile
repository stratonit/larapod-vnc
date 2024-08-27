# Use the Gitpod full VNC image as a base
FROM gitpod/workspace-full-vnc

# Install PHP and required extensions
RUN sudo apt-get update && sudo apt-get install -y \
php-cli \
php-mbstring \
php-xml \
php-zip \
php-curl \
php-mysql \
unzip \
curl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node.js (using NodeSource)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - \
&& sudo apt-get install -y nodejs

# Install Laravel globally
RUN composer global require laravel/installer

# Add Composer's global bin directory to PATH
ENV PATH="$PATH:$HOME/.composer/vendor/bin"

# Expose the port for Laravel
EXPOSE 7777
