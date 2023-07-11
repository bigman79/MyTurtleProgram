 --opens modem--
    function FindModem()
        for _, side in pairs(rs.getSides()) do
        if peripheral.getType(side) == "modem" then
        rednet.open(side)
        print("Rednet Open")
        else print("no modem")
        end
        end
    end
  
    function Getloc()
    --gets location--
    x,y,z = gps.locate(5);
    if(gps.locate == nil)then
    print("GPS not found");
    else 
    print("GPS found");
    end 
    end

   --listen for ping--
function Serverid()
    local id, message = rednet.receive("ping","ping")
        if message == "ping" then
            rednet.broadcast("pong", "pong")
            print("pong")    
            serid = id;
        end
    end
       
    function Run()
    FindModem()
    Getloc()
    Serverid()
    end

    Run()


