local textbox = get("textbox")
local info = get("info")

textbox.on_input(function(content)
    if #content < 6 then
        info.set_content("Password must be at least 6 characters long | current length: " .. #content)
        return
    end
    info.set_content("You BEAT the BUSS PASSWORD GAME!")
end)