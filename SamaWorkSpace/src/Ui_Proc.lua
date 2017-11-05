

function Other_proc()
  --sysLog("卡屏次数")
	w,h = getScreenSize();
  if 功能 == 6 and 阴阳寮攻击() then
    mSleep(5000)
    click(random_click(阴阳寮选择[1][1],阴阳寮选择[1][2]))
  elseif 自动突破 == 1 and (功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 5 or 功能 == 30 or 功能 == 11) and 个人攻击() then
    mSleep(5000)
    click(random_click(个人突破.个人[1],个人突破.个人[2]))
  else
    if mTime() - start_time > 30*1000 then
      sysLog("默认点一下")
      showHD_b("30秒无操作，点一下")
			--showHD_b("您的手机分辨率为"..h.."*"..w)

			--local lr,lg,lb = getColorRGB(685,24)
			--local lr1,lg1,lb1 = getColorRGB(41,54)
			--local lr2,lg2,lb2 = getColorRGB(974,109)
			--local lr3,lg3,lb3 = getColorRGB(515,28)
      --showHD_b("a="..lr..":"..lg..":"..lb.."b="..lr1..":"..lg1..":"..lb1.."c="..lr2..":"..lg2..":"..lb2.."颜色="..lr3..":"..lg3..":"..lb3)

		
      --if 目前是缩放状态 == false then
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
          重写界面参数(768*1024)
          重写推图参数()
          setScreenScale(768, 1024);
        else
          toast("您的手机分辨率为"..h.."*"..w.."。很抱歉，不支持您的手机分辨率。")
          mSleep(1000)
          lua_exit()
        end
      end
      
      --end
      if 功能 == 1 then
        找关闭按钮()
        mSleep(2000)
        keepScreen(false)
        keepScreen(true)
        if multiColor2(副本大地图,90)== false and multiColor2(推图中,90)== false then
          click(random_click(判断有准备的鼓.点击[1],判断有准备的鼓.点击[2]))
          mSleep(250)
        end
        if multiColor2(判断有准备的鼓,90) then
          click(random_click(判断有准备的鼓.点击[1],判断有准备的鼓.点击[2]))
        end
        if isColorArray(妖怪退治红蛋.返回,90) or isColorArray(妖怪退治红蛋.返回1,90) then
          click(random_click(妖怪退治红蛋.返回[1],妖怪退治红蛋.返回[2]))
          mSleep(1000)
        end
      elseif 功能 == 9 or 功能 == 40 then
        找关闭按钮()
        mSleep(1000)
        click(random_click(推图中.右边[1],推图中.右边[2]))
        mSleep(250)
      else
        找关闭按钮()
        if multiColor(判断有准备的鼓,90) then
          click(random_click(判断有准备的鼓.点击[1],判断有准备的鼓.点击[2]))
        end
        if 功能 ~= 50 and 功能 ~= 102 then
          sysLog("功能点右边"..功能)
          click(random_click(主界面.点一下[1],主界面.点一下[2],70))
        end
        if isColorArray(妖怪退治红蛋.返回,90) or isColorArray(妖怪退治红蛋.返回1,90) then
          click(random_click(妖怪退治红蛋.返回[1],妖怪退治红蛋.返回[2]))
          mSleep(1000)
        end
      end
      start_time = mTime()
      if 关闭统计 == 0 then
        toast("★  探索："..数据统计[1].."次  妖气："..数据统计[2].."次  ★\n★  觉醒："..数据统计[3].."次  御魂："..数据统计[4].."次  ★\n★  业原："..数据统计[5].."次  御灵："..数据统计[6].."次  ★\n★  寮突："..数据统计[7].."次  个人："..数据统计[8].."次  ★")
      end
    end
  end
end

function FuBen_Map_4()
  sysLog("8副本大地图")
  if 地图找宝箱() then
    mSleep(3000)
  end
  是否换式神 = false
  刚进副本 = true
  if 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
    sysLog("自动阴阳寮")
    showHD_b("寄养时间到")
    click(random_click(副本大地图.返回[1],副本大地图.返回[2]))
    mSleep(1000)
  elseif (multiColor2(突破卷满,90) == false and 自动突破 == 1) or 是否突破卷满 == 1 then
    sysLog("是否突破卷满")
    showHD_b("突破卷满，去突破")
    是否突破卷满 = 1
    click(random_click(副本大地图.结界突破[1],副本大地图.结界突破[2],20,20))
    mSleep(2000)
  elseif 自动阴阳寮 == 1 and ( mTime() > 阴阳寮开始时间 or 正在进行这一轮突破) then
    sysLog("自动阴阳寮")
    showHD_b("阴阳寮时间到")
    本轮阴阳寮开始 = true
    click(random_click(副本大地图.结界突破[1],副本大地图.结界突破[2],20,20))
    mSleep(1000)
  end
  mSleep(random_time())
end

function FuBen_Map_3()
  sysLog(功能.."副本大地图")
  if 地图找宝箱() then
    showHD_b("找到地图宝箱了")
    mSleep(3000)
  end		
  if 要打妖怪退治  or 要打鬼王 then
    sysLog("自动阴阳寮")
    showHD_b("妖怪退治")
    click(random_click(副本大地图.返回[1],副本大地图.返回[2]))
    mSleep(1000)
  elseif 功能 == 6 then
    if 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
      sysLog("自动阴阳寮")
      showHD_b("寄养时间到")
      click(random_click(副本大地图.返回[1],副本大地图.返回[2]))
      mSleep(1000)
    elseif 定期妖气相关() then
      showHD_b("定期妖气时间到")
      click(random_click(副本大地图.返回[1],副本大地图.返回[2]))
      mSleep(1000)
    elseif 突破等待 == 2 and (mTime() > 阴阳寮开始时间 or 正在进行这一轮突破) then
      showHD_b("阴阳寮时间到")
      本轮阴阳寮开始 = true
      click(random_click(副本大地图.结界突破[1],副本大地图.结界突破[2],20))
    elseif 突破等待 == 3  then
      if (mTime() > 阴阳寮开始时间 or 正在进行这一轮突破) then
        showHD_b("阴阳寮时间到")			
        本轮阴阳寮开始 = true				
        click(random_click(副本大地图.结界突破[1],副本大地图.结界突破[2],20))
      else
        mSleep(1000)
        if multiColor(阴阳寮突破,90) then
          click(random_click(个人突破.关闭[1],个人突破.关闭[2]))
          mSleep(500)
        end
        锁屏状态 = true
        lockDevice()
      end
    elseif 突破等待 == 1 then
      showHD_b("去打阴阳寮")
      click(random_click(副本大地图.结界突破[1],副本大地图.结界突破[2],20))
    else
      --local 剩余时间 = math.floor((mTime() - 阴阳寮开始时间)/1000)
      showHD_b("阴阳寮CD中，等待")
    end
  else
    click(random_click(副本大地图.结界突破[1],副本大地图.结界突破[2],20))
  end
  mSleep(1000)
end          

--88副本大地图
function FuBen_Map_2()
  sysLog("88副本大地图")
  sysLog("日常步骤"..日常步骤)
  if 地图找宝箱() then
    showHD_b("找到地图宝箱了")
    mSleep(3000)
  end
  if ((功能 == 3 and 觉醒组队单刷 ~= 1)or (功能 == 4 and 御魂组队单刷 ~= 1)) and 从战斗中出来 and 正在任务切换途中 == false then
    从战斗中出来 = false
    sysLog("等组队邀请")
    for i=1,8 do
      if multiColor(组队邀请,90) then
        break
      end
      mSleep(1000)
    end
  else
    sysLog("不等组队邀请")
    正在任务切换途中 = false
    if 功能 == 88  then
      if  日常步骤 == 4 then
        tuodong_canshu(副本大地图.右边拖动,200,10,10)
        tuodong_canshu(副本大地图.右边拖动,200,10,10)
        tuodong_canshu(副本大地图.右边拖动,200,10,10)
        tuodong_canshu(副本大地图.右边拖动,200,10,10)
        tuodong_canshu(副本大地图.右边拖动,200,10,10)
        tuodong_canshu(副本大地图.右边拖动,200,10,10)
        click(random_click(副本选图[1][1],副本选图[1][2]))
        mSleep(3000)
      elseif 日常步骤 == 5 then
        click(random_click(副本大地图.御魂[1],副本大地图.御魂[2],20,20))
      elseif 日常步骤 == 6 then
        click(random_click(副本大地图.觉醒材料[1],副本大地图.觉醒材料[2],20,20))
      elseif 日常步骤 == 7 then
        click(random_click(副本大地图.结界突破[1],副本大地图.结界突破[2],20,20))
      elseif 日常步骤 == 9 then
        click(random_click(副本大地图.返回[1],副本大地图.返回[2]))
      end
    elseif (multiColor2(突破卷满,90) == false and 自动突破 == 1) or 是否突破卷满 == 1 then
      sysLog("是否突破卷满")
      showHD_b("突破卷满，去突破")
      是否突破卷满 = 1
      click(random_click(副本大地图.结界突破[1],副本大地图.结界突破[2],20,20))
      mSleep(2000)
    elseif 自动阴阳寮 == 1 and ( mTime() > 阴阳寮开始时间 or 正在进行这一轮突破) then
      sysLog("自动阴阳寮")
      showHD_b("阴阳寮时间到")
      本轮阴阳寮开始 = true
      click(random_click(副本大地图.结界突破[1],副本大地图.结界突破[2],20,20))
      mSleep(1000)
    elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
      sysLog("自动阴阳寮")
      showHD_b("寄养时间到")
      click(random_click(副本大地图.返回[1],副本大地图.返回[2]))
      mSleep(1000)
    elseif 定期妖气相关() then
      showHD_b("定期妖气时间到")
      click(random_click(副本大地图.返回[1],副本大地图.返回[2]))
      mSleep(1000)
    elseif 要打妖怪退治  or 要打鬼王 then
      sysLog("自动阴阳寮")
      showHD_b("妖怪退治")
      click(random_click(副本大地图.返回[1],副本大地图.返回[2]))
      mSleep(1000)
    elseif 功能 == 11 then
      tuodong_canshu(副本大地图.右边拖动,200,10,10)
      tuodong_canshu(副本大地图.右边拖动,200,10,10)
      tuodong_canshu(副本大地图.右边拖动,200,10,10)
      tuodong_canshu(副本大地图.右边拖动,200,10,10)
      tuodong_canshu(副本大地图.右边拖动,200,10,10)
      tuodong_canshu(副本大地图.右边拖动,200,10,10)
      mSleep(1000)
      --sysLog(拖动选图)
      local num = math.floor((式神挑战章节-1)/4)
      --sysLog(num)
      local count = math.mod(式神挑战章节,4)
      if count == 0 then
        count =4
      end
      for i=1,num do
        tuodong2(副本大地图.右边拖动1)
        找关闭按钮()
      end
      click(random_click(副本选图[count][1],副本选图[count][2]))
      mSleep(3000)
    elseif 功能 == 3 then
      showHD_b("去觉醒")
      click(random_click(副本大地图.觉醒材料[1],副本大地图.觉醒材料[2],20))
    elseif 功能 == 30 then	
      showHD_b("去御魂")
      click(random_click(副本大地图.御魂[1],副本大地图.御魂[2],20))
    elseif 功能 == 5 then
      showHD_b("回去打妖气")
      click(random_click(副本大地图.返回[1],副本大地图.返回[2]))
      mSleep(1000)		
    elseif 功能 == 21 then
      showHD_b("去御灵")
      click(random_click(副本大地图.御灵[1],副本大地图.御灵[2]))
      mSleep(1000)						
    else
      showHD_b("去御魂")
      click(random_click(副本大地图.御魂[1],副本大地图.御魂[2],20))
    end
  end
  mSleep(random_time())
  
end          

--1副本大地图
function FuBen_Map_1()
  sysLog("1副本大地图")
  sysLog("推图次数="..推图次数)
  mSleep(2000)
  是boss战 = false 
  打完boss = false
  是否换式神 = false
  if ipad没有缩放 and (w == 1536 or w == 2048) then
    setScreenScale(768,1024)
    重写推图参数()
  end
  keepScreen(false)
  keepScreen(true)
  if multiColor2(副本大地图,90) then
    if 地图找宝箱() then
      showHD_b("找到地图宝箱了")
      mSleep(3000)
    elseif 发现石距自动打 == 1 and 地图找石距() then
      点击石距() 
      发现了石距 = true
      mSleep(5000)
    elseif 发现年兽自动打 == 1 and 地图找年兽() then
      发现了石距 = true
      mSleep(5000)
    elseif 发现石距震动提醒 == 1 and 发现石距铃声提醒 == 1 and 地图找石距() then
      for var = 1,30 do
        vibrator();             --振动
        mSleep(1000);           --持续 1 秒
      end
      playAudio("lingsheng.mp3")
      mSleep(10000)
      stopAudio() 
      setStringConfig("lua_exit","欢迎回来，上次因为您选择发现石距提醒而停止脚本。")
      lua_exit()
    elseif 发现石距震动提醒 == 1 and 地图找石距() then
      for var = 1,30 do
        vibrator();             --振动
        mSleep(1000);           --持续 1 秒
      end
      setStringConfig("lua_exit","欢迎回来，上次因为您选择发现石距提醒而停止脚本。")
      lua_exit()
    elseif 发现石距铃声提醒 == 1 and 地图找石距() then
      playAudio("lingsheng.mp3")
      mSleep(30000)
      stopAudio() 
      setStringConfig("lua_exit","欢迎回来，上次因为您选择发现石距提醒而停止脚本。")
      lua_exit()
    else
      if  (multiColor2(突破卷满,90) == false and 自动突破 == 1) or 是否突破卷满 == 1 then
        sysLog("是否突破卷满")
        showHD_b("突破卷满，去突破")
        是否突破卷满 = 1
        click(random_click(副本大地图.结界突破[1],副本大地图.结界突破[2],20))
        mSleep(2000)
      elseif 自动阴阳寮 == 1 and (mTime() > 阴阳寮开始时间 or 正在进行这一轮突破) then
        sysLog("自动阴阳寮")
        showHD_b("阴阳寮时间到")
        本轮阴阳寮开始 = true
        click(random_click(副本大地图.结界突破[1],副本大地图.结界突破[2],20))
        mSleep(1000)
      elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
        sysLog("自动阴阳寮")
        showHD_b("寄养时间到")
        click(random_click(副本大地图.返回[1],副本大地图.返回[2]))
        mSleep(1000)
      elseif 定期妖气相关() then
        showHD_b("定期妖气时间到")
        click(random_click(副本大地图.返回[1],副本大地图.返回[2]))
        mSleep(1000)
      elseif 要打妖怪退治 or 要打鬼王 then
        sysLog("自动阴阳寮")
        showHD_b("妖怪退治")
        click(random_click(副本大地图.返回[1],副本大地图.返回[2]))
        mSleep(1000)
      elseif 推图次数 <= 0 then
        if #任务表 > 0 then
          table.remove(任务表,1)
        end
        任务表处理(1)
      else
        showHD_b("去副本")
        if 选图方式 == 7 then
          全局break = false
          for i=1,8 do
            local x,y = 章节选择(拖动选图)
            if x > 0 then
              sysLog("拖动完成后判定x="..x..",y="..y)
              
              click(x+30,y+40)
              全局break = true
            else
              tuodong_xuantu(副本大地图.右边拖动2,10,10,10,拖动选图,1)
            end
            if 全局break then
              break
            end
          end
          if 全局break == false then
            for i=1,8 do
              local x,y = 章节选择(拖动选图)
              if x > 0 then
              sysLog("拖动完成后判定x="..x..",y="..y)
                click(x+10,y+40)
                全局break = true
              else
                tuodong_xuantu(副本大地图.右边拖动3,10,10,10,拖动选图,2)
              end
              if 全局break then
                break
              end
            end
          end
        elseif 选图方式 == 1 then
          click(random_click(副本选图[第几张图][1],副本选图[第几张图][2]))
          mSleep(1000)
        elseif 选图方式 == 2 then
          click(random_click(副本大地图.选图[1],副本大地图.选图[2]))
          mSleep(1000)
        elseif 选图方式 == 6 then
          tuodong_canshu(副本大地图.右边拖动,200,10,10)
          tuodong_canshu(副本大地图.右边拖动,200,10,10)
          tuodong_canshu(副本大地图.右边拖动,200,10,10)
          tuodong_canshu(副本大地图.右边拖动,200,10,10)
          tuodong_canshu(副本大地图.右边拖动,200,10,10)
          tuodong_canshu(副本大地图.右边拖动,200,10,10)
          mSleep(1000)
          --sysLog(拖动选图)
          local num = math.floor((拖动选图-1)/4)
          --sysLog(num)
          local count = math.mod(拖动选图,4)
          if count == 0 then
            count =4
          end
          for i=1,num do
            tuodong2(副本大地图.右边拖动1)
            找关闭按钮()
          end
          click(random_click(副本选图[count][1],副本选图[count][2]))
          mSleep(3000)
        end
      end
    end
  end
  mSleep(random_time())
  
end          


---5主界面1
function Main_ui_proc_4()
  sysLog("5主界面1")
  刚进入组队界面 = true
  组队界面持续时间 = 0
  if 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
    sysLog("自动阴阳寮")
    showHD_b("妖气-自动寄养")
    click(random_click(主界面.阴阳寮[1],主界面.阴阳寮[2]))
  else
    if 随机发呆 == 1 then
      local 随机发呆概率 = math.random(1,100)
      if 随机发呆概率 < 打了几次妖气 then
        要发呆一下 = false
      end
    end
    if 要发呆一下 then
      local 发呆多久 = math.random(1,5)
      for i=1,发呆多久*6 do
        showHD_b("正在随机发呆中")
        -- mSleep(10000)
      end
      要发呆一下 = false
      打了几次妖气 = 0
    end
    showHD_b("妖气-进入组队")
    click(random_click(主界面.组队[1],主界面.组队[2]))
  end
  mSleep(1000)
end

---6主界面
function Main_ui_proc_3()
  sysLog("6主界面")
  if 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
    sysLog("自动阴阳寮")
    showHD_b("庭院界面-去找寄养")
    if multiColor(主界面,92) or multiColor(主界面没打开卷轴,90) then
      click(random_click(主界面.打开菜单[1],主界面.打开菜单[2]))
      mSleep(1000)
    end
    click(random_click(主界面.阴阳寮[1],主界面.阴阳寮[2]))
    mSleep(1000)
  elseif 定期妖气相关() then
    showHD_b("庭院界面-定期妖气")
    if multiColor(主界面,92) or multiColor(主界面没打开卷轴,90) then
      click(random_click(主界面.打开菜单[1],主界面.打开菜单[2]))
      mSleep(1000)
    end
    click(random_click(主界面.组队[1],主界面.组队[2]))
    mSleep(1000)
  else
    showHD_b("庭院界面-去探索地图")
    if 要打妖怪退治 or 要打鬼王 then
      庭院找町中()
      --click(登陆后活动界面.町中[1],登陆后活动界面.町中[2])
    else
      tuodong4(登陆后活动界面.拖动)
      tuodong4(登陆后活动界面.拖动)
      mSleep(1000)
      click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
    end
    mSleep(random_time())
  end
  
end          

----8主界面
function Main_ui_proc_2()
  sysLog("8主界面")
  是否换式神 = false
  if 自动接受好友申请 == 1 and isColorArray(主界面.好友红点,90) then
    click(random_click(主界面.好友[1],主界面.好友[2]))
  end
  if 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
    sysLog("自动阴阳寮")
    showHD_b("庭院界面-去找寄养")
    if multiColor(主界面,92) or multiColor(主界面没打开卷轴,90) then
      click(random_click(主界面.打开菜单[1],主界面.打开菜单[2]))
      mSleep(1000)
    end
    click(random_click(主界面.阴阳寮[1],主界面.阴阳寮[2]))
    mSleep(1000)
  elseif 定期妖气相关() then
    showHD_b("庭院界面-定期妖气")
    if multiColor(主界面,92) or multiColor(主界面没打开卷轴,90) then
      click(random_click(主界面.打开菜单[1],主界面.打开菜单[2]))
      mSleep(1000)
    end
    click(random_click(主界面.组队[1],主界面.组队[2]))
    mSleep(random_time())
  elseif 自动阴阳寮 == 1 and ( mTime() > 阴阳寮开始时间  or 正在进行这一轮突破) then
    sysLog("自动阴阳寮")
    showHD_b("阴阳寮时间到")
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    mSleep(1000)
    click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
    mSleep(1000)
  elseif 是否突破卷满 ==  1 then
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    mSleep(1000)
    click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
    mSleep(1000)
  end
  mSleep(random_time())
end          


---主界面
function Main_ui_proc_1()
  sysLog("134主界面")
  showHD_b("庭院界面")
  刚进入组队界面 = true
  从觉醒挑战界面进入 = false
  if 功能== 9 or 功能== 10 then
    庭院找町中()
    mSleep(2000)
  elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
    sysLog("自动阴阳寮")
    showHD_b("庭院界面-去找寄养")
    if multiColor(主界面,92) or multiColor(主界面没打开卷轴,90) then
      click(random_click(主界面.打开菜单[1],主界面.打开菜单[2]))
      mSleep(1000)
    end
    click(random_click(主界面.阴阳寮[1],主界面.阴阳寮[2]))
    mSleep(random_time())
  elseif 定期妖气相关() then
    showHD_b("庭院界面-定期妖气")
    if multiColor(主界面,92) or multiColor(主界面没打开卷轴,90) then
      click(random_click(主界面.打开菜单[1],主界面.打开菜单[2]))
      mSleep(1000)
    end
    click(random_click(主界面.组队[1],主界面.组队[2]))
    mSleep(random_time())
  else
    if 要打妖怪退治 or 要打鬼王 then
      showHD_b("庭院界面-去町中")
      庭院找町中()
      --click(登陆后活动界面.町中[1],登陆后活动界面.町中[2])
    else
      showHD_b("庭院界面-去探索")
      mSleep(1000)
      tuodong4(登陆后活动界面.拖动)
      tuodong4(登陆后活动界面.拖动)
      mSleep(1000)
      click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
    end
    mSleep(2000)
  end
end

--111庭院界面
function At_home()
  sysLog("111庭院界面") 
  if 要打妖怪退治  then
    if 是打斗技还是鬼王 == 0 then
      sysLog("庭院界面")
      showHD_b("妖怪退治")
      click(庭院界面.妖怪退治[1],庭院界面.妖怪退治[2])
      mSleep(4000)
      for i=1 ,10 do
        if multiColor(妖怪退治红蛋,90) then
          click(random_click(妖怪退治红蛋.点击[1],妖怪退治红蛋.点击[2]))
          打完妖怪退治了 = false
          mSleep(2000)
          break
        else
          打完妖怪退治了 = true
        end
        mSleep(2000)
      end		
      打完妖怪退治了	= true
    elseif 是打斗技还是鬼王 == 1 then
      click(庭院界面.斗技[1],庭院界面.斗技[2])
      mSleep(3000)
    end	
  elseif 要打鬼王 then
    click(庭院界面.狩猎[1],庭院界面.狩猎[2])
    mSleep(3000)
  elseif 功能 == 9  then
    click(random_click(庭院界面.斗技[1],庭院界面.斗技[2]))
    mSleep(3000)
  elseif 功能 == 10  then
    click(random_click(庭院界面.百鬼[1],庭院界面.百鬼[2]))
    mSleep(3000)
  else
    click(random_click(庭院界面[1][1],庭院界面[1][2]))
    mSleep(3000)
  end
end

---新提示框
function Box_proc_new()
  sysLog("新提示框")
  if (功能== 1 or 功能== 3 or 功能== 4 or 功能== 20 or 功能== 21 or 功能 == 30 or 功能== 11) and 正在拒绝当中 then
    sysLog("正在拒绝当中")
    click(random_click(新提示框.取消[1],新提示框.取消[2]))
  elseif (功能== 1 or 功能== 3 or 功能== 4 or 功能== 20 or 功能== 21 or 功能 == 30) and 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间  then
    click(random_click(新提示框.取消[1],新提示框.取消[2]))
  elseif (功能== 1 or 功能== 3 or 功能== 4 or 功能== 6 or 功能== 20 or 功能== 21 or 功能 == 30 or 功能== 8 or 功能== 11) and 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
    click(random_click(新提示框.取消[1],新提示框.取消[2]))
  elseif (功能== 1 or 功能== 3 or 功能== 4 or 功能== 6 or 功能== 20 or 功能== 21 or 功能 == 30 or 功能== 8 or 功能== 11) and 定期妖气相关() then
    click(random_click(新提示框.取消[1],新提示框.取消[2]))
  elseif (要打妖怪退治 or 要打鬼王) and 功能~= 8  then
    click(random_click(新提示框.取消[1],新提示框.取消[2]))
  elseif 功能== 3 or 功能== 4 then
    if 御魂一直继续 == 1 then
      click(random_click(新提示框.确定[1],新提示框.确定[2]))
      开始时间 = mTime()
    elseif 上次战斗胜利 then
      上次战斗胜利 = true
      click(random_click(新提示框.确定[1],新提示框.确定[2]))
      开始时间 = mTime()
    else
      click(random_click(新提示框.取消[1],新提示框.取消[2]))
    end
    if 上次战斗胜利 == false then
      选过几层了 = false
    end
    mSleep(3000)
  elseif 功能 == 8 then
    if 挂机拒绝邀请 then
      click(random_click(新提示框.取消[1],新提示框.取消[2]))
    else
      click(random_click(新提示框.确定[1],新提示框.确定[2]))
    end            
  elseif 功能== 5 then
    click(random_click(新提示框.取消[1],新提示框.取消[2]))
  elseif 功能== 6 then
    if 突破接受邀请 == 0 then
      click(random_click(新提示框.取消[1],新提示框.取消[2]))
    else
      click(random_click(新提示框.确定[1],新提示框.确定[2]))
    end
  elseif 功能== 7 then
    if 突破接受邀请 == 0 then
      click(random_click(新提示框.取消[1],新提示框.取消[2]))
    else
      click(random_click(新提示框.确定[1],新提示框.确定[2]))
    end
  else
    click(random_click(新提示框.确定[1],新提示框.确定[2]))
    mSleep(5000)
  end
  mSleep(random_time())
end       


--提示框
function Box_proc()
  sysLog("提示框")
  if (功能== 1 or 功能== 3 or 功能== 4 or 功能== 20 or 功能== 21 or 功能 == 30 or 功能 == 11) and 正在拒绝当中 then
    click(random_click(提示框.取消[1],提示框.取消[2]))
  elseif (功能== 1 or 功能== 3 or 功能== 4 or 功能== 20 or 功能== 21 or 功能 == 30 or 功能 == 11) and 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
    click(random_click(提示框.取消[1],提示框.取消[2]))
  elseif (功能== 1 or 功能== 3 or 功能== 4 or 功能== 6 or 功能== 20 or 功能== 21 or 功能 == 30 or 功能== 8 or 功能 == 11) and 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
    click(random_click(提示框.取消[1],提示框.取消[2]))
  elseif (功能== 1 or 功能== 3 or 功能== 4 or 功能== 6 or 功能== 20 or 功能== 21 or 功能 == 30 or 功能== 8 or 功能 == 11) and 定期妖气相关() then
    click(random_click(提示框.取消[1],提示框.取消[2]))
  elseif (要打妖怪退治 or 要打鬼王) and 功能~= 8  then
    click(random_click(提示框.取消[1],提示框.取消[2]))
  elseif 功能== 3 or 功能== 4 then
    if 御魂一直继续 == 1 then
      click(random_click(提示框.确定[1],提示框.确定[2]))
      开始时间 = mTime()
    elseif 上次战斗胜利 then
      上次战斗胜利 = true
      click(random_click(提示框.确定[1],提示框.确定[2]))
      开始时间 = mTime()
    else
      click(random_click(提示框.取消[1],提示框.取消[2]))
    end
    if 上次战斗胜利 == false then
      选过几层了 = false
    end
    mSleep(3000)
  elseif 功能 == 8 then
    if 挂机拒绝邀请 then
      click(random_click(提示框.取消[1],提示框.取消[2]))
    else
      click(random_click(提示框.确定[1],提示框.确定[2]))
    end            
  elseif 功能== 5 then
    click(random_click(提示框.取消[1],提示框.取消[2]))
  elseif 功能== 6 then
    if 突破接受邀请 == 0 then
      click(random_click(提示框.取消[1],提示框.取消[2]))
    else
      click(random_click(提示框.确定[1],提示框.确定[2]))
    end
  elseif 功能== 7 then
    if 突破接受邀请 == 0 then
      click(random_click(提示框.取消[1],提示框.取消[2]))
    else
      click(random_click(提示框.确定[1],提示框.确定[2]))
    end
  elseif 功能== 1 then
    if 推图时拒绝邀请 == 1 then
      click(random_click(提示框.取消[1],提示框.取消[2]))
    else
      click(random_click(提示框.确定[1],提示框.确定[2]))
    end
  else
    click(random_click(提示框.确定[1],提示框.确定[2]))
    mSleep(5000)
  end
  上次邀请时间 = mTime() + 2000
  mSleep(random_time())
