local textbox = get("textbox")
local info = get("info")

textbox.on_input(function(content)
    if #content < 6 then
        info.set_content("Password must be at least 6 characters long | current length: " .. #content)
        return
    end
    if not string.match(content, "buss://") then
        info.set_content("The Password needs to contain the Bussin Web X default Protocol")
        return
    end
    info.set_content("You BEAT the BUSS PASSWORD GAME!")
end)