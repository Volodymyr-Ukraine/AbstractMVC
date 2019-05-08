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
    View: RootView<Model.Presentation>,
    Assembly: LibMVC.RootAssembly,
    Assembly.View: View,
    Assembly.Model == Model.Presentation
{
    // Mark: -
    // Mark: Subtypes
    
    public typealias RootViewType = View
    
    // MARK: -
    // MARK: Properties
    
    public let model: Model
    public let assembly: Assembly
    
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
        self.rootView = self.model.assembly.view(model: self.model.presentation)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }
    
    // MARK: -
    // MARK: Config
    
    open func configure() {
        self.rootView.do(self.cofigureBindings)
        self.configure(model: self.model.controler)
    }
    
    open func configure(model: Model.Controler) {
        
    }
    
    
    open func cofigureBindings(view: RootViewType) {
        
    }
    
}