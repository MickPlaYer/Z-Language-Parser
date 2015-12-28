class Text
	attr_accessor :text, :url, :h, :b, :i, :time, :time_attr

	def initialize content
		@text = content
		@url = ""
		@h = nil
		@b = false
		@i = false
		@time = 1
		@time_attr = nil
	end

	def write var
		temp = ""
		temp2 = ""
		@time = @time.to_i
		@time.times do |i|
			 if @h
				temp2 = "<font style=\"font-size:#{@h}px\">#{@text}</font>"
			else
				temp2 = "#{@text}"
			end
			temp2 = "<b>#{temp2}</b>" if @b
			temp2 = "<i>#{temp2}</i>" if @i
			temp2 = "<a href='#{@url}'>#{temp2}</a>" if @url != ""
			temp2.gsub! "\#\{#{@time_attr.to_s}\}", i.to_s if @time_attr
			temp = temp + "\n" + temp2
		end
		var.each do |k, v|
			temp.gsub! "\#\{#{k}\}", v.to_s
		end
		temp
	end
end