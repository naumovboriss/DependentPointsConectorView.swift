import SwiftUI

struct DependentPointsConectorView: View {
    
    @EnvironmentObject private var store: AppStore
    
    var body: some View {
        HStack {
            connectButton
            cancelButton
            disconnectButton
        }
        .buttonStyle(.plain)
        .opacity(store.state.selectedPointsIDs.isEmpty ? 0 : 1)
        .animation(.default, value: store.state.selectedPointsIDs)
