import BRDF.Model;
import BRDF.Result;
import Context.Ward;
import Context.Surface;
import Context.Light;
import Utility.Color;
import Utility.Fresnel;
import Utility.Constants;
import Utility.OrenNayar;

public struct Ward : BRDF {
	private WardContext WardCtx;
	private float3 SheenColor;

	public __init(in SurfaceContext s) {
		WardCtx = WardContext(s.Roughness);
		SheenColor = Color::ComputeSheenColor(s.Diffuse, s.Sheen);
	}

	public void ComputeIndirect(inout LightingResult r, in SurfaceContext s, in float ssao) {
		//TODO
	}

	public void ComputeLighting(inout LightingResult r, in SurfaceContext s, in LightContext l) {
		bool translucent = false;
		if (l.Attenuation <= 0.0)
			return;
		if (!translucent && l.Visibility <= 0.0)
			return;

		float LdotN = saturate(dot(l.Direction, s.NormalWs));
        float VdotN = saturate(dot(s.ViewWs, s.NormalWs));
		float HdotN = saturate(dot(normalize(s.ViewWs + l.Direction), s.NormalWs));
		float3 Irradiance = l.Attenuation * l.Light.Color * l.Visibility;

        // fresnel
        float3 FresnelSpecular = Fresnel::Accurate(s.IOR, HdotN, s.Fresnel);
		FresnelSpecular *= l.Light.Specular;
		float3 FresnelDiffuse = 1.0 - FresnelSpecular;

		// diffuse
		float3 DiffuseColor = lerp(s.Diffuse, SheenColor, s.Roughness * pow(Fresnel::Schlick(HdotN), s.SheenImportance));
		float3 DiffuseTerm = DiffuseColor * Constants.InvPI * OrenNayar::Compute(s.NormalWs, l.Direction, s.ViewWs, s.Roughness);
		r.Diffuse += FresnelDiffuse * Irradiance * DiffuseTerm;

		// specular
		float SpecularTerm = WardCtx.ComputeTerm(s.NormalWs, l.Direction, s.ViewWs) * LdotN;
		r.Specular += FresnelSpecular * Irradiance * SpecularTerm;
	}
}