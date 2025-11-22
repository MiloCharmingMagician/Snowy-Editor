'Maps
Global rootdir:String = "editor_data\"
Global packsdir:String = "packs\"
Global gameID:String = "sth3"
Global fixed:Int = 16
Global mapPropMax:Int = 100
Global mapWidth:Short[1000]
Global mapHeight:Short[1000]
Global mapConfig:Short[1000,7]
Global mapData:Short[1000, 100, 100, 2]
Global mapPropData:Int[1000,102]
Global flags:Short[1000, 5301]
Global tsize:Int = 40
Global tiletype:Int = 1
Global worldType[1000]
Global currWorldType:Int = 0
Global editmode:Int = 0
Global mapVersion1:Int = 18516
Global mapVersion2:Int = 21576
Global mapVersion3:Int = 13140
Global currMapVersion:Int = 0
Global levelCount:Int = 0
Global currLv:Int = 0
Global episode:Int = 0
Global mode:Int = 0
Global state:Int = 0
'Background
Global img_background:TImage
'Blocks
Global img_block_ground:TImage
Global img_block2_ground:TImage
Global img_block_rock:TImage
Global img_hero:TImage
Global img_ladder:TImage
Global img_hidden_ladder:TImage
Global img_hbar:TImage
Global img_key:TImage
Global img_exit:TImage
Global img_exit_closed:TImage
'Presets
Global img_preset1:TImage
Global img_preset2:TImage
Global img_preset3:TImage
Global img_preset4:TImage
'Objects
Global img_teleport_in:TImage
Global img_teleport_out:TImage
Global img_cover:TImage
'Ice
Global img_ice1:TImage
Global img_ice2:TImage
'Monsters
Global img_monster_guard:TImage
Global img_monster_guard_smart:TImage
Global img_monster_guard_left­­­­­­­:TImage
Global img_monster_guard_smart_right:TImage

Global img_monster_smart:TImage
Global img_monster_smart2:TImage
Global img_monster_smart_spawner:TImage
Global img_monster_smart2_spawner:TImage
'Gems
Global img_gem1:TImage
Global img_gem2:TImage
Global img_gem3:TImage
Global img_gem4:TImage
Global img_gem5:TImage
Global img_gem6:TImage
'Bonuses
Global img_score:TImage
Global img_life:TImage
'Items
Global img_trap:TImage
Global img_fakehero:TImage
Global img_bomb:TImage
Global img_hammerX:TImage
'Camera
Global camera_x:Int = 0
Global camera_y:Int = 0
Global scroll_x:Int = 0
Global scroll_y:Int = 0
'Hint
Global img_hint:TImage
Global img_arrow2:TImage
Global img_arrow1:TImage
'Animations
Global AnimFrame:Int[10]
Global AnimMode:Int[10]

'Editor UI Globals
Global ui_editor_grid_active:Byte = 0
Global ui_editor_panel_active:Byte = 0
Global ui_editor_panel_flag:Byte=0
Global ui_editor_panel_x:Int=0
Global ui_editor_panel_y:Int=0
Global ui_click_block:Byte=0
Global BtnOffUICount:Int=16
Global BtnOnUICount:Int=16
Global BtnNameTable:String[32, 2]

'Editor UI Resources
Global img_editor_panel:TImage
Global img_ui_up:TImage
Global img_ui_down:TImage
Global img_ui_btn_world:TImage[3]
Global img_ui_btn:TImage[32, 2]