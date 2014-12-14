angular
  .module('size')
  .controller("IndexController", ($scope, Size, supersonic) ->
    $scope.sizes = null
    $scope.showSpinner = true

    Size.all().whenChanged (sizes) ->
      $scope.$apply ->
        $scope.sizes = sizes
        $scope.showSpinner = false
  )