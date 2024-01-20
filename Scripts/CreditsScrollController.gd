extends Node2D

@export var creditsPath: NodePath
@export var containerPath: NodePath
@export var speed: float

@onready var credits := get_node(creditsPath) as Control 
@onready var container := get_node(containerPath) as Control

# Called when the node enters the scene tree for the first time.
func _ready():
	var size = container.size
	var position = container.position
	credits.position.y = size.y + position.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var newYPosition = credits.position.y - delta * speed
	credits.position.y = newYPosition
