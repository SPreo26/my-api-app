(function () {
  "use strict";

  angular.module("app").controller("showsCtrl", function($scope, $http) {

    $scope.setup = function() {
      $http.get("/api/v1/shows.json").then(function(response) {
        $scope.shows = response.data;
      });

    }

    $scope.SearchViaDB = function(search_by, search_string){
      $http.get("/api/v1/shows/search?search_by="+search_by + "&search_string=" +search_string).then(function(response) {
        $scope.showsSearchResults = response.data;
      });
    }

    $scope.addShow = function(newDatetime, newArtistName, newVenue, newCity, newRegion, newCountry) {
      var newShow = {
        datetime: newDatetime,
        artsists: newArtistName,
        venue: newVenue,
        city: newCity,
        region: newRegion,
        country: newCountry
      };
      $http.post('/api/v1/shows.json', newShow).then(
        function(response){
        var showCallback = response.data;
        $scope.shows.push(showCallback);
      },
        function(error){
        console.log(error.data.errors);
      })
    }


    $scope.deleteShow = function(person){
      var index = $scope.shows.indexOf(show);
      var id = $scope.shows[index].id;
      $http.delete('/api/v1/shows/'+id, $scope.shows[index]).then(
        function(response){
        console.log(response.data);
        $scope.shows.splice(index,1);
      },
        function(error){
        console.log(error.data);
      })
     
    }


    $scope.toggleOrder = function(attribute){
      if(attribute === $scope.orderAttribute) {
        $scope.reverse = !$scope.reverse;
      } else {
        $scope.reverse = true;
      }
      $scope.orderAttribute = attribute;
    }
    
    window.$scope = $scope;
  
  });
}());
