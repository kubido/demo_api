require "rails_helper"

RSpec.describe "Index a page ", :type => :request do

  it "should parsed content within h1, h2, h3 in a webpage" do
    post "/create_page", params: { url: 'http://bukalapak.com' }

    resp = JSON.parse(response.body)
    expect(resp["status"]).to eq(200)
    expect(resp["message"]).to eq('Success')
  end

  it "empty url should failed to parsed" do
    post "/create_page", params: { url: '' }

    resp = JSON.parse(response.body)
    expect(resp["message"]).to eq("URL can't be blank")
  end

  it "invalid url should failed to parsed" do
    post "/create_page", params: { url: 'bukalapak.com' }

    resp = JSON.parse(response.body)
    expect(resp["message"]).to eq('Not valid URL')
  end
end

RSpec.describe 'List all indexed', :type => :request do
  it 'should display all indexed page' do 
    post "/create_page", params: { url: 'http://bukalapak.com' }
    get '/pages'
    
    resp = JSON.parse(response.body)
    expect(resp["data"].length).to eq(1)

  end
end