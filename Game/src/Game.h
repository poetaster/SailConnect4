#ifndef GAME_H
#define GAME_H

/* Game implementation headers */

#include <stdint.h>
#include <vector>

#include "../include/GameInterface.h"

class Game : public GameInterface {
	private:

	/* object to describe a board, given cols, rows and aligned
	 * once constructed, does not change.
	 */

	class BoardDescription {
		public:
		static const int nbPlayer = 2;
		int columns, rows, aligned;
		int nbCase, nbAlignement, nbCaseAlignement;
		std::vector<int> *alignementFromCase;

		BoardDescription(int rows, int columns, int aligned);
		~BoardDescription();

		// return the case id for alignement algntIndex, case number i
		inline int CaseFromAlignement(int algtIndex, int i);
		// return the adress of cases array for one alignement
		inline int* CaseArrayFromAlignement(int algtIndex);

		private:
		int *tabCaseFromAlignement;
	};

	class PlayerState {
		public:
		PlayerState(BoardDescription*);
		~PlayerState();
		void Reset();
		// play in an alignement
		void PlayAlignement(int algnt);
		bool LooseAlignement(int algnt);
		// revert play in alignement
		void RevertPlayAlignement(int algnt);
		void RevertLooseAlignement(int algnt, int previousNb);
		// status read
		inline int NbAlignementDone(int nbDone);
		inline int AlignementState(int algnt);
		bool HasWon();
		int* CaseArrayAligned();

		private:
		BoardDescription *boardDesc;
		// -1 if align is not possible, nb of cases done if possible
		int *alignementState;
		// number of align done 0, 1, 2, 3, 4
		int *nbAlignementDone;
		//
		int alignementCompleted;
	};

	class GameState {
		public:
		GameState(BoardDescription*);
		~GameState();
		void Reset();

		bool PlayAtIndex(int idx, int player);
		bool PlayPossibleAtIndex(int idx);
		bool IsEnded(int &winner, int* &caseAligned);

		private:
		int8_t *board;
		PlayerState **playerState;
		BoardDescription *boardDesc;
	};

	BoardDescription *boardDesc;
	GameState *gameState;
	int currentPlayer, nbPlayed;

	public:
	Game();
	~Game();

	// API funcs
	void NewGame();
	void ConfigSet(const ControllerInterface::Config &config);
	int IAPlay();
	bool IsEnded(int &winner, int* &caseAligned);
	bool PlayAtIndex(int index);
	bool PlayPossibleAtCol(int col, int &index);
	void SetIAForce(int force);
	void SetPlayer(int player);
};


#endif
