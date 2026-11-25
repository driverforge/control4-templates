-- ${title}
--
-- A minimal Control4 driver. Add proxies, bindings, connections and your own
-- logic from here.

local logMode = "Print"

local function log(msg)
    if logMode == "Print" then
        print("[${slug}] " .. tostring(msg))
    end
end

-- Called when the driver is loaded or reloaded.
function OnDriverInit(driverInitType)
    log("OnDriverInit (" .. tostring(driverInitType) .. ")")
end

-- Called once every driver on the project has been initialised.
function OnDriverLateInit(driverInitType)
    local version = C4:GetDriverConfigInfo("version")
    if version ~= nil and version ~= "" then
        C4:UpdateProperty("Driver Version", version)
    end
    log("OnDriverLateInit")
end

-- Called when the driver is removed or reloaded.
function OnDriverDestroyed(driverDestroyType)
    log("OnDriverDestroyed")
end

-- Called when a property is changed in Composer.
function OnPropertyChanged(strProperty)
    local value = Properties[strProperty]
    log("property '" .. strProperty .. "' = '" .. tostring(value) .. "'")
    if strProperty == "Log Mode" then
        logMode = value
    end
end

-- Called when an action or command is run against the driver.
function ExecuteCommand(strCommand, tParams)
    log("ExecuteCommand " .. strCommand)
    if strCommand == "LUA_ACTION" and tParams ~= nil and tParams.ACTION == "SAY_HELLO" then
        print("Hello from ${title}!")
    end
end
