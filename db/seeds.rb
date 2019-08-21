class Seed

  def self.begin
    seed = Seed.new
    seed.generate_groups_and_messages
  end


  def generate_groups_and_messages
    20.times do |i|
      group = Group.create!(
        :title => Faker::Science.element
      )

      10.times do |j|
        message = group.messages.create!(
          :author => Faker::FunnyName.four_word_name,
          :title => Faker::Restaurant.name,
          :content => Faker::Restaurant.review
        )
        puts "#{i} made"
      end
    end
  end
end
Seed.begin
