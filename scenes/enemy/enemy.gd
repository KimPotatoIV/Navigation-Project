extends CharacterBody2D

##################################################
const MOVING_SPEED = 200.0

var player: Node2D = null
var nav_agent_node: NavigationAgent2D

##################################################
func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	
	nav_agent_node = $NavigationAgent2D

##################################################
func _process(delta: float) -> void:
	if player:
		nav_agent_node.target_position = player.global_position
		
		var next_position = nav_agent_node.get_next_path_position()
		if next_position:
			var direction = (next_position - global_position).normalized()
			velocity = direction * MOVING_SPEED
			
			move_and_slide()
