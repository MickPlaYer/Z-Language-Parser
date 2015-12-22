class HTMLCreator
	def initialize(filename)
		@varstack = Hash.new
		@funcstack = Hash.new
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
		@varstack[key.to_s.gsub(/\s+/, "")] = value
		#puts @varstack.to_s
	end

	def putFuncVar key, value
		@funcstack[key] = value
		#puts @funcstack.to_s
	end

	def callFunc key, values
		@funcstack[key].makeObj values
	end

	def write obj
		@file.puts (obj.write @varstack)
	end
end
