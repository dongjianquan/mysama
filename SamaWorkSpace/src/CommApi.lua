
function 头像记录()
  keepScreen(false)
  keepScreen(true)
	for i=1,#组队头像识别点 do
		组队判定头像1的颜色,组队判定头像1的str = getFuzzyMultiColorStr(组队头像识别点[i][1],组队头像识别点[i][2],10)
		table.insert(组队判定头像1的表,{c=组队判定头像1的颜色,str=组队判定头像1的str})
	end
  if (功能 == 4 and 御魂开组几人==3) or (功能 == 3 and 觉醒开组几人==3) or (功能 == 6 and 组队突破几人==3) then
		for i=1,#组队头像3人识别点 do
			组队判定头像2的颜色,组队判定头像2的str = getFuzzyMultiColorStr(组队头像3人识别点[i][1],组队头像3人识别点[i][2],10)
			table.insert(组队判定头像2的表,{c=组队判定头像2的颜色,str=组队判定头像2的str})
		end
		--组队判定头像2的颜色,组队判定头像2的str = getFuzzyMultiColorStr(组队头像3人识别点[1][1],组队头像3人识别点[1][2],10)
  end
  keepScreen(false)
end

function 最新计算阴阳寮对手()
keepScreen(true)
for i=1,8 do
  if 攻击勋章 >= 5 then
    if isColorArray(勋章判定数组[i].失败,90) then
			--sysLog(i)
      click(random_click(阴阳寮对手位置[i][1],阴阳寮对手位置[i][2],40))
      keepScreen(false)
      return true
    end
  else
    if isColorArray(勋章判定数组[i].失败,90) and multiColor2(勋章判定数组[i][5-攻击勋章],87) then
			--sysLog(i)
      click(random_click(阴阳寮对手位置[i][1],阴阳寮对手位置[i][2],40))
      keepScreen(false)
      return true
    end
  end
end
keepScreen(false)
return false
end

function 这个寮是否击破()
keepScreen(true)
if multiColor2(阴阳寮突破,90) then
	if 判断击破() then 
		for i=1,8 do
			if isColorArray(勋章判定数组[i].失败,90) then
				--sysLog(i)
				keepScreen(false)
				return false
			end
		end
	else
		return false
	end
else
	return false
end
keepScreen(false)
正在进行这一轮突破 = false
return true
end

function 计算个人突破对手()
	keepScreen(true)
	if 个人突破顺序 == 1 then
		local 最小值 = 6
		local 最小值位置 = 1
		for i=1,#个人突破勋章判定用 do
			if isColorArray(个人突破勋章判定用[i].失败,90) then
				最小值位置 = i
				break
			end
		end
		sysLog("最小值位置"..最小值位置)
		--sysLog("----------")
		for i=最小值位置,#个人突破勋章判定用 do
			if isColorArray(个人突破勋章判定用[i].失败,90) then
				sysLog("没有失败"..i)
				local 这个位置的勋章值 = 6
				for j=1,#个人突破勋章判定用[i] do
					if multiColor2(个人突破勋章判定用[i][j],90) then
						这个位置的勋章值 = j
						break
					end
				end
				--sysLog("这个位置的勋章值"..这个位置的勋章值)
				if 这个位置的勋章值 < 最小值 then
					最小值 = 这个位置的勋章值
					最小值位置 = i
				end
			end
		end
		sysLog("最小值位置"..最小值位置)
		keepScreen(false)
		click(random_click(个人突破选择[最小值位置][1],个人突破选择[最小值位置][2],45))
	else
		local 最大值 = 0
		local 最大值位置 = 1
		for i=1,#个人突破勋章判定用 do
			if isColorArray(个人突破勋章判定用[i].失败,90) then
				最大值位置 = i
				break
			end
		end
		--sysLog("最大值位置"..最大值位置)
		--sysLog("----------")
		--i = 7
		for i=最大值位置,#个人突破勋章判定用 do
			if isColorArray(个人突破勋章判定用[i].失败,90) then
				--sysLog("没有失败"..i)
				local 这个位置的勋章值 = 0
				for j=#个人突破勋章判定用[i],1,-1 do
					if multiColor2(个人突破勋章判定用[i][j],90) == false then
						这个位置的勋章值 = j
						break
					end
				end
				sysLog(i.."这个位置的勋章值"..这个位置的勋章值)
				if 这个位置的勋章值 > 最大值 then
					最大值 = 这个位置的勋章值
					最大值位置 = i
				end
			end
		end
		sysLog("最大值位置"..最大值位置)
		keepScreen(false)
		click(random_click(个人突破选择[最大值位置][1],个人突破选择[最大值位置][2],45))
	end
end

function 计算个人突破次数()
--keepScreen(true)
local 次数 = 0
for i=1,#个人突破判定打完用 do
  if isColorArray(个人突破判定打完用[i],90) then
    次数 = 次数 + 1
  end
end
--keepScreen(false)
return 次数
end

function 计算九场刷新用()
--keepScreen(true)
local 次数 = 0
for i=1,#个人突破判定打完用 do
  if isColorArray(个人突破判定打完用[i],90) or isColorArray(个人突破失败判定用[i],90)==false then
    次数 = 次数 + 1
  end
end
--keepScreen(false)
return 次数
end

function 计算选手()
keepScreen(true)
临时对手 = {}
local 距离 = 50
for i=1,#对手选择 do
  if isColorArray(对手选择[i],95) and isColor(对手选择[i][1],对手选择[i][2]+距离,对手选择[i][3],95) then
    table.insert(临时对手,{对手选择[i][1],对手选择[i][2],对手选择[i][3]})
  end
end
keepScreen(false)
end

function 计算个人对手()
临时个人对手 = {}
for i=1,#个人突破选择 do
  if isColorArray(个人突破判断失败用[i],93) then
    table.insert(临时个人对手,{个人突破选择[i][1],个人突破选择[i][2],个人突破选择[i][3]})
  end
end
end

function 打哪个怪()
if 无限魂10兔子 == 2 then
  click(random_click(点怪位置[点第几个怪][1],点怪位置[点第几个怪][2]))	
  mSleep(500)
  点第几个怪 = 点第几个怪 +1
  if 点第几个怪 > #点怪位置 then
    点第几个怪 = 1
  end
else
  local 打那个 = math.random(1,3)
  if 打那个 == 1 then
    click(random_click(标记左边[1],标记左边[2]))
  elseif 打那个 == 2 then
    click(random_click(标记右边[1],标记右边[2]))
  elseif 打那个 == 3 then
    click(random_click(标记中间[1],标记中间[2]))	
  end
  mSleep(500)
end
end

function 暂停处理()
if multiColor2(战斗准备,90) or multiColor2(战斗准备1,90) or multiColor2(观战界面,90) or multiColor2(更换式神界面,90) or multiColor2(更换式神界面1,90) or multiColor2(更换式神界面2,90) or multiColor2(更换式神界面3,90)  then
  click(战斗准备.点击[1],战斗准备.点击[2])
elseif multiColor2(新战斗胜利,90) or multiColor2(战斗胜利,90) or multiColor2(新战斗失败,90) or multiColor2(战斗失败,90) or multiColor2(战斗结束领奖,90) or multiColor2(领奖结束,90) then
  click(random_click(战斗胜利.点击[1],战斗胜利.点击[2]))
elseif  multiColor2(被顶号了,90) then
  click(random_click(被顶号了.点击[1],战斗胜利.点击[2]))
elseif multiColor2(在其他设备登陆,90) then
  click(random_click(在其他设备登陆.点击[1],在其他设备登陆.点击[2]))
end
end

function 阴阳寮接受邀请处理()
if 功能 == 8 then
	突破接受邀请 = 0
end
keepScreen(true)
if multiColor2(新提示框,90) then
  if 突破接受邀请 == 0 then
    click(random_click(新提示框.取消[1],新提示框.取消[2]))
    mSleep(500)
  else
    click(random_click(新提示框.确定[1],新提示框.确定[2]))
    mSleep(1000)
    return true
  end
elseif multiColor2(组队邀请,90) then
  if 突破接受邀请 == 0 then
    click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
    mSleep(500)
  else
    阴阳寮第几个 = 阴阳寮第几个 -1
    if 阴阳寮第几个 <=0 then
      阴阳寮第几个 = 1
    end	
    click(random_click(组队邀请.确定[1],组队邀请.确定[2]))
    mSleep(1000)
    return true
  end
