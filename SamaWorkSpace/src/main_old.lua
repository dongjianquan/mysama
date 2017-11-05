
function tuitu_old()
  sysLog("在用旧版")
  mSleep(1000)
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
  local start_count = 0
  local 打完boss = false
  local 打完boss计时 = 0
  local 打经验怪 = false --第一遍只打经验怪，走一个来回就全打
  if 刷经验怪 == 1 or 刷金币怪==1 or 刷御魂怪 == 1 then
    打经验怪 = true
  end
  local 卡屏次数 = 0
  local 选过几层了 = false
  local 开始时间 = mTime()
  local 需要拖动 = true
  local 个人第几个 = 1
  local 个人突破次数 = 0 
  local 自动突破次数 = 0 
  local 阴阳寮开始时间 = 1
  local 买过体力了 = false
  local 需要检测前台 = false
  local 战斗式神换完了 = false
  local 是否换式神 = false
  if 功能 == 1 then
    是否换式神 = true
  end
  local 三号位满 = false
  local 五号位满 = false
  local 首次进入撒豆 = true
  local 上次战斗时间= mTime()
  local 卡屏坐标 = {}
  local 检测过了 = false
  local 目标怪物数量 = 0
  local 失败次数 = 0
  local 是boss战 = false
  local 是第二章 = false
  local 刚进副本 = true
  if 功能 == 8 then
    刚进副本 = true
  end
  local 进入战斗切换 = false
  local 打了N只指定怪 = 0 
  local 打怪数量超过了 = false
  local 找到指定怪物 =false
  local 进入个人突破 = false
  local 进入阴阳寮突破 = false
  local 刚进入组队界面 = true
  local 上次战斗胜利 = true
  local 没有体力了 = false
  local 发现了石距 = false
  local 御魂结束 = false
  local 觉醒结束 = false
  local 正在组队 = false
  local 组队探索后可以继续 = false
  local 拖图次数 = 0
  local 战斗开始时间 = 0
  local 从战斗中出来 = false
  local 有满狗粮 = false
  local 战斗失败时间 = 0
  local 上次邀请时间 = 0
  local 首次组队 = true
  local 首次选择探索好友 = true
  local 上次组队邀请时间 = mTime()
  local 首次被邀请组队 = true
  local 组队邀请次数 = 0
  local 百鬼邀请index = 0
  local 百鬼邀请第几个 = 1
  local 百鬼邀请是否要拖动 = true
  local 同一个人邀请次数 = 0
  local 好友寄养界面index = 0
  local 好友寄养第几个 = 1
  local 是否可以寄养 = false
  local 是否要拖动好友寄养 = false
  local 首次进入聊天 = true
  local 刷赞时间 = mTime()
  local 脚本开始时间 = mTime()
  local 组队界面持续时间 = 0
  local 当前结界状态 = 0 --0代表在我的，1代表在别人的
  local 结界计算时间 = mTime()
  local 第几回合 = 1
  local 打了几次探索 = 0
  local 要发呆一下 =false
  local 打了几次妖气 = 0
  local 今天失败次数 =0
  local 今天成功次数 =0
  local 打了几次阴阳寮 = 0
  local 要打妖怪退治 = false
  local 打完妖怪退治了 = false
  local 是打斗技还是鬼王 = 0--0是退治，1是斗技，2是鬼王
  local 阴阳寮last = 0
  local 阴阳寮now = 1
  local 点添加好友次数= 0
  local 御魂觉醒连续失败次数Temp = 0
  local 业原火点挑战次数 = 0
  local 队员进副本时间 = 0
  local 战斗计数 = 0
  local 日常次数记录 = 0
  local 第二回合切换 = true
  local 第三回合切换 = true
  local 刚才在打妖气 = false
  local	打完鬼王了 = false
  local	要打鬼王 = false
  local 战斗结束用来判定次数 = false
  local 换过狗粮了 = false
  local 内存释放时间 = mTime()
  if 是否有停止时间 then
    脚本开始时间 = 脚本开始时间 + 脚本停止时间*60*1000
  end
  --ver = getOSType() 
  if ver == "iOS" then 
    需要检测前台 = true
  end
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
        
        if 随机发呆 == 1 and (功能 == 1 or 功能 == 5 or 功能 == 21 or 功能 == 20 or 功能 == 10 or 功能 == 6) then
          local 发呆间隔 = math.floor(math.floor((mTime() - 上次发呆时间)/1000)/60)
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
        
        if 随机点击 == 1 and (功能 == 1 or 功能 == 5 or 功能 == 21 or 功能 == 20 or 功能 == 10 or 功能 == 6) then
          local 点击间隔 = math.floor((mTime() - 上次点击时间)/1000)
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
        
        if 妖怪退治 == 1 then
          if 打完妖怪退治了 == false then
            if now_time >= 1300 and now_time <= 1400 then
              要打妖怪退治 = true
            elseif now_time >= 2000 and now_time <= 2100 then
              要打妖怪退治 = true
            else
              要打妖怪退治 = false
            end
          else
            if now_time >= 1300 and now_time <= 1400 then
            elseif now_time >= 2000 and now_time <= 2100 then
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
        --99代表选择了一键日常，1代表在做御魂，2代表御魂结束正在切换到觉醒，用2来判定拒绝组队，3代表觉醒
        if 日常进度 == 99 then
          御魂觉醒失败次数 = 999
          日常进度 = 1
          功能 = 4
        elseif 御魂结束 and 日常进度 == 1 then
          日常进度 = 2
          功能 = 3
        elseif 觉醒结束 and 日常进度 == 3 then
          日常进度 = 0
          if 日常御魂觉醒后 == 5 then
            震动锁屏()
            lua_exit()
          end
          功能 = 日常御魂觉醒后
          刷御魂次数 = 999
          刷觉醒次数 = 999
        end	
        if 功能 ~= 5  then
          定期妖气相关()
        end
        if multiColor2(悬赏邀请,90) then
          sysLog("悬赏邀请")
          --showHD("有悬赏邀请")
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
        elseif multiColor2(悬赏邀请1536,90) then
          sysLog("悬赏邀请")
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
        elseif multiColor2(战斗中,90) then
          --sysLog("战斗中")
          if 功能==3 or 功能 ==4 then
            showHD_b("胜利："..今天成功次数.."次,失败："..今天失败次数.."次")
          else
            showHD_b("战斗中")
          end
          组队邀请判断过 = false
          有满狗粮 = false
          if ipad没有缩放 and w == 1536 or w == 2048 then
            setScreenScale(768,1024)
            重写推图参数()
          end
          缩放处理相关()
          if 功能 == 99 then
            mSleep(500)
            if multiColor2(兔子舞,88) then
              sysLog("兔子舞")
              --	showHD_b("战斗中-兔子舞")
              click(兔子舞.选择[1],兔子舞.选择[2])
              mSleep(500)
              click(兔子舞.释放[1],兔子舞.释放[2])
              mSleep(500)
            elseif multiColor2(打火机,88) and multiColor2(座敷平砍,88) then
              sysLog("打火机")
              --showHD_b("战斗中-打火机")
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
              --elseif false then
            elseif multiColor2(清明盾,88) then
              sysLog("清明盾")
              --showHD_b("战斗中-清明盾")
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
            elseif multiColor2(海坊主平砍,88) then
              sysLog("海坊主平砍")
              click(random_click(海坊主平砍.选择[1],海坊主平砍.选择[2]))
              mSleep(500)
              打哪个怪()
            elseif multiColor2(妖刀平砍,88) or multiColor2(天狗平砍,88) or multiColor2(吸血平砍,88) or multiColor2(酒吞平砍,88) or multiColor2(鸟平砍,88) or multiColor2(茨木平砍,88) then
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
            elseif multiColor2(惠比寿平砍,88) then	
              sysLog("惠比寿平砍")
              click(random_click(惠比寿平砍.选择[1],惠比寿平砍.选择[2]))
              mSleep(500)
              打哪个怪()
            elseif multiColor2(莹草平砍,88) then	
              sysLog("莹草平砍")
              click(random_click(莹草平砍.选择[1],莹草平砍.选择[2]))
              mSleep(500)
              打哪个怪()
            elseif 清明技能 == 1 and multiColor2(清明平砍,88) then	
              sysLog("清明平砍")
              click(random_click(清明平砍.选择[1],清明平砍.选择[2]))
              mSleep(500)
              打哪个怪()
            elseif multiColor2(战斗要待机,90) then
              --mSleep(1000)
            end
          end
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
          --if multiColor2(战斗中调整视角,90) then
          if 正在组队 == false then
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
          if (功能 == 1 or (功能 == 8 and 正在组队)) and 进入阴阳寮突破 == false and 打标记次数 <= 3 then
            sysLog("推图打标记"..推图打标记)
            sysLog("打标记次数"..打标记次数)
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
            打标记次数 = 打标记次数 + 1
            mSleep(1000)
          end
          if 突破打标记 == 1 then
            if (功能 == 6 or 功能 == 7) and 打标记次数 <=5  then
              sysLog("非结合打标记")
              mSleep(200)
              打标记次数 = 打标记次数 +1
              click(打标记位置[3][1],打标记位置[3][2])
              mSleep(1000)
            end
            if (功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 5 or 功能 == 20 or 功能 == 21) and 自动突破 == 1 and 进入个人突破 and 打标记次数 <= 5 then
              sysLog("进入个人突破打标记")
              mSleep(200)
              打标记次数 = 打标记次数 +1
              click(打标记位置[3][1],打标记位置[3][2])
              mSleep(1000)
            end
            
            if (功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 5 or 功能 == 20 or 功能 == 21) and 自动阴阳寮 == 1 and 进入阴阳寮突破 and 打标记次数 <= 5 then
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
            --if multiColor2(普攻判定阴阳师,90) then
            --	click(普攻判定阴阳师.点击[1],普攻判定阴阳师.点击[2])
            --	mSleep(500)
            --end
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
            战斗计数 = 0
            进入战斗切换 = false
            战斗开始时间= mTime()
            if 功能 == 5 then
              妖气封印次数 = 妖气封印次数 -1
              打了几次妖气 = 打了几次妖气 +1
              sysLog("妖气封印次数 - 1,当前妖气封印次数="..妖气封印次数)
            end
            if 功能 == 3 then
              刷觉醒次数 = 刷觉醒次数 -1
              sysLog("刷觉醒次数 - 1,刷觉醒次数="..刷觉醒次数)
            end
            if 功能 == 4 then
              刷御魂次数 = 刷御魂次数 -1
              sysLog("刷御魂次数 - 1,刷御魂次数="..刷御魂次数)
            end
            --mSleep(500)
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
          if 不点自动战斗 == 0 and mTime() - 战斗开始时间 > 7000 then
            --sysLog("检测自动战斗")
            if 功能 ~= 99 and multiColor2(手动攻击,85) then
              sysLog("点一下自动战斗")
              click(手动攻击.点击[1],手动攻击.点击[2])
              mSleep(500)
            end
          end
          战斗计数 = 战斗计数 +1
          战斗结束用来判定次数 = true
          start_time = mTime()
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
            sysLog("体力不足锁频")
            lockDevice()
            setStringConfig("lua_exit","欢迎回来，上次因为您选择体力不足锁屏而停止脚本。")
            lua_exit()
          elseif	体力不足 == 3 then
            vibrator()
            setStringConfig("lua_exit","欢迎回来，上次因为您选择体力不足震动而停止脚本。")
            mSleep(30000)
            lockDevice()
            lua_exit()
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
          end
          mSleep(1000)
        elseif 功能 ~= 8 and 功能 ~= 50 and (multiColor2(组队界面有左边,90) or multiColor2(组队界面有左边1,90)) then
          sysLog("组队界面有左边"..妖气封印设置)
          showHD_b("组队界面，点一下")
          是否换式神 = false
          if 功能 == 3 or 功能 == 4 or 功能 == 30 then
            click(random_click(组队界面.点一下[1],组队界面.点一下[2]))
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
        elseif multiColor2(组队邀请,90) then
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
              click(副本探索界面.探索[1],副本探索界面.探索[2])
              mSleep(1000)
            elseif multiColor2(副本探索界面,90) then
              click(副本探索界面.探索[1],副本探索界面.探索[2])
              mSleep(1000)
            end
          else
            if 日常进度 ~= 0 then
              if 日常进度 == 1 and 御魂结束 == false and 刷御魂次数 > 0 then
                click(random_click(组队邀请.确定[1],组队邀请.确定[2]))
                开始时间 = mTime()
              elseif 日常进度 == 3 and 觉醒结束 == false and 刷觉醒次数 > 0 then
                click(random_click(组队邀请.确定[1],组队邀请.确定[2]))
                开始时间 = mTime()
              else
                click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
              end
            elseif (功能== 1 or 功能== 3 or 功能== 4) and 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
              click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
            elseif (功能== 1 or 功能== 3 or 功能== 4 or 功能== 6) and 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
              click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
            elseif (功能== 1 or 功能== 3 or 功能== 4) and 定期妖气相关() then
              click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
            elseif (要打妖怪退治 or 要打鬼王) and 功能~= 8 then
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
            elseif 功能 == 8 or 功能 == 50 then
              if 是否突破卷满 == 1 then
                click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
              elseif 本轮阴阳寮开始 == true then
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
            elseif 功能== 10 then
              click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
            elseif 功能== 1 then
              if 推图时拒绝邀请 == 1 then
                click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
              else
                click(random_click(组队邀请.确定[1],组队邀请.确定[2]))
              end
            elseif 功能 == 30 then
              if 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
                click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
              elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
                sysLog("自动阴阳寮")
                click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
              else
                click(random_click(组队邀请.确定[1],组队邀请.确定[2]))
              end
            elseif 组队单刷 == 1	 then
              click(random_click(组队邀请.取消[1],组队邀请.取消[2]))
            else
              click(random_click(组队邀请.确定[1],组队邀请.确定[2]))
              mSleep(5000)
            end
          end
          上次组队邀请时间 = mTime()
          mSleep(random_time())
        elseif multiColor2(点开组队邀请,90) then
          click(random_click(点开组队邀请.点击[1],点开组队邀请.点击[2]))
          mSleep(2000)
        elseif multiColor2(组队界面,90) then
          --sysLog("组队界面")
          showHD_b("组队界面")
          是否换式神 = false
          if 刚进入组队界面 then	
            sysLog("刚进入组队界面")
            mSleep(1000)
            刚进入组队界面 = false					
            if 功能 == 5 then
              组队界面持续时间 = mTime()
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
            elseif (功能 ==1 or 功能== 3 or 功能== 4 or 功能== 6 or 功能== 20 or 功能== 21) and 从觉醒挑战界面进入 == false then
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
            
            if (功能 ==1 or 功能== 3 or 功能== 4 or 功能== 6 or 功能== 20 or 功能== 21) and 定期妖气相关() then
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
                else
                  if 目前是缩放状态 then
                    sysLog("目前是缩放状态")
                    目前是缩放状态 = false
                    resetScreenScale()
                    重写界面参数(w *h)
                  end
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
                      click(random_click(组队界面.刷新[1],组队界面.刷新[2]))
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
                    重写界面参数(w *h)
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
              if 功能 == 30 then
                click(random_click(组队界面.创建[1],组队界面.创建[2]))
              elseif 组队单刷 == 3 then
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
              elseif 组队单刷 == 2 then
                showHD_b("创建御魂觉醒队伍")
                click(random_click(组队界面.创建[1],组队界面.创建[2]))
                mSleep(1000)
              elseif 组队单刷 == 1 then
                click(random_click(组队界面.关闭[1],组队界面.关闭[2]))
              end
              mSleep(1000)
            end
            if 组队界面持续时间 > 0 and mTime() - 组队界面持续时间 > 300*1000 then
              组队界面持续时间 = 0
              showHD_b("30秒内未能开始，退出开组")
              click(random_click(组队界面.关闭[1],组队界面.关闭[2]))
              缩放处理相关()
            end
          end
        elseif (multiColor2(战斗准备,90) or multiColor2(战斗准备1,90)) then
          sysLog("战斗准备")
          showHD_b("战斗准备")
          if ipad没有缩放 and w == 1536 or w == 2048 then
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
                    click(random_click(战斗准备.更换式神[1],战斗准备.更换式神[2],30))
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
              sysLog("不换狗粮，开始准备")
              showHD_b("不换狗粮，直接准备")
              click(random_click(战斗准备.点击[1],战斗准备.点击[2],50))
              mSleep(500)
              for i=1,30 do
                if multiColor(战斗中,90) then
                  mSleep(200)
                  break
                end
                mSleep(200)
              end
            end
          else
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
        elseif multiColor2(观战界面,90) or multiColor2(观战界面1,90) then
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
            if 上R卡 == 1 then
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
        elseif multiColor2(更换式神界面,90) or multiColor2(更换式神界面1,90) or multiColor2(更换式神界面2,90) or multiColor2(更换式神界面3,90) or multiColor2(更换式神界面4,90) or multiColor2(更换式神界面日服,90) then
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
            if 上N卡 == 1 and 上R卡 == 1 then
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
          sysLog("战斗结束领奖")
          if 功能==3 or 功能 ==4 then
            showHD_b("胜利："..今天成功次数.."次,失败："..今天失败次数.."次")
          else
            showHD_b("战斗结束领奖")
          end
          if 功能 == 88 then
            if 日常步骤 == 5 then
              if 日常次数记录 >=3 then
                日常次数记录 = 0
                日常步骤 = 6
                日常御魂做完了 = false
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
          click(random_click(战斗结束领奖.点击[1],战斗结束领奖.点击[2]))
          进入战斗切换 = true
          打标记次数 = 0
          第几回合 = 1
          进入阴阳寮突破 = false		
          上次战斗胜利 = true	
          组队邀请次数 = 0
          第二回合切换 = true
          第三回合切换 = true
          从战斗中出来 = true
          if 进入个人突破 then
            进入个人突破 = false
            个人突破次数 = 个人突破次数 +1
            if #个人突破失败位置 ~= 0 then
              for j=#个人突破失败位置,1,-1 do
                if 个人突破失败位置[j] == 上次突破选择位置 then
                  table.remove(个人突破失败位置,j)
                  break
                end
              end
            end
          end
          mSleep(random_time())
        elseif multiColor2(领奖结束,90) then
          sysLog("领奖结束")
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
          if 功能 == 5 then
            showHD_b("妖气剩余次数："..妖气封印次数)
            if 妖气封印次数 <= 0 then
              震动锁屏()
              setStringConfig("lua_exit","欢迎回来，上次因为妖气封印次数不足而停止脚本。")
              lua_exit()
            end
          end
          if 功能 == 3  then
            showHD_b("觉醒剩余次数："..刷觉醒次数)
            if 刷觉醒次数 <= 0 then
              if 日常进度 ~= 0 then
                觉醒结束 = true
                选过几层了 = false
              else
                震动锁屏()
                setStringConfig("lua_exit","欢迎回来，上次因为觉醒次数不足而停止脚本。")
                lua_exit()
              end
            end
          end
          if 功能 == 4 then
            showHD_b("御魂剩余次数："..刷御魂次数)
            if 刷御魂次数 <= 0 then
              if 日常进度 ~= 0 then
                御魂结束 = true
                选过几层了 = false
              else
                震动锁屏()
                setStringConfig("lua_exit","欢迎回来，上次因为御魂次数不足而停止脚本。")
                lua_exit()
              end
            end
          end
          if 战斗结束用来判定次数 then
            战斗结束用来判定次数 = false
            if 进入阴阳寮突破 == false and 进入个人突破 == false and 刚才在打妖气 == false then
              if 功能 == 1 then
                打了几次探索 = 打了几次探索 + 1
                if 打了几次探索 > 几次检测一次满 then
                  打了几次探索 = 0
                end
                数据统计[1] = 数据统计[1]+1
              end
              if 功能 == 5 then
                数据统计[2] = 数据统计[2]+1
                妖气封印次数 = 妖气封印次数 -1
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
            else
              if 进入阴阳寮突破 then
                数据统计[7] = 数据统计[7]+1
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
                  日常步骤 = 99
                end
              end
              if 日常步骤 == 6 then
                if 日常次数记录 >=3 then
                  日常次数记录 = 0
                  日常步骤 = 7
                end
              end
            end
          end
          if 关闭统计 == 0 then
            toast("★  探索："..数据统计[1].."次  妖气："..数据统计[2].."次  ★\n★  觉醒："..数据统计[3].."次  御魂："..数据统计[4].."次  ★\n★  业原："..数据统计[5].."次  御灵："..数据统计[6].."次  ★\n★  寮突："..数据统计[7].."次  个人："..数据统计[8].."次  ★")
          end
          --if( 功能 == 3 or 功能 == 4 )and 组队单刷 == 3 then
          --  mSleep(5000)
          --end
          mSleep(random_time())
        elseif 战斗结束后点开了人() then
          sysLog("战斗结束后点开了人")
          click(random_click(更换式神界面.返回[1],更换式神界面.返回[2]))
          mSleep(random_time())
        elseif multiColor2(退出探索,90) or multiColor2(退出探索日服,90) then
          sysLog("退出探索")
          click(random_click(退出探索.确认退出[1],退出探索.确认退出[2]))
          mSleep(random_time())
        elseif multiColor2(阴阳寮申请,90) or multiColor2(阴阳寮申请1,90)  then
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
        elseif multiColor2(挂机御魂邀请界面,90) or multiColor2(挂机御魂邀请界面1,90) or multiColor2(挂机御魂邀请界面日服,90) then
          sysLog("挂机御魂邀请界面")
          if 功能 == 30 and 是否在阴阳寮组队 == false then
            mSleep(1000)
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
        elseif multiColor2(创建队伍,90) then
          sysLog("创建队伍")
          showHD_b("创建队伍")
          if 功能 == 30 then
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
        elseif multiColor2(式神育成界面,90) then
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
        elseif multiColor2(新好友寄养界面,90) then
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
        elseif multiColor2(结界界面,90) or multiColor2(结界界面竹林,90) or multiColor2(结界界面斗鱼,90) then
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
        elseif multiColor2(阴阳寮界面,90) or multiColor2(阴阳寮界面1,90) then
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
        elseif multiColor2(祈愿界面,90) then
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
        elseif multiColor2(阴阳寮界面没有寮,90) then
          sysLog("阴阳寮界面没有寮")
          click(random_click(阴阳寮界面.关闭[1],阴阳寮界面.关闭[2]))
          mSleep(1000)
        elseif multiColor2(停止运行,90) then
          sysLog("停止运行")
          click(random_click(停止运行.确定[1],停止运行.确定[2]))
          mSleep(random_time())
        elseif multiColor2(确定买咒符,90) then
          if 兑换勋章咒符次数 <= 0 then
            setStringConfig("lua_exit","欢迎回来，上次因为兑换咒符次数不足而停止脚本。")
            lua_exit()
          end
          兑换勋章咒符次数 = 兑换勋章咒符次数 -1
          click(random_click(确定买咒符.点击[1],确定买咒符.点击[2]))
          mSleep(2000)
        elseif 功能 == 11 and multiColor2(商城界面,90) then
          sysLog("商城界面")
          if 找咒符位置() then
          end
          mSleep(random_time())
        elseif multiColor2(组队详情,90) then
          sysLog("组队详情，功能 = "..功能)
          是否换式神 = false
          进入战斗切换 = true
          打标记次数 = 0
          第几回合 = 1
          缩放处理相关()
          if 要打鬼王 then
            click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
          elseif 功能 == 30 or 功能 == 6 or 是否在阴阳寮组队 then
            sysLog("进入是否在阴阳寮组队")
            if 功能 == 30 and 开组几人 == 2 and isColorArray2(组队详情.开组2人,95) == false then
              showHD_b("组队详情-开始战斗")
              click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
              首次进入组队详情 = true
            elseif 功能 == 30 and 开组几人 == 3 and isColorArray2(组队详情.开组3人,95) == false then
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
            elseif (功能 == 6 or 是否在阴阳寮组队) and 组队突破几人 == 4 and isColorArray(组队详情.开组2人,95) == false then
              showHD_b("组队详情-开始战斗")
              click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
              首次进入组队详情 = true
            else
              if 首次进入组队详情 then
                首次进入组队详情 = false
                if 功能 == 30 then
                  上次邀请时间 = mTime() 
                else
                  上次邀请时间 = mTime() - 15000
                end
              end
              if (功能 == 6 or 是否在阴阳寮组队) and 组队突破几人 == 4 then
                
              else
                if mTime() - 上次邀请时间 > 10000 then
                  上次邀请时间 = mTime()
                  showHD_b("组队详情-去拉好友")
                  click(random_click(组队详情.开组3人[1],组队详情.开组3人[2]))
                  mSleep(1000)
                end
              end
            end
          elseif 功能 == 1 and (发现石距自动打 ==1 or 发现年兽自动打==1) then
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
          elseif 功能 == 6 or 功能 == 7 then--混组
            showHD_b("组队详情-混组，退队")
            click(random_click(组队详情.离开队伍[1],组队详情.离开队伍[2]))
            mSleep(2000)
            click(random_click(提示框.确定[1],提示框.确定[2]))
            mSleep(2000)
          elseif 功能 == 8 or 功能 == 50 then
            mSleep(1000)
          elseif 组队单刷 == 3 then--混组
            if mTime() - 开始时间 > 120*1000 then
              showHD_b("120秒内未开始，退出队伍")
              sysLog("开始时间 > 30*1000")
              click(random_click(组队详情.离开队伍[1],组队详情.离开队伍[2]))
              mSleep(2000)
              click(random_click(提示框.确定[1],提示框.确定[2]))
              mSleep(2000)
              开始时间 = mTime()
            end
            if isColorArray(组队详情.开始战斗,90) then
              showHD_b("混组，不做队长，退组")
              click(random_click(组队详情.离开队伍[1],组队详情.离开队伍[2]))
              mSleep(2000)
              click(random_click(提示框.确定[1],提示框.确定[2]))
              mSleep(2000)
            end
          elseif 组队单刷 == 2 then--开组
            sysLog("组队单刷 == 2")
            sysLog("开组几人 == "..开组几人)
            if mTime() - 开始时间 > 120*1000 then
              sysLog("开始时间 > 30*1000")
              showHD_b("120秒内未开始，重新开组")
              click(random_click(组队详情.离开队伍[1],组队详情.离开队伍[2]))
              mSleep(2000)
              click(random_click(提示框.确定[1],提示框.确定[2]))
              mSleep(2000)
              开始时间 = mTime()
            end
            if 开组几人==2 and isColorArray(组队详情.开组2人,90) == false then
              showHD_b("2人开组，开始战斗")
              click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
            elseif 开组几人==3 and isColorArray(组队详情.开组3人,90) == false then
              showHD_b("3人开组，开始战斗")
              click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
            end
          end
          mSleep(1000)
        elseif multiColor2(组队详情日服,90) then
          sysLog("组队详情日服 = "..功能)
          是否换式神 = false
          进入战斗切换 = true
          打标记次数 = 0
          第几回合 = 1
          if 功能 == 30 or 功能 == 6 or 是否在阴阳寮组队 then
            sysLog("进入是否在阴阳寮组队")
            if 功能 == 30 and 开组几人 == 2 and isColorArray2(组队详情日服.开组2人,95) == false then
              showHD_b("组队详情-开始战斗")
              click(random_click(组队详情日服.开始战斗[1],组队详情日服.开始战斗[2]))
              首次进入组队详情 = true
            elseif 功能 == 30 and 开组几人 == 3 and isColorArray2(组队详情日服.开组3人,95) == false then
              showHD_b("组队详情-开始战斗")
              click(random_click(组队详情日服.开始战斗[1],组队详情日服.开始战斗[2]))
              首次进入组队详情 = true
            elseif (功能 == 6 or 是否在阴阳寮组队) and 组队突破几人 == 2 and isColorArray2(组队详情日服.开组2人,95) == false then
              showHD_b("组队详情-开始战斗")
              click(random_click(组队详情日服.开始战斗[1],组队详情日服.开始战斗[2]))
              首次进入组队详情 = true
            elseif (功能 == 6 or 是否在阴阳寮组队) and 组队突破几人 == 3 and isColorArray2(组队详情日服.开组3人,95) == false then
              showHD_b("组队详情-开始战斗")
              click(random_click(组队详情日服.开始战斗[1],组队详情日服.开始战斗[2]))
              首次进入组队详情 = true
            elseif (功能 == 6 or 是否在阴阳寮组队) and 组队突破几人 == 4 and isColorArray(组队详情.开组2人,95) == false then
              showHD_b("组队详情-开始战斗")
              click(random_click(组队详情.开始战斗[1],组队详情.开始战斗[2]))
              首次进入组队详情 = true
            else
              if 首次进入组队详情 then
                首次进入组队详情 = false
                if 功能 == 30 then
                  上次邀请时间 = mTime() - 15000
                else
                  上次邀请时间 = mTime() - 15000
                end
              end
              if (功能 == 6 or 是否在阴阳寮组队) and 组队突破几人 == 4 then
                
              else
                if mTime() - 上次邀请时间 > 10000 then
                  上次邀请时间 = mTime()
                  showHD_b("组队详情-去拉好友")
                  click(random_click(组队详情日服.开组3人[1],组队详情日服.开组3人[2]))
                  mSleep(1000)
                end
              end
            end
          elseif 功能 == 1 and (发现石距自动打 or 发现年兽自动打) then
            if isColorArray(组队详情日服.开组3人,90) == false then
              showHD_b("3人开组，开始战斗")
              click(random_click(组队详情日服.开始战斗[1],组队详情日服.开始战斗[2]))
            end
          elseif 功能 == 5 then--开组
            if isColorArray(组队详情日服.开始战斗,90) then
              if 妖气做不做队长 == 0 then
                showHD_b("组队详情-开始战斗")
                click(random_click(组队详情日服.开始战斗[1],组队详情日服.开始战斗[2]))
              else
                showHD_b("妖气队长走了，我也走")
                click(random_click(组队详情日服.离开队伍[1],组队详情日服.离开队伍[2]))
                mSleep(2000)
                click(random_click(提示框.确定[1],提示框.确定[2]))
                mSleep(2000)
              end
            end
          elseif 功能 == 6 or 功能 == 7 then--混组
            showHD_b("组队详情-混组，退队")
            click(random_click(组队详情日服.离开队伍[1],组队详情日服.离开队伍[2]))
            mSleep(2000)
            click(random_click(提示框.确定[1],提示框.确定[2]))
            mSleep(2000)
          elseif 功能 == 8 or 功能 == 50 then
            mSleep(1000)
          elseif 组队单刷 == 3 then--混组
            if mTime() - 开始时间 > 120*1000 then
              showHD_b("120秒内未开始，退出队伍")
              sysLog("开始时间 > 30*1000")
              click(random_click(组队详情日服.离开队伍[1],组队详情日服.离开队伍[2]))
              mSleep(2000)
              click(random_click(提示框.确定[1],提示框.确定[2]))
              mSleep(2000)
              开始时间 = mTime()
            end
            if isColorArray(组队详情日服.开始战斗,90) then
              showHD_b("混组，不做队长，退组")
              click(random_click(组队详情日服.离开队伍[1],组队详情日服.离开队伍[2]))
              mSleep(2000)
              click(random_click(提示框.确定[1],提示框.确定[2]))
              mSleep(2000)
            end
          elseif 组队单刷 == 2 then--开组
            sysLog("组队单刷 == 2")
            sysLog("开组几人 == "..开组几人)
            if mTime() - 开始时间 > 120*1000 then
              sysLog("开始时间 > 30*1000")
              showHD_b("120秒内未开始，重新开组")
              click(random_click(组队详情日服.离开队伍[1],组队详情日服.离开队伍[2]))
              mSleep(2000)
              click(random_click(提示框.确定[1],提示框.确定[2]))
              mSleep(2000)
              开始时间 = mTime()
            end
            if 开组几人==2 and isColorArray(组队详情日服.开组2人,90) == false then
              showHD_b("2人开组，开始战斗")
              click(random_click(组队详情日服.开始战斗[1],组队详情日服.开始战斗[2]))
            elseif 开组几人==3 and isColorArray(组队详情日服.开组3人,90) == false then
              showHD_b("3人开组，开始战斗")
              click(random_click(组队详情日服.开始战斗[1],组队详情日服.开始战斗[2]))
            end
          end
          mSleep(1000)
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
        elseif multiColor2(输入法界面,92) then
          sysLog("输入法界面")
          click(random_click(输入法界面.点一下[1],输入法界面.点一下[2]))
          mSleep(random_time())
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
            --click(random_click(聊天界面.关闭[1],聊天界面.关闭[2]))
          end
          mSleep(1000)
          --			click(random_click(聊天界面.频道号码[1],聊天界面.频道号码[2]))
          --			mSleep(2000)
          --			inputText("1")
          --			mSleep(2000)
          --			click(random_click(聊天界面.世界频道[1]+300,聊天界面.世界频道[2]))
          --			mSleep(1000)
          --		else
          --			click(random_click(聊天界面.点击[1],聊天界面.点击[2]))
          --			mSleep(1000)
          --			点击进入空间()
          --			mSleep(1000)
          --		end
          --	else
          --	end
          -- mSleep(random_time())
          --elseif multiColor2(空间界面,92) then
          --  sysLog("空间界面")
          --  click(random_click(空间界面.赞[1],空间界面.赞[2]))
          --  mSleep(2000)
          --	click(random_click(空间界面.留言栏[1],空间界面.留言栏[2]))
          --  mSleep(2000)
          --	inputText(刷赞留言)
          --  mSleep(2000)
          --	click(random_click(空间界面.点一下[1],空间界面.点一下[2]))
          --  mSleep(2000)
          --	click(random_click(空间界面.留言按钮[1],空间界面.留言按钮[2]))
          --  mSleep(4000)
          --	click(random_click(空间界面.关闭[1],空间界面.关闭[2]))
          --  mSleep(1000)
        elseif multiColor2(点击检查更新,92) then
          sysLog("点击检查更新")
          click(random_click(点击检查更新.点击[1],点击检查更新.点击[2]))
          mSleep(3000)
          if multiColor(提示框,90) then
            click(random_click(提示框.确定[1],提示框.确定[2]))
          end
          mSleep(random_time())
        elseif multiColor2(申请加好友,92) then
          sysLog("申请加好友")
          click(random_click(申请加好友.取消[1],申请加好友.取消[2]))
          mSleep(random_time())
        elseif multiColor2(推图中,90) then
          -- sysLog("推图中")
          --showHD_b("副本中")
          组队邀请次数 = 0
          进入阴阳寮突破 = false
          组队邀请判断过 = false
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
            if ipad没有缩放 == false and w == 1536 or w == 2048 and 刷经验怪 == 1 and 刷任意怪 == 0 and 刷金币怪 == 0 and 刷御魂怪 == 0 then
              resetScreenScale()
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
              if ipad没有缩放 and w == 1536 or w == 2048 then
                setScreenScale(768,1024)
                重写推图参数()
              end
              mSleep(2000)
            elseif 失败次数 >= 失败几次退出 then
              click(random_click(推图中.退出[1],推图中.退出[2]))
              if ipad没有缩放 and w == 1536 or w == 2048 then
                setScreenScale(768,1024)
                重写推图参数()
              end
              失败次数 = 0
              mSleep(2000)
            elseif 拖图次数 >= 副本内拖图次数 then
              click(random_click(推图中.退出[1],推图中.退出[2]))
              if ipad没有缩放 and w == 1536 or w == 2048 then
                setScreenScale(768,1024)
                重写推图参数()
              end
              拖图次数 = 0
              mSleep(2000)
            elseif 组队探索 == 1 and multiColor2(还有组队,90) == false then
              showHD_b("副本中-队员走了，退出")
              click(random_click(推图中.退出[1],推图中.退出[2]))
              if ipad没有缩放 and w == 1536 or w == 2048 then
                setScreenScale(768,1024)
                重写推图参数()
              end
              mSleep(2000)
            elseif 打完boss and mTime() - 打完boss计时 > 30*1000 then
              click(random_click(推图中.退出[1],推图中.退出[2]))
              if ipad没有缩放 and w == 1536 or w == 2048 then
                setScreenScale(768,1024)
                重写推图参数()
              end
              mSleep(2000)
            elseif 是boss战 and 副本结束领奖() then	
              --elseif false then	
              if ipad没有缩放 and w == 1536 or w == 2048 then
                setScreenScale(768,1024)
                重写推图参数()
              end
              mSleep(2000)
              start_count = 0
              打经验怪 = true 
              组队探索后可以继续 = true
            elseif 刷boss == 1 and 找boss() then	
              if ipad没有缩放 and w == 1536 or w == 2048 then
                setScreenScale(768,1024)
                重写推图参数()
              end
              start_count = 0
              是boss战 = true
              进入战斗切换 = true
              打标记次数 = 0
              第几回合 = 1
              mSleep(2000)
            elseif 刷经验怪 == 1 and 找经验怪() then
              if ipad没有缩放 and w == 1536 or w == 2048 then
                setScreenScale(768,1024)
                重写推图参数()
              end
              找到指定怪物 = true
              进入战斗切换 = true						
              mSleep(3000)
            elseif 刷金币怪 == 1 and 找金币怪() then
              if ipad没有缩放 and w == 1536 or w == 2048 then
                setScreenScale(768,1024)
                重写推图参数()
              end
              找到指定怪物 = true
              进入战斗切换 = true
              mSleep(3000)
            elseif 刷御魂怪 == 1 and 找御魂怪() then			
              if ipad没有缩放 and w == 1536 or w == 2048 then
                setScreenScale(768,1024)
                重写推图参数()
              end
              找到指定怪物 = true
              进入战斗切换 = true
              打标记次数 = 0
              mSleep(3000)
            elseif 打经验怪 == false and 刷任意怪 == 1 and 找小怪() then
              if ipad没有缩放 and w == 1536 or w == 2048 then
                setScreenScale(768,1024)
                重写推图参数()
              end
              进入战斗切换 = true
              打标记次数 = 0
              mSleep(3000)
            elseif 打怪数量超过了 and 找小怪() then
              if ipad没有缩放 and w == 1536 or w == 2048 then
                setScreenScale(768,1024)
                重写推图参数()
              end
              进入战斗切换 = true
              打标记次数 = 0
              mSleep(3000)
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
                --sysLog("打怪数量超过了左边")
                if math.mod(start_count,2) ==1 then
                  tuodong6(推图中.拖动)
                end
                
                --mSleep(500)
              else
                start_count = 0
                拖图次数 = 拖图次数 + 1
                if 打怪数量超过了 then
                  
                else
                  click(random_click(推图中.退出[1],推图中.退出[2]))
                  if w == 1536 or w == 2048 then
                    setScreenScale(768,1024)
                    重写推图参数()
                  end
                  mSleep(2000)
                end
                --mSleep(500)
              end
            end
          end
        elseif multiColor2(跳过对话,90) then
          click(random_click(跳过对话.点击[1],跳过对话.点击[2]))
          mSleep(random_time()) 
        elseif 功能 == 2 and 找剧情对话()  then
          mSleep(2000)
        elseif 功能==2 and 找小怪() then
        elseif 功能==2 and 大眼睛() then
        elseif 功能==2 and 问号() then
        elseif multiColor2(快进,90) then
          click(random_click(快进.点击[1],快进.点击[2]))
          mSleep(random_time()) 
        elseif multiColor2(新快进,90) then
          click(random_click(新快进.点击[1],新快进.点击[2]))
          mSleep(random_time()) 
        elseif  multiColor2(战斗回放界面,90) then
          click(random_click(战斗回放界面.关闭[1],战斗回放界面.关闭[2]))
          mSleep(random_time()) 
        elseif 功能 ~= 8 and 功能 ~= 50 and multiColor2(觉醒选择界面,90) then
          sysLog("觉醒选择界面")
          showHD_b("觉醒选择界面")
          if 功能 == 3 then
            是否换式神 = false
            if 日常进度 == 2 then
              日常进度 = 3
            end
            if 刷觉醒材料设置 == 4 then
              click(random_click(觉醒选择界面.点击[1],觉醒选择界面.点击[2]))
              mSleep(2000)
              click(random_click(觉醒选择界面[3][1],觉醒选择界面[3][2]))
            else
              click(random_click(觉醒选择界面[刷觉醒材料设置][1],觉醒选择界面[刷觉醒材料设置][2]))
            end
          else
            click(random_click(觉醒选择界面.关闭[1],觉醒选择界面.关闭[2]))
          end
          mSleep(1000)
        elseif 功能 ~= 8 and 功能 ~= 50 and multiColor2(觉醒选择界面1,90) then
          --showHUD(id,"选择觉醒材料",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
          sysLog("觉醒选择界面1")
          showHD_b("觉醒选择界面")
          if 功能 == 3 then
            是否换式神 = false
            if 日常进度 == 2 then
              日常进度 = 3
            end
            if 刷觉醒材料设置 == 1 then
              click(random_click(觉醒选择界面1.点击[1],觉醒选择界面1.点击[2]))
              mSleep(2000)
              click(random_click(觉醒选择界面1[1][1],觉醒选择界面1[1][2]))
            else
              click(random_click(觉醒选择界面1[刷觉醒材料设置][1],觉醒选择界面1[刷觉醒材料设置][2]))
            end
          else
            click(random_click(觉醒选择界面.关闭[1],觉醒选择界面.关闭[2]))
          end
          mSleep(1000)
        elseif 功能 ~= 8 and 功能 ~= 50 and multiColor2(新觉醒选择界面,90) then
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
            click(random_click(御魂选择界面.关闭[1],御魂选择界面.关闭[2]))
          elseif 功能 == 3 then
            是否换式神 = false
            if 日常进度 == 2 then
              日常进度 = 3
            end
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
        elseif multiColor2(组队探索界面,90) then
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
              --mSleep(1000)
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
        elseif  multiColor2(副本探索界面,90) then
          sysLog("副本探索界面")
          showHD_b("副本探索界面")
          if 功能 == 88 and 日常步骤 == 4 then
            刚进副本 =true
            click(random_click(副本探索界面.普通[1],副本探索界面.普通[2]))
            mSleep(1000)
            click(random_click(副本探索界面.探索[1],副本探索界面.探索[2]))
            mSleep(5000)
          elseif 功能 == 1 and 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
            找关闭按钮()
          elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
            找关闭按钮()
          elseif 要打妖怪退治 then
            找关闭按钮()
          elseif 要打鬼王 then
            找关闭按钮() 
          elseif (功能 == 1 or 功能 == 8) then 
            if 推图次数 == 0 then
              震动锁屏()
              setStringConfig("lua_exit","欢迎回来，上次因为副本探索次数不足而停止脚本。")
              lua_exit()
            end
            if 推图难度 == 1 then
              click(random_click(副本探索界面.普通[1],副本探索界面.普通[2]))
            elseif 推图难度 == 2 then
              click(random_click(副本探索界面.困难[1],副本探索界面.困难[2]))
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
              click(random_click(副本探索界面.探索[1],副本探索界面.探索[2]))
              组队邀请次数 = 0
              mSleep(5000)
            end
            showHD_b("剩余探索次数："..推图次数)
            推图次数 = 推图次数 -1
            sysLog("推图次数 -1,当前推图次数="..推图次数)
          else
            找关闭按钮()
          end
        elseif multiColor2(御魂选择界面,90) then
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
          elseif 功能 == 4 or 功能 == 30 or 功能 ==99 then
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
          mSleep(2000)
        elseif multiColor2(御灵界面,90) then
          showHD_b("御灵界面")
          if 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
            click(random_click(新觉醒选择界面.关闭[1],新觉醒选择界面.关闭[2]))
          elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
            showHD_b("寄养时间到，去寄养啦")
            click(random_click(御魂选择界面.关闭[1],御魂选择界面.关闭[2]))
          elseif 定期妖气相关() then
            click(random_click(御魂选择界面.关闭[1],御魂选择界面.关闭[2]))
          elseif 功能 == 21 then
            click(random_click(御灵选种类界面[刷御灵设置][1],御灵选种类界面[刷御灵设置][2]))
          else
            click(random_click(御灵界面.关闭[1],御灵界面.关闭[2]))
          end
          mSleep(1000)
        elseif multiColor2(业原火挑战界面,90) then
          sysLog("业原火挑战界面"..业原火设置)
          mSleep(1000)
          if 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
            showHD_b("阴阳寮时间到，去突破啦")
            click(random_click(业原火挑战界面.关闭[1],业原火挑战界面.关闭[2]))
          elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
            showHD_b("寄养时间到，去寄养啦")
            click(random_click(御魂选择界面.关闭[1],御魂选择界面.关闭[2]))
          elseif 定期妖气相关() then
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
          mSleep(1000)
        elseif 功能 ~= 8 and 功能 ~= 50 and 功能 ~= 1 and multiColor2(觉醒挑战界面,90) then
          --showHUD(id,"选择觉醒层数",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
          sysLog("觉醒挑战界面")
          从觉醒挑战界面进入 = true
          if 功能 == 88 and (日常步骤 == 5 or 日常步骤 == 6 ) then
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
          elseif 功能 == 30 then
            tuodong3(觉醒挑战界面.拖到后4层)
            tuodong3(觉醒挑战界面.拖到后4层)
            click(random_click(觉醒选择第几层[4][1],觉醒选择第几层[4][2]))
            mSleep(1000)
            click(random_click(觉醒挑战界面.组队[1],觉醒挑战界面.组队[2],20))
          elseif 功能 == 3 or 功能 == 4 or 功能 == 11 then
            是否换式神 = false
            local 选层数 = 0
            if 功能 == 3 or 日常进度 == 2 then
              选层数 = 刷觉醒材料几层
            elseif 功能 == 4 or 日常进度 == 1 then
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
            if 组队单刷 == 1 then
              showHD_b("觉醒挑战界面-单刷")
              click(random_click(觉醒挑战界面.挑战[1],觉醒挑战界面.挑战[2],20))
            else
              showHD_b("觉醒挑战界面-组队")
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
        elseif multiColor2(御灵挑战界面,90) then
          showHD_b("御灵挑战界面")
          if 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
            click(random_click(御灵挑战界面.关闭[1],御灵挑战界面.关闭[2]))
          elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
            showHD_b("寄养时间到，去寄养啦")
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
        elseif 功能 ~= 50 and multiColor2(个人突破,90) then
          sysLog("个人突破")
          sysLog("是否突破卷满"..是否突破卷满)
          sysLog("个人突破次数"..个人突破次数)
          showHD_b("个人突破")
          mSleep(500)
          是否换式神 = false
          if 功能 == 88 and 日常步骤 == 7 then
            个人突破次数 = 0
            click(random_click(个人突破.刷新[1],个人突破.刷新[2]))
            mSleep(2000)
            click(random_click(提示框.确定[1],提示框.确定[2]))
            日常步骤 = 8 
            自动刷新 = 3
            mSleep(2000)
          elseif 功能 == 6 then
            click(random_click(个人突破.阴阳寮[1],个人突破.阴阳寮[2]))
          elseif 是否突破卷满 == 0 and 自动阴阳寮 == 1 and (功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 5 or 功能 == 30 or 功能 == 7) and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
            sysLog("自动阴阳寮")
            click(random_click(个人突破.阴阳寮[1],个人突破.阴阳寮[2]))
          elseif multiColor2(判断卷是0,93) == false then	
            if (功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能 == 5) and 自动突破 == 1 and 是否突破卷满 == 0 then
              sysLog("是否突破卷满=0")
              click(random_click(个人突破.关闭[1],个人突破.关闭[2]))
            else
              if (功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能 == 5) and 自动突破 == 1 and 自动刷新 == 3 and 个人突破次数 >= 3 then
                if isColorArray(个人突破.刷新,90) then	
                  click(random_click(个人突破.刷新[1],个人突破.刷新[2]))
                  mSleep(2000)
                  click(random_click(提示框.确定[1],提示框.确定[2]))
                  mSleep(2000)
                end
                个人突破次数 = 0
                个人突破失败位置 = {}
                是否突破卷满 = 0
                click(random_click(个人突破.关闭[1],个人突破.关闭[2]))
              elseif 自动刷新 == 3 and 个人突破次数 >= 3 then
                if isColorArray(个人突破.刷新,90) then
                  个人突破次数 = 0
                  个人突破失败位置 = {}
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
              elseif 个人第几个 >= 10 and 自动刷新 == 4  then
                if isColorArray(个人突破.刷新,90) then
                  个人第几个 = 1
                  click(random_click(个人突破.刷新[1],个人突破.刷新[2]))
                  mSleep(2000)
                  click(random_click(提示框.确定[1],提示框.确定[2]))
                  mSleep(2000)
                end
              else
                if 自动刷新 == 2 then
                  for i=1,#个人突破选择 do
                    mSleep(1000)
                    if isColorArray(个人突破失败判定[i],93) then
                      click(random_click(个人突破选择[i][1],个人突破选择[i][2]))
                      mSleep(2000)
                      if 个人攻击() then
                        sysLog("个人攻击 = "..i)
                        mSleep(2000)
                        进入个人突破 = true
                        进入战斗切换 = true
                        break
                      end
                    end
                  end
                elseif 自动刷新 == 4 then
                  for i=个人第几个,#个人突破选择 do
                    mSleep(1000)
                    个人第几个 = 个人第几个 +1
                    if isColorArray(个人突破失败判定[i],93) then
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
                  if 勋章0() then
                    mSleep(2000)
                    if 个人攻击() then
                      sysLog("个人攻击 勋章0")
                      进入战斗切换 = true
                      mSleep(2000)
                      进入个人突破 = true
                      自动突破次数 = 自动突破次数 +1
                    else
                      click(random_click(个人突破.个人[1],个人突破.个人[2]))
                    end
                  elseif 勋章1() then
                    mSleep(2000)
                    if 个人攻击() then
                      sysLog("个人攻击 勋章1")
                      进入战斗切换 = true
                      mSleep(2000)
                      进入个人突破 = true
                      自动突破次数 = 自动突破次数 +1
                    else
                      click(random_click(个人突破.个人[1],个人突破.个人[2]))
                    end
                  elseif 勋章2() then
                    mSleep(2000)
                    if 个人攻击() then
                      sysLog("个人攻击 勋章2")
                      进入战斗切换 = true
                      mSleep(2000)
                      进入个人突破 = true
                      自动突破次数 = 自动突破次数 +1
                    else
                      click(random_click(个人突破.个人[1],个人突破.个人[2]))
                    end
                  elseif 勋章3() then
                    mSleep(2000)
                    if 个人攻击() then
                      sysLog("个人攻击 勋章3")
                      进入战斗切换 = true
                      mSleep(2000)
                      进入个人突破 = true
                      自动突破次数 = 自动突破次数 +1
                    else
                      click(random_click(个人突破.个人[1],个人突破.个人[2]))
                    end
                  elseif 勋章4() then
                    mSleep(2000)
                    if 个人攻击() then
                      sysLog("个人攻击 勋章4")
                      进入战斗切换 = true
                      mSleep(2000)
                      进入个人突破 = true
                      自动突破次数 = 自动突破次数 +1
                    else
                      click(random_click(个人突破.个人[1],个人突破.个人[2]))
                    end
                  else
                    计算个人对手()
                    if #临时个人对手 == 0 then
                      个人突破次数 = 3
                    else
                      local 随机对手 = math.random(1,#临时个人对手)
                      --click(random_click(个人突破选择[随机对手][1],个人突破选择[随机对手][2]))
                      click(random_click(临时个人对手[随机对手][1],临时个人对手[随机对手][2]))
                      mSleep(2000)
                      if 个人攻击() then
                        sysLog("个人攻击 勋章5")
                        进入战斗切换 = true
                        mSleep(2000)
                        进入个人突破 = true
                        自动突破次数 = 自动突破次数 +1
                      else
                        click(random_click(个人突破.个人[1],个人突破.个人[2]))
                      end
                    end
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
        elseif 功能 ~= 50 and multiColor2(阴阳寮突破,93) then
          --showHUD(id,"阴阳寮突破",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
          sysLog("阴阳寮突破")
          showHD_b("阴阳寮突破")
          是否换式神 = false
          进入阴阳寮突破 = true
          首次进入组队详情 = true
          选过几层了 = false
          --if mTime() > 阴阳寮开始时间 then
          if ((功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 5 or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能 == 8 or 功能 == 11 or 功能 == 7 or 功能 == 6 ) and 自动阴阳寮 == 1 and ((阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间) or 正在进行这一轮突破)) or (功能 == 6 and 突破等待 == 1) or (功能 == 6 and ((阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间) or 正在进行这一轮突破 )) then
            if (功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 5 or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能 == 8 or 功能 == 11 or 功能 == 7 or 功能 == 6 ) and 自动阴阳寮 == 1 and 阴阳寮第几个 > 3 then
              click(random_click(个人突破.关闭[1],个人突破.关闭[2]))
              阴阳寮第几个 = 1						
              if 阴阳寮now ~= 阴阳寮last then
                阴阳寮last = 阴阳寮now
                阴阳寮开始时间 = mTime() + 30*1000
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
              if 阴阳寮第几个 > 3 then
                sysLog("阴阳寮第几个>3")
                click(random_click(个人突破.关闭[1],个人突破.关闭[2]))
                阴阳寮第几个 = 1
                if 阴阳寮now ~= 阴阳寮last then
                  阴阳寮last = 阴阳寮now
                  阴阳寮开始时间 = mTime() + 30*1000
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
              elseif 突破结束判定 == 2 and multiColor2(阴阳寮击破判定点,90) then
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
                click(random_click(个人突破.关闭[1],个人突破.关闭[2]))
                正在进行这一轮突破 = false
              else
                local need_break = false
                for i=阴阳寮第几个,#阴阳寮选择 do
                  --sysLog("阴阳寮第几个"..i)
                  阴阳寮第几个 = i+1
                  正在进行这一轮突破 = true
                  if i <= 0 then
                    i = 1
                  elseif i > 3 then
                    i = 3
                  end
                  if isColorArray(判断是否有寮[i],93) == false then
                    showHD_b(i.."号有寮，今天打了"..打了几次阴阳寮.."次")
                    need_break = false
                    click(random_click(阴阳寮选择[i][1],阴阳寮选择[i][2]))
                    mSleep(1000)
                    click(random_click(阴阳寮选择[i][1],阴阳寮选择[i][2]))
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
                          打了几次阴阳寮 = 打了几次阴阳寮 +1
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
                              打了几次阴阳寮 = 打了几次阴阳寮 +1
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
                          打了几次阴阳寮 = 打了几次阴阳寮 +1
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
                          打了几次阴阳寮 = 打了几次阴阳寮+1
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
                        打了几次阴阳寮 = 打了几次阴阳寮+1
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
                              打了几次阴阳寮= 打了几次阴阳寮 +1
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
                              打了几次阴阳寮=打了几次阴阳寮+1
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
        elseif multiColor2(购买体力,90) then
          sysLog("购买体力")
          click(random_click(购买体力.购买[1],购买体力.购买[2]))
          买过体力了 = true
          mSleep(random_time())
        elseif multiColor2(邮件界面,90) or multiColor2(邮件界面模拟器,90) then
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
                if 找附件信() then
                  showHD_b("邮件界面-找到附件信")
                  sysLog("邮件界面.未读")
                  mSleep(2000)
                else
                  showHD_b("没有附件信，往回拖动")
                  tuodong(邮件界面.拖动[3],邮件界面.拖动[4],邮件界面.拖动[1],邮件界面.拖动[2])
                  mSleep(1000)
                  keepScreen(false)
                  keepScreen(true)
                  找附件信()
                end
              else
                showHD_b("没有普通信，继续拖动")
              end
            end
          else
            click(random_click(邮件界面.关闭[1],邮件界面.关闭[2]))
          end
          mSleep(random_time())
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
        elseif multiColor2(获得奖励提示,90) or multiColor2(获得奖励提示日服,90) then
          sysLog("获得奖励提示")
          click(random_click(获得奖励提示.点击[1],获得奖励提示.点击[2]))
          mSleep(random_time())
        elseif multiColor2(百鬼点开了说明,95) then
          sysLog("百鬼点开了说明")
          click(random_click(百鬼点开了说明.点一下[1],百鬼点开了说明.点一下[2]))
          mSleep(1000)
        elseif multiColor2(妖气封印界面,93) then
          sysLog("妖气封印界面")
          if 发现了石距  then
            click(random_click(妖气封印界面.挑战[1],妖气封印界面.挑战[2]))
          else
            click(random_click(妖气封印界面.关闭[1],妖气封印界面.关闭[2]))
          end
          mSleep(random_time())
        elseif multiColor2(妖气开组界面,93) then
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
        elseif multiColor2(好友界面,90) or multiColor2(好友界面1,90) then
          sysLog("好友界面")
          if 功能 == 88 and 日常步骤 == 0 then
            for i = 1,3 do
              for j=1,#送心位置-1 do
                click(送心位置[j][1],送心位置[j][2])
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
        elseif multiColor2(评论界面,90) then
          click(random_click(评论界面.关闭[1],评论界面.关闭[2]))
          mSleep(random_time())
        elseif multiColor2(任务界面,90) then
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
        elseif multiColor2(更换御魂界面,90) then
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
        elseif 功能 == 88 and 日常步骤 == 1 and 御魂强化界面找强化() then
          mSleep(random_time())
        elseif multiColor2(添加好友界面,90) then
          sysLog("添加好友界面")
          点添加好友次数 = 0
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
          sysLog("战斗胜利")
          --mSleep(2000)
          if ipad没有缩放 and w == 1536 or w == 2048 then
            setScreenScale(768,1024)
            重写推图参数()
          end
          if 当前在什么妖气目标里 > 0 then
            刚才在打妖气 = true
            定期妖气时间处理()
          end
          刚进入组队界面 = true
          缩放处理相关()
          if 进入个人突破 then
            进入个人突破 = false
            个人突破次数 = 个人突破次数 +1
          end
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
            showHD_b("战斗胜利")
          end
          click(random_click(领奖结束.点击[1],领奖结束.点击[2],70))
          上次战斗时间 = mTime()
          业原火点挑战次数 = 0
          第二回合切换 = true
          第三回合切换 = true
          进入阴阳寮突破 = false	
          是否在阴阳寮组队 = false
          start_time = mTime()
          if 阴阳寮now ~= 阴阳寮last and 正在进行这一轮突破 then
            阴阳寮last = 阴阳寮now
            阴阳寮开始时间 = mTime() + 30*1000
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
        elseif multiColor2(战斗失败,90) or multiColor2(战斗失败日服,90) or multiColor2(新战斗失败,90) or multiColor2(新战斗失败日服,90) then
          sysLog("战斗失败")
          if ipad没有缩放 and w == 1536 or w == 2048 then
            setScreenScale(768,1024)
            重写推图参数()
          end
          if 要打鬼王 then
            打完鬼王了 = true
            要打鬼王 = false
          end
          缩放处理相关()
          组队邀请次数 = 0
          打标记次数 = 0
          click(random_click(领奖结束.点击[1],领奖结束.点击[2],70))
          if 战斗失败时间 == 0 or mTime() - 战斗失败时间 > 10*1000 and 进入阴阳寮突破 == false and 进入个人突破 == false and 刚才在打妖气 == false then
            战斗失败时间 = mTime() 
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
            if 进入阴阳寮突破 and 是否在阴阳寮组队 == false and 正在进行这一轮突破 then
              阴阳寮第几个 = 阴阳寮第几个 - 1
            end
          end
          if 功能==3 or 功能 ==4 then
            showHD_b("胜利："..今天成功次数.."次,失败："..今天失败次数.."次")
          else
            showHD_b("战斗失败")
          end
          上次战斗胜利 = false
          从战斗中出来 = true
          第几回合 = 1
          组队邀请次数 = 0
          第二回合切换 = true
          第三回合切换 = true
          上次战斗时间 = mTime()
          start_time = mTime()
          进入阴阳寮突破 = false	
          业原火点挑战次数 = 0
          是否在阴阳寮组队 = false
          mSleep(random_time())
        elseif multiColor2(百鬼夜行界面,90) then
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
        elseif multiColor2(百鬼邀请界面,90) or multiColor2(百鬼邀请界面1,90) then
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
          if 重连等待> 0 then
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
          elseif 功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能 == 6 or 功能 == 7  then
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            mSleep(1000)
            click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
          end	
        elseif multiColor2(登陆后活动界面2,90) then
          sysLog("登陆后活动界面2")
          click(random_click(登陆后活动界面2.返回[1],登陆后活动界面2.返回[2]))
          mSleep(2000)
          if 要打妖怪退治  or 要打鬼王 or 功能 == 9 or 功能 == 10 then
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            庭院找町中()
          elseif 功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能 == 6 or 功能 == 7 then
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            mSleep(1000)
            click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
          end	
        elseif multiColor2(登陆后活动界面果盘,90)  or multiColor2(登陆后活动界面海马玩,90) then
          sysLog("登陆后活动界面")
          click(random_click(登陆后活动界面果盘.返回[1],登陆后活动界面果盘.返回[2]))
          mSleep(2000)
          if 要打妖怪退治  or 要打鬼王 or 功能 == 9 or 功能 == 10 then
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            庭院找町中()
            --click(登陆后活动界面.町中[1],登陆后活动界面.町中[2])
          elseif 功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能 == 6 or 功能 == 7  then
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            mSleep(1000)
            click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
          end	
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
        elseif multiColor2(实名认证,90) then
          click(random_click(实名认证.点击[1],实名认证.点击[2]))
          mSleep(random_time())
        elseif multiColor2(确认实名,90) then
          click(random_click(确认实名.点击[1],确认实名.点击[2]))
          mSleep(random_time())
        elseif multiColor2(用户协议界面,90) then
          sysLog("用户协议界面")
          click(random_click(用户协议界面.接受[1],用户协议界面.接受[2]))
          mSleep(random_time())
        elseif multiColor2(实名认证界面,90) then
          sysLog("实名认证界面")
          click(random_click(实名认证界面.取消[1],实名认证界面.取消[2]))
          mSleep(random_time())
        elseif multiColor2(提示框,90) then
          sysLog("提示框")
          if 日常进度 ~= 0 then
            if 日常进度 == 1 and 御魂结束 == false and 刷御魂次数 > 0 then
              click(random_click(提示框.确定[1],提示框.确定[2]))
              开始时间 = mTime()
            elseif 日常进度 == 3 and 觉醒结束 == false and 刷觉醒次数 > 0 then
              click(random_click(提示框.确定[1],提示框.确定[2]))
              开始时间 = mTime()
            else
              click(random_click(提示框.取消[1],提示框.取消[2]))
            end
          elseif (功能== 1 or 功能== 3 or 功能== 4) and 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
            click(random_click(提示框.取消[1],提示框.取消[2]))
          elseif (功能== 1 or 功能== 3 or 功能== 4 or 功能== 6) and 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
            click(random_click(提示框.取消[1],提示框.取消[2]))
          elseif (功能== 1 or 功能== 3 or 功能== 4) and 定期妖气相关() then
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
          elseif 功能 == 8 and 功能 == 50 then
            click(random_click(提示框.确定[1],提示框.确定[2]))
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
          elseif 功能== 10 then
            click(random_click(提示框.取消[1],提示框.取消[2]))
          elseif 功能== 1 then
            if 推图时拒绝邀请 == 1 then
              click(random_click(提示框.取消[1],提示框.取消[2]))
            else
              click(random_click(提示框.确定[1],提示框.确定[2]))
            end
          elseif 功能 == 30 then
            if 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
              click(random_click(提示框.取消[1],提示框.取消[2]))
            elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
              sysLog("自动阴阳寮")
              click(random_click(提示框.取消[1],提示框.取消[2]))
            else
              click(random_click(提示框.确定[1],提示框.确定[2]))
            end
          elseif 组队单刷 == 1	 then
            click(random_click(提示框.取消[1],提示框.取消[2]))
          else
            click(random_click(提示框.确定[1],提示框.确定[2]))
            mSleep(5000)
          end
          mSleep(random_time())
        elseif multiColor2(新提示框,90) then
          sysLog("新提示框")
          if 日常进度 ~= 0 then
            if 日常进度 == 1 and 御魂结束 == false and 刷御魂次数 > 0 then
              click(random_click(新提示框.确定[1],新提示框.确定[2]))
              开始时间 = mTime()
            elseif 日常进度 == 3 and 觉醒结束 == false and 刷觉醒次数 > 0 then
              click(random_click(新提示框.确定[1],新提示框.确定[2]))
              开始时间 = mTime()
            else
              click(random_click(新提示框.取消[1],新提示框.取消[2]))
            end
          elseif (功能== 1 or 功能== 3 or 功能== 4) and 自动阴阳寮 == 1 and mTime() > 阴阳寮开始时间 then
            click(random_click(新提示框.取消[1],新提示框.取消[2]))
          elseif (功能== 1 or 功能== 3 or 功能== 4 or 功能== 6) and 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
            click(random_click(新提示框.取消[1],新提示框.取消[2]))
          elseif (功能== 1 or 功能== 3 or 功能== 4) and 定期妖气相关() then
            click(random_click(新提示框.取消[1],新提示框.取消[2]))
          elseif (要打妖怪退治 or 要打鬼王) and 功能~= 8 then
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
          elseif 功能 == 8 and 功能 == 50 then
            click(random_click(新提示框.确定[1],新提示框.确定[2]))
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
          elseif 功能== 10 then
            click(random_click(新提示框.取消[1],新提示框.取消[2]))
          elseif 功能== 1 then
            if 组队探索后可以继续  then
              click(random_click(新提示框.确定[1],新提示框.确定[2]))
              组队探索后可以继续 = false
            elseif 推图时拒绝邀请 == 1 then
              click(random_click(新提示框.取消[1],新提示框.取消[2]))
            else
              click(random_click(新提示框.确定[1],新提示框.确定[2]))
            end
          elseif 功能 == 30 then
            if 自动阴阳寮 == 1 and 阴阳寮开始时间 > 0 and mTime() > 阴阳寮开始时间 then
              click(random_click(新提示框.取消[1],新提示框.取消[2]))
            elseif 推图寄养 == 1 and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
              sysLog("自动阴阳寮")
              click(random_click(新提示框.取消[1],新提示框.取消[2]))
            else
              click(random_click(新提示框.确定[1],新提示框.确定[2]))
            end
          elseif 组队单刷 == 1	 then
            click(random_click(新提示框.取消[1],新提示框.取消[2]))
          else
            click(random_click(新提示框.确定[1],新提示框.确定[2]))
            mSleep(5000)
          end
          mSleep(random_time())
        elseif multiColor2(下载语音包,90) then
          sysLog("下载语音包")
          --showHD("下载语音包")
          click(random_click(下载语音包.取消[1],下载语音包.取消[2]))
          mSleep(1000)
        elseif 要打妖怪退治 and multiColor2(妖怪退治挑战,90) then
          sysLog("庭院界面")
          showHD_b("妖怪退治挑战")
          是否换式神 = false
          click(random_click(妖怪退治挑战.挑战[1],妖怪退治挑战.挑战[2]))
          mSleep(random_time())
        elseif 要打妖怪退治 and 地图找宝箱() then
          sysLog("庭院界面")
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
        elseif  multiColor2(庭院界面,90) then
          sysLog("庭院界面") 
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
        elseif (功能 == 1 or 功能 == 3  or 功能 == 4  or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能== 6 or 功能== 9 or 功能== 10) and (multiColor2(主界面,92) or multiColor2(主界面1,92) or multiColor2(主界面没打开卷轴,90) or multiColor2(主界面打开卷轴,90)) then
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
            showHD_b("庭院界面-去町中")
            if 要打妖怪退治 or 要打鬼王 then
              庭院找町中()
              --click(登陆后活动界面.町中[1],登陆后活动界面.町中[2])
            else
              tuodong4(登陆后活动界面.拖动)
              tuodong4(登陆后活动界面.拖动)
              mSleep(1000)
              click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
            end
            mSleep(2000)
          end
        elseif 功能 == 88 and (multiColor2(主界面,92) or multiColor2(主界面1,92) or multiColor2(主界面没打开卷轴,90) or multiColor2(主界面打开卷轴,90)) then
          sysLog("88主界面")
          if multiColor2(主界面没打开卷轴,90)  then
            click(主界面.打开菜单[1],主界面.打开菜单[2])
            mSleep(1000)
          end
          if 日常步骤 == 0 then
            showHD_b("一键日常-好友送心")
            click(random_click(主界面.好友[1],主界面.好友[2]))
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
        elseif 功能 == 8 and (multiColor2(主界面,92) or multiColor2(主界面1,92) or multiColor2(主界面没打开卷轴,90) or multiColor2(主界面打开卷轴,90)) then
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
          elseif 自动阴阳寮 == 1 and ( mTime() > 阴阳寮开始时间 or 正在进行这一轮突破) then
            sysLog("自动阴阳寮")
            showHD_b("阴阳寮时间到")
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            mSleep(1000)
            click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
          elseif 是否突破卷满 ==  1 then
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            mSleep(1000)
            click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
            mSleep(1000)
          elseif 正在组队 then
            tuodong4(登陆后活动界面.拖动)
            tuodong4(登陆后活动界面.拖动)
            mSleep(1000)
            click(登陆后活动界面.探索[1],登陆后活动界面.探索[2])
            mSleep(1000)
          end
          mSleep(random_time())
        elseif (功能 == 6 or 功能 == 7 or 功能 == 30) and (multiColor2(主界面,92) or multiColor2(主界面1,92) or multiColor2(主界面没打开卷轴,90) or multiColor2(主界面打开卷轴,90)) then
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
        elseif 功能 == 5 and (要打妖怪退治 or 要打鬼王 )and (multiColor2(主界面,92) or multiColor2(主界面1,92) or multiColor2(主界面没打开卷轴,90) or multiColor2(主界面打开卷轴,90)) then
          sysLog("妖气自动阴阳寮")
          showHD_b("妖怪退治")
          --tuodong4(登陆后活动界面.拖动)
          --tuodong4(登陆后活动界面.拖动)
          -- mSleep(1000)
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
                要发呆一下 = true
              end
            end
            if 要发呆一下 then
              local 发呆多久 = math.random(1,5)
              for i=1,发呆多久*6 do
                showHD_b("正在随机发呆中")
                mSleep(10000)
              end
              要发呆一下 = false
              打了几次妖气 = 0
            end
            showHD_b("妖气-进入组队")
            click(random_click(主界面.组队[1],主界面.组队[2]))
          end
          mSleep(1000)
        elseif 功能 == 102 and (multiColor2(主界面1,90) or multiColor2(主界面1,92) or multiColor2(主界面没打开卷轴,90) or multiColor2(主界面打开卷轴,90)) and mTime() - 结界计算时间 > 寄养间隔*60*1000 then
          sysLog("102主界面1")
          if multiColor(主界面,92) or multiColor(主界面没打开卷轴,90) then
            click(random_click(主界面.打开菜单[1],主界面.打开菜单[2]))
            mSleep(1000)
          end
          click(random_click(主界面.阴阳寮[1],主界面.阴阳寮[2]))
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
          sysLog("1副本大地图")
          mSleep(2000)
          是boss战 = false 
          打完boss = false
          是否换式神 = false
          if ipad没有缩放 and w == 1536 or w == 2048 then
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
              if (multiColor2(突破卷满,90) == false and 自动突破 == 1) or 是否突破卷满 == 1 then
                sysLog("是否突破卷满")
                showHD_b("突破卷满，去突破")
                是否突破卷满 = 1
                个人突破次数 = 0
                个人突破失败位置 = {}
                click(random_click(副本大地图.结界突破[1],副本大地图.结界突破[2],20))
                mSleep(2000)
              elseif 自动阴阳寮 == 1 and (mTime() > 阴阳寮开始时间 or 正在进行这一轮突破) then
                sysLog("自动阴阳寮")
                showHD_b("阴阳寮时间到")
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
              else
                showHD_b("去副本")
                if 选图方式 == 7 then
                  全局break = false
                  for i=1,8 do
                    local x,y = 章节选择(拖动选图)
                    if x > 0 then
                      sysLog("拖动完成后判定")
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
                        sysLog("拖动完成后判定")
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
        elseif (功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 30 or 功能 == 5 or 功能 == 99 or 功能 == 88 ) and multiColor2(副本大地图,90) then
          sysLog("88副本大地图")
          sysLog("日常步骤"..日常步骤)
          if 地图找宝箱() then
            showHD_b("找到地图宝箱了")
            mSleep(3000)
          end
          if ((功能 == 3 and 觉醒组队单刷 ~= 1)or (功能 == 4 and 御魂组队单刷 ~= 1)) and 从战斗中出来 then
            从战斗中出来 = false
            for i=1,8 do
              if multiColor(组队邀请,90) then
                break
              end
              mSleep(1000)
            end
          else
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
                click(random_click(副本大地图.御魂[1],副本大地图.御魂[2],20))
              elseif 日常步骤 == 6 then
                click(random_click(副本大地图.觉醒材料[1],副本大地图.觉醒材料[2],20))
              elseif 日常步骤 == 7 then
                click(random_click(副本大地图.结界突破[1],副本大地图.结界突破[2],20))
              elseif 日常步骤 == 9 then
                click(random_click(副本大地图.返回[1],副本大地图.返回[2]))
              end
            elseif (multiColor2(突破卷满,90) == false and 自动突破 == 1) or 是否突破卷满 == 1 then
              sysLog("是否突破卷满")
              showHD_b("突破卷满，去突破")
              是否突破卷满 = 1
              个人突破次数 = 0
              个人突破失败位置 = {}
              click(random_click(副本大地图.结界突破[1],副本大地图.结界突破[2],20))
              mSleep(2000)
            elseif 自动阴阳寮 == 1 and ( mTime() > 阴阳寮开始时间 or 正在进行这一轮突破) then
              sysLog("自动阴阳寮")
              showHD_b("阴阳寮时间到")
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
            elseif 要打妖怪退治  or 要打鬼王 then
              sysLog("自动阴阳寮")
              showHD_b("妖怪退治")
              click(random_click(副本大地图.返回[1],副本大地图.返回[2]))
              mSleep(1000)
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
        elseif (功能 == 6 or 功能 == 7) and multiColor2(副本大地图,90) then
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
              click(random_click(副本大地图.结界突破[1],副本大地图.结界突破[2],20))
            elseif 突破等待 == 3  then
              if (mTime() > 阴阳寮开始时间 or 正在进行这一轮突破) then
                showHD_b("阴阳寮时间到")							
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
        elseif 功能 == 8 and multiColor2(副本大地图,90) then
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
          --sysLog("卡屏次数")
          if 脚本延迟 >= 0 then
            卡屏次数 = 卡屏次数 +1
            if 功能 == 1 or 功能 == 2 or 功能 == 6 or 功能 == 3 or 功能 == 4 or 功能 == 8 then
              mSleep(脚本延迟*100)
            end
            if 卡屏次数 == 10 then
              if 功能 == 1 then
                找关闭按钮()
                sysLog("卡屏次数 == 5")
                mSleep(2000)
                keepScreen(false)
                keepScreen(true)
                if multiColor2(副本大地图,90)== false and multiColor2(推图中,90)== false then
                  sysLog("卡屏次数 点右边")
                  click(random_click(推图中.右边[1],推图中.右边[2]))
                  mSleep(250)
                end
              elseif 	功能 == 8 then
              elseif 	功能 == 99 then
              elseif  功能 == 9 then
                click(random_click(推图中.右边[1],推图中.右边[2]))
                mSleep(250)
              elseif  功能 == 5 then
                mSleep(250)
                click(random_click(推图中.右边[1],推图中.右边[2]))
              else
                找关闭按钮()
                click(random_click(推图中.右边[1],推图中.右边[2]))
              end
              if multiColor(判断有准备的鼓,90) then
                click(random_click(判断有准备的鼓.点击[1],判断有准备的鼓.点击[2]))
              end
              卡屏次数 = 0
            end
          elseif 功能 == 6 and 阴阳寮攻击() then
            mSleep(5000)
            click(random_click(阴阳寮选择[1][1],阴阳寮选择[1][2]))
          elseif 自动突破 == 1 and (功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 20 or 功能 == 21 or 功能 == 5 or 功能 == 30) and 个人攻击() then
            mSleep(5000)
            click(random_click(个人突破.个人[1],个人突破.个人[2]))
          else
            if mTime() - start_time > 30*1000 then
              sysLog("默认点一下")
              showHD_b("30秒无操作，点一下")
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
        
        
        if 功能 == 1 or 功能 == 3 or 功能 == 4 or 功能 == 5 or 功能 == 20 or 功能 == 21 or 功能 == 8 or 功能 ==  99 then
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
              sysLog("体力不足锁频")
              lockDevice()
              setStringConfig("lua_exit","欢迎回来，上次因为您选择体力不足锁屏而停止脚本。")
              lua_exit()
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
      end
      keepScreen(false)
    else
      sysLog("闪退了")
      runApp(appid)
      mSleep(10000)
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
  end
end

function new_ui_old()
  local w_,h_ = getScreenSize() --w < h
  local h = w_
  local w = h_
  --主ui界面
  
  ui:new(w,h,"开始挂机","退出脚本","cloud_ear_yys.dat")
  
  
  local p = ui:newPage("综合设置")
  p:newLine()
  p:addLebel(10,0.8,"从5月2号开始，叉叉内购买脚本，要收取10%的手续费了。所以希望大家能去我的淘宝购买激活码。",25)
  p:newLine()
  p:addLebel(10,0.8,"购买激活码，如果你用了10天苹果，想换安卓。或者想升级季卡年卡，我可以处理到。",25)
  p:newLine()
  p:addLebel(10,0.8,"但是叉叉购买的，我无法封停你的时间，也就没办法帮你处理了。所以淘宝买其实更好。",25)
  p:newLine()
  p:addLebel(10,0.8,"有问题请反馈，谢谢。群187929456",25)
  
  -- p:newLine()
  -- p:addLebel(10,0.8,"模拟器请用640*1136分辨率。不要用1136*640。DPI320。手机用户请保持home键在右。",25)
  -- p:newLine()
  -- p:addLebel(10,0.8,"有任何遮挡画面的东西，比如ios的残疾球，ios走流量的提示，请关闭。否则可能会影响脚本。",25)
  -- p:newLine()
  --p:addLebel(10,0.8,"IOS用户可以下载一个EasyOrientation，强制锁定游戏方向。",25)
  p:newLine()
  p:addLebel(2,1,"功能选择:") 
  --p:newLine()
  if version == 1 then
    if ver == "iOS" then 
      local b = p:newBox(10,2.8)
      b:addRadioBoxGroup(8,22,"功能选择","0","探索","自动剧情","刷觉醒材料","刷御魂","刷业原火","刷御灵","妖气封印","个人突破","阴阳寮突破","挂机等邀请","挂机邀请魂10","自动进小号鬼王","自动斗技","自动协同斗技","百鬼夜行","自动御魂+觉醒","自动抽N卡","自动兔子（测试）","自动找寄养","自动召唤碎片","一键日常")--,"一键日常"
    else
      local b = p:newBox(10,3.6)
      b:addRadioBoxGroup(8,30,"功能选择","0","探索","自动剧情","刷觉醒材料","刷御魂","刷业原火","刷御灵","妖气封印","个人突破","阴阳寮突破","挂机等邀请","挂机邀请魂10","自动进小号鬼王","自动斗技","自动协同斗技","百鬼夜行","自动御魂+觉醒","自动抽N卡","自动兔子（测试）","自动找寄养","自动召唤碎片","一键日常")
    end
  elseif version == 2 then
    if ver == "iOS" then 
      local b = p:newBox(10,3)
      b:addRadioBoxGroup(8,22,"功能选择","0","换号鬼王","探索","自动剧情","刷觉醒材料","刷御魂","刷业原火","刷御灵","妖气封印","个人突破","阴阳寮突破","挂机等邀请","挂机邀请魂10","自动进小号鬼王","自动斗技","自动协同斗技","百鬼夜行","自动御魂+觉醒","自动抽N卡","自动兔子（测试）","自动找寄养","自动召唤碎片","一键日常")
    else
      local b = p:newBox(10,3)
      b:addRadioBoxGroup(8,22,"功能选择","0","换号鬼王","探索","自动剧情","刷觉醒材料","刷御魂","刷业原火","刷御灵","妖气封印","个人突破","阴阳寮突破","挂机等邀请","挂机邀请魂10","自动进小号鬼王","自动斗技","自动协同斗技","百鬼夜行","自动御魂+觉醒","自动抽N卡","自动兔子（测试）","自动找寄养","自动召唤碎片","一键日常")
    end
  end
  --b:addRadioBoxGroup(8,12,"功能选择","0","推图","推剧情图","刷觉醒材料","刷御魂","结界突破","挂机等邀请","自动斗技","百鬼夜行") 
  p:newLine()
  p:addLebel(10,0.8,"界面大改版，请先把每个分页都看清楚。杂项设置里有一个随机发呆选项。",25)
  p:newLine()
  p:addLebel(3.5,1,"点击延迟随机化，从") 
  p:addComboBox(1.6,1,"延迟随机最小值",1,"0秒","0.5秒","1秒","1.5秒","2秒","2.5秒","3秒","3.5秒","4秒","4.5秒","5秒","5.5秒","6秒","6.5秒","7秒","7.5秒","8秒","8.5秒","9秒","9.5秒","10秒") 
  p:addLebel(0.4,1,"到") 
  p:addComboBox(1.6,1,"延迟随机最大值",5,"0秒","0.5秒","1秒","1.5秒","2秒","2.5秒","3秒","3.5秒","4秒","4.5秒","5秒","5.5秒","6秒","6.5秒","7秒","7.5秒","8秒","8.5秒","9秒","9.5秒","10秒") 
  p:newLine()
  p:addLebel(10,0.8,"这个功能和随机点击功能一直都有，现在把范围扩大，然后给你们自己设置。",25)
  p:newLine()
  p:addLebel(10,1,"【===========================================】") 
  p:newLine()
  p:addLebel(10,0.8,"寄养有两种方式，大功能里面选寄养，会帮你操作一次，解放双手。",25)
  p:newLine()
  p:addLebel(10,0.8,"晚上睡觉，你不做挂机，只想寄养，也可以用这种方式。",25)
  p:newLine()
  p:addLebel(10,0.8,"或者你选择推图结合寄养，我会先推图，每隔N分钟去检查一下寄养。",25)
  p:newLine()
  if ver == "iOS" then 
    p:addLebel(1.0,1,"寄养") p:addComboBox(1.6,1,"寄养星数",0,"1","2","3","4","5","6") p:addLebel(1.6,1,"星以上的") p:addCheckBoxGroup(8,1,"寄养什么","","斗鱼","太鼓","伞","经验","美食")
  else	
    p:addLebel(1.0,1,"寄养") p:addComboBox(1.6,1,"寄养星数",0,"1","2","3","4","5","6") p:addLebel(1.6,1,"星以上的") 
    p:newLine()
    local b = p:newBox(10,0.5)
    b:addCheckBoxGroup(10,6,"寄养什么","","斗鱼","太鼓","伞","经验","变异")
  end
  p:newLine()
  if ver == "iOS" then 
    p:addCheckBoxGroup(2,1.2,"预计下次在","","预计下次在") 
  else
    p:addCheckBoxGroup(2.8,1.2,"预计下次在","","预计下次在") 
  end
  --p:addLebel(2.0,1,"推图时，每隔")  
  p:addComboBox(1.2,1.2,"下次寄养小时",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
  p:addLebel(1,0.8,"时",25,"left","6,6,6")  
  p:addComboBox(1.2,1.2,"下次寄养分钟",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59")
  p:addLebel(3,1.2,"分，要去抢坑。",25,"left","6,6,6")  
  p:newLine()
  if ver == "iOS" then 
    p:addCheckBoxGroup(2,1.2,"是否推图寄养","","挂机时每隔") 
  else
    p:addCheckBoxGroup(2.8,1.2,"是否推图寄养","","挂机时每隔") 
  end
  --p:addLebel(2.0,1,"推图时，每隔")  
  p:addComboBox(1.2,1.2,"寄养间隔小时",0,"0","1","2","3","4","5","6")
  p:addLebel(1,1.2,"小时",25,"left","6,6,6")  
  p:addComboBox(1.2,1.2,"寄养间隔",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59")
  p:addLebel(3,1.2,"分钟去检查一下寄养。",25,"left","6,6,6")  
  p:newLine()
  p:addLebel(10,0.8,"这里是绝对时间，比如下次是22时30分要去抢坑。不用倒计时方式了。",25)
  p:newLine()
  p:addLebel(10,0.8,"这样我就可以准确的定时去占坑。如果成功，下一次是360分钟后再去占坑。",25)
  p:newLine()
  p:addLebel(10,0.8,"如果没成功，则我会用推图时每隔N分钟的设置去找坑",25)
  p:newLine()
  p:addLebel(4,1,"找不到合适寄养时:") 
  local b = p:newBox(6,0.5)
  b:addRadioBoxGroup(6,4,"找不到合适寄养时","0","不寄养","随意寄养")  
  p:newLine()
  p:addLebel(7,1,"好友数量（用于我判定找完所有好友了）:") 
  p:addComboBox(1.2,1.2,"好友数量",0,"10","20","30","40","50","60","70","80")
  p:newLine()
  --p:newLine() 
  p:newLine()
  if ver == "iOS" then 
    p:addCheckBoxGroup(1.2,1.2,"随机发呆","","每隔") 
    p:addComboBox(1,1.2,"随机发呆间隔小",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59")
    p:addLebel(0.2,1.2,"-",25,"left","6,6,6") 
    p:addComboBox(1,1.2,"随机发呆间隔大",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59")
    p:addLebel(1.2,1.2,"分钟，发呆",25,"left","6,6,6")  
    p:addComboBox(1,1.2,"随机发呆时间小",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","30","40","50","60","70","80","90","100","110","120","150","180")
    p:addLebel(0.2,1.2,"-",25,"left","6,6,6")  
    p:addComboBox(1,1.2,"随机发呆时间大",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","30","40","50","60","70","80","90","100","110","120","150","180")
    p:addLebel(0.4,1.2,"秒",25,"left","6,6,6")  
  else
    p:addCheckBoxGroup(1.4,1.2,"随机发呆","","每隔") 
    p:addComboBox(1,1.2,"随机发呆间隔小",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59")
    p:addLebel(0.2,1.2,"-",25,"left","6,6,6") 
    p:addComboBox(1,1.2,"随机发呆间隔大",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59")
    p:addLebel(1.4,1.2,"分钟，发呆",25,"left","6,6,6")  
    p:addComboBox(1,1.2,"随机发呆时间小",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","30","40","50","60","70","80","90","100","110","120","150","180")
    p:addLebel(0.2,1.2,"-",25,"left","6,6,6")  
    p:addComboBox(1,1.2,"随机发呆时间大",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","30","40","50","60","70","80","90","100","110","120","150","180")
    p:addLebel(0.4,1.2,"秒",25,"left","6,6,6")  
  end
  p:newLine()	
  if ver == "iOS" then 
    p:addCheckBoxGroup(1.2,1.2,"随机点击","","每隔") 
    p:addComboBox(1,1.2,"随机点击间隔小",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","30","40","50","60","70","80","90","100","110","120","150","180")
    p:addLebel(0.2,1.2,"-",25,"left","6,6,6") 
    p:addComboBox(1,1.2,"随机点击间隔大",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","30","40","50","60","70","80","90","100","110","120","150","180")
    p:addLebel(2.2,1.2,"秒，随机点击一下",25,"left","6,6,6")  
  else
    p:addCheckBoxGroup(1.4,1.2,"随机点击","","每隔") 
    p:addComboBox(1,1.2,"随机点击间隔小",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","30","40","50","60","70","80","90","100","110","120","150","180")
    p:addLebel(0.2,1.2,"-",25,"left","6,6,6") 
    p:addComboBox(1,1.2,"随机点击间隔大",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","30","40","50","60","70","80","90","100","110","120","150","180")
    p:addLebel(3,1.2,"秒，随机点击一下",25,"left","6,6,6")  
  end
  p:newLine()	
  --p:newLine() 
  p:addLebel(10,0.8,"这个功能，探索，妖气，业原火，御灵，寮突破，百鬼有效。",25)	
  p:newLine()	
  --p:newLine() 
  p:addLebel(10,0.8,"随机点击是个好东西，但可能会造成脚本不稳定！！",25,"left","255,0,0")
  p:newLine()	
  --p:newLine() 
  p:addLebel(10,0.8,"另外脚本每次点击本身就是随机的，这个是增加无意义随机点击。",25,"left","255,0,0")
  if ver == "iOS" then 
  else
    p:newLine()
    p:newLine()
    p:newLine()
    p:addLebel(10,0.8,"安卓的界面太难看了，我必须多拉一点下来，不然你无法设置发呆",25)	
  end
  p:addLebel(10,0.8,"挂机邀请魂10，你先从探索开始创建队伍，设置好等级1-1，取消创建。这样可以保留这个设置。",25)
  p:newLine()
  p:addLebel(10,0.8,"再返回选层界面选好魂10，然后再用这个功能。",25)
  p:newLine()
  p:addLebel(10,0.8,"我会自动开组，然后点开邀请第一个人（最近受邀）。",25)
  p:newLine()
  p:addLebel(10,0.8,"这样即使你或者被邀请人掉线了，也可以继续刷。",25)
  local p1 = ui:newPage("探索设置")
  p1:newLine()
  if ver == "iOS" then 
    local b = p1:newBox(10,0.5)
    b:addCheckBoxGroup(10,1.5,"自动换狗粮","0","自动换狗粮","组队探索（你是队长）","日服玩家勾选这个") 
  else
    local b = p1:newBox(10,0.8)
    b:addCheckBoxGroup(12,3,"自动换狗粮","0","自动换狗粮","组队探索（你是队长）","日服玩家勾选这个") --,"日服玩家勾选这个"
  end
  p1:newLine()
  p1:addLebel(9,1,"日服台服玩家记得勾选。国服玩家不要勾选，主要是对观战狗粮的处理。",25)
  p1:newLine()
  p1:addLebel(9,1,"现在默认排除5星狗粮，大家可以放心升5星白蛋了。",25)
  p1:newLine()
  p1:addLebel(2,1,"选图方式:") 
  local b = p:newBox(10,0.5)
  if ver == "iOS" then 
    local b = p1:newBox(8,0.5)  
    b:addRadioBoxGroup(8,8,"选图方式","0","极速选图","点右边选图","右边拖动选图")  
  else
    local b = p1:newBox(8,1)  
    b:addRadioBoxGroup(8,8,"选图方式","0","极速选图","点右边选图","右边拖动选图")  
  end
  p1:newLine()
  p1:addLebel(2,1,"极速选图:")  p1:addComboBox(2.8,1,"拖动选图",0,"第一章","第二章","第三章","第四章","第五章","第六章","第七章","第八章","第九章","第十章","第十一章","第十二章","第十三章","第十四章","第十五章","第十六章","第十七章","第十八章","番外一","第十九章","第二十章","第二十一章","第二十二章","第二十三章")
  p1:addComboBox(2,1,"推图难度",3,"普通","困难")
  p1:newLine()
  p1:addLebel(2,1,"右边选图:")  p1:addComboBox(2.8,1,"推图设置",3,"右边第一张图","右边第二张图","右边第三张图","右边第四张图")
  p1:newLine()
  p1:addLebel(2,1,"组队设置:")  p1:addComboBox(2,1,"组队设置",0,"寮友","好友")
  p1:newLine()
  p1:addLebel(1.5,1,"邀请失败") p1:addComboBox(1,1,"邀请失败次数",0,"99999","1","2","3","4","5","6","7","8","9","10","20","30") p1:addLebel(1.8,1,"次停止脚本")
  p1:newLine()
  p1:addLebel(2.4,1,"换狗粮速度:") 
  local b = p1:newBox(10,0.5)
  b:addRadioBoxGroup(8,7,"狗粮拖动速度","","普通模式","极速模式")
  p1:newLine()
  p1:addLebel(1,1,"每打") p1:addComboBox(1.4,1,"几次检测一次满",0,"0","1","2","3","4","5","6","7","8","9","10","15","20","30") p1:addLebel(5.4,1,"场探索，检测一次满。") 
  p1:newLine()
  p1:addLebel(9,1,"选0就可以了，每一场都检测。如果想快点刷可以选个5左右的。",25)
  p1:newLine()
  if ver == "iOS" then 
    p1:addLebel(2,1,"狗粮选择:") 
    local b = p1:newBox(10,0.5)
    b:addCheckBoxGroup(9,7,"狗粮选择","0","N卡","R卡","红蛋也上","白蛋也上")
    p1:newLine()
    p1:addLebel(2,1,"狗粮位置:") 
    local b = p1:newBox(10,0.5)
    b:addCheckBoxGroup(9,7,"狗粮位置","","左边","中间","右边","阴阳师左边","阴阳师右边")
    p1:newLine()
    p1:addLebel(2,1,"狗粮普攻:") 
    local b = p1:newBox(10,0.5)
    b:addCheckBoxGroup(9,7,"狗粮普攻","","左边","中间","右边","阴阳师左边","阴阳师右边")
  else
    p1:addLebel(1.6,1,"狗粮选择:") 
    local b = p1:newBox(10,0.5)
    b:addCheckBoxGroup(9,7,"狗粮选择","0","N卡","R卡","红蛋也上","白蛋也上")
    p1:newLine()
    p1:addLebel(1.6,1,"狗粮位置:") 
    local b = p1:newBox(10,0.5)
    b:addCheckBoxGroup(9,7,"狗粮位置","","左边","中间","右边","阴阳师左边","阴阳师右边")
    p1:newLine()
    p1:addLebel(1.6,1,"狗粮普攻:") 
    local b = p1:newBox(10,0.5)
    b:addCheckBoxGroup(9,7,"狗粮普攻","","左边","中间","右边","阴阳师左边","阴阳师右边")
  end
  p1:newLine()
  p1:addLebel(10,0.8,"这个位置是进入更换式神界面你看到的左中右。狗粮队长千万不要放右边。观战部分是自动处理。",25,"left","255,100,100")
  p1:newLine()
  p1:addLebel(10,0.8,"阴阳师左边和右边代表的是组队探索模式下，作为队长，他带的那2只式神。",25)
  p1:newLine()
  p1:addLebel(10,0.8,"这里给个推荐设置，狗粮队长放在远离观战的地方，然后选中右狗粮。",25,"left","255,100,100")
  p1:newLine()
  p1:addLebel(3,1,"推图打标记:") p1:addComboBox(2,1,"推图打标记",0,"标记BOSS","标记小怪（右）","标记小怪（中）","标记小怪（左）","不标记")
  p1:newLine()
  p1:addLebel(3,1,"推图标记2回合:") p1:addComboBox(2,1,"推图打标记2",0,"标记BOSS","标记小怪（右）","标记小怪（中）","标记小怪（左）","不标记")
  p1:newLine()
  p1:addLebel(3,1,"BOSS战标记1回合:") p1:addComboBox(2,1,"推图BOSS打标记1",0,"标记BOSS","标记小怪（右）","标记小怪（中）","标记小怪（左）","不标记")
  p1:newLine()
  p1:addLebel(3,1,"BOSS战标记2回合:") p1:addComboBox(2,1,"推图BOSS打标记2",0,"标记BOSS","标记小怪（右）","标记小怪（中）","标记小怪（左）","不标记")
  p1:newLine()
  --	p:addLebel(10,0.8,"注意：观战位千万不要放寄生魂，否则可能会出错！脚本现在是不会把寄生魂放观战的。",25)
  -- p:newLine()
  p1:addLebel(2,1,"选狗粮方式:") 
  local b = p1:newBox(10,0.5)
  b:addRadioBoxGroup(8,7,"选狗粮方式","","前面的不满N卡","拖到最后的1级N卡")
  p1:newLine()
  p1:newLine()
  p1:addLebel(3,1,"选狗粮拖动次数:") p1:addComboBox(2.8,1,"选狗粮拖动次数",0,"10次","15次","20次","30次","40次","50次","60次","70次","80次","90次","100次")
  p:newLine()
  if w ==768 or w == 1024 or w == 1536 or w == 2048 then
    p1:addLebel(10,0.8,"平板因为分辨率太大，导致选怪效率很差，比手机选怪差了9倍效率。",25,"left","255,100,100")
    p1:newLine()
  end
  p1:addLebel(10,0.8,"选怪的时候建议是BOSS+经验（御魂金币），不要同时选BOSS+经验+金币这样的",25)
  p1:newLine()
  local b = p1:newBox(10,0.5)
  --b:addRadioBoxGroup(8,7,"推图选择","0","只刷经验怪","只刷经验怪+boss","优先经验怪+boss","刷完全图")  
  b:addCheckBoxGroup(10,6,"怪物选择","","boss","经验怪","御魂怪","金币怪","任意怪")
  p1:newLine()
  p1:addLebel(1.6,1,"如果打了") p1:addComboBox(1.4,1,"打怪超过N个",0,"99","1","2","3","4","5") p1:addLebel(5.4,1,"只指定怪物，则刷到出boss为止。") 
  -- p:newLine()
  -- p:addLebel(10,0.8,"脚本拖动一个来回，然后退出副本。如果想刷全图，建议把任意怪选上。",25)
  -- p:newLine()
  -- p:addLebel(10,0.8,"同时勾选经验和任意怪，往右拖的时候先找经验怪，回来的才找任意怪。金币御魂同理。",25)
  p1:newLine()
  --p1:newLine()
  -- p1:addLebel(2,1,"右边选图:")  p1:addComboBox(2.8,1,"推图设置",3,"右边第一张图","右边第二张图","右边第三张图","右边第四张图")
  -- p1:addComboBox(2,1,"推图难度",3,"普通","困难")
  --p1:newLine()
  p1:addLebel(0.8,1,"失败") p1:addComboBox(1,1,"失败次数",0,"1","2","3","4","5") p1:addLebel(1.8,1,"次退出副本")
  p1:addLebel(0.2,1,"")
  p1:addLebel(1.5,1,"总共失败") p1:addComboBox(1,1,"总共失败次数",0,"999","1","2","3","4","5","6","7","8","9","10","20","30") p1:addLebel(2,1,"次停止脚本")
  p1:newLine()
  p1:addLebel(1.5,1,"推图次数:") p1:addComboBox(1.2,1,"推图次数",0,"无限","1","2","3","4","5","6","7","8","9","10","20","30")
  --p:newLine()
  p1:addLebel(0.2,1,"")
  p1:addLebel(2,1,"副本内拖动") p1:addComboBox(2,1,"副本内拖图次数","5","0","1","2","3","4","5","6","7","8","9","10")p1:addLebel(3,1,"次到副本尽头")
  --p1:newLine()
  --p1:addLebel(10,0.8,"右边第4张图代表的你可以打的最后一张图，以此类推。",25)
  --p1:newLine()
  --p1:addLebel(10,0.8,"例如你开了番外，那么右边第4就是番外，右边第3就是18，以此类推。",25)
  --p1:newLine()
  --p1:addLebel(10,0.8,"拖动选图是拖到第一章后，往下拖来选图。只点击位置，不判断文字的。",25)
  -- p1:newLine()
  -- p1:addLebel(10,0.8,"如果可以用右边选图，尽量用右边，这种方式是最稳的。",25)
  -- p1:newLine()
  --p:addLebel(10,1,"【===========================================】") 
  local p2 = ui:newPage("御魂觉醒设置")
  p2:newLine()
  p2:addLebel(3,1,"刷觉醒设置:")  p2:addComboBox(2,1,"刷觉醒材料设置",3,"业火轮","风转符","水灵鲤","天雷鼓") p2:addComboBox(2,1,"刷觉醒材料几层",3,"第一层","第二层","第三层","第四层","第五层","第六层","第七层","第八层","第九层","第十层")
  p2:newLine()
  p2:addLebel(3,1,"刷御魂设置:")  p2:addComboBox(2,1,"刷御魂材料几层",3,"第一层","第二层","第三层","第四层","第五层","第六层","第七层","第八层","第九层","第十层")
  p2:newLine()
  p2:addLebel(3,1,"业原火设置:")  p2:addComboBox(2,1,"业原火设置",3,"贪之阵","嗔之阵","痴之阵")
  p2:newLine()
  p2:addLebel(3,1,"刷御灵设置:")  p2:addComboBox(2,1,"刷御灵设置",3,"神龙","白藏主","黑豹","孔雀") p2:addComboBox(2,1,"刷御灵设置几层",3,"第一层","第二层","第三层")
  p2:newLine()
  if ver == "iOS" then 
    p2:addLebel(2.2,1,"标记点击次数") p2:addComboBox(1.4,1,"标记点击次数","4","1","2","3","4","5","6","7","8","9","10") 
  else
    p2:addLebel(2.4,1,"标记点击次数") p2:addComboBox(1.4,1,"标记点击次数","4","1","2","3","4","5","6","7","8","9","10") 
  end
  p2:newLine()
  p2:addLebel(4,1,"御魂第一回合打标记:") p2:addComboBox(2,1,"御魂打标记",0,"标记中间","标记左边","标记右边","先左后右","先右后左","先左后中","先右后中","不标记")
  p2:newLine()
  p2:addLebel(4,1,"御魂第二回合打标记:") p2:addComboBox(2,1,"御魂打标记2",0,"标记中间","标记左边","标记右边","先左后右","先右后左","先左后中","先右后中","不标记")
  p2:newLine()
  p2:addLebel(4,1,"御魂第三回合打标记:") p2:addComboBox(2,1,"御魂打标记3",0,"标记中间","标记左边","标记右边","先左后右","先右后左","先左后中","先右后中","丑女茨木标记","不标记")
  p2:newLine()
  p2:addLebel(10,0.8,"3回合新增丑女茨木标记方式，要求丑女快点茨木慢点，空出足够时间给上稻草人，然后切换右边。",25,"left","255,100,100")
  p2:newLine()
  p2:addLebel(10,0.8,"注意，御魂，挂机等邀请，邀请魂10，业原火，都会用到这个标记。",25,"left","255,100,100")
  p2:newLine()
  p2:addLebel(1.2,1,"刷觉醒")  p2:addComboBox(1.4,1,"刷觉醒次数",0,"999","1","2","3","4","5","6","7","8","9","10","20","30","40","50","60","70","80","90","100","150","200","300","500") p2:addLebel(0.8,1,"次") 
  p2:addLebel(1.2,1,"刷御魂")  p2:addComboBox(1.4,1,"刷御魂次数",0,"999","1","2","3","4","5","6","7","8","9","10","20","30","40","50","60","70","80","90","100","150","200","300","500") p2:addLebel(0.8,1,"次") 
  p2:newLine()
  p2:addLebel(2,1,"御魂觉醒失败") p2:addComboBox(1.4,1,"御魂觉醒失败次数",0,"99","1","2","3","4","5","6","7","8","9","10") p2:addLebel(5.4,1,"次停止脚本") 
  p2:newLine()
  if ver == "iOS" then 
    p2:addLebel(2.6,1,"御魂觉醒连续失败") p2:addComboBox(1.4,1,"御魂觉醒连续失败次数",0,"99","1","2","3","4","5","6","7","8","9","10") p2:addLebel(5.4,1,"次停止脚本") 
  else
    p2:addLebel(3,1,"御魂觉醒连续失败") p2:addComboBox(1.4,1,"御魂觉醒连续失败次数",0,"99","1","2","3","4","5","6","7","8","9","10") p2:addLebel(5.4,1,"次停止脚本") 
  end
  p2:newLine()
  local b = p2:newBox(10,0.5)
  b:addCheckBoxGroup(8,7,"御魂失败继续","","御魂失败也继续邀请或者接受邀请")
  p2:newLine()
  local b = p2:newBox(10,0.5)
  b:addRadioBoxGroup(8,7,"组队单刷","0","单刷","开组刷","混组刷")  
  p2:newLine()
  p2:addLebel(3,1,"开组-几人开始:")  p2:addComboBox(2,1,"开组刷设置",3,"2人","3人")
  p2:newLine()
  p2:addLebel(3,1,"开组-最低等级:")  p2:addComboBox(2,1,"开组等级",0,"不设置","1级","6级","11级","16级","21级","26级","31级","36级","41级","46级","51级","56级","60级")
  --	p2:newLine()
  --p:addLebel(10,1,"【===========================================】") 
  --	p:newLine()
  local p3 = ui:newPage("突破设置")
  p3:newLine()
  local b = p3:newBox(10,0.5)
  if ver == "iOS" then 
    b:addCheckBoxGroup(10,1.5,"突破标记","0","突破打标记") 
  else
    b:addCheckBoxGroup(12,3,"突破标记","0","突破打标记") --,"日服玩家勾选这个"
  end
  p3:newLine()
  p3:addLebel(2,1,"个人突破:") 
  if ver == "iOS" then 
    local b = p3:newBox(10,0.5)
    b:addRadioBoxGroup(8,9,"突破设置","0","个人突破(3胜刷新)","个人突破(刷新)","个人突破(不刷新)")  
  else	
    local b = p3:newBox(10,0.8)
    b:addRadioBoxGroup(8,9,"突破设置","0","个人突破(3胜刷新)","个人突破(刷新)","个人突破(不刷新)")  
  end
  p3:newLine()
  p3:addLebel(2,1,"个人突破顺序:") 
  if ver == "iOS" then 
    local b = p3:newBox(10,0.5)
    b:addRadioBoxGroup(8,9,"个人突破顺序","0","优先打勋章少的","优先打勋章多的")  
  else	
    local b = p3:newBox(10,0.8)
    b:addRadioBoxGroup(8,9,"个人突破顺序","0","优先打勋章少的","优先打勋章多的")  
  end
  p3:newLine()
  p3:addLebel(2,1,"个人突破结束:") 
  if ver == "iOS" then 
    local b = p3:newBox(10,0.5)
    b:addRadioBoxGroup(8,9,"个人突破结束","0","锁屏","挂机等邀请")  
  else	
    local b = p3:newBox(10,0.8)
    b:addRadioBoxGroup(8,9,"个人突破结束","0","锁屏","挂机等邀请")  
  end
  p3:newLine()
  p3:addLebel(2,1,"阴阳寮突破:") 
  local b = p3:newBox(10,1.2)
  b:addRadioBoxGroup(8,9,"阴阳寮突破设置","0","阴阳寮突破(不下拉)","阴阳寮突破(下拉)","阴阳寮突破(打第一个)","根据勋章选择")  
  p3:newLine()
  p3:addLebel(2,1,"寮突破优先打") p3:addComboBox(1,1,"攻击勋章",0,"0","1","2","3","4","5") p3:addLebel(3,1,"个勋章及以下的人")
  p3:newLine()
  p3:addLebel(2,1,"突破结束判定:") 
  local b = p3:newBox(10,0.5)
  b:addRadioBoxGroup(8,9,"突破结束判定","0","第一页全破或者失败算结束","打到90%算结束")  
  p3:newLine()
  p3:addLebel(2,1,"突破等待:") 
  local b = p3:newBox(10,0.5)
  b:addRadioBoxGroup(8,9,"突破等待","0","不等，直接进","等10分钟再操作","等10分钟并且锁屏")  
  p3:newLine()
  p3:addLebel(10,0.8,"要用锁屏功能的，一定要关闭锁屏密码。否则无法唤醒手机。",25)
  p3:newLine()
  p3:addLebel(2,1,"寮突破CD:") 
  local b = p3:newBox(10,0.5)
  b:addRadioBoxGroup(8,9,"寮突破CD","0","精确的10分钟","等10-12分钟再进","等10-15分钟再进")  
  p3:newLine()
  p3:addLebel(2,1,"接受邀请:") 
  local b = p3:newBox(10,0.5)
  b:addRadioBoxGroup(8,9,"突破接受邀请","0","突破时不接受邀请","突破时接受邀请")  
  p3:newLine()
  p3:addLebel(2,1,"组队突破:") 
  local b = p3:newBox(10,0.5)
  b:addRadioBoxGroup(8,9,"组队突破","0","只打单人突破","只打组队突破","单人组队都突破")  
  p3:newLine()
  p3:addLebel(2,1,"几人开组:") 
  local b = p3:newBox(10,0.5)
  b:addRadioBoxGroup(8,9,"组队突破几人","0","2人","3人","只开组不邀请")  
  p3:newLine()
  p3:addLebel(10,0.8,"个人：优先找牌子少的打，如果没有就随机打。个人突破（刷新），代表9个全打一遍然后刷新。",25)
  p3:newLine()
  p3:addLebel(10,0.8,"阴阳寮：不下拉，会直接在第一页搜索没有牌子的人，随机打。下拉，会往后拉然后再打。",25)
  -- p3:newLine()
  --p:addLebel(10,1,"【===========================================】") 
  -- p:newLine()
  local p4 = ui:newPage("妖气设置")
  p4:newLine()
  p4:addLebel(2.5,1,"妖气封印延迟:") p4:addComboBox(2,1,"妖气延迟",0,"不延迟","0.1秒","0.2秒","0.3秒","0.4秒","0.5秒","0.6秒","0.7秒","0.8秒","0.9秒","1.0秒","1.1秒","1.2秒","1.3秒","1.4秒","1.5秒","2秒","3秒","4秒","5秒")
  p4:newLine()
  --p4:addLebel(2.5,1,"抢车后的延迟:") p4:addComboBox(2,1,"抢车后的延迟",7,"不延迟","0.5秒","1.0秒","1.5秒","2秒","2.5秒","3秒","3.5秒","4秒","4.5秒","5秒","5.5秒","6秒","6.5秒","7秒","7.5秒","8秒","8.5秒","9秒","9.5秒","10秒")
  --p4:newLine()
  p4:addLebel(2.5,1,"妖气封印次数:") p4:addComboBox(2,1,"妖气封印次数",0,"999次","1次","2次","3次","4次","5次","10次","20次","30次","40次","50次","60次","70次","80次","90次","100次","110次","120次","130次","140次","150次","160次","170次","180次","190次","200次")
  p4:newLine()
  p4:addLebel(10,0.8,"有时候点太快了，可能会导致上错车。各位可以根据自己实际情况适当加延迟。",25)
  p4:newLine()
  if ver == "iOS" then 
    local b = p4:newBox(10,0.5)		
    b:addRadioBoxGroup(9,6,"匹配还是挤车","0","匹配模式","抢车模式") 
  else
    local b = p4:newBox(10,0.8)		
    b:addRadioBoxGroup(9,6,"匹配还是挤车","0","匹配模式","抢车模式") 
  end
  p4:newLine()
  if ver == "iOS" then 
    p4:addCheckBoxGroup(5,1,"妖气做不做队长",0,"队长离开，我也离开") 
  else
    p4:addCheckBoxGroup(6,1,"妖气做不做队长",0,"队长离开，我也离开") 
  end
  p4:newLine()
  p4:addLebel(2.5,1,"妖气封印选择:") 
  if ver == "iOS" then 
    local b = p4:newBox(8,1.5)
    b:addCheckBoxGroup(7,12,"妖气封印选择","","椒图","鬼使黑","骨女","二口女","海坊主","姑获鸟","跳跳哥哥","经验妖怪","金币妖怪","石距","年兽","饿鬼","组队突破","小松丸")
    --b:addCheckBoxGroup(8,7,"妖气封印选择","","椒图","鬼使黑","骨女","二口女","海坊主","姑获鸟")
    --  	p4:newLine()
  else
    local b = p4:newBox(8,2)
    b:addCheckBoxGroup(7,16,"妖气封印选择","","椒图","鬼使黑","骨女","二口女","海坊主","姑获鸟","跳跳哥哥","经验妖怪","金币妖怪","石距","年兽","饿鬼","组队突破","小松丸")
  end
  p4:newLine()
  p4:addLebel(10,0.8,"新增一个结界突破的，主要是配合大佬，从这里进大佬的组队突破车。",25)
  p4:newLine()
  p4:addLebel(10,0.8,"石距年兽经验金币，可以多选了，我会自动切换。但是不要用妖气去混合，这个无法切换。",25)
  p4:newLine()
  local p5 = ui:newPage("杂项设置")
  p5:newLine()
  --p5:addLebel(2,1,"功能结合:")
  if ver == "iOS" then 
    local b = p5:newBox(10,2.5)
    b:addCheckBoxGroup(10,10,"推图结合","","突破卷满20去突破","定期去阴阳寮突破","推图时拒绝邀请","发现石距震动提醒","发现石距铃声提醒","自动接受好友申请","开启脚本提示","开启点击提示","发现石距自动打","发现年兽自动打","不检测自动战斗","不做日常祈愿和强化","不做日常突破","不强制普攻改妖术","自动斗技","关闭统计")
  else
    local b = p5:newBox(10,2.9)
    b:addCheckBoxGroup(10,19,"推图结合","","突破卷满20去突破","定期去阴阳寮突破","推图时拒绝邀请","发现石距震动提醒","发现石距铃声提醒","自动接受好友申请","开启脚本提示","开启点击提示","发现石距自动打","发现年兽自动打","不检测自动战斗","不做日常祈愿和强化","不做日常突破","不强制普攻改妖术","自动斗技","关闭统计")
  end
  p5:newLine()
  if 1 then
    p5:addCheckBoxGroup(1.2,1.2,"自动鬼王","","在") 
    p5:addComboBox(1.2,1.2,"自动鬼王小时",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
    p5:addLebel(0.2,1.2,":",25,"left","6,6,6")   
    p5:addComboBox(1.2,1.2,"自动鬼王分钟",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59")
    p5:addLebel(3,1.2,"时，参加鬼王。",25,"left","6,6,6")  
    p5:newLine()
  end
  local b = p5:newBox(10,0.5)
  b:addCheckBoxGroup(10,10,"定期妖气","","定期石距","定期年兽","定期金币妖怪","定期经验妖怪")
  p5:newLine()
  p5:addLebel(2,1,"体力不足:") 
  if ver == "iOS" then 
    local b = p5:newBox(10,0.5)		
    b:addRadioBoxGroup(9,6,"体力不足","0","领体力","锁屏","震动提醒","继续挂着","阴阳寮突破") 
  else
    local b = p5:newBox(10,0.8)		
    b:addRadioBoxGroup(9,6,"体力不足","0","领体力","锁屏","震动提醒","继续挂着","阴阳寮突破") 
  end
  p5:newLine()
  p5:addLebel(2,1,"日常结束:") 
  if ver == "iOS" then 
    local b = p5:newBox(10,0.5)		
    b:addRadioBoxGroup(9,6,"日常结束","0","锁屏","震动提醒","探索","御魂","阴阳寮突破") 
  else
    local b = p5:newBox(10,0.8)		
    b:addRadioBoxGroup(9,6,"日常结束","0","锁屏","震动提醒","探索","御魂","阴阳寮突破") 
  end
  p5:newLine()
  p5:addLebel(3.6,1,"有人加寮:")  p5:addComboBox(2,1,"有人加寮",0,"不处理","自动拒绝","自动同意")
  p5:newLine()
  p5:addLebel(3.6,1,"领体力次数:")  p5:addComboBox(2,1,"买体力次数",0,"1","2","3","4","5","6","7","8","9","10","99")
  p5:newLine()
  p5:addLebel(3.6,1,"百鬼设置:")  p5:addComboBox(2,1,"百鬼设置",0,"不邀请队友","邀请队友")
  p5:newLine()
  p5:addLebel(3.6,1,"清明技能（跳兔子用）:")  p5:addComboBox(2,1,"清明技能",0,"一直普攻","一直放灭")
  p5:newLine()
  local b = p5:newBox(8,0.5)
  b:addRadioBoxGroup(8,4,"无限魂十","","过山兔本","无限魂10兔子")
  p5:newLine()
  --p:addLebel(10,0.8,"如果要无限魂10，你们打开御魂界面选好魂10再用。",25)
  --p:newLine()
  --p:addLebel(2,1,"体力不足判定:")  p:addComboBox(2.8,1,"体力不足判定时间","5","1分钟","2分钟","3分钟","4分钟","5分钟","6分钟","7分钟","8分钟","9分钟","10分钟","11分钟","12分钟","13分钟","14分钟")
  --p:newLine()
  p5:addLebel(2.5,1,"重连次数:")  p5:addComboBox(2,1,"重连次数",0,"999次","0次","1次","2次","3次","4次","5次","6次","7次","8次","9次","10次","20次","30次")
  p5:newLine()
  p5:addLebel(2.5,1,"重连等待:")  p5:addComboBox(2,1,"重连等待",0,"立刻重连","1分钟","2分钟","3分钟","4分钟","5分钟","10分钟","15分钟","20分钟","30分钟","60分钟")
  p5:newLine()	
  
  p5:addCheckBoxGroup(1.2,1.2,"暂停时段一","","在") 
  p5:addComboBox(1.2,1.2,"时段1开始时间小时",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
  p5:addLebel(0.2,1.2,":",25,"left","6,6,6")   
  p5:addComboBox(1.2,1.2,"时段1开始时间分钟",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59")
  p5:addLebel(0.4,1.2,"到",25,"left","6,6,6")  
  p5:addComboBox(1.2,1.2,"时段1结束时间小时",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
  p5:addLebel(0.2,1.2,":",25,"left","6,6,6")  
  p5:addComboBox(1.2,1.2,"时段1结束时间分钟",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59")
  
  p5:addLebel(3,1.2,"之间，暂停脚本。",25,"left","6,6,6")  
  p5:newLine()	
  p5:addCheckBoxGroup(1.2,1.2,"暂停时段二","","在") 
  p5:addComboBox(1.2,1.2,"时段2开始时间小时",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
  p5:addLebel(0.2,1.2,":",25,"left","6,6,6")   
  p5:addComboBox(1.2,1.2,"时段2开始时间分钟",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59")
  p5:addLebel(0.4,1.2,"到",25,"left","6,6,6")   
  p5:addComboBox(1.2,1.2,"时段2结束时间小时",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
  p5:addLebel(0.2,1.2,":",25,"left","6,6,6")   
  p5:addComboBox(1.2,1.2,"时段2结束时间分钟",0,"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59")
  
  p5:addLebel(3,1.2,"之间，暂停脚本。",25,"left","6,6,6")  	
  p5:newLine()	
  p5:addCheckBoxGroup(2.4,1.2,"是否有停止时间","","脚本运行")
  p5:addComboBox(1.6,1.2,"脚本停止时间",0,"10","20","30","40","50","60","70","80","90","100","110","120","130","140","150","160","170","180","190","200","210","220","230","240","270","300","360","420","480","540","600")
  p5:addLebel(3,1.2,"分后，锁屏。",25,"left","6,6,6")  
  p5:newLine()
  p5:addLebel(10,0.8,"这里勾上，然后设置时间段，在这个时间段脚本暂停。时间格式是1330代表13点30分",25)
  p5:newLine()
  p5:addLebel(10,0.8,"这个的用处在于，你如果挂机手机放家里，中午在外面想玩一会儿，可以设置12-13点之间暂停。",25)
  p5:addLebel(10,1,"【===========================================】") 
  p5:newLine()
  p5:addLebel(3,1,"日常御魂觉醒后:")
  local b = p5:newBox(10,0.5)
  
  b:addRadioBoxGroup(9,6,"日常御魂觉醒后","0","推图","御魂","觉醒","结束脚本")
  p5:newLine() 
  --p5:addLebel(3,1,"兑换勋章咒符次数:")  p5:addComboBox(2,1,"兑换勋章咒符次数",0,"10","20","30","40","50","60","70","80","90","100")
  --p5:newLine()
  p5:addLebel(2,1,"悬赏邀请:")
  local b = p5:newBox(10,0.5)
  b:addCheckBoxGroup(8,4,"悬赏邀请","","自动接勾玉邀请","自动接体力邀请","自动接金币邀请")
  p5:newLine()
  
  local p6 = ui:newPage("组队说明")
  p6:newLine()
  p6:addLebel(10,0.8,"组队探索初版，还会有不少问题，欢迎各位反馈。",25)
  p6:newLine()
  p6:addLebel(10,0.8,"时间仓促，还不能保证稳定性，建议各位还是多盯着一点。",25)
  p6:newLine()
  p6:addLebel(10,0.8,"组队功能不适合组野，建议各位双开，自己带自己。",25)
  p6:newLine()
  p6:addLebel(10,0.8,"组队功能不能自动领体力，建议先领了体力在刷。",25)
  p6:newLine()
  p6:addLebel(10,0.8,"首先，准备2个号。队员号的设置和单刷一样的，选好你的狗粮队长，狗粮位置，狗粮普攻。",25)
  p6:newLine()
  p6:addLebel(10,0.8,"然后用队员号，邀请一次队长号。邀请成功，进入副本后，退出来。",25)
  p6:newLine()
  p6:addLebel(10,0.8,"这样，在队长号的好友的第一位，会显示最近受邀，也就是刚才邀请你的那个队员。",25)
  p6:newLine()
  p6:addLebel(10,0.8,"接着，用队员号开挂机等邀请。",25)
  p6:newLine()
  p6:addLebel(10,0.8,"用队长号，选推图，并且在推图结合那里，有一个叫做组队探索（你是队长）的功能，选上。",25)
  p6:newLine()
  p6:addLebel(10,0.8,"这里我需要强调一点，因为组队模式，战斗前准备只有30秒，所以很可能换狗粮来不及。",25)
  p6:newLine()
  p6:addLebel(10,0.8,"建议用拖到最后N卡的方式，并且减少你的卡片数量。",25)
  p6:newLine()
  p6:addLebel(10,0.8,"目前只测试了邀请好友，邀请寮友的方式没测。",25)
  p6:newLine()
  p6:addLebel(10,0.8,"如果是队长带2狗粮，队员带1输出2狗粮的话。",25)
  p6:newLine()
  p6:addLebel(10,0.8,"建议输出位放在更换式神界面左边（战斗准备界面，最下面那只式神）",25)
  p6:newLine()
  p6:addLebel(10,0.8,"然后队长和队员，都勾选狗粮位置（普攻），除了左边以外的所有选项。",25)
  p6:newLine()
  p6:addLebel(10,0.8,"如果是队长带输出，队员带3狗粮的话。",25)
  p6:newLine()
  p6:addLebel(10,0.8,"建议输出位放在更换式神界面左边（战斗准备界面，最下面那只式神）",25)
  p6:newLine()
  p6:addLebel(10,0.8,"然后队员把狗粮位置普攻全选，队长把除了“阴阳师左边”的全选。",25)
  
  local p7 = ui:newPage("兔子说明")
  p7:newLine()
  p7:addLebel(10,0.8,"这个是专门用来过山兔本的。也可以用来魂10。",25)
  p7:newLine()
  p7:addLebel(10,0.8,"通关要求，1速兔子，散件最少201速。",25)
  p7:newLine()
  p7:addLebel(10,0.8,"2速兔子，带招财，165速左右。",25)
  p7:newLine()
  p7:addLebel(10,0.8,"3速输出。这个输出必须是惠比寿/莹草/座敷/海坊主，之一",25)
  p7:newLine()
  p7:addLebel(10,0.8,"如果是惠比寿，需要开场手动操作一下，在安全的时候放下旗子，清明和惠比寿一起输出",25)
  p7:newLine()
  p7:addLebel(10,0.8,"如果是莹草，清明带灭和盾，功能中勾选一直放灭。",25)
  p7:newLine()
  p7:addLebel(10,0.8,"如果是座敷，带涅槃。低于4火我会打火，清明一直灭。这个效率很低但是基本不断火。",25)
  p7:newLine()
  p7:addLebel(10,0.8,"如果是海坊主，清明和海坊主一起输出即可。",25)
  p7:newLine()
  p7:addLebel(10,0.8,"4速清明，带灭和盾，是普攻还是一直灭就看配置，盾我会自动放。",25)
  p7:newLine()
  p7:addLebel(10,0.8,"56都是觉醒兔子带招财即可。",25)
  p7:newLine()
  p7:addLebel(10,0.8,"由于改版后，清明不能无限套盾，所以在打的时候有概率被青蛙砸死，请随时关注。",25)
  p7:newLine()
  p7:addLebel(10,0.8,"除了以上式神之外，还支持博雅的诛邪剑和分身。",25)
  p7:newLine()
  p7:addLebel(10,0.8,"茨木，妖刀，吸血姬，天狗，鸟，酒吞 的平砍。",25)
  local ret,result = ui:show()
  
  if ret == 0 then lua_exit() end
  --print(result)
  return result
end

function main_old()
  tuitu = tuitu_old
  local result = new_ui_old()
  
  
  if result.功能选择 ~= "换号鬼王" then
    local last_str = getStringConfig("lua_exit","您好，您是首次启动云耳脚本。祝您玩得愉快。")
    toast(last_str)
    setStringConfig("lua_exit","欢迎回来，今天准备玩些什么呢？")
  end
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
  if result.推图结合.关闭统计 then
    关闭统计 = 1
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
  if result.随机发呆.每隔 then
    随机发呆 = 1
    发呆间隔大 = 10
    发呆间隔小 = 1
    if result.随机发呆间隔小 ~= nil then
      发呆间隔小 = tonumber(result.随机发呆间隔小)
    end
    if result.随机发呆间隔大 ~= nil then
      发呆间隔大 = tonumber(result.随机发呆间隔大)
    end
    if result.随机发呆时间小 ~= nil then
      发呆时长1 = tonumber(result.随机发呆时间小)
    end
    if result.随机发呆时间大 ~= nil then
      发呆时长2 = tonumber(result.随机发呆时间大)
    end
    if 发呆间隔小 == 0 then
      发呆间隔小 = 1
    end
    if 发呆间隔大 == 0 then
      发呆间隔大 = 2
    end
    if 发呆时长1 == 0 then
      发呆时长1 = 1
    end
    if 发呆时长2 == 0 then
      发呆时长2 = 2
    end
    if 发呆间隔大 < 发呆间隔小 then
      发呆间隔大 = 发呆间隔小
    end
    if 发呆时长2 < 发呆时长1 then
      发呆时长2 = 发呆时长1
    end
  end
  if result.随机点击.每隔 then
    随机点击 = 1
    if result.随机点击间隔小 ~= nil then
      点击间隔小 = tonumber(result.随机点击间隔小)
    end
    if result.随机点击间隔大 ~= nil then
      点击间隔大 = tonumber(result.随机点击间隔大)
    end
    if 点击间隔小 == 0 then
      点击间隔小 = 1
    end
    if 点击间隔大 == 0 then
      点击间隔大 = 2
    end
    if 点击间隔大 < 点击间隔小 then
      点击间隔大 = 点击间隔小
    end
  end
  if result.几次检测一次满 ~= nil then
    几次检测一次满 = tonumber(result.几次检测一次满)
  end
  if result.自动鬼王.在 then	
    自动鬼王 = 1
    if result.自动鬼王小时 ~= nil then
      自动鬼王时间 = tonumber(result.自动鬼王小时)
    end
    if result.自动鬼王分钟 ~= nil then
      自动鬼王时间 = 自动鬼王时间*100 + tonumber(result.自动鬼王分钟)
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
  elseif result.选图方式 == "右边拖动选图" then
    选图方式 = 6	
  elseif result.选图方式 == "极速选图" then
    选图方式 = 7
  end
  
  if result.延迟随机最小值 == "0秒" then
    延迟随机最小值 = 0
  elseif result.延迟随机最小值 == "0.5秒" then
    延迟随机最小值 = 500
  elseif result.延迟随机最小值 == "1秒" then
    延迟随机最小值 = 1000
  elseif result.延迟随机最小值 == "1.5秒" then
    延迟随机最小值 = 1500
  elseif result.延迟随机最小值 == "2秒" then
    延迟随机最小值 = 2000
  elseif result.延迟随机最小值 == "2.5秒" then
    延迟随机最小值 = 2500
  elseif result.延迟随机最小值 == "3秒" then
    延迟随机最小值 = 3000
  elseif result.延迟随机最小值 == "3.5秒" then
    延迟随机最小值 = 3500
  elseif result.延迟随机最小值 == "4秒" then
    延迟随机最小值 = 4000
  elseif result.延迟随机最小值 == "4.5秒" then
    延迟随机最小值 = 4500
  elseif result.延迟随机最小值 == "5秒" then
    延迟随机最小值 = 5000
  elseif result.延迟随机最小值 == "5.5秒" then
    延迟随机最小值 = 5500
  elseif result.延迟随机最小值 == "6秒" then
    延迟随机最小值 = 6000
  elseif result.延迟随机最小值 == "6.5秒" then
    延迟随机最小值 = 6500
  elseif result.延迟随机最小值 == "7秒" then
    延迟随机最小值 = 7000
  elseif result.延迟随机最小值 == "7.5秒" then
    延迟随机最小值 = 7500
  elseif result.延迟随机最小值 == "8秒" then
    延迟随机最小值 = 8000
  elseif result.延迟随机最小值 == "8.5秒" then
    延迟随机最小值 = 8500
  elseif result.延迟随机最小值 == "9秒" then
    延迟随机最小值 = 9000
  elseif result.延迟随机最小值 == "9.5秒" then
    延迟随机最小值 = 9500
  elseif result.延迟随机最小值 == "10秒" then
    延迟随机最小值 = 10000
  end
  
  if result.延迟随机最大值 == "0秒" then
    延迟随机最大值 = 0
  elseif result.延迟随机最大值 == "0.5秒" then
    延迟随机最大值 = 500
  elseif result.延迟随机最大值 == "1秒" then
    延迟随机最大值 = 1000
  elseif result.延迟随机最大值 == "1.5秒" then
    延迟随机最大值 = 1500
  elseif result.延迟随机最大值 == "2秒" then
    延迟随机最大值 = 2000
  elseif result.延迟随机最大值 == "2.5秒" then
    延迟随机最大值 = 2500
  elseif result.延迟随机最大值 == "3秒" then
    延迟随机最大值 = 3000
  elseif result.延迟随机最大值 == "3.5秒" then
    延迟随机最大值 = 3500
  elseif result.延迟随机最大值 == "4秒" then
    延迟随机最大值 = 4000
  elseif result.延迟随机最大值 == "4.5秒" then
    延迟随机最大值 = 4500
  elseif result.延迟随机最大值 == "5秒" then
    延迟随机最大值 = 5000
  elseif result.延迟随机最大值 == "5.5秒" then
    延迟随机最大值 = 5500
  elseif result.延迟随机最大值 == "6秒" then
    延迟随机最大值 = 6000
  elseif result.延迟随机最大值 == "6.5秒" then
    延迟随机最大值 = 6500
  elseif result.延迟随机最大值 == "7秒" then
    延迟随机最大值 = 7000
  elseif result.延迟随机最大值 == "7.5秒" then
    延迟随机最大值 = 7500
  elseif result.延迟随机最大值 == "8秒" then
    延迟随机最大值 = 8000
  elseif result.延迟随机最大值 == "8.5秒" then
    延迟随机最大值 = 8500
  elseif result.延迟随机最大值 == "9秒" then
    延迟随机最大值 = 9000
  elseif result.延迟随机最大值 == "9.5秒" then
    延迟随机最大值 = 9500
  elseif result.延迟随机最大值 == "10秒" then
    延迟随机最大值 = 10000
  end
  if 延迟随机最大值 < 延迟随机最小值 then
    延迟随机最大值 = 延迟随机最小值
  end
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
  
  if result.组队单刷 == "单刷" then
    组队单刷 = 1		
  elseif result.组队单刷 == "开组刷" then
    组队单刷 = 2	
  elseif result.组队单刷 == "混组刷" then
    组队单刷 = 3		
  end
  
  
  if result.脚本延迟 == "不延迟" then
    脚本延迟 = 0
  elseif result.脚本延迟 == "0.1秒" then
    脚本延迟 = 1
  elseif result.脚本延迟 == "0.2秒" then
    脚本延迟 = 2
  elseif result.脚本延迟 == "0.3秒" then
    脚本延迟 = 3
  elseif result.脚本延迟 == "0.4秒" then
    脚本延迟 = 4
  elseif result.脚本延迟 == "0.5秒" then
    脚本延迟 = 5
  elseif result.脚本延迟 == "0.6秒" then
    脚本延迟 = 6
  elseif result.脚本延迟 == "0.7秒" then
    脚本延迟 = 7
  elseif result.脚本延迟 == "0.8秒" then
    脚本延迟 = 8
  elseif result.脚本延迟 == "0.9秒" then
    脚本延迟 = 9
  elseif result.脚本延迟 == "1.0秒" then
    脚本延迟 = 10
  elseif result.脚本延迟 == "1.1秒" then
    脚本延迟 = 11
  elseif result.脚本延迟 == "1.2秒" then
    脚本延迟 = 12
  elseif result.脚本延迟 == "1.3秒" then
    脚本延迟 = 13
  elseif result.脚本延迟 == "1.4秒" then
    脚本延迟 = 14
  elseif result.脚本延迟 == "1.5秒" then
    脚本延迟 = 15
  elseif result.脚本延迟 == "不点" then
    脚本延迟 = -1
  end
  脚本延迟 = -1
  if result.体力不足判定时间 == "1分钟" then
    体力不足判定时间 = 1
  elseif result.体力不足判定时间 == "2分钟" then
    体力不足判定时间 = 2
  elseif result.体力不足判定时间 == "3分钟" then
    体力不足判定时间 = 3
  elseif result.体力不足判定时间 == "4分钟" then
    体力不足判定时间 = 4
  elseif result.体力不足判定时间 == "5分钟" then
    体力不足判定时间 = 5
  elseif result.体力不足判定时间 == "6分钟" then
    体力不足判定时间 = 6
  elseif result.体力不足判定时间 == "7分钟" then
    体力不足判定时间 = 7
  elseif result.体力不足判定时间 == "8分钟" then
    体力不足判定时间 = 8
  elseif result.体力不足判定时间 == "9分钟" then
    体力不足判定时间 = 9
  elseif result.体力不足判定时间 == "10分钟" then
    体力不足判定时间 = 10
  elseif result.体力不足判定时间 == "11分钟" then
    体力不足判定时间 = 11
  elseif result.体力不足判定时间 == "12分钟" then
    体力不足判定时间 = 12
  elseif result.体力不足判定时间 == "13分钟" then
    体力不足判定时间 = 13
  elseif result.体力不足判定时间 == "14分钟" then
    体力不足判定时间 = 14
  end
  
  if result.推图难度 == "普通" then
    推图难度 = 1
  elseif result.推图难度 == "困难" then
    推图难度 = 2
  end
  
  if result.开组刷设置 == "2人" then
    开组几人 = 2
  elseif result.开组刷设置 == "3人" then
    开组几人 = 3
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
  if result.推图结合.突破卷满20去突破 then
    自动突破 = 1
  end
  if result.推图结合.定期去阴阳寮突破 then
    自动阴阳寮 = 1
  end
  if result.自动换狗粮.自动换狗粮 then
    自动换狗粮 = 1
  end
  if result.自动换狗粮.组队探索（你是队长） then
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
  if result.推图结合.推图妖气时随机发呆，模拟真人操作时发呆 then
    随机发呆 = 1
  end
  妖怪退治 = 0
  if result.推图结合.自动斗技 then
    自动斗技 = 1
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
  if result.组队设置 == "寮友" then
    组队设置 = 1
  elseif result.组队设置 == "好友" then
    组队设置 = 2
  end
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
  if result.狗粮选择.红蛋也上 then
    上红蛋 = 1
  end
  if result.狗粮选择.白蛋也上 then
    上白蛋 = 1
  end
  if result.狗粮位置.左边 then
    左边狗粮 = 1
  end
  if result.狗粮位置.中间 then
    中间狗粮 = 1
  end
  if result.狗粮位置.右边 then
    右边狗粮 = 1
  end
  if result.狗粮位置.阴阳师左边 then
    队长左边狗粮 = 1
  end
  if result.狗粮位置.阴阳师右边 then
    队长右边狗粮 = 1
  end
  
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
  
  if result.狗粮普攻.左边 then
    左边普攻 = 1
  end
  if result.狗粮普攻.中间 then
    中间普攻 = 1
  end
  if result.狗粮普攻.右边 then
    右边普攻 = 1
  end
  if result.狗粮普攻.阴阳师右边 then
    队长右边普攻 = 1
  end
  if result.狗粮普攻.阴阳师左边 then
    队长左边普攻 = 1
  end
  
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
  if result.买体力次数 == "0" then
    买体力次数 = 0
  elseif result.买体力次数 == "1" then
    买体力次数 = 1
  elseif result.买体力次数 == "2" then
    买体力次数 = 2
  elseif result.买体力次数 == "3" then
    买体力次数 = 3
  elseif result.买体力次数 == "4" then
    买体力次数 = 4
  elseif result.买体力次数 == "5" then
    买体力次数 = 5
  elseif result.买体力次数 == "6" then
    买体力次数 = 6
  elseif result.买体力次数 == "7" then
    买体力次数 = 7
  elseif result.买体力次数 == "8" then
    买体力次数 = 8
  elseif result.买体力次数 == "9" then
    买体力次数 = 9
  elseif result.买体力次数 == "10" then
    买体力次数 = 10
  elseif result.买体力次数 == "99" then
    买体力次数 = 99
  end
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
  
  
  if result.总共失败次数 == "0" then
    总共失败次数 = 0
  elseif result.总共失败次数 == "1" then
    总共失败次数 = 1
  elseif result.总共失败次数 == "2" then
    总共失败次数 = 2
  elseif result.总共失败次数 == "3" then
    总共失败次数 = 3
  elseif result.总共失败次数 == "4" then
    总共失败次数 = 4
  elseif result.总共失败次数 == "5" then
    总共失败次数 = 5
  elseif result.总共失败次数 == "6" then
    总共失败次数 = 6
  elseif result.总共失败次数 == "7" then
    总共失败次数 = 7
  elseif result.总共失败次数 == "8" then
    总共失败次数 = 8
  elseif result.总共失败次数 == "9" then
    总共失败次数 = 9
  elseif result.总共失败次数 == "10" then
    总共失败次数 = 10
  elseif result.总共失败次数 == "20" then
    总共失败次数 = 20
  elseif result.总共失败次数 == "30" then
    总共失败次数 = 30
  elseif result.总共失败次数 == "999" then
    总共失败次数 = 999
  end
  
  if result.邀请失败次数 == "0" then
    邀请失败次数 = 0
  elseif result.邀请失败次数 == "1" then
    邀请失败次数 = 1
  elseif result.邀请失败次数 == "2" then
    邀请失败次数 = 2
  elseif result.邀请失败次数 == "3" then
    邀请失败次数 = 3
  elseif result.邀请失败次数 == "4" then
    邀请失败次数 = 4
  elseif result.邀请失败次数 == "5" then
    邀请失败次数 = 5
  elseif result.邀请失败次数 == "6" then
    邀请失败次数 = 6
  elseif result.邀请失败次数 == "7" then
    邀请失败次数 = 7
  elseif result.邀请失败次数 == "8" then
    邀请失败次数 = 8
  elseif result.邀请失败次数 == "9" then
    邀请失败次数 = 9
  elseif result.邀请失败次数 == "10" then
    邀请失败次数 = 10
  elseif result.邀请失败次数 == "20" then
    邀请失败次数 = 20
  elseif result.邀请失败次数 == "30" then
    邀请失败次数 = 30
  elseif result.邀请失败次数 == "99999" then
    邀请失败次数 = 99999
  end
  
  if result.刷御魂次数 ~= nil then
    刷御魂次数 = tonumber(result.刷御魂次数)
  end
  
  if result.推图次数 == "0" then
    推图次数 = 0
  elseif result.推图次数 == "1" then
    推图次数 = 1
  elseif result.推图次数 == "2" then
    推图次数 = 2
  elseif result.推图次数 == "3" then
    推图次数 = 3
  elseif result.推图次数 == "4" then
    推图次数 = 4
  elseif result.推图次数 == "5" then
    推图次数 = 5
  elseif result.推图次数 == "6" then
    推图次数 = 6
  elseif result.推图次数 == "7" then
    推图次数 = 7
  elseif result.推图次数 == "8" then
    推图次数 = 8
  elseif result.推图次数 == "9" then
    推图次数 = 9
  elseif result.推图次数 == "10" then
    推图次数 = 10
  elseif result.推图次数 == "20" then
    推图次数 = 20
  elseif result.推图次数 == "30" then
    推图次数 = 30
  elseif result.推图次数 == "无限" then
    推图次数 = 9999999
  end
  --sysLog("推图次数"..推图次数)
  if result.副本内拖图次数 == "0" then
    副本内拖图次数 = 0
  elseif result.副本内拖图次数 == "1" then
    副本内拖图次数 = 1
  elseif result.副本内拖图次数 == "2" then
    副本内拖图次数 = 2
  elseif result.副本内拖图次数 == "3" then
    副本内拖图次数 = 3
  elseif result.副本内拖图次数 == "4" then
    副本内拖图次数 = 4
  elseif result.副本内拖图次数 == "5" then
    副本内拖图次数 = 5
  elseif result.副本内拖图次数 == "6" then
    副本内拖图次数 = 6
  elseif result.副本内拖图次数 == "7" then
    副本内拖图次数 = 7
  elseif result.副本内拖图次数 == "8" then
    副本内拖图次数 = 8
  elseif result.副本内拖图次数 == "9" then
    副本内拖图次数 = 9
  elseif result.副本内拖图次数 == "10" then
    副本内拖图次数 = 10
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
  if result.个人突破顺序 == "优先打勋章少的" then
    个人突破顺序 = 1
  elseif result.个人突破顺序 == "优先打勋章多的" then
    个人突破顺序 = 2
  end
  if result.个人突破顺序 == "优先打勋章少的" then
    个人突破顺序 = 1
  elseif result.个人突破顺序 == "优先打勋章多的" then
    个人突破顺序 = 2
  end
  if result.突破设置 == "个人突破(3胜刷新)" then
    自动刷新 = 3
  elseif result.突破设置 == "个人突破(刷新)" then
    自动刷新 = 4
  elseif result.突破设置 == "个人突破(不刷新)" then
    自动刷新 = 2
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
  if result.功能选择 == "探索" then
    sysLog("探索")
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
    --showHUD(id,"推图",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
    功能 = 1
    tuitu()
  elseif result.功能选择 == "自动剧情" then
    sysLog("自动剧情")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    --showHUD(id,"推剧情图",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
    功能 = 2
    tuitu()
  elseif result.功能选择 == "刷觉醒材料" then
    sysLog("刷觉醒材料")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024 then
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
    --showHUD(id,"刷觉醒材料",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
    功能 = 3
    tuitu()
  elseif result.功能选择 == "刷御魂" then
    sysLog("刷御魂")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    --showHUD(id,"刷御魂",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
    功能 = 4
    tuitu()
  elseif result.功能选择 == "刷业原火" then
    sysLog("刷业原火")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    --showHUD(id,"刷御魂",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
    功能 = 20
    tuitu()
  elseif result.功能选择 == "刷御灵" then
    sysLog("刷御灵")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    --showHUD(id,"刷御魂",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
    功能 = 21
    tuitu()
  elseif result.功能选择 == "挂机等邀请" then
    sysLog("挂机等邀请")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    --showHUD(id,"刷御魂",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
    功能 = 8
    组队探索 = 0
    tuitu()
  elseif result.功能选择 == "挂机邀请魂10" then
    sysLog("挂机邀请魂10")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    --showHUD(id,"刷御魂",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
    自动阴阳寮 = 0
    功能 = 30
    tuitu()
  elseif result.功能选择 == "自动斗技" then
    sysLog("自动斗技")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    --showHUD(id,"刷御魂",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
    功能 = 9
    tuitu()
  elseif result.功能选择 == "自动协同斗技" then
    sysLog("自动协同斗技")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    --showHUD(id,"刷御魂",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
    功能 = 40
    tuitu()
  elseif result.功能选择 == "挂机等探索邀请" then
    sysLog("挂机等探索邀请")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    --showHUD(id,"刷御魂",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
    功能 = 8
    组队探索 = 0
    tuitu()
  elseif result.功能选择 == "百鬼夜行" then
    sysLog("百鬼夜行")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    --showHUD(id,"刷御魂",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
    功能 = 10
    tuitu()
  elseif result.功能选择 == "自动御魂+觉醒" then
    sysLog("自动御魂+觉醒")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    --showHUD(id,"刷御魂",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
    日常进度 = 99
    tuitu()
  elseif result.功能选择 == "一键日常" then
    sysLog("一键日常")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    --showHUD(id,"刷御魂",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
    功能 = 88
    tuitu()
  elseif result.功能选择 == "个人突破" then
    sysLog("个人突破")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    功能 = 7
    tuitu()
  elseif result.功能选择 == "阴阳寮突破" then
    sysLog("阴阳寮突破")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    --开组几人 = 组队突破几人
    功能 = 6
    tuitu()
  elseif result.功能选择 == "妖气封印" then
    sysLog("妖气封印")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    if false then
      if w == 640 and h==1136 then
        require "640"
      else                 
        if w== 750 then
          require "750"
        elseif w== 768 then
          require "768"
        elseif w== 1536 then
          require "1536"
        elseif w==1242 then
          require "1242"
        elseif	w == 720 then
          require "720"
        elseif	w== 1080 then
          require "1080"
        elseif	w==1440 then
          require "1440"
        else
          toast("您的手机分辨率为"..h.."*"..w.."。很抱歉，不支持您的手机分辨率。")
          mSleep(1000)
          lua_exit()
        end
      end
    end
    if result.妖气封印次数 == "10次" then
      妖气封印次数 = 10
    elseif result.妖气封印次数 == "1次" then
      妖气封印次数 = 1
    elseif result.妖气封印次数 == "2次" then
      妖气封印次数 = 2
    elseif result.妖气封印次数 == "3次" then
      妖气封印次数 = 3
    elseif result.妖气封印次数 == "4次" then
      妖气封印次数 = 4
    elseif result.妖气封印次数 == "5次" then
      妖气封印次数 = 5
    elseif result.妖气封印次数 == "20次" then
      妖气封印次数 = 20
    elseif result.妖气封印次数 == "30次" then
      妖气封印次数 = 30
    elseif result.妖气封印次数 == "40次" then
      妖气封印次数 = 40
    elseif result.妖气封印次数 == "50次" then
      妖气封印次数 = 50
    elseif result.妖气封印次数 == "60次" then
      妖气封印次数 = 60
    elseif result.妖气封印次数 == "70次" then
      妖气封印次数 = 70
    elseif result.妖气封印次数 == "80次" then
      妖气封印次数 = 80
    elseif result.妖气封印次数 == "90次" then
      妖气封印次数 = 90
    elseif result.妖气封印次数 == "100次" then
      妖气封印次数 = 100
    elseif result.妖气封印次数 == "110次" then
      妖气封印次数 = 110
    elseif result.妖气封印次数 == "120次" then
      妖气封印次数 = 120
    elseif result.妖气封印次数 == "130次" then
      妖气封印次数 = 130
    elseif result.妖气封印次数 == "140次" then
      妖气封印次数 = 140
    elseif result.妖气封印次数 == "150次" then
      妖气封印次数 = 150
    elseif result.妖气封印次数 == "160次" then
      妖气封印次数 = 160
    elseif result.妖气封印次数 == "170次" then
      妖气封印次数 = 170
    elseif result.妖气封印次数 == "180次" then
      妖气封印次数 = 180
    elseif result.妖气封印次数 == "190次" then
      妖气封印次数 = 190
    elseif result.妖气封印次数 == "200次" then
      妖气封印次数 = 200
    elseif result.妖气封印次数 == "999次" then
      妖气封印次数 = 999
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
    if result.匹配还是挤车 == "匹配模式" then
      匹配还是挤车 = 1		
    elseif result.匹配还是挤车 == "抢车模式" then
      匹配还是挤车 = 2	
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
    --showHUD(id,"妖气封印",20,"0xff130c09","0xffffffff",0,hud_x,hud_y,200,50)
    功能 = 5
    组队单刷 = 1
    tuitu()
  elseif result.功能选择 == "自动兔子（测试）" then
    sysLog("自动兔子（测试版）")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    功能 = 99
    tuitu()
  elseif result.功能选择 == "自动找寄养" then
    sysLog("自动找寄养")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    功能 = 102
    tuitu()
  elseif result.功能选择 == "自动召唤碎片" then
    sysLog("自动召唤碎片")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    zhaohuan()
  elseif result.功能选择 == "自动进小号鬼王" then
    sysLog("自动进小号鬼王")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    功能 = 101
    tuitu()
  elseif result.功能选择 == "自动抽N卡" then
    sysLog("自动抽N卡")
    if w == 640 and h==1136 then
      require "640"
    elseif w == 768  or w == 1024  then
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
    chouka()
  end
end