/datum/martial_art/cowalker
	name = "Cowalker"
	id = MARTIALART_COWALKER

/datum/martial_art/cowalker/activate_style(mob/living/new_holder)
	. = ..()
	RegisterSignal(new_holder, COMSIG_ATOM_PRE_BULLET_ACT, PROC_REF(hit_by_projectile))

/datum/martial_art/cowalker/deactivate_style(mob/living/remove_from)
	UnregisterSignal(remove_from, COMSIG_ATOM_PRE_BULLET_ACT)
	return ..()

/datum/martial_art/cowalker/proc/hit_by_projectile(mob/living/A, obj/projectile/P, def_zone)
	if(iskindred(A) && A.temporis_visual == TRUE)
		if((secret_vampireroll(get_a_dexterity(A)+get_celerity_dices(A), 6)) >= 3)
			A.visible_message("<span class='danger'>The projectiles seem to phase through [A]! You shot at the wrong copy!</span>", "<span class='userdanger'>They shot the wrong you!</span>")
			playsound(get_turf(A), pick('sound/weapons/bulletflyby.ogg', 'sound/weapons/bulletflyby2.ogg', 'sound/weapons/bulletflyby3.ogg'), 75, TRUE)
			return BULLET_ACT_FORCE_PIERCE
		return BULLET_ACT_HIT
	else if(iskindred(A) && A.temporis_blur == TRUE)
		A.visible_message("<span class='danger'>[A] moved out of the way before you even pulled the trigger! They can move faster than your shots!</span>", "<span class='userdanger'>You stepped out of the way of the bullets!</span>")
		playsound(get_turf(A), pick('sound/weapons/bulletflyby.ogg', 'sound/weapons/bulletflyby2.ogg', 'sound/weapons/bulletflyby3.ogg'), 75, TRUE)
		return BULLET_ACT_FORCE_PIERCE
	return BULLET_ACT_HIT
