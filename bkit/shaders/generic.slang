import BRDF.Model;
import BRDF.Models.Ward;
import BRDF.Result;
import BRDF.Integrate;
import Context.Light;
import Context.Surface;
import Data.Vertex;
import Data.Pixel;
import Data.Camera;

Sampler2D Normal;

PixelInput Vertex(VertexInput i) {
    PixelInput o; //TODO move most of this into pixel input constructor?
    o.PositionWs = i.PositionOs; //TODO transform these
    o.NormalWs = i.NormalOs;
    o.TexCoord = i.TexCoord;
    o.PositionPs = Camera.Project(o.PositionWs);
    return o;
}

float4 Fragment(PixelInput i) {
    SurfaceContext s = SurfaceContext(i);
    //s.NormalWs = RMO.Sample(i.TexCoord).rgb;
    s.Roughness = 0.9;

    LightingResult l = IntegrateLighting(s, Ward(s));
    return float4(Normal.Sample(i.TexCoord).rg, 1, 1);
}