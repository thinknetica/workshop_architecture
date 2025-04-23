RSpec.describe AuthorSerializer, type: :serializer do
  let(:author) { create(:full_author) }

  describe 'serialization' do
    context 'when correct author is passed' do
      subject { described_class.new(author) }

      it "return correct json response" do
        serialized = JSON.parse(subject.to_json)
        full_name = [ author.first_name, author.middle_name, author.last_name ].join(' ')

        expect(serialized['id']).to eq(author.id)
        expect(serialized['full_name']).to eq(full_name)
      end
    end
  end
end
