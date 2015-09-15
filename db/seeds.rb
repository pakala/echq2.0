# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
customers = Customer.create([
	{ cust_name: 'Clark Kent'},
	{ cust_name: 'Hal Jordan'},
	{ cust_name: 'Adam Kubert'}
	])

recipient = Recipient.create([
	{recipient_name: 'Bruce Wayne', customer: customers.first}, 
	{recipient_name: 'Peter Parker', customer: customers.first}, 
	{recipient_name: 'Tony Stark', customer: customers.first}, 
	{recipient_name: 'Bruce Banner', customer: customers.first},
	{recipient_name: 'Charles Xavier', customer: customers.first}
	])

