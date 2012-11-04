class PagesController < ApplicationController
  respond_to :html, :xml, :json
  def number
    begin
      @number = Integer(params[:id])

      respond_with @number

    rescue
      render(:file => File.join(Rails.root, 'public/sad-panda.html'), :status => 690, :layout => false)

    end

  end

  def index
    @random = Array.new
    10.times do |rand|
      @random << rand(5 ** 5)
    end
  end



end
