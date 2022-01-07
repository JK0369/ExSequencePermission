//
//  ViewController.swift
//  ExSequencePermission
//
//  Created by Jake.K on 2022/01/06.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  private let disposeBag = DisposeBag()
  
  @IBAction func didTapButton(_ sender: Any) {
    Observable.concat(
      LocationPermissionManager.shared.requestLocation().map { _ in Void() },
      PhotoPermissionManager.shared.requestPhoto().map { _ in Void() },
      CameraPermissionManager.shared.requestCamera().map { _ in Void() },
      MicPermissionManager.shared.requestMic().map { _ in Void() },
      ATTPermissionManager.shared.requestATT().map { _ in Void() }
    )
      .bind(onNext: { print("finish") })
      .disposed(by: self.disposeBag)
  }
}
