require "MyUi"
require "Ui_Proc"
require "MyLibs"
require "data_init"  
require "CommApi"

function 任务表处理(gtype)
if #任务表 == 0 then
  if 次数不足 == 1 then
    震动锁屏()
    if gtype == 5 then
      setStringConfig("lua_exit","欢迎回来，上次因为妖气封印次数不足而停止脚本。")
    elseif gtype == 1 then
      setStringConfig("lua_exit","欢迎回来，上次因为探索次数不足而停止脚本。")
    elseif gtype == 3 then
      setStringConfig("lua_exit","欢迎回来，上次因为觉醒次数不足而停止脚本。")
    elseif gtype == 4 then
      setStringConfig("lua_exit","欢迎回来，上次因为御魂次数不足而停止脚本。")
    elseif gtype == 20 then
      setStringConfig("lua_exit","欢迎回来，上次因为业原火次数不足而停止脚本。")
    elseif gtype == 21 then
      setStringConfig("lua_exit","欢迎回来，上次因为御灵次数不足而停止脚本。")
    elseif gtype == 11 then
      setStringConfig("lua_exit","欢迎回来，上次因为式神挑战次数不足而停止脚本。")
    end
    lua_exit()
  elseif 次数不足 == 2 then
    正在任务切换途中 = true
    正在拒绝当中 = true
    任务切换开始时间 = mTime()
    我在肝体力 = 0
    功能 = 6
  elseif 次数不足 == 5 then
    正在任务切换途中 = true
    正在拒绝当中 = true
    任务切换开始时间 = mTime()-15000
    我在肝体力 = 0
    功能 = 8
  elseif 次数不足 == 6 then
    正在任务切换途中 = true
    正在拒绝当中 = true
    任务切换开始时间 = mTime()-15000
    我在肝体力 = 0
    挂机拒绝邀请 = true
    功能 = 8
  elseif 次数不足 == 3 or 次数不足 == 4 then
    正在任务切换途中 = true
    正在拒绝当中 = true
    if 次数不足 == 4 then
      showHD_b("肝体力结束，正在等待")
      for i=1,60 do
        mSleep(10000)
      end
    end
    任务切换开始时间 = mTime()
    任务表 = 任务表记录
  end
else
  功能 = 任务表[1]
  正在任务切换途中 = true
  正在拒绝当中 = true
  选过几层了 = false
  任务切换开始时间 = mTime()
end
end

--推图核心处理函数 
function tuitu_new()
  
  sysLog("在用新版")
  mSleep(1000)
  
	TuiTuVarInit()
  
  -----开始循环执行---------------------------------------------------------------
  --------------------------------------------------------------------------------
  while true do
    if mTime() - 内存释放时间 > 60000 * 30 then
      内存释放时间 = mTime()
      collectgarbage("collect")
      sysLog("释放内存，目前大小:"..collectgarbage('count')..'kb')
    end
    
    if  isFrontApp(appid) ==1 then
      --if true then
      if 锁屏状态 then
        if 突破等待==3  and (mTime() > 阴阳寮开始时间 or 正在进行这一轮突破) then
          unlockDevice()
          本轮阴阳寮开始 = true		
          锁屏状态 = false
          mSleep(1000)
        end
      end
      
      keepScreen(true)
			
      local now_time = tonumber(os.date("%H"))*100+tonumber(os.date("%M"))
      if	暂停时段一 and now_time >= 时段1开始时间 and now_time <= 时段1结束时间 then
        sysLog("暂停时段一")
        showHD_b("正在暂停时段")
        暂停处理()
        mSleep(10000)
      elseif 暂停时段二 and now_time >= 时段2开始时间 and now_time <= 时段2结束时间 then
        showHD_b("正在暂停时段")
        暂停处理()
        mSleep(10000)
      elseif 是否有停止时间 and mTime() > 脚本开始时间 then
        vibrator()
        setStringConfig("lua_exit","欢迎回来，上次因为您选择脚本停止时间而停止脚本。")
        mSleep(10000)
        lockDevice()
        lua_exit()
      else
        
        if 随机发呆 == 1 and (功能 == 1 or 功能 == 5 or 功能 == 21 or 功能 == 20 or 功能 == 10 or 功能 == 6 or 功能 == 11) then
          random_sleep_init()
        end
        
        if 随机点击 == 1 and (功能 == 1 or 功能 == 5 or 功能 == 21 or 功能 == 20 or 功能 == 10 or 功能 == 6 or 功能 == 11) then
          random_click_init()
        end
        
        if 我在肝体力 == 1 then
          if #任务表 > 0 then
            功能 = 任务表[1][1]
          else
            toast("您选择了肝体力，但是肝体力详细设置中没有勾选！！请重启脚本，勾选你要刷什么！！")
          end
        end
        
        if  mTime() - 任务切换开始时间 > 30*1000 then
          正在任务切换途中 = false
          正在拒绝当中 = false
        end
        
        if 功能 ~= 88 then
          Func88Init()
        end	
        
        if 功能 ~= 5  then
          定期妖气相关()
        end
        
        ---------------根据当前界面分类处理
        findui()
        
        if 功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 5 or 功能 == 20 or 功能 == 21 or 功能 == 8 or 功能 ==  99 then
          --无体力处理
          NoPowerProc()
        end
        
      end
      
      keepScreen(false)
      
    else
      sysLog("闪退了")
      runApp(appid)
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
      
      for i=1,15 do
        keepScreen(true)
        if multiColor2(登陆界面,90) or multiColor2(新登陆界面,90) or multiColor2(登陆界面170520,92) or multiColor2(登陆界面170528,92) then
          keepScreen(false)
          break
        end
        keepScreen(false)
        click(random_click(主界面.点一下[1],主界面.点一下[2],70))
        mSleep(1000)
      end
      
    end
    
    
    resetIDLETimer()
    
    
  end  ---wile 结束
  
