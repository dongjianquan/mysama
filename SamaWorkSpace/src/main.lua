-----主函数文件

init(0,1)

w,h = getScreenSize();
version =1--1普通版，2鬼王版，3只有鬼王
notice_version = 16
ver = getOSType() 
ui = require "G_ui"

require "TsLib" --加载函数库
bb = require("badboy")
pos = bb.loadpos()
needScale = false
require "change_acc"

hud_x = 0
hud_y = 0
if w == 640 and h==1136 then
  --require "640"
  hud_x = 470
  hud_y = 585	
elseif w == 768 and h==1024 then
  hud_x = 450
  hud_y = 710
else                 
  -- needScale = true
  if w== 750 or w==1242 or w == 720 or w== 1080 or w==1440 or h== 1334 or h == 2208 then
    -- require "640"
    -- setScreenScale(640, 1136);
    hud_x = 470
    hud_y = 585
  elseif w == 768 or w== 1536 or w == 1024 or w == 2048 then
    hud_x = 450
    hud_y = 710
  else
    toast("您的手机分辨率为"..h.."*"..w.."。很抱歉，不支持您的手机分辨率。")
    mSleep(1000)
    lua_exit()
  end
end

require "data" --加载全局变量定义

function main()
	toast("您的手机分辨率为"..h.."*"..w)
  if w == 640 and h==1136 then
    require "640"
  elseif w == 768 or w == 1024 then
    require "768"
  else                 
    needScale = true
    if w== 750 or w==1242 or w == 720 or w== 1080 or w==1440 or h== 1334 or h == 2208 then
      require "640"
      setScreenScale(640, 1136);
    elseif w == 1536 or w == 2048 then
      require "768"
      setScreenScale(768, 1024);
    else
      toast("您的手机分辨率为"..h.."*"..w.."。很抱歉，不支持您的手机分辨率。")
      mSleep(1000)
      lua_exit()
    end
  end

  local temp_version = getNumberConfig("temp_version",1)
  if temp_version ~= notice_version then
    --first_ui()
    setNumberConfig("temp_version",notice_version)
  end

  --if version == 1 then
		require "main_new"
		main_new()
		lua_exit()
 
end

main()


if	needScale  then
  resetScreenScale() 
end