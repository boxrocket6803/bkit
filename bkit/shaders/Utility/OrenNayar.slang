public struct OrenNayar {
    public static float Compute(in float3 n, in float3 l, in float3 v, in float rough) {
        float gamma = dot(v - n * dot(v, n), l - n * dot(l, n));
        float rough_sq = rough * rough;
        float A = 1.0 - 0.5 * (rough_sq / (rough_sq + 0.57));
        float B = 0.45 * (rough_sq / (rough_sq + 0.09));

        float cos_angle_vn = dot(v, n);
        float cos_angle_ln = dot(l, n);
        float cos_alpha = min(cos_angle_vn, cos_angle_ln);
        float cos_beta = max(cos_angle_vn, cos_angle_ln);
        float sin_alpha = saturate(1.0 - cos_alpha * cos_alpha);
        float sin_beta = saturate(1.0 - cos_beta * cos_beta);
        float C = sqrt(sin_alpha * sin_beta) / (1e-6 + cos_beta);

        float final = (A + B * max(0.0, gamma) * C);
        return saturate(dot(n, l)) * final;
    }
}