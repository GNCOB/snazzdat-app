angular
  .module('retailer')
  .controller("ShowController", ($scope, Retailer, supersonic) ->
    $scope.retailer = null
    $scope.showSpinner = true
    $scope.dataId = undefined

    _refreshViewData = ->
      Retailer.find($scope.dataId).then (retailer) ->
        $scope.$apply ->
          $scope.retailer = retailer
          $scope.showSpinner = false

    supersonic.ui.views.current.whenVisible ->
      _refreshViewData() if $scope.dataId

    supersonic.ui.views.current.params.onValue (values) ->
      $scope.dataId = values.id
      _refreshViewData()

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.retailer.delete().then ->
        supersonic.ui.layers.pop()
  )
