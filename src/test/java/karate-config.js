function fn() {
    // Obtener la variable de entorno
    let env = karate.env;

    // Configurar timeouts
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    karate.log('karate.env property was:', env);

    if (!env) {
        env = 'dev';
    }

    var config = {
        env: env//,
       // baseUrl: 'https://reqres.in/api'//,
       // apiKey: 'reqres-free-v1'  
    }

    return config;
}
