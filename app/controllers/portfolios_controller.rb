class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item was added!' }
      else
        format.html { render :new }
      end
    end
  end
end
  # private
    # def portfolio_params
    #   params.require(:portfolio).permit(:title, :subtitle, :body)
    # end
  # end