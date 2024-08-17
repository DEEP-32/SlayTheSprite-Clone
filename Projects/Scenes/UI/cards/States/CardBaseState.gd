extends CardState
class_name CardBaseState

func Enter() -> void:
	if !cardUi.is_node_ready():
		await cardUi.ready
	
	cardUi.reparent_requested.emit(cardUi)
	cardUi.colorRect.color = Color.WEB_GREEN
	cardUi.state.text = "BASE"
	cardUi.pivot_offset = Vector2.ZERO
	print("CARD STATE :ENTERING : base state")

func OnGuiInput(event : InputEvent) -> void:
	if Input.is_action_just_pressed("left_click"):
		cardUi.pivot_offset = cardUi.get_global_mouse_position() - cardUi.global_position
		transition_requested.emit(self,CardState.State.CLICKED)
