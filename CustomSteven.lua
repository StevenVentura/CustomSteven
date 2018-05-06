--Author: Soccerbilly aka Gangsthurh (Steven Ventura)
--Date Created: 6/13/17
--purpose: addon template
CustomSteven = CreateFrame("Frame");


CustomSteven:SetScript("OnUpdate", function(self, elapsed) CustomStevenOnUpdate(self, elapsed) end)
CustomSteven:RegisterEvent("VARIABLES_LOADED");
CustomSteven:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
CustomSteven:RegisterEvent("PLAYER_ENTERING_WORLD");
CustomSteven:RegisterEvent("PLAYER_LOGIN");
CustomSteven:RegisterEvent("UNIT_SPELLCAST_START");
CustomSteven:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED");
CustomSteven:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED");
CustomSteven:RegisterEvent("PLAYER_REGEN_DISABLED");--detect if combat
---
CustomSteven:RegisterEvent("UNIT_AURA")

kickBotNames = {"Assatashakur"};

botNames = {"Assatashakur","Enrique","Jahmilli","Fourchan","Greenones","Removekebabs","Thisisbrazil","Jonniffer"};
StevenBotFrame = {};
StevenBotFrame.acceptDelayTimer = 0;
StevenBotFrame.depositingState = false;

function CustomStevenIncoming(ChatFrameSelf, event, msg, author, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
  
  namae = CustomStevenSplitString(author,"-")[1];
  if (string.find(msg, "your")) then
  SendChatMessage("you're*","WHISPER",author)
  end
  if (isPlayingOnBot(namae) == true ) then
  if (msg == "help") then
  StevenPrint("---HELP LISTING---")
  StevenPrint(" depositDo")
  StevenPrint(" depositStop")
  end--end if help
  if (msg == "depositDo") then
  StevenBotFrame.depositingState = true;
  
  end--end if do
  if (msg == "depositStop") then
  StevenBotFrame.depositingState = false;
  
  end--end if stop
  end--end if valid guy
  
  return false, msg, author, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9 --substitute newMsg for msg when returning
end--end function CustomStevenIncoming

SLASH_CustomSteven1 = "/re"; 
SlashCmdList["CustomSteven"] = slashCustomSteven;

function slashCustomSteven(msg,editbox)
command, rest = msg:match("^(%S*)%s*(.-)$");
if (command == "quest") then
ObjectiveTrackerFrame:Hide();
return
end
ReloadUI()
end--end function
--local function taken from http://stackoverflow.com/questions/1426954/split-string-in-lua by user973713 on 11/26/15
function CustomStevenSplitString(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={} ; local i=1
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                t[i] = str
                i = i + 1
        end
        return t
end
function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

StevenColor = "|cffff88ff";

function StevenPrint(words)
print(StevenColor .. "[S] " .. words);

end--end function StevenPrint

function doCustomStevenFirstLoop()
if (UnitName("player") == "Taddletaler") then
MultiBarLeftButton1:Hide();
MultiBarLeftButton2:Hide();
MultiBarLeftButton3:Hide();
MultiBarLeftButton4:Hide();
MultiBarLeftButton5:Hide();
MultiBarLeftButton6:Hide();

MultiBarRightButton8:Hide();
MultiBarRightButton9:Hide();
MultiBarRightButton10:Hide();

MultiBarBottomRightButton4:Hide();
MultiBarBottomRightButton9:Hide();

MultiBarBottomRightButton12:Hide();


end


end--end function doCustomStevenFirstLoop

CreateFrame("FRAME","CustomCancerColorBoy",UIParent);
CustomCancerColorBoy:SetAllPoints();

CustomCancerColorBoy.t = CustomCancerColorBoy:CreateTexture();
CustomCancerColorBoy.t:SetAllPoints();
CustomCancerColorBoy.theta = 0;
function CustomStevenCancerColor() 
CustomCancerColorBoy.theta = CustomCancerColorBoy.theta + 0.05;
local theta = CustomCancerColorBoy.theta;
local red = math.cos(theta);
local blue = math.sin(theta)*math.cos(theta);
local green = math.sin(theta);
CustomCancerColorBoy.t:SetColorTexture(red,green,blue,0.50);


end--end function CustomStevenCancerColor
ZoomBoy = {};

ZoomBoy.plus = false;

function CustomStevenZoomCancer() 
CustomStevenCancerColor();
--[[local randy = math.random(1,4);
if (randy == 1) then
MoveViewUpStart(1);
elseif (randy == 2) then
MoveViewDownStart(1);
elseif (randy == 3) then
MoveViewLeftStart(1);
elseif (randy == 4) then
MoveViewRightStart(1);
end]]

MoveViewRightStart(5);

if (math.random(1,5) == 1) then
SetView(math.random(1,5));
end
if (ZoomBoy.plus == true) then
CameraZoomIn(.5);

if (GetCameraZoom() == 0) then
ZoomBoy.plus = false;
end
else
CameraZoomOut(.5);

if (GetCameraZoom() == 39) then
ZoomBoy.plus = true;
end

end




end--end function CustomStevenZoomCancer
function CustomStevenShowDMBoxes() 
if (UnitExists("arena1") and StevenWhisperArena1Frame == nil) then

CreateFrame("Button","StevenWhisperArena1Frame",GladiusTimerGladiusClassIconFramearena1,"UIPanelButtonTemplate");
StevenWhisperArena1Frame:SetText("DM");
StevenWhisperArena1Frame:SetSize(24,24);
StevenWhisperArena1Frame:SetPoint("TOP",GladiusTimerGladiusClassIconFramearena1,"BOTTOM");
StevenWhisperArena1Frame:SetScript("OnClick", function() 
ChatFrame1EditBox:SetFocus();

name,realm = UnitName("arena1");
if (realm == nil) then
completename = name
else
completename= name .. "-" .. realm;
end
ChatFrame1EditBox:SetText("/w " .. completename .. " ");
end);
StevenWhisperArena1Frame:Show();
end-- end frame 1
if (UnitExists("arena2") and StevenWhisperArena2Frame == nil) then
CreateFrame("Button","StevenWhisperArena2Frame",GladiusTimerGladiusClassIconFramearena2,"UIPanelButtonTemplate");
StevenWhisperArena2Frame:SetText("DM");
StevenWhisperArena2Frame:SetSize(24,24);
StevenWhisperArena2Frame:SetPoint("TOP",GladiusTimerGladiusClassIconFramearena2,"BOTTOM");
StevenWhisperArena2Frame:SetScript("OnClick", function() 
ChatFrame1EditBox:SetFocus();
name,realm = UnitName("arena2");
if (realm == nil) then
completename = name
else
completename= name .. "-" .. realm;
end
ChatFrame1EditBox:SetText("/w " .. completename .. " ");
end);
StevenWhisperArena2Frame:Show();
end--end frame 2
if (UnitExists("arena3") and StevenWhisperArena3Frame == nil) then
CreateFrame("Button","StevenWhisperArena3Frame",GladiusTimerGladiusClassIconFramearena3,"UIPanelButtonTemplate");
StevenWhisperArena3Frame:SetText("DM");
StevenWhisperArena3Frame:SetSize(24,24);
StevenWhisperArena3Frame:SetPoint("TOP",GladiusTimerGladiusClassIconFramearena3,"BOTTOM");
StevenWhisperArena3Frame:SetScript("OnClick", function() 
ChatFrame1EditBox:SetFocus();
name,realm = UnitName("arena3");
if (realm == nil) then
completename = name
else
completename= name .. "-" .. realm;
end
ChatFrame1EditBox:SetText("/w " .. completename .. " ");
end);
StevenWhisperArena3Frame:Show();
end--end frame 3	

end--end function CustomStevenShowDMBoxes

function ShapeshiftNotify()




end--end function ShapeshiftNotify

CustomStevenTimeSincePairing = {["Fear"]=0,["Hammer of Justice"]=0,["Kidney Shot"]=0};

function YellAtDaleForSac(elapsed) 

for SPELLNAME,TIME in pairs(CustomStevenTimeSincePairing) do
local name, rank, icon, count, debuffType, duration, expirationTime,
 unitCaster, canStealOrPurge, nameplateShowPersonal, spellId, canApplyAura,
 isBossDebuff, isCastByPlayer, nameplateShowAll, timeMod  = UnitAura("player",SPELLNAME);

	if (name ~= nil and CustomStevenTimeSincePairing[SPELLNAME] > 5) then
	CustomStevenTimeSincePairing[SPELLNAME] = 0;
	--yell at dale
	SendChatMessage("SAC " .. SPELLNAME .. time(), "YELL",nil);
	
	
	else
	CustomStevenTimeSincePairing[SPELLNAME] = CustomStevenTimeSincePairing[SPELLNAME] + elapsed;
	end
	
	
end--end for


end--end function YellAtDaleForSac


CustomStevenFirstLoop = true;
lagLess = 0;
CustomStevenTimeDelayThing = 0.05;
function CustomStevenOnUpdate(self, elapsed)

lagLess = lagLess + elapsed;
if (lagLess < CustomStevenTimeDelayThing) then  return end
lagLess = 0;
--do stuff here
-------
--CustomStevenShowDMBoxes();

-------
--CustomStevenZoomCancer();
YellAtDaleForSac(CustomStevenTimeDelayThing);
updateEnemyTargetOfTargetLabels();
ShapeshiftNotify();


if (LFDRoleCheckPopupDeclineButton)
then
LFDRoleCheckPopupDeclineButton:Hide();
end
if (CustomStevenFirstLoop == true) then
CustomStevenFirstLoop = false;
doCustomStevenFirstLoop();
end

local myName = UnitName("Player");

if (isKickBotting(myName)) then
if (KickBotGreenFrame and KickBotGreenFrame.timer and KickBotGreenFrame.timer >= 0) then
KickBotGreenFrame.timer = KickBotGreenFrame.timer + CustomStevenTimeDelayThing;
KickBotGreenFrame.timeSinceFirstKick = KickBotGreenFrame.timeSinceFirstKick + CustomStevenTimeDelayThing;

if (KickBotGreenFrame.timeSinceFirstKick > 1*2) then
--use the second kick
KickBotYellowFrame:Show();
end

if (KickBotGreenFrame.timer > KickBotGreenFrame.MAX_TIME) then
KickBotGreenFrame.timer = -1;
KickBotYellowFrame:Hide();
KickBotGreenFrame:Hide();
end
end--end KickBotGreenFrame

end--end isKickBotting

if (isPlayingOnBot(myName)) then
if (StevenBotFrame.depositingState == true) then
DepositGuildBankMoney(2500000)
SendChatMessage("depositing okane " .. (GetMoney()/10000), "PARTY",nil);
end


--do the invites; check if he not in a group
if (isBotLeader(myName) == false) then return end;--full party.
local numGuildMembers, numOnline, numOnlineAndMobile = GetNumGuildMembers()
for index=1,numOnline do 
local fullName, rank, rankIndex, level, class, zone, note, officernote, online, status, classFileName, achievementPoints, achievementRank, isMobile, canSoR, reputation = GetGuildRosterInfo(index) 
justName = CustomStevenSplitString(fullName,"-")[1];
alreadyInOurParty = false;
for i = 1, 4 do 
if (UnitName("party" .. i) == justName) then alreadyInOurParty = true; end
end--end for

if (not(alreadyInOurParty) and UnitName("player") ~= justName and isPlayingOnBot(justName)) then
InviteUnit(fullName);
end
end--end for
end--end if playing on bot

if (myName == "Redrockets" or myName == "Shaunmoulder") then

please, tho = GetContainerNumFreeSlots(0)

if (please < 12) then

for bag = 0,4,1 do for slot = 1, 32, 1 do 

local name = GetContainerItemLink(bag,slot); 

if not(bag==0 and slot==1) and name ~= nil and name and string.find(name,"") then PickupContainerItem(bag,slot); DeleteCursorItem(); end; end; end

end
end--end ifthebots

end--end function CustomStevenOnUpdate



function isBotLeader(name)
return name == "Jahmilli";
end

function isPlayingOnBot(name)
for _,bname in pairs(botNames) do if (bname == name) then return true end end 
return false
end


StevenEventPlease = CreateFrame("FRAME");
function StevenEventPlease:PARTY_INVITE_REQUEST(info,sender)
StevenPrint("received a party invite request");
if (isPlayingOnBot(sender)) then
AcceptGroup();
else
if (isPlayingOnBot(UnitName("player"))) then
DeclineGroup();
end
end
end--end function accepttheinvite




function PerformKickbotKick()

--now begin the timer to hide it
KickBotGreenFrame.timer = 0;
KickBotGreenFrame.MAX_TIME = 0.50;

if (not(KickBotGreenFrame.timeSinceFirstKick)) then
KickBotGreenFrame.timeSinceFirstKick = 0;
end
if (KickBotGreenFrame.timeSinceFirstKick < 1*2) then
KickBotGreenFrame:Show();
end
KickBotGreenFrame.firstKickCooldown = 24*2;
end--end function PerformKickbotKick



function StevenEventPlease:UNIT_SPELLCAST_CHANNEL_START(info,sender)

if (not(isKickBotting(UnitName("player")))) then return end;

if (sender == "focus") then
PerformKickbotKick();
end



end--end function UNIT_SPELLCAST_CHANNEL_START

function StevenEventPlease:UNIT_SPELLCAST_START(...)

CustomSteven:UNIT_SPELLCAST_START(...);
if (not(isKickBotting(UnitName("player")))) then return end;

if (sender == "focus") then
PerformKickbotKick();
end

end--end function UNIT_SPELLCAST_START

function CustomSteven:UNIT_AURA(UnitId)--...) 
local playeraffected = UnitName(UnitId);




end--end function UNIT_AURA

function CustomSteven:COMBAT_LOG_EVENT_UNFILTERED(timestamp, event, hideCaster, srcGUID, srcName, srcFlags, srcRaidFlags, destGUID, destName, destFlags, destRaidFlags, ...)
--http://wowwiki.wikia.com/wiki/API_COMBAT_LOG_EVENT

if (event == SPELL_AURA_APPLIED) then


end

end--end function eventunfiltered

function CustomSteven:UNIT_SPELLCAST_SUCCEEDED(...) 
spellCaster, spellName, _, spellCount = ...;

end--end function CustomSteven:UNIT_SPELLCAST_SUCCEEDED

function GetCustomStevenNameMapping(arenaboi)

local outnumber = nil;
local outname = nil;
local p1 = UnitName("player");
local p2 = UnitName("party1");
local p3 = UnitName("party2");

local pmap = {[1]="player",[2]="party1",[3]="party2"};
for i,v in pairs(pmap) do
if (UnitName(arenaboi .. "target") ~= nil and UnitName(v) ~= nil and 
	UnitName(arenaboi .. "target") == UnitName(v)) then
outnumber = i;
outname = v;

return outnumber, outname;
end--end if

end--end for







end--end function GetCustomStevenNameMapping
function updateEnemyTargetOfTargetLabels()
isArena, isRegistered = IsActiveBattlefieldArena();
if (isArena == nil) then return end

local names = {"arena1","arena2","arena3"};
local ours = {"player","party1","party2"};

for index,value in pairs(names) do
targetnumber = nil;
targetname = nil;
--determine name thing
targetnumber, targetname = GetCustomStevenNameMapping(value);

if (targetnumber ~= nil) then

_G["numberlabel" .. index]:SetParent(_G["GladiusHighlightarena" .. index]);
_G["numberlabel" .. index]:SetPoint("CENTER",_G["GladiusHighlightarena" .. index],"CENTER");
_G["numberlabel" .. index].t:SetPoint("CENTER",_G["GladiusHighlightarena" .. index],"CENTER");
_G["numberlabel" .. index].t:SetText(UnitName(targetname));
_G["numberlabel" .. index]:Show();

--_G["GladiusHealthBar" .. value]

end
end--end for




end--end function updateEnemyTargetOfTargetLabels

function CustomSteven:UNIT_SPELLCAST_START(...) 

eventname_useless, spellCaster, spellName, _, spellCount = ...;

isArena, isRegistered = IsActiveBattlefieldArena();
isArena =1;
--[[
isArena 
Integer - 1 if the player is inside an arena, nil if they aren't
isRegistered 
Integer - 1 if the player is playing a rated arena match, nil if they aren't
]]


if (isArena) then
local spellNamesToCheck = {[1]="Repentance",[2]="Fear",[3]="Polymorph",[4]="Cyclone"};
local spellColors = {[1]="|cffffffff",[2]="|cffff00ff",[3]="|cff00ff00",[4]="|cffff8800"};

local enemyArenaIndex = nil;
local playerNamesToCheck = {"arena1","arena2","arena3"};
for index,value in pairs(playerNamesToCheck) do

if (UnitName(playerNamesToCheck[index]) ~= nil and UnitName(spellCaster) == UnitName(playerNamesToCheck[index])) then

enemyArenaIndex = index;
end
end


for index,value in pairs(spellNamesToCheck) do
if (spellName == value--[[and enemyArenaIndex ~= nil]]) then
print("|cffffaa00" .. spellCaster .. " is casting " .. spellColors[index] .. spellName .. "|cff000000" .. time());
end
end--end for


end--end if isArena




end--end function CustomSteven:UNIT_SPELLCAST_START


function isKickBotting(name)
for _,names in pairs(kickBotNames) do
if (names == name) then
	return true
	end
end

return false;
end

function loadKickbotFrame()
CreateFrame("FRAME","KickBotGreenFrame");
KickBotGreenFrame:SetPoint("TOPRIGHT");
KickBotGreenFrame:SetSize(300,300);

--UnoPositionCard(card);
KickBotGreenFrame.texture = KickBotGreenFrame:CreateTexture();
KickBotGreenFrame.texture:SetColorTexture(0,1,0,1);--green
KickBotGreenFrame.texture:SetAllPoints();
KickBotGreenFrame:Hide();

CreateFrame("FRAME","KickBotYellowFrame");
KickBotYellowFrame:SetPoint("TOPRIGHT");
KickBotYellowFrame:SetSize(300,300);


KickBotYellowFrame.texture = KickBotYellowFrame:CreateTexture();
KickBotYellowFrame.texture:SetColorTexture(1,1,0,1);--Yellow
KickBotYellowFrame.texture:SetAllPoints();
KickBotYellowFrame:Hide();

end--end function loadKickbotFrame
--this is called after the variables are loaded
function CustomStevenInit()

local please = {[1]=1,[2]=2,[3]=3};
for i,v in pairs(please) do
CreateFrame("FRAME","numberlabel" .. i,_G["GladiusHealthBararena" .. i]);
_G["numberlabel" .. i]:SetAllPoints();
_G["numberlabel" .. i].t = _G["numberlabel" .. i]:CreateFontString(nil,"HIGH","GameFontNormal");
_G["numberlabel" .. i].t:SetTextColor(1,0.643,0.169,1);
_G["numberlabel" .. i].t:SetFont("Fonts\\FRIZQT__.TTF",
		600/13, "OUTLINE, MONOCHROME");

_G["numberlabel" .. i].t:SetShadowOffset(2,-1);
_G["numberlabel" .. i].t:SetPoint("CENTER");
_G["numberlabel" .. i].t:SetText("REEEE");
_G["numberlabel" .. i]:Hide();
end

SetCVar("cameraDistanceMaxZoomFactor",2.6);
StevenEventPlease:RegisterEvent("PARTY_INVITE_REQUEST");
StevenEventPlease:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START");
StevenEventPlease:RegisterEvent("UNIT_SPELLCAST_START");
StevenEventPlease:SetScript("OnEvent",function(self,event,...) self[event](self,event,...);end)


StevenPrint("steven custom addon running xd");
local myName = UnitName("Player");
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER",CustomStevenIncoming);
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY",CustomStevenIncoming);
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD",CustomStevenIncoming);
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY",CustomStevenIncoming);
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER",CustomStevenIncoming);
if (isPlayingOnBot(myName)) then
StevenPrint("NOTE: you are playing on bot right now");
end
if (isKickBotting(myName)) then
loadKickbotFrame();
StevenPrint("NOTE: you are kick botting!");
end
if (myName == "Redrockets" or myName == "Shaunmoulder") then
StevenPrint("WARNING: deleting items lmaoo");

end


end--end function CustomStevenInit