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

app.controller('CategoriesController', ['$scope', "$http", function($scope, $http) {
  $scope.categories = [];

  $scope.fetch = function() {
    $http.get("api/v1/categories.json")
      .success(function(result) {
        $scope.categories = result;
      });
    }

  $scope.fetch();
}]);

app.controller('UserItemsController', ['$scope', "$http", function($scope, $http) {
  $http.get("api/v1/items.json")
  .success(function(result) {
    $scope.items = result;
  })
    // .error(function(data, status) {
    //   console.log(data);
    // })
  }
]);
