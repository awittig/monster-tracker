$(function() {
    $.getJSON("controller/monsters", function(data) {
        $.each(data, function() {
            var template = "<option value='{{MonsterName}}'>{{MonsterName}}</option>";
            var newOption = $(Mustache.render(template, this));
            newOption.data(this);
            $(".monstertype").append(newOption);
            $('.hitpoints').change();
        });
    });

    $("body")
    .on('change', '.monster-count', function() {
        var $container = $(this).parents('.monster-type-container').find(".monsters-hp-container");
        $container.empty();
        for (var i = 0; i < $(this).val(); i++) {
            $container.append("<div class='monster-hp-container'><input type='number' class='hitpoints' value='1' /> HP <input type='checkbox' name='dead' />Dead</div>");
        }
        $container.children('input').change();
    })
    //.on('change', '.hitpoints, .monstertype', calculateXp)
    .on('change', '.monstertype', function() {
        var $data = $(this).find('option:selected').data();
        var $container = $(this).parents('.monster-type-container');
        $container.find('.hitdie').html($data.HD);
        var sign = Number($data.HitModifier) < 0 ? '' : '+';
        $container.find('.hitdie-modifier').html(sign + $data.HitModifier);
        $container.find('.armor-class').html($data.AC);
        $container.find('.num-attacks').html($data.NumAttacks);
        $container.find('.size').html($data.Size);
        $container.find('.movement').html($data.Movement);
        $container.find('.treasure').html($data.Treasure);
    });
    $('.monster-count').change();

    $('#add-new-monster-type').click(function() {
        var $newContainer = $('.monster-type-container.template').clone(true);
        $newContainer.removeClass('template');
        $('body').append($newContainer);
    });
});

var calculateXp = function () {
    if ($(this).hasClass('hitpoints')) {
        var $monstertype = $(this).parents('.monster-type-container').find('.monstertype option:selected');
    } else if ($(this).hasClass('monstertype')) {
        var $monstertype = $(this).find('option:selected');
    }
    if ($monstertype.val() == '') {
        return;
    }
    var monsterType = $monstertype.data();
    $.getJSON('controller/base-xp',
        {
            hitDice: monsterType.HD,
            modifier: monsterType.HitModifier
        },
        function (data) {
            var monsterCount = $('.hitpoints').length;
            var totalHitPoints = 0;
            $('.hitpoints').each(function () {
                totalHitPoints += Number($(this).val());
            });
            var xpData = data[0];
            var baseXp = xpData.BasicXP;
            var hitPointXp = xpData.HitPointXP;
            var specialAbilityCount = monsterType.NumSpecialAbilities;
            var specialAbilityXp = xpData.SpecialAbilityXP;
            var exceptionalAbilityCount = monsterType.NumExceptionalAbilities;
            var exceptionalAbilityXp = xpData.ExceptionalAbilityXP;
            var calculatedXp = (totalHitPoints * hitPointXp) + monsterCount * (baseXp + (specialAbilityCount * specialAbilityXp) + (exceptionalAbilityCount * exceptionalAbilityXp));
            $('#calculatedXp').html(calculatedXp);
        });
};