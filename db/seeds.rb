# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroy all.."
User.destroy_all
Book.destroy_all

puts "Creating users..."
freddy = User.create!(first_name: 'Frederik', last_name: 'Feldmeier', email:'f.feldmeier98@googlemail.com',
                      password: '123456', username: 'elfeldos', tags: ["S-F", "Fantasy", "Adventure"])
johanna = User.create!(first_name: 'Johanna', last_name: 'Florange', email:'johanna@gmail.com',
                       password: '1234567', username: 'jo-nana', tags: ["Horror", "Fantasy", "Poetry"])

puts "Creating books..."

Book.create!(title: "The Lord of the Rings", author: "J.R.R Tolkien", description: "'The Lord of the Rings' is a modern
            fantasy tale about overcoming the dark power brought on by a magical ring.", year: 2016, tags: ["Adventure", "Fantasy"],
            picture: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1566425108l/33.jpg", availability: true, user: johanna)
Book.create!(title: "Salem's Lot", author: "Stephen King", description: "Set in the small fictional town of Jerusalem’s Lot, Maine, the story follows a young author named Benjamin Mears.
             He has returned to the town, where he spent a number of years growing up, in order to face some old childhood fears and continue working on a new novel inspired by the source of those fears, the foreboding and abandoned old Marsten House, which looms over the town on a hill.", year: 2014, tags: ["Horror", "Thriller"],
            picture: "https://images-na.ssl-images-amazon.com/images/I/81zqDem9OvL.jpg", availability: true, user: freddy)
Book.create!(title: "Les Contemplations", author: "Victor Hugo", description: "The most touching and beautiful collection of poetry ever written ", year: 2002, tags: ["Poetry", "Classic"],
            picture: "https://pictures.abebooks.com/isbn/9782253014997-uk-300.jpg", availability: true, user: johanna)
Book.create!(title: "1984", author: "George Orwell", description: "The book is set in 1984 in Oceania, one of three perpetually warring totalitarian states (the other two are Eurasia and Eastasia). Oceania is governed by the all-controlling Party, which has brainwashed the population into unthinking obedience to its leader, Big Brother.", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://images-na.ssl-images-amazon.com/images/I/81StSOpmkjL.jpg", availability: true, user: freddy)

Book.create!(title: "Tintin", author: "George Orwell", description: "The book is set in 1984 in Oceania, one of three perpetually warring totalitarian states (the other two are Eurasia and Eastasia). Oceania is governed by the all-controlling Party, which has brainwashed the population into unthinking obedience to its leader, Big Brother.", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://images-na.ssl-images-amazon.com/images/I/81StSOpmkjL.jpg", availability: true, user: freddy)

Book.create!(title: "Spiderman n°78", author: "George Orwell", description: "The book is set in 1984 in Oceania, one of three perpetually warring totalitarian states (the other two are Eurasia and Eastasia). Oceania is governed by the all-controlling Party, which has brainwashed the population into unthinking obedience to its leader, Big Brother.", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://images-na.ssl-images-amazon.com/images/I/81StSOpmkjL.jpg", availability: true, user: freddy)

Book.create!(title: "Game of thrones", author: "George Orwell", description: "The book is set in 1984 in Oceania, one of three perpetually warring totalitarian states (the other two are Eurasia and Eastasia). Oceania is governed by the all-controlling Party, which has brainwashed the population into unthinking obedience to its leader, Big Brother.", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://images-na.ssl-images-amazon.com/images/I/81StSOpmkjL.jpg", availability: true, user: freddy)

Book.create!(title: "Animal Farm", author: "George Orwell", description: "The book is set in 1984 in Oceania, one of three perpetually warring totalitarian states (the other two are Eurasia and Eastasia). Oceania is governed by the all-controlling Party, which has brainwashed the population into unthinking obedience to its leader, Big Brother.", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://images-na.ssl-images-amazon.com/images/I/81StSOpmkjL.jpg", availability: true, user: freddy)

Book.create!(title: "Harry Potter and the philosopher's stone", author: "George Orwell", description: "The book is set in 1984 in Oceania, one of three perpetually warring totalitarian states (the other two are Eurasia and Eastasia). Oceania is governed by the all-controlling Party, which has brainwashed the population into unthinking obedience to its leader, Big Brother.", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://images-na.ssl-images-amazon.com/images/I/81StSOpmkjL.jpg", availability: true, user: freddy)
Book.create!(title: "Le Paris des merveilles", author: "George Orwell", description: "The book is set in 1984 in Oceania, one of three perpetually warring totalitarian states (the other two are Eurasia and Eastasia). Oceania is governed by the all-controlling Party, which has brainwashed the population into unthinking obedience to its leader, Big Brother.", year: 2008, tags: ["Distopia", "S-F"],
            picture: "https://images-na.ssl-images-amazon.com/images/I/81StSOpmkjL.jpg", availability: true, user: freddy)


puts "done!"
