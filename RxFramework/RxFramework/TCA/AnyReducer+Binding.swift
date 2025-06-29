//
//  Binding.swift
//  RxFramework
//
//  Created by Ajaib on 23/03/21.
//


extension AnyReducer {
    /// Returns a reducer that applies `BindingAction` mutations to `State` before running this
    /// reducer's logic.
    ///
    /// For example, a settings screen may gather its binding actions into a single `BindingAction`
    /// case:
    ///
    ///     enum SettingsAction {
    ///       ...
    ///       case binding(BindingAction<SettingsState>)
    ///     }
    ///
    /// The reducer can then be enhanced to automatically handle these mutations for you by tacking on
    /// the `binding` method:
    ///
    ///     let settingsReducer = Reducer<SettingsState, SettingsAction, SettingsEnvironment {
    ///       ...
    ///     }
    ///     .binding(action: /SettingsAction.binding)
    ///
    /// - Parameter toBindingAction: A case path from this reducer's `Action` type to a
    ///   `BindingAction` over this reducer's `State`.
    /// - Returns: A reducer that applies `BindingAction` mutations to `State` before running this
    ///   reducer's logic.
    public func binding(action toBindingAction: CasePath<Action, BindingAction<State>>) -> Self {
        Self { state, action, _ in
            toBindingAction.extract(from: action)?.set(&state)
            return .none
        }
        .combined(with: self)
    }
}
