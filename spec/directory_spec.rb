require_relative "../directory"

describe "directory" do
  it 'returns headings when headings called' do
    expect(print_header).to eq ("The students of Villains Academy")
  end
end