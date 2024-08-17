extends CardState
class_name CardClickedState

func Enter() -> void:
	cardUi.colorRect.color = Color.ORANGE
	cardUi.state.text = "CLICKED"
	cardUi.dropPointDetector.monitoring = true
	print("CARD STATE :ENTERING : base state")


func OnInput(event : InputEvent) -> void:
	if event is InputEventMouseMotion:
		transition_requested.emit(self,CardState.State.DRAGGING)
