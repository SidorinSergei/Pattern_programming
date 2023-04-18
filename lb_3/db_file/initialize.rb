data_base_name = 'db_students'
table_name = 'Students'
table_struct = "id integer primary key autoincrement,
              last_name text,
              first_name text,
              patronymic text,
              git text,
              phone text,
              telegram text,
              email text"
students_quantity = 100
system "ruby C:/Users/79892/Documents/GitHub/Pattern_programming/lb_3/db/create_db.rb #{data_base_name}"
system "ruby C:/Users/79892/Documents/GitHub/Pattern_programming/lb_3/db/add_table.rb #{data_base_name} #{table_name} '#{table_struct}'"
system "ruby C:/Users/79892/Documents/GitHub/Pattern_programming/lb_3/db_file/insert_data_set.rb #{data_base_name} #{table_name} #{students_quantity}"