class Text
	attr_accessor :text, :url, :h, :b, :i

	def initialize content
		@text = content
		@url = ""
		@h = nil
		@b = false
		@i = false
	end

	def write
		temp = "<font size='#{@h}'>#{@text}</font>" if @h
		temp = "<b>#{temp}</b>" if @b
		temp = "<i>#{temp}</i>" if @i
		temp = "<a href='#{@url}'>#{temp}</a>" if @url != ""
	end
end