end       


--登陆后活动界面果盘
function Login_box_guopan()
  sysLog("登陆后活动界面")
  click(random_click(登陆后活动界面果盘.返回[1],登陆后活动界面果盘.返回[2]))
  mSleep(2000)
  if 要打妖怪退治  or 要打鬼王 or 功能 == 9 or 功能 == 10 then
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    庭院找町中()
    --click(登陆后活动界面.町中[1],登陆后活动界面.町中[2])
  elseif 功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能 == 6 or 功能 == 7 or 功能 == 11 then
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    mSleep(1000)
    click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
  end	
  
end          


--登陆后活动界面2
function Login_box2()
  sysLog("登陆后活动界面2")
  click(random_click(登陆后活动界面2.返回[1],登陆后活动界面2.返回[2]))
  mSleep(2000)
  if 要打妖怪退治  or 要打鬼王 or 功能 == 9 or 功能 == 10 then
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    庭院找町中()
  elseif 功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能 == 6 or 功能 == 7 or 功能 == 11 then
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    mSleep(1000)
    click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
  end	
end

--登陆后活动界面
function Login_box1()
  sysLog("登陆后活动界面")
  if multiColor2(登陆后活动界面日服,90) then
    click(random_click(登陆后活动界面日服.返回[1],登陆后活动界面日服.返回[2]))
  else
    click(random_click(登陆后活动界面.返回[1],登陆后活动界面.返回[2]))
  end
  mSleep(2000)
  if 要打妖怪退治 or 要打鬼王 or 功能 == 9 or 功能 == 10 then
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    庭院找町中()
  elseif 功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能 == 6 or 功能 == 7 or 功能 == 11 then
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    mSleep(1000)
    click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
  end	
end



--百鬼邀请界面
function Hundred_ghost_invite()
  sysLog("百鬼邀请界面")
  --local 百鬼邀请index = 0
  --local 百鬼邀请第几个 = 1
  if 百鬼邀请是否要拖动 then
    local i = 0
    while i < 百鬼邀请index do
      tuodong2(百鬼邀请界面.拖动)
      i = i +1
    end
  end
  showHD_b("百鬼邀请第"..(百鬼邀请第几个+百鬼邀请index*8).."个好友")
  百鬼邀请是否要拖动 = true
  click(random_click(百鬼邀请位置[百鬼邀请第几个][1],百鬼邀请位置[百鬼邀请第几个][2]))
  mSleep(random_time())
end

--百鬼夜行界面
function Hundred_ghost()
  sysLog("百鬼夜行界面")
  showHD_b("百鬼夜行界面")
  if 百鬼设置 == 2 then
    if multiColor2(判定是否邀请队友,90) then
      showHD_b("百鬼夜行-邀请好友")
      click(random_click(百鬼夜行界面.邀请好友[1],百鬼夜行界面.邀请好友[2]))
    else
      showHD_b("百鬼夜行-进入")
      click(random_click(百鬼夜行界面.进入[1],百鬼夜行界面.进入[2]))
      mSleep(2000)
      if multiColor(百鬼夜行界面,90) then
        showHD_b("好友次数不足，重新邀请")
        click(random_click(百鬼夜行界面.邀请好友[1],百鬼夜行界面.邀请好友[2]))
        百鬼邀请第几个 = 百鬼邀请第几个 +1
        百鬼邀请是否要拖动 = false
        if 百鬼邀请第几个 > 8 then
          百鬼邀请第几个 = 1
          百鬼邀请index = 百鬼邀请index +1
          百鬼邀请是否要拖动 = true
        end
      else
        同一个人邀请次数 = 同一个人邀请次数 +1
        if 同一个人邀请次数 >= 2 then
          同一个人邀请次数 = 0
          百鬼邀请第几个 = 百鬼邀请第几个 +1
          if 百鬼邀请第几个 > 8 then
            百鬼邀请第几个 = 1
            百鬼邀请index = 百鬼邀请index +1
          end
        end
      end
    end
  else
    click(random_click(百鬼夜行界面.进入[1],百鬼夜行界面.进入[2]))
  end
  mSleep(random_time())
end

--战斗失败
function LostBattle()
  sysLog("战斗失败")
  if ipad没有缩放 and (w == 1536 or w == 2048) then
    setScreenScale(768,1024)
    重写推图参数()
  end
  if 现在在打鬼王 then
    现在在打鬼王 = false
    打完鬼王了 = true
    要打鬼王 = false
  end
  缩放处理相关()
  组队邀请次数 = 0
  打标记次数 = 0
  click(random_click(领奖结束.点击[1],领奖结束.点击[2],70))
  if 战斗失败时间 == 0 or mTime() - 战斗失败时间 > 10*1000 then
    sysLog("战斗失败时间")
    战斗失败时间 = mTime() 
    if 战斗结束用来判定次数 then
      战斗结束用来判定次数 = false
      if 进入阴阳寮突破 == false and 进入个人突破 == false and 刚才在打妖气 == false then
        if 功能 == 20 then
          刷业原火次数 = 刷业原火次数 -1
        end
        if 功能 == 21 then
          刷御灵次数 = 刷御灵次数 -1
        end
        if 功能 == 1 then
          失败次数 = 失败次数+1
          if 是否换式神 then
            总共失败次数 = 总共失败次数 - 1
          end
        end
        if 功能 ==3 or 功能 == 4 then
          今天失败次数 = 今天失败次数 +1
          御魂觉醒失败次数 = 御魂觉醒失败次数 -1
          御魂觉醒连续失败次数Temp = 御魂觉醒连续失败次数Temp + 1
        end
        if 总共失败次数 <=0 then
          震动锁屏()
          setStringConfig("lua_exit","欢迎回来，上次因为推图失败次数不足而停止脚本。")
          lua_exit()
        end
        if 御魂觉醒失败次数 <= 0 then
          震动锁屏()
          setStringConfig("lua_exit","欢迎回来，上次因为御魂觉醒失败次数不足而停止脚本。")
          lua_exit()
        end
        if 御魂觉醒连续失败次数 <= 御魂觉醒连续失败次数Temp then
          震动锁屏()
          setStringConfig("lua_exit","欢迎回来，上次因为御魂觉醒失败次数不足而停止脚本。")
          lua_exit()
        end
      end
      if 进入阴阳寮突破 and 是否在阴阳寮组队 == false and 正在进行这一轮突破 then
        sysLog("突破失败阴阳寮第几个 - 1")
        阴阳寮第几个 = 阴阳寮第几个 - 1
      end
    end
  end
  if 功能==3 or 功能 ==4 then
    showHD_b("胜利："..今天成功次数.."次,失败："..今天失败次数.."次")
  else
    showHD_b("战斗失败")
  end
  上次战斗胜利 = false
  从战斗中出来 = true
  上次战斗时间 = mTime()
  start_time = mTime()
  第几回合 = 1
  组队邀请次数 = 0
  第二回合切换 = true
  第三回合切换 = true
  进入阴阳寮突破 = false	
  业原火点挑战次数 = 0
  是否在阴阳寮组队 = false
  mSleep(random_time())
  if 功能 == 5 then
    showHD_b("妖气剩余次数："..妖气封印次数)
    if 妖气封印次数 <= 0 then
      if #任务表 > 0 then
        table.remove(任务表,1)
      end
      任务表处理(功能)
    end
  end
  if 功能 == 3 then
    showHD_b("觉醒剩余次数："..刷觉醒次数)
    if 刷觉醒次数 <= 0 then
      if #任务表 > 0 then
        table.remove(任务表,1)
      end
      任务表处理(功能)
    end
  end
  if 功能 == 4 then
    showHD_b("御魂剩余次数："..刷御魂次数)
    if 刷御魂次数 <= 0 then
      if #任务表 > 0 then
        table.remove(任务表,1)
      end
      任务表处理(功能)
    end
  end
  if 功能 == 20 then
    showHD_b("业原火剩余次数："..刷业原火次数)
    if 刷业原火次数 <= 0 then
      if #任务表 > 0 then
        table.remove(任务表,1)
      end
      任务表处理(功能)
    end
  end
  if 功能 == 21 then
    showHD_b("御灵剩余次数："..刷御灵次数)
    if 刷御灵次数 <= 0 then
      if #任务表 > 0 then
        table.remove(任务表,1)
      end
      任务表处理(功能)
    end
  end
end

----战斗胜利
function WinBattle()
  sysLog("战斗胜利")
  --mSleep(2000)
  if ipad没有缩放 and (w == 1536 or w == 2048) then
    setScreenScale(768,1024)
    重写推图参数()
  end
  刚进入组队界面 = true
  缩放处理相关()
  if 功能==3 or 功能 ==4 then
    showHD_b("胜利："..今天成功次数.."次,失败："..今天失败次数.."次")
  else
    showHD_b("战斗胜利")
  end
  click(random_click(领奖结束.点击[1],领奖结束.点击[2],70))
  上次战斗时间 = mTime()
  业原火点挑战次数 = 0
  第二回合切换 = true
  第三回合切换 = true
  --进入阴阳寮突破 = false	
  是否在阴阳寮组队 = false
  start_time = mTime()
  if 阴阳寮now ~= 阴阳寮last and 正在进行这一轮突破 then
    阴阳寮last = 阴阳寮now
    阴阳寮开始时间 = mTime() + 30*1000 + 600*1000
    if 寮突破CD == 2 then
      local 随机加时 = math.random(1,120)
      阴阳寮开始时间 = 阴阳寮开始时间 + 随机加时*1000
    elseif 寮突破CD == 3 then
      local 随机加时 = math.random(1,300)
      阴阳寮开始时间 = 阴阳寮开始时间 + 随机加时*1000
    end
    sysLog("阴阳寮开始时间"..阴阳寮开始时间)
  end
  mSleep(1000)
end

---更换御魂界面
function YuHunChange()
  sysLog("更换御魂界面")
  if 功能 == 88 and 日常步骤 == 1 then
    if isColorArray(更换御魂界面.位置,90) then
      click(random_click(更换御魂界面.位置[1],更换御魂界面.位置[2]))
      mSleep(2000)
    end
    for i=1,#随便选御魂 do
      click(random_click(随便选御魂[i][1],随便选御魂[i][2]))
      mSleep(2000)
      if 御魂强化界面找强化() then
        mSleep(2000)
        break
      end
    end
  else
    click(random_click(式神录界面.退出[1],式神录界面.退出[2]))
  end
  mSleep(random_time())
  
end          

--御魂强化界面
function YuHunQiangHua()
  sysLog("御魂强化界面")
  if 功能 == 88 and 日常步骤 == 1 then
    click(random_click(御魂强化界面.排序[1],御魂强化界面.排序[2]))
    mSleep(1000)
    click(random_click(御魂强化界面.由低到高[1],御魂强化界面.由低到高[2]))
    mSleep(3000)
    click(random_click(御魂强化界面.第一个[1],御魂强化界面.第一个[2]))
    mSleep(2000)
    click(random_click(御魂强化界面.强化[1],御魂强化界面.强化[2]))
    mSleep(2000)
    if multiColor(确认强化界面,90) then
      click(random_click(确认强化界面.确认[1],确认强化界面.确认[2]))
      mSleep(1000)
    end
    for i=1,10 do
      if multiColor(御魂强化成功,90) then
        click(random_click(御魂强化成功.确定[1],御魂强化成功.确定[2]))
        日常步骤 = 2
        mSleep(1000)
        break
      end
      mSleep(1000)
    end
  else
    click(random_click(式神录界面.退出[1],式神录界面.退出[2]))
  end
  mSleep(random_time())
end

--任务界面
function ui_Task()
  sysLog("任务界面")
  if 功能 == 88 and 日常步骤 == 9 then
    click(random_click(任务界面.任务[1],任务界面.任务[2]))
    mSleep(1000)
    for i=1,50 do
      if isColorArray2(任务界面.完成,90) then
        click(random_click(任务界面.完成[1],任务界面.完成[2]))
      elseif multiColor2(获得奖励提示,90) then
        sysLog("获得奖励提示")
        click(random_click(获得奖励提示.点击[1],获得奖励提示.点击[2]))
      else
        sysLog("日常结束"..日常结束)
        click(random_click(任务界面.关闭[1],任务界面.关闭[2]))
        日常步骤 = 0
        --"锁屏","震动提醒","探索","御魂","阴阳寮突破") 
        if 日常结束 == 1 then
          lockDevice()
          setStringConfig("lua_exit","欢迎回来，上次因为日常结束而停止脚本。")
          lua_exit()
        elseif 日常结束 == 2 then
          for i=1,10 do
            vibrator()
            mSleep(1000)
          end
        elseif 日常结束 == 3 then
          功能 = 1
        elseif 日常结束 == 4 then
          功能 = 4
        elseif 日常结束 == 5 then
          功能 = 6
        end
        mSleep(500)
        break
      end
      mSleep(1000)
    end
  else
    click(random_click(任务界面.关闭[1],任务界面.关闭[2]))
  end
  mSleep(random_time())
end

--领奖结束
function Finish_rewards()
  sysLog("领奖结束")
  if ipad没有缩放 and (w == 1536 or w == 2048) then
    setScreenScale(768,1024)
    重写推图参数()
  end
  刚进入组队界面 = true
  缩放处理相关()
  if 功能 ==3 or 功能 == 4 then
    if 战斗失败时间 == 0 or mTime() - 战斗失败时间 > 10*1000 then
      战斗失败时间 = mTime() 
      今天成功次数 = 今天成功次数 +1
    end
    御魂觉醒连续失败次数Temp = 0
  end
  if 功能==3 or 功能 ==4 then
    showHD_b("胜利："..今天成功次数.."次,失败："..今天失败次数.."次")
  else
    showHD_b("领奖结束")
  end
  click(random_click(领奖结束.点击[1],领奖结束.点击[2],70))
  开始时间 = mTime()
  进入战斗切换 = true
  打标记次数 = 0
  第几回合 = 1
  上次战斗胜利 = true	
  第二回合切换 = true
  第三回合切换 = true
  组队邀请次数 = 0
  从战斗中出来 = true
  start_time = mTime()
  if 战斗结束用来判定次数 then
    战斗结束用来判定次数 = false
    if 进入阴阳寮突破 == false and 进入个人突破 == false and 我在打妖气 == false then
      if 功能 == 1 then
        打了几次探索 = 打了几次探索 + 1
        if 打了几次探索 > 几次检测一次满 then
          打了几次探索 = 0
        end
        数据统计[1] = 数据统计[1]+1
      end
      if 功能 == 3 then
        数据统计[3] = 数据统计[3]+1
        刷觉醒次数 = 刷觉醒次数 -1
      end
      if 功能 == 4 then
        数据统计[4] = 数据统计[4]+1
        刷御魂次数 = 刷御魂次数 -1
      end
      if 功能 == 20 then
        数据统计[5] = 数据统计[5]+1
        刷业原火次数 = 刷业原火次数 -1
      end
      if 功能 == 21 then
        数据统计[6] = 数据统计[6]+1
        刷御灵次数 = 刷御灵次数 -1
      end
      if 功能 == 11 then
        式神挑战次数 = 式神挑战次数 -1
      end
    else
      if 功能 == 5 then
        数据统计[2] = 数据统计[2]+1
        妖气封印次数 = 妖气封印次数 -1
      end
      if 进入阴阳寮突破 then
        数据统计[7] = 数据统计[7]+1
        打了几次阴阳寮 = 打了几次阴阳寮 +1
      end
      if 进入个人突破 then
        数据统计[8] = 数据统计[8]+1
      end
    end
    if 功能 == 8 then
      打了几次探索 = 打了几次探索 + 1
      if 打了几次探索 > 几次检测一次满 then
        打了几次探索 = 0
      end
    end
    if 是boss战 then
      sysLog("打完boss")
      打完boss = true
      打完boss计时 = mTime()
    end
    if 现在在打鬼王 then
      现在在打鬼王 = false
      打完鬼王了 = true
      要打鬼王 = false
    end
    if 功能 == 88 then
      if 日常步骤 == 5 then
        if 日常次数记录 >=3 then
          日常次数记录 = 0
          日常步骤 = 6
          日常御魂做完了 = true
        end
      end
      if 日常步骤 == 6 then
        if 日常次数记录 >=3 then
          日常次数记录 = 0
          日常御魂做完了 = true
          if 不做日常突破 == 1 then
            日常步骤 = 9
          else
            日常步骤 = 7
          end
        end
      end
    end
  end
  if 关闭统计 == 0 then
    toast("★  探索："..数据统计[1].."次  妖气："..数据统计[2].."次  ★\n★  觉醒："..数据统计[3].."次  御魂："..数据统计[4].."次  ★\n★  业原："..数据统计[5].."次  御灵："..数据统计[6].."次  ★\n★  寮突："..数据统计[7].."次  个人："..数据统计[8].."次  ★")
  end
  if 功能 == 5 then
    showHD_b("妖气剩余次数："..妖气封印次数)
    if 妖气封印次数 <= 0 then
      if #任务表 > 0 then
        table.remove(任务表,1)
      end
      任务表处理(功能)
    end
  end
  if 功能 == 3 then
    showHD_b("觉醒剩余次数："..刷觉醒次数)
    if 刷觉醒次数 <= 0 then
      if #任务表 > 0 then
        table.remove(任务表,1)
      end
      任务表处理(功能)
    end
  end
  if 功能 == 4 then
    showHD_b("御魂剩余次数："..刷御魂次数)
    if 刷御魂次数 <= 0 then
      if #任务表 > 0 then
        table.remove(任务表,1)
      end
      任务表处理(功能)
    end
  end
  if 功能 == 20 then
    showHD_b("业原火剩余次数："..刷业原火次数)
    if 刷业原火次数 <= 0 then
      if #任务表 > 0 then
        table.remove(任务表,1)
      end
      任务表处理(功能)
    end
  end
  if 功能 == 21 then
    showHD_b("御灵剩余次数："..刷御灵次数)
    if 刷御灵次数 <= 0 then
      if #任务表 > 0 then
        table.remove(任务表,1)
      end
      任务表处理(功能)
    end
  end
  if 功能 == 11 then
    showHD_b("挑战剩余次数："..式神挑战次数)
    if 式神挑战次数 <= 0 then
      if #任务表 > 0 then
        table.remove(任务表,1)
      end
      任务表处理(功能)
    end
  end
  进入阴阳寮突破 = false	
  if 进入个人突破 then
    进入个人突破 = false
  end
  if 当前在什么妖气目标里 > 0 then
    if 当前在什么妖气目标里 == 5 then
      刚才在打妖气 = false
    end
    刚才在打妖气 = false
    定期妖气时间处理()
  end
  我在打妖气 = false
  mSleep(random_time())
end

--战斗结束领奖
function Receive_rewards()
  sysLog("战斗结束领奖")
  if 功能==3 or 功能 ==4 then
    showHD_b("胜利："..今天成功次数.."次,失败："..今天失败次数.."次")
  else
    showHD_b("战斗结束领奖")
  end
  click(random_click(战斗结束领奖.点击[1],战斗结束领奖.点击[2],70))
  进入战斗切换 = true
  打标记次数 = 0
  第几回合 = 1
  --进入阴阳寮突破 = false		
  上次战斗胜利 = true	
  组队邀请次数 = 0
  第二回合切换 = true
  第三回合切换 = true
  从战斗中出来 = true
  mSleep(random_time())
end          
--更换式神界面
function Change_god()
  sysLog("更换式神界面")
  showHD_b("更换式神界面")
  if 是boss战 and 是第二章 then
    click(random_click(战斗准备.点击[1],战斗准备.点击[2],50))
  elseif  (功能==1 or 功能==8) and 自动换狗粮 == 1 and 是否换式神 then
    if 组队探索 == 0 and 正在组队 == false then
      mSleep(2000)
    else
      mSleep(500)
    end
    if multiColor(更换式神界面出御魂,90) then
      click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
      mSleep(1000)
    end
    keepScreen(false)
    local 拖动过 = false
    local 筛选过 = false
    if 上R卡 == 1 then
      筛选过 = true
    end
    if 组队探索 == 1 then
      if 队长左边狗粮 == 1 and 更换时识别满字(6) then	
        showHD_b("队长左边满，开始更换")
        if 	筛选过 == false then
          筛选过 = true
          click(random_click(更换式神界面.全部[1],更换式神界面.全部[2]))
          mSleep(500)
          click(random_click(更换式神界面.选N[1],更换式神界面.选N[2]))
          mSleep(500)
        end
        if 选狗粮方式 == 1 then
          for i=1,选狗粮拖动次数 do
            keepScreen(true)
            local x,y = 判断N卡(1,上白蛋,上红蛋,上N卡,上R卡)
            if x > 0 then
              keepScreen(false)
              showHD_b("找到合适狗粮，位置"..x..":"..y)
              mSleep(1000)
              if multiColor(更换式神界面出御魂,90) then
                sysLog("更换式神界面出御魂")
                click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
                mSleep(1000)
              end
              local xx,yy = 更换时识别满字返回位置(6)
              if xx > 0 then
                tuodong(x,y,xx,yy)
              else
                tuodong(x,y,更换拖动位置[6][1],更换拖动位置[6][2])
              end
              mSleep(1000)
              keepScreen(false)
              break
            end
            keepScreen(false)
            if 极速拖动 == 1 then
              tuodong_canshu(更换式神界面.拖动,200,10,10)
              click(更换式神界面.点击[1],更换式神界面.点击[2])
              mSleep(100)
            else
              换狗粮拖动(更换式神界面.拖动)
              if 组队探索 == 0 and 正在组队 == false then
                mSleep(1000)
              end
            end
          end
        elseif 选狗粮方式 == 2 then
          if 拖动过 == false then
            拖动过 = true
            for i=1,选狗粮拖动次数 do
              tuodong_canshu(更换式神界面.拖动,200,10,10)
            end
            click(更换式神界面.点击[1],更换式神界面.点击[2])
            mSleep(1000)
          end
          for j=1,选狗粮拖动次数 do
            keepScreen(true)
            local x,y = 判断N卡(1,上白蛋,上红蛋,上N卡,上R卡)
            if x > 0 then
              keepScreen(false)
              showHD_b("找到合适狗粮，位置"..x..":"..y)
              mSleep(1000)
              if multiColor1(更换式神界面出御魂,90) then
                sysLog("更换式神界面出御魂")
                click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
                mSleep(1000)
              end
              local xx,yy = 更换时识别满字返回位置(6)
              if xx > 0 then
                tuodong(x,y,xx,yy)
              else
                tuodong(x,y,更换拖动位置[6][1],更换拖动位置[6][2])
              end
              mSleep(1000)
              keepScreen(false)
              break
            end
            keepScreen(false)
            if 极速拖动 == 1 then
              tuodong_canshu(更换式神界面.拖动1,200,10,10)
              click(更换式神界面.点击[1],更换式神界面.点击[2])
              mSleep(100)
            else
              换狗粮拖动(更换式神界面.拖动1)
              if 组队探索 == 0 and 正在组队 == false then
                mSleep(1000)
              end
            end
          end
        end
      end
      
      if 队长右边狗粮 == 1 and 更换时识别满字(7) then	
        showHD_b("队长右边满，开始更换")
        if 筛选过 == false then
          筛选过 = true
          click(random_click(更换式神界面.全部[1],更换式神界面.全部[2]))
          mSleep(500)
          click(random_click(更换式神界面.选N[1],更换式神界面.选N[2]))
          mSleep(500)
        end
        if 选狗粮方式 == 1 then
          for i=1,选狗粮拖动次数 do
            keepScreen(true)
            local x,y = 判断N卡(1,上白蛋,上红蛋,上N卡,上R卡)
            if x > 0 then
              keepScreen(false)
              showHD_b("找到合适狗粮，位置"..x..":"..y)
              sysLog("找到合适狗粮，位置"..x..":"..y)
              mSleep(1000)
              if multiColor(更换式神界面出御魂,90) then
                sysLog("更换式神界面出御魂")
                click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
                mSleep(1000)
              end
              local xx,yy = 更换时识别满字返回位置(7)
              if xx > 0 then
                tuodong(x,y,xx,yy)
              else
                tuodong(x,y,更换拖动位置[7][1],更换拖动位置[7][2])
              end
              mSleep(1000)
              keepScreen(false)
              break
            end
            keepScreen(false)
            if 极速拖动 == 1 then
              tuodong_canshu(更换式神界面.拖动,200,10,10)
              click(更换式神界面.点击[1],更换式神界面.点击[2])
              mSleep(100)
            else
              换狗粮拖动(更换式神界面.拖动)
              if 组队探索 == 0 and 正在组队 == false then
                mSleep(1000)
              end
            end
          end
        elseif 选狗粮方式 == 2 then
          if 拖动过 == false then
            拖动过 = true
            for i=1,选狗粮拖动次数 do
              tuodong_canshu(更换式神界面.拖动,200,10,10)
            end
            click(更换式神界面.点击[1],更换式神界面.点击[2])
            mSleep(1000)
          end
          for j=1,选狗粮拖动次数 do
            keepScreen(true)
            local x,y = 判断N卡(1,上白蛋,上红蛋,上N卡,上R卡)
            if x > 0 then
              keepScreen(false)
              showHD_b("找到合适狗粮，位置"..x..":"..y)
              mSleep(1000)
              if multiColor1(更换式神界面出御魂,90) then
                sysLog("更换式神界面出御魂")
                click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
                mSleep(1000)
              end
              local xx,yy = 更换时识别满字返回位置(7)
              if xx > 0 then
                tuodong(x,y,xx,yy)
              else
                tuodong(x,y,更换拖动位置[7][1],更换拖动位置[7][2])
              end
              mSleep(1000)
              keepScreen(false)
              break
            end
            keepScreen(false)
            if 极速拖动 == 1 then
              tuodong_canshu(更换式神界面.拖动1,200,10,10)
              click(更换式神界面.点击[1],更换式神界面.点击[2])
              mSleep(100)
            else
              换狗粮拖动(更换式神界面.拖动1)
              if 组队探索 == 0 and 正在组队 == false then
                mSleep(1000)
              end
            end
          end
        end
      end
    else
      sysLog("进入更换界面")
      if 左边狗粮 == 1 and 更换时识别满字(1) then	
        showHD_b("左边狗粮满，开始更换")
        if 筛选过 ==  false then
          筛选过 = true
          click(random_click(更换式神界面.全部[1],更换式神界面.全部[2]))
          mSleep(500)
          click(random_click(更换式神界面.选N[1],更换式神界面.选N[2]))
          mSleep(500)
        end
        if 选狗粮方式 == 1 then		
          for i=1,选狗粮拖动次数 do
            local x,y = 判断N卡(1,上白蛋,上红蛋,上N卡,上R卡)
            if x > 0 then
              keepScreen(false)
              showHD_b("找到合适狗粮，位置"..x..":"..y)
              mSleep(1000)
              if multiColor(更换式神界面出御魂,90) then
                sysLog("更换式神界面出御魂")
                click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
                mSleep(1000)
              end
              tuodong(x+10,y,更换拖动位置[1][1],更换拖动位置[1][2])
              mSleep(1000)
              keepScreen(false)
              break
            end
            keepScreen(false)
            if 极速拖动 == 1 then
              tuodong_canshu(更换式神界面.拖动,200,10,10)
              click(更换式神界面.点击[1],更换式神界面.点击[2])
              mSleep(100)
            else
              换狗粮拖动(更换式神界面.拖动)
              if 组队探索 == 0 and 正在组队 == false then
                mSleep(1000)
              end
            end
          end
        elseif 选狗粮方式 == 2 then
          if 拖动过 == false then
            拖动过 = true
            for i=1,选狗粮拖动次数 do
              tuodong_canshu(更换式神界面.拖动,200,10,10)
            end
            click(更换式神界面.点击[1],更换式神界面.点击[2])
            mSleep(1000)
          end
          for j=1,选狗粮拖动次数 do
            keepScreen(true)
            local x,y = 判断N卡(1,上白蛋,上红蛋,上N卡,上R卡)
            if x > 0 then
              keepScreen(false)
              showHD_b("找到合适狗粮，位置"..x..":"..y)
              mSleep(1000)
              if multiColor(更换式神界面出御魂,90) then
                sysLog("更换式神界面出御魂")
                click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
                mSleep(1000)
              end
              tuodong(x+10,y,更换拖动位置[1][1],更换拖动位置[1][2])
              mSleep(1000)
              keepScreen(false)
              break
            end
            keepScreen(false)
            if 极速拖动 == 1 then
              tuodong_canshu(更换式神界面.拖动1,200,10,10)
              click(更换式神界面.点击[1],更换式神界面.点击[2])
              mSleep(100)
            else
              换狗粮拖动(更换式神界面.拖动1)
              if 组队探索 == 0 and 正在组队 == false then
                mSleep(1000)
              end
            end
          end
        end
      end
      
      if 中间狗粮 == 1 and 更换时识别满字(2) then		
        showHD_b("中间狗粮满，开始更换")
        if 筛选过 == false then
          筛选过 = true
          click(random_click(更换式神界面.全部[1],更换式神界面.全部[2]))
          mSleep(500)
          click(random_click(更换式神界面.选N[1],更换式神界面.选N[2]))
          mSleep(500)
        end
        if 选狗粮方式 == 1 then
          for i=1,选狗粮拖动次数 do
            keepScreen(true)
            local x,y = 判断N卡(1,上白蛋,上红蛋,上N卡,上R卡)
            if x > 0 then
              keepScreen(false)
              showHD_b("找到合适狗粮，位置"..x..":"..y)
              mSleep(1000)
              if multiColor(更换式神界面出御魂,90) then
                sysLog("更换式神界面出御魂")
                click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
                mSleep(1000)
              end
              tuodong(x+10,y,更换拖动位置[2][1],更换拖动位置[2][2])
              mSleep(1000)
              keepScreen(false)
              break
            end
            keepScreen(false)
            if 极速拖动 == 1 then
              tuodong_canshu(更换式神界面.拖动,200,10,10)
              click(更换式神界面.点击[1],更换式神界面.点击[2])
              mSleep(100)
            else
              换狗粮拖动(更换式神界面.拖动)
              if 组队探索 == 0 and 正在组队 == false then
                mSleep(1000)
              end
            end
          end
        elseif 选狗粮方式 == 2 then
          if 拖动过 == false then
            拖动过 = true
            for i=1,选狗粮拖动次数 do
              tuodong_canshu(更换式神界面.拖动,200,10,10)
            end
            click(更换式神界面.点击[1],更换式神界面.点击[2])
            mSleep(1000)
          end
          for j=1,选狗粮拖动次数 do
            keepScreen(true)
            local x,y = 判断N卡(1,上白蛋,上红蛋,上N卡,上R卡)
            if x > 0 then
              keepScreen(false)
              mSleep(1000)
              if multiColor1(更换式神界面出御魂,90) then
                sysLog("更换式神界面出御魂")
                click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
                mSleep(1000)
              end
              showHD_b("找到合适狗粮，位置"..x..":"..y)
              tuodong(x+10,y,更换拖动位置[2][1],更换拖动位置[2][2])
              mSleep(1000)
              keepScreen(false)
              break
            end
            keepScreen(false)
            if 极速拖动 == 1 then
              tuodong_canshu(更换式神界面.拖动1,200,10,10)
              click(更换式神界面.点击[1],更换式神界面.点击[2])
              mSleep(100)
            else
              换狗粮拖动(更换式神界面.拖动1)
              if 组队探索 == 0 and 正在组队 == false then
                mSleep(1000)
              end
            end
          end
        end
      end
      
      if 更换时识别满字(3) == false then
        战斗式神换完了 = true
      end
      if 右边狗粮 == 1 and 更换时识别满字(3) then
        showHD_b("右边狗粮满，开始更换")
        三号位满 = false
        if 筛选过 == false then
          筛选过 = true
          click(random_click(更换式神界面.全部[1],更换式神界面.全部[2]))
          mSleep(500)
          click(random_click(更换式神界面.选N[1],更换式神界面.选N[2]))
          mSleep(500)
        end
        if 选狗粮方式 == 1 then
          for i=1,选狗粮拖动次数 do
            keepScreen(true)
            local x,y = 判断N卡(1,上白蛋,上红蛋,上N卡,上R卡)
            if x > 0 then
              keepScreen(false)
              mSleep(1000)
              if multiColor1(更换式神界面出御魂,90) then
                sysLog("更换式神界面出御魂")
                click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
                mSleep(1000)
              end
              showHD_b("找到合适狗粮，位置"..x..":"..y)
              tuodong(x+10,y,更换拖动位置[3][1],更换拖动位置[3][2])
              战斗式神换完了 = true
              换过狗粮了 = true
              mSleep(1000)
              keepScreen(false)
              break
            end
            keepScreen(false)
            if 极速拖动 == 1 then
              tuodong_canshu(更换式神界面.拖动,200,10,10)
              click(更换式神界面.点击[1],更换式神界面.点击[2])
              mSleep(100)
            else
              换狗粮拖动(更换式神界面.拖动)
              if 组队探索 == 0 and 正在组队 == false then
                mSleep(1000)
              end
            end
          end
        elseif 选狗粮方式 == 2 then
          if 拖动过 == false then
            拖动过 = true
            for i=1,选狗粮拖动次数 do
              tuodong_canshu(更换式神界面.拖动,200,10,10)
            end
            click(更换式神界面.点击[1],更换式神界面.点击[2])
            mSleep(1000)
          end
          for j=1,选狗粮拖动次数 do
            keepScreen(true)
            local x,y = 判断N卡(1,上白蛋,上红蛋,上N卡,上R卡)
            if x > 0 then
              keepScreen(false)
              mSleep(1000)
              if multiColor1(更换式神界面出御魂,90) then
                sysLog("更换式神界面出御魂")
                click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
                mSleep(1000)
              end
              showHD_b("找到合适狗粮，位置"..x..":"..y)
              tuodong(x+10,y,更换拖动位置[3][1],更换拖动位置[3][2])
              战斗式神换完了 = true
              换过狗粮了 = true
              mSleep(1000)
              keepScreen(false)
              break
            end
            keepScreen(false)
            if 极速拖动 == 1 then
              tuodong_canshu(更换式神界面.拖动1,200,10,10)
              click(更换式神界面.点击[1],更换式神界面.点击[2])
              mSleep(100)
            else
              换狗粮拖动(更换式神界面.拖动1)
              if 组队探索 == 0 and 正在组队 == false then
                mSleep(1000)
              end
            end
          end
        end
      end
    end
    click(random_click(战斗准备.点击[1],战斗准备.点击[2],50))
    mSleep(2000)
  else
    showHD_b("不用换狗粮，直接准备")
    click(random_click(战斗准备.点击[1],战斗准备.点击[2],50))
    mSleep(500)
    for i=1,30 do
      if multiColor(战斗中,90) then
        换过狗粮了 = false
        mSleep(200)
        break
      end
      mSleep(200)
    end
  end
  mSleep(1000)
  
