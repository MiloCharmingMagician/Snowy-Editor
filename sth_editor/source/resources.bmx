Function LoadResources()
DebugLog("Loading Default Resources.")
'Common

img_hero=LoadAnimImage(rootdir + "common/hero.png", 64, 64, 0, 31)
img_ice1=LoadAnimImage(rootdir + "worlds/common/ice1.png", 64, 64, 0, 31)
img_ice2=LoadAnimImage(rootdir + "worlds/common/ice2.png", 64, 64, 0, 31)
img_score=LoadAnimImage(rootdir + "bonuses/score.png", 64, 64, 0, 31)
img_life=LoadAnimImage(rootdir + "bonuses/life.png", 64, 64, 0, 31)
img_fakehero=LoadAnimImage(rootdir + "items/common/fakehero.png", 64, 64, 0, 31)
img_hammerX=LoadAnimImage(rootdir + "items/common/hammer.png", 64, 64, 0, 31)

If gameID = "sth3"
img_trap=LoadAnimImage(rootdir + "items/common/trap2.png", 64, 64, 0, 31)
Else
img_trap=LoadAnimImage(rootdir + "items/common/trap.png", 64, 64, 0, 31)
EndIf

If gameID = "sth3"
img_bomb=LoadAnimImage(rootdir + "items/common/bomb2.png", 64, 64, 0, 31)
Else
img_bomb=LoadAnimImage(rootdir + "items/common/bomb.png", 64, 64, 0, 31)
EndIf

LoadUIResources()
End Function

Function LoadUIResources()
    img_editor_panel=LoadImage(rootdir + "editor/editor_panel.png", 0)
    img_ui_up=LoadImage(rootdir + "editor/up.png", 0)
    img_ui_down=LoadImage(rootdir + "editor/down.png", 0)
    img_ui_btn_world[0]=LoadImage(rootdir + "editor/world1.png", 0)
    img_ui_btn_world[1]=LoadImage(rootdir + "editor/world2.png", 0)
    img_ui_btn_world[2]=LoadImage(rootdir + "editor/world3.png", 0)

    'Buttons Off
    BtnNameTable[0,0]="worker_off"
    BtnNameTable[1,0]="bomb_off"
    BtnNameTable[2,0]="bonusitem_off"
    BtnNameTable[3,0]="hammer_off"
    BtnNameTable[4,0]="gold1_off"
    BtnNameTable[5,0]="gold2_off"
    BtnNameTable[6,0]="gold3_off"
    BtnNameTable[7,0]="gold4_off"
    BtnNameTable[8,0]="gold5_off"
    BtnNameTable[9,0]="gold6_off"
    BtnNameTable[10,0]="grid_off"
    BtnNameTable[11,0]="exit_off"
    BtnNameTable[12,0]="guardleft_off" 
    BtnNameTable[13,0]="guardright_off"
    BtnNameTable[14,0]="guard2left_off" 
    BtnNameTable[15,0]="guard2right_off"

    For i = 0 To BtnOffUICount - 1
        img_ui_btn[i,0]=LoadImage(rootdir+"editor\"+BtnNameTable[i,0]+".png", 0)
        DebugLog(rootdir + "editor\"+BtnNameTable[i,0]+".png")
    Next
End Function

Function LoadWorldResources()
Local currentWorldTypeX:Int = currWorldType+1

DebugLog("Loading World Resources.")
'Common

Select currentWorldType
Case 1
img_key=LoadAnimImage(rootdir + "items/"+gameID+"/key.png", 64, 64, 0, 31)
Case 2
img_key=LoadAnimImage(rootdir + "items/"+gameID+"/key2.png", 64, 64, 0, 31)
Case 3
img_key=LoadAnimImage(rootdir + "items/"+gameID+"/key3.png", 64, 64, 0, 31)
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
img_exit=LoadAnimImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/blocks/exit.png", 64, 64, 0, 31)

'Closed-Exit
img_exit_closed=LoadAnimImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/blocks/exit_closed.png", 64, 64, 0, 31)

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
img_hammer=LoadAnimImage(rootdir+"items/hammer.png", 64, 64, 0, 31)

'Hints
img_hint=LoadAnimImage(rootdir+"common/hint_point.png", 64, 64, 0, 31)
img_arrow2=LoadAnimImage(rootdir+"common/arrow2.png", 64, 64, 0, 31)
img_arrow1=LoadAnimImage(rootdir+"common/arrow1.png", 64, 64, 0, 31)

'Monsters
'MonsterGuard
If gameID = "sth1" Or gameID = "sth2" Then
Select currentWorldTypeX
Case 1
   img_monster_guard=LoadAnimImage(rootdir+"monsters/"+gameID+"/stoneman.png", 64, 64, 0, 31)
   img_monster_guard_smart=LoadAnimImage(rootdir+"monsters/"+gameID+"/stoneman_smart.png", 64, 64, 0, 31)
Case 2
   img_monster_guard=LoadAnimImage(rootdir+"monsters/"+gameID+"/stoneman2.png", 64, 64, 0, 31)
   img_monster_guard_smart=LoadAnimImage(rootdir+"monsters/"+gameID+"/stoneman2_smart.png", 64, 64, 0, 31)
Case 3
   img_monster_guard=LoadAnimImage(rootdir+"monsters/"+gameID+"/stoneman2.png", 64, 64, 0, 31)
   img_monster_guard_smart=LoadAnimImage(rootdir+"monsters/"+gameID+"/stoneman2_smart.png", 64, 64, 0, 31)
End Select
Else
   img_monster_guard=LoadAnimImage(rootdir+"monsters/"+gameID+"/stoneman.png", 64, 64, 0, 31)
   img_monster_guard_smart=LoadAnimImage(rootdir+"monsters/"+gameID+"/stoneman2.png", 64, 64, 0, 31)
EndIf

'MonsterSmart

Select currentWorldTypeX
Case 1
img_monster_smart=LoadAnimImage(rootdir+"monsters/"+gameID+"/mummy.png", 64, 64, 0, 31)
img_monster_smart_spawner=LoadAnimImage(rootdir+"monsters/"+gameID+"/mummy_spawner.png", 64, 64, 0, 31)
Case 2
img_monster_smart=LoadAnimImage(rootdir+"monsters/"+gameID+"/cyclop.png", 64, 64, 0, 31)
img_monster_smart_spawner=LoadAnimImage(rootdir+"monsters/"+gameID+"/cyclop_spawner.png", 64, 64, 0, 31)
Case 3
img_monster_smart=LoadAnimImage(rootdir+"monsters/"+gameID+"/troll.png", 64, 64, 0, 31)
img_monster_smart_spawner=LoadAnimImage(rootdir+"monsters/"+gameID+"/troll_spawner.png", 64, 64, 0, 31)
End Select

'Gems

'Gem1
img_gem1=LoadAnimImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/gems/gem1.png", 64, 64, 0, 31)

'Gem2
img_gem2=LoadAnimImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/gems/gem2.png", 64, 64, 0, 31)

'Gem3
img_gem3=LoadAnimImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/gems/gem3.png", 64, 64, 0, 31)

'Gem4
img_gem4=LoadAnimImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/gems/gem4.png", 64, 64, 0, 31)

'Gem5
img_gem5=LoadAnimImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/gems/gem5.png", 64, 64, 0, 31)

'Gem6
img_gem6=LoadAnimImage(rootdir+"worlds/"+gameID+"/"+currentWorldTypeX+"/gems/gem6.png", 64, 64, 0, 31)
End Function