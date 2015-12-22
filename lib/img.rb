class Img
	attr_accessor :src, :url, :w, :h

	def initialize src
		@src = src
		@url = ""
		@w = nil
		@h = nil
	end

	def write
		temp = "<img src='#{@src}' width='#{@w}' height='#{@h}'>"
		temp = "<a href='#{@url}'>#{temp}</a>" if @url != ""
	end
end