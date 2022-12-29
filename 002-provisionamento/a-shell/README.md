# Provisioning - Shell

Até agora, configuramos máquinas virtuais no Vagrantfile, mas não instalamos automaticamente um software ao criarmos a máquina. O que fizemos foi instalar a máquina através de código e instalamos o nginx manualmente para fazer testes de rede.

Agora aprenderemos como instalar o NGINX automaticamente no processo de criação da máquina virtual, através do provisionador, não havendo mais a necessidade de acessar a máquina para subir uma aplicação.

A ideia é criar uma máquina virtual com uma aplicação: Eu tenho um arquivo e seu lhe enviar esse arquivo, você conseguirá subir a aplicação com as mesmas configurações que eu.

Existem vários provisionadores, alguns que podemos citar é o Shell, Ansible, Chef, Docker e Puppet.

## Inline Scripts

A forma mais fácil de iniciar com provisionamento no Vagrant com um inline script, um script que é dado ao Vagrant diretamente dentro do Vagrantfile.

Exemplo:

```Ruby
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.network "forwarded_port", guest: 80, host: 8090
  config.vm.provision "shell",
    inline: "apt update && apt install -y nginx && service nginx start"
end
```

Você pode executar qualquer comando, como um `apt update`, `apt install nginx`.

Caso você tenha feito uma alteração no provisionamento e já tem a máquina criada, execute o comando:

`vagrant provision`

Esse comando irá carregar e executar apenas a parte de provisionamento do Vagrantfile.

#### Documentação

[Shell Scripts - Provisioning | Vagrant by HashiCorp](https://www.vagrantup.com/docs/provisioning/shell)
