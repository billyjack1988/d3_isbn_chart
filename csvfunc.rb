
def writecsv(info)
    CSV.open("public/csv/coffee.csv", "wb") do |csv|
        csv << ["brand", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015"]
        info.each do |row|
            csv << ["#{row[0]}", "#{row[1]}", "#{row[2]}", "#{row[3]}", "#{row[4]}", "#{row[5]}", "#{row[6]}", "#{row[7]}", "#{row[8]}", "#{row[9]}", "#{row[10]}", "#{row[11]}"]
        end
    end
end    