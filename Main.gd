extends Spatial

var Arrows = preload("res://Arrows.gd");

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var top_arrows;
var bottom_arrows;

var is_top = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	top_arrows = get_node("/root/GUI/ArrowsUp");
	bottom_arrows = get_node("/root/GUI/ArrowsDown");


func _pressArrow(dir):
	if is_top:
		if top_arrows.pressNextArrow(dir) == 0:
			is_top = false;
	else:
		if bottom_arrows.pressNextArrow(dir) == 0:
			MicrogameJamController.WinGame();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left"):
		_pressArrow("left");
	elif Input.is_action_just_pressed("right"):
		_pressArrow("right");
	elif Input.is_action_just_pressed("up"):
		_pressArrow("up");
	elif Input.is_action_just_pressed("down"):
		_pressArrow("down");
