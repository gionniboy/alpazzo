# Docker LEMP Stack

Docker-compose.yml - Directive file for building multiple docker containers.

### Containers specs:

- Nginx 1.25
- MariaDB 11
- PHP-fpm 8.2

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

IMPORTANT! CHECK COMPATIBILITY MATRIX COMPOSE/DOCKER !
[docs.docker.com](https://docs.docker.com/compose/compose-file/#reference-and-guidelines)

- A working computer with Windows/OSX/GNU-Linux
- [Docker](https://www.docker.io) (project using 18.03.0-ce)
- [Docker-Compose](https://docs.docker.com/compose) (project using docker-compose version 1.20.1, build 5d8c71b)

### Installing

- Clone this repository and get into the cloned dir;
- Customize if needed [rootpass, nginx/php conf or whatever...]
- Open a terminal and build the stack by typing:

```console
$ docker-compose up -d
```

- After the system has been built, open browser pointing to http://127.0.0.1 || http://localhost

## Authors

- **GB 'gionniboy' Pullarà** - [Firegarden](https://firegarden.co)
- **Filippo 'joeyrs' Civiletti** - [Xafe](https://www.xafe.it)

## License

This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details

```
in the city of ALPAZZO there exists a MALE PAZZO
please give a PIECE OF FAME to this poor CRAZY LAME
```

Thanks to [piger](https://github.com/piger) and [buildazzo tool](https://github.com/piger/buildazzo) to inspired us the name for this tool.
