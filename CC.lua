--FrontEnd--

--FrontEnd--
function FindMoniter()
    for _, side in pairs(rs.getSides()) do
        if peripheral.getType(side) == "moniter" then
            m1 = peripheral.wrap("moniter")
        end
    end
end

function printing()

end


function displayStartup()

end






--BackEnd--

function FindModem()
    for _, side in pairs(rs.getSides()) do
        if peripheral.getType(side) == "modem" then
            rednet.open(side)  
        end
        if rednet.isOpen(side) then
            Pinger = true
        else
            Pinger = false
        end
    end
end

function PingID()
    i = 1
    while Pinger == true do
        Timerid = os.startTimer(2)
        Event, Id = os.pullEventRaw("timer")
        if Id == Timerid then
            rednet.broadcast("ping", "ping")
            i = i + 1
        end
    end
end

function Main()
    FindModem()
    PingID()
end

Main()
