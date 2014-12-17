
$(function() {
    $('input').change(function() {
        $.ajax({
            url: 'base-xp',
            data: {
                hitDice: $('#HD').val(),
                modifier: $('#hitModifier').val()
            },
            dataType: 'json',
            success: function(data) {
                var xpData = data[0];
                var baseXp = xpData.BASICXP;
                var hitPoints = $('#hitPoints').val();
                var hitPointXp = xpData.HITPOINTXP;
                var specialAbilityCount = $('#numSpecialAbilities').val();
                var specialAbilityXp = xpData.SPECIALABILITYXP;
                var exceptionalAbilityCount = $('#numExceptionalAbilities').val();
                var exceptionalAbilityXp = xpData.EXCEPTIONALABILITYXP;
                var calculatedXp = baseXp + (hitPoints * hitPointXp) + (specialAbilityCount * specialAbilityXp) + (exceptionalAbilityCount * exceptionalAbilityXp)
                $('#calculatedXp').html(calculatedXp);
            }
        });
    });
});