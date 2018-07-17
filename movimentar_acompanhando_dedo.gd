extends RigidBody2D



var diferenca_x = 0
var diferenca_y = 0



func _ready():
	
	set_process_input(true)
	
	
	
	
func _input(event):
	
	if event.is_action_pressed("touch"):
		
		diferenca_x=event.x-get_pos().x
		if(event.y>=get_pos().y):
			diferenca_y=abs(event.y-get_pos().y)
		else:
			diferenca_y=event.y-get_pos().y
		
				
	if(event.type==InputEvent.SCREEN_DRAG):
			
		movimento(event.x-diferenca_x,event.y-diferenca_y)
		
		
			
			
func movimento(x,y):
	if(x<68):
		x=68
	if x>648:
		x=648
		
	if y>1100:
		y=1100
	if y<224:
		y=224
	
	
	

	set_pos(Vector2(x,y))
	
	
	
	
	






	
	
	
