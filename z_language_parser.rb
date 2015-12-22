#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.14
# from Racc grammer file "".
#

require 'racc/parser.rb'

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
require "./lib/object.rb"

class ZLanguageParser < Racc::Parser

module_eval(<<'...end z_language_parser.y/module_eval...', 'z_language_parser.y', 102)
  def parse str, filename
  	@html = HTMLCreator.new(filename)
    @temp = nil
    @table = []
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

...end z_language_parser.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
     7,    30,    84,    15,    16,     7,    30,     9,    10,    11,
    85,    12,     9,    10,    11,    19,    12,    20,    15,    16,
    13,    15,    16,    15,    16,    13,    15,    16,     9,    10,
    11,    87,    12,     9,    10,    11,    17,    12,    22,    88,
    23,    13,    15,    16,    15,    16,    13,    15,    16,    38,
    39,    40,    41,    42,    43,    44,    45,    38,    39,    40,
    41,    42,    43,    44,    45,    13,    15,    16,    13,    15,
    16,    13,    15,    16,    13,    15,    16,    13,    15,    16,
    13,    15,    16,    15,    16,    24,    25,    26,    27,    28,
    34,    47,    47,    47,    50,    52,    53,    55,    56,    57,
    58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
    69,    47,    75,    76,    47,    47,    47,    47,    86,    89,
    90,    91,    92,    93,    20,    47,    99,   100,   101,   102,
    47,   104 ]

racc_action_check = [
     0,    19,    72,    56,    56,     3,    90,     0,     0,     0,
    72,     0,     3,     3,     3,     6,     3,     6,    19,    19,
     0,     0,     0,    90,    90,     3,     3,     3,    69,    69,
    69,    74,    69,    82,    82,    82,     1,    82,     8,    74,
     9,    69,    69,    69,    58,    58,    82,    82,    82,    22,
    22,    22,    22,    22,    22,    22,    22,    55,    55,    55,
    55,    55,    55,    55,    55,     7,     7,     7,    20,    20,
    20,    30,    30,    30,    34,    34,    34,    53,    53,    53,
    85,    85,    85,    88,    88,    10,    11,    12,    16,    17,
    21,    23,    24,    25,    26,    32,    33,    37,    38,    39,
    40,    41,    42,    43,    44,    45,    46,    48,    49,    51,
    54,    57,    59,    60,    61,    62,    63,    66,    73,    77,
    78,    79,    80,    81,    83,    89,    95,    96,    97,    98,
   101,   103 ]

racc_action_pointer = [
    -3,    36,   nil,     2,   nil,   nil,    13,    42,    29,    36,
    81,    82,    83,   nil,   nil,   nil,    64,    89,   nil,    -6,
    45,    86,    34,    68,    69,    70,    89,   nil,   nil,   nil,
    48,   nil,    90,    83,    51,   nil,   nil,    88,    94,    95,
    96,    97,    98,    99,   100,   101,   101,   nil,   102,    95,
   nil,   101,   nil,    54,   105,    42,   -21,    88,    20,   107,
   108,    91,    92,    93,   nil,   nil,    94,   nil,   nil,    18,
   nil,   nil,    -3,   113,    26,   nil,   nil,   106,   107,   116,
   117,   117,    23,   120,   nil,    57,   nil,   nil,    59,   102,
    -1,   nil,   nil,   nil,   nil,   121,   122,   115,   124,   nil,
   nil,   107,   nil,   126,   nil ]

racc_action_default = [
    -2,   -42,    -1,    -3,    -5,    -6,   -42,   -42,   -13,   -42,
   -42,   -42,   -42,   -38,   -39,   -40,   -42,   -42,    -4,   -42,
   -34,   -42,   -42,   -42,   -42,   -42,   -42,   -41,   105,    -7,
   -34,   -10,   -42,   -36,   -34,   -14,   -15,   -21,   -42,   -42,
   -42,   -42,   -42,   -42,   -42,   -42,   -42,   -37,   -42,   -42,
   -19,   -42,   -20,   -34,   -42,   -42,   -42,   -42,   -42,   -42,
   -42,   -42,   -42,   -42,   -16,   -17,   -42,    -9,   -35,   -42,
   -22,   -23,   -42,   -42,   -42,   -28,   -29,   -42,   -42,   -42,
   -42,   -42,   -11,   -42,   -24,   -42,   -26,   -27,   -42,   -42,
   -42,   -33,   -18,    -8,   -12,   -42,   -42,   -42,   -42,   -25,
   -30,   -42,   -32,   -42,   -31 ]

