
local filterstrings = {
	"^Recount - (.*)$",
	"%d+%. %S+%s*%d+ %([%d.]+, [%d.]+%%%)", -- Recount
--~ 	"^(%d+). (.*)$", -- Also Recount
	"%d+%. - [%d.]+%%% %S+%s*%d+", -- ???
}


local function filter(self, event, msg)
	for _,str in pairs(filterstrings) do if msg:match(str) then return true end end
end


for _,event in pairs{"CHAT_MSG_YELL", "CHAT_MSG_WHISPER", "CHAT_MSG_SAY", "CHAT_MSG_RAID", "CHAT_MSG_GUILD", "CHAT_MSG_OFFICER", "CHAT_MSG_PARTY"} do
	ChatFrame_AddMessageEventFilter(event, filter)
end
