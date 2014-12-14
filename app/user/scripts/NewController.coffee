angular
  .module('user')
  .controller("NewController", ($scope, User, supersonic) ->
    $scope.user = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      newuser = new User($scope.user)
      newuser.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
