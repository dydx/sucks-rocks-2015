require_relative '../../app/services/rock_score'
require_relative '../../app/services/search_engine'

describe RockScore do
  it "returns 0 for unpopular terms" do
    allow(SearchEngine).to receive(:count_results).with("apple rocks").and_return( 0 )
    allow(SearchEngine).to receive(:count_results).with("apple sucks").and_return( 1 )

    expect(RockScore.for_term('apple')).to eql 0.0
  end

  it "returns 10 for popular terms" do
    allow(SearchEngine).to receive(:count_results).with("apple rocks").and_return( 1 )
    allow(SearchEngine).to receive(:count_results).with("apple sucks").and_return( 0 )

    expect(RockScore.for_term('apple')).to eql 10.0
  end

  it "returns mediocre results for mediocre terms" do
    allow(SearchEngine).to receive(:count_results).with("apple rocks").and_return( 9 )
    allow(SearchEngine).to receive(:count_results).with("apple sucks").and_return( 11 )

    expect(RockScore.for_term('apple')).to eql 4.5
  end

  it "does not divide by zero" do
    allow(SearchEngine).to receive(:count_results).with("apple rocks").and_return( 0 )
    allow(SearchEngine).to receive(:count_results).with("apple sucks").and_return( 0 )

    expect(RockScore.for_term('apple')).to eql RockScore::NoScore
  end
end
