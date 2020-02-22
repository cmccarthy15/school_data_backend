class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :bdn, :gen_stats, :dem_stats, :grade_stats
  
  def bdn
    object.bdn.code
  end

  # move most of this behavior to the controller for the show 

  def gen_stats
    object_stats = {}
    object.gen_stats.each do |stat|
      object_stats[stat.as_json['start_year']] = stat.as_json.except('school_id', 'created_at', 'updated_at', 'start_year')
    end
    object_stats
  end

  def dem_stats
    object_stats = {}
    object.dem_stats.each do |stat|
      object_stats[stat.as_json['start_year']] = stat.as_json.except('school_id', 'created_at', 'updated_at', 'start_year')
    end
    object_stats
  end

  def grade_stats
    object_stats = {}
    object.grade_stats.each do |stat|
      object_stats[stat.as_json['start_year']] = stat.as_json.except('school_id', 'created_at', 'updated_at', 'start_year')
    end
    object_stats
  end
end
