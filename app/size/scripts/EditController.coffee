angular
  .module('size')
  .controller("EditController", ($scope, Size, supersonic) ->
    $scope.size = null
    $scope.showSpinner = true

    supersonic.ui.views.current.params.onValue (values) ->
      Size.find(values.id).then (size) ->
        $scope.$apply ->
          $scope.size = size
          $scope.showSpinner = false

    $scope.submitForm = ->
      $scope.showSpinner = true
      $scope.size.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
