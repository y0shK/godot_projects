extends ParallaxBackground

# https://www.youtube.com/watch?v=lvsX2PRUNXI
func _process(delta):
	scroll_base_offset -= Vector2(100, 0) * delta
