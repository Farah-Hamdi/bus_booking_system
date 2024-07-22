# Dockerfile
ARG RUBY_VERSION=3.3.4
FROM registry-1.docker.io/library/ruby:$RUBY_VERSION-slim

WORKDIR /rails

ENV RAILS_ENV="development" \
    BUNDLE_PATH="/usr/local/bundle" 


ENV DEV_JWT_SECRET_KEY="3cc02500e48565fc4f697217665a68d42ac07fff925cd6d9d2d7e5692249b34bb1f276e6b6c163c197f055d5eecd95cbad2e04802b7511b30c8f554bff803fea"

# Install packages needed for development
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libvips pkg-config libsqlite3-dev curl libsqlite3-0 && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code
COPY . .

# # Adjust binfiles to be executable on Linux
RUN chmod +x bin/* && \
    sed -i "s/\r$//g" bin/* && \
    sed -i 's/ruby\.exe$/ruby/' bin/*

# Copy the entrypoint script and ensure it's executable
COPY bin/docker-entrypoint /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

# Run and own only the runtime files as a non-root user for security
RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp
USER rails:rails

# Set the entrypoint script
ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]
