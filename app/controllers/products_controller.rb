class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  protect_from_forgery only: [:create]

  def index
    @products = Product.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @products }
    end
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @product }
      format.js
    end
  end

  def new
    @product = Product.new
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product }
        format.js   { render status: :ok }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.js   { render status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
        format.js   { render status: :ok  }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.js   { render status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'The product was deleted successfully' }
      format.js { render status: :ok, layout: false }
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :units_in_stock, :units_on_order, :discount , :price, :reorder_level)
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
