/datum/action/cooldown/spell/undirected/shapeshift/bat
	name = "Bat Form"
	desc = "Transform into a lesser bat to fly into the nite."

	charge_required = FALSE
	cooldown_time = 50 SECONDS

	possible_shapes = list(/mob/living/simple_animal/hostile/retaliate/bat)
	die_with_shapeshifted_form = FALSE
