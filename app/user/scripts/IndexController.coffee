angular
  .module('user')
  .controller("IndexController", ($scope, User, supersonic) ->
    $scope.users = null
    $scope.showSpinner = true

    User.all().whenChanged (users) ->
      $scope.$apply ->
        $scope.users = users
        $scope.showSpinner = false
  )