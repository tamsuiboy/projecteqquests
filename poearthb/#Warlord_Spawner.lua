function event_signal(e)
  -- get quest globals
  local qglobals = eq.get_qglobals();

  if (qglobals["poeb_Galronar"] and qglobals["poeb_Birak"] and qglobals["poeb_Awisano"] ) then
    eq.spawn2(222019, 0, 0, 415,161,-55,383); -- NPC: #Warlord_Gintolaken
  end
end
