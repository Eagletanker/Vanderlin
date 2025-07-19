/datum/spell_node/arcyne_eye
	name = "Arcane Eye"
	desc = "Create an invisible, magical eye."
	node_x = 0
	node_y = 0
	spell_type = /datum/action/cooldown/spell/undirected/arcyne_eye

/datum/spell_node/nondetection
	name = "Nondetection"
	desc = "Hide a target from divination magic."
	node_x = 90
	node_y = -110
	spell_type = /datum/action/cooldown/spell/undirected/touch/non_detection

/datum/spell_node/forcewall_weak
	name = "Weak Force Wall"
	desc = "Create a weak barrier of magical force."
	node_x = 110
	node_y = -90
	spell_type = /datum/action/cooldown/spell/undirected/forcewall/breakable

/datum/spell_node/mana_well
	name = "Mana Well"
	desc = "Dig deeper into your magical reserves."
	node_x = -290
	node_y = 290
	cost = 6
	is_passive = TRUE

/datum/spell_node/mana_well/on_node_buy(mob/user)
	var/current_max = user.mana_pool?.maximum_mana_capacity || 100
	user.mana_pool?.set_max_mana(current_max + 50, TRUE, TRUE)
	user.mana_overload_threshold += 50
	to_chat(user, span_notice("Your magical well deepens considerably."))

/datum/spell_node/meditation
	name = "Meditation"
	desc = "Improve your natural mana recovery."
	cost = 6
	node_x = -290
	node_y = 390
	prerequisites = list(/datum/spell_node/mana_well)
	is_passive = TRUE

/datum/spell_node/meditation/on_node_buy(mob/user)
	user.mana_pool?.set_natural_recharge(user.mana_pool.ethereal_recharge_rate + 0.25)
	to_chat(user, span_notice("Your mind achieves greater focus and clarity."))

/datum/spell_node/expanded_reserves
	name = "Expanded Reserves"
	desc = "Increase your magical capacity."
	cost = 8
	node_x = -390
	node_y = 290
	prerequisites = list(/datum/spell_node/mana_well)
	is_passive = TRUE

/datum/spell_node/expanded_reserves/on_node_buy(mob/user)
	var/current_max = user.mana_pool?.maximum_mana_capacity || 100
	user.mana_pool?.set_max_mana(current_max + 100, TRUE, TRUE)
	user.mana_overload_threshold += 100
	to_chat(user, span_notice("Your magical reserves expand."))

/datum/spell_node/eternal_wellspring
	name = "Eternal Wellspring"
	desc = "Achieve perfect harmony with magical forces."
	cost = 12
	node_x = -440
	node_y = 440
	prerequisites = list(/datum/spell_node/expanded_reserves, /datum/spell_node/meditation)
	is_passive = TRUE

/datum/spell_node/eternal_wellspring/on_node_buy(mob/user)
	var/current_max = user.mana_pool?.maximum_mana_capacity || 100
	user.mana_pool?.set_max_mana(current_max + 200, TRUE, TRUE)
	user.mana_pool?.set_natural_recharge(user.mana_pool.ethereal_recharge_rate + 1.0)
	user.mana_overload_threshold += 200
	to_chat(user, span_notice("You become one with the eternal flow of magic."))


/datum/spell_node/find_familiar
	name = "Find Familiar"
	desc = "Summon an animal to serve as your familiar."
	node_x = -110
	node_y = -110
	spell_type = /datum/action/cooldown/spell/conjure/familiar

/datum/spell_node/create_bonfire
	name = "Create Bonfire"
	desc = "Create a bonfire on the ground."
	node_x = 100
	node_y = 0
	prerequisites = list(/datum/spell_node/arcyne_eye)
	spell_type = /datum/action/cooldown/spell/conjure/bonfire

/datum/spell_node/acid_splash
	name = "Acid Splash"
	desc = "Hurl a bubble of acid at your enemies."
	node_x = RIGHT_X_TIER_2
	node_y = RIGHT_Y_LEFT
	spell_type = /datum/action/cooldown/spell/projectile/acid_splash

/datum/spell_node/poison_spray
	name = "Aerosalize"
	desc = "Turns liquids into gas. Requires you hold a open container for such."
	node_x = RIGHT_X_TIER_3
	node_y = RIGHT_Y_LEFT
	prerequisites = list(/datum/spell_node/acid_splash)
	spell_type = /datum/action/cooldown/spell/undirected/create_cloud

/datum/spell_node/green_flame_blade
	name = "Green-Flame Blade"
	desc = "Evoke fiery green flames along your weapon."
	node_x = RIGHT_X_TIER_2
	node_y = RIGHT_Y_RIGHT + 50
	spell_type = /datum/action/cooldown/spell/enchantment/green_flame

/datum/spell_node/spitfire
	name = "Fire Flash"
	desc = "Launch a blinding flash of fire."
	node_x = RIGHT_X_TIER_2
	node_y = RIGHT_Y_RIGHT
	spell_type = /datum/action/cooldown/spell/projectile/fire_flare

