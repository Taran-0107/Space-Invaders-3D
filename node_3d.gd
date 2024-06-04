extends Node3D

var player_bullet = preload("res://bullet.tscn")
var enemy_bullet = preload("res://enemy_bullet.tscn")
var star_scene=preload("res://star.tscn")
var enemy_scene=preload("res://bob_enemy1.tscn")
var powerup_scene=preload("res://healthpickup.tscn")
var ship1
var textanimplayer
var textlabel
var enemies=[]
var bullets = []
var wave
var gameover=false
var flag=true
var waiting=false
const maxwaves=5

var waitforbullet=0;

func random_in_a_box(box_size):
		var rand_x=randi_range(-box_size,box_size)
		var rand_y=randi_range(-box_size,box_size)
		var rand_z=randi_range(-box_size,box_size)
		return Vector3(rand_x,rand_y,rand_z)
		
func spawn_object(object_scene,count,range,object_list=null):
	for i in range(count):
		var ob=object_scene.instantiate()
		ob.position=random_in_a_box(range)
		if object_list!=null:
			object_list.append(ob)
		add_child(ob)
		
func spawn_enemies(wave):
	const wl=[1,2,3,4,5]
	var count=wl[wave-1]
	spawn_object(enemy_scene,count,300,enemies)

func display_text(text_content):
	textlabel.text=text_content
	textanimplayer.play("textfading")
	
		
func _ready():
	
	#$AudioStreamPlayer.play()
	textanimplayer=$twistpivot/pitchpivot/Camera3D/Sprite3D3/AnimationPlayer
	textlabel=$twistpivot/pitchpivot/Camera3D/Sprite3D3/SubViewport/Label

	
	wave=1
	ship1 = $exie
	enemies=[]
	display_text("wave"+str(wave))
	spawn_enemies(wave)
	

func _process(delta):
	

	for i in enemies:
		if i==null:
			enemies.remove_at(enemies.find(i))
	
	if not gameover:
		
		if ship1==null:
			display_text("Game Over, you lose!")
			gameover=true
			return
	
		if enemies.is_empty() and flag and not waiting:
			flag=false
			
		
		if not flag:
			flag=true
			waiting=true
			display_text("wave"+str(wave)+" cleared")
			spawn_object(powerup_scene,4,30)
			await get_tree(). create_timer(7). timeout
			if wave>=maxwaves:
				display_text("Game Over, you win!")
				gameover=true
				return
			wave+=1
			display_text("wave"+str(wave))
			spawn_enemies(wave)
			
			waiting=false
		
	pass
		

