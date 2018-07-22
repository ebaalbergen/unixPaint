using Gtk;

class ClosingFile
{
    public ClosingFile()
    {
        var builder = new Builder ();
        builder.add_from_file("userInterfaces/closeDialog.ui");
        builder.connect_signals(null);
        var window = builder.get_object ("window") as Window;
        window.show_all();
    }

    public void run()
    {
        Gtk.main();
    }
}
