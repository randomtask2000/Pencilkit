import SwiftUI
import PencilKit
import Combine

struct PKCanvasRepresentation: UIViewRepresentable {
    var observable: CurrentValueSubject<Data?, Never>
    var canvas = PKCanvasView()
    var data: Data?

    func makeUIView(context: Context) -> PKCanvasView {
        let toolpicker = PKToolPicker.shared(for: UIApplication.mainWindow)
        toolpicker?.addObserver(canvas)
        toolpicker?.setVisible(true, forFirstResponder: canvas)
        canvas.becomeFirstResponder()
        canvas.delegate = context.coordinator
        if let data = data {
            if let drawing = try? PKDrawing(data: data) {
                canvas.drawing = drawing
            }
        }
        canvas.isScrollEnabled = true
        return canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
    
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, PKCanvasViewDelegate {
        var control: PKCanvasRepresentation

        init(_ control: PKCanvasRepresentation) {
            self.control = control
        }
        
        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            self.control.observable.send(self.control.canvas.drawing.dataRepresentation())
        }
    }
}


