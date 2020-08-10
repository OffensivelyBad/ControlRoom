//
//  AppDelegate.swift
//  ControlRoom
//
//  Created by Paul Hudson on 12/02/2020.
//  Copyright © 2020 Paul Hudson. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    lazy var mainWindow: MainWindowController = MainWindowController()
    var statusItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        setupMenu()
        mainWindow.showWindow(self)
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }

    @IBAction func orderFrontStandardAboutPanel(_ sender: Any?) {
        let authors = Bundle.main.authors
        if authors.isNotEmpty {
            let content = NSViewController()
            content.title = "Control Room"
            let view = NSHostingView(rootView: AboutView(authors: authors))
            view.frame.size = view.fittingSize
            content.view = view
            let panel = NSPanel(contentViewController: content)
            panel.styleMask = [.closable, .titled]
            panel.orderFront(sender)
            panel.makeKey()
        } else {
            NSApp.orderFrontStandardAboutPanel(sender)
        }
    }
    
    func setupMenu() {
        let statusBar = NSStatusBar.system
        statusItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)
        statusItem.button?.title = "⚙️"
        
        let menu = NSMenu(title: "Control Room")
        statusItem.menu = menu
        
        let testItem = NSMenuItem(title: "Test me!", action: #selector(AppDelegate.testMenu), keyEquivalent: "")
        menu.addItem(testItem)
    }
    
    @objc func testMenu() {
        print("testing123!!!")
    }

}
