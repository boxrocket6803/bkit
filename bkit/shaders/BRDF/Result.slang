public struct LightingResult {
    public float3 Diffuse;
    public float3 Specular;
	public float3 Emissive;
	
	public float3 Final;

    [mutating] public void Finalize() {
        Final = Diffuse + Specular + Emissive;
		Final = min(65000.0, Final);
	}
};