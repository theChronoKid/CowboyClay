//x_offset = -800;
//y_offset = -720;

cam = view_camera[0];

x = obj_player.x;
y = obj_player.y;

cam_width = camera_get_view_width(cam);
cam_height = camera_get_view_height(cam);

if instance_exists(obj_cam_anchor)
{
	if place_meeting(x,y,obj_cam_anchor)
	{
		a = instance_nearest(x,y,obj_cam_anchor);
		x = a.x;
		y = a.y;
	}
}

camera_set_view_pos(cam,x-camera_get_view_width(cam)/2,y-camera_get_view_height(cam)/2);