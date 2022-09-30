extends Control

export var arrows = "lrud";
export var arrowTex : Texture;

func setArrows(arrows_string):
	arrows = arrows_string;
	_updateArrows();


func clearArrows():
	for child in get_children():
		remove_child(child);

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var arrow_to_press = 0;

var red = preload("res://ColorRed.tres");

func pressNextArrow(direction):
	var curr_arrow : TextureRect = get_child(arrow_to_press);
	if direction in curr_arrow.name:
		curr_arrow.material = red;
		arrow_to_press += 1;
	else:
		clearPressed();
	return get_child_count() - arrow_to_press;
	

func clearPressed():
	arrow_to_press = 0;
	for i in range(get_child_count()):
		var curr_arrow : TextureRect = get_child(i);
		curr_arrow.material = Material.new();

# Called when the node enters the scene tree for the first time.
func _ready():
	_updateArrows();

# Don't remove old arrows, keep them rendered.
func _updateArrows():
	# Making sure we're centered:
	if (arrows.length() > 1):
		var rightOffset = arrowTex.get_size().x/2;
		var offsetToAdd = rightOffset * (arrows.length() - 1);
		rect_position -= Vector2(offsetToAdd, 0);
	
	var arr = [];
	for a in arrows:
		var arrow = TextureRect.new();
		arrow.texture = arrowTex;
		arrow.name = a;
		add_child(arrow);
		arr.append(arrow);
	
	yield(get_tree(), "idle_frame");
	for arrow in arr:
		# Scaling to fake margins because I have a limited amount of time, I don't have time to futz with
		# grid padding:
		arrow.rect_scale = Vector2(0.7, 0.7);
		arrow.rect_pivot_offset = Vector2(arrow.rect_size.x/2, arrow.rect_size.y/2);
		if "l" in arrow.name:
			arrow.set_rotation(-PI/2);
		elif "r" in arrow.name:
			arrow.set_rotation(PI/2);
		elif "d" in arrow.name:
			arrow.set_rotation(PI);
