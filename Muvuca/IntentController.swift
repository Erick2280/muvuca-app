//
//  IntentController.swift
//  Muvuca
//
//  Created by Erick Almeida on 09/02/21.
//

import IntentsUI
import UIKit

class IntentController : UIViewController, INUIAddVoiceShortcutViewControllerDelegate{

    private var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = INUIAddVoiceShortcutButton(style: .black)
        button.shortcut = INShortcut(intent: ViewBlocksIntent())
        
        self.view.addSubview(button)
        view.topAnchor.constraint(equalTo: button.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: button.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: button.rightAnchor).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addToSiri), for: .touchUpInside)
    }


    @objc func addToSiri() {
           //add Intent
        let suggestedPhrase = "Cadê o bloco"
        let intent = ViewBlocksIntent()

        intent.suggestedInvocationPhrase = suggestedPhrase
        if let shortcut = INShortcut(intent: intent) {

            let viewController = INUIAddVoiceShortcutViewController(shortcut: shortcut)

            viewController.modalPresentationStyle = .formSheet
            viewController.delegate = self // Object conforming to `INUIAddVoiceShortcutViewControllerDelegate`.
            present(viewController, animated: true, completion: nil)

        }

    }

    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true) {

        }
    }

    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }


}

extension IntentController: INUIEditVoiceShortcutViewControllerDelegate {
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didUpdate voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didDeleteVoiceShortcutWithIdentifier deletedVoiceShortcutIdentifier: UUID) {
        controller.dismiss(animated: true, completion: nil)
    }

    func editVoiceShortcutViewControllerDidCancel(_ controller: INUIEditVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }

    func present(_ addVoiceShortcutViewController: INUIAddVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        addVoiceShortcutViewController.delegate = self
        addVoiceShortcutViewController.modalPresentationStyle = .formSheet
        present(addVoiceShortcutViewController, animated: true, completion: nil)
    }

    func present(_ editVoiceShortcutViewController: INUIEditVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        editVoiceShortcutViewController.delegate = self
        editVoiceShortcutViewController.modalPresentationStyle = .formSheet
        present(editVoiceShortcutViewController, animated: true, completion: nil)
    }


}
