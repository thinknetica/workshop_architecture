RSpec.describe LanguageSerializer, type: :serializer do
  let(:language) { create(:language) }

  describe 'serialization' do
    context 'when correct language is passed' do
      subject { described_class.new(language) }

      it "return correct json response" do
        serialized = JSON.parse(subject.to_json)

        expect(serialized['id']).to eq(language.id)
        expect(serialized['slug']).to eq(language.slug)
        expect(serialized['name']).to eq(language.name)
      end
    end
  end
end
