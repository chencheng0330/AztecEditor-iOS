import UIKit


/// Returns a specialised representation for a `<figure>` element.
///
class FigureElementConverter: ElementConverter {
    
    // MARK: - ElementConverter
    
    func convert(
        _ element: ElementNode,
        inheriting attributes: [NSAttributedStringKey: Any],
        contentSerializer serialize: ContentSerializer) -> NSAttributedString {
       
        precondition(element.type == .figure)
       
        let attributes = self.attributes(for: element, inheriting: attributes)
        
        return serialize(element, attributes)
    }
    
    private func attributes(for element: ElementNode, inheriting attributes: [NSAttributedStringKey: Any]) -> [NSAttributedStringKey: Any] {
        let elementRepresentation = HTMLElementRepresentation(element)
        let representation = HTMLRepresentation(for: .element(elementRepresentation))
        
        let paragraphStyle = attributes.paragraphStyle()
        paragraphStyle.appendProperty(Figure(with: representation))
        
        var finalAttributes = attributes
        finalAttributes[.paragraphStyle] = paragraphStyle
        return finalAttributes
    }
}
