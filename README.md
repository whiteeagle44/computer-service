# Computer service 

# Introduction

The computer service database is designed for a company offering repairs of electronical devices such as computers, smartphones, and tablets. This company may have many **offices**. 

It stores information about the **devices** that are repaired now, or were repaired in the past, as well as the clients of the service. For each repair, there is a person, that is responsible for it. The service employs **people**, that **specialize** in different domains, some in repairing computers, some in smartphones and some in tablets. In the database, the information about the salary of each employee is stored. Moreover, the service stores a status of each of the **repair**, which can be completed or in progress -> assigned to an employee or not assigned. 

Each **client** may pay an extra fee, to speed up the process of the service. To have the device repaired, the client needs to provide his name, phone and email and if he wants the repaired device to be delivered to him, also the address. 

# User views

* manager - has access to all the data
* employee - has access to all the repairs and customer data, (doesn't see information about other employees salary)

# Operations on data

## Employees
* add / remove an employee
* modify personal data
* modify specialization
* manage salary information
* assign an employee to a certain repair

## Offices
* add / remove offices

## Repairs
* add / remove repair
* assign a client to the repair
* assing a device to the repair 
* assign an employee who will do the repair

## Clients
* add / remove a client
* modify personal data
* if a client had at least one repair, his data can't be deleted