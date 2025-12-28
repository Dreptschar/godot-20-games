extends CanvasLayer

@onready var label: Label = %Label

var start_time := Time.get_ticks_msec()


func _process(_delta):
	var elapsed_ms := Time.get_ticks_msec() - start_time
	label.text = format_time(elapsed_ms / 1000.0)


func format_time(t: float) -> String:
	var minutes := int(t) / 60
	var seconds := int(t) % 60
	var millis := int((t - int(t)) * 100)

	return "%02d:%02d.%02d" % [minutes, seconds, millis]
