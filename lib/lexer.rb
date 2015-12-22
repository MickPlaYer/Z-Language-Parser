
class Lexer
  require 'strscan'

  def initialize 
    @rules = []
    @keyword = []
  end

  def add_ignore pattern
    @rules << [pattern, :SKIP]
  end

  def add_token pattern, token
    @rules << [pattern, token]
  end

  def add_keyword aString
    @keyword << [Regexp.new("(" + aString + ")[\(]"), aString]
  end
  
  def add_keyword_space aString
    @keyword << [Regexp.new("(" + aString + ")[\s\n]", Regexp::MULTILINE), aString]
  end

  def start aString
    @base = StringScanner.new aString
  end

  def next_token
    return [false, false] if @base.empty?
    t = get_token
    return (:SKIP == t[0]) ? next_token : t
  end

  def get_token
	@keyword.each do |key, value|
      m = @base.scan(key)
      if m
		@base.pos = @base.pos - 1
		m = m[0 .. -2]
		return [value, m]
      end
	end
	
    @rules.each do |key, value|
      m = @base.scan(key)
      return [value, m] if m
    end 
    raise  "unexpected characters  <#{@base.peek(5)}>"
  end  
end
