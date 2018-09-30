start_time = os.time()
pw = io.open("outs", "w")
io.output(pw)
outs = 75.0
step = 300
for i =0, 8640000 do
  
    if (math.random() < 0.5) then
        outs = outs - math.random()  / 1000
    end
    if (math.random()  > 0.5) then
         outs = outs + math.random() / 1000
    end
    io.write(outs, "\n")
end
io.close(pw)

open_  = io.open("open", "w")
high_  = io.open("high", "w")
low_   = io.open("low", "w")
close_ = io.open("close", "w")
open1  =  0.0
high1  = 0.0
low1  = 0.0
close1 = 0.0
counter = 1
start = True
current  =  0.0
outs__ = io.open("outs", "r")
io.input(outs__)
while true do
        line = outs__:read()
        if line == nil then break end
        
        if ((math.fmod(counter, step) == 1)   and (start == True)) then
        low1 = tonumber(line)
        open1 = tonumber(line)
        high1 = tonumber(line)
        close1 =tonumber(line)
        start = False
        end
    if ((math.fmod(counter, step) == 1)   and (start == False)) then
        low1 = tonumber(line)
        high1 = tonumber(line)
        close1 =tonumber(line)
        start = False
        end
    if ((math.fmod(counter, step) == 0)) then
        close1 = tonumber(line)
        
        io.output(open_)
        io.write(tostring(open1),"\n")
        
         io.output(close_)
        io.write(tostring(close1),"\n")
        
         io.output(low_)
        io.write(tostring(low1),"\n")
        
         io.output(high_)
        io.write(tostring(high1),"\n")
     
        open1 = close1
      end
    current = tonumber(line)
    if (current > high1) then 
         high1 = current
         end
    if (current < low1) then 
         low1 = current
         end
    counter = counter + 1
    
    end

io.close(open_)
io.close(high_)
io.close(low_)
io.close(close_)

stop_time = os.time()
print("e;apsed time", tostring(stop_time-start_time))