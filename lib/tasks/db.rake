namespace :db do

  desc "Populate your local enviroment with useful data"
  task populate: [:environment] do
    unless Rails.env.production?
      [
        { email: "travis@strats.co" },
        { email: "tommy.caruso2118@gmail.com" },
        { email: "auth@strats.co" },
        { email: "shane@shaneriley.com" },
        { email: "ro@therubymug.com" }
      ].each do |user_attrs|
        user = User.find_by(user_attrs)
        if user.blank?
          puts "Creating admin user: #{user_attrs[:email]}"
          User.create(user_attrs.merge(admin: true, password: "w3ar3inpublic", password_confirmation: "w3ar3inpublic"))
        end
      end
    end
  end

end
