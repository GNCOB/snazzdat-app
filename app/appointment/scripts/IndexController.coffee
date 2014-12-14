angular
  .module('appointment')
  .controller("IndexController", ($scope, Appointment, supersonic) ->
    $scope.appointments = null
    $scope.showSpinner = true

    Appointment.all().whenChanged (appointments) ->
      $scope.$apply ->
        $scope.appointments = appointments
        $scope.showSpinner = false
  )