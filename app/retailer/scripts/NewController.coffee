angular
  .module('retailer')
  .controller("NewController", ($scope, Retailer, supersonic) ->
    $scope.retailer = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      newretailer = new Retailer($scope.retailer)
      newretailer.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
