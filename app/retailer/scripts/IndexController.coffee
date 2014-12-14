angular
  .module('retailer')
  .controller("IndexController", ($scope, Retailer, supersonic) ->
    $scope.retailers = null
    $scope.showSpinner = true

    Retailer.all().whenChanged (retailers) ->
      $scope.$apply ->
        $scope.retailers = retailers
        $scope.showSpinner = false
  )