# frozen_string_literal: true

class TaskMailer < ApplicationMailer
  default from: ENV['SEND_EMAIL_ADDRESS']

  def creation_email(task)
    @task = task
    mail(
      subject: 'タスク作成完了メール',
      to: ENV['USER_EMAIL_ADDRESS'],
      from: ENV['SEND_EMAIL_ADDRESS']
    )
  end
end
