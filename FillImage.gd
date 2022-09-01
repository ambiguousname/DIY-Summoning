extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var image : Image;
var _imageRender : Image;
var _imgTexture : ImageTexture;

# Called when the node enters the scene tree for the first time.
func _ready():
	_imageRender = Image.new()
	_imageRender.copy_from(image);
	_imageRender.fill(Color(0, 0, 0, 0));
	
	image.lock();
	
	_imgTexture = ImageTexture.new();
	_imgTexture.create_from_image(image);
	
	self.texture = _imgTexture;

func fillAt(rect):
	_imageRender.blend_rect(image, rect, Vector2.ZERO);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	_imgTexture.create_from_image(_imageRender);
	self.texture = _imgTexture;
