require 'rails_helper'
RSpec.describe SysadminController, :type => :controller do
  it "renders the index view" do
    get :index
    expect(response).to render_template(:index)
  end
end
