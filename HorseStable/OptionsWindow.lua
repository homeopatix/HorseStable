------------------------------------------------------------------------------------------
-- OptionWindow file
-- Written by Homeopatix
-- 7 january 2021
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- define size of the window
------------------------------------------------------------------------------------------
local windowWidth = 0;
local windowHeight = 0;
local positionInitiale = 0;

windowWidth = 400;
windowHeight = 380;
positionInitiale = 40;
------------------------------------------------------------------------------------------
-- create the options window
------------------------------------------------------------------------------------------
function GenerateOptionsWindow()

		OptionsWindow=Turbine.UI.Lotro.GoldWindow(); 
		OptionsWindow:SetSize(windowWidth, windowHeight); 
		OptionsWindow:SetText(Strings.PluginOptionsText); 

		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(150,10); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 75, windowHeight - 17 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetText(Strings.PluginText); 

		OptionsWindow:SetZOrder(0);
		OptionsWindow:SetWantsKeyEvents(true);

		OptionsWindow:SetPosition(settings["optionsWindowPosition"]["xPos"], settings["optionsWindowPosition"]["yPos"]);
		OptionsWindow:SetVisible(false);

		------------------------------------------------------------------------------------------
		-- center window
		------------------------------------------------------------------------------------------
		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(300, 20); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 150, positionInitiale ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		OptionsWindow.Message:SetText(Strings.PluginOption1); 

		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(300, 20); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 150, positionInitiale + 15 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana12);
		OptionsWindow.Message:SetText("Max 21"); 
  
		textBoxLines = Turbine.UI.Lotro.TextBox();
		textBoxLines:SetParent( OptionsWindow );
		textBoxLines:SetSize(100, 30); 
		textBoxLines:SetText(settings["nbrLine"]["nbr"]); 
		textBoxLines:SetPosition(windowWidth/2 - 50, positionInitiale + 30);
		textBoxLines:SetVisible(true);
		textBoxLines:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		textBoxLines:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));
		textBoxLines:SetBackColor( Turbine.UI.Color( .9, .5, .7, .5));

		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(300, 20); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 150, positionInitiale + 80 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		OptionsWindow.Message:SetText(Strings.PluginOption2); 

		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(300, 20); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 150, positionInitiale + 95 ); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana12);
		OptionsWindow.Message:SetText("Min 3 - Max 21"); 

		textBoxSlots = Turbine.UI.Lotro.TextBox();
		textBoxSlots:SetParent( OptionsWindow );
		textBoxSlots:SetSize(100, 30); 
		textBoxSlots:SetText(settings["nbrSlots"]["nbr"]); 
		textBoxSlots:SetPosition(windowWidth/2 - 50, positionInitiale + 125);
		textBoxSlots:SetVisible(true);
		textBoxSlots:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		textBoxSlots:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));
		textBoxSlots:SetBackColor( Turbine.UI.Color( .9, .5, .7, .5));	
		

		-- class bags
		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(300, 40); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 150, positionInitiale + 155); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		OptionsWindow.Message:SetText(Strings.PluginOption11); 

		checkBoxClassBag = Turbine.UI.Lotro.CheckBox();
		checkBoxClassBag:SetParent( OptionsWindow );
		checkBoxClassBag:SetSize(250, 40); 
		checkBoxClassBag:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		checkBoxClassBag:SetText(Strings.PluginOption12);
		checkBoxClassBag:SetPosition(windowWidth/2 - 35, positionInitiale + 180 );
		checkBoxClassBag:SetVisible(true);
		if(settings["useRandomMont"]["value"] == true)then
			checkBoxClassBag:SetChecked(true);
		else
			checkBoxClassBag:SetChecked(false);
		end
		checkBoxClassBag:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));


		-- auto close
		OptionsWindow.Message=Turbine.UI.Label(); 
		OptionsWindow.Message:SetParent(OptionsWindow); 
		OptionsWindow.Message:SetSize(300, 40); 
		OptionsWindow.Message:SetPosition(windowWidth/2 - 150, positionInitiale + 220); 
		OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		OptionsWindow.Message:SetText(Strings.PluginOption13); 

		CheckBoxAutoClose = Turbine.UI.Lotro.CheckBox();
		CheckBoxAutoClose:SetParent( OptionsWindow );
		CheckBoxAutoClose:SetSize(250, 40); 
		CheckBoxAutoClose:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		CheckBoxAutoClose:SetText(Strings.PluginOption14);
		CheckBoxAutoClose:SetPosition(windowWidth/2 - 35, positionInitiale + 245 );
		CheckBoxAutoClose:SetVisible(true);
		if(settings["autoClose"]["value"] == true)then
			CheckBoxAutoClose:SetChecked(true);
		else
			CheckBoxAutoClose:SetChecked(false);
		end
		CheckBoxAutoClose:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));


		buttonValider = Turbine.UI.Lotro.GoldButton();
		buttonValider:SetParent( OptionsWindow );
		buttonValider:SetPosition(windowWidth/2 - 125, windowHeight - 40);
		buttonValider:SetSize( 300, 20 );
		buttonValider:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		buttonValider:SetText( Strings.PluginOption10 );
		buttonValider:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
		buttonValider:SetVisible(true);
		buttonValider:SetMouseVisible(true);

		ValidateChanges();
