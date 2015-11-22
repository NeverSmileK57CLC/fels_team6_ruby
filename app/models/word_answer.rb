class WordAnswer < ActiveRecord::Base
  belongs_to :word
  belongs_to :word_lesson
end
