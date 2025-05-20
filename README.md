# DDEV n8n Addon

This addon sets up a n8n instance for your DDEV project. n8n is a free and open fair-code licensed node based Workflow Automation Tool.

## Installation

To install the addon in your existing DDEV project for DDEV v1.23.5 or above run

```bash
ddev add-on get netz98/ddev-n8n
```

For earlier versions of DDEV run

```bash
ddev get netz98/ddev-n8n
```

Then restart your project

```bash
ddev restart
```

## Usage

After installation, you can access the n8n instance by visiting `https://<yourname>.ddev.site:5678` and using the username and password you set.

Run `ddev describe` to list your project's services and their URLs.

## Configuration

### Docker

To modify the build of the used n8n image for the container there are dotenv variables available.

- `N8N_TAG` - The used n8n image tag. Default is `latest`.
- `N8N_TIMEZONE` - The timezone of the n8n container. Default is `Europe/Berlin`.
- `N8N_BASIC_AUTH_ACTIVE` - Enable basic authentication. Default is `false`.
- `N8N_BASIC_AUTH_USER` - The basic authentication username. Default is `n8n`.
- `N8N_BASIC_AUTH_PASSWORD` - The basic authentication password. Default is `n8n`.
- `N8N_ENCRYPTION_KEY` - The encryption key for sensitive data. Default is `n8n`.

Use the ddev dotenv command to set these variables.

```bash
ddev dotenv set .ddev/.env.n8n --n8n-tag=1.50.0
```

### n8n Settings

Settings are in general defined in the file `.ddev/docker-compose.n8n.yaml` via environment variables.

A list of all available environment variables can be found in the reference here:
https://docs.n8n.io/hosting/environment-variables/environment-variables/

The timezone is set to "Europe/Berlin". Why? Because we are from Germany.
Change the environment variable `GENERIC_TIMEZONE` to your timezone.

### Database

#### Standard SQLite

The n8n service uses the standard SQLite database.
The SQLite database file will be created as file `.ddev/n8n/data/.n8n/database.sqlite` during the n8n container startup.

## Logging

n8n logs are directed to the container's stdout. You can view the logs with `ddev logs -s n8n`.

## Security

The n8n service access can be protected with basic authentication.
It's disabled by default.

You can enable it by changing the variable `N8N_BASIC_AUTH_ACTIVE` in `.ddev/docker-compose.n8n.yaml` to `true`. 
The username and password can be configured in the same file.
