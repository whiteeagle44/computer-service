# Computer service
 
# 1. Introduction
 
This documentation describes the process of designing a database for the computer service, that is a company offering repairs of mobile devices and computers.
 
## 1.1 Data requirements
 
The **Computer Service** has a name, founding date and an owner. It runs **offices** at different locations. Offices have **employees** assigned to it. An employee may be a manager or a repairman. In the latter case, he may specialize in mobile devices, computers, or both. In the database, the information about the salary of each employee is stored.
 
The database stores **orders** which are made by the clients and consist of **devices** that are repaired now, or were repaired in the past. There is a repairman responsible for an order. Moreover, the status of each order is stored, which can be not started, in progress or completed.
 
To have the device repaired, the **client** needs to provide his name, phone number and email and if he wants the repaired device to be delivered to him, also the address.
 
# 2. System definition

## 2.1 User views
 
**Labeling:**
 r - read access, w - write access
 
* owner
  * has rw to all the data
  * can give access to data by changing employee's role to manager
* manager
  * has r to all the data
  * has w, but cannot give access to data
* repairman
  * has rw to all the orders and client data
  * sees only name, surname and phone number of other employees
* client
  * has rw to his own data and his order
  * sees name, surname and phone number of employee doing his order
 
Everybody has read access to information about company and owner.
 
Permissions:
|                             | owner | manager      | repairman    | client        |
|-----------------------------|-------|--------------|--------------|---------------|
| has access to all data      | yes   | yes          | no           | no            |
| can change all data         | yes   | no           | no           | no            |
| has access to employee data | yes   | yes          | limited (*1) | limited (*2)  |
| can change employee data    | yes   | limited (*3) | limited (*4) | no            |
| has access to order data    | yes   | yes          | yes          | limited (*5)  |
| can change order data       | yes   | yes          | yes          | no            |
| has access to client data   | yes   | yes          | yes          | limited (*4)  |
| can change client data      | yes   | yes          | yes          | limited (*4)  |
 
* 1 only name, surname and phone number
* 2 only name, surname and phone number of the person doing his order
* 3 cannot change employees' role to manager
* 4 only his data
* 5 only his order
 
 
 
## 2.2 Operations on data
 
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

# 3. Conceptual model
 
## 3.1 List of entities

* **Computer Service** - main entity representing a company
* ****Office**** - entity representing individual office at a certain address
* **Employee**  - entity representing an employee working at a certain office
* **Client** - entity representing a client of an office
* **Order** - entity that represents a certain order, that is a job to repair certain devices 
* **Device** - entity that represents a device left for repair


## 3.2 Relations between entities

|                           | relation name | connectivity | cardinality     | degree |
|---------------------------|---------------|--------------|-----------------|--------|
| Computer Service - Office | runs          | 1 : M        | (1) : (0, M)    | binary |
| Office - Client           | has           | 1 : M        | (1) : (0, M)    | binary |
| Office - Employee         | employs       | 1 : M        | (1) : (0, M)    | binary |
| Employee - Order          | fulfills      | M : N        | (0, M) : (0, N) | binary |
| Client - Order            | makes         | 1 : M        | (1) : (0, M)    | binary |
| Order - Device            | consists of   | 1 : M        | (1) : (0, M)    | binary |
 
 
# 4. Logical model
 
## 4.1 Characteristics of relational model
 
To convert concemptual model to logical relational model we have to make some changes in project of database. In relational model we can not have many-to-many relationships - those are interchanged with two relationships one-to-many. Also, entities are converted to relations, represented as tables with plurar names of names of entities.
 
## 4.2 Deletion of uncompatible properties with relational model
 
In conceptual model there are couple of many-to-many relations. It was necessary to create linking tables and changing one many-to-many relation with two one-to-many relations.
 
| Relation 1 | Relation 2      | Linking table           | Comments |
|------------|-----------------|-------------------------|----------|
| Employees  | Specializations | Aquired specializations |          |
| Employees  | Orders          | Employees orders        |          |
 
In created linking tables there are IDs - Primary Keys - of every relation taking part in the relationship.
 
## 4.3 Normalization process
 
### 4.3.1 First Normal Form - 1NF
 
To normalize a database model to First Normal Form it is neccesary to make all attributes of relations atomic - irresolvable. Moreover, in any relation we can not have a repetitive groups. In our logical model in relation Offices we have segmented attribute Address consisting of City, Street, Flat_no and Postal code. We create a new relation called Addresses with before mentioned attributes. This redundancy occured also in such relations: Employees and Clients, so we removed attribute address from those three relations and we added relationships with new relation Addresses to all these relations.

### 4.3.2 Second Normal Form - 2NF

To have a model in Second Normal Form we have to have our model already in 1NF as well as 

### 4.3.3 Third Normal Form - 3NF
 
## 4.4 Logical model - ER schema
 
## 4.5 Integrity constraints
 
## 4.6  Denormalization process
 

