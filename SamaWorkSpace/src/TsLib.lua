click_time = 0
xxxx= {629,555,714,637}
--=====================--TS扩展LUA库[找色/比色]--=====================--
function xx点击(x,y,随机半径,显示红点时间)---随机半径单位为像素
  local width,height = getScreenSize()
  math.randomseed(tostring(os.time()):reverse():sub(1, 7)) ---设置时间种子
  ---下面按随机半径计算要增加或减少的像素
  --local j = math.random(0,360)--随机角度
  --local a = math.cos(math.rad(j))*math.random(0,随机半径)
  --local b = math.sin(math.rad(j))*math.random(0,随机半径)
  --x,y = x + a,y + b
  ---------=============
  ------下面为超限纠错
  --if x < 0 then x = 0 end
  --if x >= height then x = height-1 end
  --if y < 0 then y = 1 end
  --if y >= width then y = width -1 end
  ---==================
  touchDown(1, x, y)
  local id = createHUD()---创建HUD用于显示点击位置圆点
  local s = height * 0.018 --用于按屏幕大小缩放显示圆点大小
  showHUD(id,"",1,"0xffff0000","d.png",0,x-s,y-s,s*2,s*2)---d.png为圆点图片，可以用PS做一个
  mSleep(100+math.random(0,100))
  touchUp(1,x,y)
  mSleep(显示红点时间)
  hideHUD(id)
  mSleep(100)--要留点时间让红点消失，否则有可能影响找图找色
end

function click(x,y)
  xx点击(x,y,1,200)
  --touchDown(1,x,y)
  --mSleep(30)
  --touchUp(1,x,y)
  --start_time = mTime()
	--showHD_c(x,y)
	--if isInRange(x,y,xxxx) then
		--sysLog("点击了"..x..":"..y)
		----lua_exit()
	--end
end

-- 函数:单点比色
function isColor(x,y,c,s)
  keepScreen(true)
  local fl,abs = math.floor,math.abs
  s = fl(0xff*(100-s)*0.01)
  --sysLog(tostring(c))
  local r,g,b = fl(c/0x10000),fl(c%0x10000/0x100),fl(c%0x100)
  --sysLog(r..":"..g..":"..b)
  local rr,gg,bb = getColorRGB(x,y)
  --sysLog(rr..":"..gg..":"..bb)
  keepScreen(false)
  if abs(r-rr)<s and abs(g-gg)<s and abs(b-bb)<s then
    return true
  end
end

function isColor1(x,y,c,s)
  keepScreen(true)
  local fl,abs = math.floor,math.abs
  s = fl(0xff*(100-s)*0.01)
  --sysLog(tostring(c))
  local r,g,b = fl(c/0x10000),fl(c%0x10000/0x100),fl(c%0x100)
  sysLog(r..":"..g..":"..b)
  local rr,gg,bb = getColorRGB(x,y)
  sysLog(rr..":"..gg..":"..bb)
  keepScreen(false)
  if abs(r-rr)<s and abs(g-gg)<s and abs(b-bb)<s then
		sysLog("true")
    return true
  end
	sysLog("false")
end

function isColorArray(arr,s)
  local fl,abs = math.floor,math.abs
  --keepScreen(true)
  s = fl(0xff*(100-s)*0.01)
	if arr ==nil then
		return false
	end
  local r,g,b = fl(arr[3]/0x10000),fl(arr[3]%0x10000/0x100),fl(arr[3]%0x100)
  local rr,gg,bb = getColorRGB(arr[1],arr[2])
	--sysLog(arr[1]..":"..arr[2])
	--sysLog(r..":"..g..":"..b)
	--sysLog(rr..":"..gg..":"..bb)
	--sysLog("===============================")
  if abs(r-rr)<s and abs(g-gg)<s and abs(b-bb)<s then
   -- keepScreen(false)
    return true
  end
 -- keepScreen(false)
  return false
end

function isColorArray1(arr,s)
  local fl,abs = math.floor,math.abs
  keepScreen(true)
  s = fl(0xff*(100-s)*0.01)
  local r,g,b = fl(arr[3]/0x10000),fl(arr[3]%0x10000/0x100),fl(arr[3]%0x100)
	sysLog(arr[1]..":"..arr[2])
	sysLog(r..":"..g..":"..b)
  local rr,gg,bb = getColorRGB(arr[1],arr[2])
	 sysLog(rr..":"..gg..":"..bb)
  if abs(r-rr)<s and abs(g-gg)<s and abs(b-bb)<s then
    keepScreen(false)
		sysLog("true")
    return true
  end
  keepScreen(false)
	sysLog("false")
  return false
end

