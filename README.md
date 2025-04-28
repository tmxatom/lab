kvm
 grep -E --color 'vmx|svm' /proc/cpuinfo
 sudo apt update
 sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
 sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
virt-manager

6th- host a simple website using docker

docker desktop login 
bb
vs me create folder
new terminal pe git clone 
change name in line 5 and 11
new terminal 
+ pe git bash
cd drag docker.ngx
./run.sh

chrome pe openb
localhost:8080

7th- explore features and capabilities of VMware workstation including the creation management and access of vm

make a VMware
upar click click nae
snapshot 
take a snapshot 
snapshot manager

2nd- explore and implement hosted virtualization using kvm

ubuntu terminal 
- git clone xyz
- ls
- cd lab
- chmod +x kvm.sh
- ./kvm.sh
- pass

vm manger me open name
local install media 
ubuntu.iso file 
forward forward
Rutuja Bhalekar
D10A

AIM: To gain in-depth knowledge of cloud computing fundamentals and examine the structure of cloud architecture, along with the various service and deployment models it offers.
THEORY: Cloud computing is a modern approach to delivering computing resources such as servers, storage, databases, software, and networking over the internet on a pay-as-you-go basis. It removes the need for physical infrastructure by providing shared resources as required. Key benefits include scalability, resource efficiency, cost reduction, on-demand availability, and global accessibility.
Cloud architecture is typically divided into three main components:
Front-End: The client interface through which users interact with cloud services, such as web browsers or client applications.
Back-End: Composed of cloud servers, storage systems, databases, and application servers that handle the actual computing tasks.
Network:The internet or private intranet that connects the front-end and back-end, facilitating data transmission and service access.
Cloud service models include:
IaaS (Infrastructure as a Service): Provides raw computing resources like virtual machines, storage, and networks, giving users control over the OS, storage, and applications. Examples: Amazon EC2, Google Compute Engine.
PaaS (Platform as a Service): Supplies a platform and tools to develop, test, and deploy software applications, abstracting the underlying infrastructure. Examples: Google App Engine, Microsoft Azure App Services.
SaaS (Software as a Service): Delivers complete software applications over the internet, managed by a provider, which users access via web browsers. Examples: Gmail, Microsoft Office 365, Salesforce.
Deployment models describe how cloud services are deployed:
Public Cloud: Managed by third-party providers and shared among multiple users.
Private Cloud: Exclusively dedicated to a single organization, offering more control and security.
Hybrid Cloud: A combination of public and private clouds for greater flexibility and optimized workload management.
Community Cloud: Shared among organizations with similar concerns (e.g., security, compliance).
Prominent cloud providers like AWS, Microsoft Azure, and Google Cloud Platform offer a wide variety of services, including computing power, AI tools, serverless platforms, and DevOps pipelines.


PROCEDURE:  
- Start by studying the basic structure of cloud computing, focusing on its three main components: front-end, back-end, and network.
- Understand the roles and distinctions between the cloud service models: IaaS, PaaS, and SaaS. Review real-world examples to strengthen your understanding.
- Investigate the different deployment models public, private, hybrid, and community clouds and learn how they apply to various business scenarios.
- Research top cloud platforms, such as AWS, Azure, and Google Cloud, comparing their services, pricing, and availability.
- Sign up for a free-tier account with a cloud provider (e.g., AWS Free Tier or Azure Student Account).
- Explore the cloud console and experiment with basic services, such as launching a virtual machine (EC2 or VM), using cloud storage (S3 or Blob Storage), and deploying a small web application.
- Familiarize yourself with the interface, dashboard tools, billing options, monitoring services, and other key features provided by the platform.
CONCLUSION: Through this experiment, the fundamental concepts of cloud computing, including cloud architecture components and service models, have been clearly understood.


