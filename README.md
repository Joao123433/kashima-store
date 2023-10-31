# Aplicação Rails 7 com SQLite3 

## Projeto feito para praticar os conceitos basicos do desenvolvimento web

Este projeto é feito em Rails 7 e utilizando o banco de dados SQLite3 para armazenar os dados.

## Acesse o Projeto em

https://kashima-store.fly.dev

## Pré-requisitos caso deseja fazer um form
Certifique-se de ter as seguintes ferramentas instaladas em sua máquina:

- Ruby (versão 3.2.2 recomendada)
- Rails (versão 7.0.8 recomendada)
- SQLite3

Recomendo o uso do [ASDF](https://asdf-vm.com/) para gerenciar versões do Ruby.

## Configuração do Ambiente

1. Clone este repositório:
   ```bash
   git clone https://github.com/Joao123433/kashima-store
   cd kashima-store 

2. Instale as Dependências
    ```bash
    gem install bundler
    bundle
    yarn install

3. Crie e Migre o Banco de Dados
    ```bash
    rails db:create
    rails db:migrate

4. Inicie o Servidor
    ```bash
    rails s

# Acesse a aplicação em http://localhost:3000.
