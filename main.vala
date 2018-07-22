using Gtk;

class MainProgram
{
    private bool saved;

    var window;

    private static void exit()
    {
        if(!saved)
        {
            
        }
    }

    public static void main(string[] args)
    {
        Gtk.init( ref args);

        window = new Window();

        window.title = "unixPaint";

        window.border_width = 10;
        window.window_position = WindowPosition.CENTER;
        window.set_default_size(600, 450);
        window.destroy.connect(Gtk.main_quit);

        var button = new Button.with_label("Click me!");
        button.clicked.connect(() =>
        {
            button.label = "Thank you!";
        });

        window.add(button);
        window.show_all();

        Gtk.main();
    }
}
