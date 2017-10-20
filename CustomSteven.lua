--Author: Soccerbilly aka Gangsthurh (Steven Ventura)
--Date Created: 6/13/17
--purpose: addon template
CustomSteven = CreateFrame("Frame");


CustomSteven:SetScript("OnUpdate", function(self, elapsed) CustomStevenOnUpdate(self, elapsed) end)
CustomSteven:RegisterEvent("VARIABLES_LOADED");

botNames = {"Jen"};
StevenBotFrame = {};
StevenBotFrame.acceptDelayTimer = 0;

function CustomStevenIncoming(ChatFrameSelf, event, msg, author, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
  
  
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
CustomStevenTimeDelayThing = 0.5;
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

if (isPlayingOnBot(myName)) then

--check if he not in a group
if (UnitName("party4") ~= nil) then return end;--full party.
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





function isPlayingOnBot(name)
for _,bname in pairs(botNames) do if (bname == name) then return true end end 
return false
end

StevenEventPlease = CreateFrame("FRAME");
function StevenEventPlease:PARTY_INVITE_REQUEST(info,sender)
StevenPrint("received a party invite request");
if (isPlayingOnBot(sender)) then
AcceptGroup();
StevenPrint("accepting bot invite now");
end

end--end function accepttheinvite

--this is called after the variables are loaded
function CustomStevenInit()

StevenEventPlease:RegisterEvent("PARTY_INVITE_REQUEST");
StevenEventPlease:SetScript("OnEvent",function(self,event,...) self[event](self,event,...);end)


StevenPrint("steven custom addon running xd");
local myName = UnitName("Player");
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL",CustomStevenIncoming);
if (isPlayingOnBot(myName)) then
StevenPrint("NOTE: you are playing on bot right now");
end
if (myName == "Redrockets" or myName == "Shaunmoulder") then
StevenPrint("WARNING: deleting items lmaoo");

end


end--end function CustomStevenInit