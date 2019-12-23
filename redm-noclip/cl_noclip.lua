local noclipSpeed = 10.0
local noclipPos = vector3(0.0, 0.0, 0.0)
local noclipHeading = 0.0
local noclipEntity = nil
local noclipPrompts = {}

Citizen.CreateThread(function()
    noclipPrompts.vert = BuildPrompt(TEXT("Up / Down"), `INPUT_JUMP`, function(prompt)
        PromptSetControlAction(prompt, `INPUT_DUCK`)
        PromptSetStandardMode(prompt, 0)
    end)
    noclipPrompts.turn = BuildPrompt(TEXT("Left / Right"), `INPUT_MOVE_LEFT_ONLY`, function(prompt)
        PromptSetControlAction(prompt, `INPUT_MOVE_RIGHT_ONLY`)
        PromptSetStandardMode(prompt, 0)
    end)
    noclipPrompts.move = BuildPrompt(TEXT("Forward / Backward"), `INPUT_MOVE_UP_ONLY`, function(prompt)
        PromptSetControlAction(prompt, `INPUT_MOVE_DOWN_ONLY`)
        PromptSetStandardMode(prompt, 0)
    end)
    noclipPrompts.fast = BuildPrompt(TEXT("Speed"), `INPUT_SPRINT`, function(prompt)
        PromptSetStandardMode(prompt, 0)
    end)
    noclipPrompts.toggle = BuildPrompt(TEXT("Disable Noclip"), `INPUT_SELECT_ITEM_WHEEL`, function(prompt)
        PromptSetStandardMode(prompt, 0)
    end)
    while true do
        Citizen.Wait(0)
        local myPed = PlayerPedId()
        local myPos = GetEntityCoords(myPed)
        local myHead = GetEntityHeading(myPed)
        DrawGameText(5, 1040, tostring(vec4(myPos.x, myPos.y, myPos.z, myHead)), 255, 255, 255, 255, 0.342, 0.342)
    	if isNoclip then
    	    if IsDisabledControlJustPressed(0, `INPUT_SELECT_ITEM_WHEEL`) then
    		    isNoclip = false
                for dir, prompt in next, noclipPrompts do
                    PromptSetVisible(prompt, false)
                    PromptSetEnabled(prompt, false)
                end
    	    else
                DrawGameText(5, 1000, "NOCLIP ENABLED", 255, 255, 255, 255, 0.342, 0.342)
        		local fv = GetEntityMatrix(noclipEntity)
        		noclipSpeed = 1.0
        		if IsDisabledControlPressed(0, `INPUT_SPRINT`) then
        			noclipSpeed = 5.0
        		end
        		if IsDisabledControlPressed(0, `INPUT_DUCK`) then
        		    	noclipPos = noclipPos + (vector3(0.0, 0.0, -1.0) * noclipSpeed)
        		end
        		if IsDisabledControlPressed(0, `INPUT_JUMP`) then
        		    	noclipPos = noclipPos + (vector3(0.0, 0.0, 1.0) * noclipSpeed)
        		end
        		if IsDisabledControlPressed(0, `INPUT_MOVE_LEFT_ONLY`) then
        		    	noclipHeading = noclipHeading + 2.5
        		end
        		if IsDisabledControlPressed(0, `INPUT_MOVE_RIGHT_ONLY`) then
        		    	noclipHeading = noclipHeading - 2.5
        		end
        		if IsDisabledControlPressed(0, `INPUT_MOVE_UP_ONLY`) then
        		    noclipPos = noclipPos + (fv * noclipSpeed)
        		end
        		if IsDisabledControlPressed(0, `INPUT_MOVE_DOWN_ONLY`) then
        		    noclipPos = noclipPos + (fv * -noclipSpeed)
        		end
    	        SetEntityCoords(noclipEntity, noclipPos)
    	        SetEntityHeading(noclipEntity, noclipHeading)
    	    end
    	else
    	    if IsDisabledControlJustPressed(0, `INPUT_SELECT_ITEM_WHEEL`) then
    	        isNoclip = true
                for dir, prompt in next, noclipPrompts do
                    PromptSetVisible(prompt, true)
                    PromptSetEnabled(prompt, true)
                end
    		    noclipHeading = myHead
    	        noclipPos = myPos
                if IsPedInAnyVehicle(myPed) then
                    noclipEntity = GetVehiclePedIsIn(myPed)
                else
                    if IsPedOnMount(myPed) then
                        noclipEntity = GetMount(myPed)
                    else
                        noclipEntity = myPed
                    end
                end
     	    end
        end
    end
end)
