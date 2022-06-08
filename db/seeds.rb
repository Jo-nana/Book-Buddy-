# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "Destroy all..🚮🚮🚮🚮"
User.destroy_all
Book.destroy_all
Chatroom.destroy_all

puts "Creating users...🙋‍♀️🙋‍♀️🙋‍♀️🙋‍♀️"
freddy = User.create!(first_name: 'Frederik', last_name: 'Feldmeier', email:'f.feldmeier98@googlemail.com',
                      password: '123456', username: 'elfeldos', tags: ["S-F", "Fantasy", "Adventure"], address: "Westerstraat 40H, 1015 MK Amsterdam")
johanna = User.create!(first_name: 'Johanna', last_name: 'Florange', email:'johanna@gmail.com',
                       password: '1234567', username: 'jo-nana', tags: ["Horror", "Fantasy", "Poetry"], address: "Tweede Bloemdwarsstraat 28, 1016 LM Amsterdam")
michel = User.create!(first_name: 'Michel', last_name: 'Dupond', email:'michel@gmail.com',
                       password: '1234567', username: 'michou', tags: ["Avdenture", "Classic", "Poetry"], address: "Elandsstraat 22, 1016 SG Amsterdam")
micheline = User.create!(first_name: 'Micheline', last_name: 'Pompom', email:'micheline@gmail.com',
                       password: '1234567', username: 'michelinou', tags: ["Classic", "Horror", "Fantasy"], address: "Rokin 21-49, 1012 GL Amsterdam")

puts "Creating books...📚📚📚📚"

lotr = Book.create!(title: "The Lord of the Rings Vol.1", author: "J.R.R Tolkien", description: "Lorem ipsum dolor sit amet. Est nihil perferendis sed quibusdam atque qui nihil velit aut officia sunt At architecto tempore sed placeat consectetur. Sit illum blanditiis nam pariatur esse et eligendi voluptas et eius harum sed consectetur aliquid rem voluptas rerum. Ea aliquam consectetur quo voluptas quos aut quia alias et quia autem At corrupti consequuntur est autem aliquam.

Sed cumque illo est laboriosam doloremque vel assumenda atque et quibusdam esse est consequatur accusamus et natus reiciendis?", year: 2016, tags: ["Adventure", "Fantasy"],
            picture: "https://images-na.ssl-images-amazon.com/images/I/61mkiPA3EBL.jpg", availability: true, user: johanna)
salem = Book.create!(title: "Salem's Lot", author: "Stephen King", description: "Lorem ipsum dolor sit amet. Est nihil perferendis sed quibusdam atque qui nihil velit aut officia sunt At architecto tempore sed placeat consectetur. Sit illum blanditiis nam pariatur esse et eligendi voluptas et eius harum sed consectetur aliquid rem voluptas rerum. Ea aliquam consectetur quo voluptas quos aut quia alias et quia autem At corrupti consequuntur est autem aliquam.

Sed cumque illo est laboriosam doloremque vel assumenda atque et quibusdam esse est consequatur accusamus et natus reiciendis?", year: 2014, tags: ["Horror", "Thriller"],
            picture: "https://images-na.ssl-images-amazon.com/images/I/81zqDem9OvL.jpg", availability: true, user: freddy)
contemplation = Book.create!(title: "Les Contemplations", author: "Victor Hugo", description: "Lorem ipsum dolor sit amet. Est nihil perferendis sed quibusdam atque qui nihil velit aut officia sunt At architecto tempore sed placeat consectetur. Sit illum blanditiis nam pariatur esse et eligendi voluptas et eius harum sed consectetur aliquid rem voluptas rerum. Ea aliquam consectetur quo voluptas quos aut quia alias et quia autem At corrupti consequuntur est autem aliquam.

Sed cumque illo est laboriosam doloremque vel assumenda atque et quibusdam esse est consequatur accusamus et natus reiciendis?", year: 2002, tags: ["Poetry", "Classic"],
            picture: "https://pictures.abebooks.com/isbn/9782253014997-uk-300.jpg", availability: true, user: johanna)
