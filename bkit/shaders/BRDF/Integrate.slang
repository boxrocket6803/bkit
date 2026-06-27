import BRDF.Result;
import BRDF.Model;
import Context.Light;
import Context.Surface;

public LightingResult IntegrateLighting(in SurfaceContext s, in BRDF brdf) {
    LightingResult r = LightingResult();
	
	r.Emissive += s.Emissive;
	brdf.ComputeIndirect(r, s, 0); //TODO ssao
	
	LightContext l;
    for (uint i = 0; i < l.Count; i++) {
		l.Load(i, s.PositionWs);
		l.ComputeAttenuation();
		l.ComputeShadow(s);
		brdf.ComputeLighting(r, s, l);
	}
	
	r.Finalize();
	return r;
}