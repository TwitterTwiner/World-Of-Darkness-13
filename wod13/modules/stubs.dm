// TEMPORAL DEFINES, DATUMS ETC. WHILE BUILD TRANSFERING TO MODERN TG
/datum/species/kindred
	name = "Vampire"

SUBSYSTEM_DEF(city_time)
	name = "City Time"
	wait = 150
	priority = FIRE_PRIORITY_DEFAULT

	var/hour = 21
	var/minutes = 0

	var/timeofnight = "21:00"

/obj/item/stack/dollar