b1984 = Book.create!(title: "1984", author: "George Orwell", description: "Lorem ipsum dolor sit amet. Est nihil perferendis sed quibusdam atque qui nihil velit aut officia sunt At architecto tempore sed placeat consectetur. Sit illum blanditiis nam pariatur esse et eligendi voluptas et eius harum sed consectetur aliquid rem voluptas rerum. Ea aliquam consectetur quo voluptas quos aut quia alias et quia autem At corrupti consequuntur est autem aliquam.

Sed cumque illo est laboriosam doloremque vel assumenda atque et quibusdam esse est consequatur accusamus et natus reiciendis?", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://images-na.ssl-images-amazon.com/images/I/81StSOpmkjL.jpg", availability: true, user: michel)
tintin = Book.create!(title: "Tintin et les Picaros", author: "Hergé", description: "Lorem ipsum dolor sit amet. Est nihil perferendis sed quibusdam atque qui nihil velit aut officia sunt At architecto tempore sed placeat consectetur. Sit illum blanditiis nam pariatur esse et eligendi voluptas et eius harum sed consectetur aliquid rem voluptas rerum. Ea aliquam consectetur quo voluptas quos aut quia alias et quia autem At corrupti consequuntur est autem aliquam.

Sed cumque illo est laboriosam doloremque vel assumenda atque et quibusdam esse est consequatur accusamus et natus reiciendis?", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://images-na.ssl-images-amazon.com/images/I/A1+NsLtA-bL.jpg", availability: true, user: michel)
Book.create!(title: "Spiderman, Green golbin returns", author: "Stan Lee, Steve Ditko", description: "Lorem ipsum dolor sit amet. Est nihil perferendis sed quibusdam atque qui nihil velit aut officia sunt At architecto tempore sed placeat consectetur. Sit illum blanditiis nam pariatur esse et eligendi voluptas et eius harum sed consectetur aliquid rem voluptas rerum. Ea aliquam consectetur quo voluptas quos aut quia alias et quia autem At corrupti consequuntur est autem aliquam.

Sed cumque illo est laboriosam doloremque vel assumenda atque et quibusdam esse est consequatur accusamus et natus reiciendis?", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://m.media-amazon.com/images/I/51OmYlenCEL.jpg", availability: true, user: micheline)
Book.create!(title: "Game of thrones", author: "G.R.R Martin", description: "Lorem ipsum dolor sit amet. Est nihil perferendis sed quibusdam atque qui nihil velit aut officia sunt At architecto tempore sed placeat consectetur. Sit illum blanditiis nam pariatur esse et eligendi voluptas et eius harum sed consectetur aliquid rem voluptas rerum. Ea aliquam consectetur quo voluptas quos aut quia alias et quia autem At corrupti consequuntur est autem aliquam.

Sed cumque illo est laboriosam doloremque vel assumenda atque et quibusdam esse est consequatur accusamus et natus reiciendis?", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://media.s-bol.com/g6xZXD4z5XvZ/1rgWXmj/769x1200.jpg", availability: true, user: micheline)
Book.create!(title: "Animal Farm", author: "George Orwell", description: "Lorem ipsum dolor sit amet. Est nihil perferendis sed quibusdam atque qui nihil velit aut officia sunt At architecto tempore sed placeat consectetur. Sit illum blanditiis nam pariatur esse et eligendi voluptas et eius harum sed consectetur aliquid rem voluptas rerum. Ea aliquam consectetur quo voluptas quos aut quia alias et quia autem At corrupti consequuntur est autem aliquam.

Sed cumque illo est laboriosam doloremque vel assumenda atque et quibusdam esse est consequatur accusamus et natus reiciendis?", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781839642395/animal-farm-9781839642395_hr.jpg", availability: true, user: micheline)
Book.create!(title: "Harry Potter and the philosopher stone", author: "J.K Rowling", description: "Lorem ipsum dolor sit amet. Est nihil perferendis sed quibusdam atque qui nihil velit aut officia sunt At architecto tempore sed placeat consectetur. Sit illum blanditiis nam pariatur esse et eligendi voluptas et eius harum sed consectetur aliquid rem voluptas rerum. Ea aliquam consectetur quo voluptas quos aut quia alias et quia autem At corrupti consequuntur est autem aliquam.

Sed cumque illo est laboriosam doloremque vel assumenda atque et quibusdam esse est consequatur accusamus et natus reiciendis?", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://res.cloudinary.com/bloomsbury-atlas/image/upload/w_568,c_scale/jackets/9781526626585.jpg", availability: true, user: freddy)
Book.create!(title: "Le Paris des merveilles", author: "Pierre Pevel", description: "Lorem ipsum dolor sit amet. Est nihil perferendis sed quibusdam atque qui nihil velit aut officia sunt At architecto tempore sed placeat consectetur. Sit illum blanditiis nam pariatur esse et eligendi voluptas et eius harum sed consectetur aliquid rem voluptas rerum. Ea aliquam consectetur quo voluptas quos aut quia alias et quia autem At corrupti consequuntur est autem aliquam.

Sed cumque illo est laboriosam doloremque vel assumenda atque et quibusdam esse est consequatur accusamus et natus reiciendis?", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://images-na.ssl-images-amazon.com/images/I/91Dmaung4xL.jpg", availability: true, user: freddy)
Book.create!(title: "Hamlet", author: "William Shakespeare", description: "Lorem ipsum dolor sit amet. Est nihil perferendis sed quibusdam atque qui nihil velit aut officia sunt At architecto tempore sed placeat consectetur. Sit illum blanditiis nam pariatur esse et eligendi voluptas et eius harum sed consectetur aliquid rem voluptas rerum. Ea aliquam consectetur quo voluptas quos aut quia alias et quia autem At corrupti consequuntur est autem aliquam.

Sed cumque illo est laboriosam doloremque vel assumenda atque et quibusdam esse est consequatur accusamus et natus reiciendis?", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://kbimages1-a.akamaihd.net/695eb39e-9405-4c4b-8267-302344f0f5f7/1200/1200/False/hamlet-15.jpg", availability: true, user: freddy)
Book.create!(title: "Coding for dummies", author: "Nikhil Abraham", description: "Lorem ipsum dolor sit amet. Est nihil perferendis sed quibusdam atque qui nihil velit aut officia sunt At architecto tempore sed placeat consectetur. Sit illum blanditiis nam pariatur esse et eligendi voluptas et eius harum sed consectetur aliquid rem voluptas rerum. Ea aliquam consectetur quo voluptas quos aut quia alias et quia autem At corrupti consequuntur est autem aliquam.

Sed cumque illo est laboriosam doloremque vel assumenda atque et quibusdam esse est consequatur accusamus et natus reiciendis?", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://images-na.ssl-images-amazon.com/images/I/51q-YHB62GL.jpg", availability: true, user: johanna)
Book.create!(title: "Berserk Vol.41", author: "Kentaro Miura", description: "Lorem ipsum dolor sit amet. Est nihil perferendis sed quibusdam atque qui nihil velit aut officia sunt At architecto tempore sed placeat consectetur. Sit illum blanditiis nam pariatur esse et eligendi voluptas et eius harum sed consectetur aliquid rem voluptas rerum. Ea aliquam consectetur quo voluptas quos aut quia alias et quia autem At corrupti consequuntur est autem aliquam.

Sed cumque illo est laboriosam doloremque vel assumenda atque et quibusdam esse est consequatur accusamus et natus reiciendis?", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://image.jeuxvideo.com/medias-sm/164037/1640365560-6919-artwork.png", availability: true, user: johanna)
Book.create!(title: "The Witcher: The last wish", author: "Andrzej Sapkowski", description: "Lorem ipsum dolor sit amet. Est nihil perferendis sed quibusdam atque qui nihil velit aut officia sunt At architecto tempore sed placeat consectetur. Sit illum blanditiis nam pariatur esse et eligendi voluptas et eius harum sed consectetur aliquid rem voluptas rerum. Ea aliquam consectetur quo voluptas quos aut quia alias et quia autem At corrupti consequuntur est autem aliquam.

Sed cumque illo est laboriosam doloremque vel assumenda atque et quibusdam esse est consequatur accusamus et natus reiciendis?", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://pbs.twimg.com/media/E535iZIWYAEY1DD?format=jpg&name=medium", availability: true, user: michel)
Book.create!(title: "World of Warcraft: Sylvanas", author: "Christie Golden", description: "Lorem ipsum dolor sit amet. Est nihil perferendis sed quibusdam atque qui nihil velit aut officia sunt At architecto tempore sed placeat consectetur. Sit illum blanditiis nam pariatur esse et eligendi voluptas et eius harum sed consectetur aliquid rem voluptas rerum. Ea aliquam consectetur quo voluptas quos aut quia alias et quia autem At corrupti consequuntur est autem aliquam.

Sed cumque illo est laboriosam doloremque vel assumenda atque et quibusdam esse est consequatur accusamus et natus reiciendis?", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://bnetcmsus-a.akamaihd.net/cms/content_entry_media/bc/BC3WS615K3AJ1619022587558.jpg", availability: true, user: johanna)
puts "Creating chatroom (bookclubs)...🗣🗣🗣🗣"

Chatroom.create!(name: "let's talk", user: johanna, book: lotr)
Chatroom.create!(name: "The fellowship of the ring", user: freddy, book: lotr)
Chatroom.create!(name: "why Sam is the best", user: johanna, book: lotr)
Chatroom.create!(name: "scary book ever!", user: freddy, book: salem)
Chatroom.create!(name: "or 2022?", user: johanna, book: b1984)
Chatroom.create!(name: "griefs in poetry (debat)", user: freddy, book: contemplation)
Chatroom.create!(name: "SHARE YOUR FAVORITE POEM", user: johanna, book: contemplation)
Chatroom.create!(name: "milou 🐶", user: johanna, book: tintin)


Book.all.each do |book|
  file = URI.open(book.picture)
  book.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
end


puts "done!"
