require "spec_helper"

describe StudentsApp do
  let(:app) do
    StudentsApp.new(comma_file: "./fixtures/comma.txt",
                    dollar_file: "./fixtures/dollar.txt",
                    pipe_file: "./fixtures/pipe.txt")
  end

  it "produces expected output of code challenge" do
    app_output = capture_io { app.run! }.first

    assert_equal expected_output, app_output
  end

  let(:expected_output) do
    <<-OUTPUT

Output 1:
Mckayla Atlanta 5/29/1986
Anika Hong Kong 5/5/1965
Timmothy London 10/2/1964
Rhiannon Los Angeles 10/4/1974
Matteo Melbourne 2/14/1962
Elliot New York City 4/3/1947
Filomena New York City 1/24/1980
Stacy New York City 1/22/1964
Rigoberto San Francisco 12/1/1962

Output 2:
Mckayla Atlanta 5/29/1986
Filomena New York City 1/24/1980
Rhiannon Los Angeles 10/4/1974
Anika Hong Kong 5/5/1965
Timmothy London 10/2/1964
Stacy New York City 1/22/1964
Rigoberto San Francisco 12/1/1962
Matteo Melbourne 2/14/1962
Elliot New York City 4/3/1947
    OUTPUT
  end
end
