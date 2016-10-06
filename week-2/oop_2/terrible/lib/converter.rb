require 'json'

class Converter
  def initialize(string)
    @string = string
  end

  def convert(type)
    if type == :text
      @string
    elsif type == :html
      "<html><head></head><body>#{ @string }</body></html>"
    elsif type == :json
      { response: @string }.to_json
    elsif type == :xml
      "<response>#{ @string }</response>"
    else
      raise "Unrecognised type"
    end
  end

  def shouty_convert(type)
    @string = @string.upcase
    convert(type)
  end

  def convert_location
    string = ''
    @string.length.times {string += "*"}
    string
  end
end
