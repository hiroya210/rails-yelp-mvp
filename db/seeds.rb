require "faker"
puts "Creating restaurants"

50.times do 
    restaurant = Restaurant.new(
        name: Faker::Restaurant.name,
        address: Faker::Address.street_name,
        phone_number: Faker::PhoneNumber.cell_phone, 
        category: ["chinese", "italian", "japanese", "french", "belgian"].sample
    )
puts "done!"
    5.times do 
        review = Review.new(
            content: Faker::Lorem.sentence(word_count: 10, supplemental: false, random_words_to_add: 4),
            rating: rand(1..5)
    )
        restaurant.reviews << review
        review.save!
        puts "Creating reviews #{review.id}"
        
    end
    restaurant.save!
end

puts "done!"