angular
  .module('appointment')
  .controller("ShowController", ($scope, Appointment, supersonic) ->
    $scope.appointment = null
    $scope.showSpinner = true
    $scope.dataId = undefined

    _refreshViewData = ->
      Appointment.find($scope.dataId).then (appointment) ->
        $scope.$apply ->
          $scope.appointment = appointment
          $scope.showSpinner = false

    supersonic.ui.views.current.whenVisible ->
      _refreshViewData() if $scope.dataId

    supersonic.ui.views.current.params.onValue (values) ->
      $scope.dataId = values.id
      _refreshViewData()

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.appointment.delete().then ->
        supersonic.ui.layers.pop()
  )
