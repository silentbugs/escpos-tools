# Use the official PHP image, slim variant for minimal footprint
FROM php:7.4-cli-alpine

# Install Composer in the image
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set the working directory inside the container
WORKDIR /app

# Copy the application source code into the container
COPY . /app/
RUN rm -rf /app/data

# Install PHP dependencies
RUN composer install

# The container starts with PHP, but does not run the script automatically
# This allows for passing the script and any arguments at runtime
ENTRYPOINT ["php", "esc2html.php"]
CMD []
