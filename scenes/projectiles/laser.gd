extends Area2D

@export var speed = 1000
var direction: Vector2 = Vector2.UP

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    $SelfDestroyTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    position += speed * direction * delta


func _on_body_entered(body: Node2D) -> void:
    if "hit" in body:
        body.hit()
    queue_free()


func _on_timer_timeout() -> void:
    queue_free()
