// Laplacian Pyramid Reconstruction
    
import Cocoa

let ctx = CIContext(options: nil)

let img = NSImage(named: "Zebra")

let cimg = CIImage(data: img!.TIFFRepresentation!)

let lowPass = CIFilter(name: "CIGaussianBlur", withInputParameters: [kCIInputImageKey: cimg!, kCIInputRadiusKey: 5])

let highPass = CIFilter(name: "CISubtractBlendMode", withInputParameters: [kCIInputImageKey: cimg!, kCIInputBackgroundImageKey: lowPass!.outputImage!])

let reconstructed = CIFilter(name: "CIAdditionCompositing", withInputParameters: [kCIInputImageKey: lowPass!.outputImage!, kCIInputBackgroundImageKey: highPass!.outputImage!])

let lowPassImg = NSImage(CGImage: ctx.createCGImage((lowPass?.outputImage)!, fromRect: (lowPass?.outputImage?.extent)!), size: (lowPass?.outputImage?.extent.size)!)

let highPassImg = NSImage(CGImage: ctx.createCGImage((highPass?.outputImage)!, fromRect: (highPass?.outputImage?.extent)!), size: (highPass?.outputImage?.extent.size)!)

let reconstructedImage = NSImage(CGImage: ctx.createCGImage((reconstructed?.outputImage)!, fromRect: (reconstructed?.outputImage?.extent)!), size: (reconstructed?.outputImage?.extent.size)!)
