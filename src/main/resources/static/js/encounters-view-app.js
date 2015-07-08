(function() {

    var app = angular.module('encounters', []);

    app.controller('EncounterViewController', ['$http', function($http) {
        var self = this;

        this.encounters = [];

        $http.get('controller/encounters').success(function(data){
            self.encounters = data;
        });

        this.selectedEncounter = {};

        this.encounterDetail = {};

        this.viewEncounter = function() {

            $http.get('controller/encounter/'+self.selectedEncounter.id).success(function(data){
                self.encounterDetail = data;

                $.each(self.encounterDetail.encounterMonsterTypes, function(index, encounterMonsterType) {
                    $http.get('controller/monster/'+encounterMonsterType.monsterType.id).success(function(data) {
                        self.encounterDetail.monsterTypes[index] = data;
                    })
                });

            });
        }

    }]);

})();