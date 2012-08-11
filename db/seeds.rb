puts "EMPTY THE MONGODB DATABASE"
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

puts "SETTING UP DEFAULT ADMIN USER"
Rake::Task["activeadmin:settings:create_admin"].invoke

