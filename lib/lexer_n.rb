
class Lexer
  require 'strscan'

  def initialize
    @ignores = []
    @rules = []
    @keywords = []
  end

  def add_ignore pattern
    @ignores << [pattern, :SKIP]
  end

  def add_token pattern, token
    @rules << [pattern, token]
  end

  def add_keyword keyword
    @keywords << [Regexp.new(keyword), keyword]
  end

  def start str
    @base = StringScanner.new str + " "
  end

  def next_token
    return [false, nil] if @base.empty?
    token = get_token
    return (token[0] == :SKIP) ? next_token : token
  end

  def get_token
    @ignores.each do |key, value|
      ignore = @base.scan(key)
      return [value, ignore] if ignore
    end

    # match = @base.scan_until(/\s+/)
    # match.rstrip!

    @keywords.each do |key, value|
      match = @base.scan key
      return [value, :KEYWORD] if match
    end

    @rules.each do |key, value|
      match = @base.scan key
      return [value, match] if match
    end
    raise "\nunexpected characters  <#{@base.peek(5)}>"
  end
end