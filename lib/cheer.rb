
class Cheer

  AN_LETTERS = "AEFHILMNORSX"

  def self.for_birthday(birthday)
    today = Date.today
    next_birthday = BirthdayParser.parse(birthday)
    difference = next_birthday - today
    case difference
    when 0
      "Happy birthday!"
    when 1
      #Use the singular
      "Awesome! Your birthday is in 1 day! Happy birthday in advance!"
    else
      #Use the plural
      "Awesome! Your birthday is in 1 days! Happy birthday in advance!"
    end
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
