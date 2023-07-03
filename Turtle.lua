function startup()
    --opens modem--
    peripheral.find("modem", function(name, wrapped)
        if wrapped.isWireless() then
            rednet.open(name)
        end
        
    end)
    --gets location--
    int = x,y,z;
    x,y,z = gps.locate(5);
    if(gps.locate == nil)then
    turtle.print("GPS not found");
    else 
    turtle.print("GPS found");
    end 

    --listen for ping--
    local serverid

    local id, message = rednet.receive("ping",nill)
        if message == "ping" then
            rednet.send(id, "pong", "pong")    
            serverid = id;
        end
        
    

end


