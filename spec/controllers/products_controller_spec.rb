require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  let(:valid){
    {
        name: 'Tree',
        units_in_stock: 200,
        units_on_order: 1,
        discount: 0.05,
        price: 20.0
    }
  }

  let(:invalid){
    {
        name: ' ',
        units_in_stock: '',
        units_on_order: '',
        discount: '',
        price: ''
    }
  }

  subject { response }

  describe "GET #index" do
    let!(:product){ FactoryGirl.create(:product) }
    describe "html" do
      before { get :index }

      it { should render_template :index }
      it { should have_http_status 200 }
      it "assigns [product] as @products" do
        expect(assigns(:products)).to eq [product]
      end
    end

    describe "json" do
      before { get :index, format: 'json' }

      it { should have_http_status 200 }
      it "returns products as json" do
        expect(response.body).to be_json_eql [product].to_json
      end
    end
  end

  describe "GET #show" do
    let!(:product){ FactoryGirl.create(:product) }

    describe "html" do
      before { get :show, { id: product.to_param } }

      it { should render_template :show }
      it { should have_http_status 200 }
      it "assigns a product as @product" do
        expect(assigns(:product)).to be_a(Product)
      end
    end

    describe "json" do
      before { get :show, { format: 'json', id: product.to_param } }

      it "returns a product as json" do
        expect(response.body).to be_json_eql product.to_json
      end
    end

    describe "ajax" do
      before { xhr :get, :show, { id: product.to_param } }
      it { should have_http_status :ok }
    end
  end

  describe "GET #new" do
    before { get :new }

    it { should have_http_status 200 }
    it { should render_template :new }
  end

  describe "POST #create" do
    context "with invalid information" do
      it "assigns a newly created but unsaved product as @product" do
        post :create, { product: invalid }
        expect(assigns(:product)).to be_a_new(Product)
      end

      it "re-renders the 'new' template" do
        post :create, { product: invalid}
        expect(response).to render_template :new
      end

      it "returns a json data with errors" do
        post :create, { format: 'json', product: invalid }
        expect(response.headers['Content-Type']).to include 'application/json'
        expect(response).to have_http_status 422
      end

      it "don't creates a new product with ajax" do
        expect {
          xhr :post, :create, { product: invalid }
        }.to_not change(Product, :count)
      end

      it "returns 422 status code" do
        xhr :post, :create, { product: invalid }
        expect(response).to have_http_status 422
      end
    end

    context "with valid information" do
      it "creates a new product" do
        expect {
          post :create, { product: valid }
        }.to change(Product, :count)
      end

      it "assigns a newly created product as @product" do
        post :create, { product: valid }
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end

      it "redirects to @product" do
        post :create, { product: valid }
        expect(response).to redirect_to Product.last
      end

      it "returns a newly created product as JSON format" do
        post :create, { format: 'json', product: valid }
        expect(response.headers['Content-Type']).to include 'application/json'
        expect(response.body).to be_json_eql(valid.to_json).excluding("id", "reorder_level")
      end

      it "creates a new product with ajax" do
        expect {
          xhr :post, :create, { product: valid }
        }.to change(Product, :count)
      end

      it "returns 200 status code" do
        xhr :post, :create, { product: valid }
        expect(response).to have_http_status 200
      end
    end
  end

  describe "GET #edit" do
    let!(:product){ FactoryGirl.create(:product) }
    before { get :edit, { id: product.to_param } }

    it { should have_http_status 200 }
    it { render_template :edit }
  end

  describe "PUT #update" do
    let!(:product){ FactoryGirl.create(:product) }

    describe "with invalid information" do
      let(:new_invalid_attrs){
        {
            name: ' ',
            units_in_stock: '',
            units_on_order: '',
            discount: '',
            price: ''
        }
      }
      before { put :update, { id: product.to_param, product: new_invalid_attrs } }

      it { should render_template :edit }

      it "returns 422 status code with ajax" do
        xhr :put, :update, { id: product.to_param, product: invalid }
        expect(response).to have_http_status 422
      end
    end

    describe "with valid information" do
      let(:new_valid_attrs){
        {
            name: 'Tree',
            units_in_stock: 400,
            units_on_order: 2,
            discount: 0.01,
            price: 19.99
        }
      }
      before { put :update, { id: product.to_param, product: new_valid_attrs } }

      it { should redirect_to product }

      it "returns 200 status code with ajax" do
        xhr :put, :update, { id: product.to_param, product: valid }
        expect(response).to have_http_status 200
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:product){ FactoryGirl.create(:product) }
    it "it destroys a product" do
      expect{
        delete :destroy, { id: product.to_param }
      }.to change(Product, :count)
    end

    it "redirects to products_path" do
      delete :destroy, { id: product.to_param }
      expect(response).to redirect_to products_path
    end

    it "destroys a product with ajax" do
      expect {
        xhr :delete, :destroy, { id: product.to_param  }
      }.to change(Product, :count)
    end

    it "returns 200 status" do
      xhr :delete, :destroy, { id: product.to_param  }
      expect(response).to have_http_status 200
    end
  end
end
