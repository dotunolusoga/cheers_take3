
require 'date'

class Cheer

  AN_LETTERS = "AEFHILMNORSX"

  def self.for_birthday(birthday)
    birthday_string = ""
    today = Date.today.yday
    next_birthday = Date.parse(birthday).yday
    difference = next_birthday - today
    if difference > 1
      birthday_string << "Awesome! Your birthday is in #{difference} days! Happy Birthday in advance!"
    elsif difference == 1
      birthday_string << "Awesome! Your birthday is in #{difference} day! Happy Birthday in advance!"
    elsif difference == 0
      birthday_string << "Awesome! Your birthday is in today! Happy Birthday!"
    else
      new_birthday = 365 - difference
      birthday_string << "Awesome! Your birthday is in #{difference} days! Happy Birthday in advance!"
    end
    birthday_string
  end

  def self.for_person(name)
    name.chomp!
    name_case = name.upcase.gsub(/[^A-Z]/, "")
    raise ArgumentError if name_case.empty?
    cheer_string = ""
    name_case.each_char do |letter|
      article = AN_LETTERS.include?(letter) ? "an.." : "a..."
      cheer_string << "Give me #{article} #{letter}!\n"
      end
    cheer_string + "#{name}'s just GRAND!"
  end

  def self.valid_name?(name)
    name_case = name.upcase.gsub(/[^A-Z]/, "")
    !name_case.empty
  end

end
