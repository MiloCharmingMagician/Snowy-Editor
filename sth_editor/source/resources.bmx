Function LoadResources()
DebugLog("Loading Default Resources.")
'Common

img_hero=LoadImage(rootdir + "common/hero.png")
img_ice1=LoadImage(rootdir + "worlds/common/ice1.png")
img_ice2=LoadImage(rootdir + "worlds/common/ice2.png")
img_score=LoadImage(rootdir + "bonuses/score.png")
img_life=LoadImage(rootdir + "bonuses/life.png")
img_fakehero=LoadImage(rootdir + "items/common/fakehero.png")
img_hammerX=LoadImage(rootdir + "items/common/hammer.png")

If gameID = "sth3"
img_trap=LoadImage(rootdir + "items/common/trap2.png")
Else
img_trap=LoadImage(rootdir + "items/common/trap.png")
EndIf

If gameID = "sth3"
img_bomb=LoadImage(rootdir + "items/common/bomb2.png")
Else
img_bomb=LoadImage(rootdir + "items/common/bomb.png")
EndIf
End Function

Function LoadWorldResources()
Local currentWorldTypeX:Int = currWorldType+1

DebugLog("Loading World Resources.")
'Common

Select currentWorldType
Case 1
img_key=LoadImage(rootdir + "items/"+gameID+"/key.png")
Case 2
img_key=LoadImage(rootdir + "items/"+gameID+"/key2.png")
Case 3
img_key=LoadImage(rootdir + "items/"+gameID+"/key3.png")
End Select

'Background
img_background=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/background/background.png")

'Blocks

'Block1
img_block_ground=LoadAnimImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/blocks/block.png",40,40,0,16)

'Cover
img_cover=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/blocks/cover.png")

'Presets
img_preset1=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/presets/40x80_1.png")
img_preset2=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/presets/40x80_2.png")
img_preset3=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/presets/40x80_3.png")
img_preset4=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/presets/80x80_1.png")

'Block2
img_block2_ground=LoadAnimImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/blocks/block2.png",40,40,0,16)

'Rock
img_block_rock=LoadAnimImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/blocks/concrete.png",40,40,0,16)

'Exit
img_exit=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/blocks/exit.png")

'Closed-Exit
img_exit_closed=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/blocks/exit_closed.png")

'Ladder
img_ladder=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/blocks/ladder.png")

'Hidden-Ladder
img_hidden_ladder=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/blocks/hidden_ladder.png")

'Hangbar
img_hbar=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/blocks/hbar.png")

'Objects

'Teleport-In
img_teleport_in=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/objects/teleport_in.png")

'Teleport-Out
img_teleport_out=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/objects/teleport_out.png")

'Hammmer
img_hammer=LoadImage(rootdir+"items/hammer.png")

'Hints
img_hint=LoadImage(rootdir+"common/hint_point.png")
img_arrow2=LoadImage(rootdir+"common/arrow2.png")

'Monsters
'MonsterGuard
If gameID = "sth1" Or gameID = "sth2" Then
Select currentWorldTypeX
Case 1
   img_monster_guard=LoadImage(rootdir+"monsters/"+gameID+"/stoneman.png")
   img_monster_guard_smart=LoadImage(rootdir+"monsters/"+gameID+"/stoneman_smart.png")
   img_monster_guard_right=LoadImage(rootdir+"monsters/"+gameID+"/stoneman_left.png")
   img_monster_guard_smart_left=LoadImage(rootdir+"monsters/"+gameID+"/stoneman_smart_right.png")
Case 2
   img_monster_guard=LoadImage(rootdir+"monsters/"+gameID+"/stoneman2.png")
   img_monster_guard_smart=LoadImage(rootdir+"monsters/"+gameID+"/stoneman2_smart.png")
   img_monster_guard_right=LoadImage(rootdir+"monsters/"+gameID+"/stoneman_left.png")
   img_monster_guard_smart_left=LoadImage(rootdir+"monsters/"+gameID+"/stoneman_smart_right.png")
Case 3
   img_monster_guard=LoadImage(rootdir+"monsters/"+gameID+"/stoneman2.png")
   img_monster_guard_smart=LoadImage(rootdir+"monsters/"+gameID+"/stoneman2_smart.png")
   img_monster_guard_left=LoadImage(rootdir+"monsters/"+gameID+"/stoneman2_left.png")
   img_monster_guard_smart_right=LoadImage(rootdir+"monsters/"+gameID+"/stoneman2_smart_right.png")
End Select
Else
   img_monster_guard=LoadImage(rootdir+"monsters/"+gameID+"/stoneman.png")
   img_monster_guard_smart=LoadImage(rootdir+"monsters/"+gameID+"/stoneman2.png")
   img_monster_guard_left=LoadImage(rootdir+"monsters/"+gameID+"/stoneman_left.png")
   img_monster_guard_smart_right=LoadImage(rootdir+"monsters/"+gameID+"/stoneman2_right.png")
EndIf

'MonsterSmart

Select currentWorldTypeX
Case 1
img_monster_smart=LoadImage(rootdir+"monsters/"+gameID+"/mummy.png")
img_monster_smart_spawner=LoadImage(rootdir+"monsters/"+gameID+"/mummy_spawner.png")
Case 2
img_monster_smart=LoadImage(rootdir+"monsters/"+gameID+"/cyclop.png")
img_monster_smart_spawner=LoadImage(rootdir+"monsters/"+gameID+"/cyclop_spawner.png")
Case 3
img_monster_smart=LoadImage(rootdir+"monsters/"+gameID+"/troll.png")
img_monster_smart_spawner=LoadImage(rootdir+"monsters/"+gameID+"/troll_spawner.png")
End Select

'Gems

'Gem1
img_gem1=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/gems/gem1.png")

'Gem2
img_gem2=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/gems/gem2.png")

'Gem3
img_gem3=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/gems/gem3.png")

'Gem4
img_gem4=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/gems/gem4.png")

'Gem5
img_gem5=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/gems/gem5.png")

'Gem6
img_gem6=LoadImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/gems/gem6.png")
End Function