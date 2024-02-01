function fn() {
    var env = karate.env;
    var urlBase = ''

    karate.log('Se realizó la ejecución en el ambiente: ', env);
    /*para que no halla algunas validaciones ssl*/
    karate.configure('ssl',true)

 if (!env) {
     env = 'dev';
 }

 if (env === 'dev') {

 } else if (env === 'cert') {
    var urlBase = 'https://petstore.swagger.io'


 }
/* siempre en config inicializadas las variables para que sean tomadas en cuenta en la ejecución*/
 var config = {

    env: env,
    urlBase: urlBase
 }

 return config;
 }