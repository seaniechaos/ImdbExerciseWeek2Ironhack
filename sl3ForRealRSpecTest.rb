require_relative 'sl3ForReal.rb'

describe SeriesCentral do 
	before do
		@series_central = SeriesCentral.new
	end

	describe "#get_results" do
		it "should return more than 200 results" do
			expect(@series_central.get_results("cat")).to be >=(200)
		end
	end

	describe "#most_seasons" do
		it "should return Friends for most seasons" do
			expect(@series_central.most_seasons(["Breaking Bad", "Friends", "Sherlock"])).to eq("Friends")
		end
	end

	describe "#most_episodes" do
	 	it "should return ...." do
	 		expect(@series_central.most_episodes(["Breaking Bad", "Friends", "Sherlock"])).to eq("Friends")
	 	end
	 end

	describe "#best_ever" do
		it "should return Breaking Bad when compared to Pacific Blue and The Affair" do
			expect(@series_central.best_ever(["Breaking Bad", "Pacific Blue", "The Affair"])).to eq("Breaking Bad")
		end
	end

	describe "#top_movies" do
        it "Top 1 movie" do
            result = @series_central.top_movies(1)
            expect(result).to eq(["1.\n    Cadena perpetua"])
		end
	end
end