When(/^I search for (.*)$/) do |term|
  @scores ||= {}
  @scores[term] = RockScore.for_term(term)
end

Then(/^microsoft should have a higher score than apple$/) do
  apple = @scores["apple"]
  microsoft = @scores["microsoft"]
  expect(microsoft).to be > apple
end
