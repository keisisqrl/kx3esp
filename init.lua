uart.setup(0,38400,8,0,1,0)
print("*** 5 sec to stop timer 0 ***")
tmr.alarm(0,5000,0,function()
  print("Starting KX3ESP...")
  dofile("main.lua")
end)
