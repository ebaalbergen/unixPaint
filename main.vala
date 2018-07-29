using Gtk;

class MainProgram
{
    private string[] args;

    private bool saved;

    private Window window;
    private ClosingFile dialog;

    [CCode (instance_pos = -1)]
    private bool testscreen(Widget widget, Gdk.EventAny e)
    {
        if(!saved)
        {
            Gtk.main_quit();
            return true;
        }


        dialog = new ClosingFile(ref window);
        dialog.save_file_handler.connect(this.save);
        return true;
    }

    public void save(bool saving)
    {
        if(saving)
        {
            print("Save");
        } else
        {
            Gtk.main_quit();
        }
    }

    public MainProgram(string[] args)
    {
        this.args = args;
        saved = false;
        Gtk.init(ref args);

    }

    public void run()
    {
        try
        {
            var builder = new Builder ();
            builder.add_from_file("userInterfaces/mainScreen.ui");
            builder.connect_signals(this);
            window = builder.get_object ("window") as Window;

            MenuModel menubar = builder.get_object ("menubar") as MenuModel;
            window.show_all();
        }
        catch
        {
            print("Error while opening window.");
        }

        /*window = new Window();

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
        window.show_all();*/

        Gtk.main();
    }
}

void main(string[] args)
{
    MainProgram mainProgram = new MainProgram(args);
    mainProgram.run();
}
