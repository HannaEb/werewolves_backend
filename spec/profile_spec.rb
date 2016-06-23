describe 'profile API' do
  let(:json) {JSON.parse(response.body)}
  let(:image){File.readlines ("spec/fixtures/profile")[0]}

it 'converts image to text, adding items to database' do
  post profiles_path, {image: image}
  expect(response).to be_success
  expect(Profile.count).to eq 1
end






end
