import Data.Pixel;

public struct CameraData {
    public matrix Projection;
    public matrix View;
    public float3 Position;
    public float3 Forward;

    public float4 Project(in float3 pos) {
        return mul(mul(float4(pos, 1.0), View), Projection);
    }
}
public uniform CameraData Camera;