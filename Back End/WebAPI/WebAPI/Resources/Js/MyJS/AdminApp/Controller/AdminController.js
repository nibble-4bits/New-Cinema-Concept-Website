app.controller("AdminController", ['$scope', '$http', '$window', function ($scope, $http, $window) {
    $scope.token = $window.sessionStorage.getItem("token");
    $scope.nickname = getUsername($scope.token);
    $scope.cantidadBasicos = 0;
    $scope.cantidadOros = 0;
    $scope.cantidadPlatinos = 0;

    $scope.$on('$viewContentLoaded', function () {
        if ($scope.token != null) {
            $scope.ObtenerCantidadUsuarios();
        }
        else {
            $window.location.href = "/Views/index/index.html";
        }
    });

    $scope.ObtenerCantidadUsuarios = function () {
        $http({
            method: 'GET',
            url: 'api/admin/cantUsuarios',
            headers: {
                "Content-Type": "application/json; charset=utf-8",
                "Authorization": "Bearer " + $scope.token
            }
        }).then(function (response) {
            alert(response.data);
            /*for (var cantidad of response.data) {

            }
            if (response.data) {

            }*/
        }, function (error) {
            console.log(error.statusText);
            $scope.error = "Something went wrong. Error";
        });
    }
}]);