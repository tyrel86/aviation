namespace :blast do

  desc "Sends and email blast"
  task blast: :environment do
    Contact.all.each do |c|    
      Blast.top_stories(c).deliver if c.active
    end
  end

end
