# README

## Prerequisites

1. **Download & Install Docker**: Ensure Docker is installed on your system. You can download and install Docker from the [official Docker website](https://www.docker.com/get-started).

2. **Clone this repo**: Clone this repository to your local machine.

3. **Navigate to the project directory**: Change your current directory to the project directory `loyalty_reward`.

    ```bash
    cd loyalty_reward
    ```

## Setup via Docker

1. **Build the Docker containers**

    ```bash
    docker-compose build
    ```

2. **Start the Docker containers**

    ```bash
    docker-compose up
    ```

3. **Access the loyalty-api container**

    ```bash
    docker-compose exec loyalty-api bash
    ```

4. **Run the setup script inside the container to setup the DB.**

    ```bash
    bin/setup
    ```

5. **Start the Docker containers again (if necessary)**

    ```bash
    docker-compose up
    ```

## Tests
1. **Start the Docker containers**
    ```bash
    docker-compose up
    ```

2. **Access the loyalty-api container**
    ```bash
    docker-compose exec loyalty-api bash
    ```
3. **Run the tests inside the container.**
    ```bash
    bundle exec rspec
    ```

## Local Setup

1. **Install Ruby 3.3.1**

2. **Run Bundle Install**
    ```bash
    bundle install
    ```
3. **Setup Database**
    ```bash
    rails db:setup
    ```
4. **Run app**
    ```bash
    rails s
    ```