<?php

include_once("dbconnect.php");

$Email = $_POST['email'];
$Password = $_POST['password'];

$sqlregister = "INSERT INTO register(Email,Password) VALUES('$Email','$Password')";
if ($conn->query($sqlregister) === TRUE){
    echo "success";
    sendEmail($otp,$user_email);
}else{
    echo "failed";
}

function sendEmail($otp,$user_email){
    $mail = new PHPMailer(true);
    $mail->SMTPDebug = 0;                                               //Disable verbose debug output
    $mail->isSMTP();                                                    //Send using SMTP
    $mail->Host       = 'mail.slumberjer.com';                          //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                           //Enable SMTP authentication
    $mail->Username   = 'touringholic@slumberjer.com';                  //SMTP username
    $mail->Password   = 'T0MizfNmCddW';                                 //SMTP password
    $mail->SMTPSecure = 'tls';         
    $mail->Port       = 587;
    
    $from = "touringholic@slumberjer.com";
    $to = $user_email;
    $subject = "From TouringHolic. Please Verify your account";
    $message = "<p>Click the following link to verify your account<br><br><a href='https://slumberjer.com/touringholic/php/verify_account.php?email=".$user_email."&key=".$otp."'>Click Here</a>";
    
    $mail->setFrom($from,"TouringHolic");
    $mail->addAddress($to);                                             //Add a recipient
    
    //Content
    $mail->isHTML(true);                                                //Set email format to HTML
    $mail->Subject = $subject;
    $mail->Body    = $message;
    $mail->send();
}




?>