app.controller("UserController", ['$scope', '$http', '$window', function ($scope, $http, $window) {
    $scope.token = $window.sessionStorage.getItem("token");
    $scope.peliculas = [];
    $scope.episodios = [];
    $scope.cupones = [];
    $scope.productos = [];
    $scope.historial = [];
    $scope.Cantidad = [];
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
            $scope.ObtenerProductos();
            $scope.ObtenerPedidos();
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

    $scope.ObtenerProductos = function () {
        $http({
            method: 'GET',
            url: '/api/producto',
            headers: {
                "Content-Type": "application/json; charset=utf-8",
                "Authorization": "Bearer " + $scope.token
            }
        }).then(function (response) {
            $scope.productos = response.data;
        }, function (error) {
            console.log(error.statusText);
            $scope.error = "Something went wrong. Error";
        });
    }

    $scope.ObtenerPedidos = function () {
        $http({
            method: 'GET',
            url: `/api/pedido?idUsuario=${$scope.userId}`,
            headers: {
                "Content-Type": "application/json; charset=utf-8",
                "Authorization": "Bearer " + $scope.token
            }
        }).then(function (response) {
            $scope.historial = response.data;

            for (var i = 0; i < $scope.historial.length; i++) {
                $scope.historial[i].FechaCompra = new Date($scope.historial[i].FechaCompra).toLocaleDateString();
            }
        }, function (error) {
            console.log(error.statusText);
            $scope.error = "Something went wrong. Error";
        });
    }


    $scope.Pedir = function (productoId) {
        var pedido = {
            Usuario: { Id: $scope.userId },
            Producto_Pedido:
                [
                    {
                        Producto: { Id: productoId },
                        Cantidad: $scope.Cantidad[productoId]
                    }
                ]
        };

        $http({
            method: 'POST',
            url: '/api/pedido',
            data: angular.toJson(pedido),
            headers: {
                "Content-Type": "application/json; charset=utf-8",
                "Authorization": "Bearer " + $scope.token
            }
        }).then(function (response) {
            $scope.pedidoInsertado = response.data;
        }, function (error) {
            console.log(error.statusText);
            $scope.error = "Something went wrong. Error";
        });
    }
}]);