racc_goto_table = [
     6,    29,    31,     6,    32,    35,    82,    21,    46,    48,
    49,    36,    81,     2,    51,     1,    18,   nil,    54,    82,
   nil,   nil,   nil,   nil,   nil,    94,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    68,    70,    72,
   nil,    74,    73,   nil,    71,   nil,    77,    78,    79,   nil,
   nil,    80,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    83,
   nil,    96,    98,    31,    97,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    83,   nil,   nil,    95,   103 ]

racc_goto_check = [
     6,     7,    10,     6,     8,    12,     5,     6,    14,    14,
    14,    13,     9,     2,     8,     1,     2,   nil,     8,     5,
   nil,   nil,   nil,   nil,   nil,     9,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     8,    12,    10,
   nil,    10,    14,   nil,    13,   nil,    14,    14,    14,   nil,
   nil,    14,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     6,
   nil,    10,     7,    10,    14,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,     6,   nil,   nil,     6,    14 ]

racc_goto_pointer = [
   nil,    15,    13,   nil,   nil,   -63,     0,   -18,   -16,   -57,
   -17,   nil,   -17,   -11,   -15,   nil ]

racc_goto_default = [
   nil,   nil,   nil,     3,     4,     5,    33,   nil,   nil,   nil,
    14,     8,   nil,   nil,   nil,    37 ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 27, :_reduce_1,
  0, 27, :_reduce_2,
  1, 28, :_reduce_none,
  2, 28, :_reduce_none,
  1, 29, :_reduce_none,
  1, 29, :_reduce_6,
  3, 30, :_reduce_7,
  7, 30, :_reduce_8,
  3, 33, :_reduce_9,
  1, 33, :_reduce_10,
  1, 35, :_reduce_11,
  2, 35, :_reduce_12,
  1, 31, :_reduce_13,
  3, 31, :_reduce_14,
  3, 31, :_reduce_15,
  4, 37, :_reduce_16,
  4, 37, :_reduce_17,
  6, 37, :_reduce_18,
  3, 37, :_reduce_19,
  4, 37, :_reduce_20,
  1, 39, :_reduce_none,
  3, 39, :_reduce_none,
  3, 39, :_reduce_none,
  4, 38, :_reduce_24,
  6, 38, :_reduce_none,
  4, 41, :_reduce_26,
  4, 41, :_reduce_27,
  3, 41, :_reduce_28,
  3, 41, :_reduce_29,
  6, 41, :_reduce_30,
  8, 41, :_reduce_31,
  6, 41, :_reduce_32,
  4, 41, :_reduce_33,
  0, 34, :_reduce_none,
  3, 34, :_reduce_35,
  1, 34, :_reduce_36,
  1, 40, :_reduce_37,
  1, 32, :_reduce_38,
  1, 32, :_reduce_39,
  1, 36, :_reduce_40,
  2, 36, :_reduce_41 ]

racc_reduce_n = 42

racc_shift_n = 105

racc_token_table = {
  false => 0,
  :error => 1,
  "=" => 2,
  "def" => 3,
  :L_PARE => 4,
  :R_PARE => 5,
  "end" => 6,
  :L_ARR => 7,
  :R_ARR => 8,
  :POINT => 9,
  "text" => 10,
  "img" => 11,
  "form" => 12,
  :PRI => 13,
  "newline" => 14,
  "times" => 15,
  "url" => 16,
  "size" => 17,
  "bold" => 18,
  "italic" => 19,
  "input" => 20,
  "select" => 21,
  "submit" => 22,
  :STRING => 23,
  :NUMBER => 24,
  :NEGATIVE => 25 }

