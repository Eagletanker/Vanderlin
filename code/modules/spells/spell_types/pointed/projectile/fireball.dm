/datum/action/cooldown/spell/projectile/fireball
	name = "Fireball"
	desc = "Shoot out a ball of fire that emits a light explosion on impact, setting the target alight."
	button_icon_state = "fireball"
	charge_sound = 'sound/magic/charging_fire.ogg'

	cast_range = 8
	point_cost = 5

	charge_time = 2.5 SECONDS
	charge_drain = 1
	charge_slowdown = 0.7
	cooldown_time = 25 SECONDS
	spell_cost = 30

	projectile_type = /obj/projectile/magic/aoe/fireball/rogue

/obj/projectile/magic/aoe/fireball/rogue
	name = "fireball"
	exp_heavy = 0
	exp_light = 1
	exp_flash = 2
	exp_fire = 3
	damage = 10
	damage_type = BURN
	nodamage = FALSE
	flag = "magic"
	hitsound = 'sound/fireball.ogg'
	aoe_range = 0
	speed = 3

/datum/action/cooldown/spell/projectile/fireball/greater //balancing around it being DND's fireball
	name = "Fireball (Greater)"
	desc = "Shoot out an immense ball of fire that explodes on impact."
	button_icon_state = "fireball_greater"

	point_cost = 8

	charge_time = 4 SECONDS
	charge_drain = 2
	charge_slowdown = 1.3
	cooldown_time = 45 SECONDS
	spell_cost = 50

	projectile_type = /obj/projectile/magic/aoe/fireball/rogue/great

/obj/projectile/magic/aoe/fireball/rogue/great
	name = "fireball"
	exp_devi = 0
	exp_heavy = 1
	exp_light =2
	exp_flash = 4
	exp_fire = 3
	exp_hotspot = 0
	speed = 3
