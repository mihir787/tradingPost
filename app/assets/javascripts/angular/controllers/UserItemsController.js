app.controller('UserItemsController', ['$scope', "$http", function($scope, $http) {
  return $http.get("api/v1/items.json")
  .success(function(result) {
    $scope.items = result;
  })
    // .error(function(data, status) {
    //   console.log(data);
    // })
  }
]);
