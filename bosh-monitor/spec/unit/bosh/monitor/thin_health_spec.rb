require 'spec_helper'

describe Bosh::Monitor::ThinHealth do
  describe "health response" do
    let(:env) { {'async.callback' => rack_server} }
    let(:rack_server) { double('Rack') }

    it 'returns 200 asyncly' do
      EM.should_receive(:defer).and_yield
      rack_server.should_receive(:call).with([200, {'Content-Type' => 'text/plain'}, []])
      async_response=described_class.new.call(env)
      expect(async_response).to eql([-1, {}, []])
    end
  end
end
