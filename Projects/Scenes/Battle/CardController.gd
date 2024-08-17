extends HBoxContainer
class_name CardController

func _ready() -> void:
	for child in get_children():
		if child is CardUI:
			child =  child as CardUI
			child.reparent_requested.connect(OnCardReparentRequested)


func OnCardReparentRequested(card : CardUI) -> void:
	card.reparent(self,false)
