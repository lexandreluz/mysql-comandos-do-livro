# Guia Completo: Do Zero à Conexão com o Banco de Dados **comercial** no GitHub Codespaces

Este guia irá orientá-lo em todo o processo, incluindo a instalação das ferramentas, a configuração do servidor MySQL e a conexão final.

---

## **Fase 1: Preparação do Ambiente (Instalação das Extensões Essenciais)**

Para que o VS Code se conecte ao MySQL, precisamos de duas extensões que funcionam em conjunto. É obrigatório instalar **ambas**.

### 1. Instalar a Ferramenta Principal (SQLTools)
No seu Codespace, vá até a aba de Extensões (ícone de blocos na barra lateral).

- Procure por `SQLTools`.
- Instale a extensão principal, chamada **SQLTools**, do autor **Matheus Teixeira**.

**Função:** Esta é a interface gráfica, o "painel de controle" para gerenciar todas as suas conexões de banco de dados.

---

### 2. Instalar o Driver de Conexão MySQL
Na mesma lista de resultados da busca:

- Encontre e instale a extensão **SQLTools MySQL/MariaDB Driver**, do mesmo autor.

**Função:** Este é o *conector* específico que ensina o SQLTools a se comunicar com o seu servidor MySQL. Sem ele, a conexão falhará.

---

## **Fase 2: Instalação e Configuração do MySQL Server**

Agora vamos instalar o MySQL no terminal do seu Codespace.

### 1. Abra o Terminal
No menu do VS Code:
```
Terminal > Novo Terminal
```

---

### 2. Atualize a Lista de Pacotes
```bash
sudo apt-get update
```

---

### 3. Instale o Servidor e o Cliente MySQL
```bash
sudo apt-get install mysql-server mysql-client -y
```

---

### 4. Inicie o Serviço do MySQL
```bash
sudo service mysql start
```

---

### 5. Verifique se o MySQL está Rodando
```bash
sudo service mysql status
```
Você deve ver `active (running)` em verde.  
Pressione `q` para sair.

---

### 6. Configure uma Senha para o Usuário root

Acesse o MySQL como administrador:
```bash
sudo mysql
```

No prompt do MySQL:
```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'sua_senha_aqui';
FLUSH PRIVILEGES;
EXIT;
```
> Substitua `sua_senha_aqui` por uma senha de sua escolha, por exemplo: `cursomysql`.

---

## **Fase 3: Criação do Banco de Dados `comercial`**

### 1. Faça Login com sua Nova Senha
```bash
mysql -u root -p
```
Digite a senha criada anteriormente.

---

### 2. Crie o Banco de Dados
```sql
CREATE DATABASE comercial;
```

---

### 3. Confirme a Criação
```sql
SHOW DATABASES;
```
Você verá `comercial` na lista.

---

### 4. Saia do MySQL
```sql
EXIT;
```

---

## **Fase 4: Conexão Final com o SQLTools**

### 1. Abra o SQLTools
Clique no ícone do SQLTools na barra lateral.

---

### 2. Adicione uma Nova Conexão
- Clique em **Add New Connection**
- Escolha **MySQL**

---

### 3. Preencha os Campos de Configuração

| Campo                  | Valor                                          |
|------------------------|-----------------------------------------------|
| Connection Name        | Comercial (Codespaces)                        |
| Driver                 | MySQL                                         |
| Server Address / Host  | `127.0.0.1`                                    |
| Port                   | `3306`                                        |
| Database               | `comercial`                                   |
| Authentication Protocol| Default                                       |
| Username               | `root`                                        |
| Password               | senha criada na Fase 2                        |
| Use SSL                | Disabled                                      |

---

### 4. Teste e Salve
- Clique em **Test Connection**  
  → Mensagem esperada: `Successfully connected!`
- Clique em **Save Connection**

---

✅ **Parabéns!** Agora sua conexão aparecerá na lista do SQLTools.  
Você pode abrir um novo arquivo `.sql` e começar a executar seus comandos para criar tabelas e popular o banco de dados `comercial`.
