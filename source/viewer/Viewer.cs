using System.IO;

public class Viewer {
	private readonly static string[] Viewable = [".bmdl", ".bseq", ".btex"];

	public static void Main(string[] args) {
		if (args.Length > 0)
			args[0] = Convert(args[0]);
		Engine.Main();
	}

	private static string Convert(string file) {
		if (string.IsNullOrEmpty(file))
			return null;
		if (Viewable.Contains(Path.GetExtension(file)))
			return file;
		if (bmdl.Convert.Supports(file))
			return bmdl.Convert.Run([file]);
		else if (bseq.Convert.Supports(file))
			return bseq.Convert.Run([file]);
		else if (btex.Convert.Supports(file))
			return btex.Convert.Run([file]);
		return file;
	}
}