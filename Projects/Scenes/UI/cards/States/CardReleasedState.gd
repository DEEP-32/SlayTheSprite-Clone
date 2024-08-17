extends CardState
class_name CardReleasedState

var played : bool

func Enter() -> void:
	cardUi.colorRect.color = Color.DARK_VIOLET
	cardUi.state.text = "RELEASED"
	
	played = false
	
	if not cardUi.targets.is_empty():
		played = true


func OnInput(event : InputEvent) -> void:
	if played:
		return
	
	transition_requested.emit(self,CardState.State.BASE)
