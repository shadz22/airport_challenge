require 'airport.rb'

describe Airport do

  describe '#land' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lets the plane land at airport' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it 'prevents from landing if airport full' do
      Airport::DEFAULT_CAPACITY.times do
        subject.land(Plane.new)
      end
      expect { subject.land(Plane.new) }.to raise_error "Airport full"
    end

  end

  describe '#take_off' do

    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'lets plane take_off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end
  end
end
