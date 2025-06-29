//
//  SwiftUILifecycle.swift
//  MileTaskComponent
//
//  Created by asani on 28/06/25.
//

import SwiftUI

private struct ViewDidLoadModifier: ViewModifier {
    @State private var viewDidLoad = false
    let action: (() -> Void)?

    public func body(content: Content) -> some View {
        content
            .onAppear {
                if viewDidLoad == false {
                    viewDidLoad = true
                    action?()
                }
            }
    }
}

private struct UIKitWillAppear: UIViewControllerRepresentable {
    let action: (() -> Void)?

    func makeUIViewController(context: Context) -> Controller {
      let vc = Controller()
      vc.action = action
      return vc
    }

    func updateUIViewController(_ controller: Controller, context: Context) {}

    class Controller: UIViewController {
        var action: (() -> Void)? = nil

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            action?()
        }
    }
}

private struct UIKitWillDisappear: UIViewControllerRepresentable {
    let action: (() -> Void)?

    func makeUIViewController(context: Context) -> Controller {
      let vc = Controller()
      vc.action = action
      return vc
    }

    func updateUIViewController(_ controller: Controller, context: Context) {}

    class Controller: UIViewController {
        var action: (() -> Void)? = nil

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            action?()
        }
    }
}

private struct UIKitDidLoad: UIViewControllerRepresentable {
    let action: (() -> Void)?

    func makeUIViewController(context: Context) -> Controller {
      let vc = Controller()
      vc.action = action
      return vc
    }

    func updateUIViewController(_ controller: Controller, context: Context) {}

    class Controller: UIViewController {
        var action: (() -> Void)? = nil

        override func viewDidLoad() {
            super.viewDidLoad()
            action?()
        }
    }
}

public extension View {
    func onViewDidLoad(perform action: (() -> Void)? = nil) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
    func onUIKitWillAppear(perform action: (() -> Void)? = nil ) -> some View {
      self.overlay(UIKitWillAppear(action: action).disabled(true))
    }
    func onUIKitWillDisappear(perform action: (() -> Void)? = nil ) -> some View {
      self.overlay(UIKitWillDisappear(action: action).disabled(true))
    }
    func onUIKitViewDidLoad(perform action: (() -> Void)? = nil) -> some View {
        self.overlay(UIKitDidLoad(action: action).disabled(true))
    }
}
