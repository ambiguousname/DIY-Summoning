extends Spatial
const FillImage = preload("res://FillImage.gd");

export var offset : Vector2;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var SummoningCircle : Spatial;

var Follower : PathFollow;

# Called when the node enters the scene tree for the first time.
func _ready():
	SummoningCircle = get_node("/root/Spatial/MainGame/Summoning Circle")
	Follower = get_parent()
	print(self.global_translation)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Follower.offset += 0.01 * delta;
	
	var summoningKids = SummoningCircle.get_children();
	for i in range(summoningKids.size()):
		var script = summoningKids[i].get_script();
		if script != null and summoningKids[i] is FillImage:
			var pos = Vector2(-851 * self.global_translation.x + 350, -909 * self.global_translation.z - 80) + offset;
			# The image is 600 x 600, so we make sure to flip it:
			pos = Vector2(pos.x, (300 - pos.y) + 300);
			summoningKids[i].fillAt(pos, Vector2(200, 200));
