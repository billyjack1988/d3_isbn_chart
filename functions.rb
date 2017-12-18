


def gettingvalid(list)
    new_list = []
    list.each do |item|
        g = item.split(',')
        g.each do |hank|
            if hank == "valid" || hank == "invalid"
            new_list << hank
            else
            end   
        end     
    end
    x = new_list.flatten
    #print "#{x}"
    x
end

def howmanyvalid(validated)
    valid = []
    validated.each do |item|
        if item == "valid"
            valid << item
        end
    end
    validcount = valid.count
    print "#{validcount}"   
    validcount
end  

def howmanyinvalid(validated)
    invalid = []
    validated.each do |item|
        if item == "invalid"
            invalid << item
        end
    end
    invalidcount = invalid.count
    print "#{invalidcount}"
    invalidcount     
end    

def joinscounts(validcount,invalidcount)
    infoarr = []
    infoarr << validcount
    infoarr << invalidcount
    p "#{infoarr}"
    infoarr
end    
