# Runecairn-Compendium

A local website compiling every monster and items for the runecairn ttrpg.

This only the front-end, the rest is locally ran in a dockerstack

## Technologies

Developed using Sveltekit as a front-end, directus as CMS, and using a postgres database.

## Running 
This project is auto-built as a package hosted on github (a docker image) wich can be started and linked to any port on the computer, starting a website on the localhost. The following command can be used:

```bash
docker --pull=always  -p 3000:3000 ghcr.io/dracoanguis/runecairn-compendium:main
```
