public class Viewer {
	public static Engine Engine {get;} = new();
	
	public static void Main(string[] args) {
		if (args.Length == 0)
			return;
		Engine.Init();
		args[0] = Convert.Run(args[0]);
		Scene.Manager.Active.Add<Editor.ToolScene>();
		Engine.Run();
	}
}