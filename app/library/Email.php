<?php
namespace App\Libraries;

class Email extends \App\Controllers\ControllerBase
{
    // Example:
     // $sender = new Email();
     //    $sender->sendMessage([
     //        'subject' => 'ASunto',
     //        'to_email' => 'rickysotosanchezz@gmail.com',
     //        'message' => $this->di->getViewSimple()->render('emails/view_report')
     //    ]);

    /**
     * Envia mensaje a partir de data suministrada
     *
     * @param array $data
     */
    public function sendMessage($data)
    {
        #CONFIGURING
        $mail = $this->config->mail;

        $transport = \Swift_SmtpTransport::newInstance($mail->smtp->server, $mail->smtp->port, $mail->smtp->security)
            ->setUsername($mail->smtp->username)
            ->setPassword($mail->smtp->password);

        $mailer = \Swift_Mailer::newInstance($transport);

        $message = \Swift_Message::newInstance()
            ->setSubject($data['subject'])
            ->setFrom(array($mail->fromEmail => $mail->fromName))
            ->setTo(array($data['to_email']))
            // ->setBcc([ 'bbcEmail' => 'Name'])
            ->addPart($data['message'], 'text/html');

        $result = $mailer->send($message);

    }
}