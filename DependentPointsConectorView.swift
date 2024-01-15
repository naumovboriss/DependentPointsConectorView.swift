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
    }
    
    private var disconnectButton: some View {
        Button {
            store.dispatch(.changeCollage(.disconnectControlPoints(pointsIds)))
            store.dispatch(.removeSelectedPoints)
        } label: {
            createButtonBody(with: "Disconnect")
        }
    }
    
    private var connectButton: some View {
        Button {
            store.dispatch(.changeCollage(.connectControlPoints(pointsIds)))
            store.dispatch(.removeSelectedPoints)
        } label: {
            createButtonBody(with: "Connect")
        }
    }
    
    private var cancelButton: some View {
        Button {
            store.dispatch(.removeSelectedPoints)
        } label: {
            createButtonBody(with: "Cancel")
        }
    }
