/obj/item
	var/onflooricon
	var/onflooricon_state
	var/body_worn = FALSE

	//lombard.dm VARIABLES
	///Determines whether an item can be sold in the black market.
	var/illegal = FALSE

	//gridventory.dm VARIABLES
	///Width we occupy on the gridventory hud - Keep null to generate based on w_class
	var/grid_width = 1 GRID_BOXES
	///Height we occupy on the gridventory hud - Keep null to generate based on w_class
	var/grid_height = 1 GRID_BOXES

	///If this item is made out of "cold iron" and harms fairy creatures or yang-disbalanced cathayans
	var/is_iron = FALSE
	///If this item is made out of "wood" and harms yin-disbalanced cathayans
	var/is_wood = FALSE
	///If this item is magical and thus picked up on magic senses
	var/is_magic = FALSE

/obj/item/proc/update_bodyfied(mob/living/carbon/human/human)
	if(body_worn)
		if(human.body_sprite)
			worn_icon = human.body_sprite
		else
			worn_icon = initial(worn_icon)

/obj/item/equipped(mob/M, slot)
	if(onflooricon)
		icon = initial(icon)
		pixel_w = initial(pixel_w)
		update_icon()
	if(body_worn && ishuman(M))
		var/mob/living/carbon/human/BS = M
		if(BS.body_sprite)
			worn_icon = BS.body_sprite
		else
			worn_icon = initial(worn_icon)
		update_icon()
	..()

/obj/item/dropped(mob/M)
	if(onflooricon && isturf(loc))
		icon = onflooricon
		worn_icon = initial(worn_icon)
		pixel_w = 0
		cut_overlays()
		if(onflooricon_state)
			icon_state = onflooricon_state
		update_icon()
	..()

/obj/item/Initialize(mapload)
	..()
	if(onflooricon && isturf(loc))
		icon = onflooricon
		update_icon()
	if(onflooricon_state)
		icon_state = onflooricon_state
		update_icon()
