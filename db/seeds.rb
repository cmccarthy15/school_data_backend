# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'


# response = RestClient.get('https://data.cityofnewyork.us/resource/s52a-8aq6.json')
response = RestClient.get('https://data.cityofnewyork.us/resource/s52a-8aq6.json?$limit=10000')
# rm_array = JSON.parse(rm)[“results”]

rm_array = JSON.parse(response)
# byebug
rm_array.each do |school|
    @bdn = Bdn.find_or_create_by(code: school['dbn'])
    # byebug

    @school = School.find_or_create_by({
        name: school['school_name'],
        bdn: @bdn
    })

    @gen_stats = GenStat.create({
        school: @school,
        start_year: school['year'].split('-')[0].to_i,
        total_enrollment: school['total_enrollment'].to_i,
        economic_need: school['economic_need_index'].to_f
    })

    @dem_stats = DemStat.create({
        school: @school,
        start_year: school['year'].split('-')[0].to_i,
        male: school['male_1'].to_i,
        male_percentage: school['male_2'].to_f,
        female: school['female_1'].to_i,
        female_percentage: school['female_2'].to_f,
        white: school['white_1'].to_i,
        white_percentage: school['white_2'].to_f,
        asian: school['asian_1'].to_i,
        asian_percentage: school['asian_2'].to_f,
        black: school['black_1'].to_i,
        black_percentage: school['black_2'].to_f,
        hispanic: school['hispanic_1'].to_i,
        hispanic_percentage: school['hispanic_2'].to_f,
        multiracial: school['multiple_race_categories_not_represented_1'].to_i,
        multiracial_percentage: school['multiple_race_categories_not_represented_2'].to_f,
        poverty: school['poverty_1'].to_i,
        poverty_percentage: school['poverty_2'].to_f,
        ell: school['english_language_learners_1'].to_i,
        ell_percentage: school['english_language_learners_2'].to_f,
        disability: school['students_with_disabilities_1'].to_i,
        disability_percentage: school['students_with_disabilities_2'].to_f
    })

    @grade_stats = GradeStat.create({
        school: @school,
        start_year: school['year'].split('-')[0].to_i,
        grade_pk: school['grade_pk_half_day_full_day'].to_i,
        grade_k: school['grade_k'].to_i,
        grade_1: school['grade_1'].to_i,
        grade_2: school['grade_2'].to_i,
        grade_3: school['grade_3'].to_i,
        grade_4: school['grade_4'].to_i,
        grade_5: school['grade_5'].to_i,
        grade_6: school['grade_6'].to_i,
        grade_7: school['grade_7'].to_i,
        grade_8: school['grade_8'].to_i,
        grade_9: school['grade_9'].to_i,
        grade_10: school['grade_10'].to_i,
        grade_11: school['grade_11'].to_i,
        grade_12: school['grade_12'].to_i
    })

end

puts 'done'

# School.create()