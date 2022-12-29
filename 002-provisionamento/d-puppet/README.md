# Provisioning - Puppet

Outra forma de provisionar VMs é através do Puppet.

O Puppet é uma ferramenta de provisionamento, assim o Chef e o Ansible, que funciona com uma receita também, onde você consegue provisionar uma infraestrutura toda através de código.

O Puppet tem várias formas de utilização: você pode ter um puppet server e um puppet agent, ou seja um servidor e um cliente, para poder gerenciar um ambiente; você pode utilizar apenas o Puppet Apply, ou seja, apenas um agente do Puppet na máquina onde você quer provisionar para poder instalar automaticamente todos os pacotes que você quer, que é o que vamos fazer nesse tutorial.

Nesse tutorial teremos três serviços, três ferramentas: O Vagrant, o Virtualbox e o Puppet.

- Virtualbox: Onde a máquina será criada.

- Vagrant: É quem vai fazer a criação da máquina virtual.

- Puppet: É quem vai instalar os pacotes e os programas necessários nessa máquina virtual.

A pasta manifests precisa existir, pois será onde estarão localizados os arquivos de código que serão executados pelo Puppet. No caso desse tutorial, estamos criando apenas uma máquina virtual, mas se fossemos criar 2, 3, 4, seria interessante criar um arquivo de manifesto para cada uma delas para que haja mais organização e fique melhor de trabalhar.

O manifesto é uma receita do Puppet, o arquivo que o Puppet vai ler quando a máquina virtual for iniciada.

#### Documentação

[Documentação do Puppet](https://www.puppet.com/docs/puppet/7/type.html#package-description)

[Puppet Apply - Provisioning | Vagrant | HashiCorp Developer](https://developer.hashicorp.com/vagrant/docs/provisioning/puppet_apply)
