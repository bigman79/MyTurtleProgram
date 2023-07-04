
    
    local computers = {}
    local miners = {}
    local attackers = {}
    local farmer = {}
    local crafting = {}
    local phoneid

local function findModem()
    for _, side in pairs(rs.getSides()) do
    if peripheral.getType(side) == "modem" then
    rednet.open(side)
    print("Rednet Open")
    else print("no modem")
    end
    end
end
    

local function pingforID()
    
    
    Timerid = os.startTimer(20)
    local event, id = os.pullEvent("timer")
    if id == Timerid then
        rednet.broadcast("ping", "ping")
        Timerid = os.startTimer(20)
    end
end


local function onRecieve()
    
    local id, message,filter = rednet.receive("pong",nil)
        if(message == "pong")then
            print("Pong recieved")
            table.insert(computers, id)
        else
            print("Pong not recieved")
        end
end    

local function findPhone()
    local id, message,filter = rednet.receive("command", nil)
        if(message == "Iphone")then
            phoneid = id
        end
end   

local function parseComputers()
    
    for i=1,#computers do
        rednet.send(computers[i], "what computer are you?", "command")   
    end
    local id, message,filter = rednet.receive("command", nil)    
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
 findModem()
 pingforID()
 onRecieve()
 findPhone()
 parseComputers()   
end

