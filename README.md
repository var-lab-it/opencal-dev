# OpenCal - local development environment

This repository is created for local development of OpenCal, especially for the following repositories:

- [OpenCal Web Frontend](https://github.com/var-lab-it/opencal-web)
- [OpenCal Backend API](https://github.com/var-lab-it/opencal)

## Getting started

1. Create a directory for all repositories:

```
mkdir ~/your-projects/opencal
cd ~/your-projects/opencal
```

2. Pull this repository

```bash
git clone git@github.com:var-lab-it/opencal-dev.git
```

It should be placed in the folder `~/your-projects/opencal`.

3. Pull the frontend repository:

```bash
git@github.com:var-lab-it/opencal-web.git
```

It should be placed in the folder `~/your-projects/opencal`.

4. Pull the backend repository:

```bash
git@github.com:var-lab-it/opencal.git
```

It should be placed in the folder `~/your-projects/opencal`.

Directory structure after pulling all required repositories:

```
~/your-projects/opencal
|-- /opencal-dev
|-- /opencal-web
|-- /opencal
```

5. Create `.env`-file

You can copy the `.env.dist` file, it contains a basic configuration:

```bash
cp .env.dist .env
```

6. Build the docker images

```bash
make build
# or
docker compose build
```

7. Install the dependencies outside the containers

```bash
make install
# or
docker compose run --entrypoint="composer" php_backend install
docker compose run --entrypoint="npm" frontend install
```

8. Start the docker containers

```bash
make up
# or 
docker compose up -d
```

OpenCal is licensed under the GNU AGPLv3 License.

Created by var-lab IT GmbH and contributors.
