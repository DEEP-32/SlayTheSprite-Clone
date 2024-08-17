extends CardState

const DRAG_MINIMUM_THRESHOLD := 0.05
var minimumDragTimeElapsed : bool = false

func Enter() -> void:
	
	var uiLayer = get_tree().get_first_node_in_group("UiLayer")
	if uiLayer:
		cardUi.reparent(uiLayer)
	
	cardUi.colorRect.color = Color.NAVY_BLUE
	cardUi.state.text = "DRAGGING"
	
	minimumDragTimeElapsed = false
	var timer : SceneTreeTimer = get_tree().create_timer(DRAG_MINIMUM_THRESHOLD,false)
	timer.timeout.connect(func() : minimumDragTimeElapsed = true)
	
	
	print("CARD STATE :ENTERING : dragging state")


func OnInput(event : InputEvent) ->void:
	var mouseMotion := event is InputEventMouseMotion
	var cancel = event.is_action_pressed("right_click")
	var confirm = event.is_action_released("left_click") or event.is_action_pressed("left_click")
	
	if mouseMotion:
		cardUi.global_position = cardUi.get_global_mouse_position() - cardUi.pivot_offset
	
	if cancel:
		print("CARD STATE : chaging from dragging state to base state")
		transition_requested.emit(self,CardState.State.BASE)
	elif minimumDragTimeElapsed and confirm:
		print("CARD STATE : chaging from dragging state to released state")
		
		get_viewport().set_input_as_handled()
		transition_requested.emit(self,CardState.State.RELEASED)
