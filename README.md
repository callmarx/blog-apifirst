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
### POSTMAN
Alguns exemplos baseados nos dados testes em db/seeds.rb, utilizando a ferramenta [Postman](https://www.getpostman.com/)

#### Posts index (não requer autenticação)
Requisição:
```HTTP
GET /api/posts HTTP/1.1
Host: localhost:3000
Cache-Control: no-cache
Postman-Token: fff50f00-a54d-de30-4b02-cc882bd8d909
```
Retorno:
```HTTP
                  Status 200 Ok
Cache-Control:max-age=0, private, must-revalidate
Content-Type →application/json; charset=utf-8
ETag:W/"3ee32e76d08cdeff0a712453a379e345"
Transfer-Encoding:chunked
X-Request-Id:c474cc46-7828-4cbc-875f-52acdfee59d5
X-Runtime:0.048228
```
```JSON
{
    "posts": [
        {
            "id": 1,
            "title": "Primeiro Post do João",
            "body": "não muito de escrever, mas preciso por algo aki :)",
            "user": {
                "id": 1,
                "provider": "email",
                "uid": "usertest@test.com",
                "name": "test of test",
                "nickname": "test",
                "image": null,
                "email": "usertest@test.com",
                "created_at": "2017-06-01T21:53:34.411Z",
                "updated_at": "2017-06-02T13:30:15.940Z"
            }
        },
        {
            "id": 2,
            "title": "Segundo Post do Joda",
            "body": "Joda é meu apelido, pois o desenvolvedor desta aplicação tem muita criatividade, fala serio.",
            "user": {
                "id": 1,
                "provider": "email",
                "uid": "usertest@test.com",
                "name": "test of test",
                "nickname": "test",
                "image": null,
                "email": "usertest@test.com",
                "created_at": "2017-06-01T21:53:34.411Z",
                "updated_at": "2017-06-02T13:30:15.940Z"
            }
        },
        {
            "id": 3,
            "title": "Não confunda!",
            "body": "Sou maria e não marina. Este post SOMENTE pode ser apagado e editado pela Maria.",
            "user": {
                "id": 2,
                "provider": "email",
                "uid": "mariasilva@test.com",
                "name": "Maria Silva",
                "nickname": "Mia",
                "image": null,
                "email": "mariasilva@test.com",
                "created_at": "2017-06-01T21:53:34.598Z",
                "updated_at": "2017-06-01T21:53:34.598Z"
            }
        }
    ]
}
```
#### Post show (não requer autenticação)
Requisição:
```HTTP
GET /api/posts/1 HTTP/1.1
Host: localhost:3000
Cache-Control: no-cache
Postman-Token: 6a0e9d64-9ed6-401d-c55d-65eae297f016
```
Retorno:
```HTTP
                  Status 200 Ok
Cache-Control:max-age=0, private, must-revalidate
Content-Type:application/json; charset=utf-8
ETag:W/"bc6be4c478f9137d4bd0947a9388889f"
Transfer-Encoding:chunked
X-Request-Id:8fffdbae-b7e6-4827-a7e1-b3d27bd7dd24
X-Runtime:0.043745
```
```JSON
{
  "id": 1,
  "title": "Primeiro Post do João",
  "body": "não muito de escrever, mas preciso por algo aki :)",
  "created_at": "2017-06-01T21:53:34.530Z",
  "updated_at": "2017-06-01T21:53:34.530Z",
  "user": {
    "id": 1,
    "provider": "email",
    "uid": "usertest@test.com",
    "name": "test of test",
    "nickname": "test",
    "image": null,
    "email": "usertest@test.com",
    "created_at": "2017-06-01T21:53:34.411Z",
    "updated_at": "2017-06-02T14:19:09.946Z"
  }
}
```
#### Login de usuário
Requisição:
```HTTP
POST /api/auth/sign_in HTTP/1.1
Host: localhost:3000
email: usertest@test.com
password: testtest
Cache-Control: no-cache
Postman-Token: 2ad3454d-db69-1d98-b857-ea78b4abfccd
Content-Type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW
```
Retorno:
```HTTP
                  Status 200 Ok
Cache-Control:max-age=0, private, must-revalidate
Content-Type:application/json; charset=utf-8
ETag:W/"bb688df12103b7f2901fca67191bbf91"
Transfer-Encoding:chunked
X-Request-Id:a73e51a1-49a9-4f87-9f15-2bcd0a92ee27
X-Runtime:0.250260
access-token:KiXv8plaoLwMKcF2_91-EA
client:JRBy5zeXN0mVmsElSFBu2A
expiry:1497621339
token-type:Bearer
uid:usertest@test.com
```
```JSON
{
  "data": {
    "id": 1,
    "email": "usertest@test.com",
    "provider": "email",
    "uid": "usertest@test.com",
    "name": "test of test",
    "nickname": "test",
    "image": null
  }
}
```
#### Criando um post (requer autenticação)
Requisição (com os mesmos headers do login acima):
```HTTP
POST /api/posts HTTP/1.1
Host: localhost:3000
access-token: KiXv8plaoLwMKcF2_91-EA
client: JRBy5zeXN0mVmsElSFBu2A
expiry: 1497621339
token-type: Bearer
uid: usertest@test.com
Content-Type: application/json
Cache-Control: no-cache
Postman-Token: 9b384081-0d1f-375a-33e1-c95e78698e44

{
	"title" : "Outro Post criado",
	"body" : "esse foi feito pelo postman"
}
```
Retorno:
```HTTP
                  Status 200 Ok
Cache-Control:max-age=0, private, must-revalidate
Content-Type:application/json; charset=utf-8
ETag:W/"17977f1aaa4bb341abbe20e6beec2610"
Location:http://localhost:3000/api/posts/5
Transfer-Encoding:chunked
X-Request-Id:0d1ce2a5-89ac-4a62-88d5-0a4ee8246366
X-Runtime:0.205116
access-token:UUukItVpsZc6J5Tfo5UAUw
client:JRBy5zeXN0mVmsElSFBu2A
expiry:1497621659
token-type:Bearer
uid:usertest@test.com
```
```JSON
{
  "id": 5,
  "title": "Outro Post criado",
  "body": "esse foi feito pelo postman",
  "created_at": "2017-06-02T14:00:59.013Z",
  "updated_at": "2017-06-02T14:00:59.013Z",
  "user": {
    "id": 1,
    "provider": "email",
    "uid": "usertest@test.com",
    "name": "test of test",
    "nickname": "test",
    "image": null,
    "email": "usertest@test.com",
    "created_at": "2017-06-01T21:53:34.411Z",
    "updated_at": "2017-06-02T13:55:39.569Z"
  }
}
```
#### Excluindo um post (requer autenticação do dono ou admin)
Requisição:
```HTTP
DELETE /api/posts/6 HTTP/1.1
Host: localhost:3000
access-token: LWL9sL1OZxYQZ6ntAekGPg
client: OMMeNw_Nfai7v-3gURbiHA
expiry: 1497017949
token-type: Bearer
uid: usertest@test.com
Cache-Control: no-cache
Postman-Token: 9902750d-23ec-08f3-51c1-1c4bf3e674f6
```
Retorno:
```HTTP
                  Status 204 No Content
Cache-Control:no-cache
X-Request-Id:a1bcb05a-9aef-4585-9957-3329d40a5b6f
X-Runtime:0.185773
access-token:LWL9sL1OZxYQZ6ntAekGPg
client:OMMeNw_Nfai7v-3gURbiHA
expiry:1497017949
token-type:Bearer
uid:usertest@test.com
```
