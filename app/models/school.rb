class School < ApplicationRecord
    has_many :dem_stats
    has_many :grade_stats
    has_many :gen_stats

    belongs_to :bdn
end
