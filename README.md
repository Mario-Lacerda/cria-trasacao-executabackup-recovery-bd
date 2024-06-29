# Desafio Dio - Criando Transações, Executando Backup e Recovery de Banco de Dados



Neste projeto, vamos criar transações, executar backups e recuperar bancos de dados usando o MySQL.



### **Pré-requisitos**

- MySQL ou outro sistema de gerenciamento de banco de dados
- Conhecimento básico de SQL



### **Criando Transações**

As transações são usadas para garantir a integridade dos dados ao executar várias operações em um banco de dados. Vamos criar uma transação para transferir dinheiro de uma conta para outra:

sql



```sql
START TRANSACTION;

UPDATE contas SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas SET saldo = saldo + 100 WHERE id = 2;

COMMIT;
```



### **Executando Backups**

Os backups são usados para criar cópias de segurança do banco de dados. Vamos criar um backup do banco de dados usando o comando `mysqldump`:

plaintext



```plaintext
mysqldump -u usuario -p senha banco_de_dados > backup.sql
```

**Recuperando Bancos de Dados**

Os backups podem ser usados para recuperar bancos de dados em caso de falha. Vamos recuperar o banco de dados usando o comando `mysql`:

plaintext

![Done](chrome-extension://igpdmclhhlcpoindmhkhillbfhdgoegm/b3baca6de20012788f7d.svg)![Copy](chrome-extension://igpdmclhhlcpoindmhkhillbfhdgoegm/7120b68615ebe4b28075.svg)

```plaintext
mysql -u usuario -p senha banco_de_dados < backup.sql
```



**Criando Transações**

sql



```sql
-- Iniciar uma transação
START TRANSACTION;

-- Executar operações dentro da transação
UPDATE contas SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas SET saldo = saldo + 100 WHERE id = 2;

-- Verificar se as operações foram bem-sucedidas
SELECT * FROM contas;

-- Confirmar a transação se as operações forem bem-sucedidas
COMMIT;

-- Caso contrário, desfazer a transação
ROLLBACK;
```



**Executando Backups**



```plaintext
-- Criar um backup do banco de dados usando mysqldump
mysqldump -u usuario -p senha banco_de_dados > backup.sql
```



### **Recuperando Bancos de Dados**

plaintext



```plaintext
-- Recuperar o banco de dados usando mysql
mysql -u usuario -p senha banco_de_dados < backup.sql
```



### **Exemplo de Uso**

plaintext



```plaintext
-- Iniciar uma transação para transferir dinheiro de uma conta para outra
START TRANSACTION;

-- Atualizar o saldo das contas
UPDATE contas SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas SET saldo = saldo + 100 WHERE id = 2;

-- Verificar se a transferência foi bem-sucedida
SELECT * FROM contas;

-- Confirmar a transação se a transferência foi bem-sucedida
COMMIT;
```



### **Conclusão**

Neste projeto, criamos um exemplo mais completo com código para criar transações, executar backups e recuperar bancos de dados usando o MySQL. Isso garantiu a integridade dos dados e a capacidade de recuperar o banco de dados em caso de falha. Você pode personalizar ainda mais o banco de dados para atender às suas necessidades específicas.

