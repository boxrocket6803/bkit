public struct Fresnel {
    public static float Schlick(float u) {
        float m = saturate(1 - u);
        float m2 = m * m;
        return m2 * m2 * m;
    }

    public static float3 Accurate(float3 ior, float cosTheta, float strength = 1.0) {
        float c = lerp(1.0, cosTheta, strength);
        float3 g = sqrt(max(0.0001, ior * ior - 1.0 + c * c));
		float3 a = (g - c) / (g + c);
		a *= a;
		float3 b = (c * (g + c) - 1.0) / (c * (g - c) + 1.0);
		b = 1.0 + b * b;
		return 0.5 * a * b;
	}
}