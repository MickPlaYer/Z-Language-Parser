
class ZLanguageParser
  rule

  start:      methods {@html.finalize}
            | /* none */ {@html.finalize}


  methods:    method
            | method methods

  method:     define { puts '>>>>>>>define' }
            | html { @html.write @temp }

  define:     name '=' variable { @html.putVar(val[0], val[2]) }
            | 'def' name L_PARE array R_PARE htmls 'end'

  variable:   L_ARR array R_ARR {result = val[1]}
            | number {result = val[0]}

  htmls:      html
            | html htmls

  html:       first
            | first POINT last
            | first POINT attributes

  first:      'text' L_PARE string R_PARE {@temp = Text.new val[2]}
            | 'img' L_PARE string R_PARE { @temp = Img.new val[2] }
            | 'form' L_PARE string PRI string R_PARE
            | 'newline' L_PARE R_PARE {@html.newlineWrite}
            | name L_PARE array R_PARE

  attributes: attribute
            | attribute POINT last
            | attribute POINT attributes

  last:       'times' L_PARE number R_PARE {@temp.time = val[2]}
            | 'times' L_PARE number PRI name R_PARE

  attribute:  'url' L_PARE string R_PARE {@temp.url = val[2]}
            | 'size' L_PARE number R_PARE {@temp.h = val[2]}
            | 'bold' L_PARE R_PARE {@temp.b = true}
            | 'italic' L_PARE R_PARE {@temp.i = true}
            | 'size' L_PARE number PRI number R_PARE 
               { 
               	@temp.w = val[2]
               	@temp.h = val[4] 
               }
            | 'input' L_PARE string PRI string PRI string R_PARE
            | 'select' L_PARE string PRI array R_PARE
            | 'submit' L_PARE string R_PARE

  array:      /* none */
            | name PRI array { result = [val[0]] + val[2] }
            | name { result = [val[0]] }

  string:     STRING { result = val[0] }

  name:       STRING { result = val[0] }
  			| number { result = val[0] }

  number:     NUMBER { result = val[0].to_i }
            | NEGATIVE NUMBER { result = -(val[1].to_i) }

end

---- header
require "./lib/lexer.rb"
require "./lib/keywords.rb"
require "./lib/htmlcreator.rb"
require "./lib/img.rb"
require "./lib/text.rb"

---- inner
  def parse str, filename
  	@html = HTMLCreator.new(filename)
    @temp = nil
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
    
    keywords_space.each do |kw|
      lexer.add_keyword_space kw
    end

    lexer.add_token(/-/, :NEGATIVE)
    lexer.add_token(/\(/, :L_PARE)
    lexer.add_token(/\)/, :R_PARE)
    lexer.add_token(/\[/, :L_ARR)
    lexer.add_token(/\]/, :R_ARR)
    lexer.add_token(/\./, :POINT)
    lexer.add_token(/\d+/, :NUMBER)
    lexer.add_token(/\,/, :PRI)
    lexer.add_token(/[^\(^\)^\n^=^\,^\]]+/, :STRING)

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
    parser.parse(contents.to_s, File.basename(file_path, ".*"))
  # rescue
  #   puts $!
  # end
end
