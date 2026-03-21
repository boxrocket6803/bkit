namespace bkit;

public class Convert {
	public static void Main(string[] args) {
		List<string> argacc = [.. args];
		Console.WriteLine("-- boxrend generalized format converter utility --");
		if (argacc.Count == 0) {
			Console.WriteLine("cmd args");
			Console.WriteLine(" <input file>");
		}
		while (!File.Exists(argacc.ElementAtOrDefault(0))) {
			if (argacc.Count > 0) {
				Console.WriteLine($"{argacc[0]} is not a valid file");
				argacc.RemoveAt(0);
			}
			Console.Write("input file: ");
			argacc.Insert(0, Console.ReadLine().Trim());
		}
		if (bmdl.Convert.Supports(argacc[0]))
			bmdl.Convert.Main([.. argacc]);
		else if (bseq.Convert.Supports(argacc[0]))
			bseq.Convert.Main([.. argacc]);
		else if (btex.Convert.Supports(argacc[0]))
			btex.Convert.Main([.. argacc]);
	}
}