/datum/spell_node/fireball
	name = "Fireball"
	desc = "Launch an explosive ball of fire."
	node_x = RIGHT_X_TIER_3
	node_y = RIGHT_Y_RIGHT
	prerequisites = list(/datum/spell_node/spitfire)
	spell_type = /datum/action/cooldown/spell/projectile/fireball

/datum/spell_node/message
	name = "Message"
	desc = "Send telepathic communications across distances."
	node_x = 0
	node_y = -100
	spell_type = /datum/action/cooldown/spell/undirected/message

/datum/spell_node/booming_blade
	name = "Booming Blade"
	desc = "Evoke thunderous energy around your weapon."
	node_x = 0
	node_y = DOWN_Y_TIER_1 - 30
	spell_type = /datum/action/cooldown/spell/status/booming_blade

/datum/spell_node/blade_ward
	name = "Blade Ward"
	desc = "Extend your hand and trace a sigil of warding."
	node_x = 0
	node_y = DOWN_Y_TIER_1 - 70
	spell_type = /datum/action/cooldown/spell/undirected/blade_ward

/datum/spell_node/longstrider
	name = "Longstrider"
	desc = "Increase your walking speed."
	node_x = DOWN_X_RIGHT
	node_y = DOWN_Y_TIER_2
	prerequisites = list(/datum/spell_node/air_affinity)
	spell_type = /datum/action/cooldown/spell/undirected/longstrider

/datum/spell_node/haste
	name = "Haste"
	desc = "Make a creature move and act more quickly."
	node_x = DOWN_X_RIGHT
	node_y = DOWN_Y_TIER_3
	prerequisites = list(/datum/spell_node/longstrider)
	spell_type = /datum/action/cooldown/spell/status/haste

/datum/spell_node/repel
	name = "Repel"
	desc = "Push creatures away from you with force."
	node_x = DOWN_X_RIGHT + 100
	node_y = DOWN_Y_TIER_3
	prerequisites = list(/datum/spell_node/haste)
	spell_type = /datum/action/cooldown/spell/projectile/repel

/datum/spell_node/featherfall
	name = "Featherfall"
	desc = "Slow your descent when falling."
	node_x = DOWN_X_RIGHT + 50
	node_y = DOWN_Y_TIER_2
	spell_type = /datum/action/cooldown/spell/undirected/feather_falling

/datum/spell_node/slowdown_aoe
	name = "Mass Slowdown"
	desc = "Slow multiple creatures in an area."
	node_x = DOWN_X_RIGHT + 50
	node_y = DOWN_Y_TIER_2 - 50
	prerequisites = list(/datum/spell_node/featherfall)
	spell_type = /datum/action/cooldown/spell/aoe/on_turf/ensnare

/datum/spell_node/fetch
	name = "Fetch"
	desc = "Magically retrieve distant objects."
	node_x = DOWN_X_LEFT
	node_y = DOWN_Y_TIER_2
	spell_type = /datum/action/cooldown/spell/projectile/fetch

/datum/spell_node/arcane_bolt
	name = "Arcane Bolt"
	desc = "Launch a bolt of pure magical energy."
	node_x = DOWN_X_LEFT -50
	node_y = DOWN_Y_TIER_2
	spell_type = /datum/action/cooldown/spell/projectile/arcyne_bolt

/datum/spell_node/arcyne_storm
	name = "Arcane Storm"
	desc = "Unleash a devastating storm of magical energy."
	node_x = DOWN_X_LEFT -25
	node_y = DOWN_Y_TIER_3
	prerequisites = list(/datum/spell_node/arcane_bolt, /datum/spell_node/fetch)
	spell_type = /datum/action/cooldown/spell/aoe/on_turf/arcyne_storm

/datum/spell_node/light
	name = "Light"
	desc = "Create a magical source of illumination."
	node_x = -100
	node_y = 0
	spell_type = /datum/action/cooldown/spell/undirected/conjure_item/light

/datum/spell_node/darkvision
	name = "Darkvision"
	desc = "Grant the ability to see in darkness."
	node_x = LEFT_X_TIER_1 - 30
	node_y = 0
	spell_type = /datum/action/cooldown/spell/undirected/touch/darkvision

/datum/spell_node/guidance
	name = "Guidance"
	desc = "Provide divine assistance to aid in tasks."
	node_x = LEFT_X_TIER_2
	node_y = LEFT_Y_LEFT
	prerequisites = list(/datum/spell_node/earth_affinity)
	spell_type = /datum/action/cooldown/spell/status/guidance

/datum/spell_node/magic_stone
	name = "Magician's Brick"
	desc = "Conjure a magical brick in your hand"
	node_x = LEFT_X_TIER_2
	node_y = LEFT_Y_LEFT - 50
	prerequisites = list(/datum/spell_node/earth_affinity)
	spell_type = /datum/action/cooldown/spell/undirected/conjure_item/brick

/datum/spell_node/flower_field
	name = "Flower Field"
	desc = "Summons a field of flowers"
	node_x = LEFT_X_TIER_3
	node_y = LEFT_Y_LEFT - 50
	prerequisites = list(/datum/spell_node/magic_stone)
	spell_type = /datum/action/cooldown/spell/aoe/on_turf/circle/flower_field

