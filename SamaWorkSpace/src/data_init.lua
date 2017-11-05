function Func88Init()
  if 妖怪退治 == 1 then
    if 打完妖怪退治了 == false then
      if now_time >= 1300 and now_time <= 1400 then
        要打妖怪退治 = true
      elseif now_time >= 1900 and now_time <= 2100 then
        要打妖怪退治 = true
      else
        要打妖怪退治 = false
      end
    else
      if now_time >= 1300 and now_time <= 1400 then
      elseif now_time >= 1900 and now_time <= 2100 then
      else
        打完妖怪退治了 = false
        要打妖怪退治 = false
      end
    end
  end
  if 自动斗技 == 1 then
    if 打完妖怪退治了 == false then
      if now_time >= 1200 and now_time <= 1300 then
        要打妖怪退治 = true
        是打斗技还是鬼王 = 1
      elseif now_time >= 2100 and now_time <= 2200 then
        要打妖怪退治 = true
        是打斗技还是鬼王 = 1
      else
        要打妖怪退治 = false
        是打斗技还是鬼王 = 0
      end
    else
      if now_time >= 1200 and now_time <= 1300 then
      elseif now_time >= 2100 and now_time <= 2200 then
      else
        是打斗技还是鬼王 = 0
        打完妖怪退治了 = false
        要打妖怪退治 = false
      end
    end
  end
  if 自动鬼王 == 1 then
    if 打完鬼王了 == false then
      if now_time >= 自动鬼王时间 and now_time <= 2100 then
        要打鬼王 = true
      else
        要打鬼王 = false
      end
    else
      if now_time >= 自动鬼王时间 and now_time <= 2100 then
      else
        打完鬼王了 = false
        要打鬼王 = false
      end
    end
  end
end

function TuiTuVarInit()
  if w== 750 or w==1242 or w == 720 or w== 1080 or w==1440 or h== 1334 or h == 2208 or w == 640 then
    if 我是国服 == false then
      sysLog("修改刷新位置")
      组队界面.刷新 = 组队界面.刷新日服
      组队界面.加入 = 组队界面.加入日服
      庭院界面.百鬼 = {637,141,0x0d0809}
      庭院界面.斗技 = {511,112,0x1f1209}
    end
  end
  
  if isFrontApp(appid) ==0 then
    isFrontApp = function() return 1 end
    toast("由于您的手机系统原因，您无法获得《来电暂停》功能。")
  end
  
  --功能 = 99
  if 我在肝体力 == 1 and #任务表 > 0 then
    功能 = 任务表[1][1]
  end
  
  start_count = 0
  打完boss = false
  打完boss计时 = 0
  打经验怪 = false --第一遍只打经验怪，走一个来回就全打
  if 刷经验怪 == 1 or 刷金币怪==1 or 刷御魂怪 == 1 then
    打经验怪 = true
  end
  
  卡屏次数 = 0
  开始时间 = mTime()
  需要拖动 = true
  个人第几个 = 1
  阴阳寮开始时间 = 1
  买过体力了 = false
  需要检测前台 = false
  战斗式神换完了 = false
  是否换式神 = false
  if 功能 == 1 then
    是否换式神 = true
    --sysLog("是否换式神")
  end
  三号位满 = false
  五号位满 = false
  首次进入撒豆 = true
  上次战斗时间= mTime()
  卡屏坐标 = {}
  检测过了 = false
  目标怪物数量 = 0
  失败次数 = 0
  是boss战 = false
  是第二章 = false
  刚进副本 = true
  if 功能 == 8 then
    刚进副本 = true
  end
  进入战斗切换 = false
  打了N只指定怪 = 0 
  打怪数量超过了 = false
  找到指定怪物 =false
  进入个人突破 = false
  进入阴阳寮突破 = false
  刚进入组队界面 = true
  上次战斗胜利 = true
  没有体力了 = false
  发现了石距 = false
  御魂结束 = false
  觉醒结束 = false
  正在组队 = false
  组队探索后可以继续 = false
  拖图次数 = 0
  战斗开始时间 = 0
  从战斗中出来 = false
  有满狗粮 = false
  战斗失败时间 = 0
  上次邀请时间 = 0
  首次组队 = true
  首次选择探索好友 = true
  上次组队邀请时间 = mTime()
  首次被邀请组队 = true
  组队邀请次数 = 0
  百鬼邀请index = 0
  百鬼邀请第几个 = 1
  百鬼邀请是否要拖动 = true
  同一个人邀请次数 = 0
  好友寄养界面index = 0
  好友寄养第几个 = 1
  是否可以寄养 = false
  是否要拖动好友寄养 = false
  首次进入聊天 = true
  刷赞时间 = mTime()
  脚本开始时间 = mTime()
  组队界面持续时间 = 0
  当前结界状态 = 0 --0代表在我的，1代表在别人的
  结界计算时间 = mTime()
  第几回合 = 1
  打了几次探索 = 0
  要发呆一下 =false
  打了几次妖气 = 0
  今天失败次数 =0
  今天成功次数 =0
  打了几次阴阳寮 = 0
  要打妖怪退治 = false
  打完妖怪退治了 = false
  是打斗技还是鬼王 = 0--0是退治，1是斗技，2是鬼王
  阴阳寮last = 0
  阴阳寮now = 1
  御魂觉醒连续失败次数Temp = 0
  业原火点挑战次数 = 0
  队员进副本时间 = 0
  日常次数记录 = 0
  第二回合切换 = true
  第三回合切换 = true
  刚才在打妖气 = false
  打完鬼王了 = false
  要打鬼王 = false
  战斗结束用来判定次数 = false
  我在打妖气 = false
  换过狗粮了 = false
  内存释放时间 = mTime()
  
  if 是否有停止时间 then
    脚本开始时间 = 脚本开始时间 + 脚本停止时间*60*1000
  end
  --ver = getOSType() 
  if ver == "iOS" then 
    需要检测前台 = true
  end
end


