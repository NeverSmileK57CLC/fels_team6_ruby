class WordLesson < ActiveRecord::Base
  belongs_to :word
  belongs_to :lesson
  belongs_to :word_answer

	def json_data
	{
	  id: id,
	  word: word.json_data
	}    
  end
end
