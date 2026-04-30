------------------------------------------------------------------------------------------
-- UI file
-- Written by Homeopatix
-- 7 january 2021
------------------------------------------------------------------------------------------
-- create the window
------------------------------------------------------------------------------------------
centerWindow = {};
centerLabel = {};
centerQS = {};

function GenerateWindow()

		local horizontalPosition = 20 ;
		local verticalPosition = 40;
		local nbrSlot = 0;
		local windowWidth = (settings["nbrSlots"]["nbr"] * 42) + 38;
		local windowHeight = 0;
		if(settings["useRandomMont"]["value"] == true)then
			windowHeight = (settings["nbrLine"]["nbr"] * 42) + 130;
		else
			windowHeight = (settings["nbrLine"]["nbr"] * 42) + 60;
		end
		local totalSlots = tonumber(settings["nbrSlots"]["nbr"]) * tonumber(settings["nbrLine"]["nbr"]);

		HorseStableWindow=Turbine.UI.Lotro.GoldWindow(); 
		HorseStableWindow:SetSize(windowWidth, windowHeight); 
		HorseStableWindow:SetText(Strings.PluginName); 

		HorseStableWindow.Message=Turbine.UI.Label(); 
		HorseStableWindow.Message:SetParent(HorseStableWindow); 
		HorseStableWindow.Message:SetSize(150,10); 
		HorseStableWindow.Message:SetPosition(windowWidth/2 - 75, windowHeight - 20 ); 
		HorseStableWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
		HorseStableWindow.Message:SetText(Strings.PluginText); 

		HorseStableWindow:SetZOrder(0);
		HorseStableWindow:SetWantsKeyEvents(true);

		HorseStableWindow:SetWantsUpdates(true);

		HorseStableWindow:SetPosition(settings["windowPosition"]["xPos"], settings["windowPosition"]["yPos"]);

		------------------------------------------------------------------------------------------
		-- center window --
		------------------------------------------------------------------------------------------

		for i=1, totalSlots do
			if(nbrSlot == tonumber(settings["nbrSlots"]["nbr"]))then
				verticalPosition = verticalPosition + 42;
				nbrSlot = 0;
				horizontalPosition = 20;
			end
			
			centerWindow[i] = Turbine.UI.Extensions.SimpleWindow();
			centerWindow[i]:SetSize( 40 , 40 );
			centerWindow[i]:SetParent( HorseStableWindow );
			centerWindow[i]:SetPosition( horizontalPosition , verticalPosition);
			centerWindow[i]:SetVisible( true );
			if(i == totalSlots)then
				centerWindow[i]:SetBackColor( Turbine.UI.Color( .3, .9, .1, 0 ) );
			else
				centerWindow[i]:SetBackColor( Turbine.UI.Color( .3, .5, .7, .5) );
			end

			centerLabel = Turbine.UI.Label();
			centerLabel:SetParent(centerWindow[i]);
			centerLabel:SetPosition( 0, 0 );
			centerLabel:SetSize( 40, 40  );
			centerLabel:SetText( "" );
			centerLabel:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
			centerLabel:SetZOrder(-1);
			centerLabel:SetMouseVisible(false);

			centerQS[i] = Turbine.UI.Lotro.Quickslot();
			centerQS[i]:SetParent( centerWindow[i] );
			centerQS[i]:SetPosition( 1, 1 );
			centerQS[i]:SetSize( 36, 36 );
			centerQS[i]:SetUseOnRightClick(false);

			nbrSlot = nbrSlot + 1;
			horizontalPosition = horizontalPosition + 42;
		end

		if(settings["useRandomMont"]["value"] == true)then
			centerLabel = Turbine.UI.Label();
			centerLabel:SetParent(HorseStableWindow);
			centerLabel:SetPosition( windowWidth/2 - 150 , verticalPosition + 35);
			centerLabel:SetSize( 300, 40  );
			centerLabel:SetText( Strings.PluginUI2 );
			centerLabel:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
			centerLabel:SetZOrder(-1);
			centerLabel:SetMouseVisible(false);

			centerWindowRandom = Turbine.UI.Extensions.SimpleWindow();
			centerWindowRandom:SetSize( 40 , 40 );
			centerWindowRandom:SetParent( HorseStableWindow );
			centerWindowRandom:SetPosition( windowWidth/2 - 20 , verticalPosition + 65);
			centerWindowRandom:SetVisible( true );

			centerLabel = Turbine.UI.Label();
			centerLabel:SetParent(centerWindowRandom);
			centerLabel:SetPosition( 0, 0 );
			centerLabel:SetSize( 40, 40  );
			centerLabel:SetText( "" );
			centerLabel:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
			centerLabel:SetZOrder(-1);
			centerLabel:SetMouseVisible(false);

			centerQSRandom = Turbine.UI.Lotro.Quickslot();
			centerQSRandom:SetParent( centerWindowRandom );
			centerQSRandom:SetPosition( 1, 1 );
			centerQSRandom:SetSize( 36, 36 );
			centerQSRandom:SetUseOnRightClick(false);
		end
------------------------------------------------------------------------------------------
-- setting the datas	
------------------------------------------------------------------------------------------
	SettingTheShortCuts();
	DragAndDrop();
	DeleteShortCutes();
	MouseClickHandler();
	EscapeKeyPressed();
	ClosingTheWindow();
	if(settings["useRandomMont"]["value"] == true)then
		SettingTheShortCutsForRandomMonture();
		MouseClickHandlerForRandomMount();
	end
end
