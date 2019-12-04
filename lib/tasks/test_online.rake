namespace :test_online do
  desc "Set admin permission by Id"
  task :setAdminById, [:id] => [:environment] do |t, args|
    u = User.find_by_id(args[:id])
    u.role = 2
    p "The user with email: " + u.email + " has been selected as admin!"
    u.save
  end

  desc "Set admin permission by Email"
  task :setAdminByEmail, [:email] => [:environment] do |t, args|
    u = User.find_by(email: args[:email])
    u.role = 2
    p "The user with email: " + u.email + " has been selected as admin!"
    u.save
  end

  desc "Drop admin permission by Id"
  task :dropAdminById, [:id] => [:environment] do |t, args|
    u = User.find_by_id(args[:id])
    u.role = 1
    p "The user with email: " + u.email + " has been selected as normal user!"
    u.save
  end

  desc "Drop admin permission by Email"
  task :dropAdminByEmail, [:email] => [:environment] do |t, args|
    u = User.find_by(email: args[:email])
    u.role = 1
    p "The user with email: " + u.email + " has been selected as normal user!"
    u.save
  end
end