end

--观战界面
function Look_battle()
  sysLog("观战界面")
  showHD_b("观战界面")
  if 是boss战 and 是第二章 then
    click(random_click(战斗准备.点击[1],战斗准备.点击[2],50))
  elseif  (功能==1 or 功能==8) and 自动换狗粮 == 1 and 是否换式神 then
    if 组队探索 == 0 and 正在组队 == false then
      mSleep(2000)
    else
      mSleep(500)
    end
    sysLog("进入换失神")
    keepScreen(false)
    local 拖动过 = false
    local 筛选过 = false
    if 上N卡 == 1 and 上R卡 == 1 then
      筛选过 = true
    end
    
    if 五号位满 then	
      showHD_b("观战右狗粮满，开始更换")
      if 筛选过 == false then
        筛选过 = true
        click(random_click(更换式神界面.全部[1],更换式神界面.全部[2]))
        mSleep(500)
        click(random_click(更换式神界面.选N[1],更换式神界面.选N[2]))
        mSleep(500)
      end
      筛选过 = true
      if 选狗粮方式 == 1 then
        for i=1,选狗粮拖动次数 do
          keepScreen(true)
          if multiColor2(观战界面,90) ==false and  multiColor2(观战界面1,90) == false then
            break
          end
          local x,y = 判断N卡(1,上白蛋,上红蛋,上N卡,上R卡)
          if x > 0 then
            mSleep(500)
            if multiColor1(更换式神界面出御魂,90) then
              sysLog("更换式神界面出御魂")
              click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
              mSleep(500)
            end
            showHD_b("找到合适狗粮，位置"..x..":"..y)
            tuodong(x+10,y,更换拖动位置[5][1],更换拖动位置[5][2])
            五号位满 = false
            keepScreen(false)
            mSleep(1000)
            break
          end
          keepScreen(false)
          if 极速拖动 == 1 then
            tuodong_canshu(更换式神界面.拖动,200,10,10)
            click(更换式神界面.点击[1],更换式神界面.点击[2])
            mSleep(100)
          else
            换狗粮拖动(更换式神界面.拖动)
            if 组队探索 == 0 and 正在组队 == false then
              mSleep(1000)
            end
          end
        end
      elseif 选狗粮方式 == 2 then
        if 拖动过 == false then
          拖动过 = true
          for i=1,选狗粮拖动次数 do
            tuodong_canshu(更换式神界面.拖动,200,10,10)
          end
          click(更换式神界面.点击[1],更换式神界面.点击[2])
          mSleep(1000)
        end
        for j=1,选狗粮拖动次数 do
          keepScreen(true)
          if multiColor2(观战界面,90) ==false and  multiColor2(观战界面1,90) == false then
            break
          end
          local x,y = 判断N卡(1,上白蛋,上红蛋,上N卡,上R卡)
          if x > 0 then
            mSleep(500)
            if multiColor1(更换式神界面出御魂,90) then
              sysLog("更换式神界面出御魂")
              click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
              mSleep(500)
            end
            showHD_b("找到合适狗粮，位置"..x..":"..y)
            tuodong(x+10,y,更换拖动位置[5][1],更换拖动位置[5][2])
            五号位满 = false
            mSleep(1000)
            break
          end
          keepScreen(false)
          if 极速拖动 == 1 then
            tuodong_canshu(更换式神界面.拖动1,200,10,10)
            click(更换式神界面.点击[1],更换式神界面.点击[2])
            mSleep(100)
          else
            换狗粮拖动(更换式神界面.拖动1)
            if 组队探索 == 0 and 正在组队 == false then
              mSleep(1000)
            end
          end
        end
      end
    end
    
    if	true then	
      sysLog("换4号")
      showHD_b("观战左狗粮，不判定直接换")
      if 筛选过 == false then
        筛选过 = true
        click(random_click(更换式神界面.全部[1],更换式神界面.全部[2]))
        mSleep(500)
        click(random_click(更换式神界面.选N[1],更换式神界面.选N[2]))
        mSleep(500)
      end
      if 选狗粮方式 == 1 then
        for i=1,选狗粮拖动次数 do
          keepScreen(true)
          if multiColor2(观战界面,90) ==false and  multiColor2(观战界面1,90) == false then
            break
          end
          local x,y = 判断N卡(1,上白蛋,上红蛋,上N卡,上R卡)
          if x > 0 then
            mSleep(500)
            if multiColor1(更换式神界面出御魂,90) then
              sysLog("更换式神界面出御魂")
              click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
              mSleep(500)
            end
            showHD_b("找到合适狗粮，位置"..x..":"..y)
            tuodong(x+10,y,更换拖动位置[4][1],更换拖动位置[4][2])
            战斗式神换完了 = false
            mSleep(1000)
            break
          end
          keepScreen(false)
          if 极速拖动 == 1 then
            tuodong_canshu(更换式神界面.拖动,200,10,10)
            click(更换式神界面.点击[1],更换式神界面.点击[2])
            mSleep(100)
          else
            换狗粮拖动(更换式神界面.拖动)
            if 组队探索 == 0 and 正在组队 == false then
              mSleep(1000)
            end
          end
        end
      elseif 选狗粮方式 == 2 then
        if 拖动过 == false then
          拖动过 = true
          for i=1,选狗粮拖动次数 do
            tuodong_canshu(更换式神界面.拖动,200,10,10)
          end
          click(更换式神界面.点击[1],更换式神界面.点击[2])
        end
        mSleep(1000)
        for j=1,选狗粮拖动次数 do
          keepScreen(true)
          if multiColor2(观战界面,90) ==false and  multiColor2(观战界面1,90) == false then
            break
          end
          local x,y = 判断N卡(1,上白蛋,上红蛋,上N卡,上R卡)
          if x > 0 then
            mSleep(500)
            if multiColor1(更换式神界面出御魂,90) then
              sysLog("更换式神界面出御魂")
              click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
              mSleep(500)
            end
            showHD_b("找到合适狗粮，位置"..x..":"..y)
            tuodong(x+10,y,更换拖动位置[4][1],更换拖动位置[4][2])
            战斗式神换完了 = false
            mSleep(1000)
            break
          end
          keepScreen(false)
          if 极速拖动 == 1 then
            tuodong_canshu(更换式神界面.拖动1,200,10,10)
            click(更换式神界面.点击[1],更换式神界面.点击[2])
            mSleep(100)
          else
            换狗粮拖动(更换式神界面.拖动1)
            if 组队探索 == 0 and 正在组队 == false then
              mSleep(1000)
            end
          end
        end
      end
    end
    click(random_click(更换式神界面.返回[1],更换式神界面.返回[2]))
    mSleep(2000)
  else
    click(random_click(战斗准备.点击[1],战斗准备.点击[2],50))
  end
  mSleep(2000)
end          

--要打妖怪退治 图找宝箱
function AttackGhost_Find()
  sysLog("要打妖怪退治 图找宝箱")
  showHD_b("妖怪退治结束")
  要打妖怪退治 = false
  打完妖怪退治了 = true
  mSleep(random_time())
  地图找宝箱()
  for i=1,15 do
    click(random_click(领奖结束.点击[1],领奖结束.点击[2],70))
    mSleep(1000)
  end
  for i=1,60 do
    if isColorArray(妖怪退治红蛋.返回,90) then
      click(random_click(妖怪退治红蛋.返回[1],妖怪退治红蛋.返回[2]))
      mSleep(1000)
      break
    end
    mSleep(1000)
  end
end

--战斗准备
function Battle_prepare()
  sysLog("战斗准备")
  showHD_b("战斗准备")
  战斗结束用来判定次数 = true
  if ipad没有缩放 and (w == 1536 or w == 2048) then
    setScreenScale(768,1024)
    重写推图参数()
  end
  
  if 打了几次探索 >= 几次检测一次满 then
    mSleep(1000)
    if 是boss战 and 是第二章 then
      click(random_click(战斗准备.点击[1],战斗准备.点击[2],50))
    elseif (功能==1 or 功能==8) and 自动换狗粮 == 1 and 是否换式神 then
      mSleep(1000)
      keepScreen(false)
      keepScreen(true)
      --sysLog("组队探索"..组队探索)
      --sysLog("右边狗粮"..右边狗粮)
      if 组队探索 == 0 and 左边狗粮 == 1 and 准备时识别满字(1) then			
        showHD_b("参战左边狗粮满")
        click(random_click(战斗准备.更换式神[1],战斗准备.更换式神[2],30))
        mSleep(500)
        click(random_click(战斗准备.更换式神[1],战斗准备.更换式神[2],30))
        有满狗粮 = true
        mSleep(1000)
        等待进入更换式神界面()
      elseif 组队探索 == 0 and 中间狗粮 == 1 and 准备时识别满字(2) then	
        showHD_b("参战中间狗粮满")
        click(random_click(战斗准备.更换式神[1],战斗准备.更换式神[2],30))
        mSleep(500)
        click(random_click(战斗准备.更换式神[1],战斗准备.更换式神[2],30))
        有满狗粮 = true
        mSleep(1000)
        等待进入更换式神界面()
      elseif 换过狗粮了 == false and 组队探索 == 0 and 右边狗粮 == 1 and 准备时识别满字(3) then
        showHD_b("参战左/观战右狗粮满")
        三号位满 = true
        if 准备时识别满字(5) then
          五号位满 = true
        end
        if  true then
          click(random_click(战斗准备.更换式神[1],战斗准备.更换式神[2],30))
          mSleep(500)
          click(random_click(战斗准备.更换式神[1],战斗准备.更换式神[2],30))
        else
          click(random_click(战斗准备.更换观战[1],战斗准备.更换观战[2]))
          mSleep(500)
          click(random_click(战斗准备.更换观战[1],战斗准备.更换观战[2]))
        end
        有满狗粮 = true
        mSleep(1000)
        等待进入更换式神界面()
      elseif  false and 准备时识别满字(4) then
        showHD_b("参战左/观战右狗粮满")
        if 准备时识别满字(5) then
          五号位满 = true
        end
        if 组队探索 == 0 then
          三号位满 = true
          if  true then
            click(random_click(战斗准备.更换式神[1],战斗准备.更换式神[2],30,30))
            mSleep(500)
            click(random_click(战斗准备.更换式神[1],战斗准备.更换式神[2],30))
          else
            click(random_click(战斗准备.更换观战[1],战斗准备.更换观战[2]))
            mSleep(500)
            click(random_click(战斗准备.更换观战[1],战斗准备.更换观战[2]))
          end
        else
          click(random_click(战斗准备.更换观战[1],战斗准备.更换观战[2]))
          mSleep(500)
          click(random_click(战斗准备.更换观战[1],战斗准备.更换观战[2]))
        end
        有满狗粮 = true
        mSleep(1000)
      elseif false and 准备时识别满字(5) then
        showHD_b("观战左边狗粮满")
        五号位满 = true
        click(random_click(战斗准备.更换观战[1],战斗准备.更换观战[2]))
        mSleep(500)
        click(random_click(战斗准备.更换观战[1],战斗准备.更换观战[2]))
        有满狗粮 = true
        mSleep(1000)
      elseif 组队探索 == 1 and 队长右边狗粮 == 1 and 准备时识别满字(6) then
        showHD_b("队长参战右狗粮满")
        click(random_click(战斗准备.更换式神[1],战斗准备.更换式神[2],30))
        mSleep(500)
        click(random_click(战斗准备.更换式神[1],战斗准备.更换式神[2],30))
        有满狗粮 = true
        mSleep(1000)
        等待进入更换式神界面()
      elseif 组队探索 == 1 and 队长左边狗粮 == 1 and 准备时识别满字(7) then
        showHD_b("队长参战左狗粮满")
        click(random_click(战斗准备.更换式神[1],战斗准备.更换式神[2],30))
        mSleep(500)
        click(random_click(战斗准备.更换式神[1],战斗准备.更换式神[2],30))
        有满狗粮 = true
        mSleep(1000)
        等待进入更换式神界面()
      else
        showHD_b("没有狗粮满，开始准备")
        sysLog("没有满，开始准备")
        click(random_click(战斗准备.点击[1],战斗准备.点击[2],50))
        mSleep(500)
        for i=1,30 do
          if multiColor(战斗中,90) then
            换过狗粮了 = false
            mSleep(200)
            break
          end
          mSleep(200)
        end
      end
    else
      sysLog("不换狗粮，开始准备1")
      showHD_b("不换狗粮，直接准备")
      click(random_click(战斗准备.点击[1],战斗准备.点击[2],50))
      mSleep(500)
      for i=1,30 do
        if multiColor(战斗中,90) then
          break
        end
        mSleep(200)
      end
    end
  else
    sysLog("不换狗粮，开始准备2")
    showHD_b("不换狗粮，直接准备")
    click(random_click(战斗准备.点击[1],战斗准备.点击[2],50))
    mSleep(500)
    for i=1,30 do
      if multiColor(战斗中,90) then
        break
      end
      mSleep(200)
    end
  end
  if 功能 ==5 then
    缩放处理相关()
  end
end

