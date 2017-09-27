//
//  SCPageControlView.swift
//  Pods
//
//  Created by Myoung on 2017. 4. 17..
//
//

import UIKit

@IBDesignable public class SCPageControlView: UIView {
    
    public enum SCPageStyle: Int {
        case SCNormal = 100
        case SCJAMoveCircle // Design by Jardson Almeida
        case SCJAFillCircle // Design by Jardson Almeida
        case SCJAFlatBar // Design by Jardson Almeida
        
    }
    
    public var scp_style: SCPageStyle = .SCNormal
    
    var numberOfPage: Int = 0, currentOfPage: Int = 0
    var f_start_point: CGFloat = 0.0, f_start: CGFloat = 0.0
    
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)!
    }
    
    public override init(frame:CGRect) {
        super.init(frame:frame)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //MARK: ## view init method ##
    public func set_view(_ page: Int, current: Int, tint_color: UIColor) {        
        switch scp_style {
        case .SCJAMoveCircle:
            let scp_scjamovecircle = SCP_SCJAMoveCircle(frame: self.bounds)
            scp_scjamovecircle.tag = scp_style.rawValue
            scp_scjamovecircle.set_view(page, current: current, tint_color: tint_color)
            self.addSubview(scp_scjamovecircle)
        case .SCJAFillCircle:
            let scp_scjafillcircle = SCP_SCJAFillCircle(frame: self.bounds)
            scp_scjafillcircle.tag = scp_style.rawValue
            scp_scjafillcircle.set_view(page, current: current, tint_color: tint_color)
            self.addSubview(scp_scjafillcircle)
        case .SCJAFlatBar:
            let scp_scjaflatbar = SCP_SCJAFlatBar(frame: self.bounds)
            scp_scjaflatbar.tag = scp_style.rawValue
            scp_scjaflatbar.set_view(page, current: current, tint_color: tint_color)
            self.addSubview(scp_scjaflatbar)
        default: //.SCNormal
            let scp_normal = SCP_SCNormal(frame: self.bounds)
            scp_normal.tag = scp_style.rawValue
            scp_normal.set_view(page, current: current, tint_color: tint_color)
            self.addSubview(scp_normal)
        }
    }
    
    //MARK: ## Call the moment in rotate Device ##
    public func set_rotateDevice() {        
        switch scp_style {
        case .SCJAMoveCircle:
            let scp_scjamovecircle = self.viewWithTag(scp_style.rawValue) as! SCP_SCJAMoveCircle
            scp_scjamovecircle.set_rotateDevice(self.bounds)
        case .SCJAFillCircle:
            let scp_scjafillcircle = self.viewWithTag(scp_style.rawValue) as! SCP_SCJAFillCircle
            scp_scjafillcircle.set_rotateDevice(self.bounds)
        case .SCJAFlatBar:
            let scp_scjaflatbar = self.viewWithTag(scp_style.rawValue) as! SCP_SCJAFlatBar
            scp_scjaflatbar.set_rotateDevice(self.bounds)
        default: //.SCNormal
            let scp_normal = self.viewWithTag(scp_style.rawValue) as! SCP_SCNormal
            scp_normal.set_rotateDevice(self.bounds)
        }
    }
    
    //MARK: ## ScrollView move method ##
    open func scroll_did(_ scrollView: UIScrollView) {
        switch scp_style {
        case .SCJAMoveCircle:
            if let scp: SCP_SCJAMoveCircle = self.viewWithTag(scp_style.rawValue) as? SCP_SCJAMoveCircle {
                scp.scroll_did(scrollView)
            }
        case .SCJAFillCircle:
            if let scp: SCP_SCJAFillCircle = self.viewWithTag(scp_style.rawValue) as? SCP_SCJAFillCircle {
                scp.scroll_did(scrollView)
            }
        case .SCJAFlatBar:
            if let scp: SCP_SCJAFlatBar = self.viewWithTag(scp_style.rawValue) as? SCP_SCJAFlatBar {
                scp.scroll_did(scrollView)
            }
        default: //.SCNormal
            if let scp: SCP_SCNormal = self.viewWithTag(scp_style.rawValue) as? SCP_SCNormal {
                scp.scroll_did(scrollView)
            }            
        }
    }    
}
