
/* UI derivated for Sailfish */

#include <sailfishapp.h>
#include "UISailfish.h"

UISailfish::UISailfish(int &argc, char* argv[])
{
	qDebug() << "ui: init UISailfish";
	app = SailfishApp::application(argc, argv);

	translator = new QTranslator();
	if (translator->load(":/langs/Connect4_" + QLocale::system().name())) {
		qDebug() << "ui: load translation for lang " << QLocale::system().name();
		app->installTranslator(translator);
	}

	view = SailfishApp::createView();
	view->setSource(QUrl("qrc:///qml/sailfish/Sailfish.qml"));

	main = view->rootObject();
	if (!main) {
		qDebug() << "ui error: main is NULL";
		return;
	}
	PostInit();
}

void UISailfish::Launch()
{
	qDebug() << "ui: Launch";
	view->showFullScreen();
//	view->setTitle(config->property("programTitle").toString());
}

void UISailfish::SlotPause(const QVariant &pause)
{
	qDebug() << "ui: SlotPause " << pause;
	controller->Pause(pause.toBool());
}
