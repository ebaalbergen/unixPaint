using Gtk;

class MainProgram
{
    private static string[] args;

    private static bool saved;

    private static Window window;
    private static ClosingFile dialog;

    private static bool testScreen(Widget widget, Gdk.EventAny e)
    {
        if(!saved)
        {
            Gtk.main_quit();
            return true;
        }


        dialog = new ClosingFile(ref window);
        dialog.save_file_handler.connect(MainProgram.save);
        return true;
    }

    public static void save(bool saving)
    {
        if(saving)
        {
            print("Save");
        } else
        {
            Gtk.main_quit();
        }
    }

    public static void main(string[] args)
    {
        MainProgram.args = args;
        saved = false;
        Gtk.init(ref args);

        window = new Window();

        window.title = "unixPaint";

        window.border_width = 10;
        window.window_position = WindowPosition.CENTER;
        window.set_default_size(600, 450);
        window.delete_event.connect(MainProgram.testScreen);

        var button = new Button.with_label("Click me!");
        button.clicked.connect(() =>
        {
            button.label = "Thank you!";
            saved=true;
        });

        MenuBar bar = new MenuBar();

        window.add(bar);

        Gtk.MenuItem fileMenu = new Gtk.MenuItem.with_label("File");
        bar.add(fileMenu);

        Gtk.Menu fileSubMenu = new Gtk.Menu();
        fileMenu.set_submenu(fileSubMenu);

        Gtk.MenuItem item_open = new Gtk.MenuItem.with_label ("Open");
		item_open.activate.connect (() => {
			FileChooserDialog chooser = new FileChooserDialog (
					"Select your favorite file", window, FileChooserAction.OPEN,
					"_Cancel",
					ResponseType.CANCEL,
					"_Open",
					ResponseType.ACCEPT);
			chooser.run ();
			chooser.close ();
		});
		fileSubMenu.add (item_open);

        Gtk.MenuItem item_exit = new Gtk.MenuItem.with_label ("Exit");
		item_exit.activate.connect (Gtk.main_quit);
		fileSubMenu.add (item_exit);

        window.add(button);
        window.show_all();

        Gtk.main();
    }
}
