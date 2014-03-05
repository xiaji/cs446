#!/usr/bin/ruby

require 'rack'
require 'csv'
require 'english'

class Book <
        Struct.new(:rank, :title, :author, :language, :year, :copies)
    
end

class SimpleApp
	def initialize()
    # can set up variables that will be needed later
		@time = Time.now
	end

	def call(env)
    # create request and response objects
		request = Rack::Request.new(env)
		response = Rack::Response.new
    # include the header
		File.open("header.html", "r") { |head| response.write(head.read) }
		case env["PATH_INFO"]
      when /.*?\.css/
        # serve up a css file
        # remove leading /
        file = env["PATH_INFO"][1..-1]
        return [200, {"Content-Type" => "text/css"}, [File.open(file, "rb").read]]
      when /\/form.*/
        # serve up the form
        render_form(request, response)
      when /\/list.*/
        # serve up a list response
        render_list(request, response)
      else
        [404, {"Content-Type" => "text/plain"}, ["Error 404!"]]
      end	# end case

      response.finish
    end

  # try http://localhost:8080/form
	def render_form(req, response)
        csv_fname = 'books.csv'
        response.write("<h2>Sorted by Rank</h2>\n")
        response.write("<div id = 'Booklist'>")
		response.write("<table title='Sorted by Rank'>\n")
        response.write("<tr><th>Rank</th><th>Title</th><th>Author</th><th>Language</th><th>Year</th><th>Copies</th><tr>\n")
        CSV.foreach(csv_fname) do |row|
            response.write("<tr><th>#{$INPUT_LINE_NUMBER}</th><th>#{row[0]}</th><th>#{row[1]}</th><th>#{row[2]}</th><th>#{row[3]}</th><th>#{row[4]}</th><tr>\n")
        end
        response.write("</table>\n</div>\n")
        response.write("<div id = 'footer'>Copyright &copy; Wenjun Ji</div>\n")
	end

  # try http://localhost:8080/list
	def render_list(req, response)
        csv_fname = 'book.csv'
        response.write("<div id = checklist>")
        response.write("<select>\n
    <option class='head'>Select Action</option>\n
  <option value='Rank'>Rank</option>\n
  <option value='Title'>Title</option>\n
  <option value='Author'>Author</option>\n
  <option value='Language'>Language</option>\n
    <option value='Year'>Year</option>\n
<option value='Copies'>Copies</option>\n
</select>\n")
        response.write("<button type='button'>Display List</button>\n")
        response.write("</div>\n")
        response.write("<h2>Sorted by Author</h2>\n")
        response.write("<div id = Booklist>\n")
        response.write("<table>\n")
        response.write("<tr><th>Rank</th><th>Title</th><th>Author</th><th>Language</th><th>Year</th><th>Copies</th><tr>\n")
        books = Array.new
        CSV.foreach(csv_fname, converters: :numeric) do |row|
            p = Book.new
            p.rank = row[0]
            p.title = row[1]
            p.author = row[2]
            p.language = row[3]
            p.year = row[4]
            p.copies = row[5]
            books.push(p)
        end
        books = books.sort_by { |a| [ a.author] }
        books.each do |p|
            response.write("<tr><th>#{p.rank}</th><th>#{p.title}</th><th>#{p.author}</th><th>#{p.language}</th><th>#{p.year}</th><th>#{p.copies}</th><tr>\n") 
        end
        response.write("</table>\n</div>\n")
        response.write("<div id = 'footer'>Copyright &copy; Wenjun Ji</div>\n")
	end
end


Signal.trap('INT') {
	Rack::Handler::WEBrick.shutdown
}


Rack::Handler::WEBrick.run SimpleApp.new, :Port => 8080
