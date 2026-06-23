namespace Editor;

public class ToolScene : Scene.Object {
	protected override void OnCreate() {
		Scene.MainCamera = new Scene.Camera.Perspective();
		Draw.Model("models/error.bmdl");
	}
}