class Text
	attr_accessor :text, :url, :h, :b, :i, :time

	def initialize content
		@text = content
		@url = ""
		@h = nil
		@b = false
		@i = false
		@time = 1
	end

	def write
		temp = ""
		temp2 = ""
		@time = @time.to_i
		@time.times do
			 if @h
				temp2 = "<font size='#{@h}'>#{@text}</font>"
			else
				temp2 = "#{@text}"
			end
			temp2 = "<b>#{temp2}</b>" if @b
			temp2 = "<i>#{temp2}</i>" if @i
			temp2 = "<a href='#{@url}'>#{temp2}</a>" if @url != ""
			temp = temp + "\n" + temp2
		end
		temp
	end
end