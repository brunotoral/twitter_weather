# Twitter Weather

<p align="center">
  <a href="https://www.ruby-lang.org/en/">
    <img src="https://img.shields.io/badge/Ruby-v3.0.0-green.svg" alt="ruby version">
  </a>
  <a href="http://rubyonrails.org/">
    <img src="https://img.shields.io/badge/Rails-v6.1.4.4-brightgreen.svg" alt="rails version">
  </a>
</p>

*Twitter Weather* é uma API de integração entre o[OpenWeathere](https://openweathermap.org/) e o [Twitter](https://twitter.com/) .  A integração com o OpenWeather é feita com a gem BeautyWeather que, por sua vez, é uma gem privativa e exclusiva do projeto.

## Experimente a aplicação

#### Fluxo da aplicação
A aplicação funciona de forma assíncrona, agendando o envio do tweet.

### POST api/v1/tweets
O endpoint aceita a seguinte estrutura:
```json
{
  "twitter": {
  "user": "string",
  "token": "string"
  },
  "city_id": "string"
}
```
Caso a estrutura esteja errada retornará  status  **402**:
```json

{
  "error": {
    "message": "Unprocessable"
  }
}
```
Caso a estrutura esteja correta, um worker será executado e retornará status **201**:
```json
{
  "message": "Success! Tweet scheduled."
}
```

## Começando

### Codebase

*Twitter Weather* é construido em Ruby on Rails.

### Pré-requisitos

- [Git](https://git-scm.com)
- [Docker](http://docker.com/): no mac, nós recomendamos utilizar o [Docker for Mac](https://docs.docker.com/docker-for-mac/)
- [docker-compose](https://docs.docker.com/compose/install/)

### Instalação

1. Tenha certeza de ter todos os pré-requisitos instalados.
1. Clone o repositório `git clone git@github.com:brunotoral/twitter_weather.git`
1. Construa o container de desenvolvimento `docker-compose build`. isso irá criar uma imagem
docker nomeada de `twitter_weather-dev`com todas as ferramentas requeridas.
1. Instale as dependência node com `docker-compose run runner yarn install`
1. Faça o setup do projeto com `docker-compose run runner bin/setup`
1. Inicie o servidor de desenvolvimento `docker-compose run rails`

Tudo pronto! Bom desenvolvimento! :tada:

### Rodando o APP

Você por rodar o servidor Rails usando o comando a seguir:

```sh
$ docker-compose up rails
```

Isso deixará a aplicação disponível em `localhost:3000`.

No caso de precisar rodar o servidor Webpack Dev, use o comando a seguir:

```sh
$ docker-compose up rails webpacker
```

### Rodando Rake Tasks

Você pode rodar qualquer Rake tasks, como `db:migrate`, usando o comando a seguir:

```sh
$ docker-compose run runner be rails <rake-task>
```
