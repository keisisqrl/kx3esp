-- Steps:
--
-- 1. Init wifi module
-- 2. Init AP config
-- 3. config UART for 38400 baud (KX3 default), register callback
-- 4. Open server socket
-- 5. Begin findme broadcast, 15s interval

-- Socket lives in a global
s=nil

-- Callbacks
function toNet(d)
    if s then:
        s.send(data,nil)
    end
end

function fromNet(s, d)
    uart.write(0,d)
end

function newConn(c)
    s = c
    c:on("receive", fromNet)
    c:on("disconnection", function(_)
        if s == c then
            s = nil
        end
    end)
end

-- Configure the wifi
wifi.setmode(wifi.STATIONAP)

wifi.startsmart(nil, function() end)

-- Configure the AP
wifi.ap.config({ssid="KX3ESP", pwd="remote"})

-- Configure UART
uart.setup(0,38400,8,0,1,0)

-- Register callback for UART
uart.on("data",0,toNet,0)

-- Open server socket
ss = net.createServer(net.TCP,60)
ss:listen(2001, newConn)

-- Begin discovery broadcast
us = net.createConnection(net.UDP,0)
us:connect(5000,"255.255.255.255")
tmr.alarm(3, 15000, 1, function()
    us:send("KX3ESP is here!", function(_) end)
end)