racc_nt_base = 26

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "\"=\"",
  "\"def\"",
  "L_PARE",
  "R_PARE",
  "\"end\"",
  "L_ARR",
  "R_ARR",
  "POINT",
  "\"text\"",
  "\"img\"",
  "\"form\"",
  "PRI",
  "\"newline\"",
  "\"times\"",
  "\"url\"",
  "\"size\"",
  "\"bold\"",
  "\"italic\"",
  "\"input\"",
  "\"select\"",
  "\"submit\"",
  "STRING",
  "NUMBER",
  "NEGATIVE",
  "$start",
  "start",
  "methods",
  "method",
  "define",
  "html",
  "name",
  "variable",
  "array",
  "htmls",
  "number",
  "first",
  "last",
  "attributes",
  "string",
  "attribute" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'z_language_parser.y', 4)
  def _reduce_1(val, _values, result)
    @html.finalize
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 5)
  def _reduce_2(val, _values, result)
    @html.finalize
    result
  end
.,.,

# reduce 3 omitted

# reduce 4 omitted

# reduce 5 omitted

module_eval(<<'.,.,', 'z_language_parser.y', 12)
  def _reduce_6(val, _values, result)
     @html.write @temp 
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 14)
  def _reduce_7(val, _values, result)
     @html.putVar(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 15)
  def _reduce_8(val, _values, result)
    @html.putFuncVar(val[1], (Function.new val[1], val[3], @table))
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 17)
  def _reduce_9(val, _values, result)
    result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 18)
  def _reduce_10(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 20)
  def _reduce_11(val, _values, result)
     @table << val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 21)
  def _reduce_12(val, _values, result)
    @table << val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 23)
  def _reduce_13(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 24)
  def _reduce_14(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 25)
  def _reduce_15(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 29)
  def _reduce_16(val, _values, result)
      		@temp = Text.new val[2]
  		result = @temp
  	
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 34)
  def _reduce_17(val, _values, result)
                		@temp = Img.new val[2]
  		result = @temp
            
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 39)
  def _reduce_18(val, _values, result)
                		@temp = Form.new val[2], val[4]
  		result = @temp
            	
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 44)
  def _reduce_19(val, _values, result)
                		@temp = NewLine.new
            		result = @temp
            	
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 49)
  def _reduce_20(val, _values, result)
                		@temp = @html.callFunc val[0], val[2]
            		result = @temp
            
    result
  end
.,.,

# reduce 21 omitted

# reduce 22 omitted

# reduce 23 omitted

module_eval(<<'.,.,', 'z_language_parser.y', 57)
  def _reduce_24(val, _values, result)
    @temp.time = val[2]
    result
  end
.,.,

# reduce 25 omitted

module_eval(<<'.,.,', 'z_language_parser.y', 60)
  def _reduce_26(val, _values, result)
    @temp.url = val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 61)
  def _reduce_27(val, _values, result)
    @temp.h = val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 62)
  def _reduce_28(val, _values, result)
    @temp.b = true
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 63)
  def _reduce_29(val, _values, result)
    @temp.i = true
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 66)
  def _reduce_30(val, _values, result)
                   	@temp.w = val[2]
               	@temp.h = val[4] 
               
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 69)
  def _reduce_31(val, _values, result)
    @temp.addInput val[2], val[4], val[6]
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 70)
  def _reduce_32(val, _values, result)
    @temp.addSelect val[2], val[4]
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 71)
  def _reduce_33(val, _values, result)
    @temp.addSubmit val[2]
    result
  end
.,.,

# reduce 34 omitted

module_eval(<<'.,.,', 'z_language_parser.y', 74)
  def _reduce_35(val, _values, result)
     result = [val[0]] + val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 75)
  def _reduce_36(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 77)
  def _reduce_37(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 79)
  def _reduce_38(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 80)
  def _reduce_39(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 82)
  def _reduce_40(val, _values, result)
     result = val[0].to_i 
    result
  end
.,.,

module_eval(<<'.,.,', 'z_language_parser.y', 83)
  def _reduce_41(val, _values, result)
     result = -(val[1].to_i) 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class ZLanguageParser

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
