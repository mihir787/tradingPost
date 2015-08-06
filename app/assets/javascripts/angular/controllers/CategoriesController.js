app.controller('CategoriesController', ['$scope', "$http", function($scope, $http) {
  $http.get("api/v1/categories.json")
    .success(function(result) {
      $scope.categories = result;
    })
  }
]);
