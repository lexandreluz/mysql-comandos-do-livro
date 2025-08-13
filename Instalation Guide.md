# Guia Completo: Do Zero à Conexão com o Banco de Dados `comercial` no GitHub Codespaces

Este guia irá orientá-lo em todo o processo, incluindo a instalação das ferramentas, a configuração do servidor MySQL e a conexão final.

## Fase 1: Preparação do Ambiente (Instalação das Extensões Essenciais)

Para que o VS Code se conecte ao MySQL, precisamos de duas extensões que funcionam em conjunto. É **obrigatório instalar ambas**.

### 1. Instalar a Ferramenta Principal (SQLTools)
* No seu Codespace, vá até a aba de **Extensões** (ícone de blocos na barra lateral).
* Procure por `SQLTools`.
* Instale a extensão principal, chamada **SQLTools**, do autor **Matheus Teixeira**.
* **Função:** Esta é a interface gráfica, o "painel de controle" para gerenciar todas as suas conexões de banco de dados.

### 2. Instalar o Driver de Conexão MySQL
* Na mesma lista de resultados da busca, encontre e instale a extensão **SQLTools MySQL/MariaDB Driver**, do mesmo autor.
* **Função:** Este é o "conector" específico que ensina o `SQLTools` a se comunicar com o seu servidor MySQL. Sem ele, a conexão falhará.

## Fase 2: Instalação e Configuração do MySQL Server

Agora vamos instalar o MySQL no terminal do seu Codespace.

### 1. Abra o Terminal
* Se não estiver aberto, vá ao menu `Terminal > Novo Terminal`.

### 2. Atualize a Lista de Pacotes
* É uma boa prática para garantir que você está baixando as versões mais recentes.
    ```bash
    sudo apt-get update
    ```

### 3. Instale o Servidor e o Cliente MySQL
* Este comando instala tudo o que é necessário. O `-y` aceita a instalação automaticamente.
    ```bash
    sudo apt-get install mysql-server mysql-client -y
    ```

### 4. Inicie o Serviço do MySQL
* A instalação nem sempre inicia o servidor, então faremos isso manualmente.
    ```bash
    sudo service mysql start
    ```

### 5. Verifique se o MySQL está Rodando
* Execute o comando abaixo para confirmar o status do serviço.
    ```bash
    sudo service mysql status
    ```
    *Você deve ver uma mensagem com o texto `active (running)` em verde. Pressione `q` para sair da tela de status.*

### 6. Configure uma Senha para o Usuário `root`
* Precisamos definir uma senha para que ferramentas externas (como o `SQLTools`) possam se conectar.
* Primeiro, acesse o MySQL com privilégios de administrador:
    ```bash
    sudo mysql
    ```
* Agora, dentro do prompt `mysql>`, execute o comando abaixo. **Substitua `sua_senha_aqui` por uma senha de sua escolha** (ex: `cursomysql`). Lembre-se desta senha!
    ```sql
    ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'sua_senha_aqui';
    ```
* Aplique as alterações:
    ```sql
    FLUSH PRIVILEGES;
    ```
* Saia do MySQL:
    ```sql
    EXIT;
    ```

## Fase 3: Criação do Banco de Dados `comercial`

Com o servidor configurado, vamos criar o banco de dados do seu projeto.

### 1. Faça Login com sua Nova Senha
* Desta vez, acesse sem `sudo`. O MySQL irá pedir a senha que você acabou de criar.
    ```bash
    mysql -u root -p
    ```
    *Digite a senha que você definiu e pressione Enter.*

### 2. Crie o Banco de Dados
* Dentro do prompt `mysql>`, execute:
    ```sql
    CREATE DATABASE comercial;
    ```

### 3. Confirme a Criação
* Verifique se o banco de dados aparece na lista.
    ```sql
    SHOW DATABASES;
    ```
    *Você verá `comercial` na lista.*

### 4. Saia do MySQL
```sql
EXIT;

Fase 4: Conexão Final com o SQLTools
Agora a parte final! Vamos usar as informações que configuramos para conectar a ferramenta.

1. Abra o SQLTools
Clique no ícone do SQLTools na barra lateral.

2. Adicione uma Nova Conexão
Clique em "Add New Connection" e escolha "MySQL".

3. Preencha os Campos de Configuração
Connection Name: Comercial (Codespaces) (Um nome para você identificar a conexão).

Driver: MySQL.

Server Address / Host: 127.0.0.1 (Use este em vez de localhost para garantir uma conexão via TCP/IP, que é mais estável no Codespaces).

Port: 3306 (Porta padrão).

Database: comercial.

Authentication Protocol: Default.

Username: root.

Password: Digite a senha que você criou na Fase 2.

Use SSL: Disabled.

4. Teste e Salve
Clique em Test Connection. Você deve receber a mensagem de sucesso "Successfully connected!".

Clique em Save Connection.

Parabéns! A sua conexão aparecerá na lista do SQLTools. Agora você pode clicar nela para se conectar, abrir um novo arquivo .sql e começar a executar seus comandos para criar tabelas e popular seu banco de dados comercial.