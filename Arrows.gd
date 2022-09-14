extends Control

export var arrows = "lr";
export var arrowTex : Texture;

func setArrows(arrows_string):
	arrows = arrows_string;
	_updateArrows();

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	_updateArrows();

# Don't remove old arrows, keep them rendered.
func _updateArrows():
	var arr = [];
	for a in arrows:
		var arrow = TextureRect.new();
		arrow.name = a;
		arrow.texture = arrowTex;
		add_child(arrow);
		arr.append(arrow);
	
	yield(get_tree(), "idle_frame");
	for arrow in arr:
		arrow.rect_pivot_offset = Vector2(arrow.rect_size.x/2, arrow.rect_size.y/2);
		match(arrow.name):
			"l":
				arrow.set_rotation(-PI/2);
			"r":
				arrow.set_rotation(PI/2);
			"d":
				arrow.set_rotation(PI);
