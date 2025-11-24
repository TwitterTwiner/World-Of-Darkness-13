/mob/living/carbon/human/npc/proc/CheckMove(hardlock = FALSE)
	if(stat >= HARD_CRIT)
		return TRUE
	if(last_grab+15 > world.time && !hardlock)
		return TRUE
	if(ghoulificated)
		return TRUE
	if(key)
		return TRUE
	if(IsSleeping())
		return TRUE
	if(IsUnconscious())
		return TRUE
	if(IsParalyzed())
		return TRUE
	if(IsKnockdown())
		return TRUE
	if(IsStun())
		return TRUE
	if(HAS_TRAIT(src, TRAIT_RESTRAINED))
		return TRUE
	if(is_talking)
		return TRUE
	if(pulledby && !hardlock)
		if(HAS_TRAIT(pulledby, TRAIT_CHARMER))
			return TRUE
		if(prob(30))
			resist()
			return TRUE
		else
			return TRUE
	return FALSE
