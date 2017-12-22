
def writecsv(info)
    CSV.open("public/csv/coffee.csv", "wb") do |csv|
        csv << ["row", "of", "CSV", "data"]
        csv << ["another", "row"]
        
    end
end    