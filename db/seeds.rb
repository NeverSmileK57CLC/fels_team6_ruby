# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create user
# User.create(fullname: "Bach Van Ngoc", email: "neversmile12b1@gmail.com", password: "123456")
# User.create(fullname: "Team 6", email: "team6@vnu.edu.vn", password: "123456")

category = Category.create(name: "Basic 500", description: "Abc")
word = Word.create(category: category, content: "Word 1")
WordAnswer.create(word: word, content: "answer1", correct: true)
WordAnswer.create(word: word, content: "answer2", correct: false)
WordAnswer.create(word: word, content: "answer3", correct: false)
WordAnswer.create(word: word, content: "answer4", correct: false)

word = Word.create(category: category, content: "Word 2")
WordAnswer.create(word: word, content: "answer1", correct: false)
WordAnswer.create(word: word, content: "answer2", correct: true)
WordAnswer.create(word: word, content: "answer3", correct: false)
WordAnswer.create(word: word, content: "answer4", correct: false)

category = Category.create(name: "Basic 1000", description: "Abcd")
word = Word.create(category: category, content: "Word 100")
WordAnswer.create(word: word, content: "answer1", correct: true)
WordAnswer.create(word: word, content: "answer2", correct: false)
WordAnswer.create(word: word, content: "answer3", correct: false)
WordAnswer.create(word: word, content: "answer4", correct: false)

word = Word.create(category: category, content: "Word 200")
WordAnswer.create(word: word, content: "answer1", correct: false)
WordAnswer.create(word: word, content: "answer2", correct: true)
WordAnswer.create(word: word, content: "answer3", correct: false)
WordAnswer.create(word: word, content: "answer4", correct: false)