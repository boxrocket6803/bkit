import Context.Surface;
import Data.Light;

public struct LightContext {
	public uint Offset;
	public uint Count;

    public LightData Light;
    public float3 Direction;
    public float  Attenuation;
    public float  Visibility;
	
	public __init() {
		//TODO pull from clusters
		Offset = 0;
		Count = 1;

        Light = LightData();
        Direction = 0.0;
        Attenuation = 0.0;
        Visibility = 0.0;
	}
	
	[mutating] public void Load(uint index, float3 pos) {
		index += Offset;
        //TODO actually load the light, fake light for now
        Light = LightData();
        Light.Position = float3(30, -70, 60);
        Light.Color = float3(1, 0.5, 0.2) * 5;

        Direction = normalize(Light.Position - pos);
	}

    [mutating] public void ComputeAttenuation() { //TODO
        Attenuation = 1.0;
    }
    [mutating] public void ComputeShadow(SurfaceContext s) { //TODO
		Visibility = 1.0;
    }
}