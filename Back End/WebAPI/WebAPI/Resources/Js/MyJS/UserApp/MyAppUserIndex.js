﻿var app = angular.module("myApp", ["ngRoute"]);
app.config(['$locationProvider', '$routeProvider', function ($locationProvider, $routeProvider) {
    $routeProvider.when('/', { //Routing for show list of employee
        templateUrl: '../../../../Views/user/cartelera.html',
        controller: 'UserController'
    }).when('/cupones', { //Routing for add employee
        templateUrl: '../../../../Views/user/cupones.html',
        controller: 'UserController'
    }).when('/historial', { //Routing for add employee
        templateUrl: '../../../../Views/user/historial.html',
        controller: 'UserController'
    }).when('/pedidos', { //Routing for add employee
        templateUrl: '../../../../Views/user/pedidos.html',
        controller: 'UserController'
    }).when('/ticket', { //Routing for add employee
        templateUrl: '../../../../Views/user/ticket.html',
        controller: 'UserController'
    }).when('/configuration', { //Routing for add employee
        templateUrl: '../../../../Views/user/configuracion.html',
        controller: 'UserController'
    }).when('/pelicula', { //Routing for add employee
        templateUrl: '../../../../Views/user/pelicula.html',
        controller: 'UserController'
    });
}]);

$(document).ready(function () {
    $('.aniview').AniView();

    //FUNCION PARA EFECTO SHAKE EN ICONOS DE FOOTES
    $('#lblYoutubeIcon').on('mouseover', function () {
        $('#lblYoutubeIcon').addClass('animated shake');
        debugger;
    });
});
