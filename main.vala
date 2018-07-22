using Gtk;

class MainProgram
{
    private static bool saved;

    private static Window window;

    public static void main(string[] args)
    {
        saved = false;
        Gtk.init( ref args);

        window = new Window();

        window.title = "unixPaint";

        window.border_width = 10;
        window.window_position = WindowPosition.CENTER;
        window.set_default_size(600, 450);
        window.destroy.connect(Gtk.main_quit);

        var titleBar = new HeaderBar();
        titleBar.set_show_close_button(true);
        titleBar.title = "unixPaint";
        titleBar.pack_start(new Button.with_label("Click me!"));

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
