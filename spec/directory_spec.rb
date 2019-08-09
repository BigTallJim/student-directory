require_relative "../directory"

describe "directory" do
  it 'returns headings when headings called' do
    expect(print_header).to eq ("The students of Villains Academy\n-------------")
  end
  it 'returns footer when footer called' do
    expect(print_footer(["Evil1","Evil2","Evil3"])).to eq ("Overall, we have 3 great students")
  end
    it 'returns list of villians' do
    expect(print(["Evil1","Evil2","Evil3"])).to eq ("Evil1\nEvil2\nEvil3\n")
  end
end