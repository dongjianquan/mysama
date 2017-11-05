
function tuodong_canshu(arr,t1,t2,t3)
  t1 = t1 or 20
  t2 = t2 or 1000
  t3 = t3 or 20
  p0 = pos:new(arr[1],arr[2])
  p1 = pos:new(arr[3],arr[4])
  p0:touchMoveTo(p1, t1, t2, t3)
  mSleep(100)
end

function tuodong_xuantu(arr,t1,t2,t3,num,state)
  local step = t1 or 20
  local sleep1 = t2 or 500
  local sleep2 = t3 or 20
  local x, y, x2, y2, index = arr[1], arr[2], arr[3], arr[4], math.random(1,5)
  touchDown(index, x, y)
  
  local function move(from, to) 
    if from > to then
      do 
        return -1 * step 
      end
    else 
      return step 
    end 
  end
  
  
  while (math.abs(x-x2) >= step) or (math.abs(y-y2) >= step) do
    if math.abs(x-x2) >= step then 
      x = x + move(x,x2)
    end
    if math.abs(y-y2) >= step then 
      y = y + move(y,y2) 
    end
    touchMove(index, x, y)
    mSleep(sleep2)
  end
  
  touchMove(index, x2, y2)
  mSleep(sleep1)
  local x,y = 章节选择(num)
  touchUp(index, x2, y2)
  if x > 0 then
    sysLog("拖动中间判定")
    if state == 1 then
      click(x+30,y+40)
    else
      click(x+10,y+40)
    end
    全局break = true
  end
  mSleep(100)
  --sysLog("等待1秒")
end

function tuodong(x1,y1,x2,y2)
  p0 = pos:new(x1,y1)
  p1 = pos:new(x2,y2)
  p0:touchMoveTo(p1, 20, 1000, 25)
  mSleep(500)
end

function tuodong1(x1,y1,x2,y2)
  p0 = pos:new(x1,y1)
  p1 = pos:new(x2,y2)
  p0:touchMoveTo(p1, 3, 1000, 25)
  mSleep(1000)
end

function tuodong2(arr)
  p0 = pos:new(arr[1],arr[2])
  p1 = pos:new(arr[3],arr[4])
  p0:touchMoveTo(p1, 3, 1000, 25)
  mSleep(500)
end

function tuodong3(arr)
  p0 = pos:new(arr[1],arr[2])
  p1 = pos:new(arr[3],arr[4])
  p0:touchMoveTo(p1, 20, 1000, 25)
  mSleep(500)
end

function 换狗粮拖动(arr)
p0 = pos:new(arr[1],arr[2])
p1 = pos:new(arr[3],arr[4])
p0:touchMoveTo(p1, 20, 500, 25)
mSleep(300)
end

function tuodong4(arr)
  p0 = pos:new(arr[1],arr[2])
  p1 = pos:new(arr[3],arr[4])
  p0:touchMoveTo(p1, 20, 100, 20)
  mSleep(100)
end
function tuodong5(arr)
  p0 = pos:new(arr[1],arr[2])
  p1 = pos:new(arr[3],arr[4])
  p0:touchMoveTo(p1, 100, 10, 20,true)
  mSleep(100)
end
function tuodong6(arr)
  p1 = pos:new(arr[1],arr[2])
  p0 = pos:new(arr[3],arr[4])
  p0:touchMoveTo(p1, 100, 10, 20,true)
  mSleep(100)
end
function tuodong7(arr)
  p0 = pos:new(arr[1],arr[2])
  p1 = pos:new(arr[3],arr[4])
  p0:touchMoveTo(p1, 3, 200, 25)
  -- mSleep(500)
end
function tuodong6_1(arr)
  p1 = pos:new(arr[1],arr[2])
  p0 = pos:new(arr[3],arr[4])
  p1:touchMoveTo(p0, 100, 10, 20)
  mSleep(100)
end
function tuodong7_1(arr)
  p0 = pos:new(arr[1],arr[2])
  p1 = pos:new(arr[3],arr[4])
  p1:touchMoveTo(p0, 3, 200, 25)
  -- mSleep(500)
end
function random_time()
  return math.random(延迟随机最小值+500,延迟随机最大值+500)
end

function random_click(x,y,range_t)
  --if x ~= 51 then
  --sysLog(x..":"..y)
  --end
	local _w = 1
	local _h = 1
	if 目前是缩放状态 then
		if w== 640 or w== 750 or w==1242 or w == 720 or w== 1080 or w==1440 or h== 1334 or h == 2208 then
			_w = 640
			_h = 1136
		else
			_w = 768
			_h = 1024
		end
	else
		_w = w
		_h = h
	end
	
	local range = range_t or 10
	if w == 768 then
		range = 5
	end
  local rac = math.random(1,range)
  local rass = math.random(1,2)
  if rass == 1 then
    x = x + rac
  else
    x = x - rac
  end
  if x <=0 then
		x = 2
	end
	if x >= _h then
		x = _h - 2
	end
  rac = math.random(1,range)
  rass = math.random(1,2)
  if rass == 1 then
    y = y + rac
  else
    y = y - rac
  end
	if y <=0 then
		y = 2
	end
	if y >= _w then
		y = _w - 2
	end
  return x,y
