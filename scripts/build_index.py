"""Crea l'indice di GitHub Pages dai PDF appena compilati."""

from html import escape
from pathlib import Path
import sys
from urllib.parse import quote


def main():
    directory = Path(sys.argv[1])
    titles = {
        "3 - Testi e stampe.pdf": "3 - Testi e stampe",
        "2 - Desktop, icone e applicazioni.pdf": "2 - Desktop, icone e applicazioni (dall’ebook)",
        "1_computer_dispositivi.pdf": "1. Computer e dispositivi",
        "2_desktop_icone_impostazioni.pdf": "2. Desktop, icone e impostazioni",
        "4_gestione_file.pdf": "4. Gestione di file",
        "originali mie.pdf": "Originali mie",
    }
    pdfs = sorted(directory.glob("*.pdf"))
    if not pdfs:
        raise SystemExit("Nessun PDF da pubblicare.")
    links = "\n".join(
        f'<li><a href="{quote(pdf.name)}">'
        f'{escape(titles.get(pdf.name, pdf.stem.replace("_", " ")))}</a></li>'
        for pdf in pdfs
    )
    (directory / "index.html").write_text(
        "<!doctype html>\n"
        '<html lang="it"><meta charset="utf-8">\n'
        '<meta name="viewport" content="width=device-width, initial-scale=1">\n'
        "<title>ICDL – Presentazioni</title>\n"
        "<style>body{max-width:48rem;margin:4rem auto;padding:0 1.5rem;"
        "font:1.2rem/1.6 Georgia,serif;color:#202020}"
        "h1,a{color:#c00000}li{margin:.8rem 0}</style>\n"
        "<h1>ICDL – Presentazioni</h1>\n"
        "<p>Ultime versioni pubblicate per la classe.</p>\n"
        f"<ul>\n{links}\n</ul>\n"
        '<p><a href="https://github.com/federico-mazzini/icdl">'
        "Sorgenti e materiali</a></p>\n</html>\n",
        encoding="utf-8",
    )


if __name__ == "__main__":
    main()
