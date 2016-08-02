require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe "GET #index" do

    it "assigns @articles to all Articles" do
      get :index
      expect(:articles).to eq(Article.all)
    end

  end


end
