extends CanvasLayer


func change_scene(file:String) -> void:
    $AnimationPlayer.play("trans_to_black")
    await $AnimationPlayer.animation_finished
    get_tree().change_scene_to_file(file)
    $AnimationPlayer.play_backwards("trans_to_black")
