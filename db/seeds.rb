# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create user
User.create(fullname: "Bach Van Ngoc", email: "neversmile12b1@gmail.com", password: "123456", role: "Admin")
User.create(fullname: "Team 6", email: "team6@vnu.edu.vn", password: "123456")
User.create(fullname: "NeverSmile", email: "neversmilek57clc@gmail.com", password: "123456", role: "Admin")
User.create(fullname: "Mai Dai Dien", email: "dienmd@gmail.com", password: "123456")
User.create(fullname: "Nguyen Huy Hoang", email: "hoangnh@gmail.com", password: "123456")



# Create category
category = Category.create(name: "Basic 500", description: "Abc")
word1 = Word.create(category: category, content: "Word 1")
WordAnswer.create(word: word1, content: "answer1", correct: true)
WordAnswer.create(word: word1, content: "answer2", correct: false)
WordAnswer.create(word: word1, content: "answer3", correct: false)
WordAnswer.create(word: word1, content: "answer4", correct: false)

word2 = Word.create(category: category, content: "Word 2")
WordAnswer.create(word: word2, content: "answer1", correct: false)
WordAnswer.create(word: word2, content: "answer2", correct: true)
WordAnswer.create(word: word2, content: "answer3", correct: false)
WordAnswer.create(word: word2, content: "answer4", correct: false)

word3 = Word.create(category: category, content: "Word 3")
WordAnswer.create(word: word3, content: "answer1", correct: true)
WordAnswer.create(word: word3, content: "answer2", correct: false)
WordAnswer.create(word: word3, content: "answer3", correct: false)
WordAnswer.create(word: word3, content: "answer4", correct: false)

word4 = Word.create(category: category, content: "Word 4")
WordAnswer.create(word: word4, content: "answer1", correct: false)
WordAnswer.create(word: word4, content: "answer2", correct: false)
WordAnswer.create(word: word4, content: "answer3", correct: true)
WordAnswer.create(word: word4, content: "answer4", correct: false)

word5 = Word.create(category: category, content: "Word 5")
WordAnswer.create(word: word5, content: "answer1", correct: true)
WordAnswer.create(word: word5, content: "answer2", correct: false)
WordAnswer.create(word: word5, content: "answer3", correct: false)
WordAnswer.create(word: word5, content: "answer4", correct: false)

word6 = Word.create(category: category, content: "Word 6")
WordAnswer.create(word: word6, content: "answer1", correct: false)
WordAnswer.create(word: word6, content: "answer2", correct: true)
WordAnswer.create(word: word6, content: "answer3", correct: false)
WordAnswer.create(word: word6, content: "answer4", correct: false)

word7 = Word.create(category: category, content: "Word 7")
WordAnswer.create(word: word7, content: "answer1", correct: true)
WordAnswer.create(word: word7, content: "answer2", correct: false)
WordAnswer.create(word: word7, content: "answer3", correct: false)
WordAnswer.create(word: word7, content: "answer4", correct: false)

word8 = Word.create(category: category, content: "Word 8")
WordAnswer.create(word: word8, content: "answer1", correct: false)
WordAnswer.create(word: word8, content: "answer2", correct: false)
WordAnswer.create(word: word8, content: "answer3", correct: true)
WordAnswer.create(word: word8, content: "answer4", correct: false)

word9 = Word.create(category: category, content: "Word 9")
WordAnswer.create(word: word9, content: "answer1", correct: true)
WordAnswer.create(word: word9, content: "answer2", correct: false)
WordAnswer.create(word: word9, content: "answer3", correct: false)
WordAnswer.create(word: word9, content: "answer4", correct: false)

word10 = Word.create(category: category, content: "Word 10")
WordAnswer.create(word: word10, content: "answer1", correct: false)
WordAnswer.create(word: word10, content: "answer2", correct: true)
WordAnswer.create(word: word10, content: "answer3", correct: false)
WordAnswer.create(word: word10, content: "answer4", correct: false)

word11 = Word.create(category: category, content: "Word 11")
WordAnswer.create(word: word11, content: "answer1", correct: true)
WordAnswer.create(word: word11, content: "answer2", correct: false)
WordAnswer.create(word: word11, content: "answer3", correct: false)
WordAnswer.create(word: word11, content: "answer4", correct: false)

word12 = Word.create(category: category, content: "Word 12")
WordAnswer.create(word: word12, content: "answer1", correct: false)
WordAnswer.create(word: word12, content: "answer2", correct: false)
WordAnswer.create(word: word12, content: "answer3", correct: true)
WordAnswer.create(word: word12, content: "answer4", correct: false)

word13 = Word.create(category: category, content: "Word 13")
WordAnswer.create(word: word13, content: "answer1", correct: true)
WordAnswer.create(word: word13, content: "answer2", correct: false)
WordAnswer.create(word: word13, content: "answer3", correct: false)
WordAnswer.create(word: word13, content: "answer4", correct: false)

word14 = Word.create(category: category, content: "Word 14")
WordAnswer.create(word: word14, content: "answer1", correct: false)
WordAnswer.create(word: word14, content: "answer2", correct: true)
WordAnswer.create(word: word14, content: "answer3", correct: false)
WordAnswer.create(word: word14, content: "answer4", correct: false)

word15 = Word.create(category: category, content: "Word 15")
WordAnswer.create(word: word15, content: "answer1", correct: true)
WordAnswer.create(word: word15, content: "answer2", correct: false)
WordAnswer.create(word: word15, content: "answer3", correct: false)
WordAnswer.create(word: word15, content: "answer4", correct: false)

