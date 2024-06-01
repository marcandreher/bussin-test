local textbox = get("textbox")
local info = get("info")

textbox.on_input(function(content)
    local contentUp = string.upper(content)
    if #content < 6 then
        info.set_content("Password must be at least 6 characters long | current length: " .. #content)
        return
    end
    if not string.match(content, "buss://") then
        info.set_content("The Password needs to contain the Bussin Web X default Protocol")
        return
    end
    if not string.match(contentUp, "LUA") then
        info.set_content("The Password needs to contain the Language that replaces javascript in this browser")
        return
    end
    if not string.match(content, "141") then
        info.set_content("Math Question: What are the first three digits of Pi after the decimal point?")
        return
    end
    if not (string.match(contentUp, "WEBX") or string.match(contentUp, "WEB X")) then
        info.set_content("The Password needs to contain the name of the Browser")
        return
    end

    local res = fetch({
        url = "https://marc-andre.tech/api/pwgame/wordle",
        method = "GET",
        headers = { ["Content-Type"] = "text/plain" },
        body = '{ }'
    })

    if not string.match(contentUp, string.upper(res)) then
        info.set_content("The Password needs to include todays wordle answer")
        return
    end

    info.set_content("You BEAT the BUSS PASSWORD GAME! with " .. #content .. " characters!")
end)