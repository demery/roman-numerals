module RomanNumerals
  @base_digits = {
    1    => 'I',
    4    => 'IV',
    5    => 'V',
    9    => 'IX',
    10   => 'X',
    40   => 'XL',
    50   => 'L',
    90   => 'XC',
    100  => 'C',
    400  => 'CD',
    500  => 'D',
    900  => 'CM',
    1000 => 'M'
  }

  @medieval_digits = @base_digits.reject { |k,v| k == 4 }

  def self.to_medieval value
    build_roman @medieval_digits, value
  end

  def self.to_roman value
    build_roman @base_digits, value
  end

  def self.to_decimal value
    value = value.upcase
    result = 0
    @base_digits.values.reverse.each do |roman|
      while value.start_with? roman
        value = value.slice(roman.length, value.length)
        result += @base_digits.key roman
      end
    end
    result
  end

  private
  def self.build_roman digits, value
    result = ''
    digits.keys.reverse.each do |decimal|
      while value >= decimal
        value -= decimal
        result += digits[decimal]
      end
      result
    end
    result
  end
end