--组队界面
function Team()
  --sysLog("组队界面")
  showHD_b("组队界面")
  是否换式神 = false
  if 刚进入组队界面 then	
    sysLog("刚进入组队界面")
    mSleep(1000)
    刚进入组队界面 = false	
    组队界面持续时间 = mTime()				
    if 功能 == 5 then
      if  找石距==1 then
        sysLog("组队界面.拖动")
        tuodong3(组队界面.拖动)
        当前在什么妖气目标里 = 1
        click(random_click(组队界面.石距[1],组队界面.石距[2]))
      elseif  找年兽==1 then
        sysLog("组队界面.拖动")
        tuodong3(组队界面.拖动)
        当前在什么妖气目标里 = 2
        click(random_click(组队界面.年兽[1],组队界面.年兽[2]))
      elseif 找经验妖怪==1 then
        sysLog("组队界面.拖动")
        tuodong3(组队界面.拖动)
        当前在什么妖气目标里 = 3
        click(random_click(组队界面.经验妖怪[1],组队界面.经验妖怪[2]))
      elseif 找金币妖怪==1 then
        sysLog("组队界面.拖动")
        tuodong3(组队界面.拖动)
        当前在什么妖气目标里 = 4
        click(random_click(组队界面.金币妖怪[1],组队界面.金币妖怪[2]))
        elseif 找组队突破==1 then
        sysLog("组队界面.拖动")
        tuodong3(组队界面.拖动)
        click(random_click(组队界面.结界突破[1],组队界面.结界突破[2]))
      else--if 妖气封印设置 == 2 then
        当前在什么妖气目标里 = 5
        click(random_click(组队界面.妖力封印[1],组队界面.妖力封印[2]))
      end
      sysLog("刚进入组队界面-当前在什么妖气目标里"..当前在什么妖气目标里)
    elseif (功能 ==1 or 功能== 3 or 功能== 4 or 功能== 6 or 功能== 7 or 功能== 20 or 功能== 21 or 功能== 30 or 功能== 102 or 功能== 8 or 功能 == 11) and 从觉醒挑战界面进入 == false then
      if 定期妖气相关() then
        定期妖气拖动()
        mSleep(1000)
        for i=1,10 do
          if isColorArray2(组队界面.组队转圈判定点,95) == false then
            break
          end	
        end
      else
        click(random_click(组队界面.关闭[1],组队界面.关闭[2]))
      end
    elseif 从觉醒挑战界面进入 then						
    else
      click(random_click(组队界面.关闭[1],组队界面.关闭[2]))
    end
    mSleep(random_time())
  else					
    if (功能 ==1 or 功能== 3 or 功能== 4 or 功能== 6 or 功能== 7 or 功能== 20 or 功能== 21 or 功能== 30 or 功能== 102 or 功能== 8 or 功能 == 11) and 定期妖气相关() then
      if isColorArray(组队界面.刷新,95) == false then
        if 定期妖气相关() then
          刚进入组队界面 = true
          if 当前在什么妖气目标里 == 1 then
            石距开始时间 = mTime() + 3600*1000		
            --sysLog("设置石距时间"..石距开始时间)
          elseif 当前在什么妖气目标里 == 2 then
            年兽开始时间 = mTime() + 3600*1000			
            --sysLog("设置年兽时间"..年兽开始时间)
          elseif 当前在什么妖气目标里 == 3 then
            经验开始时间 = mTime() + 3600*1000	
          elseif 当前在什么妖气目标里 == 4 then
            金币开始时间 = mTime() + 3600*1000		
          end
        else
          click(random_click(组队界面.关闭[1],组队界面.关闭[2]))
        end
      else
        if 匹配还是挤车 == 1 then
          if isColorArray(组队界面.刷新,95) and isColorArray(组队界面.在排队判定,90) then
            click(random_click(组队界面.排队按钮[1],组队界面.排队按钮[2]))
          end
          我在打妖气 = true
        else
          if 目前是缩放状态 then
            sysLog("目前是缩放状态")
            目前是缩放状态 = false
            resetScreenScale()
            重写界面参数(w*h)
          end
          我在打妖气 = true
          if isColorArray(组队界面.组队转圈判定点,95) == false and isColorArray(组队界面.刷新,95) then
            mSleep(50)
            local 要等待 = false							
            if 当前在什么妖气目标里 == 3 and 识别函数(7) then
              mSleep(100)
              要等待 = true
            elseif 当前在什么妖气目标里 == 4 and 识别函数(8) then
              mSleep(100)
              要等待 = true
            elseif 当前在什么妖气目标里 == 1 and 识别函数(10) then
              mSleep(100)
              要等待 = true
            elseif 当前在什么妖气目标里 == 2 and isColorArray(组队界面.加入,90) then
              mSleep(100)
              要等待 = true
              click(random_click(进入队伍[1][1],进入队伍[1][2]))
            else
              click(random_click(组队界面.刷新[1],组队界面.刷新[2],20))
              mSleep(100)
            end
            
            if 要等待 then
              showHD_b("识别了妖气，点击后等待")
              mSleep(2000)
              if multiColor(组队界面,90) then
                showHD_b("上车失败，点击刷新")
                click(random_click(组队界面.刷新[1],组队界面.刷新[2]))
                mSleep(100)
              else
                缩放处理相关()
              end
            end
          end
        end
      end
    elseif 功能 == 5 then
      --showHUD(id,"正在妖气封印",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
      if isColorArray(组队界面.刷新,95) == false then
        sysLog("当前在什么妖气目标里"..当前在什么妖气目标里)
        if 当前在什么妖气目标里 == 1 then
          if  找年兽==1 then
            sysLog("组队界面.拖动")
            --tuodong3(组队界面.拖动)
            当前在什么妖气目标里 = 2
            click(random_click(组队界面.年兽[1],组队界面.年兽[2]))
          elseif 找经验妖怪==1 then
            sysLog("组队界面.拖动")
            --tuodong3(组队界面.拖动)
            当前在什么妖气目标里 = 3
            click(random_click(组队界面.经验妖怪[1],组队界面.经验妖怪[2]))
          elseif 找金币妖怪==1 then
            sysLog("组队界面.拖动")
            --tuodong3(组队界面.拖动)
            当前在什么妖气目标里 = 4
            click(random_click(组队界面.金币妖怪[1],组队界面.金币妖怪[2]))
          end
        elseif  当前在什么妖气目标里 == 2 then
          if 找经验妖怪==1 then
            sysLog("组队界面.拖动")
            --	tuodong3(组队界面.拖动)
            当前在什么妖气目标里 = 3
            click(random_click(组队界面.经验妖怪[1],组队界面.经验妖怪[2]))
          elseif 找金币妖怪==1 then
            sysLog("组队界面.拖动")
            --tuodong3(组队界面.拖动)
            当前在什么妖气目标里 = 4
            click(random_click(组队界面.金币妖怪[1],组队界面.金币妖怪[2]))
          elseif 找石距==1 then
            sysLog("组队界面.拖动")
            --tuodong3(组队界面.拖动)
            当前在什么妖气目标里 = 1
            click(random_click(组队界面.石距[1],组队界面.石距[2]))
          end
        elseif 当前在什么妖气目标里 == 3 then
          if 找金币妖怪==1 then
            sysLog("组队界面.拖动")
            --tuodong3(组队界面.拖动)
            当前在什么妖气目标里 = 4
            click(random_click(组队界面.金币妖怪[1],组队界面.金币妖怪[2]))
          elseif 找石距==1 then
            sysLog("组队界面.拖动")
            --tuodong3(组队界面.拖动)
            当前在什么妖气目标里 = 1
            click(random_click(组队界面.石距[1],组队界面.石距[2]))
          elseif  找年兽==1 then
            sysLog("组队界面.拖动")
            --tuodong3(组队界面.拖动)
            当前在什么妖气目标里 = 2
            click(random_click(组队界面.年兽[1],组队界面.年兽[2]))
          end
        elseif 当前在什么妖气目标里==4 then
          if 找石距==1 then
            sysLog("组队界面.拖动")
            --tuodong3(组队界面.拖动)
            当前在什么妖气目标里 = 1
            click(random_click(组队界面.石距[1],组队界面.石距[2]))
          elseif  找年兽==1 then
            sysLog("组队界面.拖动")
            --tuodong3(组队界面.拖动)
            当前在什么妖气目标里 = 2
            click(random_click(组队界面.年兽[1],组队界面.年兽[2]))
          elseif 找经验妖怪==1 then
            sysLog("组队界面.拖动")
            --tuodong3(组队界面.拖动)
            当前在什么妖气目标里 = 3
            click(random_click(组队界面.经验妖怪[1],组队界面.经验妖怪[2]))
          end
        elseif 当前在什么妖气目标里 == 5 then
          if 找石距==1 then
            sysLog("组队界面.拖动")
            --tuodong3(组队界面.拖动)
            当前在什么妖气目标里 = 1
            click(random_click(组队界面.石距[1],组队界面.石距[2]))
          elseif  找年兽==1 then
            sysLog("组队界面.拖动")
            --tuodong3(组队界面.拖动)
            当前在什么妖气目标里 = 2
            click(random_click(组队界面.年兽[1],组队界面.年兽[2]))
          elseif 找经验妖怪==1 then
            sysLog("组队界面.拖动")
            --tuodong3(组队界面.拖动)
            当前在什么妖气目标里 = 3
            click(random_click(组队界面.经验妖怪[1],组队界面.经验妖怪[2]))
          elseif 找金币妖怪==1 then
            sysLog("组队界面.拖动")
            --tuodong3(组队界面.拖动)
            当前在什么妖气目标里 = 4
            click(random_click(组队界面.金币妖怪[1],组队界面.金币妖怪[2]))
          end
        end
        mSleep(500)
      else
        我在打妖气 = true
        if 匹配还是挤车 == 1 and (找经验妖怪 == 1 or 找金币妖怪 == 1 or 找石距 == 1 or 找年兽 == 1) then
          if isColorArray(组队界面.在排队判定,90) then
            click(random_click(组队界面.排队按钮[1],组队界面.排队按钮[2]))
            mSleep(1000)
          end
        else
          if 目前是缩放状态 then
            sysLog("目前是缩放状态")
            目前是缩放状态 = false
            resetScreenScale()
            重写界面参数(w*h)
          end
          if 功能 == 5 and 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
            缩放处理相关()
            click(random_click(组队界面.关闭[1],组队界面.关闭[2]))
          elseif isColorArray(组队界面.组队转圈判定点,95) == false and isColorArray(组队界面.刷新,95) then
            mSleep(50)
            local 要等待 = false
            if 找姑获鸟 == 1 and 识别函数(6) then	
              if 妖气延迟 >0 then
                mSleep(妖气延迟*100)
                要等待 = true
              end
            elseif 找椒图 == 1 and 识别函数(1) then	
              if 妖气延迟 >0 then
                mSleep(妖气延迟*100)
                要等待 = true
              end
            elseif 找鬼使黑 == 1 and 识别函数(2) then
              if 妖气延迟 >0 then
                mSleep(妖气延迟*100)
                要等待 = true
              end
            elseif 找二口女 == 1 and 识别函数(4) then
              if 妖气延迟 >0 then
                mSleep(妖气延迟*100)
                要等待 = true
              end
            elseif 找海坊主 == 1 and 识别函数(5) then
              if 妖气延迟 >0 then
                mSleep(妖气延迟*100)
                要等待 = true
              end
            elseif 找骨女 == 1 and 识别函数(3) then
              if 妖气延迟 >0 then
                mSleep(妖气延迟*100)
                要等待 = true
              end
            elseif 找经验妖怪 == 1 and 识别函数(7) then
              if 妖气延迟 >0 then
                mSleep(妖气延迟*100)
                要等待 = true
              end
            elseif 找金币妖怪 == 1 and 识别函数(8) then
              if 妖气延迟 >0 then
                mSleep(妖气延迟*100)
                要等待 = true
              end
            elseif 找跳跳哥哥 == 1 and 识别函数(9) then
              if 妖气延迟 >0 then
                mSleep(妖气延迟*100)		
                要等待 = true					
              end
            elseif 找石距 == 1 and 识别函数(10) then
              if 妖气延迟 >0 then
                mSleep(妖气延迟*100)
                要等待 = true
              end
            elseif 找饿鬼 == 1 and 识别函数(11) then
              if 妖气延迟 >0 then
                mSleep(妖气延迟*100)
                要等待 = true
              end
            elseif 找小松丸 == 1 and 识别函数(12) then
              if 妖气延迟 >0 then
                mSleep(妖气延迟*100)
                要等待 = true
              end
            elseif 找年兽 == 1 and isColorArray(组队界面.加入,90) then
              if 妖气延迟 >0 then
                mSleep(妖气延迟*100)
                要等待 = true
              end
              click(random_click(进入队伍[1][1],进入队伍[1][2]))
            elseif 找组队突破 == 1 and isColorArray(组队界面.加入,90) then
              click(random_click(进入队伍[1][1],进入队伍[1][2]))
              if 妖气延迟 >0 then
                mSleep(妖气延迟*100)
                要等待 = true
              end
            else
              click(random_click(组队界面.刷新[1],组队界面.刷新[2]))
              if 妖气延迟 >0 then
                mSleep(妖气延迟*100)
              end
            end
            
            if 要等待 then
              showHD_b("识别了妖气，点击后等待")
              mSleep(2000)
              if multiColor(组队界面,90) then
                showHD_b("上车失败，点击刷新")
                click(random_click(组队界面.刷新[1],组队界面.刷新[2]))
              else
                缩放处理相关()
              end
            end
          else
            start_time = mTime()
          end
        end
      end
    else
      if 功能 == 3 and 觉醒组队单刷 == 3 then
        showHD_b("单刷御魂觉醒，加入队伍")
        if isColorArray(组队界面.加入,90) then
          click(random_click(组队界面.加入[1],组队界面.加入[2]))
          开始时间 = mTime()
          mSleep(1000)
        end
        if mTime() - 开始时间 > 2*1000 then
          sysLog("开始时间 > 2*1000")
          showHD_b("等待2秒，点击刷新")
          click(random_click(组队界面.刷新[1],组队界面.刷新[2]))
          开始时间 = mTime()
        end
      elseif 功能 == 4 and 御魂组队单刷 == 3 then
        showHD_b("单刷御魂觉醒，加入队伍")
        if isColorArray(组队界面.加入,90) then
          click(random_click(组队界面.加入[1],组队界面.加入[2]))
          开始时间 = mTime()
          mSleep(1000)
        end
        if mTime() - 开始时间 > 2*1000 then
          sysLog("开始时间 > 2*1000")
          showHD_b("等待2秒，点击刷新")
          click(random_click(组队界面.刷新[1],组队界面.刷新[2]))
          开始时间 = mTime()
        end
      elseif 功能 == 3 and (觉醒组队单刷 == 2 or 觉醒组队单刷 == 4) then
        showHD_b("创建御魂觉醒队伍")
        click(random_click(组队界面.创建[1],组队界面.创建[2]))
        mSleep(1000)
      elseif 功能 == 4 and (御魂组队单刷 == 2 or 御魂组队单刷 == 4) then
        showHD_b("创建御魂觉醒队伍")
        click(random_click(组队界面.创建[1],组队界面.创建[2]))
        mSleep(1000)
      else
        click(random_click(组队界面.关闭[1],组队界面.关闭[2]))
      end
      mSleep(1000)
    end
    if 组队界面持续时间 > 0 and mTime() - 组队界面持续时间 > 60*1000 then
      组队界面持续时间 = 0
      缩放处理相关()
      showHD_b("60秒内未能开始，退出开组")
      click(random_click(组队界面.关闭[1],组队界面.关闭[2]))
    end
  end
  
end 

--组队邀请
function Team_invitation()
  sysLog("组队邀请")
  mSleep(300)
  if 组队邀请次数 > 3 then
    if 功能 == 8 and (multiColor2(主界面,92) or multiColor2(主界面1,92) or multiColor2(主界面没打开卷轴,90) or multiColor2(主界面打开卷轴,90)) then
      tuodong4(登陆后活动界面.拖动)
      tuodong4(登陆后活动界面.拖动)
      mSleep(1000)
      click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
      mSleep(random_time())
    elseif multiColor2(副本大地图,90) then
      click(random_click(副本选图[1][1],副本选图[1][2]))
      mSleep(3000)
      click(副本探索界面.探索[1],副本探索界面.探索[2],20)
      mSleep(1000)
    elseif multiColor2(副本探索界面,90) then
      click(副本探索界面.探索[1],副本探索界面.探索[2],20)
      mSleep(1000)
    end
  else
    if (功能== 1 or 功能== 3 or 功能== 4 or 功能== 20 or 功能== 21 or 功能 == 30 or 功能 == 11) and 正在拒绝当中 then
      click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
    elseif (功能== 1 or 功能== 3 or 功能== 4 or 功能== 20 or 功能== 21 or 功能 == 30 or 功能 == 11) and 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
      click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
    elseif (功能== 1 or 功能== 3 or 功能== 4 or 功能== 6 or 功能== 20 or 功能== 21 or 功能 == 30 or 功能 == 8 or 功能 == 11) and 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
      click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
    elseif (功能== 1 or 功能== 3 or 功能== 4 or 功能== 6 or 功能== 20 or 功能== 21 or 功能 == 30 or 功能 == 8 or 功能 == 11) and 定期妖气相关() then
      click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
    elseif (要打妖怪退治 or 要打鬼王) and 功能~= 8  then
      click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
    elseif 功能== 3 or 功能== 4 then
      if 御魂一直继续 == 1 then
        click(random_click(组队邀请.确定[1],组队邀请.确定[2]))
        开始时间 = mTime()
      elseif 上次战斗胜利 then
        上次战斗胜利 = true
        click(random_click(组队邀请.确定[1],组队邀请.确定[2]))
        开始时间 = mTime()
      else
        click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
      end
      if 上次战斗胜利 == false then
        选过几层了 = false
      end
      mSleep(3000)
    elseif 功能 == 8 then
      if 是否突破卷满 == 1 then
        click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
        elseif 本轮阴阳寮开始 == true then
        click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
        elseif 挂机拒绝邀请 == true then
        click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
        else
        click(random_click(组队邀请.确定[1],组队邀请.确定[2]))
        if mTime() - 上次组队邀请时间 < 20*1000 then
          组队邀请次数 = 组队邀请次数 + 1
        end
      end
    elseif 功能== 5 then
      click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
    elseif 功能== 6 then
      if 突破接受邀请 == 0 then
        click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
      else
        click(random_click(组队邀请.确定[1],组队邀请.确定[2]))
      end
    elseif 功能== 7 then
      if 突破接受邀请 == 0 then
        click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
      else
        click(random_click(组队邀请.确定[1],组队邀请.确定[2]))
      end
    elseif 功能== 1 then
      if 推图时拒绝邀请 == 1 then
        click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
      else
        click(random_click(组队邀请.确定[1],组队邀请.确定[2]))
      end
    else
      click(random_click(组队邀请.确定[1],组队邀请.确定[2]))
      mSleep(5000)
    end
  end
  上次组队邀请时间 = mTime()
  mSleep(random_time())
  
end          


--组队界面有左边
function Creat_team_left()
  sysLog("组队界面有左边"..妖气封印设置)
  showHD_b("组队界面，点一下")
  是否换式神 = false
  if 功能 ==1 or 功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 30  or 功能 == 6 or 功能 == 7 or 功能 == 11 then
    click(random_click(组队界面.点一下[1],组队界面.点一下[2],20))
  else
    if 功能 == 5 then
      sysLog("组队界面.拖动")
      if 找石距==1 then
        sysLog("组队界面.拖动")
        tuodong3(组队界面.拖动)
        当前在什么妖气目标里 = 1
        click(random_click(组队界面.石距[1],组队界面.石距[2]))
      elseif 找年兽==1 then
        sysLog("组队界面.拖动")
        tuodong3(组队界面.拖动)
        当前在什么妖气目标里 = 2
        click(random_click(组队界面.年兽[1],组队界面.年兽[2]))
      elseif 找经验妖怪==1 then
        sysLog("组队界面.拖动")
        tuodong3(组队界面.拖动)
        当前在什么妖气目标里 = 3
        click(random_click(组队界面.经验妖怪[1],组队界面.经验妖怪[2]))
      elseif 找金币妖怪==1 then
        sysLog("组队界面.拖动")
        tuodong3(组队界面.拖动)
        当前在什么妖气目标里 = 4
        click(random_click(组队界面.金币妖怪[1],组队界面.金币妖怪[2]))
      elseif 找组队突破==1 then
        sysLog("组队界面.拖动")
        tuodong3(组队界面.拖动)
        click(random_click(组队界面.结界突破[1],组队界面.结界突破[2]))
      else
        当前在什么妖气目标里= 5
        click(random_click(组队界面.妖力封印[1],组队界面.妖力封印[2]))
      end
      mSleep(random_time())
    end
  end
  mSleep(random_time())
end

--体力不足界面
function Lack_of_strength()
  
  sysLog("体力不足界面")
  showHD_b("体力不足界面")
  if 体力不足 == 1 then
    if 买体力次数 <= 0 then
      lockDevice()
      setStringConfig("lua_exit","欢迎回来，上次因为领取体力次数不足而停止脚本。")
      lua_exit()
    end
    click(random_click(体力不足界面.关闭[1],体力不足界面.关闭[2]))
    没有体力了 = true
    缩放处理相关()
  elseif	体力不足 == 2 then
    震动锁屏()
    setStringConfig("lua_exit","欢迎回来，上次因为您选择体力不足锁屏而停止脚本。")
    lua_exit()
  elseif	体力不足 == 3 then
    vibrator()
    setStringConfig("lua_exit","欢迎回来，上次因为您选择体力不足震动而停止脚本。")
    mSleep(30000)
    lockDevice()
    lua_exit()
  elseif	体力不足 == 7 then
    功能 = 8
    click(random_click(体力不足界面.关闭[1],体力不足界面.关闭[2]))
    mSleep(1000)
  elseif	体力不足 == 4 then
    上次战斗时间 = mTime()
    click(random_click(体力不足界面.关闭[1],体力不足界面.关闭[2]))
    mSleep(10000)
  elseif	体力不足 == 5 then
    if 买体力次数 <= 0 then
      lockDevice()
      setStringConfig("lua_exit","欢迎回来，上次因为购买体力次数不足而停止脚本。")
      lua_exit()
    end
    click(random_click(体力不足界面.购买[1],体力不足界面.购买[2]))
    买体力次数 = 买体力次数 -1
  elseif	体力不足 == 6 then
    上次战斗时间 = mTime()
    没有体力了 = true
    click(random_click(体力不足界面.关闭[1],体力不足界面.关闭[2]))
    mSleep(1000)
  elseif	体力不足 == 8 then
    功能 = 8
    挂机拒绝邀请 = true
    click(random_click(体力不足界面.关闭[1],体力不足界面.关闭[2]))
    mSleep(1000)
  end
  
  mSleep(1000)
end       

--战斗中
function In_Battle()
  if 功能==3 or 功能 ==4 then
    showHD_b("胜利："..今天成功次数.."次,失败："..今天失败次数.."次")
  else
    showHD_b("战斗中")
  end
  组队邀请判断过 = false
  有满狗粮 = false
  if ipad没有缩放 and (w == 1536 or w == 2048) then
    setScreenScale(768,1024)
    重写推图参数()
  end
  缩放处理相关()
  if 功能 == 99 then
    mSleep(500)
    if multiColor2(兔子舞,88) then
      sysLog("兔子舞")
      click(兔子舞.选择[1],兔子舞.选择[2])
      mSleep(500)
      click(兔子舞.释放[1],兔子舞.释放[2])
      mSleep(500)
    elseif multiColor2(打火机,88) and multiColor2(座敷平砍,88) then
      sysLog("打火机")
      if 无限魂10兔子 == 1 then
        click(random_click(打火机.选择[1],打火机.选择[2]))
        mSleep(500)
        click(random_click(兔子舞.释放[1],兔子舞.释放[2]))
        mSleep(500)
      else
        if isColorArray(座敷平砍.鬼火判断,88) then
          click(random_click(打火机.选择[1],打火机.选择[2]))
          mSleep(500)
          click(random_click(兔子舞.释放[1],兔子舞.释放[2]))
          mSleep(500)
        else	
          click(random_click(座敷平砍.选择[1],座敷平砍.选择[2]))
          mSleep(500)
          打哪个怪()
        end
      end
    elseif multiColor2(清明盾,88) then
      sysLog("清明盾")
      click(random_click(清明盾.选择[1],清明盾.选择[2]))
      mSleep(500)
      click(random_click(兔子舞.释放[1],兔子舞.释放[2]))
      mSleep(500)
    elseif 清明技能 == 2 and multiColor2(清明灭,88) then
      sysLog("清明灭")
      click(random_click(清明灭.选择[1],清明灭.选择[2]))
      mSleep(500)
      打哪个怪()
    elseif multiColor2(兔子没火,88) then
      sysLog("兔子没火")
      click(random_click(兔子没火.选择[1],兔子没火.选择[2]))
      mSleep(500)
      打哪个怪()
    elseif multiColor2(莹草平砍,88) or multiColor2(惠比寿平砍,88) or multiColor2(海坊主平砍,88) or multiColor2(妖刀平砍,88) or multiColor2(天狗平砍,88) or multiColor2(吸血平砍,88) or multiColor2(酒吞平砍,88) or multiColor2(鸟平砍,88) or multiColor2(茨木平砍,88) then
      sysLog("妖刀平砍")
      click(random_click(海坊主平砍.选择[1],海坊主平砍.选择[2]))
      mSleep(500)
      打哪个怪()
    elseif multiColor2(隐分身,88) then
      sysLog("隐分身")
      click(random_click(隐分身.选择[1],隐分身.选择[2]))
      mSleep(500)
      if 无限魂10兔子 == 1 then
        click(random_click(隐分身.魂10释放[1],隐分身.魂10释放[2]))
      else
        click(random_click(隐分身.释放[1],隐分身.释放[2]))
      end
      mSleep(500)
    elseif multiColor2(诛邪剑,88) then	
      sysLog("诛邪剑")
      click(random_click(诛邪剑.选择[1],诛邪剑.选择[2]))
      mSleep(500)
      打哪个怪()
    elseif multiColor2(博雅平砍,88) then	
      sysLog("博雅平砍")
      click(random_click(博雅平砍.选择[1],博雅平砍.选择[2]))
      mSleep(500)
      打哪个怪()
    elseif multiColor2(比基尼平砍,88) then	
      sysLog("比基尼平砍")
      click(random_click(比基尼平砍.选择[1],比基尼平砍.选择[2]))
      mSleep(500)
      打哪个怪()
    elseif multiColor2(惠比寿旗子,88) then
      sysLog("惠比寿旗子")
      click(random_click(惠比寿旗子.选择[1],惠比寿旗子.选择[2]))
      mSleep(500)
      click(random_click(隐分身.释放[1],隐分身.释放[2]))
      mSleep(500)
    elseif 清明技能 == 1 and multiColor2(清明平砍,88) then	
      sysLog("清明平砍")
      click(random_click(清明平砍.选择[1],清明平砍.选择[2]))
      mSleep(500)
      打哪个怪()
    elseif multiColor2(战斗要待机,90) then
    end
  end
  --回合判定用
  if (功能 == 4 or 功能 == 8 or 功能 == 30 or 功能 == 20)  then
    if 进入战斗切换 then
      第几回合 = 1
      打标记次数 = 0
    elseif 第二回合切换 and (multiColor2(第二回合,90) or multiColor2(第二回合日服,90)) then
      第几回合 = 2
      第二回合切换 = false
      打标记次数 = 0
    elseif  第三回合切换 and (multiColor2(第三回合,90) or multiColor2(第三回合业原火,90) or multiColor2(第三回合业原火日服,90)) then
      第几回合 = 3
      第三回合切换 = false
      打标记次数 = -3
    end
  end
  --if 刚才在打妖气 then
  --  刚才在打妖气 = false
  --end
  if 正在组队 == false and 进入阴阳寮突破 == false and 进入个人突破 == false then
    if (功能 == 4 or 功能 == 8 or 功能 == 30 or 功能 == 20)  then
      --sysLog("第几回合"..第几回合)
      if 第几回合 == 1 then
        if 御魂打标记 == 1 then
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第1回合，标记左边")
            click(random_click(标记左边[1],标记左边[2]))
          end
          --战斗找怪物血量(0)
        elseif 御魂打标记 == 4 then
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第1回合，标记右边")
            click(random_click(标记右边[1],标记右边[2]))
          end
          --战斗找怪物血量(1)
        elseif 御魂打标记 == 2 then                  
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第1回合，标记中间")
            click(random_click(标记中间[1],标记中间[2]))
          end
        elseif 御魂打标记 == 5 then
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第1回合，先左后右")
          end
          战斗找怪物血量(1)
        elseif 御魂打标记 == 6 then
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第1回合，先右后左")
          end
          战斗找怪物血量(0)
        elseif 御魂打标记 == 7 then
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第1回合，先左后中")
          end
          战斗找怪物血量(2)
        elseif 御魂打标记 == 8 then
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第1回合，先右后中")
          end
          战斗找怪物血量(3)
        end
      elseif 第几回合 == 2 then
        if 御魂打标记2 == 1 then                  
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第2回合，标记左边")
            click(random_click(标记左边[1],标记左边[2]))
          end
          --战斗找怪物血量(0)
        elseif 御魂打标记2 == 4 then                  
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第2回合，标记右边")
            click(random_click(标记右边[1],标记右边[2]))
          end
          --战斗找怪物血量(1)
        elseif 御魂打标记2 == 2 then                  
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第2回合，标记中间")
            click(random_click(标记中间[1],标记中间[2]))
          end
        elseif 御魂打标记2 == 5 then
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第2回合，先左后右")
          end
          战斗找怪物血量(1)
        elseif 御魂打标记2 == 6 then
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第2回合，先右后左")
          end
          战斗找怪物血量(0)
        elseif 御魂打标记2 == 7 then
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第2回合，先左后中")
          end
          战斗找怪物血量(2)
        elseif 御魂打标记2 == 8 then
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第2回合，先右后中")
          end
          战斗找怪物血量(3)
        end
      elseif 第几回合 == 3 then
        if 御魂打标记3 == 1 then
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第3回合，标记左边")
            click(random_click(标记左边[1],标记左边[2]))
          end
          --战斗找怪物血量(0)
        elseif 御魂打标记3 == 4 then                  
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第3回合，标记右边")
            click(random_click(标记右边[1],标记右边[2]))
          end
          --战斗找怪物血量(1)
        elseif 御魂打标记3 == 2 then                  
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第3回合，标记中间")
            click(random_click(标记中间[1],标记中间[2]))
          end
        elseif 御魂打标记3 == 5 then
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第3回合，先左后右")
          end
          战斗找怪物血量(1)
        elseif 御魂打标记3 == 6 then
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第3回合，先右后左")
          end
          战斗找怪物血量(0)
        elseif 御魂打标记3 == 7 then
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第3回合，先左后中")
          end
          战斗找怪物血量(2)
        elseif 御魂打标记3 == 8 then
          if 	打标记次数 < 最大标记次数 then
            showHD_b("第3回合，先右后中")
          end
          战斗找怪物血量(3)
        elseif 御魂打标记3 == 9 then
          showHD_b("第3回合，丑女茨木")
          if 	打标记次数 < 9 then
            click(random_click(标记中间[1],标记中间[2]))
          elseif 打标记次数 < 15 then
            click(random_click(标记右边[1],标记右边[2]))
          end
        end
      end
      打标记次数 = 打标记次数 +1
      mSleep(250)
    end
  end
  
  if 功能 == 1 and (multiColor2(第二回合,90) or multiColor2(第二回合日服,90)) then
    第几回合 = 2
    打标记次数 = 0
  end
  if (功能 == 1 or (功能 == 8 and 正在组队)) and 进入阴阳寮突破 == false and 进入个人突破 == false then
    --sysLog("推图打标记"..推图打标记)
    --sysLog("打标记次数"..打标记次数)
    if 打标记次数 <= 4 or 打标记次数 >= 9 and 打标记次数 <= 12 then
      if 是boss战 then
        if 第几回合 == 2 then
          if 推图BOSS打标记2 == 1 then
            --mSleep(100)
            showHD_b("推图标记BOSS")
            click(打标记位置[1][1],打标记位置[1][2])
          elseif 推图BOSS打标记2 == 2 then
            showHD_b("推图标记小怪")
            --	mSleep(100)
            click(打标记位置[2][1],打标记位置[2][2])
          elseif 推图BOSS打标记2 == 3 then
          elseif 推图BOSS打标记2 == 4 then
            showHD_b("推图标记小怪")
            click(打标记位置[4][1],打标记位置[4][2])
          elseif 推图BOSS打标记2 == 5 then
            showHD_b("推图标记小怪")
            click(打标记位置[5][1],打标记位置[5][2])
          end
        else
          if 推图BOSS打标记1 == 1 then
            --mSleep(100)
            showHD_b("推图标记BOSS")
            click(打标记位置[1][1],打标记位置[1][2])
          elseif 推图BOSS打标记1 == 2 then
            showHD_b("推图标记小怪")
            --	mSleep(100)
            click(打标记位置[2][1],打标记位置[2][2])
          elseif 推图BOSS打标记1 == 3 then
          elseif 推图BOSS打标记1 == 4 then
            showHD_b("推图标记小怪")
            click(打标记位置[4][1],打标记位置[4][2])
          elseif 推图BOSS打标记1 == 5 then
            showHD_b("推图标记小怪")
            click(打标记位置[5][1],打标记位置[5][2])
          end
        end
      else
        if 第几回合 == 2 then
          if 推图打标记2 == 1 then
            --mSleep(100)
            showHD_b("推图标记BOSS")
            click(打标记位置[1][1],打标记位置[1][2])
          elseif 推图打标记2 == 2 then
            showHD_b("推图标记小怪")
            --	mSleep(100)
            click(打标记位置[2][1],打标记位置[2][2])
          elseif 推图打标记2 == 3 then
          elseif 推图打标记2 == 4 then
            showHD_b("推图标记小怪")
            click(打标记位置[4][1],打标记位置[4][2])
          elseif 推图打标记2 == 5 then
            showHD_b("推图标记小怪")
            click(打标记位置[5][1],打标记位置[5][2])
          end
        else
          if 推图打标记 == 1 then
            --mSleep(100)
            showHD_b("推图标记BOSS")
            click(打标记位置[1][1],打标记位置[1][2])
          elseif 推图打标记 == 2 then
            showHD_b("推图标记小怪")
            --	mSleep(100)
            click(打标记位置[2][1],打标记位置[2][2])
          elseif 推图打标记 == 3 then
          elseif 推图打标记 == 4 then
            showHD_b("推图标记小怪")
            click(打标记位置[4][1],打标记位置[4][2])
          elseif 推图打标记 == 5 then
            showHD_b("推图标记小怪")
            click(打标记位置[5][1],打标记位置[5][2])
          end
        end
      end
    end
    if 打标记次数 <= 12 then
      mSleep(500)
    end
    打标记次数 = 打标记次数 + 1
  end
  if 突破打标记 == 1 then
    if (功能 == 6 or 功能 == 7) and 打标记次数 <=5  then
      sysLog("非结合打标记")
      mSleep(200)
      打标记次数 = 打标记次数 +1
      click(打标记位置[3][1],打标记位置[3][2])
      mSleep(1000)
    end
    if (功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 5 or 功能 == 20 or 功能 == 21 or 功能 == 11 or 功能 == 8) and 自动突破 == 1 and 进入个人突破 and 打标记次数 <= 5 then
      sysLog("进入个人突破打标记")
      mSleep(200)
      打标记次数 = 打标记次数 +1
      click(打标记位置[3][1],打标记位置[3][2])
      mSleep(1000)
    end
    
    if (功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 5 or 功能 == 20 or 功能 == 21 or 功能 == 11 or 功能 == 8) and 自动阴阳寮 == 1 and 进入阴阳寮突破 and 打标记次数 <= 5 then
      sysLog("进入阴阳寮突破打标记")
      mSleep(200)
      打标记次数 =打标记次数+1
      click(打标记位置[3][1],打标记位置[3][2])
      mSleep(1000)
    end
  end
  if 我是国服 and (功能==1 or 功能==8) and 自动换狗粮 == 1 and 是否换式神 then
    --sysLog("要点普攻")
    if 正在组队 then
      if 左边普攻==1 and 组队探索 == 0 and multiColor2(最右狗粮妖术,90) then
        click(最右狗粮妖术.点击[1],最右狗粮妖术.点击[2])
        mSleep(500)
      end
      if 左边普攻==0 and 组队探索 == 0 and multiColor2(普攻判定右1,90) then
        click(普攻判定右1.点击[1],普攻判定右1.点击[2])
        mSleep(500)
      end
      if 中间普攻==1 and 组队探索 == 0 and multiColor2(左边狗粮妖术,90) then
        click(左边狗粮妖术.点击[1],左边狗粮妖术.点击[2])
        mSleep(500)
      end
      if 中间普攻==0 and 组队探索 == 0 and multiColor2(普攻判定右2,90) then
        click(普攻判定右2.点击[1],普攻判定右2.点击[2])
        mSleep(500)
      end
      if 右边普攻==1 and 组队探索 == 0 and multiColor2(中间狗粮妖术,90) then
        click(中间狗粮妖术.点击[1],中间狗粮妖术.点击[2])
        mSleep(500)
      end
      if 右边普攻==0 and 组队探索 == 0 and multiColor2(普攻判定中,90) then
        click(普攻判定中.点击[1],普攻判定中.点击[2])
        mSleep(500)
      end
    else
      if 右边普攻==1 and 组队探索 == 0 and multiColor2(右边狗粮妖术,90) then
        click(右边狗粮妖术.点击[1],右边狗粮妖术.点击[2])
        mSleep(500)
      end
      if 右边普攻==0 and 组队探索 == 0 and multiColor2(普攻判定左1,90) then
        click(普攻判定左1.点击[1],普攻判定左1.点击[2])
        mSleep(500)
      end
      if 中间普攻==1 and 组队探索 == 0 and multiColor2(中间狗粮妖术,90) then
        click(中间狗粮妖术.点击[1],中间狗粮妖术.点击[2])
        mSleep(500)
      end							
      if 中间普攻==0 and 组队探索 == 0 and multiColor2(普攻判定中,90) then
        click(普攻判定中.点击[1],普攻判定中.点击[2])
        mSleep(500)
      end
      if 左边普攻==1 and 组队探索 == 0 and multiColor2(左边狗粮妖术,90) then
        click(左边狗粮妖术.点击[1],左边狗粮妖术.点击[2])
        mSleep(500)
      end
      if 左边普攻==0 and 组队探索 == 0 and multiColor2(普攻判定右2,90) then
        click(普攻判定右2.点击[1],普攻判定右2.点击[2])
        mSleep(500)
      end
    end
    if 组队探索 ==1 and 队长左边普攻==1 and multiColor2(左边狗粮妖术,90) then
      click(左边狗粮妖术.点击[1],左边狗粮妖术.点击[2])
      mSleep(500)
    end
    if 组队探索 ==1 and 队长左边普攻==0 and multiColor2(普攻判定右2,90) then
      click(普攻判定右2.点击[1],普攻判定右2.点击[2])
      mSleep(500)
    end
    if 组队探索 ==1 and 队长右边普攻==1 and multiColor2(中间狗粮妖术,90) then
      click(中间狗粮妖术.点击[1],中间狗粮妖术.点击[2])
      mSleep(500)
    end
    if 组队探索 ==1 and 队长右边普攻==0 and multiColor2(普攻判定中,90) then
      click(普攻判定中.点击[1],普攻判定中.点击[2])
      mSleep(500)
    end
  elseif 不强制普攻改妖术 == 0 and (功能 == 3 or 功能 == 4 or 功能 == 30 )then 						
    if multiColor2(普攻判定中,90) then
      click(普攻判定中.点击[1],普攻判定中.点击[2])
      mSleep(500)
    end
    if multiColor2(普攻判定左2,90) then
      click(普攻判定左2.点击[1],普攻判定左2.点击[2])
      mSleep(500)
    end
    if multiColor2(普攻判定左1,90) then
      click(普攻判定左1.点击[1],普攻判定左1.点击[2])
      mSleep(500)
    end
    if multiColor2(普攻判定右2,90) then
      click(普攻判定右2.点击[1],普攻判定右2.点击[2])
      mSleep(500)
    end
    if multiColor2(普攻判定右1,90) then
      click(普攻判定右1.点击[1],普攻判定右1.点击[2])
      mSleep(500)
    end
  end
  
  if 进入战斗切换 then
    sysLog("进入战斗切换")
    sysLog("不点自动战斗"..不点自动战斗)
    进入战斗切换 = false
    战斗开始时间= mTime()
    if 功能 == 5 then
      打了几次妖气 = 打了几次妖气 +1
    end
  end
  if 找到指定怪物 then
    打了N只指定怪 = 打了N只指定怪 +1
    找到指定怪物 = false
  end
  
  if (功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 5 or 功能 == 6 or 功能 == 7) and 现在在打鬼王 == false and  战斗开始时间 > 0 and mTime() - 战斗开始时间  > 300*1000 then
    click(random_click(更换式神界面.返回[1],更换式神界面.返回[2]))
    mSleep(2000)
    click(random_click(退出战斗.确定[1],退出战斗.确定[2]))
    mSleep(1000)
  end
  
  if mTime() - 战斗开始时间 > 3000 and 功能 ~= 5 and multiColor2(战斗中调整视角,90) == false then
    showHD_b("战斗中调整视角")
    click(random_click(战斗中调整视角.点击[1],战斗中调整视角.点击[2]))
    mSleep(3000)
  end
  
  if 不点自动战斗 == 0 and mTime() - 战斗开始时间 > 5000 then
    if 功能 ~= 99 and multiColor2(手动攻击,85) then
      sysLog("点一下自动战斗")
      click(手动攻击.点击[1],手动攻击.点击[2])
      mSleep(500)
    end
  end
  战斗结束用来判定次数 = true
  start_time = mTime()
end          


--悬赏邀请
function Reward_Invitation()
  sysLog("悬赏邀请")
  if 自动接勾玉邀请 == 1 and multiColor2(勾玉邀请,90) then
    showHD_b("自动接受勾玉邀请")
    click(random_click(悬赏邀请.接受[1],悬赏邀请.接受[2]))
  elseif 自动接体力邀请 == 1 and multiColor2(体力邀请,90) then
    showHD_b("自动接受体力邀请")
    click(random_click(悬赏邀请.接受[1],悬赏邀请.接受[2]))
  elseif 自动接金币邀请 == 1 and multiColor2(金币邀请,90) then
    showHD_b("自动接受金币邀请")
    click(random_click(悬赏邀请.接受[1],悬赏邀请.接受[2]))
  elseif 自动接勾玉邀请 == 1 and 自动接体力邀请 == 1 and 自动接金币邀请 == 1 then
    showHD_b("自动接受悬赏邀请")
    click(random_click(悬赏邀请.接受[1],悬赏邀请.接受[2]))
  else
    showHD_b("自动拒绝悬赏邀请")
    click(random_click(悬赏邀请.拒绝[1],悬赏邀请.拒绝[2]))
  end
  mSleep(500)
  
end   

--悬赏邀请
function Reward_Invitation1()
  sysLog("悬赏邀请1")
  if 自动接勾玉邀请 == 1 and multiColor2(悬赏邀请1536,90) then
    showHD_b("自动接受勾玉邀请")
    click(random_click(悬赏邀请1536.接受[1],悬赏邀请1536.接受[2]))
  elseif 自动接体力邀请 == 1 and multiColor2(悬赏邀请1536,90) then
    showHD_b("自动接受体力邀请")
    click(random_click(悬赏邀请1536.接受[1],悬赏邀请1536.接受[2]))
  elseif 自动接金币邀请 == 1 and multiColor2(悬赏邀请1536,90) then
    showHD_b("自动接受金币邀请")
    click(random_click(悬赏邀请1536.接受[1],悬赏邀请1536.接受[2]))
  elseif 自动接勾玉邀请 == 1 and 自动接体力邀请 == 1 and 自动接金币邀请 == 1 then
    showHD_b("自动接受悬赏邀请")
    click(random_click(悬赏邀请1536.接受[1],悬赏邀请1536.接受[2]))
  else
    showHD_b("自动拒绝悬赏邀请")
    click(random_click(悬赏邀请1536.拒绝[1],悬赏邀请1536.拒绝[2]))
  end
  mSleep(500)
end

--功能88 一键日常任务
function onekey_dailytask()
  sysLog("88主界面")
  if multiColor2(主界面没打开卷轴,90)  then
    click(主界面.打开菜单[1],主界面.打开菜单[2])
    mSleep(1000)
  end
  
  if 日常步骤 == 0 then
    showHD_b("一键日常-好友送心")
    click(random_click(主界面.好友[1],主界面.好友[2]))
    --sysLog("点击x="..主界面.好友[1]..",点击y="..主界面.好友[2])
    ----等待弹出好友界面
    for i=1,5 do
      if multiColor(好友界面,90) then
        mSleep(1000)
        break
      end
      mSleep(1000)
    end
  elseif 日常步骤 == 1 then
    showHD_b("一键日常-御魂强化")
    click(random_click(主界面.式神录[1],主界面.式神录[2]))
  elseif 日常步骤 == 2 then
    showHD_b("一键日常-吸收结界")
    click(random_click(主界面.阴阳寮[1],主界面.阴阳寮[2]))
  elseif 日常步骤 == 3 then
    showHD_b("一键日常-满足祈愿")
    click(random_click(主界面.阴阳寮[1],主界面.阴阳寮[2]))
  elseif 日常步骤 == 4 or 日常步骤 == 5 or 日常步骤 == 6 or 日常步骤 == 7  then
    if 日常步骤 == 4 then
      showHD_b("一键日常-去探索")
    elseif 日常步骤 == 5 then
      showHD_b("一键日常-去御魂")
    elseif 日常步骤 == 6 then
      showHD_b("一键日常-去觉醒")
    elseif 日常步骤 == 7 then
      showHD_b("一键日常-去突破")
    end
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    mSleep(1000)
    click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
  elseif 日常步骤 == 9 then
    showHD_b("一键日常-日常完成")
    click(random_click(主界面.任务[1],主界面.任务[2]))
  end
  
  mSleep(1000)
end



--阴阳寮申请
function ui_TeamRequest()
  sysLog("阴阳寮申请")
  if 有人加寮 == 1 then
    click(random_click(阴阳寮申请.取消[1],阴阳寮申请.取消[2]))
    mSleep(1000)
    click(random_click(阴阳寮申请.同意[1]+200,阴阳寮申请.同意[2]))
    mSleep(1000)
  elseif 有人加寮 == 2 then
    click(random_click(阴阳寮申请.同意[1],阴阳寮申请.同意[2]))
    mSleep(1000)
    click(random_click(阴阳寮申请.同意[1]+200,阴阳寮申请.同意[2]))
    mSleep(1000)
  elseif 有人加寮 == 3 then
    click(random_click(阴阳寮界面.关闭[1],阴阳寮界面.关闭[2]))
    mSleep(1000)
    click(random_click(阴阳寮界面.关闭[1],阴阳寮界面.关闭[2]))
    mSleep(1000)
  end
end

--挂机御魂邀请界面
function ui_YuhunRequest()
  sysLog("挂机御魂邀请界面")
  if (功能 == 3 and 觉醒组队单刷 == 4) or (功能 == 4 and 御魂组队单刷 == 4) then
    mSleep(500)
    if 首次组队 == false then
      keepScreen(false)
      keepScreen(true)
    end
    if true then
      if 首次组队 then
        首次组队 = false
        头像记录()
         -- kapingjiance()
        --elseif multiColor2(组队头像检测,75) then
      elseif 找到组队队友() then
        click(random_click(挂机御魂邀请界面.确定[1],挂机御魂邀请界面.确定[2]))
        上次邀请时间 = mTime()
      else
        click(random_click(挂机御魂邀请界面.取消[1],挂机御魂邀请界面.取消[2]))
      end
    else
      if 首次组队 then
        首次组队 = false
        kapingjiance()
      elseif multiColor2(组队头像检测,75) then
        click(random_click(挂机御魂邀请界面.第一个[1],挂机御魂邀请界面.第一个[2]))
        mSleep(1000)
        if (功能 == 4 and 御魂开组几人==3) or (功能 == 3 and 觉醒开组几人==3) and multiColor2(组队头像检测3人,75) then
          click(random_click(挂机御魂邀请界面.第二个[1],挂机御魂邀请界面.第二个[2]))
          mSleep(1000)
        end
        click(random_click(挂机御魂邀请界面.确定[1],挂机御魂邀请界面.确定[2]))
        上次邀请时间 = mTime()
      else
        click(random_click(挂机御魂邀请界面.取消[1],挂机御魂邀请界面.取消[2]))
      end
    end
  elseif 功能 == 6 or 自动阴阳寮 == 1 then
    mSleep(500)
    if 首次组队 == false then
      keepScreen(false)
      keepScreen(true)
    end
    if true then
      if 首次组队 then
        首次组队 = false
        头像记录()
      elseif 找到组队队友() then
        组队突破检测失败 = 0
        click(random_click(挂机御魂邀请界面.确定[1],挂机御魂邀请界面.确定[2]))
        上次邀请时间 = mTime()
      else
        组队突破检测失败 = 组队突破检测失败 + 1
        click(random_click(挂机御魂邀请界面.取消[1],挂机御魂邀请界面.取消[2]))
      end
    else
      if 首次组队 then
        首次组队 = false
        kapingjiance()
      elseif multiColor2(组队头像检测,75) then
        组队突破检测失败 = 0
        click(random_click(挂机御魂邀请界面.第一个[1],挂机御魂邀请界面.第一个[2]))
        mSleep(1000)
        if (功能 == 6 and 组队突破几人==3) and multiColor2(组队头像检测3人,75) then
          click(random_click(挂机御魂邀请界面.第二个[1],挂机御魂邀请界面.第二个[2]))
          mSleep(1000)
        end
        click(random_click(挂机御魂邀请界面.确定[1],挂机御魂邀请界面.确定[2]))
        上次邀请时间 = mTime()
      else
        组队突破检测失败 = 组队突破检测失败 + 1
        click(random_click(挂机御魂邀请界面.取消[1],挂机御魂邀请界面.取消[2]))
      end
    end
  else
    click(random_click(挂机御魂邀请界面.取消[1],挂机御魂邀请界面.取消[2]))
  end
  
  if 组队突破检测失败 > 5 then
    组队突破 = 0
  end
  mSleep(random_time())
end          

--创建队伍
function ui_TeamCreat()
  sysLog("创建队伍")
  showHD_b("创建队伍")
  首次进入组队详情 = true
  if 功能 == 3 and 觉醒组队单刷 == 4 then
    click(random_click(创建队伍.寮可见[1],创建队伍.寮可见[2]))
    mSleep(500)
    click(random_click(创建队伍.创建[1],创建队伍.创建[2]))
  elseif 功能 == 4 and 御魂组队单刷 == 4 then
    click(random_click(创建队伍.寮可见[1],创建队伍.寮可见[2]))
    mSleep(500)
    click(random_click(创建队伍.创建[1],创建队伍.创建[2]))
  else
    if isColorArray(创建队伍.所有人可见,90) then
      click(random_click(创建队伍.所有人可见[1],创建队伍.所有人可见[2]))
      mSleep(500)
    end
    if 开组等级 > 0 and 功能 ~= 8 and 功能 ~= 50 then
      showHD_b("创建队伍-设置等级")
      if 开组等级 <= 5 then
        for i=1,16 do
          tuodong6(创建队伍.拖动)
        end
        mSleep(500)
        for i=1,开组等级*5 do
          tuodong7(创建队伍.拖动ss)
        end
      elseif 开组等级 >= 12 then
        for i=1,开组等级 do
          tuodong6_1(创建队伍.拖动)
        end
      else
        for i=1,16 do
          tuodong6_1(创建队伍.拖动)
        end
        mSleep(500)
        for i=1,(12-开组等级)*5 do
          tuodong7_1(创建队伍.拖动ss)
        end
      end
      mSleep(500)
    end
    click(random_click(创建队伍.创建[1],创建队伍.创建[2]))
    开始时间 = mTime()
    mSleep(2000)
    if multiColor(创建队伍,90) then
      click(random_click(创建队伍.取消[1],创建队伍.取消[2]))
    end
  end
  mSleep(1000)
end

--式神育成界面
function ui_GodGrowUp()
  
  sysLog("式神育成界面")
  sysLog("当前结界状态"..当前结界状态)
  showHD_b("式神育成界面")
  if 当前结界状态 == 0 and isColorArray(式神育成界面.我的寄养,90) then
    showHD_b("去找寄养坑位")
    click(random_click(式神育成界面.我的寄养[1],式神育成界面.我的寄养[2]))
  elseif (当前结界状态 == 1 or 当前结界状态 == 4) and isColorArray(式神育成界面.好友寄养,90) then
    --lua_exit()
    showHD_b("可以在这里寄养")
    mSleep(500)
    click(random_click(式神育成界面.全部[1],式神育成界面.全部[2]))
    mSleep(500)
    click(random_click(式神育成界面.选N[1],式神育成界面.选N[2]))
    mSleep(1000)
    --for i=1,15 do
    --	tuodong4(更换式神界面.拖动)
    --end
    --mSleep(1000)
    for i=1,#寄养位置 do
      tuodong(寄养位置[i][1],寄养位置[i][2],式神育成界面.拖到寄养[1],式神育成界面.拖到寄养[2])
      sysLog("拖动结束")
      mSleep(1000)
      sysLog("等待结束")
      if multiColor1(确认寄养,90) then
        mSleep(1000)
        click(random_click(确认寄养.确定[1],确认寄养.确定[2]))
        mSleep(1000)
      end
      if isColorArray2(式神育成界面.好友寄养,90) == false then
        break
      end
    end
    if 当前结界状态 == 4 and 功能 == 102 then
      mSleep(1000)
      lockDevice()
      lua_exit()
    end
    结界计算时间 = mTime()
    寄养间隔 = 360
    当前结界状态 = 3
    click(random_click(结界界面.返回[1],结界界面.返回[2]))
    mSleep(2000)
    click(random_click(结界界面.返回[1],结界界面.返回[2]))
    mSleep(1000)
  else
    showHD_b("寄养好了，返回")
    当前结界状态 = 0
    结界计算时间 = mTime()
    click(random_click(结界界面.返回[1],结界界面.返回[2]))
    mSleep(2000)
    click(random_click(结界界面.返回[1],结界界面.返回[2]))
    mSleep(1000)
  end
  mSleep(1500)
end  

--新好友寄养界面
function FriendGodGrowUp()
  mSleep(1000)
  for i=1,好友数量 do
    local t_num = math.mod(i,4)
    if t_num ==0 then
      t_num = 4
    end
    click(新好友寄养界面选择[t_num][1],新好友寄养界面选择[t_num][2])
    sysLog("新好友寄养界面选择"..t_num)
    mSleep(500)
    for j=1,20 do
      if multiColor(新好友寄养界面,90) then
        sysLog("新好友寄养界面break")
        mSleep(500)
        break
      end
      mSleep(500)
    end
    keepScreen(false)
    keepScreen(true)
    sysLog("开始判定结界卡")
    if 寄养斗鱼 == 1 and multiColor2(斗鱼卡,85) then
      showHD_b("结界卡界面-有斗鱼")
      sysLog("寄养斗鱼")
      是否可以寄养 = true
    elseif 寄养太鼓 == 1 and multiColor2(太鼓卡,85) then
      showHD_b("结界卡界面-有太鼓")
      sysLog("寄养太鼓")
      是否可以寄养 = true
    elseif 寄养伞 == 1 and multiColor2(伞卡,85) then
      showHD_b("结界卡界面-有伞")
      sysLog("寄养伞")
      是否可以寄养 = true
    elseif 寄养变异 == 1 and multiColor2(变异卡,90) and isColorArray(变异卡.判定点,90) == false then
      showHD_b("结界卡界面-有变异")
      sysLog("变异卡")
      是否可以寄养 = true
    elseif 寄养经验 == 1 and multiColor2(经验卡,85) then
      showHD_b("结界卡界面-有经验")
      sysLog("经验卡")
      是否可以寄养 = true
    end
    if 是否可以寄养 then
      if 寄养星数 == 1 then
        showHD_b("星数达标，可以寄养")
      else
        if isColorArray(结界卡星数[寄养星数-1],90) then
          showHD_b("星数达标，可以寄养")
        else
          showHD_b("星数不够，放弃寄养")
          是否可以寄养 = false
        end
      end
    end
    if 是否可以寄养 then
      当前结界状态 = 1
      click(random_click(新好友寄养界面.进入结界[1],新好友寄养界面.进入结界[2]))
      mSleep(2000)
      break
    end
    if i > 1 and math.mod(i,4) == 0 then
      tuodong7(新好友寄养界面.拖动)
    end
  end
  if 是否可以寄养 == false then
    if 找不到合适寄养时 == 1 then
      showHD_b("没有合适寄养")
      click(random_click(结界界面.返回[1],结界界面.返回[2]))
      mSleep(2000)
      click(random_click(结界界面.返回[1],结界界面.返回[2]))
      mSleep(2000)
      click(random_click(结界界面.返回[1],结界界面.返回[2]))
      mSleep(2000)
      if 推图寄养 == 0 then
        vibrator()
        mSleep(15000)
        lua_exit()
        lockDevice()
      else
        showHD_b("没有合适寄养-暂时先放弃")
        结界计算时间 = mTime()
        当前结界状态 = 3
        寄养间隔 = 设置的寄养间隔
      end
    else
      showHD_b("没有合适寄养-随机寄养")
      for i=1,math.ceil(好友数量/4) do
        tuodong6(新好友寄养界面.拖动)
      end
      local 选好友 = math.random(1,4)
      当前结界状态 = 4
      click(新好友寄养界面选择[选好友][1],新好友寄养界面选择[选好友][2])
      mSleep(500)
      for j=1,20 do
        if multiColor(新好友寄养界面,90) then
          sysLog("新好友寄养界面break")
          mSleep(500)
          break
        end
        mSleep(500)
      end
      click(random_click(新好友寄养界面.进入结界[1],新好友寄养界面.进入结界[2]))
      mSleep(2000)
    end
  end
  mSleep(1000)
end

--祈愿界面
function ui_Pray()
  sysLog("祈愿界面")
  showHD_b("祈愿界面")
  if 功能 == 88 and 日常步骤 == 3 then
    for i=1,#捐赠判定 do
      if isColorArray(捐赠判定[i],90) then
        click(random_click(捐赠判定[i][1],捐赠判定[i][2]))
        mSleep(1000)
        if multiColor(提示框,90) then
          click(random_click(提示框.取消[1],提示框.取消[2]))
          mSleep(1000)
        else
          click(random_click(捐赠判定[i][1],捐赠判定[i][2]))
          mSleep(1000)
          日常步骤 = 4
          break
        end
      end
    end
    日常步骤 = 4
  end
  click(random_click(阴阳寮界面.关闭[1],阴阳寮界面.关闭[2]))
  mSleep(3000)
end

--阴阳寮界面
function ui_Home()
  sysLog("阴阳寮界面")
  if 功能 == 88 and 日常步骤 == 2 then
    showHD_b("阴阳寮界面-进入结界")
    click(random_click(阴阳寮界面.结界[1],阴阳寮界面.结界[2]))
  elseif 功能 == 88 and 日常步骤 == 3 then
    showHD_b("阴阳寮界面-进入祈愿")
    click(random_click(阴阳寮界面.祈愿[1],阴阳寮界面.祈愿[2]))
  elseif 功能 ==  102  and 当前结界状态 == 0 and mTime() - 结界计算时间 > 寄养间隔*60*1000  then
    showHD_b("阴阳寮界面-进入寄养")
    click(random_click(阴阳寮界面.结界[1],阴阳寮界面.结界[2]))
  elseif 推图寄养 ==  1  and mTime() - 结界计算时间 > 寄养间隔*60*1000  then
    showHD_b("阴阳寮界面-进入寄养")
    click(random_click(阴阳寮界面.结界[1],阴阳寮界面.结界[2]))
  else
    showHD_b("阴阳寮界面-直接关闭")
    当前结界状态 = 0
    click(random_click(阴阳寮界面.关闭[1],阴阳寮界面.关闭[2]))
  end
  mSleep(random_time())
end

--结界界面
function ui_JjAttack()
  sysLog("结界界面")
  if 功能 == 88 then
    if 日常步骤 == 2 then
      if 不做日常祈愿和强化 == 0 then
        日常步骤 = 3
      else
        日常步骤 = 4
      end
      click(random_click(结界界面.吸收[1],结界界面.吸收[2]))
    else
      click(random_click(结界界面.返回[1],结界界面.返回[2]))
    end
  elseif 当前结界状态 == 3 then
    showHD_b("结界界面-寄养结束返回")
    当前结界状态 = 0
    click(random_click(结界界面.返回[1],结界界面.返回[2]))
  elseif 当前结界状态 == 0 then
    showHD_b("结界界面-进入我的寄养")
    click(random_click(结界界面.式神育成[1],结界界面.式神育成[2]))
  elseif 当前结界状态 == 4 then
    showHD_b("结界界面-进入好友")
    click(random_click(结界界面.式神育成[1],结界界面.式神育成[2]))
  else
    是否要拖动好友寄养 = true
    showHD_b("结界界面-进入结界卡")
    click(random_click(结界界面.结界卡[1],结界界面.结界卡[2]))
  end
  mSleep(random_time())
end

--组队详情
function ui_TeamDetail()
  sysLog("组队详情，功能 = "..功能)
  是否换式神 = false
  进入战斗切换 = true
  打标记次数 = 0
  第几回合 = 1
  缩放处理相关()
  if 要打鬼王 then
    click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
  elseif 当前在什么妖气目标里 > 0 then
    if isColorArray(组队详情.开始战斗,90) then
      if 妖气做不做队长 == 0 then
        showHD_b("组队详情-开始战斗")
        click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      else
        showHD_b("妖气队长走了，我也走")
        click(random_click(组队详情.离开队伍[1],组队详情.离开队伍[2]))
        mSleep(2000)
        click(random_click(提示框.确定[1],提示框.确定[2]))
        mSleep(2000)
      end
    end
    mSleep(1000)
  elseif 功能 == 1 and (发现石距自动打 ==1 or 发现年兽自动打 == 1) and 是否在阴阳寮组队 == false then
    if isColorArray(组队详情.开组3人,90) == false then
      showHD_b("3人开组，开始战斗")
      click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
    end
  elseif 功能 == 5 and 是否在阴阳寮组队 == false then--开组
    if isColorArray(组队详情.开始战斗,90) then
      if 妖气做不做队长 == 0 then
        showHD_b("组队详情-开始战斗")
        click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      else
        showHD_b("妖气队长走了，我也走")
        click(random_click(组队详情.离开队伍[1],组队详情.离开队伍[2]))
        mSleep(2000)
        click(random_click(提示框.确定[1],提示框.确定[2]))
        mSleep(2000)
      end
    end
  elseif 功能 == 8 then
    mSleep(1000)
  else
    if 功能 == 3 and (觉醒组队单刷 == 2 or 觉醒组队单刷 == 4) and 觉醒开组几人 == 2 and isColorArray(组队详情.开组2人,95) == false then
      showHD_b("组队详情-开始战斗")
      click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      --首次进入组队详情 = true
    elseif 功能 == 3 and (觉醒组队单刷 == 2 or 觉醒组队单刷 == 4) and 觉醒开组几人 == 3 and isColorArray(组队详情.开组3人,95) == false then
      showHD_b("组队详情-开始战斗")
      click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      --首次进入组队详情 = true
    elseif 功能 == 4 and (御魂组队单刷 == 2 or 御魂组队单刷 == 4) and 御魂开组几人 == 2 and isColorArray(组队详情.开组2人,95) == false then
      showHD_b("组队详情-开始战斗")
      click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      --首次进入组队详情 = true
    elseif 功能 == 4 and (御魂组队单刷 == 2 or 御魂组队单刷 == 4) and 御魂开组几人 == 3 and isColorArray(组队详情.开组3人,95) == false then
      showHD_b("组队详情-开始战斗")
      click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      --首次进入组队详情 = true
    elseif (功能 == 6 or 是否在阴阳寮组队) and 组队突破几人 == 2 and isColorArray(组队详情.开组2人,95) == false then
      showHD_b("组队详情-开始战斗")
      click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      --首次进入组队详情 = true
    elseif (功能 == 6 or 是否在阴阳寮组队) and 组队突破几人 == 3 and isColorArray(组队详情.开组3人,95) == false then
      showHD_b("组队详情-开始战斗")
      click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      --首次进入组队详情 = true
    elseif ((功能 == 3 and 觉醒组队单刷 == 3) or (功能 == 4 and 御魂组队单刷 == 3)) and isColorArray(组队详情.开始战斗,90) then
      click(random_click(组队详情.离开队伍[1],组队详情.离开队伍[2]))
      mSleep(2000)
      click(random_click(提示框.确定[1],提示框.确定[2]))
      mSleep(2000)
      开始时间 = mTime()
    elseif (功能 == 6 or 是否在阴阳寮组队) and 组队突破几人 == 4 and isColorArray(组队详情.开组2人,95) == false then
      showHD_b("组队详情-开始战斗")
      click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      --首次进入组队详情 = true
    else
      if 首次进入组队详情 then
        首次进入组队详情 = false
        if 功能 == 4 and 御魂组队单刷 == 4 then
          上次邀请时间 = mTime() - 15000
        elseif 功能 == 3 and 觉醒组队单刷 == 4 then
          上次邀请时间 = mTime() - 15000
        elseif 功能 == 6 and 组队突破 ~= 0 then
          上次邀请时间 = mTime() - 15000
        else
          上次邀请时间 = mTime() - 15000
        end
      end
      if (功能 == 4 and 御魂组队单刷 == 4) or (功能 == 3 and 觉醒组队单刷 == 4) or (是否在阴阳寮组队 and 组队突破几人 ~=4) then
        if mTime() - 上次邀请时间 > 10000 then
          --上次邀请时间 = mTime()
          showHD_b("组队详情-去拉好友")
          click(random_click(组队详情.开组3人[1],组队详情.开组3人[2]))
          mSleep(1000)
        end
      end
    end
    if mTime() - 开始时间 > 120*1000 or 组队突破检测失败 > 5 then
      showHD_b("120秒内未开始，退出队伍")
      sysLog("开始时间 > 30*1000")
      click(random_click(组队详情.离开队伍[1],组队详情.离开队伍[2]))
      mSleep(2000)
      click(random_click(提示框.确定[1],提示框.确定[2]))
      mSleep(2000)
      开始时间 = mTime()
    end
  end
  mSleep(1000)
end

--组队详情1
function ui_TeamDetail1()
  sysLog("组队详情日服 = "..功能)
  是否换式神 = false
  进入战斗切换 = true
  打标记次数 = 0
  第几回合 = 1
  if 功能 == 1 and (发现石距自动打 or 发现年兽自动打) then
    if isColorArray(组队详情.开组3人,90) == false then
      showHD_b("3人开组，开始战斗")
      click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
    end
  elseif 功能 == 5 then--开组
    if isColorArray(组队详情.开始战斗,90) then
      if 妖气做不做队长 == 0 then
        showHD_b("组队详情-开始战斗")
        click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      else
        showHD_b("妖气队长走了，我也走")
        click(random_click(组队详情.离开队伍[1],组队详情.离开队伍[2]))
        mSleep(2000)
        click(random_click(提示框.确定[1],提示框.确定[2]))
        mSleep(2000)
      end
    end
  elseif 功能 == 8 then
    mSleep(1000)
  elseif 当前在什么妖气目标里 > 0 then
    if isColorArray(组队详情.开始战斗,90) then
      if 妖气做不做队长 == 0 then
        showHD_b("组队详情-开始战斗")
        click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      else
        showHD_b("妖气队长走了，我也走")
        click(random_click(组队详情.离开队伍[1],组队详情.离开队伍[2]))
        mSleep(2000)
        click(random_click(提示框.确定[1],提示框.确定[2]))
        mSleep(2000)
      end
    end
    mSleep(1000)
  else
    if 功能 == 3 and (觉醒组队单刷 == 2 or 觉醒组队单刷 == 4) and 觉醒开组几人 == 2 and isColorArray2(组队详情.开组2人,95) == false then
      showHD_b("组队详情-开始战斗")
      click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      首次进入组队详情 = true
    elseif 功能 == 3 and (觉醒组队单刷 == 2 or 觉醒组队单刷 == 4) and 觉醒开组几人 == 3 and isColorArray2(组队详情.开组3人,95) == false then
      showHD_b("组队详情-开始战斗")
      click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      首次进入组队详情 = true
    elseif 功能 == 4 and (御魂组队单刷 == 2 or 御魂组队单刷 == 4) and 御魂开组几人 == 2 and isColorArray2(组队详情.开组2人,95) == false then
      showHD_b("组队详情-开始战斗")
      click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      首次进入组队详情 = true
    elseif 功能 == 4 and (御魂组队单刷 == 2 or 御魂组队单刷 == 4) and 御魂开组几人 == 3 and isColorArray2(组队详情.开组3人,95) == false then
      showHD_b("组队详情-开始战斗")
      click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      首次进入组队详情 = true
    elseif (功能 == 6 or 是否在阴阳寮组队) and 组队突破几人 == 2 and isColorArray2(组队详情.开组2人,95) == false then
      showHD_b("组队详情-开始战斗")
      click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      首次进入组队详情 = true
    elseif (功能 == 6 or 是否在阴阳寮组队) and 组队突破几人 == 3 and isColorArray2(组队详情.开组3人,95) == false then
      showHD_b("组队详情-开始战斗")
      click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      首次进入组队详情 = true
    elseif ((功能 == 3 and 觉醒组队单刷 == 3) or (功能 == 4 and 御魂组队单刷 == 3)) and isColorArray(组队详情.开始战斗,90) then
      click(random_click(组队详情.离开队伍[1],组队详情.离开队伍[2]))
      mSleep(2000)
      click(random_click(提示框.确定[1],提示框.确定[2]))
      mSleep(2000)
      开始时间 = mTime()
    elseif (功能 == 6 or 是否在阴阳寮组队) and 组队突破几人 == 4 and isColorArray(组队详情.开组2人,95) == false then
      showHD_b("组队详情-开始战斗")
      click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
      --首次进入组队详情 = true
    else
      if 首次进入组队详情 then
        首次进入组队详情 = false
        if 功能 == 4 and 御魂组队单刷 == 4 then
          上次邀请时间 = mTime() - 15000
        elseif 功能 == 3 and 觉醒组队单刷 == 4 then
          上次邀请时间 = mTime() - 15000
        elseif 功能 == 6 and 组队突破 ~= 0 then
          上次邀请时间 = mTime() - 15000
        else
          上次邀请时间 = mTime() - 15000
        end
      end
      if (功能 == 4 and 御魂组队单刷 == 4) or (功能 == 3 and 觉醒组队单刷 == 4) or (是否在阴阳寮组队 and 组队突破几人 ~=4) then
        if mTime() - 上次邀请时间 > 10000 then
          --上次邀请时间 = mTime()
          showHD_b("组队详情-去拉好友")
          click(random_click(组队详情.开组3人[1],组队详情.开组3人[2]))
          mSleep(1000)
        end
      end
    end
    if mTime() - 开始时间 > 120*1000 or 组队突破检测失败 > 5 then
      showHD_b("120秒内未开始，退出队伍")
      sysLog("开始时间 > 30*1000")
      click(random_click(组队详情.离开队伍[1],组队详情.离开队伍[2]))
      mSleep(2000)
      click(random_click(提示框.确定[1],提示框.确定[2]))
      mSleep(2000)
      开始时间 = mTime()
    end
  end
  mSleep(1000)
end
--推图中界面处理
function ui_TuiTu()
  组队邀请次数 = 0
  进入阴阳寮突破 = false
  组队邀请判断过 = false
  sysLog("打了几次探索"..打了几次探索)
  --sysLog("几次检测一次满"..几次检测一次满)
  if 功能 == 8 then
    是否换式神 = true
    if 刚进副本 then
      队员进副本时间 = mTime()
      刚进副本 = false
    end
    if  multiColor2(还有组队,90) then
      showHD_b("副本中-队员模式")
      正在组队 = true
      mSleep(1000)
    else
      showHD_b("副本中-队长走了，退出")
      --正在组队 = false
      刚进副本 = true
      click(random_click(推图中.退出[1],推图中.退出[2]))
    end
    if mTime() - 队员进副本时间 > 420*1000 then
      showHD_b("副本超时，退出")
      刚进副本 = true
      click(random_click(推图中.退出[1],推图中.退出[2]))
    end
  elseif 功能 == 88 and 日常步骤 == 4 then
    if 刚进副本 then
      mSleep(1000)
      刚进副本 = false
      拖图次数= 0
    else
      mSleep(500)
    end
    if 日常次数记录 >=3 then
      日常次数记录 = 0
      日常步骤 = 5
      click(random_click(推图中.退出[1],推图中.退出[2]))
      mSleep(1000)
    elseif 找boss() then	
      start_count = 0
      是boss战 = true
      进入战斗切换 = true
      日常次数记录 = 日常次数记录 +1
      打标记次数 = 0
      第几回合 = 1
      mSleep(2000)
    elseif 找小怪() then
      进入战斗切换 = true
      打标记次数 = 0
      mSleep(3000)
    elseif 副本结束领奖() then		
      mSleep(2000)
      start_count = 0
    else
      start_count = start_count +1
      if start_count <=8*2 then
        if math.mod(start_count,2) ==1 then
          tuodong5(推图中.拖动)
        end
      elseif start_count <=16*2 then
        if math.mod(start_count,2) ==1 then
          tuodong6(推图中.拖动)
        end
      else
        start_count = 0
      end
    end
  elseif 功能 ~= 1 then
    click(random_click(推图中.退出[1],推图中.退出[2]))
  else
    if 打了几次探索 >= 几次检测一次满 and 自动换狗粮 == 1 then
      if isColorArray(推图中.锁定式神,90) == true then
        click(random_click(推图中.锁定式神[1],推图中.锁定式神[2]))
        mSleep(100)
      end
    else
      if isColorArray(推图中.锁定式神,90) == false then
        click(random_click(推图中.锁定式神[1],推图中.锁定式神[2]))
        mSleep(100)
      end
    end
    if ipad没有缩放 == false and (w == 1536 or w == 2048) and 刷经验怪 == 1 and 刷任意怪 == 0 and 刷金币怪 == 0 and 刷御魂怪 == 0 then
      resetScreenScale()
      sysLog("副本中取消缩放")
      重写推图参数(1536*2048)
    end
    是否换式神 = true
    --sysLog("打了N只指定怪="..打了N只指定怪)
    --sysLog("打怪超过N个="..打怪超过N个)
    if 打了N只指定怪 >= 打怪超过N个 and 打怪超过N个 ~= 9999 then
      打怪数量超过了 = true
    end
    if 刚进副本 then
      mSleep(1000)
      刚进副本 = false
      拖图次数= 0
      队员进副本时间 = mTime()
    else
      mSleep(500)
    end
    --showHUD(id,"推图中",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
    if mTime() - 队员进副本时间 > 600*1000 then
      showHD_b("副本超时，退出")
      刚进副本 = true
      click(random_click(推图中.退出[1],推图中.退出[2]))
      if 判定方式 == 2 then
        推图次数 = 推图次数 -1
      end
      if ipad没有缩放 and (w == 1536 or w == 2048) then
        setScreenScale(768,1024)
        重写推图参数()
      end
      mSleep(2000)
    elseif 失败次数 >= 失败几次退出 then
      click(random_click(推图中.退出[1],推图中.退出[2]))
      if 判定方式 == 2 then
        推图次数 = 推图次数 -1
      end
      if ipad没有缩放 and (w == 1536 or w == 2048) then
        setScreenScale(768,1024)
        重写推图参数()
      end
      失败次数 = 0
      mSleep(2000)
    elseif 拖图次数 >= 副本内拖图次数 then
      click(random_click(推图中.退出[1],推图中.退出[2]))
      if 判定方式 == 2 then
        推图次数 = 推图次数 -1
      end
      if ipad没有缩放 and (w == 1536 or w == 2048) then
        setScreenScale(768,1024)
        重写推图参数()
      end
      拖图次数 = 0
      mSleep(2000)
    elseif 打完boss and mTime() - 打完boss计时 > 30*1000 then
      click(random_click(推图中.退出[1],推图中.退出[2]))
      if 判定方式 == 2 then
        推图次数 = 推图次数 -1
      end
      if ipad没有缩放 and (w == 1536 or w == 2048) then
        setScreenScale(768,1024)
        重写推图参数()
      end
      mSleep(2000)
      --elseif 自动换狗粮 == 0 and isColorArray(推图中.锁定式神,90) == false then
      --sysLog("NPC对话")
      --  click(random_click(推图中.锁定式神[1],推图中.锁定式神[2]))
      --  mSleep(random_time())
      --elseif 自动换狗粮 == 1 and isColorArray(推图中.锁定式神,90) == true then
      --sysLog("NPC对话")
      --  click(random_click(推图中.锁定式神[1],推图中.锁定式神[2]))
      --  mSleep(random_time())
    elseif 是boss战 and 副本结束领奖() then	
      --elseif false then	
      if ipad没有缩放 and (w == 1536 or w == 2048) then
        setScreenScale(768,1024)
        重写推图参数()
      end
      mSleep(2000)
      start_count = 0
      打经验怪 = true 
      组队探索后可以继续 = true
    elseif 刷boss == 1 and 找boss() then	
      if ipad没有缩放 and (w == 1536 or w == 2048) then
        setScreenScale(768,1024)
        重写推图参数()
      end
      if 判定方式 == 1 then
        推图次数 = 推图次数 -1
      end
      start_count = 0
      是boss战 = true
      进入战斗切换 = true
      打标记次数 = 0
      第几回合 = 1
      mSleep(2000)
    elseif 刷经验怪 == 1 and 找经验怪() then
      if ipad没有缩放 and (w == 1536 or w == 2048) then
        setScreenScale(768,1024)
        重写推图参数()
      end
      找到指定怪物 = true
      进入战斗切换 = true						
      mSleep(3000)
    elseif 刷金币怪 == 1 and 找金币怪() then
      if ipad没有缩放 and (w == 1536 or w == 2048) then
        setScreenScale(768,1024)
        重写推图参数()
      end
      找到指定怪物 = true
      进入战斗切换 = true
      mSleep(3000)
    elseif 刷御魂怪 == 1 and 找御魂怪() then			
      if ipad没有缩放 and (w == 1536 or w == 2048) then
        setScreenScale(768,1024)
        重写推图参数()
      end
      找到指定怪物 = true
      进入战斗切换 = true
      打标记次数 = 0
      mSleep(3000)
    elseif 打经验怪 == false and 刷任意怪 == 1 and 找小怪() then
      if ipad没有缩放 and (w == 1536 or w == 2048) then
        setScreenScale(768,1024)
        重写推图参数()
      end
      进入战斗切换 = true
      打标记次数 = 0
      mSleep(3000)
    elseif 打怪数量超过了 and 找小怪() then
      if ipad没有缩放 and (w == 1536 or w == 2048) then
        setScreenScale(768,1024)
        重写推图参数()
      end
      进入战斗切换 = true
      打标记次数 = 0
      mSleep(3000)
    elseif 组队探索 == 1 and multiColor2(还有组队,90) == false then
      showHD_b("副本中-队员走了，退出")
      click(random_click(推图中.退出[1],推图中.退出[2]))
      if 判定方式 == 2 then
        推图次数 = 推图次数 -1
      end
      if ipad没有缩放 and (w == 1536 or w == 2048) then
        setScreenScale(768,1024)
        重写推图参数()
      end
      mSleep(2000)
    else
      start_count = start_count +1
      --sysLog("start_count="..start_count)
      if start_count <=副本内拖图次数*2 then
        --sysLog("右边")
        if math.mod(start_count,2) ==1 then
          tuodong5(推图中.拖动)
        end
        if start_count ==副本内拖图次数*2 then
          打经验怪 = false
        end
        --mSleep(500)
      elseif start_count <=副本内拖图次数*4 and 刷任意怪 == 1 then
        --sysLog("刷任意怪左边")
        if math.mod(start_count,2) ==1 then
          tuodong6(推图中.拖动)
        end
        --mSleep(500)
      elseif start_count <=副本内拖图次数*4 and 打怪数量超过了 then
        if math.mod(start_count,2) ==1 then
          tuodong6(推图中.拖动)
        end
      else
        start_count = 0
        拖图次数 = 拖图次数 + 1
        if 打怪数量超过了 then
          
        else
          click(random_click(推图中.退出[1],推图中.退出[2]))
          if 判定方式 == 2 then
            推图次数 = 推图次数 -1
          end
          if ipad没有缩放 and (w == 1536 or w == 2048) then
            setScreenScale(768,1024)
            重写推图参数()
          end
          mSleep(2000)
        end
        --mSleep(500)
      end
    end
  end
end

--新觉醒选择界面
function ui_JueXingNew()
  --showHUD(id,"选择觉醒材料",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
  sysLog("新觉醒选择界面")
  showHD_b("觉醒选择界面")
  if 功能 == 88 and 日常步骤 == 6 then
    local 随便选 = math.random(1,4)
    click(random_click(新觉醒选择界面[随便选][1],新觉醒选择界面[随便选][2]))
  elseif 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
    click(random_click(新觉醒选择界面.关闭[1],新觉醒选择界面.关闭[2]))
  elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
    showHD_b("寄养时间到，去寄养啦")
    click(random_click(新觉醒选择界面.关闭[1],新觉醒选择界面.关闭[2]))
  elseif 定期妖气相关() then
    click(random_click(新觉醒选择界面.关闭[1],新觉醒选择界面.关闭[2]))
  elseif 正在任务切换途中 then
    click(random_click(新觉醒选择界面.关闭[1],新觉醒选择界面.关闭[2]))
  elseif 功能 == 3 then
    是否换式神 = false
    click(random_click(新觉醒选择界面[刷觉醒材料设置][1],新觉醒选择界面[刷觉醒材料设置][2]))
    for i=1,10 do
      if multiColor(觉醒挑战界面,90) then
        mSleep(1000)
        break
      end
      mSleep(1000)
    end
  else
    click(random_click(新觉醒选择界面.关闭[1],新觉醒选择界面.关闭[2]))
  end
  mSleep(1000)
end

--副本探索界面
function ui_TanSuo()
  sysLog("副本探索界面")
  showHD_b("副本探索界面")
  if 功能 == 88 and 日常步骤 == 4 then
    刚进副本 =true
    click(random_click(副本探索界面.普通[1],副本探索界面.普通[2]))
    mSleep(1000)
    click(random_click(副本探索界面.探索[1],副本探索界面.探索[2],20))
    mSleep(5000)
  elseif (功能 == 1 or 功能 == 11) and 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
    找关闭按钮()
  elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
    找关闭按钮()
  elseif 要打妖怪退治 then
    找关闭按钮()
  elseif 要打鬼王 then
    找关闭按钮() 
  elseif (功能 == 1 or 功能 == 8) then 
    sysLog("组队探索"..组队探索)
    if 推图次数 <= 0 then
      if #任务表 > 0 then
        table.remove(任务表,1)
      end
      任务表处理(功能)
    else
      if 推图难度 == 1 then
        click(random_click(副本探索界面.普通[1],副本探索界面.普通[2],30))
      elseif 推图难度 == 2 then
        click(random_click(副本探索界面.困难[1],副本探索界面.困难[2],30))
      end
      start_count = 0
      打了N只指定怪 = 0
      打怪数量超过了 = false
      检测过了 = false
      失败次数 = 0
      if 刷经验怪 == 1 or 刷金币怪==1 or 刷御魂怪 == 1 then
        打经验怪 = true
      end
      mSleep(1000)
      if multiColor2(判断是第二章,90) then
        是第二章 = true
      else
        是第二章 = false
      end
      刚进副本 =true
      if 组队探索 == 1 then
        showHD_b("副本探索界面-组队")
        click(random_click(副本探索界面.组队[1],副本探索界面.组队[2],20))
        mSleep(1000)
      else
        showHD_b("副本探索界面-探索")
        click(random_click(副本探索界面.探索[1],副本探索界面.探索[2],20))
        组队邀请次数 = 0
        mSleep(5000)
      end
      showHD_b("剩余探索次数："..推图次数)
      --推图次数 = 推图次数 -1
      sysLog("推图次数 -1,当前推图次数="..推图次数)
			      sysLog("刷经验怪="..刷经验怪.."刷金币怪="..刷金币怪.."刷御魂怪="..刷御魂怪.."组队探索="..组队探索)
    end
  elseif 功能 == 11 then
    click(random_click(副本探索界面.挑战[1],副本探索界面.挑战[2],20))
  else
    找关闭按钮()
  end
  mSleep(random_time())
end

--组队探索界面
function ui_TanSuoZuDui()
  sysLog("组队探索界面")
  showHD_b("组队探索界面")
  mSleep(500)
  if 功能 == 1 then
    mSleep(500)
    keepScreen(false)
    keepScreen(true)
    if 首次选择探索好友 then
      首次选择探索好友 = false
      if 组队设置 == 1 then
        showHD_b("组队探索界面-寮友")
        click(random_click(组队探索界面.寮友[1],组队探索界面.寮友[2]))
      else
        showHD_b("组队探索界面-好友")
        click(random_click(组队探索界面.好友[1],组队探索界面.好友[2]))
      end
    elseif 组队设置 == 1 and isColorArray(组队探索界面.寮友,90) == false then
      sysLog("组队设置 == 1")
      showHD_b("组队探索界面-寮友")
      click(random_click(组队探索界面.寮友[1],组队探索界面.寮友[2]))
    elseif 组队设置 == 2 and isColorArray(组队探索界面.好友,90) == false then
      sysLog("组队设置 == 2")
      showHD_b("组队探索界面-好友")
      click(random_click(组队探索界面.好友[1],组队探索界面.好友[2]))
    elseif 首次组队 then
      首次组队 = false
      showHD_b("首次组队，记录头像信息")
      头像记录()
      --kapingjiance()
    elseif 找到组队队友() then
      --elseif multiColor2(组队头像检测,75) then
      showHD_b("头像正确，开始邀请")
      --click(random_click(组队探索界面.第一个[1],组队探索界面.第一个[2]))
      -- mSleep(1000)
      click(random_click(组队探索界面.邀请[1],组队探索界面.邀请[2],20))
      keepScreen(false)
      local 需要检测 = true
      for i=1,8 do 
        if multiColor(推图中,90) then
          需要检测 = false
          break
        end
        mSleep(1000)
      end
      if 需要检测 then
        if multiColor(组队探索界面,90) then
          showHD_b("邀请失败，剩余失败次数:"..邀请失败次数)
          邀请失败次数 = 邀请失败次数 -1
          click(random_click(组队探索界面.取消[1],组队探索界面.取消[2]))
        end
        if 邀请失败次数 <=0 then
          震动锁屏()
          setStringConfig("lua_exit","欢迎回来，上次因为邀请失败次数不足而停止脚本。")
          lua_exit()
        end
      end
    else
      sysLog("头像检测失败，取消")
      showHD_b("头像检测失败，取消组队")
      click(random_click(组队探索界面.取消[1],组队探索界面.取消[2]))
    end
  else
    click(random_click(组队探索界面.取消[1],组队探索界面.取消[2]))
  end
  mSleep(1000)
end

--式神挑战界面
function ui_ShiShenTiaoZhan()
  if 功能 == 11 and 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
    找关闭按钮()
  elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
    找关闭按钮()
  elseif 要打妖怪退治 then
    找关闭按钮()
  elseif 要打鬼王 then
    找关闭按钮() 
  elseif 正在任务切换途中 then
    找关闭按钮() 
  else
    click(random_click(式神挑战选择[式神挑战第几个][1],式神挑战选择[式神挑战第几个][2],30))
    mSleep(2000)
    click(random_click(副本探索界面.探索[1],副本探索界面.探索[2],20))
  end
  mSleep(random_time())
end


--御魂选择界面
function ui_YuHunSelect()
  sysLog("御魂选择界面")
  if 功能 == 88 and 日常步骤 == 5 then
    click(random_click(御魂选择界面.大蛇[1],御魂选择界面.大蛇[2]))
  elseif 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
    showHD_b("阴阳寮时间到，去突破啦")
    click(random_click(御魂选择界面.关闭[1],御魂选择界面.关闭[2]))
  elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
    showHD_b("寄养时间到，去寄养啦")
    click(random_click(御魂选择界面.关闭[1],御魂选择界面.关闭[2]))
  elseif 定期妖气相关() then
    click(random_click(御魂选择界面.关闭[1],御魂选择界面.关闭[2]))
  elseif 正在任务切换途中 then
    click(random_click(御魂选择界面.关闭[1],御魂选择界面.关闭[2]))
  elseif 功能 == 4 or 功能 ==99 then
    click(random_click(御魂选择界面.大蛇[1],御魂选择界面.大蛇[2]))
    for i=1,10 do
      if multiColor(觉醒挑战界面,90) then
        mSleep(1000)
        break
      end
      mSleep(1000)
    end
  elseif 功能 == 20 then
    click(random_click(御魂选择界面.业原火[1],御魂选择界面.业原火[2]))
    for i=1,10 do
      if multiColor(业原火挑战界面,90) then
        mSleep(1000)
        break
      end
      mSleep(1000)
    end
  else
    sysLog("御魂选择界面关闭")
    click(random_click(御魂选择界面.关闭[1],御魂选择界面.关闭[2]))
  end
  mSleep(random_time())
end

--业原火挑战界面
function ui_YeYuanHuo()
  sysLog("业原火挑战界面"..业原火设置)
  mSleep(1000)
  if 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
    showHD_b("阴阳寮时间到，去突破啦")
    click(random_click(业原火挑战界面.关闭[1],业原火挑战界面.关闭[2]))
  elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
    showHD_b("寄养时间到，去寄养啦")
    click(random_click(业原火挑战界面.关闭[1],业原火挑战界面.关闭[2]))
  elseif 定期妖气相关() then
    click(random_click(业原火挑战界面.关闭[1],业原火挑战界面.关闭[2]))
  elseif 正在任务切换途中 then
    click(random_click(业原火挑战界面.关闭[1],业原火挑战界面.关闭[2]))
  elseif 功能 == 20 then
    if 业原火点挑战次数 > 10 then
      lockDevice()
      lua_exit()
    end
    if 业原火设置 == 1 then
      click(random_click(业原火挑战界面.贪之阵[1],业原火挑战界面.贪之阵[2]))
    elseif 业原火设置 == 2 then
      click(random_click(业原火挑战界面.嗔之阵[1],业原火挑战界面.嗔之阵[2]))
    elseif 业原火设置 == 3 then
      click(random_click(业原火挑战界面.痴之阵[1],业原火挑战界面.痴之阵[2]))
    end
    mSleep(1000)
    业原火点挑战次数 = 业原火点挑战次数 + 1
    click(random_click(业原火挑战界面.挑战[1],业原火挑战界面.挑战[2]))
  else
    click(random_click(业原火挑战界面.关闭[1],业原火挑战界面.关闭[2]))
  end
  mSleep(random_time())
end

--觉醒界面处理
function ui_JueXing()
  --showHUD(id,"选择觉醒层数",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
  sysLog("觉醒挑战界面")
  从觉醒挑战界面进入 = true
  if 功能 == 88 and (日常步骤 == 5 or 日常步骤 == 6) then
    if 日常御魂做完了 == false then
      tuodong3(觉醒挑战界面.拖到前4层)
      click(random_click(觉醒选择第几层[1][1],觉醒选择第几层[1][2]))
      mSleep(1000)
      click(random_click(觉醒挑战界面.挑战[1],觉醒挑战界面.挑战[2],20))
      日常次数记录 = 日常次数记录 +1
      mSleep(2000)
    else
      日常御魂做完了 = false
      click(random_click(觉醒挑战界面.关闭[1],觉醒挑战界面.关闭[2]))
      mSleep(1000)
    end
  elseif 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
    showHD_b("阴阳寮时间到，去突破啦")
    click(random_click(觉醒挑战界面.关闭[1],觉醒挑战界面.关闭[2]))
  elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
    showHD_b("寄养时间到，去寄养啦")
    click(random_click(御魂选择界面.关闭[1],御魂选择界面.关闭[2]))
  elseif 定期妖气相关() then
    click(random_click(觉醒挑战界面.关闭[1],觉醒挑战界面.关闭[2]))
  elseif 无限魂10兔子 == 1 and 功能 == 99 then
    click(random_click(觉醒挑战界面.挑战[1],觉醒挑战界面.挑战[2],20))
  elseif 正在任务切换途中 then
    click(random_click(觉醒挑战界面.关闭[1],觉醒挑战界面.关闭[2]))
  elseif 功能 == 3 or 功能 == 4 then
    是否换式神 = false
    local 选层数 = 0
    if 功能 == 3 then
      选层数 = 刷觉醒材料几层
    elseif 功能 == 4 then
      选层数 = 刷御魂材料几层
    end
    if true then
      --if 选过几层了 == false or 刚才在打妖气 == true then
      showHD_b("觉醒挑战界面，选层")
      if 选层数 <= 4 then
        tuodong_canshu(觉醒挑战界面.拖到前4层,200,10,10)
        mSleep(1000)
        click(random_click(觉醒选择第几层[选层数][1],觉醒选择第几层[选层数][2]))
      elseif 选层数 >=7 then
        tuodong_canshu(觉醒挑战界面.拖到后4层,200,10,10)
        tuodong_canshu(觉醒挑战界面.拖到后4层,200,10,10)
        mSleep(1000)
        click(random_click(觉醒选择第几层[选层数-6][1],觉醒选择第几层[选层数-6][2]))
      elseif 选层数 == 5 then
        mSleep(500)
        tuodong3(觉醒挑战界面.拖到前4层)
        mSleep(500)
        tuodong2(觉醒挑战界面.拖动)
        mSleep(500)
        click(random_click(觉醒选择第几层[2][1],觉醒选择第几层[2][2]))
      elseif 选层数 == 6 then
        mSleep(500)
        tuodong3(觉醒挑战界面.拖到前4层)
        mSleep(500)
        tuodong2(觉醒挑战界面.拖动)
        mSleep(500)
        click(random_click(觉醒选择第几层[3][1],觉醒选择第几层[3][2]))
      end
      选过几层了 = true
      刚才在打妖气 = false
      mSleep(1000)
    end
    if 功能 == 3 and 觉醒组队单刷 == 1 then
      showHD_b("觉醒挑战界面-单刷")
      click(random_click(觉醒挑战界面.挑战[1],觉醒挑战界面.挑战[2],20))
    elseif 功能 == 4 and 御魂组队单刷 == 1 then
      showHD_b("御魂挑战界面-单刷")
      click(random_click(觉醒挑战界面.挑战[1],觉醒挑战界面.挑战[2],20))
    else 
      showHD_b("御魂觉醒挑战界面-组队")
      click(random_click(觉醒挑战界面.组队[1],觉醒挑战界面.组队[2],20))
      开始时间 = mTime()
      for i=1,10 do
        if multiColor(组队界面有左边,90) or multiColor(组队界面有左边1,90) or multiColor(组队界面,90) then
          break
        end
        mSleep(1000)
      end
    end
  else
    click(random_click(觉醒挑战界面.关闭[1],觉醒挑战界面.关闭[2]))
  end
  mSleep(2000)
end   

--御灵界面处理
function ui_YuLing()
  showHD_b("御灵界面")
  sysLog("御灵界面")
  if 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
    click(random_click(新觉醒选择界面.关闭[1],新觉醒选择界面.关闭[2]))
  elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
    showHD_b("寄养时间到，去寄养啦")
    click(random_click(御魂选择界面.关闭[1],御魂选择界面.关闭[2]))
  elseif 定期妖气相关() then
    click(random_click(御魂选择界面.关闭[1],御魂选择界面.关闭[2]))
  elseif 正在任务切换途中 then
    click(random_click(御魂选择界面.关闭[1],御魂选择界面.关闭[2]))
  elseif 功能 == 21 then
    click(random_click(御灵选种类界面[刷御灵设置][1],御灵选种类界面[刷御灵设置][2]))
    for i=1,10 do
      if multiColor(御灵挑战界面,90) then
        mSleep(1000)
        break
      end
      mSleep(1000)
    end
  else
    click(random_click(御灵界面.关闭[1],御灵界面.关闭[2]))
  end
  mSleep(random_time())
end       

--御灵挑战界面处理
function ui_YuLingTiaoZhan()
  showHD_b("御灵挑战界面")
  if 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
    click(random_click(御灵挑战界面.关闭[1],御灵挑战界面.关闭[2]))
  elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
    showHD_b("寄养时间到，去寄养啦")
    click(random_click(御灵挑战界面.关闭[1],御灵挑战界面.关闭[2]))
  elseif 定期妖气相关() then
    click(random_click(御灵挑战界面.关闭[1],御灵挑战界面.关闭[2]))
  elseif 正在任务切换途中 then
    click(random_click(御灵挑战界面.关闭[1],御灵挑战界面.关闭[2]))
  elseif 功能 == 21 then
    click(御灵选层[刷御灵设置几层][1],御灵选层[刷御灵设置几层][2])
    mSleep(1000)
    click(御灵选层[刷御灵设置几层][1],御灵选层[刷御灵设置几层][2])
    mSleep(1000)
    click(random_click(御灵挑战界面.挑战[1],御灵挑战界面.挑战[2]))
  else
    click(random_click(御灵挑战界面.关闭[1],御灵挑战界面.关闭[2]))
  end
  mSleep(2000)
end

--个人突破界面处理
function ui_PersonTuPo()
  sysLog("个人突破")
  sysLog("是否突破卷满"..是否突破卷满)
  showHD_b("个人突破")
  mSleep(500)
  是否换式神 = false
  正在组队 = false
  if 功能 == 88 and 日常步骤 == 7 then
    click(random_click(个人突破.刷新[1],个人突破.刷新[2]))
    mSleep(2000)
    click(random_click(提示框.确定[1],提示框.确定[2]))
    日常步骤 = 8 
    自动刷新 = 3
    mSleep(2000)
  elseif 功能 == 6 then
    click(random_click(个人突破.阴阳寮[1],个人突破.阴阳寮[2]))
  elseif 是否突破卷满 == 0 and 自动阴阳寮 == 1 and (功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 5 or 功能 == 30 or 功能 == 8 or 功能 == 11 or 功能 == 7) and ((阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间) or 正在进行这一轮突破) then
    sysLog("自动阴阳寮")
    click(random_click(个人突破.阴阳寮[1],个人突破.阴阳寮[2]))
  elseif multiColor2(判断卷是0,93) == false then	
    if (功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能 == 5 or 功能 == 8 or 功能 == 11) and 自动突破 == 1 and 是否突破卷满 == 0 then
      sysLog("是否突破卷满=0")
      click(random_click(个人突破.关闭[1],个人突破.关闭[2]))
    else
      if (功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能 == 5 or 功能 == 8 or 功能 == 11) and 自动突破 == 1 and 自动刷新 == 3 and (计算个人突破次数() >= 3 or 计算九场刷新用() >= 9) then
        if isColorArray(个人突破.刷新,90) then	
          click(random_click(个人突破.刷新[1],个人突破.刷新[2]))
          mSleep(2000)
          click(random_click(提示框.确定[1],提示框.确定[2]))
          mSleep(2000)
        end
        是否突破卷满 = 0
        click(random_click(个人突破.关闭[1],个人突破.关闭[2]))
      elseif 自动刷新 == 3 and (计算个人突破次数() >= 3 or 计算九场刷新用() >= 9) then
        if isColorArray(个人突破.刷新,90) then
          click(random_click(个人突破.刷新[1],个人突破.刷新[2]))
          mSleep(2000)
          click(random_click(提示框.确定[1],提示框.确定[2]))
          mSleep(2000)
        end
        if 功能 == 88 and 日常步骤 == 8 then
          click(random_click(个人突破.关闭[1],个人突破.关闭[2]))
          日常步骤 = 9
        elseif 功能~= 7 and 自动突破 == 1 then
          是否突破卷满 = 0
          click(random_click(个人突破.关闭[1],个人突破.关闭[2]))
        end
      elseif 计算九场刷新用() >= 9 and 自动刷新 == 4  then
        if isColorArray(个人突破.刷新,90) then
          个人第几个 = 1
          click(random_click(个人突破.刷新[1],个人突破.刷新[2]))
          mSleep(2000)
          click(random_click(提示框.确定[1],提示框.确定[2]))
          mSleep(2000)
        end
      else
        if 自动刷新 == 4 then
          sysLog("自动刷新 = "..自动刷新)
          for i=1,#个人突破选择 do
            if isColorArray(个人突破失败判定用[i],90) then
              click(random_click(个人突破选择[i][1],个人突破选择[i][2]))
              mSleep(2000)
              if 个人攻击() then
                进入战斗切换 = true
                sysLog("个人攻击 = "..i)
                mSleep(2000)
                进入个人突破 = true
                break
              end
            end
          end
        elseif 自动刷新 == 3 then
          sysLog("自动刷新 == 3")
          计算个人突破对手()
          mSleep(2000)
          if 个人攻击() then
            进入战斗切换 = true
            mSleep(2000)
            进入个人突破 = true
          else
            click(random_click(个人突破.个人[1],个人突破.个人[2]))
          end
        end
      end
    end
  else
    是否突破卷满 = 0
    click(random_click(个人突破.关闭[1],个人突破.关闭[2]))
    if 功能 == 7 then
      if 个人突破结束 == 1 then
        lockDevice()
        setStringConfig("lua_exit","欢迎回来，上次因为个人突破次数不足而停止脚本。")
        lua_exit()
      else
        功能 = 8
      end
    end
  end
  mSleep(random_time())
end

--寮突破界面
function ui_LiaoTuPo()
  --showHUD(id,"阴阳寮突破",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
  sysLog("阴阳寮突破")
  showHD_b("阴阳寮突破")
  是否换式神 = false
  进入阴阳寮突破 = true
  正在组队 = false
  首次进入组队详情 = true
  选过几层了 = false
  if ((功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 5 or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能 == 8 or 功能 == 11 or 功能 == 7 or 功能 == 6) and 自动阴阳寮 == 1 and ((阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间) or 正在进行这一轮突破 )) or (功能 == 6 and 突破等待 == 1) or (功能 == 6 and ((阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间) or 正在进行这一轮突破 )) then
    if (功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 5 or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能 == 8 or 功能 == 11 or 功能 == 7 or 功能 == 6) and 自动阴阳寮 == 1 and 阴阳寮第几个 > 3 then
      click(random_click(个人突破.关闭[1],个人突破.关闭[2]))
      阴阳寮第几个 = 1
      本轮阴阳寮开始 = false	
      if 阴阳寮now ~= 阴阳寮last then
        阴阳寮last = 阴阳寮now
        阴阳寮开始时间 = mTime() + 30*1000 + 600*1000
        if 寮突破CD == 2 then
          local 随机加时 = math.random(1,120)
          阴阳寮开始时间 = 阴阳寮开始时间 + 随机加时*1000
        elseif 寮突破CD == 3 then
          local 随机加时 = math.random(120,300)
          阴阳寮开始时间 = 阴阳寮开始时间 + 随机加时*1000
        end
        sysLog("阴阳寮开始时间"..阴阳寮开始时间)
      end
      阴阳寮now = 阴阳寮now + 1
      正在进行这一轮突破 = false
    else
			for i=1,6 do
				if 阴阳寮第几个 > 3 then
        sysLog("阴阳寮第几个>3")
        click(random_click(个人突破.关闭[1],个人突破.关闭[2]))
        阴阳寮第几个 = 1
        本轮阴阳寮开始 = false	
        if 阴阳寮now ~= 阴阳寮last then
          阴阳寮last = 阴阳寮now
          阴阳寮开始时间 = mTime() + 30*1000 + 600*1000
          if 寮突破CD == 2 then
            local 随机加时 = math.random(1,120)
            阴阳寮开始时间 = 阴阳寮开始时间 + 随机加时*1000
          elseif 寮突破CD == 3 then
            local 随机加时 = math.random(1,300)
            阴阳寮开始时间 = 阴阳寮开始时间 + 随机加时*1000
          end
          sysLog("阴阳寮开始时间"..阴阳寮开始时间)
        end
        阴阳寮now = 阴阳寮now + 1
        正在进行这一轮突破 = false
        mSleep(1000)
      else
        local need_break = false
        for i=阴阳寮第几个,#阴阳寮选择 do
          --sysLog("阴阳寮第几个"..i)
          正在进行这一轮突破 = true
          阴阳寮第几个 = i+1
          if i <= 0 then
            i = 1
          elseif i > 3 then
            i = 3
          end
          if isColorArray(判断是否有寮[i],93) == false then
            showHD_b(i.."号有寮，今天打了"..打了几次阴阳寮.."次")
            need_break = false
            click(random_click(阴阳寮选择[i][1],阴阳寮选择[i][2],60))
            mSleep(1000)
            click(random_click(阴阳寮选择[i][1],阴阳寮选择[i][2],60))
            mSleep(1000)
            if 阴阳寮接受邀请处理() then
              break
            end
            if 这个寮是否击破() == true then
              阴阳寮击破记录[i] = 1
            end
            if 是否下拉阴阳寮 == 4 then
              --if 新计算阴阳寮对手() then
              if 最新计算阴阳寮对手() then
                mSleep(500)
                if 阴阳寮攻击() then
                  进入战斗切换 = true
                  打标记次数 = 0
                  break
                else
                  click(random_click(阴阳寮选择.点击[1],阴阳寮选择.点击[2]))									
                  break
                end
              elseif 判断击破() then
                break
              else
                local need_break = false
                for i=1,15 do
                  --tuodong3(阴阳寮突破.拖动)
                  tuodong_canshu(阴阳寮突破.拖动1,3,200,10)
                  mSleep(500)
                  if 最新计算阴阳寮对手() then
                    mSleep(500)
                    if 阴阳寮攻击() then
                      进入战斗切换 = true
                      打标记次数 = 0
                      need_break = true
                      break
                    else
                      click(random_click(阴阳寮选择.点击[1],阴阳寮选择.点击[2]))
                      need_break = true
                      break
                    end
                  elseif 判断击破() then
                    break
                  end
                end
                if need_break then
                  break
                end
              end
            elseif 是否下拉阴阳寮 == 2 then
              计算选手()
              if #临时对手 == 0 then	
                tuodong3(阴阳寮突破.拖动)
                mSleep(500)
                计算选手()
                local 随机对手 = math.random(1,#对手选择)
                click(random_click(对手选择[随机对手][1],对手选择[随机对手][2]))
                mSleep(2000)
                if 阴阳寮接受邀请处理() then
                  break
                end
                if 阴阳寮攻击() then
                  进入战斗切换 = true
                  打标记次数 = 0
                  break
                else
                  click(random_click(阴阳寮选择.点击[1],阴阳寮选择.点击[2]))
                end
              else
                local 随机对手 = math.random(1,#临时对手)
                click(random_click(临时对手[随机对手][1],临时对手[随机对手][2]))
                mSleep(2000)
                if 阴阳寮接受邀请处理() then
                  break
                end
                if 阴阳寮攻击() then
                  进入战斗切换 = true
                  break
                else
                  click(random_click(阴阳寮选择.点击[1],阴阳寮选择.点击[2]))
                end
              end
            elseif 是否下拉阴阳寮 == 3 then
              click(random_click(对手选择[1][1],对手选择[1][2]))
              mSleep(3000)
              if 阴阳寮接受邀请处理() then
                break
              end
              if 阴阳寮攻击() then
                进入战斗切换 = true
                break
              else
                click(random_click(阴阳寮选择.点击[1],阴阳寮选择.点击[2]))
              end
            elseif 是否下拉阴阳寮 == 1 then
              for j=1,15 do
                if 阴阳寮接受邀请处理() then
                  break
                end
                if 判断击破() then
                  showHD_b("下拉，找到破了，开打")
                  计算选手()
                  if #临时对手 ~=0 then
                    local 随机对手 = math.random(1,#临时对手)
                    click(random_click(对手选择[随机对手][1],对手选择[随机对手][2]))
                    mSleep(1000)
                    --if 选择阴阳寮对手() then
                    if 阴阳寮攻击() then
                      进入战斗切换 = true
                      need_break = true
                    else
                      click(random_click(阴阳寮选择.点击[1],阴阳寮选择.点击[2]))
                    end
                  else
                    tuodong(阴阳寮突破.拖动[3],阴阳寮突破.拖动[4],阴阳寮突破.拖动[1],阴阳寮突破.拖动[2])
                    mSleep(500)
                    计算选手()
                    if #临时对手 ~=0 then
                      local 随机对手 = math.random(1,#临时对手)
                      click(random_click(对手选择[随机对手][1],对手选择[随机对手][2]))												
                    else
                      local 随机对手 = math.random(1,#对手选择)
                      click(random_click(对手选择[随机对手][1],对手选择[随机对手][2]))
                    end
                    mSleep(1000)
                    --选择阴阳寮对手()
                    if 阴阳寮攻击() then
                      进入战斗切换 = true
                      need_break = true
                    else
                      click(random_click(阴阳寮选择.点击[1],阴阳寮选择.点击[2]))
                    end
                  end
                  break
                else
                  showHD_b("下拉，没找到破，继续拉")
                  tuodong3(阴阳寮突破.拖动)
                  mSleep(500)
                end
              end
              mSleep(1000)
              if need_break  then
                break
              end
            end
          else
            showHD_b(i.."号位置没阴阳寮，跳过")
          end
        end
      end
			end
		end
  else
    click(random_click(个人突破.关闭[1],个人突破.关闭[2]))
  end
  local 击破几个寮 = 0
  for i=1,#阴阳寮击破记录 do
    if 阴阳寮击破记录[i] == 1 then
      击破几个寮 = 击破几个寮 +1
    end
  end
  if 击破几个寮 == 3 then
    if 功能 == 6 then
      showHD_b("阴阳寮全破，即将结束脚本")
      for i=1,10 do
        vibrator()
        mSleep(1000)
      end
      lockDevice()
      mSleep(100)
      lua_exit()
    else						
      自动阴阳寮 = 0
    end
  end
  mSleep(random_time())	
  
end


--邮件界面处理
function ui_Mail()
  sysLog("邮件界面")
  showHD_b("邮件界面")
  if 体力不足 ==  1 then
    if 买过体力了 then
      click(random_click(邮件界面.关闭[1],邮件界面.关闭[2]))
      买过体力了 = false
      mSleep(2000)
    elseif isColorArray(邮件界面.收取,90) then
      sysLog("邮件界面.收取")
      showHD_b("邮件界面-收取")
      if multiColor(邮件有体力附件,90) then
        if 买体力次数 <= 0 then
          lockDevice()
          setStringConfig("lua_exit","欢迎回来，上次因为领取体力次数不足而停止脚本。")
          lua_exit()
        end
        找信index = 1
        click(random_click(邮件界面.收取[1],邮件界面.收取[2]))
        买体力次数 = 买体力次数 -1
        买过体力了 = true
        mSleep(5000)
      else
        找信index = 找信index +1
        if 找信index > 4 then
          找信index = 1
          tuodong(邮件界面.拖动[3],邮件界面.拖动[4],邮件界面.拖动[1],邮件界面.拖动[2])
          mSleep(1000)
        end
        keepScreen(false)
        keepScreen(true)
        找附件信(找信index)
      end
    else
      showHD_b("邮件界面-拖动")
      tuodong3(邮件界面.拖动)
      mSleep(1000)
      keepScreen(false)
      keepScreen(true)
      if 找普通信() then
        showHD_b("邮件界面-找到普通信")
        if 找附件信(1) then
          showHD_b("邮件界面-找到附件信")
          sysLog("邮件界面.未读")
          mSleep(2000)
        else
          showHD_b("没有附件信，往回拖动")
          tuodong(邮件界面.拖动[3],邮件界面.拖动[4],邮件界面.拖动[1],邮件界面.拖动[2])
          mSleep(1000)
          keepScreen(false)
          keepScreen(true)
          找附件信(1)
        end
      else
        showHD_b("没有普通信，继续拖动")
      end
    end
  else
    click(random_click(邮件界面.关闭[1],邮件界面.关闭[2]))
  end
  mSleep(random_time())
  
end

--妖气封印界面处理
function ui_YaoQiFengYin()
  sysLog("妖气封印界面")
  if 发现了石距  then
    click(random_click(妖气封印界面.挑战[1],妖气封印界面.挑战[2]))
  else
    click(random_click(妖气封印界面.关闭[1],妖气封印界面.关闭[2]))
  end
  mSleep(random_time())
end

--妖气开组界面处理
function ui_YaoQiStart()
  sysLog("妖气开组界面")
  if 发现了石距  then
    if isColorArray(妖气开组界面.所有人可见,90) then
      click(random_click(妖气开组界面.所有人可见[1],妖气开组界面.所有人可见[2]))
      mSleep(1000)
    end
    click(random_click(妖气开组界面.创建[1],妖气开组界面.创建[2]))
  else
    click(random_click(妖气开组界面.点击[1],妖气开组界面.点击[2]))
  end
  mSleep(random_time())
end

--好友界面处理
function ui_friend()
  
  sysLog("好友界面处理")
  if 功能 == 88 and 日常步骤 == 0 then
    for i = 1,3 do
      for j=1,#送心位置-1 do
        click(送心位置[j][1],送心位置[j][2])
        --sysLog("送心处理:"..i..",好友:"..j)
        mSleep(500)
      end
    end
    if 不做日常祈愿和强化 == 0 then
      日常步骤 = 1
    else
      日常步骤 = 2
    end
    click(random_click(好友界面.关闭[1],好友界面.关闭[2]))
  elseif 自动接受好友申请 == 1 then
    click(random_click(好友界面.添加[1],好友界面.添加[2]))
  else
    mSleep(7000)
    click(random_click(好友界面.关闭[1],好友界面.关闭[2]))
    mSleep(random_time())
  end
  
  mSleep(random_time())
end

----------------根据当前界面分类处理
function findui()
  
  if multiColor2(悬赏邀请,90) then
    --悬赏邀请
    Reward_Invitation()
    
  elseif multiColor2(悬赏邀请1536,90) then
       	--悬赏邀请
     	Reward_Invitation1()
    
  elseif multiColor2(战斗中,90) then
    --战斗中
    In_Battle()
    
  elseif multiColor2(来电界面,90) then
    showHD_b("来电界面")
    sysLog("来电界面")
    mSleep(5000)
    
  elseif multiColor2(樱花提示,90) then
    showHD_b("樱花提示")
    sysLog("樱花提示")
    click(random_click(樱花提示.点击[1],樱花提示.点击[2]))
    mSleep(1000)
    
  elseif multiColor2(被顶号了,90) then
    showHD_b("被顶号了")
    sysLog("被顶号了")
    click(random_click(被顶号了.点击[1],被顶号了.点击[2]))
    mSleep(2000)
    
  elseif multiColor2(在其他设备登陆,90) then
    sysLog("在其他设备登陆")
    showHD_b("在其他设备登陆")
    click(random_click(在其他设备登陆.点击[1],在其他设备登陆.点击[2]))
    mSleep(2000)
    
  elseif  multiColor2(体力不足界面,90) then
    --体力不足界面
    Lack_of_strength()
    
  elseif 功能 ~= 8 and 功能 ~= 50 and (multiColor2(组队界面有左边,90) or multiColor2(组队界面有左边1,90)) then
    --组队界面有左边
    Creat_team_left()
    
  elseif multiColor2(组队邀请,90) then
    --组队邀请
    Team_invitation()
    
  elseif multiColor2(点开组队邀请,90) then
    click(random_click(点开组队邀请.点击[1],点开组队邀请.点击[2]))
    mSleep(1000)
    
  elseif multiColor2(组队界面,90) then
    --组队界面
    Team()
    
  elseif (multiColor2(战斗准备,90) or multiColor2(战斗准备1,90)) then
    --战斗准备
    Battle_prepare()
    
  elseif multiColor2(观战界面,90) or multiColor2(观战界面1,90) then
    --观战界面
    Look_battle()
    
  elseif multiColor2(更换式神界面,90) or multiColor2(更换式神界面1,90) or multiColor2(更换式神界面2,90) or multiColor2(更换式神界面3,90) or multiColor2(更换式神界面4,90) or multiColor2(更换式神界面日服,90) then
    --更换式神界面
    Change_god()
    
  elseif multiColor2(退出战斗,93) then
    sysLog("退出战斗")
    click(random_click(退出战斗.取消[1],退出战斗.取消[2]))
    mSleep(1000)
    
  elseif multiColor2(更换式神界面出御魂,90) then
    sysLog("更换式神界面出御魂")
    click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
    mSleep(500)
    
  elseif multiColor2(游戏公告,93) then
    sysLog("游戏公告")
    click(random_click(游戏公告.关闭[1],游戏公告.关闭[2]))
    mSleep(random_time())
    
  elseif multiColor2(战斗结束领奖,90) then
    --战斗结束领奖
    Receive_rewards()
    
  elseif multiColor2(领奖结束,90) then
    --领奖结束
    Finish_rewards()
    
  elseif 战斗结束后点开了人() then
    sysLog("战斗结束后点开了人")
    click(random_click(更换式神界面.返回[1],更换式神界面.返回[2]))
    mSleep(random_time())
    
  elseif multiColor2(退出探索,90) or multiColor2(退出探索日服,90) then
    sysLog("退出探索")
    click(random_click(退出探索.确认退出[1],退出探索.确认退出[2]))
    if ipad没有缩放 and (w == 1536 or w == 2048) then
      setScreenScale(768,1024)
      重写推图参数()
    end
    mSleep(random_time())
    
  elseif multiColor2(阴阳寮申请,90) or multiColor2(阴阳寮申请1,90)  then
    --阴阳寮申请
    ui_TeamRequest()
    
  elseif multiColor2(挂机御魂邀请界面,90) or multiColor2(挂机御魂邀请界面1,90) or multiColor2(挂机御魂邀请界面日服,90) then
    --挂机御魂邀请界面
    ui_YuhunRequest()
    
  elseif multiColor2(创建队伍,90) then
    --创建队伍
    ui_TeamCreat()
    
  elseif multiColor2(式神育成界面,90) then
    --式神育成界面
    ui_GodGrowUp()
    
  elseif multiColor2(新好友寄养界面,90) then
    --新好友寄养界面
    FriendGodGrowUp()
    
  elseif multiColor2(结界界面,90) or multiColor2(结界界面竹林,90) or multiColor2(结界界面斗鱼,90) then
    --结界界面
    ui_JjAttack()
    
  elseif multiColor2(祈愿界面,90) then
    --祈愿界面
    ui_Pray()  
    
  elseif multiColor2(阴阳寮界面,90) or multiColor2(阴阳寮界面1,90) then
    --阴阳寮界面
    ui_Home()
    
  elseif multiColor2(阴阳寮界面没有寮,90) then
    sysLog("阴阳寮界面没有寮")
    click(random_click(阴阳寮界面.关闭[1],阴阳寮界面.关闭[2]))
    mSleep(1000)
    
  elseif multiColor2(停止运行,90) then
    sysLog("停止运行")
    click(random_click(停止运行.确定[1],停止运行.确定[2]))
    mSleep(random_time())
    
  elseif multiColor2(组队详情,90) then
    --组队详情
    ui_TeamDetail()
    
  elseif multiColor2(组队详情日服,90) then
    --组队详情1
    ui_TeamDetail1()
    
  elseif multiColor3(商店街,92,4)  then
    click(random_click(商店街.退出[1],商店街.退出[2]))
    mSleep(random_time())
    
  elseif multiColor2(土蜘蛛界面,92)  then
    正在组队 = false
    click(random_click(土蜘蛛界面.挑战[1],土蜘蛛界面.挑战[2]))
    mSleep(random_time())
    
  elseif multiColor2(庭院更换站街式神,92)  then
    click(random_click(庭院更换站街式神.关闭[1],庭院更换站街式神.关闭[2]))
    mSleep(random_time())
    
  elseif multiColor2(更换式神界面出御魂,90) then 
    click(random_click(更换式神界面出御魂.关闭[1],更换式神界面出御魂.关闭[2]))
    mSleep(1000)
    
  elseif multiColor2(聊天界面,92) or multiColor2(聊天界面1,92) then
    sysLog("聊天界面")
    mSleep(10000)
    if 功能 ==  101  then
      if isColorArray(聊天界面.阴阳寮,90)  == false  then
        click(random_click(聊天界面.阴阳寮[1],聊天界面.阴阳寮[2]))
      elseif 找聊天组队() then
      end
    else
      找关闭按钮()
    end
    mSleep(1000)
    
  elseif multiColor2(点击检查更新,92) then
    sysLog("点击检查更新")
    click(random_click(点击检查更新.点击[1],点击检查更新.点击[2]))
    mSleep(3000)
    if multiColor(提示框,90) then
      click(random_click(提示框.确定[1],提示框.确定[2]))
    end
    mSleep(random_time())
  elseif multiColor2(输入法界面,92) then
    sysLog("输入法界面")
    click(random_click(输入法界面.点一下[1],输入法界面.点一下[2]))
    mSleep(random_time())        
  elseif multiColor2(申请加好友,92) then
    sysLog("申请加好友")
    click(random_click(申请加好友.取消[1],申请加好友.取消[2]))
    mSleep(random_time())
    
  elseif multiColor2(推图中,90) then
    --推图中界面处理
    sysLog("推图处理")
    ui_TuiTu()
    
  elseif multiColor2(跳过对话,90) then
    click(random_click(跳过对话.点击[1],跳过对话.点击[2]))
    mSleep(random_time()) 
    
  elseif 功能 == 2 and 找剧情对话()  then
    mSleep(2000)
    
  elseif 功能==2 and 找小怪() then
    
  elseif 功能==2 and 大眼睛() then
    
  elseif 功能==2 and 问号() then
    
  elseif multiColor2(快进,90) then
    sysLog("快进:"..快进.点击[1])
    click(random_click(快进.点击[1],快进.点击[2]))
    mSleep(random_time()) 
    
  elseif multiColor2(新快进,90) then
    sysLog("新快进:"..新快进.点击[1])
    click(random_click(新快进.点击[1],新快进.点击[2]))
    mSleep(random_time()) 
    
  elseif  multiColor2(战斗回放界面,90) then
    click(random_click(战斗回放界面.关闭[1],战斗回放界面.关闭[2]))
    mSleep(random_time()) 
    
  elseif  功能 ~= 50 and multiColor2(新觉醒选择界面,90) then
    --新觉醒选择界面
    ui_JueXingNew()
    
  elseif multiColor2(组队探索界面,90) then
    --组队探索界面
    ui_TanSuoZuDui()
    
  elseif  multiColor2(副本探索界面,90) then
    --副本探索界面
    ui_TanSuo()
    
  elseif multiColor2(副本式神挑战界面,90) then
    --式神挑战界面
    ui_ShiShenTiaoZhan()
    
  elseif multiColor2(御魂选择界面,90) then
    --御魂选择界面
    ui_YuHunSelect()
    
  elseif multiColor2(御灵界面,90) then
    --御灵界面处理
    ui_YuLing()
    
  elseif multiColor2(业原火挑战界面,90) then
    --业原火挑战界面
    ui_YeYuanHuo()
    
  elseif 功能 ~= 8 and 功能 ~= 50 and multiColor2(觉醒挑战界面,90) then
    --觉醒界面处理
    ui_JueXing()
    
  elseif multiColor2(御灵挑战界面,90) then
    --御灵挑战界面处理
    ui_YuLingTiaoZhan()
    
  elseif 功能 ~= 50 and multiColor2(个人突破,90) then
    --个人突破界面处理
    ui_PersonTuPo()
    
  elseif 功能 ~= 50 and multiColor2(阴阳寮突破,93) then
    --寮突破界面处理
    ui_LiaoTuPo()
    
  elseif multiColor2(购买体力,90) then
    sysLog("购买体力")
    click(random_click(购买体力.购买[1],购买体力.购买[2]))
    买过体力了 = true
    mSleep(random_time())
    
  elseif multiColor2(邮件界面,90) or multiColor2(邮件界面模拟器,90) then
    --邮件界面处理
    ui_Mail()
    
  elseif multiColor2(模拟器无响应,90) then
    sysLog("模拟器无响应")
    click(random_click(模拟器无响应.确定[1],模拟器无响应.确定[2]))
    mSleep(random_time())
    --elseif multiColor2(模拟器无响应天天,90) then
    --  sysLog("模拟器无响应天天")
    --  click(random_click(模拟器无响应天天.确定[1],模拟器无响应天天.确定[2]))
    --  mSleep(random_time())
    
  elseif multiColor2(邀请队友,90) then
    sysLog("邀请队友")
    click(random_click(邀请队友.取消[1],邀请队友.取消[2]))
    mSleep(random_time())
    
  elseif multiColor2(百鬼点开了说明,95) then
    sysLog("百鬼点开了说明")
    click(random_click(百鬼点开了说明.点一下[1],百鬼点开了说明.点一下[2]))
    mSleep(1000)
    
  elseif multiColor2(妖气封印界面,93) then
    --妖气封印界面处理
    ui_YaoQiFengYin()
    
  elseif multiColor2(妖气开组界面,93) then
    --妖气开组界面处理
    ui_YaoQiStart()
    
  elseif multiColor2(妖气开组界面日服,93) then
    sysLog("妖气开组界面")
    if 发现了石距  then
      if isColorArray(妖气开组界面日服.所有人可见,90) then
        click(random_click(妖气开组界面日服.所有人可见[1],妖气开组界面日服.所有人可见[2]))
        mSleep(1000)
      end
      click(random_click(妖气开组界面日服.创建[1],妖气开组界面日服.创建[2]))
    else
      click(random_click(妖气开组界面日服.点击[1],妖气开组界面日服.点击[2]))
    end
    mSleep(random_time())
    
  elseif multiColor2(好友界面,90) or multiColor2(好友界面1,90) then
    --好友界面处理
    ui_friend()
    
  elseif multiColor2(评论界面,90) then
    click(random_click(评论界面.关闭[1],评论界面.关闭[2]))
    mSleep(random_time())
  elseif multiColor2(实名认证,90) then
    click(random_click(实名认证.点击[1],实名认证.点击[2]))
    mSleep(random_time())
  elseif multiColor2(确认实名,90) then
    click(random_click(确认实名.点击[1],确认实名.点击[2]))
    mSleep(random_time())
  elseif multiColor2(任务界面,90) then
    --任务界面
    ui_Task()
    
  elseif multiColor2(式神录界面,90) or multiColor2(式神录界面170520,90) then
    sysLog("式神录界面")
    if 功能 == 88 and 日常步骤 == 1 then
      click(random_click(式神录界面.详细[1],式神录界面.详细[2]))
    else
      click(random_click(式神录界面.退出[1],式神录界面.退出[2]))
    end
    mSleep(random_time())
    
  elseif multiColor2(式神详情界面,90) or multiColor2(式神详情界面170520,90) then
    sysLog("式神详情界面")
    if 功能 == 88 and 日常步骤 == 1 then
      click(random_click(式神详情界面.御魂[1],式神详情界面.御魂[2]))
    else
      click(random_click(式神录界面.退出[1],式神录界面.退出[2]))
    end
    mSleep(random_time())
    
  elseif multiColor2(式神详情御魂界面,90) or multiColor2(式神详情御魂界面170520,90) then
    sysLog("式神详情御魂界面")
    if 功能 == 88 and 日常步骤 == 1 then
      click(random_click(式神详情御魂界面.更换[1],式神详情御魂界面.更换[2]))
    else
      click(random_click(式神录界面.退出[1],式神录界面.退出[2]))
    end
    mSleep(random_time())
    
  elseif multiColor2(御魂强化界面,90) then
    --御魂强化界面
    YuHunQiangHua()
    
  elseif multiColor2(更换御魂界面,90) then
    ---更换御魂界面
    YuHunChange()
    
  elseif 功能 == 88 and 日常步骤 == 1 and 御魂强化界面找强化() then
    mSleep(random_time())	 
    
  elseif multiColor2(添加好友界面,90) then
    sysLog("添加好友界面")
    if 自动接受好友申请 == 1 and isColorArray(添加好友界面.同意,90) then
      click(random_click(添加好友界面.同意[1],添加好友界面.同意[2]))
      mSleep(random_time())
    end
    click(random_click(添加好友界面.关闭[1],添加好友界面.关闭[2]))
    mSleep(random_time())
    
  elseif multiColor2(个人突破打开了奖励,90) then
    sysLog("个人突破打开了奖励")
    click(random_click(个人突破打开了奖励.点击[1],个人突破打开了奖励.点击[2]))
    mSleep(random_time())
    
  elseif multiColor2(新战斗胜利,90) or multiColor2(战斗胜利,90) or multiColor2(战斗胜利日服,90) or multiColor2(新战斗胜利日服,90) then
    ----战斗胜利
    WinBattle()
    
  elseif multiColor2(战斗失败,90) or multiColor2(战斗失败日服,90) or multiColor2(新战斗失败,90) or multiColor2(新战斗失败日服,90) then
     --战斗失败
     LostBattle()
    
  elseif multiColor2(百鬼夜行界面,90) then
    --百鬼夜行界面
    Hundred_ghost()
    
  elseif multiColor2(百鬼邀请界面,90) or multiColor2(百鬼邀请界面1,90) then
    --百鬼邀请界面
    Hundred_ghost_invite()
    
  elseif multiColor2(选择鬼王界面,90) then
    sysLog("选择鬼王界面")
    mSleep(1000)
    local i = math.random(1,3)
    click(random_click(选择鬼王[i][1],选择鬼王[2][2]))
    mSleep(2000)
    click(random_click(选择鬼王界面.开始[1],选择鬼王界面.开始[2]))
    首次进入撒豆 = true
    mSleep(random_time())
    
  elseif multiColor2(撒豆界面,90) then
    sysLog("撒豆界面")
    showHD_b("撒豆子")
    if 首次进入撒豆 then
      mSleep(3000)
      首次进入撒豆 = false
    elseif isColorArray(撒豆界面.判定冰冻,85) == false and isColorArray(撒豆界面.判定冰冻1,85) == false then
      showHD_b("撒豆子-冰冻暂停撒豆")
      mSleep(200)
    else
      local i = math.random(1,3)
      click(random_click(撒豆位置[i][1],撒豆位置[i][2]))
    end
    mSleep(100)
    
  elseif multiColor2(阴阳术界面,90) then
    sysLog("阴阳术界面")
    click(random_click(阴阳术界面.返回[1],阴阳术界面.返回[2]))
    mSleep(random_time())
    
  elseif multiColor2(百鬼契约书,90) then
    sysLog("百鬼契约书")
    click(random_click(百鬼契约书.点击[1],百鬼契约书.点击[2]))
    -- mSleep(random_time())
    -- tuodong(百鬼契约书.点击[1],百鬼契约书.点击[2],百鬼契约书.点击[1]-100,百鬼契约书.点击[2])
    for i=1,10 do
      if multiColor(庭院界面,90) then
        break
      end
      mSleep(1000)
    end
    mSleep(1000)
    
  elseif multiColor2(网络连接出错,95) then
    sysLog("网络连接出错")
    click(random_click(网络连接出错.点击[1],网络连接出错.点击[2]))
    mSleep(1000)
    
  elseif multiColor2(点开了人物详情,95) then
    sysLog("点开了人物详情")
    click(random_click(点开了人物详情.点一下[1],点开了人物详情.点一下[2]))
    mSleep(random_time())
    
  elseif multiColor2(秘闻副本界面,90) then
    sysLog("秘闻副本界面")
    click(random_click(秘闻副本界面.关闭[1],秘闻副本界面.关闭[2]))
    mSleep(random_time())
    
  elseif multiColor2(式神碎片界面,90) then
    sysLog("式神碎片界面")
    click(random_click(式神碎片界面.关闭[1],式神碎片界面.关闭[2]))
    mSleep(1000)
    
  elseif multiColor2(登陆公告,90) then
    sysLog("登陆公告")
    click(random_click(登陆公告.关闭[1],登陆公告.关闭[2]))
    mSleep(1000)
    
  elseif multiColor2(选择区域,90) then
    sysLog("选择区域")
    click(random_click(选择区域.点击[1],选择区域.点击[2]))
    mSleep(1000)
    
  elseif multiColor2(登陆界面,90) or multiColor2(新登陆界面,90) or multiColor2(登陆界面170520,92) or multiColor2(登陆界面170528,92) then
    sysLog("登陆界面")
    showHD_b("登陆界面")
    if 重连次数 <= 0 then
      sysLog("重连锁频")
      震动锁屏()
      setStringConfig("lua_exit","欢迎回来，上次因为重连次数不足而停止脚本。")
      lua_exit()
    end
    if 重连等待 > 0 then
      for i =0,重连等待*6 do
        showHD_b("延迟重连，正在等待")
        mSleep(9000)
      end
    end
    click(random_click(登陆界面.点击[1],登陆界面.点击[2]))
    showHD_b("剩余重连次数:"..重连次数)
    重连次数 = 重连次数 -1
    mSleep(10000)
    
  elseif multiColor2(点击进入游戏,90) or  multiColor2(新点击进入游戏,90) or  multiColor2(点击进入游戏170520,92) then
    sysLog("点击进入游戏")
    click(random_click(点击进入游戏.点击[1],点击进入游戏.点击[2]))
    mSleep(10000)
    
  elseif multiColor2(登陆后活动界面,90) or multiColor2(登陆后活动界面1,90) or multiColor2(登陆后活动界面日服,90) then
    --登陆后活动界面
    Login_box1()
    
  elseif multiColor2(登陆后活动界面2,90) then
    --登陆后活动界面2
    Login_box2()
    
  elseif multiColor2(登陆后活动界面果盘,90)  or multiColor2(登陆后活动界面海马玩,90) then
    --登陆后活动界面果盘
    Login_box_guopan()
    
  elseif multiColor2(关联手机,90) then
    sysLog("关联手机")
    --showHD("关联手机，关闭")
    click(random_click(关联手机.取消[1],关联手机.取消[2]))
    mSleep(1000)
    
  elseif multiColor2(羁绊提升界面,90) then
    sysLog("关联手机")
    --showHD("关联手机，关闭")
    click(random_click(羁绊提升界面.关闭[1],羁绊提升界面.关闭[2]))
    mSleep(1000)
    
  elseif multiColor2(用户设置界面,90) or multiColor2(用户设置界面170520,90) then
    sysLog("用户设置界面")
    找关闭按钮()
    mSleep(2000)
    
  elseif multiColor2(用户设置界面日服,90) then
    sysLog("用户设置界面")
    找关闭按钮()
    mSleep(2000)
    
  elseif multiColor2(用户协议界面,90) then
    sysLog("用户协议界面")
    click(random_click(用户协议界面.接受[1],用户协议界面.接受[2]))
    mSleep(random_time())
    
  elseif multiColor2(实名认证界面,90) then
    sysLog("实名认证界面")
    click(random_click(实名认证界面.取消[1],实名认证界面.取消[2]))
    mSleep(random_time())
    
  elseif multiColor2(提示框,90) then
    --提示框
    Box_proc()
    
  elseif multiColor2(新提示框,90) then
    ---新提示框
    Box_proc_new()
    
  elseif multiColor2(下载语音包,90) then
    sysLog("下载语音包")
    --showHD("下载语音包")
    click(random_click(下载语音包.取消[1],下载语音包.取消[2]))
    mSleep(1000)
    
  elseif 要打妖怪退治 and multiColor2(妖怪退治挑战,90) then
    sysLog("妖怪退治挑战")
    showHD_b("妖怪退治挑战")
    是否换式神 = false
    click(random_click(妖怪退治挑战.挑战[1],妖怪退治挑战.挑战[2]))
    mSleep(random_time())
    
  elseif 要打妖怪退治 and 地图找宝箱() then
    --要打妖怪退治 图找宝箱
     AttackGhost_Find()
    
  elseif  multiColor2(庭院界面,90) then
    --111庭院界面
     At_home()
     
  elseif (功能 == 1 or 功能 == 3  or 功能 == 4  or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能== 6 or 功能== 9 or 功能== 10  or 功能== 11) and (multiColor2(主界面,92) or multiColor2(主界面1,92) or multiColor2(主界面没打开卷轴,90) or multiColor2(主界面打开卷轴,90)) then
    ---1 3 4 6 9 10 11 20 21 30 主界面
    Main_ui_proc_1()
    
  elseif 功能 == 88 and (multiColor2(主界面,92) or multiColor2(主界面1,92) or multiColor2(主界面没打开卷轴,90) or multiColor2(主界面打开卷轴,90)) then
    --功能88 一键日常任务
    onekey_dailytask()
    
  elseif 功能 == 8 and (multiColor2(主界面,92) or multiColor2(主界面1,92) or multiColor2(主界面没打开卷轴,90) or multiColor2(主界面打开卷轴,90)) then
    ----8主界面
    Main_ui_proc_2()
    
  elseif (功能 == 6 or 功能 == 7 or 功能 == 30) and (multiColor2(主界面,92) or multiColor2(主界面1,92) or multiColor2(主界面没打开卷轴,90) or multiColor2(主界面打开卷轴,90)) then
    ---6 7 30主界面
    Main_ui_proc_3()
    
  elseif 功能 == 5 and (要打妖怪退治 or 要打鬼王 )and (multiColor2(主界面,92) or multiColor2(主界面1,92) or multiColor2(主界面没打开卷轴,90) or multiColor2(主界面打开卷轴,90)) then
    sysLog("妖气自动阴阳寮")
    showHD_b("妖怪退治")
    刚进入组队界面 = true
    庭院找町中()
    mSleep(random_time())
    
  elseif 功能 == 5 and 自动阴阳寮 == 1 and (mTime() > 阴阳寮开始时间 or 正在进行这一轮突破) and (multiColor2(主界面,92) or multiColor2(主界面1,92) or multiColor2(主界面没打开卷轴,90) or multiColor2(主界面打开卷轴,90)) then
    sysLog("妖气自动阴阳寮")
    showHD_b("妖气-自动阴阳寮")
    tuodong4(登陆后活动界面.拖动)
    tuodong4(登陆后活动界面.拖动)
    mSleep(1000)
    刚进入组队界面 = true
    click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
    mSleep(random_time())
    
  elseif 功能 == 5 and (multiColor2(主界面1,90) or multiColor2(主界面打开卷轴,90)) then
    ---5主界面1
    Main_ui_proc_4()
    
  elseif 功能 == 102 and (multiColor2(主界面1,90) or multiColor2(主界面1,92) or multiColor2(主界面没打开卷轴,90) or multiColor2(主界面打开卷轴,90)) then
    sysLog("102主界面1")
    从觉醒挑战界面进入 = false
    if mTime() - 结界计算时间 > 寄养间隔*60*1000 then
      if multiColor(主界面,92) or multiColor(主界面没打开卷轴,90) then
        click(random_click(主界面.打开菜单[1],主界面.打开菜单[2]))
        mSleep(1000)
      end
      click(random_click(主界面.阴阳寮[1],主界面.阴阳寮[2]))
    elseif 定期妖气相关() then
      showHD_b("庭院界面-定期妖气")
      if multiColor(主界面,92) or multiColor(主界面没打开卷轴,90) then
        click(random_click(主界面.打开菜单[1],主界面.打开菜单[2]))
        mSleep(1000)
      end
      click(random_click(主界面.组队[1],主界面.组队[2]))				
    end
    mSleep(1000)
    
  elseif 功能 == 101 and (multiColor2(主界面,92) or multiColor2(主界面1,92) or multiColor2(主界面没打开卷轴,90) or multiColor2(主界面打开卷轴,90)) then
    sysLog("小号鬼王")
    click(random_click(主界面.聊天[1],主界面.聊天[2]))
    mSleep(random_time())
    
  elseif 功能 == 2 and (multiColor2(主界面,92) or multiColor2(主界面1,92) or multiColor2(主界面没打开卷轴,90) or multiColor2(主界面打开卷轴,90))  then
    sysLog("2主界面")
    找剧情对话() 
    mSleep(2000)
    if multiColor2(提示框,90) then
      click(random_click(提示框.取消[1],提示框.取消[2]))
      mSleep(random_time())
    end
    
  elseif 功能 == 1 and multiColor2(副本大地图,90) then
    --1副本大地图
    FuBen_Map_1()
    
    
  elseif (功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能 == 5 or 功能 == 99 or 功能 == 88  or 功能== 11) and multiColor2(副本大地图,90) then
    --88副本大地图
    FuBen_Map_2()
    
  elseif (功能 == 6 or 功能 == 7) and multiColor2(副本大地图,90) then
    FuBen_Map_3()
    
  elseif 功能 == 8 and multiColor2(副本大地图,90) then
    FuBen_Map_4()
    
  elseif (功能 == 5 or 功能 == 102) and (multiColor2(主界面,92)  or multiColor2(主界面没打开卷轴,90)) then
    sysLog("5主界面")
    click(random_click(主界面.打开菜单[1],主界面.打开菜单[2]))
    mSleep(random_time())
    
  elseif multiColor2(斗技界面,90) then
    sysLog("斗技界面")
    if 功能 == 9 or( 要打妖怪退治 and 是打斗技还是鬼王 == 1 ) then 
      进入战斗切换 = true
      click(random_click(斗技界面.点击[1],斗技界面.点击[2]))
    else
      找关闭按钮()
    end
    mSleep(random_time())
    
  elseif 功能 == 40 and multiColor2(协同斗技界面,90) then
    sysLog("协同斗技界面")
    click(random_click(协同斗技界面.点击[1],协同斗技界面.点击[2]))
    mSleep(random_time())
    
  elseif multiColor2(换皮肤,93) then
    sysLog("换皮肤")
    click(random_click(换皮肤.点击[1],换皮肤.点击[2]))
    mSleep(random_time())
    
  elseif multiColor2(发现妖怪,95) then
    sysLog("发现妖怪")
    click(random_click(发现妖怪.点击[1],发现妖怪.点击[2]))
    mSleep(random_time())
    
  elseif multiColor2(麒麟鬼王地图界面,93) then
    if 要打鬼王 then
      click(random_click(麒麟鬼王地图界面.挑战[1],麒麟鬼王地图界面.挑战[2]))
    else
      click(random_click(妖怪退治红蛋.返回[1],妖怪退治红蛋.返回[2]))
    end
    mSleep(random_time())
    
  elseif multiColor2(麒麟鬼王地图界面1,93) then
    if 要打鬼王 then
      click(random_click(麒麟鬼王地图界面1.挑战[1],麒麟鬼王地图界面1.挑战[2]))
    else
      click(random_click(妖怪退治红蛋.返回[1],妖怪退治红蛋.返回[2]))
    end
    mSleep(random_time())
    
  elseif multiColor2(麒麟鬼王挑战界面,90) then
    if 要打鬼王 and isColorArray(麒麟鬼王挑战界面.挑战,90) then
      click(random_click(麒麟鬼王挑战界面.挑战[1],麒麟鬼王挑战界面.挑战[2]))
      现在在打鬼王 = true
    else
      打完鬼王了 = true
      要打鬼王 = false
      找关闭按钮()
    end
    mSleep(random_time())
    
  elseif multiColor2(阴界之门挑战界面,90) then
    if 要打鬼王 and isColorArray(阴界之门挑战界面.挑战,90) then
      click(random_click(阴界之门挑战界面.挑战[1],阴界之门挑战界面.挑战[2]))
    else
      打完鬼王了 = true
      要打鬼王 = false
      找关闭按钮()
    end
    mSleep(random_time())
    
  elseif multiColor2(断线期间结束战斗,93) then
    sysLog("断线期间结束战斗")
    --showHD("断线期间结束战斗")
    click(random_click(断线期间结束战斗.确定[1],断线期间结束战斗.确定[2]))
    mSleep(random_time())
    
  elseif multiColor2(获得奖励提示,90) or multiColor2(获得奖励提示日服,90) then
    sysLog("获得奖励提示")
    click(random_click(获得奖励提示.点击[1],获得奖励提示.点击[2]))
    mSleep(random_time())
    
  elseif multiColor2(召唤界面,90) then
    sysLog("召唤界面")
    click(random_click(召唤界面.退出[1],召唤界面.退出[2]))
    mSleep(random_time())
    
  elseif multiColor2(召唤界面170520,90) then
    sysLog("召唤界面")
    click(random_click(召唤界面170520.退出[1],召唤界面170520.退出[2]))
    mSleep(random_time())
    
  elseif multiColor2(百绘罗伊,90) then
    sysLog("百绘罗伊")
    --showHD("百绘罗伊，关闭")
    click(random_click(百绘罗伊.关闭[1],百绘罗伊.关闭[2]))
    mSleep(1000)
    
  elseif multiColor2(町中点到人了,92) then
    sysLog("町中点到人了")
    click(random_click(町中点到人了.点击[1],町中点到人了.点击[2]))
    mSleep(1000)
    tuodong4(登陆后活动界面.拖动)
    mSleep(random_time())
    
  else
    --sysLog("其它界面")
    Other_proc()
  end-------------界面判断结束
  
  
end

--------无体力处理
function NoPowerProc()
  if 没有体力了 then
    --if mTime() - 上次战斗时间 > 体力不足判定时间*60*1000 then
    sysLog("体力不足")
    if 体力不足 == 1 then
      sysLog(" 体力不足==1")
      没有体力了 = false
      if multiColor(推图中,90) then
        sysLog("体力不足-推图中")
        click(random_click(推图中.邮件[1],推图中.邮件[2]))
      elseif multiColor(觉醒挑战界面,90) then
        click(random_click(觉醒挑战界面.关闭[1],觉醒挑战界面.关闭[2]))
        mSleep(2000)
        click(random_click(副本大地图.邮件[1],副本大地图.邮件[2]))
      elseif multiColor(组队界面,90) or multiColor(组队界面有左边,90) then
        click(random_click(组队界面.关闭[1],组队界面.关闭[2]))
        mSleep(2000)
        if multiColor(觉醒挑战界面,90) then
          click(random_click(觉醒挑战界面.关闭[1],觉醒挑战界面.关闭[2]))
          mSleep(2000)
          click(random_click(副本大地图.邮件[1],副本大地图.邮件[2]))
        else
          click(random_click(主界面.邮件[1],主界面.邮件[2]))
        end
      elseif multiColor(创建队伍,90) then
        click(random_click(创建队伍.取消[1],创建队伍.取消[2]))
        mSleep(2000)
        if multiColor(组队界面,90) then
          click(random_click(组队界面.关闭[1],组队界面.关闭[2]))
          mSleep(2000)
          if multiColor(觉醒挑战界面,90) then
            click(random_click(觉醒挑战界面.关闭[1],觉醒挑战界面.关闭[2]))
            mSleep(2000)
            click(random_click(副本大地图.邮件[1],副本大地图.邮件[2]))
          else
            click(random_click(主界面.邮件[1],主界面.邮件[2]))
          end
        end
      elseif multiColor(组队详情,90) then
        click(random_click(组队详情.离开队伍[1],组队详情.离开队伍[2]))
        mSleep(2000)
        click(random_click(提示框.确定[1],提示框.确定[2]))
        mSleep(2000)
        if multiColor(创建队伍,90) then
          click(random_click(创建队伍.取消[1],创建队伍.取消[2]))
          mSleep(2000)
          if multiColor(组队界面,90) then
            click(random_click(组队界面.关闭[1],组队界面.关闭[2]))
            mSleep(2000)
            if multiColor(觉醒挑战界面,90) then
              click(random_click(觉醒挑战界面.关闭[1],觉醒挑战界面.关闭[2]))
              mSleep(2000)
              click(random_click(副本大地图.邮件[1],副本大地图.邮件[2]))
            else
              click(random_click(主界面.邮件[1],主界面.邮件[2]))
            end
          end
        end
      elseif multiColor(副本大地图,90) then
        click(random_click(副本大地图.邮件[1],副本大地图.邮件[2]))
      end
      mSleep(3000)
      上次战斗时间 = mTime()
      
    elseif	体力不足 == 2 then
      setStringConfig("lua_exit","欢迎回来，上次因为您选择体力不足锁屏而停止脚本。")
      震动锁屏()
      lua_exit()
    elseif	体力不足 == 7 then
      功能 = 8
      click(random_click(体力不足界面.关闭[1],体力不足界面.关闭[2]))
      mSleep(1000)
    elseif	体力不足 == 3 then
      vibrator()
      setStringConfig("lua_exit","欢迎回来，上次因为您选择体力不足震动而停止脚本。")
      mSleep(30000)
      lua_exit()
    elseif	体力不足 == 4 then
      上次战斗时间 = mTime()
      没有体力了 = false
    elseif	体力不足 == 5 then
      if 买体力次数 <= 0 then
        lockDevice()
        setStringConfig("lua_exit","欢迎回来，上次因为购买体力次数不足而停止脚本。")
        lua_exit()
      end
      click(random_click(体力不足界面.购买[1],体力不足界面.购买[2]))
      买体力次数 = 买体力次数 -1
    elseif	体力不足 == 6 then
      没有体力了 = false
      --是否下拉阴阳寮 = 2
      功能 = 6
      我在肝体力 = 0
      if multiColor(推图中,90) then
        sysLog("体力不足-推图中")
        click(random_click(推图中.退出[1],推图中.退出[2]))
        mSleep(2000)
        click(random_click(推图中.确认退出[1],推图中.确认退出[2]))
      elseif multiColor(觉醒挑战界面,90) then
        click(random_click(觉醒挑战界面.关闭[1],觉醒挑战界面.关闭[2]))
        mSleep(2000)
      elseif multiColor(组队界面,90) or multiColor(组队界面有左边,90) then
        click(random_click(组队界面.关闭[1],组队界面.关闭[2]))
        mSleep(2000)
        if multiColor(觉醒挑战界面,90) then
          click(random_click(觉醒挑战界面.关闭[1],觉醒挑战界面.关闭[2]))
          mSleep(2000)
        end
      elseif multiColor(创建队伍,90) then
        click(random_click(创建队伍.取消[1],创建队伍.取消[2]))
        mSleep(2000)
        if multiColor(组队界面,90) then
          click(random_click(组队界面.关闭[1],组队界面.关闭[2]))
          mSleep(2000)
          if multiColor(觉醒挑战界面,90) then
            click(random_click(觉醒挑战界面.关闭[1],觉醒挑战界面.关闭[2]))
            mSleep(2000)
          end
        end
      elseif multiColor(组队详情,90) then
        click(random_click(组队详情.离开队伍[1],组队详情.离开队伍[2]))
        mSleep(2000)
        click(random_click(提示框.确定[1],提示框.确定[2]))
        mSleep(2000)
        if multiColor(创建队伍,90) then
          click(random_click(创建队伍.取消[1],创建队伍.取消[2]))
          mSleep(2000)
          if multiColor(组队界面,90) then
            click(random_click(组队界面.关闭[1],组队界面.关闭[2]))
            mSleep(2000)
            if multiColor(觉醒挑战界面,90) then
              click(random_click(觉醒挑战界面.关闭[1],觉醒挑战界面.关闭[2]))
              mSleep(2000)
            end
          end
        end
      end
    end
  end
end