function isColorArray2(arr,s)
  local fl,abs = math.floor,math.abs
	if arr ==nil then
		return false
	end
  keepScreen(true)
  s = fl(0xff*(100-s)*0.01)
  local r,g,b = fl(arr[3]/0x10000),fl(arr[3]%0x10000/0x100),fl(arr[3]%0x100)
	--sysLog(r..":"..g..":"..b)
  local rr,gg,bb = getColorRGB(arr[1],arr[2])
	-- sysLog(rr..":"..gg..":"..bb)
  if abs(r-rr)<s and abs(g-gg)<s and abs(b-bb)<s then
    keepScreen(false)
	--	sysLog("true")
    return true
  end
 -- keepScreen(false)
--	sysLog("false")
  return false
end

-- 函数:多点比色
function multiColor(array,s)
  s = math.floor(0xff*(100-s)*0.01)
		if array ==nil then
		return false
	end
		if #array == 0 then
		return false
	end
  keepScreen(false)
  keepScreen(true)
  for var = 1, #array do
    --sysLog(var)
    local lr,lg,lb = getColorRGB(array[var][1],array[var][2])
    local r = math.floor(array[var][3]/0x10000)
    local g = math.floor(array[var][3]%0x10000/0x100)
    local b = math.floor(array[var][3]%0x100)
    if math.abs(lr-r) > s or math.abs(lg-g) > s or math.abs(lb-b) > s then
      keepScreen(false)
      return false
    end
  end
  keepScreen(false)
  return true
end

-- 函数:多点比色
function multiColor2(array,s)
  s = math.floor(0xff*(100-s)*0.01)
	if array ==nil then
		return false
	end
	if #array == 0 then
		return false
	end
  for var = 1, #array do
    --sysLog(array[var][1]..":"..array[var][2])
    local lr,lg,lb = getColorRGB(array[var][1],array[var][2])
    local r = math.floor(array[var][3]/0x10000)
    local g = math.floor(array[var][3]%0x10000/0x100)
    local b = math.floor(array[var][3]%0x100)
    --sysLog("实际颜色="..lr..":"..lg..":"..lb)
    --sysLog("表格颜色="..r..":"..g..":"..b)
    if math.abs(lr-r) > s or math.abs(lg-g) > s or math.abs(lb-b) > s then
			--sysLog("false"..array[1][1]..":"..array[1][2])
      return false
    end
  end
	--if array[1][1]== 843 and array[1][2]== 626 then
	--else
	--print(array)
	--end
	--sysLog("true"..array[1][1]..":"..array[1][2])
  return true
end

function multiColor3(array,s,num)
	num = num or #array - 1
  s = math.floor(0xff*(100-s)*0.01)
	if array ==nil then
		return false
	end
	if #array == 0 then
		return false
	end
	local true_num = 0
  for var = 1, #array do
    local lr,lg,lb = getColorRGB(array[var][1],array[var][2])
    local r = math.floor(array[var][3]/0x10000)
    local g = math.floor(array[var][3]%0x10000/0x100)
    local b = math.floor(array[var][3]%0x100)
    if math.abs(lr-r) > s or math.abs(lg-g) > s or math.abs(lb-b) > s then
    else
			true_num = true_num + 1
		end
  end
	if true_num >= num then
		return true
	else
		return false
	end
end

function multiColor1(array,s)
  s = math.floor(0xff*(100-s)*0.01)
	if array ==nil then
		return false
	end
	if #array == 0 then
		return false
	end
  keepScreen(true)
	sysLog(s)
        --current_time = os.date("%Y-%m-%d-%H-%M-%S", os.time());
  --snapshot(current_time..".png", 0, 0, 719, 1279);  --截图并以当前时间戳命名
  for var = 1, #array do
    --sysLog(h- array[var][1]..":"..w -array[var][2])
    --local lr,lg,lb = getColorRGB(h - array[var][1],w - array[var][2])
		sysLog(array[var][1]..":"..array[var][2])
    local lr,lg,lb = getColorRGB(array[var][1],array[var][2])
    local r = math.floor(array[var][3]/0x10000)
    local g = math.floor(array[var][3]%0x10000/0x100)
    local b = math.floor(array[var][3]%0x100)
    sysLog("实际颜色="..lr..":"..lg..":"..lb)
    sysLog("表格颜色="..r..":"..g..":"..b)
    if math.abs(lr-r) > s or math.abs(lg-g) > s or math.abs(lb-b) > s then
      --keepScreen(false)
      sysLog("false")
      return false
    end
  end
  keepScreen(false)
  sysLog("true")
  return true
end

function colorFlag(c,p,x,y,x1,y1)
  local x0,y0 = findColorInRegionFuzzy(c,p,x,y,x1,y1);
  if x0 ~= -1 and y0 ~= -1 then
    return true
  else
    return false
  end