elseif multiColor2(点开组队邀请,90) then
  if 突破接受邀请 == 0 then
    mSleep(500)
  else
    阴阳寮第几个 = 阴阳寮第几个 -1
    if 阴阳寮第几个 <=0 then
      阴阳寮第几个 = 1
    end	
    click(random_click(点开组队邀请.点击[1],点开组队邀请.点击[2]))
    mSleep(1000)
    click(random_click(组队邀请.确定[1],组队邀请.确定[2]))
    mSleep(1000)
    return true
  end
elseif multiColor2(悬赏邀请,90) then
  if 自动接勾玉邀请 == 1 and multiColor2(勾玉邀请,90) then
    click(random_click(悬赏邀请.接受[1],悬赏邀请.接受[2]))
  elseif 自动接体力邀请 == 1 and multiColor2(体力邀请,90) then
    click(random_click(悬赏邀请.接受[1],悬赏邀请.接受[2]))
  elseif 自动接金币邀请 == 1 and multiColor2(金币邀请,90) then
    click(random_click(悬赏邀请.接受[1],悬赏邀请.接受[2]))
  elseif 自动接勾玉邀请 == 1 and 自动接体力邀请 == 1 and 自动接金币邀请 == 1 then
    click(random_click(悬赏邀请.接受[1],悬赏邀请.接受[2]))
  else
    click(random_click(悬赏邀请.拒绝[1],悬赏邀请.拒绝[2]))
  end
end
keepScreen(false)
return false
end

function 震动锁屏()
showHD_b("剩余次数不足，即将结束脚本")
for i=1,10 do
  vibrator()
  mSleep(1000)
end
lockDevice()
end

function 定期妖气相关()
if 功能 == 7 or 功能 == 5  then
  return
end
if 定期石距 == 1 and mTime() > 石距开始时间 then		
  return true
elseif 定期年兽 == 1 and mTime() > 年兽开始时间 then		
  return true
elseif 定期金币妖怪 == 1 and mTime() > 金币开始时间 then	
  return true
elseif 定期经验妖怪 == 1 and mTime() > 经验开始时间 then
  return true
end
当前在什么妖气目标里 = 0
return false
end

function 定期妖气时间处理()
if 定期石距 == 1 and 当前在什么妖气目标里 == 1 and mTime() > 石距开始时间 then		
  石距开始时间 = mTime() + 3600*1000	
elseif 定期年兽 == 1 and 当前在什么妖气目标里 == 2 and mTime() > 年兽开始时间 then		
  年兽开始时间 = mTime() + 3600*12*1000	
elseif 定期金币妖怪 == 1 and 当前在什么妖气目标里 == 4 and mTime() > 金币开始时间 then	
  金币开始时间 = mTime() + 3600*6*1000	
elseif 定期经验妖怪 == 1 and 当前在什么妖气目标里 == 3 and mTime() > 经验开始时间 then
  经验开始时间 = mTime() + 3600*6*1000	
end
end

function 定期妖气拖动()
if 定期石距 == 1 and mTime() > 石距开始时间 then		
  tuodong3(组队界面.拖动)
  当前在什么妖气目标里 = 1
  click(random_click(组队界面.石距[1],组队界面.石距[2]))
elseif 定期年兽 == 1 and mTime() > 年兽开始时间 then		
  tuodong3(组队界面.拖动)
  当前在什么妖气目标里 = 2
  click(random_click(组队界面.年兽[1],组队界面.年兽[2]))
elseif 定期金币妖怪 == 1 and mTime() > 金币开始时间 then	
  tuodong3(组队界面.拖动)
  当前在什么妖气目标里 = 4
  click(random_click(组队界面.金币妖怪[1],组队界面.金币妖怪[2]))
elseif 定期经验妖怪 == 1 and mTime() > 经验开始时间 then
  tuodong3(组队界面.拖动)
  当前在什么妖气目标里 = 3
  click(random_click(组队界面.经验妖怪[1],组队界面.经验妖怪[2]))
end
end

function 缩放处理相关()
if 目前是缩放状态 == false then
  目前是缩放状态 = true
  if w == 640 and h==1136 then
  elseif w == 768  or w == 1024  then
  else                 
    needScale = true
    if w== 750 or w==1242 or w == 720 or w== 1080 or w==1440 or h== 1334 or h == 2208 then
      sysLog("战斗中重写")
      重写界面参数(640*1136)
      setScreenScale(640, 1136);
    elseif w == 1536 or w == 2048 then
      sysLog("战斗中重写")
      重写界面参数(768*1024)
      setScreenScale(768, 1024);
    else
      toast("您的手机分辨率为"..h.."*"..w.."。很抱歉，不支持您的手机分辨率。")
      mSleep(1000)
      lua_exit()
    end
  end
end
end

function 等待进入更换式神界面()
	for i=1,10 do
		keepScreen(true)
		if multiColor2(更换式神界面,90) or multiColor2(更换式神界面1,90) or multiColor2(更换式神界面2,90) or multiColor2(更换式神界面3,90) or multiColor2(更换式神界面日服,90) then
			mSleep(100)
			break
		end
		keepScreen(false)
		mSleep(500)
	end
end

function chouka()
  mSleep(1000)
  while true do
    keepScreen(true)
    if multiColor2(召唤界面,90) then
      sysLog("召唤界面")
      click(random_click(召唤界面.抽N卡[1],召唤界面.抽N卡[2]))
      mSleep(1000)
		elseif multiColor2(召唤界面170520,90) then
      sysLog("召唤界面")
      click(random_click(召唤界面170520.抽N卡[1],召唤界面170520.抽N卡[2]))
      mSleep(1000)
    elseif multiColor2(召唤出了5张卡,90) then
      sysLog("召唤出了5张卡")
      for i=1,#卡牌位置 do
        if isColorArray(卡牌位置[i],90) then
          click(random_click(卡牌位置[i][1],卡牌位置[i][2]))
          mSleep(500)
        end
      end
      mSleep(1000)
    elseif multiColor2(再次召唤,90) then	
      sysLog("再次召唤")
      click(random_click(再次召唤.点击[1],再次召唤.点击[2]))
      mSleep(1000)
    else
      mSleep(1000)
    end
    keepScreen(false)
  end
end

function zhaohuan()
  mSleep(1000)
  while true do
    keepScreen(true)
    if multiColor2(主界面没打开卷轴,90)  then
      sysLog("主界面没打开卷轴")
      mSleep(2000)
      if multiColor(主界面没打开卷轴,90)  then
        click(random_click(主界面.打开菜单[1],主界面.打开菜单[2]))
        mSleep(random_time())
      end
    elseif multiColor2(主界面打开卷轴,90) then
      sysLog("主界面打开卷轴")
      click(random_click(主界面.式神录[1],主界面.式神录[2]))
      mSleep(random_time())
    elseif multiColor2(式神录界面,90) or multiColor2(式神录界面170520,90) then
      sysLog("式神录界面")
      if isColorArray(式神录界面.碎片红点,90) then
        click(random_click(式神录界面.点击[1],式神录界面.点击[2]))
      end
      mSleep(random_time())
    elseif multiColor2(式神召唤界面,90) then
      sysLog("式神召唤界面")
      click(random_click(式神召唤界面.召唤[1],式神召唤界面.召唤[2]))
      mSleep(random_time())
    else
      mSleep(1000)
    end
    keepScreen(false)
  end
end

