-- @version 0.1
-- @description Force all tracks to a set height
-- @metapackage
-- @provides
--  [main] . > MHH-Set-Track-height (Large)
--  [main] . > MHH-Set-Track-height (Medium)
--  [main] . > MHH-Set-Track-height (Small)
--  [main] . > MHH-Set-Track-height (Compact)

local sizes = {
    Large = 150,
    Medium = 100,
    Small = 50,
    Compact = 40
}

local script_name = ({reaper.get_action_context()})[2]:match("([^/\\_]+)%.lua$")
local slot = (script_name:match("%((%a+)%)"))

local trackcount = reaper.CountTracks(0)


reaper.Undo_BeginBlock()
--
for track_index = 0, trackcount-1 do
  tr = reaper.GetTrack(0, track_index)
  reaper.SetMediaTrackInfo_Value(tr, 'I_HEIGHTOVERRIDE', 40)
end

reaper.TrackList_AdjustWindows(0)
reaper.UpdateTimeline()
--
reaper.Undo_Endblock(script_name, 1)