end

--=====================--TS扩展LUA库[文件操作]--=====================--
function saveStr(path,s)
  file = io.open(path, "w+");
  file:write(s);
  file:close();
end

-- 函数:获取当前脚本路径
function z_getScriptPathList()
  local pathlist = {};
  local i,s = 1,package.path;
  while true do
    n = string.find(s,";");
    if n == nil then
      break;
    end
    s = string.sub(s,n+1,string.len(s));
    pathlist[i] = string.sub(s,1,string.find(s,"?")-1);
    i = i + 1;
  end
  return pathlist;
end

function z_getScriptPath()
  local pl = z_getScriptPathList()
  return pl[#pl]
end

-- 函数:删除文件
function delFile(path)
  os.execute("rm -rf "..path);
end

-- 函数:遍历文件
function getList(path)
  local a = io.popen("ls "..path);
  local f = {};
  for l in a:lines() do
    table.insert(f,l)
  end
  return f
end

-- 函数:复制文件
function copyFile(path,to)
  os.execute("cp -rf "..path.." "..to);
end

-- 函数:移动文件
function moveFile(path,to)
  os.execute("mv "..path.." "..to);
end

-- 函数:创建文件夹
function newFolder(path)
  os.execute("mkdir "..path);
end

function fileToHexString(file)
  local file = io.open(file, 'rb');
  local data = file:read("*all");
  file:close();
  local t = {};
  for i = 1, string.len(data),1 do
    local code = tonumber(string.byte(data, i, i));
    table.insert(t, string.format("%02x", code));
  end
  return table.concat(t, "");
end

function HexToRes(Path,hexstr)
  local bytesfile = io.open(Path, "wb")
  if nil == bytesfile then
    dialog("Can not open output file to write!\n",0)
    return
  end
  for i = 1, string.len(hexstr) - 1, 2 do
    local doublebytestr = string.sub(hexstr, i, i+1)
    local n = tonumber(doublebytestr, 16)
    if 0 == n then
      bytesfile:write('\00')
    else
      bytesfile:write(string.format("%c", n))
    end
  end
  bytesfile:close()
  return Tmp
end

--=====================--TS扩展LUA库[字符串操作]--=====================--
-- 函数:生成随机字符串
function randomStr(str, num)
  local ret =''
  math.randomseed( tonumber(tostring(os.time()):reverse():sub(1,6)) );
  for i=1 ,num do
    local rchr = math.random(1, string.len(str))
    ret = ret .. string.sub(str, rchr, rchr)
  end
  return ret
end

function isToday(timestamp)
  local today = os.date("*t")
  local secondOfToday = os.time({day=today.day, month=today.month,
  year = today.year, hour=0, minute=0, second=0})
  if timestamp >= secondOfToday and timestamp < secondOfToday + 24 * 60 * 60 then
    return true
  else
    return false
  end
end

function getFuzzyMultiColorStr(x,y,s)--找的点的xy，分割距离	
  local s = s or 10
  local center_color = getColor(x,y)
  local left_color = string.format("0x%06X",getColor(x-s,y))
  local right_color = string.format("0x%06X",getColor(x+s,y))
  local up_color = string.format("0x%06X",getColor(x,y-s))
  local down_color = string.format("0x%06X",getColor(x,y+s))
	local left_color1 = string.format("0x%06X",getColor(x-s-s,y))
  local right_color1 = string.format("0x%06X",getColor(x+s+s,y))
  local up_color1 = string.format("0x%06X",getColor(x,y-s-s))
  local down_color1 = string.format("0x%06X",getColor(x,y+s+s))
  --"29|1|0x00BBFE,103|-4|0x0B6BBE,65|9|0x150972"
	local str = -s.."|0|"..left_color..","..s.."|0|"..right_color..",0|"..-s.."|"..up_color..",0|"..s.."|"..down_color..","..-s-s.."|0|"..left_color1..","..s+s.."|0|"..right_color1..",0|"..-s-s.."|"..up_color1..",0|"..s+s.."|"..down_color1
  --local str = -s.."|0|"..left_color..","..s.."|0|"..right_color..",0|"..-s.."|"..up_color..",0|"..s.."|"..down_color
  return center_color,str
end

function isInRange(x,y,array)
	if x <= array[1] or x >= array[3] then
		return false
	end
	
	if y <= array[2] or y >= array[4] then
		return false
	end
	
	return true
end

function xx_deepcopy(orig)
    local copy
    if type(orig) == "table" then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[xx_deepcopy(orig_key)] = xx_deepcopy(orig_value)
        end
        local metatable = getmetatable(orig)
        if metatable then
            setmetatable(copy, xx_deepcopy(metatable))
        end
    else 
        copy = orig
    end
    return copy
end