function guiwang()
  mSleep(1000)
  local acc_size = getAccSize()
  local 加过好友了 = false
  local 上次邀请时间 = 0
  local 打完鬼王了 = false
  local 上次闪退了 = false
  local 是否要加一 = true
  local 本号开始时间 = mTime()
  local 鬼王挑战界面次数 = 0
  local 捐过碎片了 = getNumberConfig("juansuipian",0)
  local 当前账号 = ""
  local 当前密码 = ""
  local 本号打鬼王次数 = 0
  local 本号捐过碎片了 = 0
  local 临时加过好友了 = false
  local 需要临时加好友 = false
  local 需要临时删好友 = false
  local 体力不足了 = false
  local 拖图次数 = 0
  local start_count = 0
  local 战斗计数 = 0
  开启点击提示 = 1
  if acc_size > 0 then
    toast("★   欢迎使用乘风挂机脚本   ★\n★   您正在使用的是换号鬼王脚本   ★\n★  您的账号库中有"..acc_size.."个账号  ★")
    mSleep(3000)
  end
  延迟随机最小值 = 0
  延迟随机最大值 = 1000
  if isFrontApp(appid) ==0 then
    isFrontApp = function() return 1 end
    toast("由于您的手机系统原因，您无法获得《来电暂停》功能。")
  end
  local today = getNumberConfig("guiwang_day",os.date("%j"))
  --writeLog("记录日期是:"..today)
  if 重置点赞记录 == 1 then
    local now_day = tonumber(os.date("%j"))
    setNumberConfig("guiwang_day",now_day)
    setNumberConfig("juansuipian",0)
    for i=1,acc_size do
      local temp_str = "dianzan_"..i
      setNumberConfig(temp_str,0)
    end
  end
  while true do
    if  isFrontApp(appid) ==1 then
      keepScreen(true)
      if 要做什么 == 1 then
        if 给大号点赞==1 then
          local now_day = tonumber(os.date("%j"))
          --sysLog("now_day"..now_day)
          --writeLog("今天是:"..today)
          if now_day ~= today then--隔天
            today = now_day
            setNumberConfig("guiwang_day",now_day)
            setNumberConfig("juansuipian",0)
            for i=1,acc_size do
              local temp_str = "dianzan_"..i
              setNumberConfig(temp_str,0)
            end
          end
        end
      end
      if multiColor2(战斗中,90) then
        sysLog("战斗中")
        mSleep(1000)
        if 战斗计数 > 4 then
          if  multiColor2(手动攻击,85) then
            click(手动攻击.点击[1],手动攻击.点击[2])
            mSleep(500)
          end
          if  multiColor2(一倍速,85) then
            click(一倍速.点击[1],一倍速.点击[2])
            mSleep(500)
          end
        end
        start_time = mTime()
        mSleep(500)
        战斗计数 = 战斗计数 +1
      elseif multiColor2(阴阳寮界面没有寮,90) then
        sysLog("阴阳寮界面")
        showHD("阴阳寮界面没有寮")
        if 要做什么 == 1 then
          if 需要临时加好友 and 临时加过好友了 == false then				
            showHD("阴阳寮界面-关闭")
            click(random_click(阴阳寮界面.关闭[1],阴阳寮界面.关闭[2]))
          elseif 打完鬼王了 then
            showHD("阴阳寮界面-关闭")
            click(random_click(阴阳寮界面.关闭[1],阴阳寮界面.关闭[2]))
          else
            showHD("阴阳寮界面-地图")
            click(random_click(阴阳寮界面.地图[1],阴阳寮界面.地图[2]))
            mSleep(2000)
          end
        else				
          showHD("阴阳寮界面-关闭")
          click(random_click(阴阳寮界面.关闭[1],阴阳寮界面.关闭[2]))
        end
        mSleep(random_time())
      elseif multiColor2(阴阳寮界面,90) or multiColor2(阴阳寮界面1,90) then
        sysLog("阴阳寮界面")
        showHD("阴阳寮界面")
        if 要做什么 == 1 then
          if 自动捐碎片 ==1 and 本号捐过碎片了 == 0 and 捐过碎片了 == 0 then
            showHD("阴阳寮界面-祈愿")
            click(random_click(阴阳寮界面.祈愿[1],阴阳寮界面.祈愿[2]))
          elseif 需要临时加好友 and 临时加过好友了 == false then				
            showHD("阴阳寮界面-关闭")
            click(random_click(阴阳寮界面.关闭[1],阴阳寮界面.关闭[2]))
          elseif 打完鬼王了 then
            showHD("阴阳寮界面-关闭")
            click(random_click(阴阳寮界面.关闭[1],阴阳寮界面.关闭[2]))
          else
            showHD("阴阳寮界面-地图")
            click(random_click(阴阳寮界面.地图[1],阴阳寮界面.地图[2]))
            if 开启寻找鬼王防卡机制 == 1 then
              for i = 1,鬼王防卡延迟时间 do
                mSleep(1000)
              end
            end
          end
        else				
          showHD("阴阳寮界面-关闭")
          click(random_click(阴阳寮界面.关闭[1],阴阳寮界面.关闭[2]))
        end
        mSleep(random_time())
      elseif multiColor2(关联手机,90) then
        sysLog("关联手机")
        showHD("关联手机，关闭")
        click(random_click(关联手机.取消[1],关联手机.取消[2]))
        mSleep(random_time())
      elseif multiColor2(主界面没打开卷轴,90)  then
        sysLog("主界面没打开卷轴")
        showHD("主界面没打开卷轴")
        mSleep(2000)
        if 要做什么 == 1 then
          if multiColor(主界面没打开卷轴,90)  then
            click(random_click(主界面.打开菜单[1],主界面.打开菜单[2]))
            mSleep(random_time())
          end
        elseif 要做什么 == 3 then
          click(random_click(主界面.点头像[1],主界面.点头像[2]))
        else
          if false then
            click(主界面.邮件[1],主界面.邮件[2])
          elseif 体力不足了 then
            click(random_click(主界面.点头像[1],主界面.点头像[2]))
          else
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            mSleep(1000)
            click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
          end
        end
        mSleep(random_time())
      elseif multiColor2(主界面打开卷轴,90) then
        sysLog("主界面打开卷轴")
        showHD("主界面打开卷轴")
        mSleep(2000)
        if 要做什么 == 1 then
          if multiColor(主界面打开卷轴,90)  then
            local temp_str = "dianzan_"..acc_index
            sysLog(temp_str)
            --writeLog(temp_str)
            local 赞的状态 = getNumberConfig(temp_str,0)
            sysLog("赞的状态"..赞的状态)
            --writeLog("赞的状态"..赞的状态)
            if 本号打鬼王次数 >= 5 then
              打完鬼王了 = true
              本号打鬼王次数 = 0
              if 是否拉组队 == 3 and 临时加过好友了 then
                需要临时删好友 = true
              end
            end
            if 打完鬼王了  then
              if 需要临时删好友 then
                showHD("要删好友，点好友")
                click(random_click(主界面.好友[1],主界面.好友[2]))
              else
                showHD("打完鬼王了，点头像")
                click(random_click(主界面.点头像[1],主界面.点头像[2]))
              end
            elseif 给大号点赞==1 and 赞的状态 == 0 then
              showHD("要点赞，点好友")
              click(random_click(主界面.好友[1],主界面.好友[2]))
            elseif (是否拉组队 == 3 and 需要临时加好友 and 临时加过好友了 == false)   then
              showHD("要加好友，点好友")
              click(random_click(主界面.好友[1],主界面.好友[2]))
            elseif (是否加好友 and 加过好友了 == false)   then
              showHD("要加好友，点好友")
              click(random_click(主界面.好友[1],主界面.好友[2]))
            else
              showHD("点阴阳寮，找鬼王")
              click(random_click(主界面.阴阳寮[1],主界面.阴阳寮[2]))
            end
            mSleep(random_time())
          end
        elseif 要做什么 == 3 then
          click(random_click(主界面.点头像[1],主界面.点头像[2]))
        else
          if false then
            click(主界面.邮件[1],主界面.邮件[2])
          elseif 体力不足了 then
            click(random_click(主界面.点头像[1],主界面.点头像[2]))
          else
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            mSleep(1000)
            click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
          end
        end
        mSleep(random_time())
      elseif multiColor2(打开卷轴小号等级不足,90) then
        sysLog("打开卷轴小号等级不足")
        if 要做什么 == 1 then
          showHD("小号等级不足，换号")
          打完鬼王了 = true
          click(random_click(主界面.点头像[1],主界面.点头像[2]))
        elseif 要做什么 == 3 then
          click(random_click(主界面.点头像[1],主界面.点头像[2]))
        else
          if false then
            click(主界面.邮件[1],主界面.邮件[2])
          elseif 体力不足了 then
            click(random_click(主界面.点头像[1],主界面.点头像[2]))
          else
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            mSleep(1000)
            click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
          end
        end
        mSleep(random_time())
      elseif multiColor2(邮件界面,90) then
        showHD("邮件界面")
        if isColorArray(邮件界面.收取,90) then
          sysLog("邮件界面.收取")
          showHD("邮件界面-收取")
          click(random_click(邮件界面.收取[1],邮件界面.收取[2]))
          mSleep(2000)
        elseif 找附件信() then
          mSleep(1000)
        else
          click(random_click(邮件界面.关闭[1],邮件界面.关闭[2]))
          mSleep(2000)
        end
        mSleep(random_time())
      elseif multiColor2(副本大地图,90) then
        if 体力不足了 then
          click(副本大地图.返回[1],副本大地图.返回[2])
        else
          click(random_click(副本选图[1][1],副本选图[1][2]))
        end
        mSleep(1000)
      elseif multiColor2(推图中,90) then
        sysLog("推图中")
        showHD("副本中")
        if 拖图次数 >= 5 then
          click(random_click(推图中.退出[1],推图中.退出[2]))
          拖图次数 = 0
          mSleep(2000)
        elseif isColorArray(推图中.锁定式神,90) == false then
          click(random_click(推图中.锁定式神[1],推图中.锁定式神[2]))
          mSleep(random_time())
        elseif 副本结束领奖() then		
          mSleep(2000)
          start_count = 0
        elseif 找boss() then	
          start_count = 0
          mSleep(2000)
        elseif 找小怪() then
          mSleep(3000)
        else
          start_count = start_count +1
          if start_count <=5*2 then
            if math.mod(start_count,2) ==1 then
              tuodong5(推图中.拖动)
            end
          else
            start_count = 0
            拖图次数 = 拖图次数 + 1
            click(random_click(推图中.退出[1],推图中.退出[2]))
            mSleep(2000)
          end
        end
      elseif multiColor2(体力不足界面,90) then
        sysLog("体力不足界面")
        showHD("体力不足界面")			
        体力不足了 = true
        click(random_click(体力不足界面.关闭[1],体力不足界面.关闭[2]))
        mSleep(2000)
        click(random_click(推图中.退出[1],推图中.退出[2]))
        mSleep(2000)
      elseif multiColor2(教学任务界面,90) then
        sysLog("退出探索")
        click(random_click(教学任务界面.关闭[1],教学任务界面.关闭[2]))
        mSleep(random_time())
      elseif multiColor2(退出探索,90) then
        sysLog("退出探索")
        click(random_click(退出探索.确认退出[1],退出探索.确认退出[2]))
        mSleep(random_time())
      elseif  multiColor2(被顶号了,90) then
        showHD("被顶号了")
        click(random_click(被顶号了.点击[1],被顶号了.点击[2]))
        mSleep(random_time())
      elseif multiColor2(百绘罗伊,90) then
        sysLog("关联手机")
        showHD("百绘罗伊，关闭")
        click(random_click(百绘罗伊.关闭[1],百绘罗伊.关闭[2]))
        mSleep(random_time())
			elseif multiColor2(实名认证,90) then
				click(random_click(实名认证.点击[1],实名认证.点击[2]))
				mSleep(random_time())
			elseif multiColor2(确认实名,90) then
				click(random_click(确认实名.点击[1],确认实名.点击[2]))
				mSleep(random_time())
      elseif multiColor2(换皮肤,93) then
        sysLog("换皮肤")
        click(random_click(换皮肤.点击[1],换皮肤.点击[2]))
        mSleep(random_time())
      elseif multiColor2(樱花提示,90) then
        showHD_b("樱花提示")
        sysLog("樱花提示")
        click(random_click(樱花提示.点击[1],樱花提示.点击[2]))
        mSleep(1000)
      elseif multiColor2(探索玩法介绍,90) then
        showHD_b("探索玩法介绍")
        sysLog("探索玩法介绍")
        click(random_click(探索玩法介绍.关闭[1],探索玩法介绍.关闭[2]))
        mSleep(1000)
      elseif multiColor2(探索副本解锁,90) then
        showHD_b("探索副本解锁")
        sysLog("探索副本解锁")
        click(random_click(探索副本解锁.关闭[1],探索副本解锁.关闭[2]))
        mSleep(1000)
      elseif multiColor2(用户中心界面,90) then
        sysLog("用户中心界面")
        showHD("用户中心界面")
        上次闪退了 = false
        打完鬼王了 = false
        加过好友了 = false 
        临时加过好友了 = false
        需要临时加好友 = false
        需要临时删好友 = false
        本号打鬼王次数 = 0
        click(random_click(用户中心界面.切换账号[1],用户中心界面.切换账号[2]))
        mSleep(random_time())
      elseif multiColor2(新战斗胜利,90) or multiColor2(战斗胜利,90) then
        sysLog("战斗胜利")
        showHD("战斗胜利")
        战斗计数 = 0
        click(random_click(战斗胜利.点击[1],战斗胜利.点击[2]))
        mSleep(random_time())
      elseif multiColor2(战斗失败,90) or multiColor2(新战斗失败,90) then
        sysLog("战斗失败")
        showHD("战斗失败")
        click(random_click(战斗胜利.点击[1],战斗胜利.点击[2]))
        mSleep(random_time())
      elseif multiColor2(点击检查更新,92) then
        sysLog("点击检查更新")
        showHD("点击检查更新")
        click(random_click(点击检查更新.点击[1],点击检查更新.点击[2]))
        mSleep(3000)
        if multiColor(提示框,90) then
          click(random_click(提示框.确定[1],提示框.确定[2]))
        end
        mSleep(random_time())
      elseif multiColor2(战斗结束领奖,90) then
        sysLog("战斗结束领奖")
        showHD("战斗结束领奖")
        click(random_click(战斗结束领奖.点击[1],战斗结束领奖.点击[2]))
        mSleep(random_time())
      elseif multiColor2(领奖结束,90) then
        sysLog("领奖结束")
        showHD("领奖结束")
        mSleep(1000)
        if 要做什么 == 1 then
          keepScreen(false)
          keepScreen(true)
          if multiColor2(结算SR判定,85) == false and multiColor2(结算R判定,85) == false and multiColor2(结算金币判定,85) == false then
            local log_str = 当前账号.."*"..当前密码.."  获得SSR碎片"
            writeLog(log_str)
            sysLog(log_str)
            showHD(log_str)
          end
        end
        click(random_click(领奖结束.点击[1],领奖结束.点击[2]))
        mSleep(random_time())
      elseif multiColor2(用户协议界面,90) then
        sysLog("用户协议界面")
        showHD("用户协议界面")
        click(random_click(用户协议界面.接受[1],用户协议界面.接受[2]))
        mSleep(random_time())
      elseif multiColor2(实名认证界面,90) then
        sysLog("实名认证界面")
        showHD("实名认证界面")
        click(random_click(实名认证界面.取消[1],实名认证界面.取消[2]))
        mSleep(random_time())
      elseif multiColor2(用户协议界面IP6,90) then
        sysLog("用户协议界面")
        showHD("用户协议界面")
        click(random_click(用户协议界面IP6.接受[1],用户协议界面IP6.接受[2]))
        mSleep(random_time())
      elseif multiColor2(好友界面,90) or multiColor2(好友界面1,90) then
        sysLog("好友界面")
        showHD("好友界面")
        mSleep(1000)
        if 需要临时删好友 then
          需要临时删好友 = false
          showHD("好友界面-删除")
          if isColorArray(好友界面.删除,90) == false then
            click(random_click(好友界面.点击切换[1],好友界面.点击切换[2]))
            mSleep(2000)
          end
          click(random_click(好友界面.删除[1],好友界面.删除[2]))
          mSleep(2000)
          click(random_click(好友界面.确认删除[1],好友界面.确认删除[2]))
          mSleep(2000)
          click(random_click(好友界面.关闭[1],好友界面.关闭[2]))
        elseif 给大号点赞==1 then
          showHD("好友界面-点赞")
          click(random_click(好友界面.添加[1],好友界面.添加[2]))
        elseif 是否加好友 or 需要临时加好友 then
          showHD("好友界面-添加")
          click(random_click(好友界面.添加[1],好友界面.添加[2]))
        else
          showHD("好友界面-关闭")
          click(random_click(好友界面.关闭[1],好友界面.关闭[2]))
        end
        mSleep(random_time())
      elseif multiColor2(添加好友界面,90) then
        sysLog("添加好友界面")
        showHD("添加好友界面")
        mSleep(1000)
        click(random_click(添加好友界面.输入[1],添加好友界面.输入[2]))
        mSleep(2000)
        if 加好友方式 == 1 then
          inputText(好友名字是什么)
        else
          inputText("#"..好友名字是什么)
        end
        mSleep(2000)
        if isColorArray2(添加好友界面.有同意按钮,90) then
          click(random_click(添加好友界面.有同意按钮[1],添加好友界面.有同意按钮[2]))
          mSleep(1000)
        elseif isColorArray2(添加好友界面.有同意按钮ip5,90) then
          click(random_click(添加好友界面.有同意按钮ip5[1],添加好友界面.有同意按钮ip5[2]))
          mSleep(1000)
        else
          click(random_click(添加好友界面.点一下[1],添加好友界面.点一下[2]))
          mSleep(1000)
        end
        click(random_click(添加好友界面.搜索[1],添加好友界面.搜索[2]))
        mSleep(2000)
        local temp_str = "dianzan_"..acc_index
        sysLog(temp_str)
        local 赞的状态 = getNumberConfig(temp_str,0)
        sysLog("赞的状态"..赞的状态)
        if 给大号点赞==1 and 赞的状态 == 0 then
          click(random_click(添加好友界面.点头像[1],添加好友界面.点头像[2]))
          mSleep(2000)
          if multiColor(点赞判定,90) then
            sysLog("点赞判定")
            showHD("点赞界面")
            if isColorArray(点赞判定.赞,90) then
              showHD("点赞界面，没赞过，点一下")
              click(random_click(点赞判定.赞[1],点赞判定.赞[2]))
              mSleep(1000)				
            end
            click(random_click(点赞判定.点一下[1],点赞判定.点一下[2]))
            local temp_str = "dianzan_"..acc_index
            sysLog(temp_str)
            setNumberConfig(temp_str,1)
            mSleep(1000)
            if 是否加好友 == false then
              click(random_click(好友界面.关闭[1],好友界面.关闭[2]))
              mSleep(1000)
            else
              click(random_click(添加好友界面.第一个[1],添加好友界面.第一个[2]))
              mSleep(2000)
              click(random_click(添加好友界面.申请[1],添加好友界面.申请[2]))
              mSleep(3000)
              click(random_click(添加好友界面.关闭[1],添加好友界面.关闭[2]))
              加过好友了 = true
              if 是否拉组队 == 3 then
                临时加过好友了 = true
              end
              mSleep(2000)
            end
          end
        else
          click(random_click(添加好友界面.第一个[1],添加好友界面.第一个[2]))
          mSleep(2000)
          click(random_click(添加好友界面.申请[1],添加好友界面.申请[2]))
          mSleep(3000)
          click(random_click(添加好友界面.关闭[1],添加好友界面.关闭[2]))
          加过好友了 = true
          if 是否拉组队 == 3 then
            临时加过好友了 = true
          end
          mSleep(2000)
        end
      elseif multiColor2(获得奖励提示,90) then
        sysLog("获得奖励提示")
        showHD("获得奖励提示")
        click(random_click(获得奖励提示.点击[1],获得奖励提示.点击[2]))
        mSleep(random_time())
      elseif multiColor2(祈愿界面,90) then
        sysLog("祈愿界面")
        showHD("祈愿界面")
        for i=1,#捐赠判定 do
          if isColorArray(捐赠判定[i],90) then
            捐过碎片了 = 1
            setNumberConfig("juansuipian",捐过碎片了)
            click(random_click(捐赠判定[i][1],捐赠判定[i][2]))
            mSleep(2000)
            click(random_click(捐赠判定[1][1],捐赠判定[1][2]))
            mSleep(1000)
            突破接受邀请 = 1
            阴阳寮接受邀请处理()
          end
        end
        本号捐过碎片了 = 1
        click(random_click(阴阳寮界面.地图[1],阴阳寮界面.地图[2]))
        mSleep(3000)
      elseif multiColor2(阴阳寮地图界面,90) then
        sysLog("阴阳寮地图界面")
        showHD("阴阳寮地图界面")
        if 需要临时加好友 and 临时加过好友了 == false then
          click(random_click(阴阳寮地图界面.返回[1],阴阳寮地图界面.返回[2]))
          mSleep(2000)
        else
          if 开启寻找鬼王防卡机制 == 1 then
            for i = 1,鬼王防卡延迟时间 do
              mSleep(1000)
            end
          end
          if multiColor(阴阳寮地图界面,90) then
            if 打完鬼王了 then
              showHD("阴阳寮-打完鬼王了，返回")
              click(random_click(阴阳寮地图界面.返回[1],阴阳寮地图界面.返回[2]))
              mSleep(3000)
            else
              mSleep(1000)
              showHD("阴阳寮-寻找鬼王")
              for i=1 ,5 do
                click(random_click(阴阳寮地图界面.寻找鬼王[1],阴阳寮地图界面.寻找鬼王[2]))
                mSleep(1000)
              end
              if  是否拉组队 == 2 then
                sysLog("是否拉组队 == 0")
                showHD("阴阳寮-找到鬼王不开组")
                if 鬼王换号延迟 > 0 then
                  for i=1,6*鬼王换号延迟 do
                    mSleep(10000)
                  end
                end
                打完鬼王了 = true
                click(random_click(阴阳寮地图界面.返回[1],阴阳寮地图界面.返回[2]))
                mSleep(3000)
              else
                showHD("阴阳寮-找到鬼王开组")
                click(random_click(阴阳寮地图界面.点中间[1],阴阳寮地图界面.点中间[2]))
                mSleep(3000)
                if multiColor(鬼王挑战界面,90) then
                  首次进入组队详情 = true
                else
                  打完鬼王了 = true
                  if 是否拉组队 == 3 and 临时加过好友了 then
                    需要临时删好友 = true
                  end
                  showHD("阴阳寮-打完鬼王了")
                  click(random_click(阴阳寮地图界面.返回[1],阴阳寮地图界面.返回[2]))
                  mSleep(3000)
                end
              end
            end
          end
        end
      elseif multiColor2(鬼王挑战界面,90) then
        sysLog("鬼王挑战界面")
        showHD("鬼王挑战界面")
        if 鬼王挑战界面次数 == 2 then
          --打完鬼王了 = true
          sysLog("鬼王挑战界面次数 == 2")
          --showHD("鬼王挑战界面次数=2")
          if isColorArray(鬼王挑战界面.第二个,93) == false then
            sysLog("鬼王挑战界面 第二个")
            showHD("鬼王挑战界面-有第二个")
            鬼王挑战界面次数 = 鬼王挑战界面次数 + 1
            click(random_click(鬼王挑战界面.第二个[1],鬼王挑战界面.第二个[2]))
          else
            showHD("鬼王挑战界面-打完了")
            打完鬼王了 = true
            if 是否拉组队 == 3 and 临时加过好友了 then
              需要临时删好友 = true
            end
            鬼王挑战界面次数 = 0
            click(random_click(式神碎片界面.关闭[1],式神碎片界面.关闭[2]))
          end
          mSleep(random_time())
        elseif 鬼王挑战界面次数 == 4 then
          --打完鬼王了 = true
          sysLog("鬼王挑战界面次数 == 2")
          --	showHD("鬼王挑战界面次数=4")
          if isColorArray(鬼王挑战界面.第三个,93) == false then
            sysLog("鬼王挑战界面 第二个")
            showHD("鬼王挑战界面-第三个")
            鬼王挑战界面次数 = 鬼王挑战界面次数 + 1
            click(random_click(鬼王挑战界面.第三个[1],鬼王挑战界面.第三个[2]))
          else
            showHD("鬼王挑战界面-打完了")
            打完鬼王了 = true
            if 是否拉组队 == 3 and 临时加过好友了 then
              需要临时删好友 = true
            end
            鬼王挑战界面次数 = 0
            click(random_click(式神碎片界面.关闭[1],式神碎片界面.关闭[2]))
          end
          mSleep(random_time())
        elseif 鬼王挑战界面次数 >= 6 then
          sysLog("鬼王挑战界面次数 >= 7")
          showHD("打完鬼王了")
          打完鬼王了 = true
          if 是否拉组队 == 3 and 临时加过好友了 then
            需要临时删好友 = true
          end
          鬼王挑战界面次数 = 0
          click(random_click(式神碎片界面.关闭[1],式神碎片界面.关闭[2]))
          mSleep(random_time())
        else
          if false then
            鬼王挑战界面次数 = 鬼王挑战界面次数 +1
            showHD("鬼王挑战界面-挑战")
            click(random_click(鬼王挑战界面.挑战[1],鬼王挑战界面.挑战[2]))
          else
            鬼王挑战界面次数 = 鬼王挑战界面次数 +1
            if SSR开组 == 1 and (multiColor2(SSR判定,80) or multiColor2(SSR判定模拟器,80)) then
              showHD("鬼王挑战界面-有SSR")
              if 找到SSR就铃声提醒 == 1 then
                playAudio("lingsheng.mp3")
              end
              if 是否拉组队 == 3 and 临时加过好友了 == false then
                需要临时加好友 = true
                鬼王挑战界面次数 = 0
                click(random_click(式神碎片界面.关闭[1],式神碎片界面.关闭[2]))
                mSleep(1000)
              else
                click(random_click(鬼王挑战界面.挑战[1],鬼王挑战界面.挑战[2]))
                mSleep(2000)
              end
              if 找到SSR就铃声提醒 == 1 then
                stopAudio() 
              end
            elseif SR开组 == 1 and (multiColor2(SR判定,80) or multiColor2(SR判定模拟器,80)) then
              showHD("鬼王挑战界面-有SR")
              if 是否拉组队 == 3 and 临时加过好友了 == false then
                需要临时加好友 = true
                鬼王挑战界面次数 = 0
                click(random_click(式神碎片界面.关闭[1],式神碎片界面.关闭[2]))
                mSleep(1000)
              else
                click(random_click(鬼王挑战界面.挑战[1],鬼王挑战界面.挑战[2]))
                mSleep(2000)
              end
            elseif R开组 == 1 and multiColor2(R判定,80) then
              showHD("鬼王挑战界面-有R")
              if 是否拉组队 == 3 and 临时加过好友了 == false then
                需要临时加好友 = true
                鬼王挑战界面次数 = 0
                click(random_click(式神碎片界面.关闭[1],式神碎片界面.关闭[2]))
                mSleep(1000)
              else
                click(random_click(鬼王挑战界面.挑战[1],鬼王挑战界面.挑战[2]))
                mSleep(2000)
              end
            elseif R开组 == 1 and SR开组 == 1 and SSR开组 == 1 then
              showHD("鬼王挑战界面-全选了")
              if 是否拉组队 == 3 and 临时加过好友了 == false then
                需要临时加好友 = true
                click(random_click(式神碎片界面.关闭[1],式神碎片界面.关闭[2]))
                mSleep(1000)
              else
                click(random_click(鬼王挑战界面.挑战[1],鬼王挑战界面.挑战[2]))
                mSleep(2000)
              end
            else
              if 鬼王挑战界面次数 == 1 then
                鬼王挑战界面次数 = 2
              elseif 鬼王挑战界面次数 == 3 then
                鬼王挑战界面次数 = 4
              elseif 鬼王挑战界面次数 == 5 then
                鬼王挑战界面次数 = 6
              end
              --showHD("鬼王挑战界面-毛都没有")
              --打完鬼王了 = true
              --click(random_click(式神碎片界面.关闭[1],式神碎片界面.关闭[2]))
            end
          end
        end
      elseif 要做什么 == 2 and multiColor2(副本探索界面,90) then
        click(副本探索界面.探索[1],副本探索界面.探索[2])
        mSleep(1000)
      elseif multiColor2(式神碎片界面,90) then
        sysLog("式神碎片界面")
        showHD("式神碎片界面")
        click(random_click(式神碎片界面.关闭[1],式神碎片界面.关闭[2]))
        mSleep(random_time())
      elseif multiColor2(断线期间结束战斗,93) then
        sysLog("断线期间结束战斗")
        showHD("断线期间结束战斗")
        click(random_click(断线期间结束战斗.确定[1],断线期间结束战斗.确定[2]))
        mSleep(random_time())
      elseif multiColor2(战斗准备,90) or multiColor2(战斗准备1,90) then
        sysLog("战斗准备")
        showHD("战斗准备")
        click(战斗准备.点击[1],战斗准备.点击[2])
        mSleep(random_time())
      elseif multiColor2(组队详情,90) then
        sysLog("组队详情")
        showHD("组队详情")
        鬼王挑战界面次数 = 0
        if 几个人开始 == 1 and isColorArray2(组队详情.开组2人,90) == false then
          sysLog("开组2人")
          click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
        elseif 几个人开始 == 2 and isColorArray2(组队详情.开组3人,90) == false then
          sysLog("开组3人")
          click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
        elseif 是否拉组队 == 0 then
          sysLog("是否拉组队 == 0")
        else
          if 首次进入组队详情 then
            首次进入组队详情 = false
            本号打鬼王次数 = 本号打鬼王次数 +1
            上次邀请时间 = mTime() - 11000
          end
          if mTime() - 上次邀请时间 > 10000 then
            上次邀请时间 = mTime()
            click(random_click(组队详情.开组3人[1],组队详情.开组3人[2]))
          end
        end
        mSleep(random_time())
      elseif multiColor2(挂机御魂邀请界面,90) or multiColor2(挂机御魂邀请界面1,90) then
        sysLog("挂机御魂邀请界面")
        showHD("邀请界面")
        if 是否拉组队 == 1 or 是否拉组队 == 3 then
          click(random_click(挂机御魂邀请界面.第一个[1],挂机御魂邀请界面.第一个[2]))
          mSleep(1000)
          if 几个人开始 == 2 then
            click(random_click(挂机御魂邀请界面.第二个[1],挂机御魂邀请界面.第二个[2]))
            mSleep(1000)
          end
          click(random_click(挂机御魂邀请界面.确定[1],挂机御魂邀请界面.确定[2]))
          mSleep(2000)
        else
          click(random_click(挂机御魂邀请界面.取消[1],挂机御魂邀请界面.取消[2]))
          mSleep(random_time())
        end
      elseif multiColor2(选择区域,90) then
        sysLog("选择区域")
        click(random_click(选择区域.点击[1],选择区域.点击[2]))
        mSleep(1000)
      elseif multiColor2(用户设置界面,90) then
        sysLog("用户设置界面")
        showHD("用户设置界面")
        if 要做什么 == 3 then
          acc_index = acc_index + 1
          if acc_index >= acc_size then
            if 账号循环 ==  0 then
              acc_index = 1
            else	
              vibrator()
              mSleep(15000)
              lua_exit()
            end
          end
          setNumberConfig("cloud_ear_acc_index",acc_index)
          click(random_click(用户设置界面.用户中心[1],用户设置界面.用户中心[2]))
        elseif 打完鬼王了 or 体力不足了 then
          acc_index = acc_index + 1
          if acc_index >= acc_size then
            if 账号循环 ==  0 then
              acc_index = 1
            else	
              vibrator()
              mSleep(15000)
              lua_exit()
            end
          end
          本号捐过碎片了 = 0
          setNumberConfig("cloud_ear_acc_index",acc_index)
          click(random_click(用户设置界面.用户中心[1],用户设置界面.用户中心[2]))
        else
          找关闭按钮()
        end
        mSleep(2000)
			elseif multiColor2(用户设置界面170520,90) then
        sysLog("用户设置界面")
        showHD("用户设置界面")
        if 要做什么 == 3 then
          acc_index = acc_index + 1
          if acc_index >= acc_size then
            if 账号循环 ==  0 then
              acc_index = 1
            else	
              vibrator()
              mSleep(15000)
              lua_exit()
            end
          end
          setNumberConfig("cloud_ear_acc_index",acc_index)
          click(random_click(用户设置界面170520.用户中心[1],用户设置界面170520.用户中心[2]))
        elseif 打完鬼王了 or 体力不足了 then
          acc_index = acc_index + 1
          if acc_index >= acc_size then
            if 账号循环 ==  0 then
              acc_index = 1
            else	
              vibrator()
              mSleep(15000)
              lua_exit()
            end
          end
          本号捐过碎片了 = 0
          setNumberConfig("cloud_ear_acc_index",acc_index)
          click(random_click(用户设置界面170520.用户中心[1],用户设置界面170520.用户中心[2]))
        else
          找关闭按钮()
        end
        mSleep(2000)
      elseif multiColor2(账号登陆界面6P,90) then
        sysLog("账号登陆界面6P")
        showHD("账号登陆界面")
        上次闪退了 = false
        打完鬼王了 = false
        加过好友了 = false 
        本号打鬼王次数 = 0
        本号捐过碎片了 = 0
        体力不足了 = false
        click(random_click(账号登陆界面6P.其他账号[1],账号登陆界面6P.其他账号[2]))
        mSleep(1000)
      elseif multiColor2(选择登陆方式界面6P,93) then
        sysLog("选择登陆方式界面6P")
        showHD("选择登陆方式界面")
        上次闪退了 = false
        打完鬼王了 = false
        加过好友了 = false 
        本号打鬼王次数 = 0
        本号捐过碎片了 = 0
        体力不足了 = false
        click(random_click(选择登陆方式界面6P.邮箱登陆[1],选择登陆方式界面6P.邮箱登陆[2]))
        mSleep(random_time())
      elseif multiColor2(选择登陆方式界面16P,93) then
        sysLog("选择登陆方式界面16P")
        showHD("选择登陆方式界面")
        上次闪退了 = false
        打完鬼王了 = false
        加过好友了 = false 
        本号打鬼王次数 = 0
        本号捐过碎片了 = 0
        体力不足了 = false
        click(random_click(选择登陆方式界面16P.邮箱登陆[1],选择登陆方式界面16P.邮箱登陆[2]))
        mSleep(random_time())
      elseif multiColor2(选择登陆方式界面1,93) then
        sysLog("选择登陆方式界面1")
        showHD("选择登陆方式界面")
        上次闪退了 = false
        打完鬼王了 = false
        加过好友了 = false 
        本号打鬼王次数 = 0
        本号捐过碎片了 = 0
        体力不足了 = false
        click(random_click(选择登陆方式界面1.邮箱登陆[1],选择登陆方式界面1.邮箱登陆[2]))
        mSleep(random_time())
      elseif multiColor2(账号登陆界面,90) then
        sysLog("账号登陆界面")
        showHD("账号登陆界面")
        上次闪退了 = false
        打完鬼王了 = false
        加过好友了 = false 
        本号打鬼王次数 = 0
        本号捐过碎片了 = 0
        体力不足了 = false
        click(random_click(账号登陆界面.其他账号[1],账号登陆界面.其他账号[2]))
        mSleep(random_time())
      elseif multiColor2(选择登陆方式界面,93) then
        sysLog("选择登陆方式界面")
        showHD("选择登陆方式界面")
        上次闪退了 = false
        打完鬼王了 = false
        加过好友了 = false 
        本号打鬼王次数 = 0
        本号捐过碎片了 = 0
        体力不足了 = false
        click(random_click(选择登陆方式界面.邮箱登陆[1],选择登陆方式界面.邮箱登陆[2]))
        mSleep(random_time())
      elseif multiColor2(账号密码界面已输入,93) then
        showHD("账号密码界面已输入")
        click(random_click(账号密码界面已输入.回退[1],账号密码界面已输入.回退[2]))
        mSleep(random_time())
      elseif multiColor2(账号密码界面6P,93) then
        sysLog("账号密码界面"..acc_size)
        toast("正在登陆第"..acc_index.."个号")
        showHD("账号密码界面")
        上次闪退了 = false
        打完鬼王了 = false
        加过好友了 = false 
        本号打鬼王次数 = 0
        本号捐过碎片了 = 0
        体力不足了 = false
        local account = getaccount(acc_index)
        local account_table = Split(account,"*")
        当前账号 = account_table[1]
        当前密码 = account_table[2]
        --if 手机平台 ==  1 then
        click(random_click(账号密码界面6P.账号[1],账号密码界面6P.账号[2]))
        sysLog("账号密码界面6P.账号")
        mSleep(2000)
        if isColorArray2(账号密码界面6P.小叉,93) then
          click(random_click(账号密码界面6P.小叉[1],账号密码界面6P.小叉[2]))
          mSleep(1000)
        end
        if isColorArray2(账号密码界面6P.安卓小叉,93) then
          click(random_click(账号密码界面6P.安卓小叉[1],账号密码界面6P.安卓小叉[2]))
          mSleep(1000)
        end
        inputText(account_table[1])
        sysLog("inputText")
        mSleep(2000)
        click(random_click(账号密码界面6P.点一下[1],账号密码界面6P.点一下[2]))
        sysLog("点一下")
        mSleep(2000)
        click(random_click(账号密码界面6P.密码[1],账号密码界面6P.密码[2]))
        sysLog("密码")
        mSleep(2000)
        inputText("#CLEAR#")
        mSleep(1000)
        inputText(account_table[2])
        sysLog("inputText")
        mSleep(2000)
        click(random_click(账号密码界面6P.点一下[1],账号密码界面6P.点一下[2]))
        sysLog("点一下")
        mSleep(2000)
        click(random_click(账号密码界面6P.登陆[1],账号密码界面6P.登陆[2]))
        mSleep(3000)
        --else
        
        --end
      elseif multiColor2(账号密码界面B站,93) then
        sysLog("账号密码界面"..acc_size)
        toast("正在登陆第"..acc_index.."个号")
        showHD("账号密码界面")
        上次闪退了 = false
        打完鬼王了 = false
        加过好友了 = false 
        本号打鬼王次数 = 0
        本号捐过碎片了 = 0
        体力不足了 = false
        local account = getaccount(acc_index)
        local account_table = Split(account,"*")
        当前账号 = account_table[1]
        当前密码 = account_table[2]
        --if 手机平台 ==  1 then
        click(random_click(账号密码界面B站.账号[1],账号密码界面B站.账号[2]))
        sysLog("账号密码界面B站.账号")
        mSleep(2000)
        inputText("#CLEAR#")
        mSleep(1000)
        inputText(account_table[1])
        sysLog("inputText")
        mSleep(2000)
        click(random_click(账号密码界面B站.点一下[1],账号密码界面B站.点一下[2]))
        sysLog("点一下")
        mSleep(2000)
        click(random_click(账号密码界面B站.密码[1],账号密码界面B站.密码[2]))
        sysLog("密码")
        mSleep(2000)
        inputText("#CLEAR#")
        mSleep(1000)
        inputText(account_table[2])
        sysLog("inputText")
        mSleep(2000)
        --click(random_click(账号密码界面B站.点一下[1],账号密码界面B站.点一下[2]))
        --sysLog("点一下")
        --mSleep(2000)
        click(random_click(账号密码界面B站.登陆[1],账号密码界面B站.登陆[2]))
        mSleep(3000)
        --else
        
        --end
      elseif multiColor2(账号密码界面,93) then
        sysLog("账号密码界面"..acc_size)
        toast("正在登陆第"..acc_index.."个号")
        showHD("账号密码界面")
        上次闪退了 = false
        打完鬼王了 = false
        加过好友了 = false 
        本号打鬼王次数 = 0
        本号捐过碎片了 = 0
        体力不足了 = false
        local account = getaccount(acc_index)
        local account_table = Split(account,"*")
        当前账号 = account_table[1]
        当前密码 = account_table[2]
        --if 手机平台 ==  1 then
        click(random_click(账号密码界面.账号[1],账号密码界面.账号[2]))
        sysLog("账号密码界面.账号")
        mSleep(2000)
        if isColorArray2(账号密码界面.小叉,93) then
          click(random_click(账号密码界面.小叉[1],账号密码界面.小叉[2]))
          mSleep(1000)
        end
        if w == 768 or w == 1536 or w == 1024 or w ==2048 then
          
        else
          if isColorArray2(账号密码界面.安卓小叉,93) then
            click(random_click(账号密码界面.安卓小叉[1],账号密码界面.安卓小叉[2]))
            mSleep(1000)
          end
          if isColorArray2(账号密码界面.果盘小叉,93) == false then
            click(random_click(账号密码界面.果盘小叉[1],账号密码界面.果盘小叉[2]))
            mSleep(1000)
          end
        end
        inputText(account_table[1])
        sysLog("inputText")
        mSleep(2000)
        click(random_click(账号密码界面.点一下[1],账号密码界面.点一下[2]))
        sysLog("点一下")
        mSleep(2000)
        click(random_click(账号密码界面.密码[1],账号密码界面.密码[2]))
        sysLog("密码")
        mSleep(2000)
        inputText("#CLEAR#")
        mSleep(1000)
        inputText(account_table[2])
        sysLog("inputText")
        mSleep(2000)
        click(random_click(账号密码界面.点一下[1],账号密码界面.点一下[2]))
        sysLog("点一下")
        mSleep(2000)
        click(random_click(账号密码界面.登陆[1],账号密码界面.登陆[2]))
        mSleep(3000)
        --else
        
        --end
      elseif multiColor2(登陆界面,90) or multiColor2(新登陆界面,90) or multiColor2(登陆界面170520,92) or multiColor2(登陆界面170528,92) then
        sysLog("登陆界面")
        showHD("登陆界面")
        if 上次闪退了 then	
          click(random_click(登陆界面.用户中心[1],登陆界面.用户中心[2]))
        else
          click(random_click(登陆界面.点击[1],登陆界面.点击[2]))
        end
        mSleep(random_time())
      elseif multiColor2(登陆公告,90) then
        sysLog("登陆公告")
        click(random_click(登陆公告.关闭[1],登陆公告.关闭[2]))
        mSleep(random_time())
      elseif multiColor2(下载语音包,90) then
        sysLog("下载语音包")
        showHD("下载语音包")
        click(random_click(下载语音包.取消[1],下载语音包.取消[2]))
        mSleep(random_time())
      elseif multiColor2(被封号了,90) then
        sysLog("被封号了")
        showHD("被封号了")
        click(random_click(被封号了.确定[1],被封号了.确定[2]))
        mSleep(random_time())
      elseif multiColor2(网络连接出错,93) then
        sysLog("网络连接出错")
        showHD("网络连接出错")
        click(random_click(网络连接出错.点击[1],网络连接出错.点击[2]))
        mSleep(random_time())
      elseif multiColor2(点击进入游戏,90) or multiColor2(新点击进入游戏,90) or multiColor2(点击进入游戏170520,90) then
        sysLog("点击进入游戏")
        showHD("点击进入游戏")
        if isColorArray(点击进入游戏.创建角色,90) then
          是否要加一 = true
          closeApp(appid)
        else
          click(random_click(点击进入游戏.点击[1],点击进入游戏.点击[2]))
          mSleep(3000)
          if multiColor(被封号了,90) then
            sysLog("被封号了")
            是否要加一 = true
            click(random_click(被封号了.确定[1],被封号了.确定[2]))
            mSleep(1000)
            closeApp(appid)
            mSleep(1000)
          end
        end
        本号开始时间 = mTime()
        mSleep(random_time())
      elseif multiColor2(游戏公告,93) then
        sysLog("游戏公告")
        showHD("游戏公告，关闭")
        click(random_click(游戏公告.关闭[1],游戏公告.关闭[2]))
        mSleep(random_time())
      elseif multiColor2(模拟器无响应,90) then
        sysLog("模拟器无响应")
        click(random_click(模拟器无响应.确定[1],模拟器无响应.确定[2]))
        mSleep(random_time())
      elseif multiColor2(模拟器无响应天天,90) then
        sysLog("模拟器无响应天天")
        click(random_click(模拟器无响应天天.确定[1],模拟器无响应天天.确定[2]))
        mSleep(random_time())
      elseif multiColor2(登陆后活动界面,93) or multiColor2(登陆后活动界面1,93) then
        sysLog("登陆后活动界面")
        showHD("登陆后活动界面")
        mSleep(3000)
        if multiColor(用户中心界面,90) then
          
        else
          click(random_click(登陆后活动界面.返回[1],登陆后活动界面.返回[2]))
          mSleep(1000)
        end
      elseif multiColor2(登陆后活动界面2,93) then
        sysLog("登陆后活动界面2")
        showHD("登陆后活动界面")
        mSleep(3000)
        if multiColor(用户中心界面,90) then
          
        else
          click(random_click(登陆后活动界面2.返回[1],登陆后活动界面2.返回[2]))
          mSleep(1000)
        end
      elseif multiColor2(登陆后活动界面果盘,93) or multiColor2(登陆后活动界面海马玩,93) then
        sysLog("登陆后活动界面")
        showHD("登陆后活动界面")
        mSleep(3000)
        if multiColor(用户中心界面,90) then
          
        else
          click(random_click(登陆后活动界面果盘.返回[1],登陆后活动界面果盘.返回[2]))
          mSleep(1000)
        end
      elseif 要做什么 == 1 and mTime() - 本号开始时间 > 600*1000 then
        是否要加一 = true
        本号开始时间 = mTime()
        closeApp(appid)
        mSleep(1000)
      elseif mTime() - start_time > 300*1000 then
        是否要加一 = true
        closeApp(appid)
        mSleep(1000)
      elseif mTime() - start_time > 30*1000 then
        找关闭按钮()
        mSleep(1000)
      end
      keepScreen(false)
    else
      sysLog("闪退了")
      showHD("闪退了")
      if multiColor(模拟器无响应,90) then
        sysLog("模拟器无响应")
        click(random_click(模拟器无响应.确定[1],模拟器无响应.确定[2]))
        mSleep(random_time())
      elseif multiColor(模拟器无响应天天,90) then
        sysLog("模拟器无响应天天")
        click(random_click(模拟器无响应天天.确定[1],模拟器无响应天天.确定[2]))
        mSleep(random_time())
      else
        if 是否要加一 then
          acc_index = acc_index + 1
          if acc_index >= acc_size then
            if 账号循环 ==  0 then
              acc_index = 1
            else	
              vibrator()
              mSleep(15000)
              lua_exit()
            end
          end
          setNumberConfig("cloud_ear_acc_index",acc_index)
        end
        是否要加一 = true
        上次闪退了 = true
        本号打鬼王次数 = 0
        本号捐过碎片了 = 0
        打完鬼王了 = false
        临时加过好友了 = false
        需要临时加好友 = false
        需要临时删好友 = false
        体力不足了 = false
        runApp(appid)
        mSleep(10000)
        click(random_click(点击进入游戏.点击[1],点击进入游戏.点击[2]))
        mSleep(1000)
      end
    end
  end
