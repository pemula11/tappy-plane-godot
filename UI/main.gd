extends Control


@onready var highscore = $MC/HBoxContainer/highscore


# Called when the node enters the scene tree for the first time.
func _ready():
	highscore.text = str( GameManager.get_high_score())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("fly"):
		GameManager.load_game_scene()
