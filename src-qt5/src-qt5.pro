include("$${PWD}/OS-detect.pri")

QT       *= core gui
greaterThan(QT_MAJOR_VERSION, 4): QT *= widgets concurrent


CONFIG += c++1z
TARGET = lumina-pdf
TEMPLATE = app

QT += printsupport
QMAKE_CXXFLAGS += -std=c++17

target.path = $${L_BINDIR}

message("Qt Modules Needed: $${QT}")

SOURCES += main.cpp \
        mainUI.cpp \
        PropDialog.cpp \
        PrintWidget.cpp \
        BookmarkMenu.cpp

HEADERS  += mainUI.h \
		PrintWidget.h \
		PresentationLabel.h \
		PropDialog.h \
		Renderer.h \
		TextData.h \
    Bookmark.h \
    BookmarkMenu.h \
    Annotation.h \
    Widget.h \
    link.h \
    drawablepage.h \
    graphicsitems.h \
    lrucache.h

FORMS += mainUI.ui \
         PropDialog.ui \
         BookmarkMenu.ui

isEmpty(USE_MUPDF) || !isEmpty(USE_POPPLER){
	message("Using Poppler-Qt5 Backend")
	LIBS += -lpoppler-qt5
	SOURCES += Renderer-poppler.cpp
}else{
	message("Using MuPDF Backend")
	LIBS += -lmupdf -lmupdfthird
	SOURCES += Renderer-mupdf.cpp

}

TRANSLATIONS =  i18n/l-pdf_af.ts \
                i18n/l-pdf_ar.ts \
                i18n/l-pdf_az.ts \
                i18n/l-pdf_bg.ts \
                i18n/l-pdf_bn.ts \
                i18n/l-pdf_bs.ts \
                i18n/l-pdf_ca.ts \
                i18n/l-pdf_cs.ts \
                i18n/l-pdf_cy.ts \
                i18n/l-pdf_da.ts \
                i18n/l-pdf_de.ts \
                i18n/l-pdf_el.ts \
                i18n/l-pdf_en_AU.ts \
                i18n/l-pdf_en_GB.ts \
                i18n/l-pdf_en_ZA.ts \
                i18n/l-pdf_es.ts \
                i18n/l-pdf_et.ts \
                i18n/l-pdf_eu.ts \
                i18n/l-pdf_fa.ts \
                i18n/l-pdf_fi.ts \
                i18n/l-pdf_fr.ts \
                i18n/l-pdf_fr_CA.ts \
                i18n/l-pdf_gl.ts \
                i18n/l-pdf_he.ts \
                i18n/l-pdf_hi.ts \
                i18n/l-pdf_hr.ts \
                i18n/l-pdf_hu.ts \
                i18n/l-pdf_id.ts \
                i18n/l-pdf_is.ts \
                i18n/l-pdf_it.ts \
                i18n/l-pdf_ja.ts \
                i18n/l-pdf_ka.ts \
                i18n/l-pdf_ko.ts \
                i18n/l-pdf_lt.ts \
                i18n/l-pdf_lv.ts \
                i18n/l-pdf_mk.ts \
                i18n/l-pdf_mn.ts \
                i18n/l-pdf_ms.ts \
                i18n/l-pdf_mt.ts \
                i18n/l-pdf_nb.ts \
                i18n/l-pdf_ne.ts \
                i18n/l-pdf_nl.ts \
                i18n/l-pdf_pa.ts \
                i18n/l-pdf_pl.ts \
                i18n/l-pdf_pt.ts \
                i18n/l-pdf_pt_BR.ts \
                i18n/l-pdf_ro.ts \
                i18n/l-pdf_ru.ts \
                i18n/l-pdf_sa.ts \
                i18n/l-pdf_sk.ts \
                i18n/l-pdf_sl.ts \
                i18n/l-pdf_sr.ts \
                i18n/l-pdf_sv.ts \
                i18n/l-pdf_sw.ts \
                i18n/l-pdf_ta.ts \
                i18n/l-pdf_tg.ts \
                i18n/l-pdf_th.ts \
                i18n/l-pdf_tr.ts \
                i18n/l-pdf_ur.ts \
                i18n/l-pdf_uk.ts \
                i18n/l-pdf_uz.ts \
                i18n/l-pdf_vi.ts \
                i18n/l-pdf_zh_CN.ts \
                i18n/l-pdf_zh_HK.ts \
                i18n/l-pdf_zh_TW.ts \
                i18n/l-pdf_zu.ts 

dotrans.path=$${L_SHAREDIR}/lumina-desktop/i18n/
dotrans.extra=cd $$PWD/i18n && $${LRELEASE} -nounfinished *.ts && cp *.qm $(INSTALL_ROOT)$${L_SHAREDIR}/lumina-desktop/i18n/

desktop.files=lumina-pdf.desktop
desktop.path=$${L_SHAREDIR}/applications/

INSTALLS += target desktop

WITH_I18N{
  INSTALLS += dotrans
}
