require 'sinatra'
require 'json'
require 'prawn'

helpers do
  def respond_with_number
    @number = Integer(params[:number])

    yield
  rescue
    status 690

    File.read('public/sad-panda.html')
  end
end

get '/' do
  @random_numbers = (1 .. 10).map { rand(5 ** 5) }

  erb :index
end

get '/:number.json' do
  respond_with_number { {:number => @number}.to_json }
end

get '/:number.xml' do
  respond_with_number { "<number>#{@number}</number>" }
end

get '/:number.pdf' do
  content_type :pdf
  respond_with_number do
    pdf = Prawn::Document.new
    pdf.text(@number.to_s)
    pdf.render
  end
end

get '/:number' do
  respond_with_number { erb :number }
end
