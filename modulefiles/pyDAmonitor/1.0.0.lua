help([[
]])

local pkgName    = myModuleName()
local pkgVersion = myModuleVersion()
local pkgNameVer = myModuleFullName()

local hierA          = hierarchyA(pkgNameVer,1)
local pythonNameVer  = hierA[1]
local pythonNameVerD = pythonNameVer:gsub("/","-")

conflict(pkgName)

-- activate on load, deactivate on unload
if (mode() == "load") then
  local load_cmd = "conda activate " .. pkgName
  execute{cmd=load_cmd, modeA={"load"}}
else
  if (mode() == "unload") then
    local unload_cmd = "conda deactivate"
    execute{cmd=unload_cmd, modeA={"unload"}}
  end
end

whatis("Name: " .. pkgName)
whatis("Version: " .. pkgVersion)
whatis("Category: Software")
whatis("Description: " .. pkgName .. " Conda Environment")
