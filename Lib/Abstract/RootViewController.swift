//
//  Controller.swift
//  mvc
//
//  Created by Vladimir on 5/5/19.
//  Copyright © 2019 Volodymyr. All rights reserved.
//

import UIKit

public class RootViewController <Model, View, Assembly>: UIViewController, RootViewGettable
    where
    Model: LibMVC.RootModel,
    Assembly: LibMVC.RootAssembly, // ??? без нього відео працює
    Assembly == Model.Assembly,
    Assembly.Model == Model.Presentation,
    Assembly.View.Model == Model.Presentation

    
{
    
    
    // Mark: -
    // Mark: Subtypes
    
    public typealias RootViewType = Model.Assembly.View
    
    // MARK: -
    // MARK: Properties
    
    public let model: Model
    public var assembly: Model.Assembly {
        return self.model.assembly
    }
    public override var viewIfLoaded: UIView? {
            return self.view
    }
    
    // MARK: -
    // MARK: Init and Deinit
    
    public init (model: Model) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError() // we do not plan to use StoryBoard
    }
    
    // MARK: -
    // MARK: View Lifecycle
    
    open override func loadView() {
        self.view = self.assembly.view(model: self.model.presentation).view 
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }
    
    
    
    
    // MARK: -
    // MARK: Config
    
    open func configure() {
        self.rootView.do(self.configureBindings)
        self.configure(model: self.model.controler)
    }
    
    open func configure(model: Model.Controler) {
        
    }
    
    
    open func configureBindings(view: RootViewType) {
        
    }
    
}
