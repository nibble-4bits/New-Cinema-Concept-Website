var app = angular.module("myApp", ["ngRoute"]);
app.config(['$locationProvider', '$routeProvider', function ($locationProvider, $routeProvider) {
    $routeProvider.when('/', { //Routing for show list of employee
        templateUrl: '../../../../Views/admin/AdminIndexMain.html',
        controller: 'AdminController'
    });
}]);