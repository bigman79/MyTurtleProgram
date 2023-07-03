local function compArray()
    
    local computers = {}
    local miners = {}
    local attackers = {}
    local farmer = {}
    local crafting = {}
    local phoneid

    --opens modem--
    peripheral.find("modem", function(name, wrapped)
        if wrapped.isWireless() then
            rednet.open(name)
            if(rednet.isOpen == true)then
                print("Modem is open")
            else
                print("Modem is not open")
            end
        end
    end)

    --pings with Id--
    for i=1,i+1 do
    local timerid = os.startTimer(20)
    local event, id = os.pullEvent("timer")
    if id == timerid then
        rednet.broadcast("ping", "ping")
        for i=1,5 do
            print("Pinging")
        end
    end
    end

    --on recieve message--
    local id, message = rednet.receive("pong",nil)
        local mes = io.write(message)
        if(mes == "pong")then
            print("Pong recieved")
            table.insert(computers, id)
        else
            print("Pong not recieved")
        end
    

    --finds current phone--
    local id, message = rednet.receive("command", nil)
        local mes = io.write(message)
        if(mes == "Iphone")then
            phoneid = id
        end
    

    --parse through computers table--
    for i=1,#computers do
        rednet.send(computers[i], "what computer are you?", "command")   
    end
    local id, mes = rednet.receive("command", nil)
    local message = io.write(mes)    
    if message == "miner"then
        miners.insert(id)
        end
        if message == "Attacker"then
        attackers.insert(id)
        end
        if message == "Farmer" then
        farmer.insert(id)
        end
        farmer.insert(id)
        if message == "Crafting" then
        crafting.instert(id)    
        end   
         

end

function startup()
    compArray()
end

