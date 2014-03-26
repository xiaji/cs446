class Foster < ActiveRecord::Base
    has_one :line_items, dependent: :destroy
end
