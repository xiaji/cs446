class LineItem < ActiveRecord::Base
    belongs_to :cat
    belongs_to :foster
end
