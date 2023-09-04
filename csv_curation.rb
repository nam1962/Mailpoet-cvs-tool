require 'csv'

# Load the curated list of emails
curated_emails = File.readlines('curated_emails.txt').map(&:strip)

# Open the original CSV file and a new CSV file for writing
CSV.open('cleaned_customers.csv', 'wb') do |csv|
  # Read the original CSV file
  CSV.foreach('original_customers.csv', headers: true) do |row|
    # If the email is in the curated list, write the row to the new CSV file
    csv << row if curated_emails.include?(row['email'])
  end
end
