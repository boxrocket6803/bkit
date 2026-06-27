import Context.Surface;
import Utility.Constants;

public struct WardContext {
    private float InvRoughnessSq; //squared + inversed + normalized isotropic roughness

    public __init(float rough) {
        rough = max(0.01, rough);
        float invRough = 1.0 / rough;
        InvRoughnessSq = invRough * invRough;
	}

    public float ComputeTerm(float3 normal, float3 dirToLight, float3 view) {
        float3 h = dirToLight + view;

        float HdotN = dot(h, normal);
        HdotN = max(1e-4, HdotN);
        float HdotH = dot(h, h);
        float invHdotN_2 = 1.0 / (HdotN * HdotN);
        const float exponent = InvRoughnessSq * (1 - invHdotN_2 * HdotH);

        return Constants.InvPI * InvRoughnessSq * exp(exponent) * HdotH * invHdotN_2 * invHdotN_2;
    }
}