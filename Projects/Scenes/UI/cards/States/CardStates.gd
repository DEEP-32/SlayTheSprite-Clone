extends Node
class_name CardState

enum State{
	BASE,
	CLICKED,
	DRAGGING,
	AIMING,
	RELEASED
}

signal transition_requested(from : CardState , to : State)

@export var state : State

var cardUi : CardUI

func Enter() -> void:
	pass

func Exit() -> void:
	pass

func OnInput(event : InputEvent)->void:
	pass

func OnGuiInput(event : InputEvent) -> void:
	pass

func OnMouseEntered()-> void:
	pass

func OnMouseExited() -> void:
	pass
