--Author: Soccerbilly aka Gangsthurh (Steven Ventura)
--Date Created: 6/13/17
--purpose: addon template
CustomSteven = CreateFrame("Frame");


CustomSteven:SetScript("OnUpdate", function(self, elapsed) CustomStevenOnUpdate(self, elapsed) end)
CustomSteven:RegisterEvent("VARIABLES_LOADED");

kickBotNames = {"Assatashakur"};

botNames = {"Fourchan","Greenones","Removekebabs","Thisisbrazil","Jonniffer"};
StevenBotFrame = {};
StevenBotFrame.acceptDelayTimer = 0;
StevenBotFrame.depositingState = false;

function CustomStevenIncoming(ChatFrameSelf, event, msg, author, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
  
  namae = CustomStevenSplitString(author,"-")[1];
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

CustomStevenFirstLoop = true;
lagLess = 0;
CustomStevenTimeDelayThing = 0.05;
function CustomStevenOnUpdate(self, elapsed)

lagLess = lagLess + elapsed;
if (lagLess < CustomStevenTimeDelayThing) then  return end
lagLess = 0;
--do stuff here
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
return name == "Fourchan";
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

function StevenEventPlease:UNIT_SPELLCAST_START(info,sender)

if (not(isKickBotting(UnitName("player")))) then return end;

if (sender == "focus") then
PerformKickbotKick();
end

end--end function UNIT_SPELLCAST_START




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