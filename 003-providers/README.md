# Providers

No momento, quando criamos as máquinas virtuais, não chegamos a definir nenhuma configuração delas, somente a rede.

Por padrão, o Vagrant faz uma alocação automática de memória e cpu, e nome da máquina.

Na VM do Ubuntu, que foi a que utilizamos em todos os laboratórios desse tutorial, o Vagrant definiu essas configurações:

- 1 cpu

- 1024 MB (1 GB) de RAM

Na medida em que vamos criando mais e mais máquinas, torna-se necessário definir claramente a quantidade de recursos que serão dedicados às máquinas.

Por exemplo, uma VM que irá hospedar um banco de dados MySQL precisa de mais RAM do que uma VM que irá hospedar um servidor nginx.

Para isso, temos justamente a definição de providers, de provedores, do Vagrant.

## Nome da VM

Você pode customizar o nome que aparece na interface gráfica do VirtualBox ao configurar a propriedade `name`. Por padrão, Vagrant configura o nome baseando-se na pasta que contém o Vagrantfile mais o registro do momento em que a máquina foi criada. Ao configurar outro nome, sua VM pode ser mais facilmente identificada.

```Ruby
Vagrant.configure("2") do |config|

# ... Outras configurações

config.vm.provider "virtualbox" do |v|
  v.name = "minha_vm"
end

end
```

## Configurando memória e cpu

Uma configuração bem relevante, e que você vai mais utilizar no seu dia-a-dia, é a de memória e cpu:

```Ruby
Vagrant.configure("2") do |config|

# ... Outras configurações

config.vm.provider "virtualbox" do |v|
  v.name = "minha_vm"
  v.memory = 1024
  v.cpu = 1
end

end
```

Resumindo, nome, memória e cpu são os três principais parâmetros que você precisa definir para uma máquina.

#### Documentação

[Configuration - VirtualBox Provider | Vagrant by HashiCorp](https://www.vagrantup.com/docs/providers/virtualbox/configuration)
