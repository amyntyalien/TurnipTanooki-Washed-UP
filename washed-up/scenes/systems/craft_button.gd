extends Button

@onready var InventorySprite = $"..../Inventory"
@onready var CraftingSprite = $"..../Crafting"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_visibility():
	InventorySprite.visible = !InventorySprite.visible
	CraftingSprite.visible = !CraftingSprite.visible



func _on_craft_button_pressed() -> void:
	#change_visibility()
	#my nodes are null but im not sure why
	pass
