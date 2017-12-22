
def writecsv(info)
    CSV.open("public/csv/coffee.csv", "wb") do |csv|
        csv << ["brand", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015"]
        csv << ["another", "row"]
        
    end
end    