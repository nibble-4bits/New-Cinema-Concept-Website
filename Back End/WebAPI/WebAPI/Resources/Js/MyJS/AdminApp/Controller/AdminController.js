app.controller("AdminController", ['$scope', '$http', '$window', function ($scope, $http, $window) {
    $scope.token = $window.sessionStorage.getItem("token");
    $scope.nickname = getUsername($scope.token);
    $scope.mesGanancias = 1;
    $scope.cantidadBasicos = 0;
    $scope.cantidadOros = 0;
    $scope.cantidadPlatinos = 0;
    $scope.totalAlimentos = 0;
    $scope.totalBoletos = 0;
    $scope.quejasPlatinum = [];
    $scope.quejasGold = [];
    $scope.quejasBasico = [];

    $scope.Logout = function () {
        sessionStorage.clear();
        $window.location.href = "/Views/index/index.html";
    }

    $scope.$on('$viewContentLoaded', function () {
        if ($scope.token != null) {
            $scope.ObtenerGanancias();
            $scope.ObtenerCantidadUsuarios();
            $scope.ObtenerQuejasPlatinum();
            $scope.ObtenerQuejasGold();
            $scope.ObtenerQuejasBasico();
        }
        else {
            $window.location.href = "/Views/index/index.html";
        }
    });

    $scope.ObtenerGanancias = function () {
        $http({
            method: 'GET',
            url: `../../api/admin/ganancias?mes=${$scope.mesGanancias}`,
            headers: {
                "Content-Type": "application/json; charset=utf-8",
                "Authorization": "Bearer " + $scope.token
            }
        }).then(function (response) {
            $scope.totalAlimentos = response.data[0];
            $scope.totalBoletos = response.data[1];
        }, function (error) {
            console.log(error.statusText);
            $scope.error = "Something went wrong. Error";
        });
    }

    $scope.ObtenerCantidadUsuarios = function () {
        $http({
            method: 'GET',
            url: '../../api/admin/cantUsuarios',
            headers: {
                "Content-Type": "application/json; charset=utf-8",
                "Authorization": "Bearer " + $scope.token
            }
        }).then(function (response) {
            $scope.cantidadBasicos = response.data[1];
            $scope.cantidadOros = response.data[2];
            $scope.cantidadPlatinos = response.data[3];
        }, function (error) {
            console.log(error.statusText);
            $scope.error = "Something went wrong. Error";
        });
    }

    $scope.ObtenerQuejasPlatinum = function () {
        $http({
            method: 'GET',
            url: '../../api/admin/quejaP',
            headers: {
                "Content-Type": "application/json; charset=utf-8",
                "Authorization": "Bearer " + $scope.token
            }
        }).then(function (response) {
            $scope.quejasPlatinum = response.data;
        }, function (error) {
            console.log(error.statusText);
            $scope.error = "Something went wrong. Error";
        });
    }

    $scope.ObtenerQuejasGold = function () {
        $http({
            method: 'GET',
            url: '../../api/admin/quejaG',
            headers: {
                "Content-Type": "application/json; charset=utf-8",
                "Authorization": "Bearer " + $scope.token
            }
        }).then(function (response) {
            $scope.quejasGold = response.data;
        }, function (error) {
            console.log(error.statusText);
            $scope.error = "Something went wrong. Error";
        });
    }

    $scope.ObtenerQuejasBasico = function () {
        $http({
            method: 'GET',
            url: '../../api/admin/quejaB',
            headers: {
                "Content-Type": "application/json; charset=utf-8",
                "Authorization": "Bearer " + $scope.token
            }
        }).then(function (response) {
            $scope.quejasBasico = response.data;
        }, function (error) {
            console.log(error.statusText);
            $scope.error = "Something went wrong. Error";
        });
    }
}]);