app.controller('UserItemsController', ['$scope', "$http", function($scope, $http) {
  // $scope.title = 'I want ice cream';
  // $scope.promo = "I don't want to drive to the airport";
  // $scope.products = ;
    $http.get("api/v1/items.json")
    .success(function(result) {
      $scope.items = result;
    })
    // .error(function(data, status) {
    //   console.log(data);
    // })
  }
]);
