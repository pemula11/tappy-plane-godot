extends CharacterBody2D

const GRAVITY: float = 1500.0
const POWER: float = -400.0
@onready var animation_player = $AnimationPlayer

#signal on_player_died
var _dead:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()
	
	if is_on_floor():
		die()


func fly():
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		animation_player.play("fly")

func  die():
	if _dead == true:
		return
	_dead = true
	$AnimatedSprite2D.stop()
	GameManager.on_game_over.emit()
	set_physics_process(false)


