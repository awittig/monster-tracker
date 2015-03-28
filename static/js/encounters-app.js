(function() {

    var app = angular.module('encounters', []);

    app.controller('EncounterController', ['$http', function($http) {
        var self = this;
        this.encounters = [];
        $http.get('controller/encounters').success(function(data){
            self.encounters = data;
        });

        this.selectedType = 0;
        this.monsterCount = 1;

        this.encounter = {};

        this.loadEncounter = function() {
            $http.get('controller/encounter/'+self.selectedType.id).success(function(data) {
                self.encounter = data;

                for (var encounterMonsterType in self.encounter.encounterMonsterTypes) {
                    $http.get('controller/monster-type')

                }


            });
        }
    }]);

})();