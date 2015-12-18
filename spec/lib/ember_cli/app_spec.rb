require "ember-cli-rails"

describe EmberCli::App do
  describe "#compile" do
    it "exits with exit status of 0" do
      passed = EmberCli["my-app"].compile

      expect(passed).to be true
    end
  end

  describe "#test" do
    it "exits with exit status of 0" do
      passed = EmberCli["my-app"].test

      expect(passed).to be true
    end
  end

  describe "#root_path" do
    it "delegates to PathSet" do
      root_path = Pathname(".")
      stub_paths(root: root_path)
      app = EmberCli::App.new("foo")

      root_path = app.root_path

      expect(root_path).to eq root_path
    end
  end

  describe "#dist_path" do
    it "delegates to PathSet" do
      dist_path = Pathname(".")
      stub_paths(dist: dist_path)
      app = EmberCli::App.new("foo")

      dist_path = app.dist_path

      expect(dist_path).to eq dist_path
    end
  end

  def stub_paths(method_to_value)
    allow_any_instance_of(EmberCli::PathSet).
      to receive(method_to_value.keys.first).
      and_return(method_to_value.values.first)
  end
end