function GVarInit()
  
  if result.寄养星数 ~= nil then
    寄养星数 = tonumber(result.寄养星数)
  end
  if result.寄养什么.斗鱼 then
    寄养斗鱼 = 1
  end
  if result.寄养什么.太鼓 then
    寄养太鼓 = 1
  end
  if result.寄养什么.伞 then
    寄养伞 = 1
  end
  if result.寄养什么.经验 then
    寄养经验 = 1
  end		
  if result.寄养什么.美食 then
    寄养变异 = 1
  end
  
  if result.找不到合适寄养时 == "不寄养" then
    找不到合适寄养时 = 1
  elseif result.找不到合适寄养时 == "随意寄养" then
    找不到合适寄养时 = 2
  end	
  
  if result.好友数量 ~= nil then
    好友数量 = tonumber(result.好友数量)
  end
  
  if result.是否推图寄养.推图时每隔 then
    推图寄养 = 1	
  end
  if result.寄养间隔小时 ~= nil then
    设置的寄养间隔 = tonumber(result.寄养间隔小时) * 60
  end
  if result.寄养间隔 ~= nil then
    设置的寄养间隔 = 设置的寄养间隔 + tonumber(result.寄养间隔)
    if 推图寄养 == 1 then
      寄养间隔 = 设置的寄养间隔
    end
  end
  
  if result.判定方式 == "打BOSS算一次" then
    判定方式 = 1
  else
    判定方式 = 2
  end
  if result.预计下次在.预计下次在 then
    下次抢坑 = 1	
    推图寄养 = 1	
    local now_hour = tonumber(os.date("%H"))
    local 设定小时 = tonumber(result.下次寄养小时) 
    local now_min = tonumber(os.date("%M"))
    local 设定分钟 = tonumber(result.下次寄养分钟)
    local now_time = now_hour*60+now_min
    local 设定时间 = 设定小时*60 + 设定分钟
    if 设定时间 >= now_time then
      下次寄养时间 = 设定时间 - now_time
    else
      下次寄养时间 = 设定时间 + 1440 - now_time
    end
    if 下次寄养时间 > 360 then
      下次寄养时间 = 360
    end	
    寄养间隔 = 下次寄养时间
  end
  sysLog("寄养间隔 = "..寄养间隔)
  if result.暂停时段一.在 then
    暂停时段一 = true
    if result.时段1开始时间小时 ~= nil then
      时段1开始时间 = tonumber(result.时段1开始时间小时)
    end
    if result.时段1开始时间分钟 ~= nil then
      时段1开始时间 = 时段1开始时间*100 + tonumber(result.时段1开始时间分钟)
    end
    if result.时段1结束时间小时 ~= nil then
      时段1结束时间 = tonumber(result.时段1结束时间小时)
    end
    if result.时段1结束时间分钟 ~= nil then
      时段1结束时间 = 时段1结束时间*100 + tonumber(result.时段1结束时间分钟)
    end
  end
  if result.暂停时段二.在 then
    if result.时段2开始时间小时 ~= nil then
      时段2开始时间 = tonumber(result.时段2开始时间小时)
    end
    if result.时段2开始时间分钟 ~= nil then
      时段2开始时间 = 时段2开始时间*100 + tonumber(result.时段2开始时间分钟)
    end
    if result.时段2结束时间小时 ~= nil then
      时段2结束时间 = tonumber(result.时段2结束时间小时)
    end
    if result.时段2结束时间分钟 ~= nil then
      时段2结束时间 = 时段2结束时间*100 + tonumber(result.时段2结束时间分钟)
    end
    暂停时段二 = true
  end

-- if result.随机发呆.每隔 then
--   随机发呆 = 1
--   发呆间隔大 = 10
--   发呆间隔小 = 1
--   if result.随机发呆间隔小 ~= nil then
--     发呆间隔小 = tonumber(result.随机发呆间隔小)
--   end
--   if result.随机发呆间隔大 ~= nil then
--     发呆间隔大 = tonumber(result.随机发呆间隔大)
--   end
--   if result.随机发呆时间小 ~= nil then
--     发呆时长1 = tonumber(result.随机发呆时间小)
--   end
--   if result.随机发呆时间大 ~= nil then
--     发呆时长2 = tonumber(result.随机发呆时间大)
--   end
--   if 发呆间隔小 == 0 then
--     发呆间隔小 = 1
--   end
--   if 发呆间隔大 == 0 then
--     发呆间隔大 = 2
--   end
--   if 发呆时长1 == 0 then
--     发呆时长1 = 1
--   end
--   if 发呆时长2 == 0 then
--     发呆时长2 = 2
--   end
--   if 发呆间隔大 < 发呆间隔小 then
--     发呆间隔大 = 发呆间隔小
--   end
--   if 发呆时长2 < 发呆时长1 then
--     发呆时长2 = 发呆时长1
--   end
-- end
--
--   
-- if result.随机点击.每隔 then
--   随机点击 = 1
--   if result.随机点击间隔小 ~= nil then
--     点击间隔小 = tonumber(result.随机点击间隔小)
--   end
--   if result.随机点击间隔大 ~= nil then
--     点击间隔大 = tonumber(result.随机点击间隔大)
--   end
--   if 点击间隔小 == 0 then
--     点击间隔小 = 1
--   end
--   if 点击间隔大 == 0 then
--     点击间隔大 = 2
--   end
--   if 点击间隔大 < 点击间隔小 then
--     点击间隔大 = 点击间隔小
--   end
-- end
     
  if 1 then
    if result.自动鬼王.在 then	
      自动鬼王 = 1
      if result.自动鬼王小时 ~= nil then
        自动鬼王时间 = tonumber(result.自动鬼王小时)
      end
      if result.自动鬼王分钟 ~= nil then
        自动鬼王时间 = 自动鬼王时间*100 + tonumber(result.自动鬼王分钟)
      end
    end
  end
  if result.是否有停止时间.脚本运行 then
    if result.脚本停止时间 ~= nil then
      脚本停止时间 = tonumber(result.脚本停止时间)
    end
    是否有停止时间 = true
  end
  if result.刷赞留言 ~= nil then
    刷赞留言 = result.刷赞留言
  else	
    刷赞留言 = "给你赞过了哦，麻烦回一下~\(≧▽≦)/~"
  end
  if result.怪物选择.boss then
    刷boss = 1
  end
  if result.怪物选择.经验怪 then
    刷经验怪 = 1
  end
  if result.怪物选择.金币怪 then
    刷金币怪 = 1
  end
  if result.怪物选择.御魂怪 then
    刷御魂怪 = 1
  end
  if result.怪物选择.任意怪 then
    刷任意怪 = 1
  end
  if result.怪物选择.有3只以上才打 then
    有3只以上才打 = 1
  end
  
  if result.推图设置 == "右边第一张图" then
    第几张图 = 1
  elseif result.推图设置 == "右边第二张图" then
    第几张图 = 2
  elseif result.推图设置 == "右边第三张图" then
    第几张图 = 3
  elseif result.推图设置 == "右边第四张图" then
    第几张图 = 4
  end
  if result.选图方式 == "点右边选图" then
    选图方式 = 1	
  elseif result.选图方式 == "地图中间选图" then
    选图方式 = 2
  elseif result.选图方式 == "12章" then
    选图方式 = 3
  elseif result.选图方式 == "13章" then
    选图方式 = 4
  elseif result.选图方式 == "14章" then
    选图方式 = 5	
  elseif result.选图方式 == "右边拖动选图（稳定）" then
    选图方式 = 6	
  elseif result.选图方式 == "极速选图" then
    选图方式 = 7
  end
  
  延迟随机最小值 = 500
  延迟随机最大值 = 1500
  
