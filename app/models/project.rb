class Project < ApplicationRecord
end

#presence validators added after rspec failed 2 tests
class Project < ApplicationRecord
    validates_presence_of :title, :description
end