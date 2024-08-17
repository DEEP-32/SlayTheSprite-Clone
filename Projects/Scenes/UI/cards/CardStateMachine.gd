extends Node
class_name CardStateMachine

@export var initialState : CardState

var currentState : CardState
var states : Dictionary = {}

func Init(card : CardUI) -> void:
	for child in get_children():
		#print("CARD STATE MACHINE : current children : " + str(child.name))
		if child is CardState:
			child = child as CardState
			states[child.state] = child
			child.transition_requested.connect(OnTransitionRequested)
			child.cardUi = card
	
	if initialState:
		initialState.Enter()
		currentState = initialState

func OnInput(event : InputEvent) -> void:
	if currentState:
		currentState.OnInput(event)

func OnGuiInput(event : InputEvent) -> void:
	if currentState:
		currentState.OnGuiInput(event)

func OnMouseEntered() -> void:
	if currentState:
		currentState.OnMouseEntered()

func OnMouseExited() -> void:
	if currentState:
		currentState.OnMouseExited()


func OnTransitionRequested(from : CardState, to : CardState.State):
	if from != currentState:
		print("CARD STATE MACHINE : returning becuase we are at the same state")
		return
	
	var newState : CardState = states[to]
	if not newState:
		print("CARD STATE MACHINE : returning becuase couldn't find the new state in dictionary")
		return
	
	if currentState:
		print("CARD STATE MACHINE : exiting current state : " + str(currentState.state))
		
		currentState.Exit()
	
	print("CARD STATE MACHINE : entering new state : " + str(newState.state))
	
	newState.Enter()
	currentState = newState