--  if result.延迟随机最小值 == "0秒" then
--    延迟随机最小值 = 0
--  elseif result.延迟随机最小值 == "0.5秒" then
--    延迟随机最小值 = 500
--  elseif result.延迟随机最小值 == "1秒" then
--    延迟随机最小值 = 1000
--  elseif result.延迟随机最小值 == "1.5秒" then
--    延迟随机最小值 = 1500
--  elseif result.延迟随机最小值 == "2秒" then
--    延迟随机最小值 = 2000
--  elseif result.延迟随机最小值 == "2.5秒" then
--    延迟随机最小值 = 2500
--  elseif result.延迟随机最小值 == "3秒" then
--    延迟随机最小值 = 3000
--  elseif result.延迟随机最小值 == "3.5秒" then
--    延迟随机最小值 = 3500
--  elseif result.延迟随机最小值 == "4秒" then
--    延迟随机最小值 = 4000
--  elseif result.延迟随机最小值 == "4.5秒" then
--    延迟随机最小值 = 4500
--  elseif result.延迟随机最小值 == "5秒" then
--    延迟随机最小值 = 5000
--  elseif result.延迟随机最小值 == "5.5秒" then
--    延迟随机最小值 = 5500
--  elseif result.延迟随机最小值 == "6秒" then
--    延迟随机最小值 = 6000
--  elseif result.延迟随机最小值 == "6.5秒" then
--    延迟随机最小值 = 6500
--  elseif result.延迟随机最小值 == "7秒" then
--    延迟随机最小值 = 7000
--  elseif result.延迟随机最小值 == "7.5秒" then
--    延迟随机最小值 = 7500
--  elseif result.延迟随机最小值 == "8秒" then
--    延迟随机最小值 = 8000
--  elseif result.延迟随机最小值 == "8.5秒" then
--    延迟随机最小值 = 8500
--  elseif result.延迟随机最小值 == "9秒" then
--    延迟随机最小值 = 9000
--  elseif result.延迟随机最小值 == "9.5秒" then
--    延迟随机最小值 = 9500
--  elseif result.延迟随机最小值 == "10秒" then
--    延迟随机最小值 = 10000
--  end
--  
--  if result.延迟随机最大值 == "0秒" then
--    延迟随机最大值 = 0
--  elseif result.延迟随机最大值 == "0.5秒" then
--    延迟随机最大值 = 500
--  elseif result.延迟随机最大值 == "1秒" then
--    延迟随机最大值 = 1000
--  elseif result.延迟随机最大值 == "1.5秒" then
--    延迟随机最大值 = 1500
--  elseif result.延迟随机最大值 == "2秒" then
--    延迟随机最大值 = 2000
--  elseif result.延迟随机最大值 == "2.5秒" then
--    延迟随机最大值 = 2500
--  elseif result.延迟随机最大值 == "3秒" then
--    延迟随机最大值 = 3000
--  elseif result.延迟随机最大值 == "3.5秒" then
--    延迟随机最大值 = 3500
--  elseif result.延迟随机最大值 == "4秒" then
--    延迟随机最大值 = 4000
--  elseif result.延迟随机最大值 == "4.5秒" then
--    延迟随机最大值 = 4500
--  elseif result.延迟随机最大值 == "5秒" then
--    延迟随机最大值 = 5000
--  elseif result.延迟随机最大值 == "5.5秒" then
--    延迟随机最大值 = 5500
--  elseif result.延迟随机最大值 == "6秒" then
--    延迟随机最大值 = 6000
--  elseif result.延迟随机最大值 == "6.5秒" then
--    延迟随机最大值 = 6500
--  elseif result.延迟随机最大值 == "7秒" then
--    延迟随机最大值 = 7000
--  elseif result.延迟随机最大值 == "7.5秒" then
--    延迟随机最大值 = 7500
--  elseif result.延迟随机最大值 == "8秒" then
--    延迟随机最大值 = 8000
--  elseif result.延迟随机最大值 == "8.5秒" then
--    延迟随机最大值 = 8500
--  elseif result.延迟随机最大值 == "9秒" then
--    延迟随机最大值 = 9000
--  elseif result.延迟随机最大值 == "9.5秒" then
--    延迟随机最大值 = 9500
--  elseif result.延迟随机最大值 == "10秒" then
--    延迟随机最大值 = 10000
--  end
--  if 延迟随机最大值 < 延迟随机最小值 then
--    延迟随机最大值 = 延迟随机最小值
--  end

  if result.拖动选图 == "第一章" then
    拖动选图 = 1
  elseif result.拖动选图 == "第二章" then
    拖动选图 = 2
  elseif result.拖动选图 == "第三章" then
    拖动选图 = 3
  elseif result.拖动选图 == "第四章" then
    拖动选图 = 4
  elseif result.拖动选图 == "第五章" then
    拖动选图 = 5
  elseif result.拖动选图 == "第六章" then
    拖动选图 = 6
  elseif result.拖动选图 == "第七章" then
    拖动选图 = 7
  elseif result.拖动选图 == "第八章" then
    拖动选图 = 8
  elseif result.拖动选图 == "第九章" then
    拖动选图 = 9
  elseif result.拖动选图 == "第十章" then
    拖动选图 = 10
  elseif result.拖动选图 == "第十一章" then
    拖动选图 = 11
  elseif result.拖动选图 == "第十二章" then
    拖动选图 = 12
  elseif result.拖动选图 == "第十三章" then
    拖动选图 = 13
  elseif result.拖动选图 == "第十四章" then
    拖动选图 = 14
  elseif result.拖动选图 == "第十五章" then
    拖动选图 = 15
  elseif result.拖动选图 == "第十六章" then
    拖动选图 = 16
  elseif result.拖动选图 == "第十七章" then
    拖动选图 = 17
  elseif result.拖动选图 == "第十八章" then
    拖动选图 = 18
  elseif result.拖动选图 == "番外一" then
    拖动选图 = 19
  elseif result.拖动选图 == "第十九章" then
    拖动选图 = 20
  elseif result.拖动选图 == "第二十章" then
    拖动选图 = 21
  elseif result.拖动选图 == "第二十一章" then
    拖动选图 = 22
  elseif result.拖动选图 == "第二十二章" then
    拖动选图 = 23
  elseif result.拖动选图 == "第二十三章" then
    拖动选图 = 24
  end
  
  if result.式神挑战章节 == "第一章" then
    式神挑战章节 = 1
  elseif result.式神挑战章节 == "第二章" then
    式神挑战章节 = 2
  elseif result.式神挑战章节 == "第三章" then
    式神挑战章节 = 3
  elseif result.式神挑战章节 == "第四章" then
    式神挑战章节 = 4
  elseif result.式神挑战章节 == "第五章" then
    式神挑战章节 = 5
  elseif result.式神挑战章节 == "第六章" then
    式神挑战章节 = 6
  elseif result.式神挑战章节 == "第七章" then
    式神挑战章节 = 7
  elseif result.式神挑战章节 == "第八章" then
    式神挑战章节 = 8
  elseif result.式神挑战章节 == "第九章" then
    式神挑战章节 = 9
  elseif result.式神挑战章节 == "第十章" then
    式神挑战章节 = 10
  elseif result.式神挑战章节 == "第十一章" then
    式神挑战章节 = 11
  elseif result.式神挑战章节 == "第十二章" then
    式神挑战章节 = 12
  elseif result.式神挑战章节 == "第十三章" then
    式神挑战章节 = 13
  elseif result.式神挑战章节 == "第十四章" then
    式神挑战章节 = 14
  elseif result.式神挑战章节 == "第十五章" then
    式神挑战章节 = 15
  elseif result.式神挑战章节 == "第十六章" then
    式神挑战章节 = 16
  elseif result.式神挑战章节 == "第十七章" then
    式神挑战章节 = 17
  elseif result.式神挑战章节 == "第十八章" then
    式神挑战章节 = 18
  end
  if result.式神挑战第几个 == "第一个" then
    式神挑战第几个 = 1
  elseif result.式神挑战第几个 == "第二个" then
    式神挑战第几个 = 2
  elseif result.式神挑战第几个 == "第三个" then
    式神挑战第几个 = 3
  end
  
  if result.失败次数 == "1" then
    失败几次退出 = 1
  elseif result.失败次数 == "2" then
    失败几次退出 = 2
  elseif result.失败次数 == "3" then
    失败几次退出 = 3
  elseif result.失败次数 == "4" then
    失败几次退出 = 4
  elseif result.失败次数 == "5" then
    失败几次退出 = 5
  end
  if result.刷觉醒材料设置 == "业火轮" then
    刷觉醒材料设置 = 1
  elseif result.刷觉醒材料设置 == "风转符" then
    刷觉醒材料设置 = 2
  elseif result.刷觉醒材料设置 == "水灵鲤" then
    刷觉醒材料设置 = 3
  elseif result.刷觉醒材料设置 == "天雷鼓" then
    刷觉醒材料设置 = 4
  end
  
  if result.刷御灵设置 == "神龙" then
    刷御灵设置 = 1
  elseif result.刷御灵设置 == "白藏主" then
    刷御灵设置 = 2
  elseif result.刷御灵设置 == "黑豹" then
    刷御灵设置 = 3
  elseif result.刷御灵设置 == "孔雀" then
    刷御灵设置 = 4
  end
  
  if result.刷御灵设置几层 == "第一层" then
    刷御灵设置几层 = 1
  elseif result.刷御灵设置几层 == "第二层" then
    刷御灵设置几层 = 2
  elseif result.刷御灵设置几层 == "第三层" then
    刷御灵设置几层 = 3
  end
  if result.打怪超过N个 == "1" then
    打怪超过N个 = 1
  elseif result.打怪超过N个 == "2" then
    打怪超过N个 = 2
  elseif result.打怪超过N个 == "3" then
    打怪超过N个 = 3
  elseif result.打怪超过N个 == "4" then
    打怪超过N个 = 4
  elseif result.打怪超过N个 == "5" then
    打怪超过N个 = 5
  elseif result.打怪超过N个 == "99" then
    打怪超过N个 = 9999
  end
  
  if result.御魂觉醒失败次数 ~= nil then
    御魂觉醒失败次数 = tonumber(result.御魂觉醒失败次数)
  end
  
  if result.标记点击次数 ~= nil then
    最大标记次数 = tonumber(result.标记点击次数)
  end
  
  if result.御魂觉醒连续失败次数 ~= nil then
    御魂觉醒连续失败次数 = tonumber(result.御魂觉醒连续失败次数)
  end
  
  if result.攻击勋章 ~= nil then
    攻击勋章 = tonumber(result.攻击勋章)
  end	
  if result.御魂打标记 == "标记左边" then
    御魂打标记 = 1
  elseif result.御魂打标记 == "标记中间" then
    御魂打标记 = 2
  elseif result.御魂打标记 == "不标记" then
    御魂打标记 = 3
  elseif	result.御魂打标记 == "标记右边" then
    御魂打标记 = 4
  elseif	result.御魂打标记 == "先左后右" then
    御魂打标记 = 5
  elseif	result.御魂打标记 == "先右后左" then
    御魂打标记 = 6
  elseif	result.御魂打标记 == "先左后中" then
    御魂打标记 = 7
  elseif	result.御魂打标记 == "先右后中" then
    御魂打标记 = 8
  end
  
  if result.御魂打标记2 == "标记左边" then
    御魂打标记2 = 1
  elseif result.御魂打标记2 == "标记中间" then
    御魂打标记2 = 2
  elseif result.御魂打标记2 == "不标记" then
    御魂打标记2 = 3
  elseif	result.御魂打标记2 == "标记右边" then
    御魂打标记2 = 4
  elseif	result.御魂打标记2 == "先左后右" then
    御魂打标记2 = 5
  elseif	result.御魂打标记2 == "先右后左" then
    御魂打标记2 = 6
  elseif	result.御魂打标记2 == "先左后中" then
    御魂打标记2 = 7
  elseif	result.御魂打标记2 == "先右后中" then
    御魂打标记2 = 8
  end
  
  if result.御魂打标记3 == "标记左边" then
    御魂打标记3 = 1
  elseif result.御魂打标记3 == "标记中间" then
    御魂打标记3 = 2
  elseif result.御魂打标记3 == "不标记" then
    御魂打标记3 = 3
  elseif	result.御魂打标记3 == "标记右边" then
    御魂打标记3 = 4
  elseif	result.御魂打标记3 == "先左后右" then
    御魂打标记3 = 5
  elseif	result.御魂打标记3 == "先右后左" then
    御魂打标记3 = 6
  elseif	result.御魂打标记3 == "先左后中" then
    御魂打标记3 = 7
  elseif	result.御魂打标记3 == "先右后中" then
    御魂打标记3 = 8
  elseif	result.御魂打标记3 == "丑女茨木标记" then
    御魂打标记3 = 9
  end
  if result.推图打标记 == "标记BOSS" then
    推图打标记 = 1
  elseif result.推图打标记 == "标记小怪（右）" then
    推图打标记 = 2
  elseif result.推图打标记 == "不标记" then
    推图打标记 = 3
  elseif result.推图打标记 == "标记小怪（中）" then
    推图打标记 = 4
  elseif result.推图打标记 == "标记小怪（左）" then
    推图打标记 = 5
  end
  if result.推图打标记2 == "标记BOSS" then
    推图打标记2 = 1
  elseif result.推图打标记2 == "标记小怪（右）" then
    推图打标记2 = 2
  elseif result.推图打标记2 == "不标记" then
    推图打标记2 = 3
  elseif result.推图打标记2 == "标记小怪（中）" then
    推图打标记2 = 4
  elseif result.推图打标记2 == "标记小怪（左）" then
    推图打标记2 = 5
  end
  if result.推图BOSS打标记1 == "标记BOSS" then
    推图BOSS打标记1 = 1
  elseif result.推图BOSS打标记1 == "标记小怪（右）" then
    推图BOSS打标记1 = 2
  elseif result.推图BOSS打标记1 == "不标记" then
    推图BOSS打标记1 = 3
  elseif result.推图BOSS打标记1 == "标记小怪（中）" then
    推图BOSS打标记1 = 4
  elseif result.推图BOSS打标记1 == "标记小怪（左）" then
    推图BOSS打标记1 = 5
  end
  if result.推图BOSS打标记2 == "标记BOSS" then
    推图BOSS打标记2 = 1
  elseif result.推图BOSS打标记2 == "标记小怪（右）" then
    推图BOSS打标记2 = 2
  elseif result.推图BOSS打标记2 == "不标记" then
    推图BOSS打标记2 = 3
  elseif result.推图BOSS打标记2 == "标记小怪（中）" then
    推图BOSS打标记2 = 4
  elseif result.推图BOSS打标记2 == "标记小怪（左）" then
    推图BOSS打标记2 = 5
  end
  
  if result.刷觉醒材料几层 == "第一层" then
    刷觉醒材料几层 = 1
  elseif result.刷觉醒材料几层 == "第二层" then
    刷觉醒材料几层 = 2
  elseif result.刷觉醒材料几层 == "第三层" then
    刷觉醒材料几层 = 3
  elseif result.刷觉醒材料几层 == "第四层" then
    刷觉醒材料几层 = 4
  elseif result.刷觉醒材料几层 == "第五层" then
    刷觉醒材料几层 = 5
  elseif result.刷觉醒材料几层 == "第六层" then
    刷觉醒材料几层 = 6
  elseif result.刷觉醒材料几层 == "第七层" then
    刷觉醒材料几层 = 7
  elseif result.刷觉醒材料几层 == "第八层" then
    刷觉醒材料几层 = 8
  elseif result.刷觉醒材料几层 == "第九层" then
    刷觉醒材料几层 = 9
  elseif result.刷觉醒材料几层 == "第十层" then
    刷觉醒材料几层 = 10
  end
  
  if result.刷御魂材料几层 == "第一层" then
    刷御魂材料几层 = 1
  elseif result.刷御魂材料几层 == "第二层" then
    刷御魂材料几层 = 2
  elseif result.刷御魂材料几层 == "第三层" then
    刷御魂材料几层 = 3
  elseif result.刷御魂材料几层 == "第四层" then
    刷御魂材料几层 = 4
  elseif result.刷御魂材料几层 == "第五层" then
    刷御魂材料几层 = 5
  elseif result.刷御魂材料几层 == "第六层" then
    刷御魂材料几层 = 6
  elseif result.刷御魂材料几层 == "第七层" then
    刷御魂材料几层 = 7
  elseif result.刷御魂材料几层 == "第八层" then
    刷御魂材料几层 = 8
  elseif result.刷御魂材料几层 == "第九层" then
    刷御魂材料几层 = 9
  elseif result.刷御魂材料几层 == "第十层" then
    刷御魂材料几层 = 10
  end
  
  if result.业原火设置 == "贪之阵" then
    业原火设置 = 1
  elseif result.业原火设置 == "嗔之阵" then
    业原火设置 = 2
  elseif result.业原火设置 == "痴之阵" then
    业原火设置 = 3
  end
  
  
  
  if result.推图难度 == "普通" then
    推图难度 = 1
  elseif result.推图难度 == "困难" then
    推图难度 = 2
  end
  
  if result.御魂开组刷设置 == "2人" then
    御魂开组几人 = 2
  elseif result.御魂开组刷设置 == "3人" then
    御魂开组几人 = 3
  end
  if result.觉醒开组刷设置 == "2人" then
    觉醒开组几人 = 2
  elseif result.觉醒开组刷设置 == "3人" then
    觉醒开组几人 = 3
  end
  
  if result.御魂组队单刷 == "单刷" then
    御魂组队单刷 = 1		
  elseif result.御魂组队单刷 == "开组" then
    御魂组队单刷 = 2	
  elseif result.御魂组队单刷 == "混组" then
    御魂组队单刷 = 3		
  elseif result.御魂组队单刷 == "开组邀请" then
    御魂组队单刷 = 4		
  end
  
  if result.觉醒组队单刷 == "单刷" then
    觉醒组队单刷 = 1		
  elseif result.觉醒组队单刷 == "开组" then
    觉醒组队单刷 = 2	
  elseif result.觉醒组队单刷 == "混组" then
    觉醒组队单刷 = 3		
  elseif result.觉醒组队单刷 == "开组邀请" then
    觉醒组队单刷 = 4		
  end
  
  if result.开组等级 == "不设置" then
    开组等级 = -1
  elseif result.开组等级 == "1级" then
    开组等级 = 0
  elseif result.开组等级 == "6级" then
    开组等级 = 1
  elseif result.开组等级 == "11级" then
    开组等级 = 2
  elseif result.开组等级 == "16级" then
    开组等级 = 3
  elseif result.开组等级 == "21级" then
    开组等级 = 4
  elseif result.开组等级 == "26级" then
    开组等级 = 5
  elseif result.开组等级 == "31级" then
    开组等级 = 6
  elseif result.开组等级 == "36级" then
    开组等级 = 7
  elseif result.开组等级 == "41级" then
    开组等级 = 8
  elseif result.开组等级 == "46级" then
    开组等级 = 9
  elseif result.开组等级 == "51级" then
    开组等级 = 10
  elseif result.开组等级 == "56级" then
    开组等级 = 11
  elseif result.开组等级 == "60级" then
    开组等级 = 12
  end
  
  if result.定期妖气.定期石距 then
    定期石距 = 1
  end
  if result.定期妖气.定期年兽 then
    定期年兽 = 1
  end
  if result.定期妖气.定期经验妖怪 then
    定期经验妖怪 = 1
  end
  if result.定期妖气.定期金币妖怪 then
    定期金币妖怪 = 1
  end
  if result.定期妖气.突破卷满20去突破 then
    自动突破 = 1
  end
  if result.定期妖气.定期去阴阳寮突破 then
    自动阴阳寮 = 1
  end
  if result.自动换狗粮.自动换狗粮 then
    自动换狗粮 = 1
  end
  if result.组队探索 == "组队" then
    组队探索 = 1
  end
  if result.自动换狗粮.日服玩家勾选这个 then
    我是国服 = false
  end
  if result.推图结合.推图时拒绝邀请 then
    推图时拒绝邀请 = 1
  end
  if result.推图结合.发现石距震动提醒 then
    发现石距震动提醒 = 1
  end
  if result.推图结合.发现石距自动打 then
    发现石距自动打 = 1
  end
  if result.推图结合.发现年兽自动打 then
    发现年兽自动打 = 1
  end
  if result.推图结合.发现石距铃声提醒 then
    发现石距铃声提醒 = 1
  end
  if result.推图结合.自动接受好友申请 then
    自动接受好友申请 = 1
  end
  --if result.推图结合.推图妖气时随机发呆，模拟真人操作时发呆 then
  --  随机发呆 = 1
  --end
  妖怪退治 = 0
  if result.推图结合.自动斗技 then
    自动斗技 = 1
  end
  if result.推图结合.关闭统计 then
    关闭统计 = 1
  end
  if result.推图结合.开启脚本提示 then
    开启脚本提示 = 1
  end
  if result.推图结合.开启点击提示 then
    开启点击提示 = 1
  end
  if result.推图结合.不检测自动战斗 then
    不点自动战斗 = 1
  end
  if result.推图结合.不强制普攻改妖术 then
    不强制普攻改妖术 = 1
  end
  if result.推图结合.不做日常祈愿和强化 then
    不做日常祈愿和强化 = 1
  end
  if result.推图结合.不做日常突破 then
    不做日常突破 = 1
  end
  --if result.组队设置 == "寮友" then
  --  组队设置 = 1
  --elseif result.组队设置 == "好友" then
  组队设置 = 2
  -- end
  if result.突破标记.突破打标记 then
    突破打标记 = 1
  end
  if result.清明技能 == "一直普攻" then
    清明技能 = 1
  elseif result.清明技能 == "一直放灭" then
    清明技能 = 2
  end
  if result.百鬼设置 == "不邀请队友" then
    百鬼设置 = 1
  elseif result.百鬼设置 == "邀请队友" then
    百鬼设置 = 2
  end
  if result.有人加寮 == "自动拒绝" then
    有人加寮 = 1
  elseif result.有人加寮 == "自动同意" then
    有人加寮 = 2
  elseif result.有人加寮 == "不处理" then
    有人加寮 = 3
  end
  if result.无限魂十 == "无限魂10兔子" then
    无限魂10兔子 = 1
  elseif result.无限魂十 == "过山兔本" then
    无限魂10兔子 = 2
  end
  
  if result.推图结合.自动接收悬赏邀请 then
    自动接收悬赏邀请 = 1
  end
  
  if result.狗粮选择.N卡 then
    上N卡 = 1
  end
  if result.狗粮选择.R卡 then
    上R卡 = 1
  end
  if 上N卡 == 0 and 上R卡 == 0 then
    上N卡 = 1
  end
  if result.狗粮选择.上红蛋 then
    上红蛋 = 1
  end
  if result.狗粮选择.上白蛋 then
    上白蛋 = 1
  end
  中间狗粮 = 1
  右边狗粮 = 1

