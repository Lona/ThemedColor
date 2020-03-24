import AppKit

extension NSColor {
    public static func themed(color: @escaping @autoclosure () -> NSColor) -> NSColor {
        if #available(OSX 10.15, *) {
            // 10.15 lets us update a color dynamically based on current theme
            return self.init(name: nil, dynamicProvider: { appearance in
                return color()
            })
        } else {
            return color()
        }
    }

    public static func themed(
        light lightColor: @escaping @autoclosure () -> NSColor,
        dark darkColor: @escaping @autoclosure () -> NSColor
    ) -> NSColor {
        if #available(OSX 10.15, *) {
            // 10.15 lets us update a color dynamically based on current theme
            return self.init(name: nil, dynamicProvider: { appearance in
                switch appearance.bestMatch(from: [.aqua, .darkAqua]) {
                case .some(.darkAqua):
                    return darkColor()
                default:
                    return lightColor()
                }
            })
        } else if #available(OSX 10.14, *) {
            // In 10.14 we can set a color once based on app theme
            switch NSApp.effectiveAppearance.bestMatch(from: [.aqua, .darkAqua]) {
            case .some(.darkAqua):
                return darkColor()
            default:
                return lightColor()
            }
        } else {
            return lightColor()
        }
    }
}
