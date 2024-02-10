extends Node2D

var RopeSeg = preload("res://Parts/rope_seg.tscn")
var seg_length := 6.0
var rope_parts := []
var rope_close_tolerance := 8.0
var rope_points : PoolVector2Array = []
var rope_colors : PoolColorArray = []
var rope_to_left := true
var active_rope_id : int = -INF setget set_active_rope_id

var color1 := Color.coral
var color2 := Color.black

onready var rope_start_seg = $RopeStartPiece
onready var rope_end_seg = $RopeEndPiece
onready var rope_start_joint = $RopeStartPiece/RopeCol/RopeJoint
onready var rope_end_joint = $RopeEndPiece/RopeCol/RopeJoint


func _process(_delta):
	get_rope_points()
	if rope_points.size() > 2:
		update()


func set_active_rope_id(value:int):
	if active_rope_id != value:
		active_rope_id = value
		if active_rope_id == -INF:
			for i in rope_parts:
				(i as RigidBody2D).mass = 1
		else:
			for i in len(rope_parts):
				if i == active_rope_id:
					(rope_parts[i] as RigidBody2D).mass = 10
				else:
					(rope_parts[i] as RigidBody2D).mass = 1


func spawn_rope(start_pos:Vector2, end_pos:Vector2):
	rope_start_seg.global_position = start_pos
	rope_end_seg.global_position = end_pos
	start_pos = rope_start_joint.global_position
	end_pos = rope_end_joint.global_position
	rope_to_left = start_pos.x < end_pos.x
	
	var distance = start_pos.distance_to(end_pos)
	var segs_amount = round(distance / seg_length)
	var spawn_angle = (end_pos-start_pos).angle() - PI/2
	
	create_rope(segs_amount, rope_start_seg, end_pos, spawn_angle)


func create_rope(segs_amount:int, parent:Object, end_pos:Vector2, spawn_angle:float) -> void:
	rope_colors.append(color1)
	var last_color
	for i in segs_amount:
		last_color = color2 if i % 2 == 0 else color1
		rope_colors.append(last_color)
		
		parent = add_seg(parent, i, spawn_angle)
		parent.set_name("rope_seg_"+str(i))
		rope_parts.append(parent)
		
		var joint_pos = parent.get_node("RopeCol/RopeJoint").global_position
		if joint_pos.distance_to(end_pos) < rope_close_tolerance:
			break
	
	last_color = color1 if last_color == color2 else color2
	rope_colors.append(last_color)
	
	rope_end_joint.node_a = rope_end_seg.get_path()
	rope_end_joint.node_b = rope_parts[-1].get_path()
	

func add_seg(parent:Object, id:int, spawn_angle:float) -> RopeSeg:
	var joint : PinJoint2D = parent.get_node("RopeCol/RopeJoint") as PinJoint2D
	var seg : RopeSeg = RopeSeg.instance() as RopeSeg
	seg.global_position = joint.global_position
	seg.rotation = spawn_angle
	seg.parent = self
	seg.id = id
	add_child(seg)
	joint.node_a = parent.get_path()
	joint.node_b = seg.get_path()
	return seg

func get_rope_points() -> void:
	rope_points = []
	rope_points.append( rope_start_joint.global_position )
	for r in rope_parts:
		rope_points.append( r.global_position )
	rope_points.append( rope_end_joint.global_position )


func _draw():
	if rope_points.size() > 2:
		draw_polyline_colors(rope_points, rope_colors, 2.0, false)
