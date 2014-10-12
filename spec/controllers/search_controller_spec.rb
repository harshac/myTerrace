require 'rails_helper'

RSpec.describe SearchController, :type => :controller do

  describe "Search" do
    it "should return terraces with selected location, capacity and single date" do
      terrace = FactoryGirl.create(:terrace)
      FactoryGirl.create(:availability, terrace: terrace)

      terrace1 = FactoryGirl.create(:terrace, location: "central chowk")
      FactoryGirl.create(:availability, terrace: terrace1)

      get :index, search: { dates: ['14 Jan 2015'],
                            location: 'central chowk',
                            persons: '20'
                          }

      expect(assigns(:terraces)).to include(terrace1)
      expect(assigns(:terraces)).to_not include(terrace)
    end

    it 'should return terraces with selected location, capacity and multiple dates' do
      terrace = FactoryGirl.create(:terrace)
      FactoryGirl.create(:availability, terrace: terrace, date: Date.parse('14 Jan 2015'))
      FactoryGirl.create(:availability, terrace: terrace, date: Date.parse('15 Jan 2015'))



      get :index, search: { dates: ['14 Jan 2015', '15 Jan 2015'],
                            location: 'ahmedabad pol',
                            persons: '20'
      }

      expect(assigns(:terraces)).to include(terrace)
    end
  end

end
