require 'sqlite3'

db = SQLite3::Database.open "C:/Users/79892/Documents/GitHub/Pattern_programming/db_students.db"
db.results_as_hash = true
res = db.execute 'select * from Students'

res.each { |obj| print "#{obj}\n" }