class HTMLCreator
	def initialize(filename)
		@varstack = Hash.new
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

	def write obj
		@file.puts obj.write
	end

	def newlineWrite
		@file.puts '<br>'
	end
end
