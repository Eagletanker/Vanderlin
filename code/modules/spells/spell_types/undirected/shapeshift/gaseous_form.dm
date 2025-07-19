/datum/action/cooldown/spell/undirected/shapeshift/mist
	name = "Mist Form"
	desc = "Transform into a cloud of mist."

	charge_required = FALSE
	cooldown_time = 50 SECONDS

	possible_shapes = list(/mob/living/simple_animal/hostile/retaliate/gaseousform)
	die_with_shapeshifted_form = FALSE
