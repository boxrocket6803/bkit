public struct LightData {
    public float3 Position;
    public float3 Color;

    public float  Specular;

    public __init() {
        Position = 0.0;
        Color = 0.0;
        Specular = 1.0;
    }
}