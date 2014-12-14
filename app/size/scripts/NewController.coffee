angular
  .module('size')
  .controller("NewController", ($scope, Size, supersonic) ->
    $scope.size = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      newsize = new Size($scope.size)
      newsize.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
