function Split(szFullString, szSeparator)  
	local nFindStartIndex = 1  
	local nSplitIndex = 1
	local nSplitArray = {}
	while true do  
		local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)  
		if not nFindLastIndex then  
			nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))  
			break  
		end  
		nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)  
		nFindStartIndex = nFindLastIndex + string.len(szSeparator)  
		nSplitIndex = nSplitIndex + 1  
	end  
	return nSplitArray  
end

function readFile(path)
    local file = io.open(path,"r");
    if file then
        local _list = {};
        for l in file:lines() do 
            table.insert(_list,l)
        end
        file:close();
        return _list
    end
end

function getAccSize()
    local file = io.open('[public]account.txt',"r");
    if file then
        local _list = {};
        for l in file:lines() do 
            table.insert(_list,l)
        end
        file:close();
        return #_list
		else
			toast("很抱歉，没有检测到账号文件。请确认账号文件的存放正确。")
			mSleep(3000)
			lua_exit()
			return 0
    end
end

function getindex()
	local _file = nil
	local ret = 0
	_file = io.open('[public]index.txt','r')
	if _file ~= nil then
		ret = tonumber(_file:read())
		_file:close()
		toast(string.format("当前第%s个账号",ret))
		return ret
	end
end

function getaccount(acc_index)
	local ret = nil
	--ret = getindex()
	local curacc = {}
	local acc = nil
	curacc = readFile('[public]account.txt')
		acc = curacc[acc_index]
		acc=string.match(acc,"%s*(.-)%s*$")	
		return acc
end