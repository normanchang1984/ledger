class MainController < ApplicationController

  def index
    @portfolios= Portfolio.all
    @portfolio=Portfolio.new

  end

  def new
    @portfolio=Portfolio.new
  end

  def edit
    #Rails.logger.debug("-------------------------id2----")
    #Rails.logger.debug(params[:id])
    @portfolio=Portfolio.find(params[:id])
    #@portfolio=Portfolio.find(params[:id])
    #Rails.logger.debug("-------------------------id----")
    #Rails.logger.debug(@portfolio.inspect)
  end

  def update
    @portfolio=Portfolio.find(params[:id])
    @portfolio.update(portfolio_params)
    @portfolio.save
    redirect_to stocks_path
  end

  def create
    @portfolio=Portfolio.new( portfolio_params )
    if @portfolio.save
      flash[:notice] = "新增成功"
      redirect_to stocks_path #tell HTTP code:303
    else
      render :action => :new #new.html.erb
    end
  end

  def show
    @portfolio=Portfolio.find(params[:id])
  end

  def destroy
    @portfolio=Portfolio.find(params[:id])
    @portfolio.destroy
    flash[:alert] = "刪除成功"
    redirect_to stocks_path
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:name, :orgprice, :shares, :curprice, :profit)
  end

end
