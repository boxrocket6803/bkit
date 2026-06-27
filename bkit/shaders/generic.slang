import BRDF.Model;
import BRDF.Models.Ward;
import BRDF.Result;
import BRDF.Integrate;
import Context.Light;
import Context.Surface;
import Data.Vertex;
import Data.Pixel;
import Data.Camera;

PixelInput Vertex(VertexInput i) {
    PixelInput o; //TODO move most of this into pixel input constructor?
    o.PositionWs = i.PositionOs; //TODO transform these
    o.NormalWs = i.NormalOs;
    o.PositionPs = Camera.Project(o.PositionWs);
    return o;
}

float4 Fragment(PixelInput i) {
    SurfaceContext s = SurfaceContext(i);
    s.Roughness = 0.9;

    LightingResult l = IntegrateLighting(s, Ward(s));
	return float4(l.Final, 1);
}