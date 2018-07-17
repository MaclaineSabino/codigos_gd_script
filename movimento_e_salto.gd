extends KinematicBody2D

export (int) var speed = 200
var forca=150
var gravidade = 400
var velocidade_salto=forca

var sentido_queda = Vector2(0,1)
var velocity = Vector2()
var sent_pulo = Vector2(0,-1)
var pulo = false
var ativar_botao_push=true
var ray_cast
func queda():
	gravidade=gravidade+10
	return gravidade*sentido_queda
func _ready():
	ray_cast = get_node("RayCast2D")
	set_fixed_process(true)

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("direita"):
        velocity.x += 1
	if Input.is_action_pressed("esquerda"):
        velocity.x -= 1
	if Input.is_action_pressed('down'):
        velocity.y += 1
	if Input.is_action_pressed('up'):
        velocity.y -= 1
	
	
	

	velocity = velocity.normalized() * speed
	

func _fixed_process(delta):
	if ray_cast.is_colliding():
		print("detectou")
		ativar_botao_push=true
		velocidade_salto=forca
		gravidade=400
		

	move(queda()*delta)
	get_input()
	move_and_slide(velocity)
	salto()
	
	
	
func salto():
	if Input.is_action_pressed("push") and ativar_botao_push:
		pulo = true
		ativar_botao_push=false
		
		
	if pulo:
		
		velocidade_salto = velocidade_salto-3
		move_and_slide(sent_pulo*velocidade_salto*10)
		if velocidade_salto<=0:
			
			pulo = false
	