end

function kapingjiance()
  keepScreen(false)
  keepScreen(true)
  组队头像检测 = {}
  组队头像检测3人 = {}
  table.insert(组队头像检测,{组队头像识别点[1][1],组队头像识别点[1][2],getColor(组队头像识别点[1][1],组队头像识别点[1][2])})
  table.insert(组队头像检测,{组队头像识别点[2][1],组队头像识别点[2][2],getColor(组队头像识别点[2][1],组队头像识别点[2][2])})
  table.insert(组队头像检测,{组队头像识别点[3][1],组队头像识别点[3][2],getColor(组队头像识别点[3][1],组队头像识别点[3][2])})
  table.insert(组队头像检测,{组队头像识别点[4][1],组队头像识别点[4][2],getColor(组队头像识别点[4][1],组队头像识别点[4][2])})
  table.insert(组队头像检测,{组队头像识别点[5][1],组队头像识别点[5][2],getColor(组队头像识别点[5][1],组队头像识别点[5][2])})
  if (功能 == 4 and 御魂开组几人==3) or (功能 == 3 and 觉醒开组几人==3) or (功能 == 6 and 组队突破几人==3) then
		table.insert(组队头像检测3人,{组队头像3人识别点[1][1],组队头像3人识别点[1][2],getColor(组队头像3人识别点[1][1],组队头像3人识别点[1][2])})
    table.insert(组队头像检测3人,{组队头像3人识别点[2][1],组队头像3人识别点[2][2],getColor(组队头像3人识别点[2][1],组队头像3人识别点[2][2])})
    table.insert(组队头像检测3人,{组队头像3人识别点[3][1],组队头像3人识别点[3][2],getColor(组队头像3人识别点[3][1],组队头像3人识别点[3][2])})
    table.insert(组队头像检测3人,{组队头像3人识别点[4][1],组队头像3人识别点[4][2],getColor(组队头像3人识别点[4][1],组队头像3人识别点[4][2])})
    table.insert(组队头像检测3人,{组队头像3人识别点[5][1],组队头像3人识别点[5][2],getColor(组队头像3人识别点[5][1],组队头像3人识别点[5][2])})
  end
  keepScreen(false)
end
