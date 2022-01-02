## Description

It's a bash script to parse an apache access log file.

Analysizing Apache log files to count most visited Unique Ip , to see http status codes , request method and most viewed unique URLS manually is an not an easy task due to the size of log file and less readability of log file.

Every time a web page is requested, an email sent or a login made, the event is recorded in a log file. An essential skill for any system administrator is to be to able parse through log files and extract useful information.

This script can be used for this purpose:

----

## Feature

The script will extract data from log file such as :

- IDENTIFY FROM WHICH IPS MY SERVER HAS BEEN ACCESSED MORE AND HOW MANY TIMES (TOP 20 IP ADDRESSES )
- View request types GET/HEAD/POST/DELETE that are happening the most
-  View highest 20 requested unique base URLs.
-  View the most common response codes your visitors are causing.


---

## How to use this script

```sh
- To get sample access log for practice purpose use:
  
  wget http://www.almhuette-raith.at/apache-log/access.log

- git clone https://github.com/NITHIN-JOHN-GEORGE/apache_log_parser.git

- cd apache_log_parser

- In prod environment where real access log is available , update the access log file path in script starting

Log_File=<apache access log file absolute path>

- ./apache_log_analyser.sh

```
## Script Running

![CAPTURE-1](https://user-images.githubusercontent.com/96073033/147874961-8c5ffd3e-597b-48fc-a5e3-8bfb0eb6a90a.JPG)
![CAPTURE-2](https://user-images.githubusercontent.com/96073033/147874963-d90ed04d-6469-4f9f-8957-7506b5028eb6.JPG)
![CAPTURE-3](https://user-images.githubusercontent.com/96073033/147874968-d04985a1-7255-4807-b038-f2026e4eba2e.JPG)
![CAPTURE-4](https://user-images.githubusercontent.com/96073033/147874970-74fb734b-146d-4d4e-b300-5f2eeab3fe9d.JPG)
![CAPTURE 5](https://user-images.githubusercontent.com/96073033/147874974-911fbd02-f199-4a94-9630-2c455f0521e8.JPG)

