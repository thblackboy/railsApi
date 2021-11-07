require 'rails_helper'

describe 'Short Link Create', type: :request do

  let(:valid_params) do
    {
      urls: {
        link: "lolo.com",
      }
    }
  end

  let(:invalid_params) do
    {
      urls: {
        kiki:"olol0",
      fgjg:"jjj",


      }
    }
  end

  it'create short link' do

    expect { post '/urls/', params: valid_params }.to change(Weblink, :count).by(+1)

    expect(Weblink.last.link).to eq("lolo.com")
    expect(response).to have_http_status(201)

  end


  it'write short_link -> get long link and change click_count to +1' do
    FactoryBot.create(:weblink, link:'vk.com', short_link:'okjgr', click_count:5)

    get '/urls/okjgr'

    expect(JSON.parse(response.body)["link"]).to eq (Weblink.last.link)
    expect(Weblink.last.click_count).to eq(6)
    expect(response).to have_http_status(200)

  end

  it 'write non-existent short_link-> get error' do
    get '/urls/okjgrkk'
    expect(response).to have_http_status(404)
  end
  it 'write short_link -> get click_count' do
    FactoryBot.create(:weblink, link:'vk.com', short_link:'okjgr', click_count:5)
    get '/urls/okjgr/stats'

    expect(JSON.parse(response.body)["click_count"]).to eq (Weblink.last.click_count)
    #have to return 5==5
  end

  it 'write non-existent short_link -> dont get click_count and get error' do
    FactoryBot.create(:weblink, link:'vk.com', short_link:'okjgr', click_count:5)
    get '/urls/sssssr/stats'

    expect(response).to have_http_status(404)

  end


end