angular
  .module('appointment')
  .controller("NewController", ($scope, Appointment, supersonic) ->
    $scope.appointment = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      newappointment = new Appointment($scope.appointment)
      newappointment.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
