Z-language.readme

Z-lanugage is a language that can simply construct the HTML flie with simple syntax.

Here are the functions:

//OUTPUT TEXT
text(String _str) -> simply turn into text.
	.url(String _url) 
		-> generate a link with _url and make text to aref to it
	.size(int _size) 
		-> change the font-size with the following parameter
	.bold() 
		-> <b></b>

	<Example>
	INPUT>>
		text(This is a text with URL).url(example.com).size(20).bold()
	OUTPUT>>
		<b><font size="20"><a href="example.com">This is a text with URL</a></font></b>

//NEWLINE
newline() -> generate <br>

//FORM
form(action, method) -> generate a HTML Form
	.input(String _name, String _type, String _value) 
		-> <input name="_name" type="_type" value="_value">
	.select(String _name, Array _optionArray)
		-> <select name="_name"><option value="_optionArray[i]"></select>
	.submit(String _value)
		-> <input name="submit" type="submit" value="_value">
	
	<Example>
	INPUT>>
		form(luther.com, GET).input(test, text, test).select(opt, 2).submit(Go)
	OUTPUT>>
		<form action='luther.com' method='GET'>
			<input name='test' type='text' value='test' />
			<select name='opt'>
				<option value='2'>2</option>
			</select>
			<input name='submit' type='submit' value='Go' />
		</form>

//IMAGE
img(String _respitory)
	_respitory => the image source
	.url(String _url) 
		-> generate a link with _url and make IMAGE to aref to it
	.size(int _width, int _height) 
		-> change the image size with the following parameter _width & _height
	
	<Example>
	INPUT>>
		img(a.png).size(200, 100).url(http://luthertsai.com)
	OUTPUT>>
		<a href='http://luthertsai.com'><img src='a.png' width='200' height='100'></a>

.times(int _count) -> do the loop _count times
	It is the funciton tat can be called by any object, but it only can be called in the last.
	Ex. text(This is a text).size(5).bold().times(5)

.times(int _count, int i) -> do the loop _count times with counter i
