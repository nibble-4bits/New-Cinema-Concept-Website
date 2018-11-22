app.controller("IndexController", ['$scope', '$http', '$window', function ($scope, $http, $window) {
    $scope.user = {};
    $scope.userR = {};

    $scope.Login = function () {
        $http({
            method: 'POST',
            url: '/api/login',
            data: angular.toJson($scope.user),
            headers: { "Content-Type": "application/json; charset=utf-8" }
        }).then(function (response) {
            if ($.trim(response.data)) {
                sessionStorage.setItem('token', response.data);
                
                if (getUsername($window.sessionStorage.getItem('token')) == 'admin') {
                    $window.location.href = '/Views/admin/adminIndex.html';
                }
                else {
                    $window.location.href = '/Views/user/userIndex.html';
                }
            }

        }, function (error) {
            if (error.status == 404) {
                alert('Su usuario o contraseña no coinciden. Por favor intentelo de nuevo');
                // No se encontró el usuario, notificarlo
            }
            else {
                console.log(error.statusText);
                $scope.error = "Something wrong with your log in" + data.ExceptionMessage;
            }
        });
    };

    $scope.SignUp = function () {
        $http({
            method: 'POST',
            url: '/api/user',
            data: angular.toJson($scope.userR),
            headers: { "Content-Type": "application/json; charset=utf-8" }
        }).then(function (response) {
            $scope.user.Username = response.data.Username;
            $scope.user.Password = response.data.Password;
            $scope.Login();
        }, function (error) {
            console.log(error.statusText);
            $scope.error = "Something wrong with your sign up" + data.ExceptionMessage;
        });
    }
}]);