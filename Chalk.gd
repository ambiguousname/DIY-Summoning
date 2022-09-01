extends Spatial
const FillImage = preload("res://FillImage.gd");

export var offset : Vector2;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var SummoningCircle : Spatial;

# Called when the node enters the scene tree for the first time.
func _ready():
	SummoningCircle = get_node("Spatial/MainGame/SummoningCircle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var summoningKids = SummoningCircle.get_children();
	for i in range(summoningKids.size()):
		var script = summoningKids[i].get_script();
		if script != null and summoningKids[i] is FillImage:
			summoningKids[i].fillAt(Rect2(Vector2(self.translation.x, self.translation.y) + offset, Vector2(10, 10)));
