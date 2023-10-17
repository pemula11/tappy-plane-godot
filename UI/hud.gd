extends Control

@onready var label = $MarginContainer/Label


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_score_updated.connect(score_updated)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func score_updated():
	label.text = str(GameManager.get_score())
