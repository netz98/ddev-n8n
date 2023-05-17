# DDEV n8n Addon

This addon sets up a n8n instance for your DDEV project. n8n is a free and open fair-code licensed node based Workflow Automation Tool.

## Installation

1. Copy `docker-compose.n8n.yaml` into your `.ddev` directory.
2. Copy `install.yaml` into your `.ddev` directory.
3. Modify the environment variables in `docker-compose.n8n.yaml` to match your setup. Be sure to replace `n8n` and `n8n` with the username and password you want to use for n8n.
4. Add the `post-start` hook in `.ddev/config.yaml` to create the `n8n` database.
5. Run `ddev restart` to restart your project.

## Basic Authentication

If not changed it's set to `n8n` and `n8n`.

## Usage

After installation, you can access the n8n instance by visiting `http://n8n.ddev.site:5678` and using the username and password you set.

## Database Configuration

The n8n service uses the existing DDEV MySQL server. The `post-start` hook in `.ddev/config.yaml` creates a new database named `n8n`. The username, password, and hostname for the MySQL server are `db`.

## Logging

n8n logs are directed to the container's stdout. You can view the logs with `ddev logs n8n`.

## Security

The n8n service is protected with basic authentication. You can set the username and password in the `docker-compose.n8n.yaml` file.
