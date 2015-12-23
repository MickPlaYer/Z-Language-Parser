
class ZLanguageParser
  rule

  start:      methods {@html.finalize}
            | /* none */ {@html.finalize}


  methods:    method
            | method methods

  method:     define
            | html
            { 
              @html.write val[0]
              @temp = nil
            }

  define:     name '=' variable { @html.putVar(val[0], val[2]) }
            | 'def' name L_PARE array R_PARE htmls 'end' {@html.putFuncVar(val[1], (Function.new val[1], val[3], @table))}

  variable:   L_ARR array R_ARR {result = val[1]}
            | number {result = val[0]}

  htmls:      html { @table << val[0]}
            | html htmls {@table << val[0]}

  html:       first  {result = val[0]}
            | first POINT last {result = val[0]}
            | first POINT attributes {result = val[0]}

  first:      'text' L_PARE string R_PARE
            {
              @temp = Text.new val[2]
              result = @temp
            }
            | 'img' L_PARE string R_PARE 
            {
                @temp = Img.new val[2]
                result = @temp
            }
            | 'form' L_PARE string PRI string R_PARE
            {
                @temp = Form.new val[2], val[4]
                result = @temp
            }
            | 'newline' L_PARE R_PARE
            {
                @temp = NewLine.new
                result = @temp
            }
            | name L_PARE array R_PARE
            {
                @temp = @html.callFunc val[0], val[2]
                result = @temp
            }

  attributes: attribute
            | attribute POINT last
            | attribute POINT attributes

  last:       'times' L_PARE number R_PARE {@temp.time = val[2]}
            | 'times' L_PARE number PRI name R_PARE 
            {
                @temp.time = val[2]
                @temp.time_attr = val[4]
            }

  attribute:  'url' L_PARE string R_PARE {@temp.url = val[2]}
            | 'size' L_PARE number R_PARE {@temp.h = val[2]}
            | 'bold' L_PARE R_PARE {@temp.b = true}
            | 'italic' L_PARE R_PARE {@temp.i = true}
            | 'size' L_PARE number PRI number R_PARE 
            { 
                @temp.w = val[2]
                @temp.h = val[4] 
            }
            | 'input' L_PARE string PRI string PRI string R_PARE {@temp.addInput val[2], val[4], val[6]}
            | 'select' L_PARE string PRI array R_PARE {@temp.addSelect val[2], val[4]}
            | 'submit' L_PARE string R_PARE {@temp.addSubmit val[2]}

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
require "./lib/form.rb"
require "./lib/input.rb"
require "./lib/select.rb"
require "./lib/newline.rb"
require "./lib/function.rb"
require "./lib/obj.rb"

---- inner
  def parse str, filename
    @html = HTMLCreator.new(filename)
    @temp = nil
    @table = []
    @lexer = make_lexer str
    do_parse
  end

  def next_token
    last = @lexer.next_token
    #puts last[0].to_s + ":\t" + last[1].to_s 
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
  #puts "Parsing:\n" + contents.to_s
  #puts
  #puts 'Result:'
  # Do parse.
  begin
    parser.parse(contents.to_s, File.basename(file_path, ".*"))
    puts 'Interprete success!'
  rescue
     puts $!
  end
end
