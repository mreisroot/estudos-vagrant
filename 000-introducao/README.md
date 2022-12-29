# Introdução ao Vagrant

### O que é Vagrant?

Vagrant é uma ferramenta de automação no provisionamento de máquinas virtuais, com todo o ambiente necessário para sua aplicação funcionar.

- Facilita a criação de máquinas virtuais, sem a necessidade de realizar download de iso e instalar o sistema operacional.

- Muito utilizado para criar ambientes de testes.

- Pode ser utilizado para gerenciar suas máquinas virtuais no ambiente de produção.

- Utiliza o conceito de IaC (Infrastructure as Code, Infraestrutura como Código), paradigma na área de operações de TI que trata os recursos computacionais de uma infraestrutura como um software que pode ser escrito e versionado, facilitando a documentação e padronização do ambiente de produção, para a criação de máquinas virtuais.

### Conceitos

- Tem suporte para VirtualBox, Hyper-V, VMWare. (Requisitos)

- Controla o Hypervisor a partir de um arquivo, o Vagrantfile, que contém toda a configuração da máquina virtual.

- O Vagrantfile define a configuração da máquina, como box, memória, cpu, disco, rede, etc.

### Vagrantfile

É o arquivo de configuração do Vagrant, para o seu projeto. Nele definimos como a máquina será criada, como a quantidade de memória, cpu, rede, sistema operacional, etc. Basicamente tudo o que você faz pela interface gráfica no hypervisor (software de virtualização), você pode configurar no Vagrantfile.

O Vagrantfile é escrito em Ruby, mas o conhecimento da linguagem de programação Ruby não é necessário para fazer modificações, já que é basicamente uma simples atribuição de variáveis.

### Boxes

Uma box é um sistema operacional que deve ser definido no início do seu projeto Vagrant. O Vagrant faz o download da imagem do sistema que você definiu e aplica na máquina virtual.

### Algumas definições

- VM: Virtual Machine (Máquina Virtual).

- Host: Hospedeiro, a máquina física, que hospeda as VMs.

- Guest: Convidado, uma máquina virtual que é hospedada pelo host.

#### Documentação

[Vagrant by HashiCorp](https://www.vagrantup.com/)

[Documentation | Vagrant by HashiCorp](https://www.vagrantup.com/docs)
