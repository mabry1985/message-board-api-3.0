require 'rails_helper'
FactoryBot.find_definitions

describe "get all quotes route", :type => :request do
  let!(:groups) { FactoryBot.create_list(:group, 20)}

  before { get '/v1/groups'}

  it 'returns all quotes' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
