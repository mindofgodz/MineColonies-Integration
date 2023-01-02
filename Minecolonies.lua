local integrator = peripheral.find("colonyIntegrator") -- Finds the peripheral if one is connected

if integrator == nil then error("colonyIntegrator not found") end

if not integrator.isInColony then error("Block is not in a colony") end

mon = peripheral.find("monitor")
colony = peripheral.find("colonyIntegrator")
mouseWidth = 0
mouseHeight = 0
w,h = mon.getSize()
print(w)
print(h)

function centerText(text, line, txtback, txtcolor, pos)
    monX, monY = mon.getSize()
    mon.setBackgroundColor(txtback)
    mon.setTextColor(txtcolor)
    length = string.len(text)
    dif = math.floor(monX-length)
    x = math.floor(dif/2)
    
    if pos == "head" then
        mon.setCursorPos(x+1, line)
        mon.write(text)
    elseif pos == "left" then
        mon.setCursorPos(2, line)
        mon.write(text) 
    elseif pos == "right" then
        mon.setCursorPos(monX-length, line)
        mon.write(text)
    end
end

function prepareMonitor() 
	mon.setBackgroundColor(colors.black)
    mon.clear()
	mon.setTextScale(1)
    centerText("  Colony Integration v1 -By MindofGodz  ", 2, colors.gray, colors.white, "head")
	drawMenu()
	while true do
		event, p1,p2,p3 = os.pullEvent()
		if event == "monitor_touch" then
		  mouseWidth = p2
		  mouseHeight = p3
		  checkClickPosMenu()
		end
	end
end

function getOrders()
	row = 4
	mon.setBackgroundColor(colors.black)
	mon.clear()
	centerText("  <<< Back     ", 19, colors.gray, colors.white, "head")
	centerText("  Colony Integration v1 -By MindofGodz  ", 1, colors.gray, colors.white, "head")
	  centerText("Work Orders", 2, colors.black, colors.white, "head")
	    for g, o in ipairs(colony.getWorkOrders()) do
			if o.id ~= nil then
			  centerText(o.buildingName.. " - ".. o.workOrderType, row, colors.black, colors.white, "left")
		end
	  row = row+1
	end
		while true do
		event, p1,p2,p3 = os.pullEvent()
		if event == "monitor_touch" then
		  mouseWidth = p2
		  mouseHeight = p3
		  checkClickPosSubMenu()
		end
	end
end
	
function getRequests()
	row = 4
	mon.setBackgroundColor(colors.black)
	mon.clear()
	mon.setTextScale(1)
	centerText("  <<< Back     ", 19, colors.gray, colors.white, "head")
	centerText("  Colony Integration v1 -By MindofGodz  ", 1, colors.gray, colors.white, "head")
	  centerText("Requests", 2, colors.black, colors.white, "head")
	    for h, r in ipairs(colony.getRequests()) do
		if colony.getRequests{} then
			centerText(r.name.. " - ".. r.target, row, colors.black, colors.white, "left")
		end
	row = row+1
	end
		while true do
		event, p1,p2,p3 = os.pullEvent()
		if event == "monitor_touch" then
		  mouseWidth = p2
		  mouseHeight = p3
		  checkClickPosSubMenu()
		end
	end
end	
	
function getStatistics()
	mon.setBackgroundColor(colors.black)
	mon.clear()
	mon.setTextScale(1)
	centerText("  <<< Back     ", 19, colors.gray, colors.white, "head")
	centerText("  Colony Integration v1 -By MindofGodz  ", 1, colors.gray, colors.white, "head")
	  centerText("Statistics", 2, colors.black, colors.white, "head")
			  centerText("Colony ID: ".. colony.getColonyID(), 3, colors.black, colors.white, "left")
			  centerText("Name: ".. colony.getColonyName(), 4, colors.black, colors.white, "left")
			  centerText("Style: ".. colony.getColonyStyle(), 5, colors.black, colors.white, "left")
			  centerText("Citizens: ".. colony.amountOfCitizens(), 6, colors.black, colors.white, "left")
			  centerText("Happiness: ".. colony.getHappiness(), 7, colors.black, colors.white, "left")
			  centerText("Amount of Deaths: ".. colony.amountOfGraves(), 8, colors.black, colors.white, "left")
			  centerText("Construction Sites: ".. colony.amountOfConstructionSites(), 9, colors.black, colors.white, "left")
		while true do
		event, p1,p2,p3 = os.pullEvent()
		if event == "monitor_touch" then
		  mouseWidth = p2
		  mouseHeight = p3
		  checkClickPosSubMenu()
		end
	end
end		

function supportMenu()
mon.setBackgroundColor(colors.black)
	mon.clear()
	mon.setTextScale(1)
	centerText("  <<< Back     ", 19, colors.gray, colors.white, "head")
	centerText("          Bugs and Suggestions          ", 1, colors.gray, colors.white, "head")
	  centerText("If you have suggestions or issues", 8, colors.black, colors.white, "head")
			  centerText("please contact me on discord:", 9, colors.black, colors.white, "head")
			  centerText("MindofGodz#6620", 10, colors.black, colors.white, "head")
		while true do
		event, p1,p2,p3 = os.pullEvent()
		if event == "monitor_touch" then
		  mouseWidth = p2
		  mouseHeight = p3
		  checkClickPosSubMenu()
		end
	end
end		

function drawMenu()
	centerText("  Work Orders  ", 5, colors.gray, colors.white, "head", 1)
		  centerText("   Requests    ", 10, colors.gray, colors.white, "head", 1)
		    centerText("  Statistics   ", 15, colors.gray, colors.white, "head", 1)
end

function checkClickPosMenu()
	if mouseWidth > 12 and mouseWidth < 28 and mouseHeight == 5 then
	  getOrders()
	elseif mouseWidth > 12 and mouseWidth < 28 and mouseHeight == 10 then
	  getRequests()
	elseif mouseWidth > 12 and mouseWidth < 28 and mouseHeight == 15 then
	  getStatistics()
	elseif mouseWidth > 12 and mouseWidth < 28 and mouseHeight == 2 then
	  supportMenu()
	end
end

function checkClickPosSubMenu()
	if mouseWidth > 12 and mouseWidth < 28 and mouseHeight == 19 then
	  prepareMonitor()
	elseif mouseWidth > 12 and mouseWidth < 28 and mouseHeight == 1 then
	  supportMenu()
	end
end

prepareMonitor()