end

function showHD(str)
  showHUD(id,str,20,"0xff130c09","0xffffffff",0,250,0,250,30) 
end

function showHD_b(str)
  if 开启脚本提示 == 1 then
    if w*h == 768*1024 or w*h == 1536*2048 then
      showHUD(id,str,20,"0xff130c09","0xffffffff",0,220,0,200,27) 
    else
      showHUD(id,str,20,"0xff130c09","0xffffffff",0,250,0,250,30) 
    end
  end
end

function showHD_c(x,y)
  if 开启点击提示 == 1 and 功能 ~= 5 and 功能 ~= 10 and 当前在什么妖气目标里==0 then
    id2 = createHUD()
    if w*h == 768*1024 or w*h == 1536*2048 then
      showHUD(id2,"",20,"0xff130c09","3.gif",0,x+2,y+2,30,30) 
    else
      showHUD(id2,"",20,"0xff130c09","3.gif",0,x+2,y+2,30,30) 
    end
    mSleep(200)
    hideHUD(id2)
  end
end

function writeLog(str)
  local logFileName = "[public]yys_record.txt"
  
  if false then
    isRemoveLogFile = false
    removeLogFile(logFileName)
  end
  
  --if isDebug then
  local file = io.open(logFileName, "a")
  if file then
    file:write(os.date("%Y-%m-%d %H:%M:%S", os.time()))
    file:write("  ")
    file:write(str)
    file:write("\n")
    file:close()
  end
  -- end
  
end

function sortFunc(a,b)
  if a[2] == b[2] then
    return a[1] < b[1]
  else
    return a[2] < b[2]
  end
end

function random_click_init()
          点击间隔 = math.floor((mTime() - 上次点击时间)/1000)
          if 点击间隔 >= 点击间隔小 and 点击间隔 > 上次点击间隔 then
            if 点击间隔 > 点击间隔大 then
              点击间隔 = 点击间隔大
            end
            上次点击间隔 = 点击间隔
            local 随机一下 = math.random(1,点击间隔大)
            --sysLog("点击间隔"..点击间隔)
            --sysLog("随机一下"..随机一下)
            if 随机一下 <= 点击间隔 then
              sysLog("随机一下"..随机一下)
              if multiColor2(战斗中,90) == false and multiColor2(组队界面,90) == false and multiColor2(副本大地图,90) == false and multiColor2(战斗中,90) == false and multiColor2(觉醒挑战界面,90) == false and multiColor2(御灵挑战界面,90) == false and multiColor2(领奖结束,90) == false and multiColor2(更换式神界面,90) ==false and multiColor2(更换式神界面1,90) ==false and multiColor2(更换式神界面2,90) == false and multiColor2(更换式神界面3,90) ==false and multiColor2(更换式神界面日服,90) == false then
                local rx = math.random(100,540)
                local ry = math.random(100,540)
                click(rx,ry)
                
              end
              上次点击时间 = mTime()
              上次点击间隔 = 0
              mSleep(1000)
            end
          end
end		

function random_sleep_init()
          发呆间隔 = math.floor(math.floor((mTime() - 上次发呆时间)/1000)/60)
          if 发呆间隔 >= 发呆间隔小 and 发呆间隔 > 上次发呆间隔 then
            if 发呆间隔 > 发呆间隔大 then
              发呆间隔 = 发呆间隔大
            end
            上次发呆间隔 = 发呆间隔
            local 随机一下 = math.random(1,发呆间隔大)
            sysLog("发呆间隔"..发呆间隔)
            sysLog("随机一下"..随机一下)
            if 随机一下 <= 发呆间隔 then
              sysLog("随机一下"..随机一下)
              local 要发呆多久 = math.random(发呆时长1,发呆时长2)
              sysLog("要发呆多久"..要发呆多久)
              上次发呆时间 = mTime()
              for i=1,600 do
                showHD_b("随机发呆，剩余"..math.floor(要发呆多久 - (mTime() - 上次发呆时间)/1000).."秒")
                if mTime() - 上次发呆时间 > 要发呆多久*1000 then
                  上次发呆时间 = mTime()
                  上次发呆间隔 = 0
                  sysLog("发呆结束")
                  break
                end
                mSleep(900)
              end
            end
          end
end