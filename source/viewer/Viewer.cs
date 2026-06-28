public class Viewer {
	public static Engine Engine {get;} = new();
	
	public static void Main(string[] args) {
		if (args.Length == 0)
			return;
		Engine.Init();
		Scene.Manager.Active.Add<Editor.Camera>();
		Scene.Manager.Active.Add<Editor.ToolScene>();
		Engine.Run();
	}
}