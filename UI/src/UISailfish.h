#ifndef UISAILFISH_H
#define UISAILFISH_H

#include "UI.h"

class UISailfish : public UI {
	private:
	void SlotPause(const QVariant &pause);

	public:
	UISailfish(int &argc, char *argv[]);
	void Launch();
};

#endif
