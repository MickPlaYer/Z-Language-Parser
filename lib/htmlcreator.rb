require './lib/img.rb'

class HTMLCreator
	def initialize(filename)
		@varstack = Hash.new
		@type = 0
		@temp = nil
		@file = File.open(filename + '.html', 'w')
		@file.puts '<!DOCTYPE html>'
		@file.puts '<html>'
		@file.puts '<head>'
		@file.puts '<title>' + filename + '</title>'
		@file.puts '</head>'
		@file.puts '<body>'
	end

	def finalize
		@file.puts '</body>'
		@file.puts '</html>'
		@file.close
	end

	def putVar key, value
		@varstack[key] = value
		puts @varstack.to_s
	end

	def putFuncVar key, attri, value

	end

	def write
		@file.puts @temp.write if @temp
		@temp = nil
		@type = 0
	end

	def a url
		if @type == 1
			@temp.url = url
		end
	end

	def img url
		@temp = Img.new url
		@type = 1
	end

	def size w, h
		if @type == 1
			@temp.w = w
			@temp.h = h
		end
	end
end