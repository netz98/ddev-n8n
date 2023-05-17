# DDEV n8n Addon

This addon sets up a n8n instance for your DDEV project. n8n is a free and open fair-code licensed node based Workflow Automation Tool.

## Installation

1. Run `ddev get netz98/ddev-n8n` to install the addon in your exiting ddev project.
2. `ddev restart` to restart your project.

## Usage

After installation, you can access the n8n instance by visiting `https://<yourname>.ddev.site:5678` and using the username and password you set.

Run `ddev describe` to list your project's services and their URLs.

## Configuration

### n8n Settings

Settings are in general defined in the file `.ddev/docker-compose.n8n.yaml` via environment variables.

A list of all available environment variables can be found in the reference here:
https://docs.n8n.io/hosting/environment-variables/environment-variables/

The timezone is set to "Europe/Berlin". Why? Because we are from Germany.
Change the environment variable `GENERIC_TIMEZONE` to your timezone.

### Database

The n8n service uses the existing DDEV MySQL server. The `n8n/startup-script.sh`  creates a new database named `n8n` during startup of the container.

Currently **only mysql** is supported by the ddev add-on.

## Logging

n8n logs are directed to the container's stdout. You can view the logs with `ddev logs -s n8n`.

## Security

The n8n service can protected with basic authentication. 
It's disabled by default.

You can enable it by changing the variable `N8N_BASIC_AUTH_ACTIVE` in `.ddev/docker-compose.n8n.yaml` to `true`. 
The username and password can be configured in the same file.

