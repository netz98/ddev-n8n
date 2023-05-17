# DDEV n8n Addon

This addon sets up a n8n instance for your DDEV project. n8n is a free and open fair-code licensed node based Workflow Automation Tool.

## Installation

1. Run `ddev get netz98/ddev-n8n` to install the addon in your exiting ddev project.
2. `ddev restart` to restart your project.

## Basic Authentication

The Basic Auth is disabled by default.
Enable it in the .ddev/docker-compose.n8n.yaml if required.
The credentials are defined in the same file. If not changed it's set to `n8n` and `n8n` for username and password.

## Usage

After installation, you can access the n8n instance by visiting `https://<yourname>.ddev.site:5678` and using the username and password you set.

Run `ddev describe` to list your project's services and their URLs.

## Database Configuration

The n8n service uses the existing DDEV MySQL server. The `n8n/startup-script.sh`  creates a new database named `n8n` during startup of the container.

Currently **only mysql** is supported by the ddev add-on. 

## Logging

n8n logs are directed to the container's stdout. You can view the logs with `ddev logs -s n8n`.

## Security

The n8n service can protected with basic authentication. 
It's disabled by default.

You can enable it by changing the variable `N8N_BASIC_AUTH_ACTIVE` in `.ddev/docker-compose.n8n.yaml` to `true`. 
The username and password can be configured in the same file.
