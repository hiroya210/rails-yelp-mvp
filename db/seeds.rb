require "faker"
puts "Creating restaurants"

20.times do 
    restaurant = Restaurant.new(
        name: Faker::Restaurant.name,
        address: Faker::Address.full_address, 
        phone_number: Faker::PhoneNumber.cell_phone, 
        category: ["chinese", "italian", "japanese", "french", "belgian"].sample
    )
puts "done!"
puts "Creating reviews"
    5.times do 
        review = Review.new(
            content: Faker::Lorem.sentence(word_count: 10, supplemental: false, random_words_to_add: 4),
            rating: rand(0..5)
        )
        restaurant.reviews << review
        review.save!
    
    end
    restaurant.save!
end

puts "done!"