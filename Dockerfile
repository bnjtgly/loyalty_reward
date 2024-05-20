FROM ruby:3.3.1

# Install additional dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    postgresql-client \
    git \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /loyalty_reward

# Copy application files
COPY . /loyalty_reward/

# Install bundler
RUN gem install bundler

# Set bundle path
ENV BUNDLE_PATH /gems

# Install gems
RUN bundle config --global frozen 1 && bundle install

# Define entry point and default command
ENTRYPOINT ["bin/rails"]
CMD ["server", "-b", "0.0.0.0"]
