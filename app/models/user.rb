class User < ActiveRecord::Base
	has_may :lessons
end
