public struct Color {
	public static float3 ColorSaturate(float3 color, float amount) {
		return saturate(color.rgb * (1.0 + amount * 2.0) - (color.gbr + color.brg) * amount);
	}

	public static float3 ComputeSheenColor(float3 color, float sheen) {
		float desat = saturate(sheen + 1.0) * 0.5 + 0.5;
		float sat = saturate(sheen);
		return lerp(lerp(1.0 - desat, color, desat), saturate((1.0 + sat) * ColorSaturate(color, sat)), sheen * 0.5 + 0.5);
	}
}