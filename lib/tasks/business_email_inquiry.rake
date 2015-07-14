# BusinessEmailEnquiry Rake Task:: Rake task to send business enquiry mails & fetching the auto-response.
# 
# Author::    Janmejay Rai (mailto: janmejay.rai31@gmail.com)
# Copyright:: Subco Devs
# License::   Without a license, the code is copyrighted by default. People can read the code, but they have no legal right to use it. To use the code, you must contact the author directly and ask permission.

namespace :business_email_enquiry do

	desc "Send automated emails business enquiry email."
	task :send_enquiry => :environment do
		puts "------ Starting the rake task -------"
		puts ""
		t1 = Time.now

		BusinessEnquiry.send_business_enquiry

		t2 = Time.now
		puts ""
		puts "------ Finished the task ---------"
		puts "------ Total time taken to run the task: #{t2-t1} seconds -------"
	end

	desc "Fetch the auto-response from the mails."
	task :fetch_mails,[:date, :user_name, :password] => :environment do |t, args|
		puts "------ Starting the rake task -------"
		puts ""
		t1 = Time.now

		BusinessEnquiry.fetch_email(args[:date], args[:user_name], args[:password])

		t2 = Time.now
		puts ""
		puts "------ Finished the task ---------"
		puts "------ Total time taken to run the task: #{t2-t1} seconds -------"
	end

	desc "Downloading the data."
	task :download_data => :environment do
		puts "------ Starting the rake task -------"
		puts ""
		t1 = Time.now

		BusinessEnquiry.download_enquiry_data

		t2 = Time.now
		puts ""
		puts "------ Finished the task ---------"
		puts "------ Total time taken to run the task: #{t2-t1} seconds -------"
	end
end