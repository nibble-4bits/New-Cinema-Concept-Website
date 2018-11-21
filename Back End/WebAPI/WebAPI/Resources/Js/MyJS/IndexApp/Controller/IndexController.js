app.controller("IndexController", ['$scope', '$http', '$location', function ($scope, $http, $location) {
    $scope.Login = function () {
        var UserData = {
            Nick: $scope.Nick,
            Password: $scope.Password
        };
        UserData = JSON.stringify(UserData);
        $http({
            method: 'Post',
            url: '/api/login/authenticateUser',
            data: UserData,
            config
        }).then(function (response) {
            $location.path('/UserList');
            if ($.trim(response.data)) {
                localStorage.setItem('token', response.data);
                $scope.events = [];
                $scope.idle = 2;
                $scope.timeout = 6;
            }

        }, function (error) {
            console.log(error.data);
            $scope.error = "Something wrong whith your loging" + data.ExceptionMessage;
        });
    };
}]);