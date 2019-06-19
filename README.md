# Gympass test
CI [GitLab](https://gitlab.com/joaovitoras/gympass/pipelines)

## Iniciando

### Clone o repositório

```shell
git clone git@github.com:joaovitoras/gympass.git
cd gympass
```
### Instalando dependencias

Usando ruby >= 2.5 com [Bundler](https://github.com/bundler/bundler)

```shell
bin/bundle install
```

## Executando

```shell
bin/run [Path-do-arquivo]

# para executar o input recebido como exemplo no teste
bin/run bin/input.txt
```

## Testes
Usando [Rspec](https://github.com/rspec/rspec)

```shell
bin/rspec
```
