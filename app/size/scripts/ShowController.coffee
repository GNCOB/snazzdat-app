angular
  .module('size')
  .controller("ShowController", ($scope, Size, supersonic) ->
    $scope.size = null
    $scope.showSpinner = true
    $scope.dataId = undefined

    _refreshViewData = ->
      Size.find($scope.dataId).then (size) ->
        $scope.$apply ->
          $scope.size = size
          $scope.showSpinner = false

    supersonic.ui.views.current.whenVisible ->
      _refreshViewData() if $scope.dataId

    supersonic.ui.views.current.params.onValue (values) ->
      $scope.dataId = values.id
      _refreshViewData()

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.size.delete().then ->
        supersonic.ui.layers.pop()
  )
