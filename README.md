## Sistema para Livraria

- Cadastro de Livros
- Cadastro de Editoras
- Cadastro de Clientes
- Cadsatro de Usuários
- Vendas

## Recursos Utilizados

- Laravel 7.0
- Voyager 1.1
- MySQL 5.7
- Bootstrap 4.4
- Vue.Js 2.6

## Instalação em ambiente LAMP

- Acessar diretório onde será clonado o projeto do Git
- Rodar comando: git clone
- Acessar diretório raiz do projeto
- Rodar comando: composer install
- Rodar comando: sudo cp .env.example .env
- Informar no arquivo .env as credenciais de acesso à Base de Dados
- Rodar comando: php artisan config:cache
- Rodar comando: php artisan migrate
- Rodar comando: php artisan passport:install
- Rodar comando: php artisan passport:keys
- Rodar comando: php artisan voyager:install
- Rodar comando: php artisan voyager:admin your@email.com --create 
- Rodar comando: npm install && npm run dev
- Rodar na BD o SQL localizado no arquivo doc/inserts.php
- Rodar comando: php artisan config:cache
- Rodar comando: php artisan serve
- Acessar http:://localhost:8000
