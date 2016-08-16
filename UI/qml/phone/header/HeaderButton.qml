/* Copyright 2015 (C) Louis-Joseph Fournier 
 * louisjoseph.fournier@gmail.com
 *
 * This file is part of SailConnect4.
 *
 * SailConnect4 is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * SailConnect4 is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */

import QtQuick 2.0

import ".."

/**
 * Header button can be a text or icon (but not both)
 * It is clickable
 */

Rectangle {
	property string text
	property string icon

	signal triggered()

	height: parent.height
	property bool activated: false
	property bool timer_deactivate: true // unset if client deactivate button

	color: activated ? Style.header_bg_color_activated : Style.header_bg_color

	Image {
		visible: icon
		source: icon
		height: parent.height
		width: height
	}

	Text {
		visible: text
		text: parent.text
		anchors.verticalCenter: parent.verticalCenter
		anchors.horizontalCenter: parent.horizontalCenter

		font.pixelSize: parent.height * 0.4
		color: Style.header_font_color
	}

	MouseArea {
		anchors.fill: parent
		onClicked: {
			if (timer_deactivate)
				activated = true

			triggered()

			if (timer_deactivate)
				timer.start()
		}
	}

	Timer {
		id: timer
		repeat: false
		interval: Style.menu_activated_ms
		running: false
		onTriggered: { activated = false }
	}
}