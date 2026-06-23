using System.IO;

public static class Convert {
	private readonly static string[] Viewable = [".bmdl", ".bseq", ".btex"];
	public static string Run(string file) {
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