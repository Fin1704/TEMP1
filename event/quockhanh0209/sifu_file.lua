-- [GuildLadder]
-- LIST=101,205,309
-- 101=HuynhDe|150
-- 205=VoSong|220
-- 309=ThienHa|85
Include("\\script\\headers\\cache")

--  101,205,309 -> {101,205,309}
function QKSifu_L2T(l)
    local t = {}
    local count = 1
    local start_idx = 1
    local find_start, find_end = strfind(l, ",", start_idx, 1)

    while find_start do
        t[count] = strsub(l, start_idx, find_start - 1)
        count = count + 1

        start_idx = find_end + 1
        find_start, find_end = strfind(l, ",", start_idx, 1)
    end
    t[count] = strsub(l, start_idx)

    return t
end

--  101,205,309 <-- {101,205,309}
function QKSifu_T2L(t)
    local l = ""
    local i = 1
    while t[i] do
        if i == 1 then
            l = t[i]
        else
            l = l .. "," .. t[i]
        end
        i = i + 1
    end

    return l
end

function QKSifu_ReadFile_VongHoa(file, sec, key)
    local key = "" .. key;
    local old = GetIniStr(file, sec, key);
    if (not old) or (old == "") then
        old = "";
    end
    CacheOT:Set(sec .. key, old, 3);
    return old;
end

function QKSifu_Get_VongHoa(file, sec, key)
    local cache = CacheOT:Get(sec .. key);
    if cache then
        return cache;
    end
    return QKSifu_ReadFile_VongHoa(file, sec, key);
end

function QKSifu_Set_VongHoa(file, sec, key, val)
    SetIniStr(file, sec, "" .. key, val, 1);
    CacheOT:Set(sec .. key, val, 3);
end

function QKSifu_UpdateList(file, sec, key)
    local list = QKSifu_Get_VongHoa(file, sec, "LIST")
    if (not list or list == "") then
        QKSifu_Set_VongHoa(file, sec, "LIST", key)
    elseif (strfind("," .. list .. ",", "," .. key .. ",", 1, 1) == nil) then
        QKSifu_Set_VongHoa(file, sec, "LIST", list .. "," .. key)
    end
end

-- [PersonalLadder]
-- LIST=user01,admin02,vipgamer99
-- user01=CuuKiem|350    ten tai khoan = ten nhan vat | data
-- admin02=ThanhPhong|200
-- vipgamer99=VoDanh|120
