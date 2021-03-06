describe Jets::Cfn::Builders::ApiGatewayBuilder do
  let(:builder) do
    Jets::Cfn::Builders::ApiGatewayBuilder.new({})
  end

  describe "ApiGatewayBuilder" do
    it "builds a child stack with shared api gateway resources" do
      builder.compose
      # puts builder.text # uncomment to see template text

      resources = builder.template["Resources"]
      expect(resources).to include("RestApi")
      # Probably at least one route or AWS::ApiGateway::Resource is created
      resource_types = resources.values.map { |i| i["Type"] }
      expect(resource_types).to include("AWS::ApiGateway::Resource")

      expect(builder.template_path).to eq "#{Jets.build_root}/templates/demo-test-api-gateway.yml"
    end
  end
end