word16 = Word.create(category: category, content: "Word 16")
WordAnswer.create(word: word16, content: "answer1", correct: false)
WordAnswer.create(word: word16, content: "answer2", correct: false)
WordAnswer.create(word: word16, content: "answer3", correct: true)
WordAnswer.create(word: word16, content: "answer4", correct: false)

word17 = Word.create(category: category, content: "Word 17")
WordAnswer.create(word: word17, content: "answer1", correct: true)
WordAnswer.create(word: word17, content: "answer2", correct: false)
WordAnswer.create(word: word17, content: "answer3", correct: false)
WordAnswer.create(word: word17, content: "answer4", correct: false)

word18 = Word.create(category: category, content: "Word 18")
WordAnswer.create(word: word18, content: "answer1", correct: false)
WordAnswer.create(word: word18, content: "answer2", correct: true)
WordAnswer.create(word: word18, content: "answer3", correct: false)
WordAnswer.create(word: word18, content: "answer4", correct: false)

word19 = Word.create(category: category, content: "Word 19")
WordAnswer.create(word: word19, content: "answer1", correct: true)
WordAnswer.create(word: word19, content: "answer2", correct: false)
WordAnswer.create(word: word19, content: "answer3", correct: false)
WordAnswer.create(word: word19, content: "answer4", correct: false)

word20 = Word.create(category: category, content: "Word 20")
WordAnswer.create(word: word20, content: "answer1", correct: false)
WordAnswer.create(word: word20, content: "answer2", correct: false)
WordAnswer.create(word: word20, content: "answer3", correct: true)
WordAnswer.create(word: word20, content: "answer4", correct: false)

word21 = Word.create(category: category, content: "Word 21")
WordAnswer.create(word: word21, content: "answer1", correct: true)
WordAnswer.create(word: word21, content: "answer2", correct: false)
WordAnswer.create(word: word21, content: "answer3", correct: false)
WordAnswer.create(word: word21, content: "answer4", correct: false)

word22 = Word.create(category: category, content: "Word 22")
WordAnswer.create(word: word22, content: "answer1", correct: false)
WordAnswer.create(word: word22, content: "answer2", correct: true)
WordAnswer.create(word: word22, content: "answer3", correct: false)
WordAnswer.create(word: word22, content: "answer4", correct: false)

word23 = Word.create(category: category, content: "Word 23")
WordAnswer.create(word: word23, content: "answer1", correct: true)
WordAnswer.create(word: word23, content: "answer2", correct: false)
WordAnswer.create(word: word23, content: "answer3", correct: false)
WordAnswer.create(word: word23, content: "answer4", correct: false)

word24 = Word.create(category: category, content: "Word 24")
WordAnswer.create(word: word24, content: "answer1", correct: false)
WordAnswer.create(word: word24, content: "answer2", correct: false)
WordAnswer.create(word: word24, content: "answer3", correct: true)
WordAnswer.create(word: word24, content: "answer4", correct: false)


###################################################################
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

word = Word.create(category: category, content: "Word 300")
WordAnswer.create(word: word, content: "answer1", correct: true)
WordAnswer.create(word: word, content: "answer2", correct: false)
WordAnswer.create(word: word, content: "answer3", correct: false)
WordAnswer.create(word: word, content: "answer4", correct: false)

word = Word.create(category: category, content: "Word 400")
WordAnswer.create(word: word, content: "answer1", correct: false)
WordAnswer.create(word: word, content: "answer2", correct: true)
WordAnswer.create(word: word, content: "answer3", correct: false)
WordAnswer.create(word: word, content: "answer4", correct: true)

30.times do |n|
	content = "Word #{1000+n}"
	word = Word.create(category: category, content: content)
	WordAnswer.create(word: word, content: "answer1", correct: false)
	WordAnswer.create(word: word, content: "answer2", correct: true)
	WordAnswer.create(word: word, content: "answer3", correct: false)
	WordAnswer.create(word: word, content: "answer4", correct: true)
end

#Create lesson
lesson = Lesson.create(result: 10, user_id: 1, category_id: 1)
WordLesson.create(lesson: lesson, word: word1, answer: "answer1")
WordLesson.create(lesson: lesson, word: word2, answer: "answer1")
WordLesson.create(lesson: lesson, word: word3, answer: "answer3")
WordLesson.create(lesson: lesson, word: word4, answer: "answer1")
WordLesson.create(lesson: lesson, word: word5, answer: "answer2")
WordLesson.create(lesson: lesson, word: word6, answer: "answer3")
WordLesson.create(lesson: lesson, word: word7, answer: "answer4")
WordLesson.create(lesson: lesson, word: word8, answer: "answer2")
WordLesson.create(lesson: lesson, word: word9, answer: "answer1")
WordLesson.create(lesson: lesson, word: word10, answer: "answer3")
WordLesson.create(lesson: lesson, word: word11, answer: "answer1")
WordLesson.create(lesson: lesson, word: word12, answer: "answer1")
WordLesson.create(lesson: lesson, word: word13, answer: "answer3")
WordLesson.create(lesson: lesson, word: word14, answer: "answer1")
WordLesson.create(lesson: lesson, word: word15, answer: "answer2")
WordLesson.create(lesson: lesson, word: word16, answer: "answer3")
WordLesson.create(lesson: lesson, word: word17, answer: "answer4")
WordLesson.create(lesson: lesson, word: word18, answer: "answer2")
WordLesson.create(lesson: lesson, word: word19, answer: "answer1")
WordLesson.create(lesson: lesson, word: word24, answer: "answer3")