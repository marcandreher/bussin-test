local textbox = get("textbox")
local info = get("info")

textbox.on_input(function(content)
    if(string.len(content) < 6) then
        info.set_content("Password must be at least 6 characters long")
        return
    end
end)