end

function main_new()
  tuitu = tuitu_new
  result = new_ui_new()
  
  
  local last_str = getStringConfig("lua_exit","您好，您是首次启动乘风挂机脚本。祝您玩得愉快。")    
  toast(last_str)
  setStringConfig("lua_exit","欢迎回来，今天准备玩些什么呢？")
  
  --根据用户配置初始化变量
  GVarInit()
  
  local 顺序表 = {}
  if result.功能选择 == "肝体力" then
    if result.要去探索.探索 then
      table.insert(任务表,{1,推图次数})
    end
    if result.要去御魂.御魂 then
      table.insert(任务表,{4,刷御魂次数})
    end
    if result.要去觉醒.觉醒 then
      table.insert(任务表,{3,刷觉醒次数})
    end
    if result.要去业原火.业原火 then
      table.insert(任务表,{20,刷业原火次数})
    end
    if result.要去御灵.御灵 then
      table.insert(任务表,{21,刷御灵次数})
    end
    if result.要去妖气.妖气 then
      table.insert(任务表,{5,妖气封印次数})
    end
    if result.要去挑战.式神挑战 then
      table.insert(任务表,{11,	})
    end
    table.sort(任务表, sortFunc)
    print(任务表)
    任务表记录 = 任务表
    我在肝体力 = 1
    tuitu()
  elseif result.功能选择 == "小功能" then
    sysLog("小功能")
    if result.小功能选择 == "自动剧情" then
      sysLog("自动剧情")
      功能 = 2
      tuitu()
    elseif result.小功能选择 == "自动斗技" then
      sysLog("自动斗技")
      功能 = 9
      tuitu()
    elseif result.小功能选择 == "自动协同斗技" then
      sysLog("自动协同斗技")
      功能 = 40
      tuitu()
    elseif result.小功能选择 == "百鬼夜行" then
      sysLog("百鬼夜行")
      功能 = 10
      tuitu()
    elseif result.小功能选择 == "一键日常" then
      sysLog("一键日常")
      功能 = 88
      tuitu()
    elseif result.小功能选择 == "自动兔子（测试）" then
      sysLog("自动兔子（测试版）")
      功能 = 99
      tuitu()
    elseif result.小功能选择 == "自动找寄养" then
      sysLog("自动找寄养")
      功能 = 102
      tuitu()
    elseif result.小功能选择 == "自动召唤碎片" then
      sysLog("自动召唤碎片")
      zhaohuan()
    elseif result.小功能选择 == "自动进小号鬼王" then
      sysLog("自动进小号鬼王")
      功能 = 101
      tuitu()
    elseif result.小功能选择 == "自动抽N卡" then
      sysLog("自动抽N卡")
      chouka()
    end
  elseif result.功能选择 == "挂机等邀请" then
    sysLog("挂机等邀请")
    功能 = 8
    组队探索 = 0
    tuitu()
  elseif result.功能选择 == "个人突破" then
    sysLog("个人突破")
    功能 = 7
    tuitu()
  elseif result.功能选择 == "阴阳寮突破" then
    sysLog("阴阳寮突破")
    功能 = 6
    tuitu()
  end
end
