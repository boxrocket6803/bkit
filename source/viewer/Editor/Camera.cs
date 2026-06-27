namespace Editor;

public class Camera : Scene.Object {
	public Scene.Camera.Perspective View {get; set;} = new();
	public Vector3 CameraPosition {get; set;}
	private Vector3 CameraVelocity;
	public float Fov {get; set;} = 90;
	private float FovVelocity;

	protected override void OnCreate() {
		Scene.MainCamera = View;
		Input.Bindings.Add("Editor.Move", Silk.NET.Input.MouseButton.Right);
		Input.Bindings.Add("Editor.Move.Slow", Silk.NET.Input.Key.ControlLeft);
		Input.Bindings.Add("Editor.Move.Fast", Silk.NET.Input.Key.ShiftLeft);
		Input.Bindings.Add("Editor.Move.Down", Silk.NET.Input.Key.Q);
		Input.Bindings.Add("Editor.Move.Up", Silk.NET.Input.Key.E);
	}

	protected override void OnUpdate() {
		if (Input.Mouse.Freeze = Input.Down("Editor.Move")) {
			var move = Input.Keyboard.Move * View.WorldRotation;
			if (Input.Down("Editor.Move.Up"))
				move += Vector3.Up;
			if (Input.Down("Editor.Move.Down"))
				move += Vector3.Down;
			move *= 64;
			move /= Input.Down("Editor.Move.Slow") ? 4 : 1;
			move *= Input.Down("Editor.Move.Fast") ? 4 : 1;
			View.WorldRotation += Input.Mouse.Look;
			CameraPosition += move * Time.Delta;
			Fov += Input.Mouse.Wheel * 4;
			Fov = Fov.Clamp(1, 170);
		}
		View.WorldPosition = Vector3.SmoothDamp(View.WorldPosition, CameraPosition, ref CameraVelocity, 0.3f, Time.Delta);
		View.FieldOfView = MathX.SmoothDamp(View.FieldOfView, Fov, ref FovVelocity, 0.2f, Time.Delta);
	}
}