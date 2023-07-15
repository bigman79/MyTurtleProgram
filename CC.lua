--Custom Computer Output--
function Write(mes)
    if mes == string then
        file = io.output()
        file:write(mes .. "\n")
    else
        mes2 = tostring(mes)
        file = io.output()
        file:write(mes .. "\n")
    end
end

function FindModem()
    for _, side in pairs(rs.getSides()) do
        if peripheral.getType(side) == "modem" then
            Write("Modem Found")
            rednet.open(side)
            Side = side
        end
    end
    if rednet.isOpen(Side) then
        Write("Rednet Open")
        Pinger = true
    else
        Pinger = false
        Write("Modem Not Found")
    end
end

function PingID()
    time = os.time()
    i = 1
    while Pinger == true do
        Timerid = os.startTimer(2)
        Event, Id = os.pullEventRaw("timer")
        if Id == Timerid then
            io.write(time.." Pinging: " .. i .."\n")
            i = i + 1
        end
    end
end

function Main()
    FindModem()
    PingID()
end

Main()