end
------------------------------------------------------------------------------------------
-- boutton valider
------------------------------------------------------------------------------------------
function ValidateChanges()
	buttonValider.MouseClick = function(sender, args)
			local tmpLine = 0;
			local ChangedNbr = false;

			local oldLine = settings["nbrLine"]["nbr"];
			local oldRow = settings["nbrSlots"]["nbr"];

			tmpLine = tonumber(textBoxLines:GetText());

			if(tmpLine < 1 or tmpLine > 21)then
				tmpLine = 10;
				textBoxLines:SetText(tmpLine);
				settings["nbrLine"]["nbr"] =  tmpLine;
			else
				settings["nbrLine"]["nbr"] =  tmpLine;
			end

			local tmpSlots = 0;
			tmpSlots = tonumber(textBoxSlots:GetText());

			if(tmpSlots > 21 or tmpSlots < 3 or (tmpSlots*settings["nbrLine"]["nbr"]) > 220)then
				tmpSlots = 10;
				textBoxSlots:SetText(tmpSlots);
				settings["nbrSlots"]["nbr"] = tmpSlots;
			else
				settings["nbrSlots"]["nbr"] = tmpSlots;
			end

			OptionsWindow:SetVisible(false);
			settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = false;

			if(settings["nbrLine"]["nbr"] ~= oldLine)then
				ChangedNbr = true;
			end

			if(settings["nbrSlots"]["nbr"] ~= oldRow)then
				ChangedNbr = true;
			end

			if(NbrOfPetsInStable() >= 1)then
				if (checkBoxClassBag:IsChecked()) then
					settings["useRandomMont"]["value"] = true;
				else
					settings["useRandomMont"]["value"] = false;
				end
			else
				if(ChangedNbr == false and checkBoxClassBag:IsChecked())then
					Write(rgb["error"] .. Strings.PluginERROR .. rgb["clear"]);
				end
			end

			if (CheckBoxAutoClose:IsChecked()) then
				settings["autoClose"]["value"] = true;
			else
				settings["autoClose"]["value"] = false;
			end


			SaveSettings();
			UpdateWindow();
			UpdateOptionsWindow();
			ClosingTheOptionsWindow();
		end
end
------------------------------------------------------------------------------------------
-- Closing window handler
------------------------------------------------------------------------------------------
function ClosingTheOptionsWindow()
	function OptionsWindow:Closing(sender, args)
		settings["isOptionsWindowVisible"]["isOptionsWindowVisible"] = false;
		SaveSettings();
	end
end
------------------------------------------------------------------------------------------
-- updating the options window
------------------------------------------------------------------------------------------
function UpdateOptionsWindow()
	GenerateOptionsWindow();
	EscapeKeyPressed();
	ClosingTheWindow();
	ClosingTheOptionsWindow();
end