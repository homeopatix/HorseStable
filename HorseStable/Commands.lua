------------------------------------------------------------------------------------------
-- Command file
-- Written by Homeopatix
-- 7 january 2021
------------------------------------------------------------------------------------------
HorseStableCommand = Turbine.ShellCommand();
------------------------------------------------------------------------------------------
-- commands
------------------------------------------------------------------------------------------
function HorseStableCommand:Execute( command, arguments )
	------------------------------------------------------------------------------------------
	-- Help command--
	------------------------------------------------------------------------------------------
	if ( arguments == "help" ) then
		commandsHelp();
	elseif ( arguments == "show" ) then
		Write(rgb["start"] .. pluginName .. rgb["clear"] .. " - " .. Strings.PluginWindowShow);
		HorseStableWindow:SetVisible(true);
		settings["isWindowVisible"]["isWindowVisible"] = true;
		SaveSettings();
	elseif ( arguments == "hide" ) then
		Write(rgb["start"] .. pluginName .. rgb["clear"] .. " - " ..Strings.PluginWindowHide);
		HorseStableWindow:SetVisible(false);
		settings["isWindowVisible"]["isWindowVisible"] = false;
		SaveSettings();
	elseif ( arguments == "toggle" ) then
		if(settings["isWindowVisible"]["isWindowVisible"] == true)then
			Write(rgb["start"] .. pluginName .. rgb["clear"] .. " - " ..Strings.PluginWindowHide);
			HorseStableWindow:SetVisible(false);
			settings["isWindowVisible"]["isWindowVisible"] = false;
		else
			Write(rgb["start"] .. pluginName .. rgb["clear"] .. " - " ..Strings.PluginWindowShow);
			HorseStableWindow:SetVisible(true);
			settings["isWindowVisible"]["isWindowVisible"] = true;
		end
		SaveSettings();
	elseif ( arguments == "options" ) then
		Write("Display the options Window");
		OptionsWindow:SetVisible(true);
		HorseStableWindow:SetVisible(false);
		settings["isWindowVisible"]["isWindowVisible"] = false;
		settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = true;
		SaveSettings();
	elseif ( arguments == "clear" ) then
		Write(rgb["start"] .. pluginName .. rgb["clear"] .. " - " ..Strings.PluginWindowClear);
		ClearWindow();
		SaveSettings();
------------------------------------------------------------------------------------------
-- alt command--
------------------------------------------------------------------------------------------
	elseif ( arguments == "alt" ) then
		if(settings["altEnable"]["altEnable"] == true) then
			Write(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginAltDesable);
			settings["altEnable"]["altEnable"] = false;
		else
			Write(rgb["start"] .. Strings.PluginName .. rgb["clear"] .. " - " .. Strings.PluginAltEnable);
			settings["altEnable"]["altEnable"] = true;
		end
		SaveSettings();
	elseif ( arguments == "esc" ) then
		if(settings["escEnable"]["escEnable"] == true) then
			Write(rgb["start"] .. pluginName .. rgb["clear"] .. " - " ..Strings.PluginEscDesable);
			settings["escEnable"]["escEnable"] = false;
		else
			Write(rgb["start"] .. pluginName .. rgb["clear"] .. " - " ..Strings.PluginEscEnable);
			settings["escEnable"]["escEnable"] = true;
		end
		SaveSettings();
	end
end
------------------------------------------------------------------------------------------
-- Add the sahell command --
------------------------------------------------------------------------------------------
Turbine.Shell.AddCommand( "Ho;HorseStable", HorseStableCommand );