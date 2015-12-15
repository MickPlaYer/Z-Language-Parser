
class ZLanguageParser
  rule

  start:      methods
            | /* none */

  methods:    method
            | method methods

  method:     define { puts '>>>>>>>define' }
            | html { puts '>>>>>>>html' }

  define:     name '=' variable /*{ @table[val[0]] = val[2] }*/
            | 'def' name L_PARE array R_PARE htmls 'end'

  variable:   '[' array ']'
            | number

  htmls:      html
            | html htmls

  html:       first
            | first POINT last
            | first POINT attributes

  first:      'text' L_PARE string R_PARE
            | 'img' L_PARE string R_PARE
            | 'form' L_PARE string ',' string R_PARE
            | 'newline' L_PARE R_PARE
            | name L_PARE array R_PARE

  attributes: attribute
            | attribute POINT last
            | attribute POINT attributes

  last:       'times' L_PARE number R_PARE
            | 'times' L_PARE number ',' name R_PARE

  attribute:  'url' L_PARE string R_PARE
            | 'size' L_PARE number R_PARE
            | 'bold' L_PARE R_PARE
            | 'italic' L_PARE R_PARE
            | 'size' L_PARE number ',' number R_PARE
            | 'input' L_PARE string ',' string ',' string R_PARE
            | 'select' L_PARE string ',' array R_PARE
            | 'submit' L_PARE string R_PARE

  array:      /* none */
            | name
            | array ',' name

  string:     STRING

  name:       STRING

  number:     NUMBER { result = val[0].to_i }
            | NEGATIVE NUMBER { result = -(val[1].to_i) }

end

---- header
require "./lib/lexer.rb"
require "./lib/keywords.rb"

---- inner
  def parse str
    @table = Hash.new
    @lexer = make_lexer str
    do_parse
  end

  def next_token
    last = @lexer.next_token
    puts last[0].to_s + ":\t" + last[1].to_s 
    last
  end

  def make_lexer str
    lexer = Lexer.new

    lexer.add_ignore(/\s+/)
    # lexer.add_ignore(/#[^\n]+/)

    keywords.each do |kw|
      lexer.add_keyword kw
    end

    lexer.add_token(/-/, :NEGATIVE)
    lexer.add_token(/\(/, :L_PARE)
    lexer.add_token(/\)/, :R_PARE)
    lexer.add_token(/\./, :POINT)
    lexer.add_token(/\d+/, :NUMBER)
    lexer.add_token(/[^\(^\)^\n^=]+/, :STRING)

    lexer.start str
    return lexer
  end

---- footer
# Run under code if execute by cmd > Ruby "this file"
if $0 == __FILE__
  parser = ZLanguageParser.new
  # Get data for parse from file.
  file_path = ARGV[0] || "sample/example.txt"
  file = File.open(file_path, "rb")
  contents = file.read
  file.close
  # Show what to parse.
  puts "Parsing:\n" + contents.to_s
  puts
  puts 'Result:'
  # Do parse.
  # begin
    parser.parse(contents)
  # rescue
  #   puts $!
  # end
end