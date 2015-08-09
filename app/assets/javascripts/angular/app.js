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
  var environment = document.getElementById('environment').innerHTML

  $scope.fetch = function() {
    var location = $location
    $http.get(location.$$path = environment + "api/v1/categories.json")
      .success(function(result) {
        $scope.categories = result;
      });
    }

  $scope.fetch();
}]);

app.controller('ItemsController', ['$scope', '$http', function($scope, $http) {
  var environment = document.getElementById('environment').innerHTML

  $scope.items = [];
  $scope.init = function() {
    $http.get(environment + "api/v1/items.json")
      .success(function(result) {
        $scope.items = result;
      });
  }

  $scope.newMessage = function() {
    $scope.newTrade
    $scope.newTrade = '';
  }

  $scope.trades = [];

  $scope.createTrade = function() {
    $scope.trades.push({message: this.newTrade, item_id: this.item.id});
    $scope.message = '';
  }

  $scope.initModal = function() {
    $scope.currentId = this.item.id
    $('#modal' + $scope.currentId).openModal();
  }

  $scope.closeModal = function() {
      $scope.currentId = this.item.id
     $('#modal' + $scope.currentId).closeModal();
  }

  $scope.init();
}]);

app.controller('TradesController', ['$scope', '$http', function($scope, $http) {
  $scope.trades = [];
  var environment = document.getElementById('environment').innerHTML

  $scope.getTrades = function() {
    $http.get(environment + "api/v1/trades.json")
      .success(function(result) {
        $scope.trades = result;
      });
  }

  $scope.getTrades();
}]);
