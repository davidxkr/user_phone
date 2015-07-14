require 'rails_helper'

describe UsersController do
  
  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end

    context 'with params[:q]' do
      it "populates an array of all users" do
        user = create(:user, name: 'David')
        create(:user, name: 'alex')
        get :index, q: {name_cont: 'david'}
        expect(assigns(:users)).to match_array([user])
      end
    end

    context 'without params[:q]' do
      it "populates an array of all users" do
        user = create(:user)
        user2 = create(:user)
        get :index
        expect(assigns(:users)).to match_array([user, user2])
      end
    end
  end

  describe 'GET #show' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :show, id: user
      expect(assigns(:user)).to eq user
    end

    it "renders the :show template" do
      user = create(:user)
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new User to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :edit, id: user
      expect(assigns(:user)).to eq user
    end

    it "renders the :edit template" do
      user = create(:user)
      get :edit, id: user
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    before :each do
      @phones = [
        attributes_for(:phone),
        attributes_for(:phone),
        attributes_for(:phone)
      ]
    end

    context "with valid attributes" do
      it "saves the new user in the database" do
        expect{
          post :create, user: attributes_for(:user,
            phones_attributes: @phones, 
            address_attributes: attributes_for(:address))
        }.to change(User, :count).by(1)
      end
      
      it "saves the new phones in the database" do
        expect{
          post :create, user: attributes_for(:user,
            phones_attributes: @phones, 
            address_attributes: attributes_for(:address))
        }.to change(Phone, :count).by(3)
      end

      it "saves the new address in the database" do
        expect{
          post :create, user: attributes_for(:user,
            phones_attributes: @phones, 
            address_attributes: attributes_for(:address))
        }.to change(Address, :count).by(1)
      end

      it "redirects to user#show" do
        post :create, user: attributes_for(:user,
          phones_attributes: @phones)
        expect(response).to redirect_to user_path(assigns[:user])
      end
    end

    context "with invalid attributes" do
      it "does not save the new user in the database" do
        expect{
          post :create,
            user: attributes_for(:invalid_user)
        }.to_not change(User, :count)
      end

      it "re-renders the :new template" do
        post :create,
          user: attributes_for(:invalid_user)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
  	let(:user) { create(:user) }

    context "valid attributes" do
      it "locates the requested @user" do
        patch :update, id: user, user: attributes_for(:user)
        expect(assigns(:user)).to eq(user)
      end

      it "changes user attributes" do
        patch :update, id: user,
          user: attributes_for(:user, name: 'This is my design')
        expect(user.reload.name).to eq('This is my design')
      end

      it "redirects to the updated user" do
        patch :update, id: user, user: attributes_for(:user)
        expect(response).to redirect_to user
      end
    end

    context "with invalid attributes" do
      it "does not change the user attributes" do
      	name = user.name
        patch :update, id: user,
          user: attributes_for(:user, name: nil)

        expect(user.reload.name).to eq(name)
      end

      it "re-renders the edit template" do
        patch :update, id: user,
          user: attributes_for(:invalid_user)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }

    it "deletes the user" do
      expect{
        delete :destroy, id: user
      }.to change(User, :count).by(0)
    end

    it "redirects to users#index" do
      delete :destroy, id: user
      expect(response).to redirect_to users_path
    end
  end
end