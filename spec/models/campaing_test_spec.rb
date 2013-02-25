require 'spec_helper'
describe Campaign do
  it "Should create a valid campaign" do
    campaign = Campaign.new({ name: 'test',
                                 start_at: '2013-01-31T22:00:00Z',
                                 end_at: '2013-02-27T22:00:00Z',
                                 countries: "{\"test\":[\"1\"]}" })
  end
end