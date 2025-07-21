/datum/action/cooldown/spell/undirected/feather_falling
	name = "Feather Fall"
	desc = "Grant yourself and any creatures adjacent to you some defense against falls."
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_NO_MOVE
	button_icon_state = "jump"

	point_cost = 1

	charge_time = 4 SECONDS
	cooldown_time = 3 MINUTES
	spell_cost = 50

/datum/action/cooldown/spell/undirected/feather_falling/cast(atom/cast_on)
	. = ..()
	var/datum/status_effect/status = /datum/status_effect/buff/featherfall
	for(var/mob/living/L in viewers(max(1), owner))
		L.apply_status_effect(status)
