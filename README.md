##composer install o composer update

luego crear un archivo llamado .env en el root de la aplicacion con las siguientes configuraciones(esta configuracion es de ejemplo , DOMAIN_URL deben setear el domain name, ars.net es el que uso localmente):
```
PAGE_TITLE=ARS PROJECT
API_URL=http://54.218.36.180:2000/
DOMAIN_URL=http://ars.net 

#Local mail settings
EMAILSERVER=smtp.gmail.com
EMAILPORT=465
EMAILUSERNAME=emailtouse
EMAILPASSWORD=email pass
##EMAILFROMNAME=Darr
EMAILFROMEMAIL=email
EMAILSECURITY=ssl 
```

#en el server:
configurar apache para que el home sea /var/www/html/NOMBREDELAAPP/public/
