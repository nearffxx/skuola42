require "rails_helper"

feature "Use Case:" do

  before do
    # Questi test sono fatti per aiutare lo sviluppatore a la parte restante del sito nei use case base.
    # dato che richiedono ancune parti che non abbiamo fatto ancora essi falliscono (il che e' buono).
  end

  scenario "#1 La mamma Giorgia consulta le date dei colloqui" do
    visit root_path()
    click_link "Incontri"
    click_link "03 Jun 09:00"
    expect(page).to have_text("Professori che partecipano")
  end

  scenario "#2 Gino lo sportivo è curioso di vedere la palestra della scuola" do
    visit root_path()
    click_link "Strutture"
    click_link "Palestra"
    click_link "Eventi ospitati"
    click_link "03 Jun 09:00 Days of dinosaurs"
    click_link "Storia"
    click_link "Programma"
    click_link "Professori che la insegnano"
    click_link "Amaldo Luca"
    click_link "Supporti"

    expect(page).to have_text("Supporti della scuola")
  end

  scenario "#3 Ash vuole sapere quello che studierà" do
    visit root_path()
    click_link "Materie"
    click_link "Attività extra"
    click_link "Giornalino scolastico"
    click_link "Info pratiche"
    expect(page).to have_text("COME RAGGIUNGERCI E COMUNICARE")
    click_link "Come iscriversi"
    expect(page).to have_text("Supporti della scuola")
  end

  scenario "#4 Pino consulta il calendario e l’orario didattico" do
    visit root_path()
    click_link "Info pratiche"
    expect(page).to have_text("COME RAGGIUNGERCI E COMUNICARE")
    click_link "Calendario"
    click_link "Classi"
    click_link "1A"
    click_link "Libri di testo e riferimenti ausiliari"
    expect(page).to have_text("Supporti della scuola")
  end

  scenario "#5 Il professore Giancarlo è stato trasferito" do
    visit root_path()
    click_link "Scuola"
    expect(page).to have_text("SKUOLA 42: STORIA E TRADIZIONE")
    click_link "Missione e principi"
    click_link "Associazione genitori"
    expect(page).to have_text("ASSOCIAZIONE GENITORI")
  end

end