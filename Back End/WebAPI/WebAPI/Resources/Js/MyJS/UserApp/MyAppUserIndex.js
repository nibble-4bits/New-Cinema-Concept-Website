var app = angular.module("myApp", ["ngRoute"]);
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
    });
}]);
