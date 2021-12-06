# Computer service 

# About

This documentation describes the process of designing a database for the computer service, that is a company offering repairs of mobile devices and computers. 

# Data requirements

The **Computer Service** has a name, founding date and an owner. It runs **offices** at different locations. Offices have **employees** assigned to it. An employee may be a manager or a repairman. In the latter case, he may specialize in mobile devices, computers, or both. In the database, the information about the salary of each employee is stored.

The database stores **orders** which are made by the clients and consist of **devices** that are repaired now, or were repaired in the past. There is a repairman responsible for an order. Moreover, the status of each order is stored, which can be not started, in progress or completed.

To have the device repaired, the **client** needs to provide his name, phone number and email and if he wants the repaired device to be delivered to him, also the address. 

# User views

* manager
  * has access to all the data
* repairman 
  * has access to all the orders and client data
  * sees only the name and surname of other employees 

# Operations on data

## Computer service
* modify information about the entire company

## Offices
* add / remove an office
* modify name and address

## Employees
* add / remove an employee
* modify personal data
* modify specialization (for repairman only: mobile device, computer)
* modify role (manager, repairman)
* modify salary and account number
* assign employees to offices
* assign employees to orders



## Orders
* add / remove an order
* modify order status (not started, in progress, completed)
* modify an estimated date to hand out and an order date
* assign a client to an order
* assing a device to an order 
* assign an employee who will do the order

## Clients
* add / remove a client
* modify personal data
* if a client has at least one repair with status 'Not started' or 'In progress', his data can't be deleted