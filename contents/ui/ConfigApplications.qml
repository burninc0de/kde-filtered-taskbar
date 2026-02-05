/*
    SPDX-FileCopyrightText: 2024 KDE Community

    SPDX-License-Identifier: GPL-2.0-or-later
*/

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kcmutils as KCMUtils
import org.kde.kirigami as Kirigami
import org.kde.plasma.plasmoid

KCMUtils.SimpleKCM {
    property alias cfg_allowedApplications: applicationList.text

    // Dummy properties for compatibility with stock task manager config
    property string cfg_allowedApplicationsDefault: ""
    property string cfg_customFocusColor: ""
    property bool cfg_customFocusColorEnabled: false
    property string cfg_customFocusColorDefault: ""
    property bool cfg_customFocusColorEnabledDefault: false
    property string cfg_customInactiveColor: ""
    property bool cfg_customInactiveColorEnabled: false
    property string cfg_customInactiveColorDefault: ""
    property bool cfg_customInactiveColorEnabledDefault: false
    property bool cfg_fill: false
    property bool cfg_fillDefault: false
    property bool cfg_forceStripes: false
    property bool cfg_forceStripesDefault: false
    property bool cfg_groupPopups: false
    property bool cfg_groupPopupsDefault: false
    property int cfg_groupedTaskVisualization: 0
    property int cfg_groupedTaskVisualizationDefault: 0
    property string cfg_groupingAppIdBlacklist: ""
    property string cfg_groupingAppIdBlacklistDefault: ""
    property string cfg_groupingLauncherUrlBlacklist: ""
    property string cfg_groupingLauncherUrlBlacklistDefault: ""
    property int cfg_groupingStrategy: 0
    property int cfg_groupingStrategyDefault: 0
    property bool cfg_hideLauncherOnStart: false
    property bool cfg_hideLauncherOnStartDefault: false
    property bool cfg_highlightWindows: false
    property bool cfg_highlightWindowsDefault: false
    property int cfg_iconSpacing: 0
    property int cfg_iconSpacingDefault: 0
    property bool cfg_indicateAudioStreams: false
    property bool cfg_indicateAudioStreamsDefault: false
    property bool cfg_interactiveMute: false
    property bool cfg_interactiveMuteDefault: false
    property string cfg_launchers: ""
    property string cfg_launchersDefault: ""
    property int cfg_maxStripes: 1
    property int cfg_maxStripesDefault: 1
    property int cfg_maxTextLines: 1
    property int cfg_maxTextLinesDefault: 1
    property int cfg_middleClickAction: 0
    property int cfg_middleClickActionDefault: 0
    property bool cfg_minimizeActiveTaskOnClick: false
    property bool cfg_minimizeActiveTaskOnClickDefault: false
    property bool cfg_onlyGroupWhenFull: false
    property bool cfg_onlyGroupWhenFullDefault: false
    property bool cfg_reverseMode: false
    property bool cfg_reverseModeDefault: false
    property bool cfg_separateLaunchers: false
    property bool cfg_separateLaunchersDefault: false
    property bool cfg_showCloseButtonOnHover: false
    property bool cfg_showCloseButtonOnHoverDefault: false
    property bool cfg_showOnlyCurrentActivity: false
    property bool cfg_showOnlyCurrentActivityDefault: false
    property bool cfg_showOnlyCurrentDesktop: false
    property bool cfg_showOnlyCurrentDesktopDefault: false
    property bool cfg_showOnlyCurrentScreen: false
    property bool cfg_showOnlyCurrentScreenDefault: false
    property bool cfg_showOnlyMinimized: false
    property bool cfg_showOnlyMinimizedDefault: false
    property bool cfg_showToolTips: false
    property bool cfg_showToolTipsDefault: false
    property int cfg_sortingStrategy: 0
    property int cfg_sortingStrategyDefault: 0
    property int cfg_taskHoverEffect: 0
    property int cfg_taskHoverEffectDefault: 0
    property int cfg_taskMaxWidth: 0
    property int cfg_taskMaxWidthDefault: 0
    property int cfg_tooltipControls: 0
    property int cfg_tooltipControlsDefault: 0
    property bool cfg_unhideOnAttention: false
    property bool cfg_unhideOnAttentionDefault: false
    property bool cfg_wheelEnabled: false
    property bool cfg_wheelEnabledDefault: false
    property bool cfg_wheelSkipMinimized: false
    property bool cfg_wheelSkipMinimizedDefault: false

    Kirigami.FormLayout {
        QQC2.TextField {
            id: applicationList

            Kirigami.FormData.label: i18n("Allowed Applications:")
            placeholderText: i18n("zeditor,kitty (no quotes needed)")
        }

        QQC2.Label {
            text: i18n("Enter application IDs or names separated by commas. Leave empty to show all applications.\n\nDo not include quotes - just the app names or IDs.\n\nExamples:\n• 'zeditor,kitty' for specific editors\n• 'firefox,chromium' for web browsers\n• 'code,firefox,zed,kitty' for development apps")
            wrapMode: Text.WordWrap
            font: Kirigami.Theme.smallFont
        }

    }

}
