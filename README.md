# Computer service 

# Introduction

The computer service database is designed for a company offering repairs of electronical devices such as computers, smartphones, and tablets. This company may have many **offices**. 

It stores information about **devices** that are repaired now, or were repaired in the past, as well as the clients of the service. For each order, there is a person, that is responsible for it. The service has **employees**, that is managers and repairmen. The latter specialize in different domains, some in repairing computers, some in smartphones and some in tablets. In the database, the information about the salary of each employee is stored. Moreover, the service stores a status of each of the **Order**, which can be not started, in progress or completed.

Each **client** may pay an extra fee, to speed up the process of the service. To have the device repaired, the client needs to provide his name, phone and email and if he wants the repaired device to be delivered to him, also the address. 

# User views

* manager - has access to all the data
* repairman - has access to all the orders and customer data, (doesn't see information about other employees salary)

# Operations on data

## Employees
* add / remove an employee
* modify personal data
* modify role (manager or repairman)
* modify specialization (only for repairman; laptop, smartphone, tablet)
* manage salary information
* assign a repairman to a certain order

## Offices
* add / remove offices
* assign an employee to an office

## Orders
* add / remove order
* assign a client to the order
* assing a device to the order 
* assign an employee who will do the order

## Clients
* add / remove a client
* modify personal data
* if a client had at least one repair, his data can't be deleted