
lefthold = false;
shift = false;
ctrl = false;

local mouse = libs.mouse;
local keyboard = libs.keyboard;
local server = libs.server;

function update (r)
	--server.update({id = "touch", text = r });
end

actions.down = function ()
	update("down");
end

actions.up = function ()
	update("up");
end

actions.double = function ()
	update("double");
	mouse.double("left");
end

actions.tbup = function ()
	mouse.vscroll(-5);
end

actions.tbdown = function ()
	mouse.vscroll(5);
end

actions.clickstart = function ()
	mouse.down("left");
end

actions.clickend = function ()
	if (not lefthold) then
		mouse.up("left");
		server.update({id = "leftclickbtn", color = "grey"});
	end
	lefthold = false;
end

actions.clickhold = function ()
	mouse.down("left");
	server.update({id = "leftclickbtn", color = "red"});
	lefthold = true;
end

actions.rclickstart = function ()
	mouse.down("right");
end

actions.rclickend = function ()
	mouse.up("right");
end

actions.mclickstart = function ()
	mouse.down("middle");
end

actions.mclickend = function ()
	mouse.up("middle");
end

actions.delta = function  (id, x, y)
	update("delta: " .. x .. " " .. y);
	mouse.moveraw(x, y);
end

actions.left = function ()
	mouse.click("left");
end

actions.right = function ()
	mouse.click("right");
end

actions.run = function ()
	keyboard.stroke("w");
end

actions.rundown = function ()
	keyboard.down("w");
end

actions.runup = function ()
	keyboard.up("w");
end

actions.leftdown = function ()
	keyboard.down("a");
end

actions.leftup = function ()
	keyboard.up("a");
end

actions.rightdown = function ()
	keyboard.down("d");
end

actions.rightup = function ()
	keyboard.up("d");
end

actions.reversedown = function ()
	keyboard.down("s");
end

actions.reverseup = function ()
	keyboard.up("s");
end

actions.inventory = function ()
	keyboard.stroke("e");
end

actions.rotate = function ()
	keyboard.stroke("r");
end

actions.menu = function ()
	keyboard.stroke("escape");
end

actions.reseach = function ()
	keyboard.stroke("t");
end

actions.shifttoggle = function ()
	if (shift) then
		shift = false;
		keyboard.up("lshift");
		server.update({id = "shiftbtn", color = "green"});
	else
		shift = true;
		keyboard.down("lshift");
		server.update({id = "shiftbtn", color = "red"});
	end
end

actions.ctrltoggle = function ()
	if (ctrl) then
		ctrl = false;
		keyboard.up("lctrl");
		server.update({id = "ctrlbtn", color = "green"});
	else
		ctrl = true;
		keyboard.down("lctrl");
		server.update({id = "ctrlbtn", color = "red"});
	end
end
