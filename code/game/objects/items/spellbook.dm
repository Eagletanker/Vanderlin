/**
 * Spellbooks for swapping spells
 * should be uncraftable
 *  You only get one. Guard your notes with your life.
 */

/obj/item/book/granter/spellbook
	icon = 'icons/roguetown/items/books.dmi'
	icon_state = "spellbookbrown_0"
	slot_flags = ITEM_SLOT_HIP
	unique = TRUE
	firefuel = 2 MINUTES
	dropshrink = 0.6
	drop_sound = 'sound/foley/dropsound/book_drop.ogg'
	force = 5
	associated_skill = /datum/skill/misc/reading
	name = "Magician's Grimore"
	desc = "A thick notebook. It has been filled to the brim with notes on the acryne."
	oneuse = FALSE
	var/owner = null
	var/list/allowed_readers = list()
	var/stored_gem = FALSE
	var/picked // if the book has had it's style picked or not
	var/bookquality = 1
	sellprice = 75

/obj/item/book/granter/spellbook/getonmobprop(tag)
	. = ..()
	if(tag)
		if(open)
			switch(tag)
				if("gen")
					return list("shrink" = 0.4,
	"sx" = -2,
	"sy" = -3,
	"nx" = 10,
	"ny" = -2,
	"wx" = 1,
	"wy" = -3,
	"ex" = 5,
	"ey" = -3,
	"northabove" = 0,
	"southabove" = 1,
	"eastabove" = 1,
	"westabove" = 0,
	"nturn" = 0,
	"sturn" = 0,
	"wturn" = 0,
	"eturn" = 0,
	"nflip" = 0,
	"sflip" = 0,
	"wflip" = 0,
	"eflip" = 0)
				if("onbelt")
					return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
		else
			switch(tag)
				if("gen")
					return list("shrink" = 0.4,
	"sx" = -2,
	"sy" = -3,
	"nx" = 10,
	"ny" = -2,
	"wx" = 1,
	"wy" = -3,
	"ex" = 5,
	"ey" = -3,
	"northabove" = 0,
	"southabove" = 1,
	"eastabove" = 1,
	"westabove" = 0,
	"nturn" = 0,
	"sturn" = 0,
	"wturn" = 0,
	"eturn" = 0,
	"nflip" = 0,
	"sflip" = 0,
	"wflip" = 0,
	"eflip" = 0)
				if("onbelt")
					return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/book/granter/spellbook/attack_self(mob/user, params)
	if(!open)
		attack_hand_secondary(user, params)
		return
	..()
	user.update_inv_hands()

/obj/item/book/granter/spellbook/attack_self_secondary(mob/user, params)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	attack_hand_secondary(user, params)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/item/book/granter/spellbook/read(mob/user)
	return FALSE

/obj/item/book/granter/spellbook/attack_hand_secondary(mob/user, params)
	if(!picked)
		var/list/designlist = list("green", "yellow", "brown")
		var/mob/living/carbon/human/gamer = user
		if(gamer.job == "Court Magician")
			designlist = list("steel", "gem", "skin", "mimic")
		var/the_time = world.time
		var/design = input(user, "Select a design.","Spellbook Design") as null|anything in designlist
		if(!design)
			return
		if(world.time > (the_time + 30 SECONDS))
			return
		base_icon_state = "spellbook[design]"
		update_appearance(UPDATE_ICON_STATE)
		picked = TRUE
		return
	if(owner == null)
		owner = user
	if(!open)
		slot_flags &= ~ITEM_SLOT_HIP
		open = TRUE
		playsound(loc, 'sound/items/book_open.ogg', 100, FALSE, -1)
	else
		slot_flags |= ITEM_SLOT_HIP
		open = FALSE
		playsound(loc, 'sound/items/book_close.ogg', 100, FALSE, -1)
	curpage = 1
	update_appearance(UPDATE_ICON_STATE)
	user.update_inv_hands()

/obj/item/book/granter/spellbook/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]_[open]"

/obj/item/book/spellbook/proc/change_spells(mob/user = usr)
	var/datum/mind/user_mind = user.mind
	if(!user_mind) return // How??
	if(user_mind.has_changed_spell)
		to_chat(user, span_warning("I have already unbinded my spells today!"))
		return
	var/list/resettable_spells = list()
	var/list/spell_list = user_mind.spell_list
	for(var/i = 1, i <= spell_list.len, i++)
		var/obj/effect/proc_holder/spell/spell = spell_list[i]
		if(spell.refundable == TRUE)
			if(spell.cost > 0)
				resettable_spells["[spell.name]: [spell.point_cost]"] = spell_list[i]
	if(!resettable_spells.len)
		to_chat(user, span_warning("I have no spells to unbind!"))
		return
	user_mind.has_changed_spell = TRUE //To pre-empt a halting duplication in the for loop here
	var/unlearn_success = FALSE
	for(var/i = 1, i <= 2, i++)
		var/choice = input(user, "Choose up to two spells to unbind. Cancel both to not use up your daily unbinding.") as null|anything in resettable_spells
		var/obj/effect/proc_holder/spell/item = resettable_spells[choice]
		if(!item)
			break
		if(!resettable_spells.len)
			return
		if(user_mind.RemoveSpell(item))
			user_mind.used_spell_points -= item.cost
			unlearn_success = TRUE
		resettable_spells.Remove(choice)
		user_mind.check_learnspell()
	if(!unlearn_success)
		user_mind.has_changed_spell = FALSE //If we didn't unlearn anything, reset

/obj/item/book/granter/spellbook/onlearned(mob/user)
	used = FALSE

/// Book Type:

/obj/item/book/granter/spellbook/courtmage	//Both heartfelt and normal CM get this.
	name = "Court Magician's Griomire"
	desc = "A well worn notebook. It has been filled with a complex script detailing notes of the acryne. It might just be bad handwriting, however."
	bookquality = 2
	sellprice = 150

// helper proc


/obj/item/book/granter/spellbook/magician/Initialize()
	. = ..()
	var/mob/living/carbon/human/L = loc
	owner = L
