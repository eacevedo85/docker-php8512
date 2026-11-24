# docker-php8512

// HACER COMMITs

```bash
   git status
   git add .
   git commit -m "INIT"
   git push
```

```bash
git init
git add .
git commit -m "Proyecto"
git branch -M main
git remote add origin git@github.com:eacevedo85/docker-php8512.git
git push -u origin main
```

// actualizar rama

```bash
git status
git pull
bun install
```

// Remoto

```bash
git clone git@github.com:eacevedo85/docker-php8512.git
bun install
npm install
```

instalar

docker compose up -d --build

docker ps

# Docker PHP 8.5.12 + Apache

Entorno de desarrollo local basado en Docker para ejecutar proyectos PHP utilizando **PHP 8.5.12 y Apache**.

La configuración está diseñada para compartir el mismo entorno de desarrollo entre diferentes equipos Mac, utilizando GitHub para versionar la configuración y Google Drive para compartir los proyectos PHP.

## Características

- PHP 8.5.12.
- Apache.
- Módulo `mod_rewrite` habilitado.
- Configuración `AllowOverride All` para soportar `.htaccess`.
- Extensiones PHP:
   - mysqli
   - pdo_mysql
   - intl
   - gd
   - zip
   - exif
- Montaje de proyectos locales mediante volúmenes Docker.
- Configuración independiente para cada computadora mediante `.env`.

## Estructura del proyecto

```text
docker-php8512/
├── Dockerfile
├── docker-compose.yml
├── .env.example
├── .env
├── .gitignore
└── README.md
```

> El archivo `.env` contiene la ruta local de los proyectos y no debe subirse a GitHub.

## Requisitos

Antes de comenzar, asegúrate de tener instalado:

- Docker Desktop.
- Git.
- Acceso al repositorio de GitHub.
- Google Drive para escritorio, si utilizas la carpeta compartida de proyectos.

Verificar Docker:

```bash
docker --version
docker compose version
```

## Instalación

### 1. Clonar el repositorio

Desde la terminal:

```bash
git clone git@github.com:TU_USUARIO/docker-php8512.git
```

Entrar en la carpeta:

```bash
cd docker-php8512
```

### 2. Crear archivo de configuración local

Copiar el archivo de ejemplo:

```bash
cp .env.example .env
```

Editar `.env` y establecer la ruta local de la carpeta `htdocs`:

```env
HTDOCS_PATH="/Users/TU_USUARIO/Mi unidad/htdocs"
```

**Importante:** cada computadora debe configurar su propia ruta local.

### 3. Construir e iniciar el contenedor

Ejecutar:

```bash
docker compose up -d --build
```

Docker descargará la imagen base de PHP, instalará las extensiones configuradas y levantará Apache.

### 4. Verificar el contenedor

```bash
docker ps
```

El contenedor deberá aparecer con el nombre:

```text
php85
```

## Acceso a los proyectos

El servidor Apache estará disponible en:

**http://localhost:8889**

Los proyectos ubicados dentro de `htdocs` estarán disponibles mediante sus respectivas rutas.

Por ejemplo:

```text
http://localhost:8889/nombramientos2
```

## Comandos Docker

| Acción               | Comando                        |
| -------------------- | ------------------------------ |
| Iniciar              | `docker compose up -d`         |
| Detener              | `docker compose down`          |
| Reiniciar            | `docker compose restart`       |
| Reconstruir          | `docker compose up -d --build` |
| Ver contenedores     | `docker ps`                    |
| Ver registros        | `docker compose logs -f`       |
| Entrar al contenedor | `docker exec -it php85 bash`   |

## Configuración PHP

La imagen utiliza como base:

```dockerfile
FROM php:8.5.12-apache
```

Las extensiones se instalan durante la construcción de la imagen.

Para consultar la versión de PHP:

```bash
docker exec php85 php -v
```

Para consultar las extensiones instaladas:

```bash
docker exec php85 php -m
```

## Trabajo entre diferentes equipos

La configuración está pensada para utilizarse en varias computadoras.

Ejemplo:

| Configuración        | MacBook Pro  | Mac mini     |
| -------------------- | ------------ | ------------ |
| PHP                  | 8.5.12       | 8.5.12       |
| Apache               | Sí           | Sí           |
| Puerto local         | 8889         | 8889         |
| Proyectos            | Google Drive | Google Drive |
| Configuración Docker | GitHub       | GitHub       |

Cada computadora mantiene su propio contenedor Docker, mientras que los proyectos se comparten mediante Google Drive.

Para actualizar la configuración en otra computadora:

```bash
git pull
docker compose up -d --build
```

## Consideraciones

- No subir el archivo `.env` a GitHub.
- No almacenar credenciales de bases de datos ni contraseñas en el repositorio.
- Esperar a que Google Drive termine de sincronizar antes de trabajar desde otra computadora.
- Evitar editar simultáneamente los mismos archivos desde ambos equipos.
- Si se modifica el Dockerfile, reconstruir el contenedor utilizando `docker compose up -d --build`.

---

**Entorno de desarrollo PHP 8.5.12**

Configuración centralizada en GitHub y proyectos compartidos mediante Google Drive.
