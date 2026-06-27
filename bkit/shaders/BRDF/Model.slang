import BRDF.Result;
import Context.Surface;
import Context.Light;

public interface BRDF {
    public void ComputeIndirect(inout LightingResult r, in SurfaceContext s, in float ssao);
    public void ComputeLighting(inout LightingResult r, in SurfaceContext s, in LightContext l);
}