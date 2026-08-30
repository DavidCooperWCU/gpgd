extends RigidBody2D

@onready var sound_player: AudioStreamPlayer2D = $SoundEffectPlayer

signal ball_popped(source)

func _ready() -> void:
	# area_entered fires for other Area2D nodes; body_entered fires for
	# PhysicsBody2D nodes (CharacterBody2D, RigidBody2D, StaticBody2D).
	body_entered.connect(_on_body_entered)
	#area_entered.connect(_on_area_entered)

func _on_body_entered(_body: Node2D) -> void:
	_play_sound()
	ball_popped.emit(self)
	

func _on_area_entered(_area: Area2D) -> void:
	_play_sound()

func _play_sound() -> void:
	# play() restarts from the beginning; if the sound is still playing from
	# a very recent trigger, this simply retriggers it.
	sound_player.play()
