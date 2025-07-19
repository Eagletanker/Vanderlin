/datum/action/cooldown/spell/projectile/arcyne_bolt //Similar to the Azure Peak acryne bolt
	name = "Arcyne Bolt"
	desc = "Shoot out rapid bolts of arcyne power. Damage is increased against NPCs by 50%"
	button_icon_state =  "arcane_bolt"
	sound = 'sound/magic/vlightning.ogg'

	cast_range = 15
	point_cost = 2

	charge_time = 0 SECONDS //shoots when you tap! This is *the* basic combat spell
	charge_drain = 1
	charge_slowdown = 1.3
	cooldown_time = 5 SECONDS
	spell_cost = 20

	projectile_type = /obj/projectile/magic/energy/rogue3

/obj/projectile/magic/energy/rogue3
	name = "arcyne bolt"
	icon_state = "arcane_barrage"
	damage = 45
	damage_type = BRUTE
	armor_penetration = 5
	npc_damage_mult = 1.5
	nodamage = FALSE
	hitsound = 'sound/combat/hits/blunt/shovel_hit2.ogg'
	flag = "piercing"
	speed = 1
	spread = 2
