angular
  .module('appointment')
  .controller("EditController", ($scope, Appointment, supersonic) ->
    $scope.appointment = null
    $scope.showSpinner = true

    supersonic.ui.views.current.params.onValue (values) ->
      Appointment.find(values.id).then (appointment) ->
        $scope.$apply ->
          $scope.appointment = appointment
          $scope.showSpinner = false

    $scope.submitForm = ->
      $scope.showSpinner = true
      $scope.appointment.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
