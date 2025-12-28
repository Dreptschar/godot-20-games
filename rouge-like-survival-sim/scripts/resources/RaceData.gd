extends Resource

class_name RaceData

@export var id: StringName
@export var name: String
@export var description: String

# Modifier to base stats
@export var stat_bonuses: Dictionary = {
	DefaultEnums.STATS.STR: 0,
	DefaultEnums.STATS.INT: 0,
	DefaultEnums.STATS.CONS: 0,
	DefaultEnums.STATS.DEX: 0,
	DefaultEnums.STATS.LU: 0
}

# Modifier how likely or unlikely a class is picked by this race
@export var class_modifiers: Dictionary = {}

# Tags a race starts with
@export var tags: Array[StringName] = []

# Features a Race is affinit to
@export var physical_condition_modifiers: Dictionary = {}
@export var psychical_condition_modifiers: Dictionary = {}
