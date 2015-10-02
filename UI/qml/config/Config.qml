pragma Singleton
import QtQuick 2.0
import "."

QtObject {
	property string programTitle: DefaultConfig.programTitle
	property int rows: DefaultConfig.rows
	property int columns: DefaultConfig.columns

	property string player1_name: DefaultConfig.player1_name
	property string player2_name: DefaultConfig.player2_name

	property double player1_force: DefaultConfig.player1_force
	property double player2_force: DefaultConfig.player2_force
}