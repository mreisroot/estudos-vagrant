# Primeiros comandos do Vagrant

`vagrant init hashicorp/bionic64`

Gera o Vagrantfile da box hashicorp/bionic64, uma máquina virtual do Ubuntu, na versão 18.04.

`vagrant up`

Leitura do Vagrantfile pelo Vagrant, que vai resultar na criação da máquina virtual, de acordo com a configuração definida.

O Vagrant irá baixar a imagem do Sistema Operacional caso não seja encontrada na máquina local, e irá configurar de acordo com o que foi definido no Vagrantfile. Caso a imagem já tenha sido baixada, o Vagrant irá direto à configuração da máquina, agilizando o processo.

Ou seja, caso tenha sido a primeira vez que você criou uma máquina virtual de um sistema, o processo de criação da máquina virtual vai demorar um pouco mais por conta do download da imagem. Já nas próximas vezes em que criar uma máquina com a imagem já baixada, o processo será mais rápido.

`vagrant ssh`

Acesso à máquina via SSH (Secure Shell).

`vagrant destroy`

Força o encerramento da máquina virtual caso ela esteja em execução e apaga ela por completo. Se você abrir uma janela do Virtualbox, irá perceber que a máquina não será mais listada pelo programa.

`vagrant reload`

Reinicia a máquina virtual.

### Nota

Durante este tutorial, utilizaremos a box "hashicorp/bionic64". Logo, utilize os comandos do gerenciador de pacotes apt para gerenciar software.

#### Documentação

[Downloads | Vagrant by HashiCorp](https://www.vagrantup.com/downloads)

[Installing Vagrant](https://www.vagrantup.com/docs/installation)

[Discover Vagrant Boxes - Vagrant Cloud](https://app.vagrantup.com/boxes/search)

# Network: Forwarded Ports

Todas as redes são configuradas dentro de seu **Vagrantfile** usando a chamada do método `config.vm.network`. Por exemplo, o Vagrantfile abaixo define um encaminhamento de porta.

```Ruby
Vagrant.configure("2") do |config|
  # ...
  config.vm.network "forwarded_port", guest: 80, host: 8080
end
```

Um exemplo de uso de tal configuração é: se eu tenho um NGINX, um servidor web, rodando na máquina virtual, na porta 80, se eu digitar localhost na porta 80 da minha máquina, ele não irá acessar essa máquina virtual. Mas, se eu colocar a configuração de "forwarded\_port", com guest na porta 80, e host na porta 8080, o servidor irá funcionar.

Instalemos o nginx na máquina virtual Ubuntu com:

`sudo apt install -y nginx`

#### Documentação

[Networking](https://www.vagrantup.com/docs/networking)

[Forwarded Ports](https://www.vagrantup.com/docs/networking/forwarded_ports)

# Network: Public Networks

O Vagrant pode configurar uma máquina para poder ser acessada por qualquer dispositivo de uma rede, através da configuração "public\_network", que vai permitir que a máquina virtual utilize a placa de rede do host, fazendo a ponte dessa interface, e receba o mesmo endereço IP, podendo se comunicar com outros dispositivos.

O Vagrantfile abaixo define a rede como sendo pública:

```Ruby
Vagrant.configure("2") do |config|
  # ...
  config.vm.network "public_network"
end
```

Como nesse arquivo houve simplesmente a definição da rede da máquina como sendo pública, o Vagrant irá exibir uma mensagem perguntando qual interface de rede será usada como ponte.

Dica: Quando for escolher uma interface como ponte, escolha uma que está sendo usada para conectar o host à internet. Por exemplo, se você está usando Wi-Fi para se conectar à internet, escolha a interface de rede wireless. No caso da minha máquina, escolherei a interface wlan0.

Para descobrir o IP da ponte de rede do guest, execute o comando `ip a` nela e procure pelo IP que tem os mesmos três números do IP da interface de rede do host que foi definida como ponte.

Por exemplo:

192.168.30.11 - IP da interface wireless do host

192.168.30.12 - IP da ponte de rede da máquina virtual

Se você tiver o serviço do NGINX instalado na máquina virtual, e digitar o IP da ponte de rede num navegador, verá a página de boas vindas ao NGINX, a página servida por padrão por esse serviço web.

Qualquer dispositivo em sua rede que tentar acessar a máquina virtual ou a página servida pelo nginx instalado nela conseguirá fazê-lo com êxito.

## IP estático

Você pode manualmente definir um ip para a interface de ponte:

```Ruby
Vagrant.configure("2") do |config|
  # ...
  config.vm.network "public_network", ip: "192.168.30.72"
end
```

Reinicie a máquina Vagrant com `vagrant reload`, e teste a configuração digitando o IP definido num navegador. Caso apareça a página do nginx (se o tiver instalado na máquina virtual, claro), quer dizer que funcionou.

## Definindo ponte no Vagrantfile

É possível definir uma placa de rede para a ponte no Vagrantfile, fazendo com que o Vagrant não pergunte mais qual placa de rede deseja escolher como ponte.

Essa configuração é boa caso queira subir rapidamente ambientes de teste em sua máquina local, mas não é muito interessante em termos de portabilidade, pois, caso compartilhe o Vagrantfile com outras pessoas, podem haver erros na execução do Vagrant por conta de nomes de placa de rede diferentes.

Exemplo:

```Ruby
Vagrant.configure("2") do |config|
  # ... Outras configurações
  config.vm.network "public_network", ip: "192.168.30.72", bridge: "wlan0" 
end
```

Por favor, adapte o nome da placa de rede, senão terá erros. Você deve procurar pelo nome da sua placa de rede, seja no Linux ou no Windows.

## Diferença entre "public\_network" e "forwarded\_port"

O "public\_network" está utilizando uma placa de rede, com isso ganhando acesso ao IP da sua rede.

O "forwarded\_port" está somente criando um encaminhamento de portas. Logo, o acesso à máquina será através de portas de rede, e não por IP.

No Vagrantfile abaixo, haverá tanto acesso por IP quanto por porta:

```Ruby
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.network "forwarded_port", guest: 80, host: 8090
  config.vm.network "public_network"
end
```

#### Documentação

[Public Networks - Networking | Vagrant by HashiCorp](https://www.vagrantup.com/docs/networking/public_network)
