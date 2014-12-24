$(function() {
    $.getJSON("controller/monsters", function(data) {
        $.each(data, function() {
            var template = "<option value='{{id}}'>{{name}}</option>";
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
            $container.append("<div class='monster-hp-container'><input type='number' name='monsters["+i+"][hitPoints]' class='hitpoints' value='1' /> HP <input type='checkbox' name='monsters["+i+"][dead]' />Dead</div>");
        }
        $container.children('input').change();
    })
    //.on('change', '.hitpoints, .monstertype', calculateXp)
    .on('change', '.monstertype', function() {
        var $data = $(this).find('option:selected').data();
        var $container = $(this).parents('.monster-type-container');
        $container.find('.encounter-id').val($data.encounter_id)
        $container.find('.hitdie').html($data.hit_dice);
        var sign = Number($data.HitModifier) < 0 ? '' : '+';
        $container.find('.hitdie-modifier').html(sign + $data.hit_die_modifier);
        $container.find('.armor-class').html($data.armor_class);
        $container.find('.num-attacks').html($data.attack_count);
        $container.find('.size').html($data.size);
        $container.find('.movement').html($data.movement);
        $container.find('.treasure').html($data.treasure);
    });
    $('.monster-count').change();

    $('#add-new-monster-type').click(function() {
        var $newContainer = $('.monster-type-container.template').clone(true);
        $newContainer.removeClass('template');
        $('body').append($newContainer);
    });

    $('#save-button').click(function() {
        $("form.monster-type-container").submit();
    });

    $("body").on('submit', 'form.monster-type-container:not(.template)', function(event) {
        event.preventDefault();
        $.post('controller/encounter', $(this).serializeJSON(), function(data) {
            alert(data);
        });
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
            var baseXp = xpData.basic_xp;
            var hitPointXp = xpData.hit_point_xp;
            var specialAbilityCount = monsterType.special_ability_count;
            var specialAbilityXp = xpData.special_ability_xp;
            var exceptionalAbilityCount = monsterType.exceptional_ability_count;
            var exceptionalAbilityXp = xpData.exceptional_ability_xp;
            var calculatedXp = (totalHitPoints * hitPointXp) + monsterCount * (baseXp + (specialAbilityCount * specialAbilityXp) + (exceptionalAbilityCount * exceptionalAbilityXp));
            $('#calculatedXp').html(calculatedXp);
        });
};