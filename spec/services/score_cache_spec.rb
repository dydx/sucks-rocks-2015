require_relative '../../app/services/score_cache'
require_relative '../../app/services/rock_score'

# this isn't a service, and I don't feel like invoking
# rails to get the activerecord model going
class CachedScore
  class NoScore < RuntimeError; end

  def self.for_term(term)
  end

  def self.save_score(term, score)
  end
end

describe ScoreCache do
  it "returns cached scores if they exist" do
    allow(CachedScore).to receive(:for_term).with("microsoft").and_return ( 5.5 )
    expect(ScoreCache.for_term("microsoft")).to eql 5.5
  end

  context "when the term is not cached" do
    before do
      allow(RockScore).to receive(:for_term).with("microsoft").and_return ( 5.5 )
      allow(CachedScore).to receive(:for_term).with("microsoft").
        and_raise( CachedScore::NoScore )
      allow(CachedScore).to receive(:save_score)
    end

    it "recomputes scores" do
      expect(ScoreCache.for_term("microsoft")).to eql 5.5
    end

    it "stores new scores in the database" do
      expect(CachedScore).to receive(:save_score).with("microsoft", 5.5)
      ScoreCache.for_term("microsoft")
    end
  end
end
