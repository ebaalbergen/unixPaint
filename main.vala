using Gtk;

void main(string[] args)
{
    Gtk.init( ref args);
    
    var window = new Window();

    var Locale = new Localisation(Language.ENGLISH);

    window.title = Locale.getString(0);

    window.border_width = 10;
    window.window_position = WindowPosition.CENTER;
    window.set_default_size(350, 70);
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

class Localisation
{
    Language language;
    private string[,] texts;

    public Localisation(Language language)
    { 
        this.language = language;
        this.setText();
    }

    private void setText()
    {
        this.texts = new string[0,0];
        this.texts[0, 0] = "unixPaint";
    }

    public string getString(int ID)
    {
        string translation = this.texts[this.language, ID];
        if(translation == "")
            return this.texts[0, ID];
        else return translation;
    }
}

enum Language {ENGLISH, DUTCH}

