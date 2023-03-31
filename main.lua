local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Project Delta", "GrapeTheme")

--MAIN
local Main = Window:NewTab("Main")
local Teleports = Main:NewSection("Teleports")

Teleports:NewButton("Back to Metro", "Teleports you to the exit back to metro.", function()
    local teleport_table = {
        location1 = Vector3.new(-3148.39, 103.289, -1393.27), -- your desired position
    }
    
    -- -3148.39, 103.289, -1393.27 (Exit)
    local character = game.Players.LocalPlayer.Character
    local tween_s = game:GetService('TweenService')
    local tweeninfo = TweenInfo.new(1,Enum.EasingStyle.Linear)
    
    local lp = game.Players.LocalPlayer
                    
    local function bypass_teleport(v)
        if lp.Character and 
        lp.Character:FindFirstChild('HumanoidRootPart') then
            lp.Character.HumanoidRootPart.Position += Vector3.new(0,30,0)
            local cf = CFrame.new(v+Vector3.new(-2.7,20,-0.15))
            local cfa = CFrame.new(v)					
            local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
            local b = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cfa})
            a:Play()
            print("Teleporting...")
            lp.Character:FindFirstChild('HumanoidRootPart').Touched:Connect(function(hit)
                if hit.ClassName == "MeshPart" or "Part" then
                    print("hit something")
                    a:Cancel()
                    local ray = Ray.new(character.HumanoidRootPart.Position, Vector3.new(0, -1, 0)*100) -- create a ray pointing down from the character's position
                    local part, position = workspace:FindPartOnRay(ray, character) -- find the first part the ray hits that is not part of the character
                    if part then
                        local distance = (position - character.HumanoidRootPart.Position).Magnitude -- calculate the distance between the character and the ground
                        print("Distance to ground:", distance)
                        local newpos = Vector3.new(lp.Character.HumanoidRootPart.Position.x,lp.Character.HumanoidRootPart.Position.y - distance, lp.Character.HumanoidRootPart.Position.z)
                        local gcframe = CFrame.new(newpos)
                        local c = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=gcframe})
                        c:Play()
                        c.Completed:Wait()
                        print("Returned to ground safely")
                    end
                end
            end)
            a.Completed:Connect(function()
                print('Teleporting Done!')
                b:Play()
            end)
        end
    end
    
    bypass_teleport(teleport_table.location1)
end)

Teleports:NewTextBox("Enter Position", "Teleports to the entered position", function(txt)
    
    local teleport_table = {
        location1 = Vector3.new(txt:match("(.+), (.+), (.+)")), -- your desired position
    }
    
    -- -3148.39, 103.289, -1393.27 (Exit)
    local character = game.Players.LocalPlayer.Character
    local tween_s = game:GetService('TweenService')
    local tweeninfo = TweenInfo.new(1,Enum.EasingStyle.Linear)
    
    local lp = game.Players.LocalPlayer
                    
    local function bypass_teleport(v)
        if lp.Character and 
        lp.Character:FindFirstChild('HumanoidRootPart') then
            lp.Character.HumanoidRootPart.Position += Vector3.new(0,30,0)
            local cf = CFrame.new(v+Vector3.new(-2.7,20,-0.15))
            local cfa = CFrame.new(v)					
            local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
            local b = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cfa})
            a:Play()
            print("Teleporting...")
            lp.Character:FindFirstChild('HumanoidRootPart').Touched:Connect(function(hit)
                if hit.ClassName == "MeshPart" or "Part" then
                    print("hit something")
                    a:Cancel()
                    local ray = Ray.new(character.HumanoidRootPart.Position, Vector3.new(0, -1, 0)*100) -- create a ray pointing down from the character's position
                    local part, position = workspace:FindPartOnRay(ray, character) -- find the first part the ray hits that is not part of the character
                    if part then
                        local distance = (position - character.HumanoidRootPart.Position).Magnitude -- calculate the distance between the character and the ground
                        print("Distance to ground:", distance)
                        local newpos = Vector3.new(lp.Character.HumanoidRootPart.Position.x,lp.Character.HumanoidRootPart.Position.y - distance, lp.Character.HumanoidRootPart.Position.z)
                        local gcframe = CFrame.new(newpos)
                        local c = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=gcframe})
                        c:Play()
                        c.Completed:Wait()
                        print("Returned to ground safely")
                    end
                end
            end)
            a.Completed:Connect(function()
                print('Teleporting Done!')
                b:Play()
            end)
        end
    end
    
    bypass_teleport(teleport_table.location1)
end)

local Misc = Main:NewSection("Misc")

Misc:NewButton("Anti AFK", "Prevents the player from getting an AFK timeout", function()
    for i, connection in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
        connection:Disable()
    end
end)
