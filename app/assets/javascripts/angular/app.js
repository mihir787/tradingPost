app = angular.module('tradingPost', ['ngRoute']);

app.config(['$routeProvider', '$locationProvider',
  function($routeProvider, $locationProvider) {
    $routeProvider
      .when('/', {
        templateUrl: '/views/index.html',
        controller: 'CategoriesController',
        controllerAs: 'categories'
      })
}]);

app.controller('CategoriesController', ['$scope', '$http', '$location', function($scope, $http, $location) {
  $scope.categories = [];

  $scope.fetch = function() {
    var location = $location
    $http.get(location.$$path = "api/v1/categories.json")
      .success(function(result) {
        $scope.categories = result;
      });
    }

  $scope.fetch();
}]);

app.controller('ItemsController', ['$scope', '$http', '$location', function($scope, $http, $location) {
  // var location = window.location.pathname = "api/v1/items"
  // $http.get(location)
  // .success(function(result) {
  //   $scope.items = result;
  // })
  $scope.items = [];
  $scope.init = function() {

    var location = $location
        debugger;
    $http.get(location.$$path = "api/v1/items.json")
      .success(function(result) {
        $scope.items = result;
      });
    }

  $scope.init();
}]);
