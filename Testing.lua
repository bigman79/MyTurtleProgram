--listen for ping--
function Serverid()
    local id, message = rednet.receive("ping","ping")
        if message == "ping" then
            rednet.broadcast("pong", "pong")
            print("pong")    
            serid = id;
        end
    end
    
Serverid()
