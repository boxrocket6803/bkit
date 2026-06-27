import Data.Pixel;
import Data.Camera;

public struct SurfaceContext {
	public float3 PositionWs;
	public float3 NormalWs;

	public float3 ViewWs;

	public float3 Diffuse;
	public float3 Emissive;

	public float  Roughness;
	public float  Sheen;
	public float  SheenImportance;
	public float3 IOR;
	public float  Fresnel;

	public __init(PixelInput i) {
		PositionWs = i.PositionWs;
        NormalWs = i.NormalWs;
        ViewWs = normalize(Camera.Position - i.PositionWs);

		Diffuse = 1.0;
		Emissive = 0.0;

		Roughness = 0.7;
        Sheen = 1.0;
        SheenImportance = 1.0;
        IOR = 0.0;
		Fresnel = 1.0;
	}
}