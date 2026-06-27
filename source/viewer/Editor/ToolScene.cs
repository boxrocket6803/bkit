namespace Editor;

public partial class ToolScene : Scene.Object {
	protected override void OnCreate() {
		Scene.Add<Scene.Light.Point>().Color = new(4, 2, 0.5f);
		Draw.Model("models/m_standard_01.bmdl");
	}
}