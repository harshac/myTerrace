require 'rails_helper'

describe TerracesController, :type => :controller do
  it 'should generate new terrace with given parameters' do
    dates = ['14 Jan 2015', '15 Jan 2015']
    location = 'ahmedabad pol'
    get :new, terrace: { dates: dates,
                         location: location,
                         capacity: '20'}

    terrace = assigns(:terrace)
    expect(terrace.location).to eq(location)
    expect(terrace.capacity).to eq(20)
    expect(terrace.availabilities.map(&:date)).to eq(dates.map{|date| Date.parse(date)})
  end

  it 'should create terrace, owner and availabilities with given parameters' do
    location = 'ahmedabad pol'
    get :create, terrace: { location: location,
                            capacity: '20',
                            area: '3000.1',
                            rent: '1002',
                            owner_attributes: {name: 'John Smith', phone: '9898677998', email: 'john@example.com'},
                            availabilities_attributes: [{date: '14 Jan 2015'}, {date: '15 Jan 2015'}]
                          }

    terrace = Terrace.last
    expect(terrace.location).to eq(location)

    expect(terrace.owner.name).to eq('John Smith')

    expect(terrace.availabilities.size).to eq(2)
    expect(terrace.availabilities[0].date).to eq(Date.parse('14 Jan 2015'))
  end

end
