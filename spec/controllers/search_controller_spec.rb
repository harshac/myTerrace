require 'rails_helper'

RSpec.describe SearchController, :type => :controller do

  describe "Search" do
    it "should return terraces with selected location, capacity and single date" do
      terrace = FactoryGirl.create(:terrace)
      FactoryGirl.create(:availability, terrace: terrace)

      terrace1 = FactoryGirl.create(:terrace, location: "central chowk")
      FactoryGirl.create(:availability, terrace: terrace1)

      get :index, terrace: { dates: ['14 Jan 2015'],
                            location: 'central chowk',
                            capacity: '20'
                          }

      expect(assigns(:terraces)).to include(terrace1)
      expect(assigns(:terraces)).to_not include(terrace)
    end

    it 'should return terraces with selected location, capacity and multiple dates' do
      terrace = FactoryGirl.create(:terrace)
      FactoryGirl.create(:availability, terrace: terrace, date: Date.parse('14 Jan 2015'))
      FactoryGirl.create(:availability, terrace: terrace, date: Date.parse('15 Jan 2015'))

      terrace1 = FactoryGirl.create(:terrace, location: 'Central Chowk')
      FactoryGirl.create(:availability, terrace: terrace1, date: Date.parse('14 Jan 2015'))

      terrace2 = FactoryGirl.create(:terrace, capacity: 10)
      FactoryGirl.create(:availability, terrace: terrace2, date: Date.parse('14 Jan 2015'))
      FactoryGirl.create(:availability, terrace: terrace2, date: Date.parse('15 Jan 2015'))

      terrace3 = FactoryGirl.create(:terrace, capacity: 30)
      FactoryGirl.create(:availability, terrace: terrace3, date: Date.parse('14 Jan 2015'))
      FactoryGirl.create(:availability, terrace: terrace3, date: Date.parse('15 Jan 2015'))

      get :index, terrace: { dates: ['14 Jan 2015', '15 Jan 2015'],
                            location: 'ahmedabad pol',
                            capacity: '20'
      }

      expect(assigns(:terraces)).to include(terrace)
      expect(assigns(:terraces)).to include(terrace3)
      expect(assigns(:terraces)).to_not include(terrace1)
      expect(assigns(:terraces)).to_not include(terrace2)
    end
  end
end
