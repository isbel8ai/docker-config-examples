# Repository Guidelines

## Project Structure & Module Organization

This repository contains Docker Compose examples, grouped by service in top-level directories such as `postgresql/`, `temporal/`, `keycloak-a1/`, and `request-tracker/`. Most modules contain a single `compose.yaml`, `compose.yml`, or `docker-compose.yml`. Supporting assets live beside the Compose file, for example `request-tracker/config/`, `open-telemetry/etc/otel/`, `temporal/dynamicconfig/`, and `mockservers-a1/mockserver-expectations/`.

There is no shared application source tree or test suite. Treat each service directory as an independent runnable example.

## Build, Test, and Development Commands

Run commands from the service directory unless the command includes `-f`.

```sh
docker compose config
```

Validates and renders the current Compose file.

```sh
docker compose up -d
docker compose down
```

Starts or stops one example stack.

```sh
docker compose -f temporal/compose.yaml config
```

Validates a specific stack from the repository root.

## Coding Style & Naming Conventions

Use YAML with two-space indentation. Prefer `compose.yaml` for new examples unless an existing directory already uses another Compose filename. Keep directory names lowercase and hyphenated, matching the service name, for example `mongo-express/` or `sonar-qube-postgres/`.

Use named volumes for persistent service data and relative bind mounts only for checked-in or documented local configuration. Keep environment variables uppercase with underscores, and put local defaults in a `.env` file using `KEY=value` syntax.

## Testing Guidelines

Before committing, run `docker compose config` for every Compose file you changed. For runtime-sensitive changes, also run `docker compose up -d`, check container health/logs, then clean up with `docker compose down`.

When adding bind mounts, verify the source path exists or document that Docker will create it. Check for host port conflicts if multiple examples expose common ports such as `5432`, `8080`, `9000`, `1521`, or `61616`.

## Commit & Pull Request Guidelines

Recent commits use short imperative summaries, such as `Add ActiveMQ configuration` and `Update Request Tracker config`. Follow that style: start with a verb and name the affected service.

Pull requests should describe the service changed, list required environment variables or credentials, include validation output from `docker compose config`, and mention any new exposed ports, volumes, bind mounts, or private registry dependencies.

## Security & Configuration Tips

Do not commit real secrets, tokens, or production credentials. Use placeholder values in examples and document required variables. Avoid embedding organization-specific private image references unless the example intentionally targets that registry.
