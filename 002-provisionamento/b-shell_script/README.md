# Provisioning - Shell Script

O provisionador shell também pode utilizar uma opção de especificar um caminho a um shell script na máquina host. O Vagrant irá então enviar esse script ao guest e irá executá-lo. Um exemplo:

```Ruby
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.provision "shell", path: "script.sh"
end
```

Não é muito recomendado provisionar com o shell da maneira que vimos anteriormente, usando o comando `inline`, pois dependendo do que você deseja fazer no provisionamento da máquina, pode ser que a linha fique muito grande, poluindo o Vagrantfile.

Provisionando através de um shell script externo deixa o Vagrantfile mais limpo, pois assim não é necessário especificar cada instrução do provisionamento dentro do Vagrantfile, tudo ficará dentro do arquivo do script, o que também resulta na possibilidade de executar mais comandos no provisionamento sem sacrificar a clareza do código do Vagrantfile.

Ao executar `vagrant up`, o Vagrant irá procurar pelo script na pasta em que se encontra o Vagrantfile do projeto que você está criando.

# Provisionador de Arquivo

O provisionador de arquivo do Vagrant permite que você envie um arquivo ou diretório da máquina host para a máquina guest.

Provisionamento de arquivo é simples de se fazer, por exemplo, replique seu arquivo ~/.gitconfig local para o diretório home do usuário vagrant na máquina guest para que você não tenha que executar `git config --global` sempre que provisionar uma nova máquina virtual.

```Ruby
Vagrant.configure("2") do |config|
  # ... outras configurações
  
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
end
```

O detalhe é que se for necessária a permissão de root, por exemplo, uma pasta de destino de acesso restrito ao root, não será possível fazer o provisionamento, pois o usuário vagrant não tem permissão de acessar tal pasta. Você consegue copiar arquivos para a pasta do usuário vagrant, por exemplo, ou qualquer outra pasta que não exija permissões de usuário root.

# Pastas sincronizadas

Pastas sincronizadas são configuradas dentro do seu Vagrantfile usando o método `config.vm.synced_folder`. Uso da diretiva de configuração é muito simples:

```Ruby
Vagrant.configure("2") do |config|
  # ... Outras configurações aqui

  config.vm.synced_folder "fonte/", "/srv/website"
end
```

### Diferença entre o provisionador de arquivos e pastas sincronizadas

O provisionador de arquivos copia um arquivo da sua máquina host para a máquina guest, já a funcionalidade de pastas sincronizadas permite o compartilhamento de pastas entre a máquina física e a máquina virtual.

#### Documentação

[Shell Scripts - Provisioning | Vagrant by HashiCorp](https://www.vagrantup.com/docs/provisioning/shell)

[File Uploads - Provisioning | Vagrant by HashiCorp](https://developer.hashicorp.com/vagrant/docs/provisioning/file)

[Basic Usage - Synced Folders | Vagrant by HashiCorp](https://developer.hashicorp.com/vagrant/docs/synced-folders/basic_usage)
