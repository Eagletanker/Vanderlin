/datum/action/cooldown/spell/status/haste
	name = "Haste"
	desc = "Cause a target to be magically hastened."
	button_icon_state = "haste"
	point_cost = 3
	sound = 'sound/magic/haste.ogg'

	school = SCHOOL_TRANSMUTATION

	charge_time = 2 SECONDS
	charge_slowdown = 0.3
	cooldown_time = 3 MINUTES
	spell_cost = 40

	status_effect = /datum/status_effect/buff/acrynehaste
	duration_scaling = TRUE
	duration_modification = 30 SECONDS