--  if result.狗粮位置.左边 then
--    左边狗粮 = 1
--  end
--  if result.狗粮位置.中间 then
--    中间狗粮 = 1
--  end
--  if result.狗粮位置.右边 then
--    右边狗粮 = 1
--  end
--  if result.狗粮位置.阴阳师左边 then
--    队长左边狗粮 = 1
--  end
--  if result.狗粮位置.阴阳师右边 then
--    队长右边狗粮 = 1
--  end
  
  if result.悬赏邀请.自动接勾玉邀请 then
    自动接勾玉邀请 = 1
  end
  if result.悬赏邀请.自动接体力邀请 then
    自动接体力邀请 = 1
  end
  if result.悬赏邀请.自动接金币邀请 then
    自动接金币邀请 = 1
  end
  
  if result.御魂失败继续.御魂失败也继续邀请或者接受邀请 then
    御魂一直继续 = 1
  end
  
--  if result.狗粮普攻.左边 then
--    左边普攻 = 1
--  end
--  if result.狗粮普攻.中间 then
--    中间普攻 = 1
--  end
--  if result.狗粮普攻.右边 then
--    右边普攻 = 1
--  end
--  if result.狗粮普攻.阴阳师右边 then
--    队长右边普攻 = 1
--  end
--  if result.狗粮普攻.阴阳师左边 then
--    队长左边普攻 = 1
--  end
  
  if result.选狗粮拖动次数 == "10次" then
    选狗粮拖动次数 = 10
  elseif result.选狗粮拖动次数 == "15次" then
    选狗粮拖动次数 = 15
  elseif result.选狗粮拖动次数 == "20次" then
    选狗粮拖动次数 = 20
  elseif result.选狗粮拖动次数 == "30次" then
    选狗粮拖动次数 = 30
  elseif result.选狗粮拖动次数 == "40次" then
    选狗粮拖动次数 = 40
  elseif result.选狗粮拖动次数 == "50次" then
    选狗粮拖动次数 = 50
  elseif result.选狗粮拖动次数 == "60次" then
    选狗粮拖动次数 = 60
  elseif result.选狗粮拖动次数 == "70次" then
    选狗粮拖动次数 = 70
  elseif result.选狗粮拖动次数 == "80次" then
    选狗粮拖动次数 = 80
  elseif result.选狗粮拖动次数 == "90次" then
    选狗粮拖动次数 = 90
  elseif result.选狗粮拖动次数 == "100次" then
    选狗粮拖动次数 = 100
  end
  if result.选狗粮方式 == "前面的不满N卡" then
    选狗粮方式 = 1		
    选狗粮拖动次数 = 100
  elseif result.选狗粮方式 ==	"拖到最后的1级N卡" then
    选狗粮方式 = 2
  end

  极速拖动 = 2		
  
  if result.狗粮拖动速度 == "普通模式" then
    极速拖动 = 2		
  elseif result.狗粮拖动速度 ==	"极速模式" then
    极速拖动 = 1
  end
  if result.日常御魂觉醒后 == "推图" then
    日常御魂觉醒后 = 1		
  elseif result.日常御魂觉醒后 == "觉醒" then
    日常御魂觉醒后 = 3	
  elseif result.日常御魂觉醒后 == "御魂" then
    日常御魂觉醒后 = 4	
  elseif result.日常御魂觉醒后 == "结束脚本" then
    日常御魂觉醒后 = 5
  end
  if result.体力不足 == "领体力" then
    体力不足 = 1		
  elseif result.体力不足 == "锁屏" then
    体力不足 = 2	
  elseif result.体力不足 == "震动提醒" then
    体力不足 = 3	
  elseif result.体力不足 == "继续挂着" then
    体力不足 = 4
  elseif result.体力不足 == "买体力" then
    体力不足 = 5	
  elseif result.体力不足 == "阴阳寮突破" then
    体力不足 = 6
  elseif result.体力不足 == "挂机等邀请" then
    体力不足 = 7
  elseif result.体力不足 == "挂机等寄养" then
    体力不足 = 8
  end
  
  if result.次数不足 == "锁屏" then
    次数不足 = 1
  elseif result.次数不足 == "阴阳寮突破" then
    次数不足 = 2
  elseif result.次数不足 == "从头再来" then
    次数不足 = 3
  elseif result.次数不足 == "等10分钟从头再来" then
    次数不足 = 4
  elseif result.次数不足 == "挂机等邀请" then
    次数不足 = 5
  elseif result.次数不足 == "挂机等寄养" then
    次数不足 = 6
  end
  if result.匹配还是挤车 == "匹配模式" then
    匹配还是挤车 = 1		
  elseif result.匹配还是挤车 == "抢车模式" then
    匹配还是挤车 = 2	
  end
  if result.日常结束 == "锁屏" then
    日常结束 = 1		
  elseif result.日常结束 == "震动提醒" then
    日常结束 = 2	
  elseif result.日常结束 == "探索" then
    日常结束 = 3	
  elseif result.日常结束 == "御魂" then
    日常结束 = 4
  elseif result.日常结束 == "阴阳寮突破" then
    日常结束 = 5	
  end
  
  if result.买体力次数 ~= nil then
    买体力次数 = tonumber(result.买体力次数)
  end
  --sysLog("选狗粮拖动次数"..选狗粮拖动次数)
  if result.重连次数 == "0次" then
    重连次数 = 0
  elseif result.重连次数 == "1次" then
    重连次数 = 1
  elseif result.重连次数 == "2次" then
    重连次数 = 2
  elseif result.重连次数 == "3次" then
    重连次数 = 3
  elseif result.重连次数 == "4次" then
    重连次数 = 4
  elseif result.重连次数 == "5次" then
    重连次数 = 5
  elseif result.重连次数 == "6次" then
    重连次数 = 6
  elseif result.重连次数 == "7次" then
    重连次数 = 7
  elseif result.重连次数 == "8次" then
    重连次数 = 8
  elseif result.重连次数 == "9次" then
    重连次数 = 9
  elseif result.重连次数 == "10次" then
    重连次数 = 10
  elseif result.重连次数 == "20次" then
    重连次数 = 20
  elseif result.重连次数 == "30次" then
    重连次数 = 30
  elseif result.重连次数 == "999次" then
    重连次数 = 999999
  end
  
  if result.重连等待 == "立刻重连" then
    重连等待 = 0
  elseif result.重连等待 == "1分钟" then
    重连等待 = 1
  elseif result.重连等待 == "2分钟" then
    重连等待 = 2
  elseif result.重连等待 == "3分钟" then
    重连等待 = 3
  elseif result.重连等待 == "4分钟" then
    重连等待 = 4
  elseif result.重连等待 == "5分钟" then
    重连等待 = 5
  elseif result.重连等待 == "10分钟" then
    重连等待 = 10
  elseif result.重连等待 == "15分钟" then
    重连等待 = 15
  elseif result.重连等待 == "20分钟" then
    重连等待 = 20
  elseif result.重连等待 == "30分钟" then
    重连等待 = 30
  elseif result.重连等待 == "60分钟" then
    重连等待 = 60
  end
  if result.刷觉醒次数 ~= nil then
    刷觉醒次数 = tonumber(result.刷觉醒次数)
  end
  if result.刷业原火次数 ~= nil then
    刷业原火次数 = tonumber(result.刷业原火次数)
  end
  if result.刷御灵次数 ~= nil then
    刷御灵次数 = tonumber(result.刷御灵次数)
  end
  if result.式神挑战次数 ~= nil then
    式神挑战次数 = tonumber(result.式神挑战次数)
  end
  
  
  if result.总共失败次数 ~= nil then
    总共失败次数 = tonumber(result.总共失败次数)
  end
  几次检测一次满 = 0
  if result.几次检测一次满 ~= nil then
    几次检测一次满 = tonumber(result.几次检测一次满)
  end
  
  if result.邀请失败次数 ~= nil then
    邀请失败次数 = tonumber(result.邀请失败次数)
  end
  
  if result.刷御魂次数 ~= nil then
    刷御魂次数 = tonumber(result.刷御魂次数)
  end
  
  if result.妖气封印次数 ~= nil then
    妖气封印次数 = tonumber(result.妖气封印次数)
  end
  if result.推图次数 ~= nil then
    推图次数 = tonumber(result.推图次数)
  end
  if result.副本内拖图次数 ~= nil then
    副本内拖图次数 = tonumber(result.副本内拖图次数)
  end
  
  是否下拉阴阳寮 = 2
  自动刷新 = 3
  if result.阴阳寮突破设置 == "阴阳寮突破(下拉)" then
    是否下拉阴阳寮 = 1
  elseif result.阴阳寮突破设置 == "阴阳寮突破(不下拉)" then
    是否下拉阴阳寮 = 2
  elseif result.阴阳寮突破设置 == "阴阳寮突破(打第一个)" then
    是否下拉阴阳寮 = 3
  elseif result.阴阳寮突破设置 == "根据勋章选择" then
    是否下拉阴阳寮 = 4
  end
  if result.突破设置 == "个人突破(3胜刷新)" then
    自动刷新 = 3
  elseif result.突破设置 == "个人突破(9场刷新)" then
    自动刷新 = 4
  end
  if result.个人突破顺序 == "优先打勋章少的" then
    个人突破顺序 = 1
  elseif result.个人突破顺序 == "优先打勋章多的" then
    个人突破顺序 = 2
  end
  if result.个人突破结束 == "锁屏" then
    个人突破结束 = 1
  elseif result.个人突破结束 == "挂机等邀请" then
    个人突破结束 = 2
  end
  突破等待 = 1
  if result.突破等待 == "不等，直接进" then
    突破等待 = 1
  elseif result.突破等待 == "等10分钟再操作" then
    突破等待 = 2
  elseif result.突破等待 == "等10分钟并且锁屏" then
    突破等待 = 3
  end
  if result.突破结束判定 == "第一页全破或者失败算结束" then
    突破结束判定 = 1
  elseif result.突破结束判定 == "打到90%算结束" then
    突破结束判定 = 2
  end
  if result.寮突破CD == "精确的10分钟" then
    寮突破CD = 1
  elseif result.寮突破CD == "等10-12分钟再进" then
    寮突破CD = 2
  elseif result.寮突破CD == "等12-15分钟再进" then
    寮突破CD = 3
  end
  if result.突破接受邀请 == "突破时不接受邀请" then
    突破接受邀请 = 0
  elseif result.突破接受邀请 == "突破时接受邀请" then
    突破接受邀请 = 1
  end
  if result.组队突破 == "只打单人突破" then
    组队突破 = 0
  elseif result.组队突破 == "单人组队都突破" then
    组队突破 = 1
  elseif result.组队突破 == "只打组队突破" then
    组队突破 = 2
  end
  if result.组队突破几人 == "2人" then
    组队突破几人 = 2
  elseif result.组队突破几人 == "3人" then
    组队突破几人 = 3
  elseif result.组队突破几人 == "只开组不邀请" then
    组队突破几人 = 4
  end
  if result.妖气延迟 == "不延迟" then
    妖气延迟 = 0
  elseif result.妖气延迟 == "0.1秒" then
    妖气延迟 = 1
  elseif result.妖气延迟 == "0.2秒" then
    妖气延迟 = 2
  elseif result.妖气延迟 == "0.3秒" then
    妖气延迟 = 3
  elseif result.妖气延迟 == "0.4秒" then
    妖气延迟 = 4
  elseif result.妖气延迟 == "0.5秒" then
    妖气延迟 = 5
  elseif result.妖气延迟 == "0.6秒" then
    妖气延迟 = 6
  elseif result.妖气延迟 == "0.7秒" then
    妖气延迟 = 7
  elseif result.妖气延迟 == "0.8秒" then
    妖气延迟 = 8
  elseif result.妖气延迟 == "0.9秒" then
    妖气延迟 = 9
  elseif result.妖气延迟 == "1.0秒" then
    妖气延迟 = 10
  elseif result.妖气延迟 == "1.1秒" then
    妖气延迟 = 11
  elseif result.妖气延迟 == "1.2秒" then
    妖气延迟 = 12
  elseif result.妖气延迟 == "1.3秒" then
    妖气延迟 = 13
  elseif result.妖气延迟 == "1.4秒" then
    妖气延迟 = 14
  elseif result.妖气延迟 == "1.5秒" then
    妖气延迟 = 15
  elseif result.妖气延迟 == "2秒" then
    妖气延迟 = 20
  elseif result.妖气延迟 == "3秒" then
    妖气延迟 = 30
  elseif result.妖气延迟 == "4秒" then
    妖气延迟 = 40
  elseif result.妖气延迟 == "5秒" then
    妖气延迟 = 50
  end
  
  if result.妖气做不做队长.队长离开，我也离开 then
    妖气做不做队长 = 1
  end
  if result.妖气封印选择.椒图 then
    找椒图 = 1
  end
  if result.妖气封印选择.鬼使黑 then
    找鬼使黑 = 1
  end
  if result.妖气封印选择.骨女 then
    找骨女 = 1
  end
  if result.妖气封印选择.二口女 then
    找二口女 = 1
  end
  if result.妖气封印选择.海坊主 then
    找海坊主 = 1
  end
  if result.妖气封印选择.姑获鸟 then
    找姑获鸟 = 1
  end
  if result.妖气封印选择.经验妖怪 then
    找经验妖怪 = 1
  end
  if result.妖气封印选择.金币妖怪 then
    找金币妖怪 = 1
  end
  if result.妖气封印选择.跳跳哥哥 then
    找跳跳哥哥 = 1
  end
  if result.妖气封印选择.石距 then
    找石距 = 1
  end
  if result.妖气封印选择.年兽 then
    找年兽 = 1
  end
  if result.妖气封印选择.饿鬼 then
    找饿鬼 = 1
  end
  if result.妖气封印选择.组队突破 then
    找组队突破 = 1
  end
  if result.妖气封印选择.小松丸 then
    找小松丸 = 1
  end
  
end
