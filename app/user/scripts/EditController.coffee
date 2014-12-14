angular
  .module('user')
  .controller("EditController", ($scope, User, supersonic) ->
    $scope.user = null
    $scope.showSpinner = true

    supersonic.ui.views.current.params.onValue (values) ->
      User.find(values.id).then (user) ->
        $scope.$apply ->
          $scope.user = user
          $scope.showSpinner = false

    $scope.submitForm = ->
      $scope.showSpinner = true
      $scope.user.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
