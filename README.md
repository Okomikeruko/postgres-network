# Multi-Version PostgreSQL Development Environment

This repository provides a simple way to run multiple versions of PostgreSQL (13, 14, and 15) simultaneously in Docker containers. This setup is useful for testing database compatibility across different PostgreSQL versions or for developing applications that need to support multiple PostgreSQL versions.

## Prerequisites

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)
- Make (usually pre-installed on Linux/macOS, available via [GnuWin32](http://gnuwin32.sourceforge.net/packages/make.htm) or [Chocolatey](https://chocolatey.org/packages/make) on Windows)

## Quick Start

To build and start all PostgreSQL containers:

```bash
make
```

This will:
1. Create the required Docker network
2. Build the Docker containers
3. Start all PostgreSQL instances in detached mode

## Manual Setup

If you prefer to run commands individually:

1. Create the required network:
   ```bash
   docker network create postgres_network
   ```

2. Build the containers:
   ```bash
   docker-compose build
   ```

3. Start the containers:
   ```bash
   docker-compose up -d
   ```

## Container Details

| PostgreSQL Version | Container Name | Port Mapping | Data Volume         |
|--------------------|----------------|--------------|---------------------|
| 15                 | postgres15     | 5432:5432    | postgres15_data     |
| 14                 | postgres14     | 5433:5432    | postgres14_data     |
| 13                 | postgres13     | 5434:5432    | postgres13_data     |

## Connection Information

- **Host**: localhost (or your Docker host IP)
- **Ports**: 5432 (v15), 5433 (v14), 5434 (v13)
- **Username**: postgres
- **Password**: devpassword (default, can be changed via environment variable)

### Connection Examples

For PostgreSQL 15:
```bash
psql -h localhost -p 5432 -U postgres
```

For PostgreSQL 14:
```bash
psql -h localhost -p 5433 -U postgres
```

For PostgreSQL 13:
```bash
psql -h localhost -p 5434 -U postgres
```

## Environment Variables

- `POSTGRES_PASSWORD`: Set this environment variable to change the default password (devpassword)

Example:
```bash
POSTGRES_PASSWORD=mysecretpassword docker-compose up -d
```

## Stopping the Containers

To stop all running containers:

```bash
docker-compose down
```

## Persistent Storage

Data for each PostgreSQL instance is stored in a named volume:

- postgres15_data
- postgres14_data
- postgres13_data

These volumes persist even after containers are stopped, ensuring your data is preserved between restarts.

## License

[MIT](LICENSE)
