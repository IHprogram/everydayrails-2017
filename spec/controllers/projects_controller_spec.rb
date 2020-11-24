require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe "#index" do
    let(:user) { FactoryBot.create(:user) }

    # 正常にレスポンスを返すこと
    it "responds successfully" do
      sign_in user
      get :index
      expect(response.status).to eq 200
    end

    # 200レスポンスを返すこと
    it "returns a 200 response" do
      sign_in user
      get :index
      expect(response).to have_http_status "200" 
    end

    # ゲストとして
    context "as a guest" do
      # 302レスポンスを返すこと
      it "returns a 302 response" do
        get :index
        expect(response).to have_http_status "302"
      end

      # サインイン画面にリダイレクトすること
      it "redirects to the sign-in page" do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end    
  end
end
