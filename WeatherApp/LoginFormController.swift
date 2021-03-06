//
//  LoginFormController.swift
//  WeatherApp
//
//  Created by murad on 24.09.2018.
//  Copyright © 2018 Murad. All rights reserved.
//

import UIKit

class LoginFormController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        //присваиваем его UIScrollView
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector:#selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object:nil)
        //Второе - когда она пропадает
        NotificationCenter.default.addObserver(self, selector:#selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object:nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //отписываемся от уведомлений
        NotificationCenter.default.removeObserver (self, name: UIResponder.keyboardWillShowNotification, object:nil)
        NotificationCenter.default.removeObserver (self, name: UIResponder.keyboardWillHideNotification, object:nil)
    }
    
    //клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //исчезновение клавиатуры при клике по пустому месту
    @objc func  hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkResult = checkUserData()
        
        if !checkResult {
            showLoginError()
        }
        return checkResult
    }
    
    func checkUserData() -> Bool {
        //получаем текст пароль
        guard let login = loginInput.text, let password = passwordInput.text else {
            print("Ошибка")
            return false
        }
        
        //  проверяем  верны  ли  они
        if login  == "admin" && password == "123456" {
            print("Успешная авторизация")
            return true
        } else {
            print("Неуспешная авторизация")
            return false
        }
    }
    
    func showLoginError() {
        //Создаем контроллер
        let alter = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        //Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler:nil)
        //Добавляем кнопку на UIAlertController
        alter.addAction(action)
        //Показываем UIAlertController
        present(alter, animated: true, completion: nil)
    }
}
