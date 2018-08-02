using Gtk;

class UnixPaint
{
    private string[] args;

    private bool saved;

    public Window window;
    public ClosingFile dialog;

    [CCode (instance_pos = -1)]
    public bool exitHandlerClose(Widget widget, Gdk.EventAny e)
    {
        print(saved.to_string());
        return exit();
    }

    [CCode (instance_pos = -1)]
    public void exitHandlerMenu()
    {
        print(saved.to_string());
        exit();
    }

    private bool exit()
    {
        if(saved)
        {
            Gtk.main_quit();
            return true;
        }

        dialog = new ClosingFile(ref this.window);
        dialog.save_file_handler.connect(this.save);
        return true;
    }

    public void save(bool saving)
    {
        if(saving)
        {
            print("Save");
            // saved = true;
        } else
        {
            Gtk.main_quit();
        }
    }

    public UnixPaint(string[] args)
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

            window.show_all();
        }
        catch
        {
            print("Error while opening window.");
        }

        Gtk.main();
    }
}

void main(string[] args)
{
    var mainProgram = new UnixPaint(args);
    mainProgram.run();
}
