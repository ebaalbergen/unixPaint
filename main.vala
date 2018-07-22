using Gtk;

class MainProgram
{
    private static bool saved;

    private static Window window;

    private static void testScreen()
    {
        var builder = new Builder ();
        builder.add_from_file("userInterfaces/closeDialog.ui");
        builder.connect_signals(null);
        var window = builder.get_object ("window") as Window;
        window.show_all();
        Gtk.main();
    }

    public static void main(string[] args)
    {
        saved = false;
        Gtk.init(ref args);

        window = new Window();

        window.title = "unixPaint";

        window.border_width = 10;
        window.window_position = WindowPosition.CENTER;
        window.set_default_size(600, 450);
        window.destroy.connect(Gtk.main_quit);

        var titleBar = new HeaderBar();
        titleBar.set_show_close_button(true);
        titleBar.title = "unixPaint";

        var testButton = new Button.with_label("Click!");
        testButton.clicked.connect(MainProgram.testScreen);
        titleBar.pack_start(testButton);

        window.set_titlebar(titleBar);

        var button = new Button.with_label("Click me!");
        button.clicked.connect(() =>
        {
            button.label = "Thank you!";
            saved=true;
        });

        window.add(button);
        window.show_all();

        Gtk.main();
    }
}
