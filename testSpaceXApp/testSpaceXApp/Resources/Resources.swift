//
//  Resources.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 12.08.2022.
//

import UIKit

enum Resources {
    enum Colors {

        static let specialGray = UIColor(hexString: "#212121")
        static let specialLightGray = UIColor(hexString: "#8E8E8F")
        static let specialBackgroundGray = UIColor(hexString: "#121212")
        
    }
    
    enum SegmentedControl {
        static func items(for unit: String) -> UISegmentedControl {
            switch unit {
            case "mft":
                let segmentControl = UISegmentedControl(items: ["m", "ft"])
                segmentControl.selectedSegmentTintColor = .white
                segmentControl.selectedSegmentIndex = 0
                segmentControl.tintColor = Resources.Colors.specialBackgroundGray
                segmentControl.translatesAutoresizingMaskIntoConstraints = false
                return segmentControl
            case "kglb":
                let segmentControl = UISegmentedControl(items: ["kg", "kb"])
                segmentControl.selectedSegmentTintColor = .white
                segmentControl.selectedSegmentIndex = 0
                segmentControl.tintColor = Resources.Colors.specialBackgroundGray
                segmentControl.translatesAutoresizingMaskIntoConstraints = false
                return segmentControl
            default:
                return UISegmentedControl(items: nil)
            }
            
        }
        
    }

//    enum Strings {
//        enum TabBar {
//            static func title(for tab: Tabs) -> String {
//                switch tab {
//                case .overview: return "Overview"
//                case .session: return "Session"
//                case .progress: return "Progress"
//                case .settings: return "Settings"
//                }
//            }
//        }
//
//        enum NavBar {
//            static let overview = "Today"
//            static let session = "High Intensity Cardio"
//            static let progress = "Workout Progress"
//            static let settings = "Settings"
//        }
//
//        enum Overview {
//            static let allWorcoutsButton = "All Workouts"
//        }
//
//        enum Session {
//            static let navBarStart = "Start"
//            static let navBarPause = "Pause"
//            static let navBarFinish = "Finish"
//
//            static let elapsedTime = "Elapsed Time"
//            static let remainingTime = "Remaining Time"
//        }
//
//        enum Progress {
//            static let navBarLeft = "Export"
//            static let navBarRight = "Details"
//        }
//
//        enum Settings {}
//    }
//
//    enum Images {
//        enum TabBar {
//            static func icon(for tab: Tabs) -> UIImage? {
//                switch tab {
//                case .overview: return UIImage(named: "overview_tab")
//                case .session: return UIImage(named: "session_tab")
//                case .progress: return UIImage(named: "progress_tab")
//                case .settings: return UIImage(named: "settings_tab")
//                }
//            }
//        }
//
//        enum Common {
//            static let downArrow = UIImage(named: "down_arrow")
//            static let add = UIImage(named: "add_button")
//        }
//    }
//
//    enum Fonts {
//        static func helvelticaRegular(with size: CGFloat) -> UIFont {
//            UIFont(name: "Helvetica", size: size) ?? UIFont()
//        }
//    }
}