/datum/spell_node/lightning_bolt
	name = "Lightning Bolt"
	desc = "Strike your enemies with a bolt of lightning."
	node_x = LEFT_X_TIER_2
	node_y = LEFT_Y_RIGHT + 50
	prerequisites = list(/datum/spell_node/electric_affinity)
	spell_type = /datum/action/cooldown/spell/projectile/lightning

/datum/spell_node/mana_conservation
	name = "Mana Conservation"
	desc = "Learn to use magic more efficiently."
	cost = 5
	node_x = LEFT_X_TIER_3
	node_y = LEFT_Y_RIGHT
	prerequisites = list(/datum/spell_node/storm_caller)
	is_passive = TRUE

/datum/spell_node/mana_conservation/on_node_buy(mob/user)
	user.mana_pool?.set_natural_recharge(user.mana_pool.ethereal_recharge_rate + 0.1)
	to_chat(user, span_notice("You learn to channel magic more efficiently."))

/datum/spell_node/sundering_lightning
	name = "Sundering Lightning"
	desc = "Lightning that tears through magical defenses."
	node_x = LEFT_X_TIER_3
	node_y = LEFT_Y_RIGHT + 50
	prerequisites = list(/datum/spell_node/lightning_bolt, /datum/spell_node/mana_conservation)
	spell_type = /datum/action/cooldown/spell/sundering_lightning

/datum/spell_node/blade_burst
	name = "Blade Burst"
	desc = "Create a burst of spectral blades around you."
	node_x = LEFT_X_TIER_3
	node_y = LEFT_Y_LEFT
	prerequisites = list(/datum/spell_node/guidance)
	spell_type = /datum/action/cooldown/spell/blade_burst

/datum/spell_node/prestidigitation
	name = "Prestidigitation"
	desc = "Simple magical tricks and minor illusions."
	node_x = 0
	node_y = 100
	spell_type = /datum/action/cooldown/spell/undirected/touch/prestidigitation

/datum/spell_node/snap_freeze
	name = "Snap Freeze"
	desc = "Instantly freeze the moisture around a target."
	node_x = UP_X_RIGHT + 50
	node_y = UP_Y_TIER_1
	spell_type = /datum/action/cooldown/spell/aoe/on_turf/snap_freeze

/datum/spell_node/eldritch_blast //rename to something more noccian
	name = "Eldritch Blast"
	desc = "A crackling beam of otherworldly energy."
	node_x = UP_X_LEFT
	node_y = UP_Y_TIER_2
	spell_type = /datum/action/cooldown/spell/projectile/eldritch_blast

/datum/spell_node/encode_thoughts
	name = "Encode Thoughts"
	desc = "Extract a memory and crystallize it into a thought strand."
	node_x = UP_X_LEFT - 50
	node_y = UP_Y_TIER_2
	spell_type = /datum/action/cooldown/spell/undirected/list_target/encode_thoughts

/datum/spell_node/mind_sliver //feels more zizian?
	name = "Mind Spike"
	desc = "Drive a disorienting spike of psychic energy."
	node_x = UP_X_LEFT - 50
	node_y = UP_Y_TIER_3
	prerequisites = list(/datum/spell_node/encode_thoughts)
	spell_type = /datum/action/cooldown/spell/mind_spike

/datum/spell_node/gravity
	name = "Gravity"
	desc = "Manipulate gravitational forces."
	node_x = UP_X_LEFT
	node_y = UP_Y_TIER_3
	spell_type = /datum/action/cooldown/spell/gravity

/datum/spell_node/ray_of_frost
	name = "Ray of Frost"
	desc = "A frigid beam of blue-white light."
	node_x = UP_X_RIGHT
	node_y = UP_Y_TIER_2
	spell_type = /datum/action/cooldown/spell/beam/ray_of_frost

/datum/spell_node/chill_touch
	name = "Chill Touch"
	desc = "Create a ghostly, skeletal hand that weakens foes."
	node_x = UP_X_RIGHT + 50
	node_y = UP_Y_TIER_2
	spell_type = /datum/action/cooldown/spell/chill_touch

/datum/spell_node/frostbite
	name = "Frostbite"
	desc = "Cause numbing frost to form on a creature."
	node_x = UP_X_RIGHT + 50
	node_y = UP_Y_TIER_2 + 50
	prerequisites = list(/datum/spell_node/chill_touch)
	spell_type = /datum/action/cooldown/spell/status/frostbite

/datum/spell_node/frostbolt
	name = "Frostbolt"
	desc = "Launch a shard of ice at your enemy."
	node_x = UP_X_RIGHT
	node_y = UP_Y_TIER_3
	prerequisites = list(/datum/spell_node/ray_of_frost)
	spell_type = /datum/action/cooldown/spell/projectile/frost_bolt


/datum/spell_node/gib
	name = "Xylix's Cruel Prank"
	desc = "Fucked up and evil."
	node_x = -100000
	node_y = -100000
	is_passive = TRUE

/datum/spell_node/gib/on_node_buy(mob/user)
	. = ..()
	user.gib()
