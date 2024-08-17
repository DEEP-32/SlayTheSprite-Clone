class_name CardUI
extends Control

signal reparent_requested(cardToReparent : CardUI)

@onready var colorRect : ColorRect = $Color
@onready var state : Label = $State
@onready var dropPointDetector : Area2D = $DropPointDetector
@onready var cardStateMachine : CardStateMachine = $CardStateMachine as CardStateMachine
var targets : Array[Node2D] = []

func _ready():
	cardStateMachine.Init(self)

func _input(event : InputEvent) -> void:
	cardStateMachine.OnInput(event)

func OnGuiInput(event : InputEvent) -> void:
	cardStateMachine.OnGuiInput(event)

func OnMouseEntered() -> void:
	cardStateMachine.OnMouseEntered()

func OnMouseExited() -> void:
	cardStateMachine.OnMouseExited()


func OnAreaEnteredToDropPoint(area):
	if not targets.has(area):
		targets.append(area)


func OnAreaExitedToDropPoint(area):
	targets.erase(area)
