angular
  .module('retailer')
  .controller("EditController", ($scope, Retailer, supersonic) ->
    $scope.retailer = null
    $scope.showSpinner = true

    supersonic.ui.views.current.params.onValue (values) ->
      Retailer.find(values.id).then (retailer) ->
        $scope.$apply ->
          $scope.retailer = retailer
          $scope.showSpinner = false

    $scope.submitForm = ->
      $scope.showSpinner = true
      $scope.retailer.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
