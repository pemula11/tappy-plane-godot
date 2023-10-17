extends Node2D

@export var pipes_scene: PackedScene 

@onready var pipe_holder = $PipeHolder
@onready var spawn_u = $SpawnU
@onready var spawn_l = $SpawnL
@onready var spawn_timer = $SpawnTimer
@onready var game_over = $CanvasLayer/GameOver
@onready var engine_sound = $EngineSound
@onready var game_over_sound = $GameOverSound



# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_game_over.connect(on_game_over)
	GameManager.set_score(0)
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_pipes():
	var y_pos = randf_range(spawn_u.position.y, spawn_l.position.y)
	var new_pipes = pipes_scene.instantiate()
	
	new_pipes.position = Vector2(spawn_l.position.x, y_pos)
	pipe_holder.add_child(new_pipes)

func stop_pipe():
	spawn_timer.stop()
	for pipe in pipe_holder.get_children():
		pipe.set_process(false)

func _on_timer_timeout():
	spawn_pipes()


func on_game_over():
	stop_pipe()
	engine_sound.stop()
	game_over_sound.play()


