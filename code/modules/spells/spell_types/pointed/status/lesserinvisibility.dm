/datum/action/cooldown/spell/status/invisibility
	name = "Invisibility"
	desc = "Hide the target from eyes, for a time."
	button_icon_state = "invisibility"
	sound = 'sound/misc/stings/generic.ogg'

	cast_range = 3
	spell_type = SPELL_ARCYNE
	antimagic_flags = MAGIC_RESISTANCE_HOLY
	associated_skill = /datum/skill/magic/arcyne

	charge_required = TRUE
	cooldown_time = 5 MINUTES
	spell_cost = 60

	status_effect = /datum/status_effect/invisibility
