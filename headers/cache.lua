CacheOT = CacheOT or {
    values = {}, 
    times  = {}, 
    last_clean_key = nil,
};

function CacheOT:CleanStep(nSteps)
    nSteps = nSteps or 3; 
    local curTime = GetCurrentTime();
    local k = self.last_clean_key;

    for i = 1, nSteps do
        k = next(self.times, k);
        if not k then
            k = next(self.times, nil); 
            if not k then break end;  
        end

        if self.times[k] and self.times[k] < curTime then
            self.values[k] = nil;
            self.times[k]  = nil;
        end
    end

    self.last_clean_key = k;
end

function CacheOT:Set(key, value, duration)
    self.values[key] = value;
    if duration then
        self.times[key] = GetCurrentTime() + duration;
    else
        self.times[key] = nil;
    end
    self:CleanStep(2);
end

function CacheOT:Get(key)
    self:CleanStep(2);
    if self.times[key] then
        if self.times[key] < GetCurrentTime() then
            self.values[key] = nil;
            self.times[key]  = nil;
            return nil;
        end
    end
    return self.values[key];
end

function CacheOT:Del(key)
    self.values[key] = nil;
    self.times[key]  = nil;
end
