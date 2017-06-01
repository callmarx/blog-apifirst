## Blog em RESTful JSON API

OBS: Isso é apenas uma desculpa para eu estudar e treinar o conceito de API-First

### Configurações
Versão ruby: >= 2.4
```console
$ ruby -v
ruby 2.4.0p0 (2016-12-24 revision 57164) [x86_64-linux]
```

Versão Rails: >= 5.0

```console
$ rails -v
Rails 5.0.2
```
Clone o projeto e dentro da pasta execute:
```console
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

Agora basta utilizar o servidor teste do Rails :
```console
$ rails s
=> Booting Puma
=> Rails 5.0.2 application starting in development on http://localhost:3000
=> Run `rails server -h` for more startup options
Puma starting in single mode...
* Version 3.8.2 (ruby 2.4.0-p0), codename: Sassy Salamander
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://localhost:3000
```
### API
Para login do usuário teste faça a seguinte requisição POST
```console
http://localhost:3000/api/auth/sign_in
Headers
email: usertesta@test.com
password: testtest
```
Para login do administrador teste faça a seguinte requisição POST
```console
http://localhost:3000/api/admin_auth/sign_in
Headers
email: admintest@test.com
password: adminadmin
```
Utilize os Headers obtidos no login para as requisições de posts:
```console
"access-token": "wwwww",
"token-type":   "Bearer",
"client":       "xxxxx",
"expiry":       "yyyyy",
"uid":          "zzzzz"
```
