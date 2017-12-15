

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
    print "#{x}"
end

welp = ["ITEM,ISBN,Valid?", "1,9780470059029,valid", "2,4780470059029,invalid", "3,9780471486480,valid", "4,9780596809485,valid", "5,9780131495050,valid", "6,9780262134729,valid", "7,7465905,invalid", "8,00000000,invalid", "9,7987022-78962-ds-22,invalid", "10,0471958697,invalid", "11,0471606952,invalid", "12,0470845252,invalid", "13,0321146530,invalid", "14,877195869x,valid", "15,877195x869,invalid", "16,,invalid", "17,877195869xx,invalid", "18,877195@869x,invalid", "19,123456789X,valid", "20,1847563,invalid", "21,howdy,invalid", "22,2586234234095,invalid", "23,marv,invalid", "24,1234,invalid"]
gettingvalid(welp)



