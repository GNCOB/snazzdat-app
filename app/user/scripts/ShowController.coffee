angular
  .module('user')
  .controller("ShowController", ($scope, User, supersonic) ->
    $scope.user = null
    $scope.showSpinner = true
    $scope.dataId = undefined

    _refreshViewData = ->
      User.find($scope.dataId).then (user) ->
        $scope.$apply ->
          $scope.user = user
          $scope.showSpinner = false

    supersonic.ui.views.current.whenVisible ->
      _refreshViewData() if $scope.dataId

    supersonic.ui.views.current.params.onValue (values) ->
      $scope.dataId = values.id
      _refreshViewData()

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.user.delete().then ->
        supersonic.ui.layers.pop()
  )
