require 'pry'

def holiday_supplies_hash 
  {
    :winter => {
      :christmas => ['Lights', 'Wreath'],
      :new_years => ['Party Hats']
    },
    :summer => {
      :fourth_of_july => ['Fireworks', 'BBQ']
    },
    :fall => {
      :thanksgiving => ['Turkey']
    },
    :spring => {
      :memorial_day => ['BBQ']
    }
  }
end

def second_supply_for_fourth_of_july(supplies)
  supplies.dig(:summer, :fourth_of_july) << 'Watermelon'
  supplies.dig(:summer, :fourth_of_july).rotate!.first
end

def add_supply_to_winter_holidays(supplies, type)
  supplies.dig(:winter, :christmas) << type
  supplies.dig(:winter, :new_years) << type
end

def add_supply_to_memorial_day(supplies, type)
  supplies.dig(:spring, :memorial_day).clear << type
end

# add_new_holiday_with_supplies(holiday_supplies, :winter, :valentines_day, valentines_day_supplies)
def add_new_holiday_with_supplies(hash, season, holiday_name, supply_array)
  hash.update({
    season => {
      holiday_name => supply_array
    }
  }).rehash
end

def all_winter_holiday_supplies(hash)
  # return an array of all of the supplies that are used in the winter season
  hash[:winter].values.flatten
end

def all_supplies_in_holidays(hash)
  hash.each do |hkey, hvalue|
    puts "#{hkey.capitalize}:"
    hash[hkey].each do |k, vk|
      puts "  #{k.to_s.split(/ |\_/).map(&:capitalize).join(' ')}: #{vk.join(', ')}"
    end
  end
end

# hkey = winter/summer/fall/spring
# hvalue = christmas => [] / fourth_of_july => []
def all_holidays_with_bbq(hash)
  arr = []
  hash.each do |hkey, hval|
    hash[hkey].map { |mk| arr << mk.first if hash[hkey][mk.first].index('BBQ') }
    #hash[hkey].each { |mk|
    #  if hash[hkey][mk[0]].index('BBQ')
    #    arr << mk[0]
    #  end
    #}
  end
  arr
end


supplies = holiday_supplies_hash
columbus_day_supplies = ["Flags", "Parade Floats", "Italian Food"]
valentines_day_supplies = ["Cupid Cut-Out", "Candy Hearts"]

second_supply_for_fourth_of_july(supplies)
add_supply_to_winter_holidays(supplies, 'Balloons')
add_supply_to_memorial_day(supplies, 'Grill')
add_supply_to_memorial_day(supplies, 'Table Cloth')
add_new_holiday_with_supplies(supplies, :fall, :columbus_day, columbus_day_supplies)
add_new_holiday_with_supplies(supplies, :winter, :valentines_day, valentines_day_supplies)
all_winter_holiday_supplies(supplies)
all_supplies_in_holidays(supplies)
all_holidays_with_bbq(supplies)



