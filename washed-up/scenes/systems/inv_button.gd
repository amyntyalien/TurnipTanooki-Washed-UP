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
	InventorySprite.visible = false
	CraftingSprite.visible = !CraftingSprite.visible
	
func _on_inv_button_pressed() -> void:
	#change_visibility()
	#Also doesnt work (same comment as on craft_button.gd
	pass
