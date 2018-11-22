app.controller("UserController", ['$scope', '$http', '$window', function ($scope, $http, $window) {
    $scope.token = $window.sessionStorage.getItem("token");
    $scope.peliculas = [];
    $scope.episodios = [];
    $scope.cupones = [];
    $scope.nickname = getUsername($scope.token);
    $scope.userId = getUserId($scope.token);
    $scope.ticket = {
        Usuario: { Id: $scope.userId }
    };

    $scope.Logout = function () {
        sessionStorage.clear();
        $window.location.href = "/Views/index/index.html";
    }

    $scope.$on('$viewContentLoaded', function () {
        if ($scope.token != null) {
            $scope.ObtenerPeliculas();
            $scope.ObtenerEpisodios();
            $scope.ObtenerCupones();
        }
        else {
            $window.location.href = "/Views/index/index.html";
        }
    });

    $scope.ObtenerPeliculas = function () {
        $http({
            method: 'GET',
            url: '/api/peliculas',
            headers: {
                "Content-Type": "application/json; charset=utf-8",
                "Authorization": "Bearer " + $scope.token
            }
        }).then(function (response) {
            $scope.peliculas = response.data;
        }, function (error) {
            console.log(error.statusText);
            $scope.error = "Something went wrong. Error";
        });
    }

    $scope.ObtenerEpisodios = function () {
        $http({
            method: 'GET',
            url: '/api/episodios',
            headers: {
                "Content-Type": "application/json; charset=utf-8",
                "Authorization": "Bearer " + $scope.token
            }
        }).then(function (response) {
            $scope.episodios = response.data;
        }, function (error) {
            console.log(error.statusText);
            $scope.error = "Something went wrong. Error";
        });
    }

    $scope.ObtenerCupones = function () {
        $http({
            method: 'GET',
            url: `/api/cupon?idUsuario=${$scope.userId}`,
            headers: {
                "Content-Type": "application/json; charset=utf-8",
                "Authorization": "Bearer " + $scope.token
            }
        }).then(function (response) {
            $scope.cupones = response.data;
        }, function (error) {
            console.log(error.statusText);
            $scope.error = "Something went wrong. Error";
        });
    }

    $scope.AgregarTicket = function () {
        $http({
            method: 'POST',
            url: '/api/ticket',
            data: angular.toJson($scope.ticket),
            headers: {
                "Content-Type": "application/json; charset=utf-8",
                "Authorization": "Bearer " + $scope.token
            }
        }).then(function (response) {
            // Ticket añadido a la BD
            alert("Gracias por su reporte. ¡Su queja nos ayudará a brindarle un mejor servicio!");
            $scope.ticket.Titulo = "";
            $scope.ticket.Motivo = "";
            $scope.ticket.Descripcion = "";
        }, function (error) {
            console.log(error.statusText);
            $scope.error = "Something went wrong. Error";
        });
    }
}]);