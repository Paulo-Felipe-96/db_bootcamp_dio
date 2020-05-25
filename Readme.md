# PostgreSQL

Sejam bem-vindos!

Este repositório é sobre um projeto de Banco de dados PostgreSQL na versão 12 com uso do pgAdmin 4, contendo Scripts.sql de que constroem uma base de dados com o tema <b>Financeiro</b>.

Vale lembrar que este não é um projeto a nível profissional e sim de estudos!
---

## Instalação das ferramentas necessárias no Linux Mint Version

Linux é, para alguns, um sistema que causa queda de cabelos na hora de instalar certos programas, aqueles que funcionam nativamente sem uso do <b>Wine</b>. Então decidi trazer aqui algumas dicas importantes para auxiliar no processo e torná-lo menos doloroso!

O tutorial a seguir foi tirado da documentação original, apenas fiz a tradução e trouxe ajuda para muitos que ainda estão dando os primeiros passos com Linux ou mesmo já tem algum conhecimento, mas dificuldades para fazer estas instalações.

Espero ajudar!

### PostgreSQL 12

Importe a chave de assinatura do repositório a partir do terminal:
```
$ wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
```

Abra o "Software Sources" ou "Recursos de Software" e clique em "Repositórios Oficiais" e adicione o item com o link:
```
$ deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main
```

Ou crie o arquivo "pgdg.list" no caminho "/etc/apt/sources.list.d/" e adicione a linha (não esqueça de salvar rsrs):
```
$ deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main
```

Então execute o comando no terminal: 
```
$ sudo apt-get install postgresql-12
```

Se não funcionar na primeira tentativa, execute "$ sudo apt update" e em seguida repita "$ sudo apt-get install postgresql-12".

Link da documentação (aqui)[https://www.postgresql.org/docs/]

### pgAdmin 4

Pode parecer estranho, mas é necessário adicionar em "Repositórios Adicionais" o mesmo item de recurso adicionado na instalação do tópico PostgreSQL. Para mim foi problemático não fazê-lo!

Abra o "Software Sources" ou "Recursos de Software" e clique em "Reposisótios Adicionais" e adicione o item com o link:
```
$ deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main
```

Então, no terminal ainda aberto digite os comandos:
```
$ sudo apt update
$ sudo apt install pgadmin4
```

Pronto, pgAdmin 4 instalado com sucesso e facilmente!

Link da documentação (aqui)[https://www.pgadmin.org/docs/]

## Aventureiros de Windows (8+)

A instalção do PostgreSQL na plataforma Windows traz consigo o pgAdmin 4, mas se não trouxer
Siga a documentação oficial.

Lembrando: "next", "next", "next" e "finished".

PostgreSQL link da documentação (aqui)[https://www.postgresql.org/docs/]
pgAdmin 4 link da documentação (aqui)[https://www.pgadmin.org/docs/]

## 🚀  Tecnologias

SQL - Structured Query Language

## :books: Tópicos:

ER - Entidade de Relacionamento
DML - Data Manipulation Language, também conhecido como C.R.U.D. (Create, Read, Update and Delete)
DDL - Data Definition Language

----------

Paulo Felipe Magalhães Martins <br>
paulofelipe0896@gmail.com