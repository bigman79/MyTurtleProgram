-- Custom Computer Output--
Computers = {}
Id = os.getComputerID()

function Write(mes, Types)
    if mes ~= nil then
        if Types == "Error" then
            term.setTextColor(colors.red)
        elseif Types == "Title" then
            term.setTextColor(colors.blue)
            mes = string.upper(mes)
            local x, y = term.getSize()
            local x2, y2 = term.getCursorPos()
            term.setCursorPos(math.abs((x / 2) - (mes:len() / 2)), y2)
            write(mes)
        elseif Types == "Info" then
            term.setTextColor(colors.green)
            mes = string.lower(mes)
        elseif Types == "Pinging" then
            term.setTextColor(colors.orange)
            mes = string.lower(mes)
        end
        if mes == string then
            file = io.output()
            file:write(mes .. "\n")
        else
            mes2 = tostring(mes)
            file = io.output()
            file:write(mes .. "\n")
        end
    else
        Write("Error: No Message")
    end
end

function ConfirmSeed(str)

end

function LoginDetails()
    -- add logic for this--
    Write("Enter ID & Passcode ", "Title")
    Write("Create Username", "Info")
    Username = read()
    Write("Create Password", "Info")
    Password = read("*")
    Write("Confirm Password", "Info")
    Confirm = read("*")
    if Password == Confirm then
        Write("password Confirmed", "Info")
        http.post("http://localhost:8080/login",Username.."\n" ..Password)
    else
        Write("passwords do not match", "Error")
        Write("Try Again", "Error")
        LoginDetails()
    end
end


function FindModem()
    for _, side in pairs(rs.getSides()) do
        if peripheral.getType(side) == "modem" then
            Write("Modem Found", "Title")
            rednet.open(side)
            Side = side
        end
    end
    if rednet.isOpen(Side) then
        Write("Rednet Open", "Info")
        Pinger = true
    else
        Pinger = false
        Write("Modem Not Found", "Error")
    end
end

function PingID()
    i = 1
    while Pinger == true do
        Timerid = os.startTimer(2)
        Event, Id = os.pullEventRaw("timer")
        if Id == Timerid then
            -- Fix this--
            time = tostring(os.epoch("local"))
            Write(time .. " Pinging: " .. i, "Pinging")
            i = i + 1
        end
    end
end

function Response()
    local Event, Id, Message, Distance = os.pullEventRaw("rednet_message")
    if Message == "Pong" then
        table.insert(Computers, Id)
        Write("recieved message from: " .. Id, "Title")
    end
end

function Main()
    LoginDetails()
    FindModem()
    PingID()
    Response()
end

Main()
