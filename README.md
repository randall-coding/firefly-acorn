# Launch your own accounting and invoicing server
## Firefly III
Firefly III is an open-source personal finance manager that enables users to track transactions, manage budgets, and gain insights into their financial activities. It supports features like multiple currencies and recurring transactions.

To make things even easier, we will deploy our Firefly server using an acorn image.

## What is Acorn?
Acorn is a new cloud platform that allows you to easily deploy, develop and manage web services with containerization.  A single acorn image can deploy all that you need: from a single container webserver, to a multi service Kubernetes cluster with high availability.  Don't worry if you don't understand what all those terms mean; we don't have to know that in order to deploy our server.

## Setup Acorn Account
Setup an acorn account at [acorn.io](https://acorn.io).  This can be a free account for your first deployment, and if you'd like additional storage space you can look into the pro account or enterprise.  You will need a Github account to signup as shown in the image below.

![signin_acorn](https://github.com/randall-coding/opensupports-docker/assets/39175191/d46815fb-d2d5-42cd-b93d-41ca541a63bd)

## Install acorn cli 
First we need to install acorn-cli locally.  Choose an install method from the list below:

**Linux or Mac** <br>
`curl https://get.acorn.io | sh`

**Homebrew (Linux or Mac)** <br>
`brew install acorn-io/cli/acorn`

**Windows** <br> 
Uncompress and move the [binary](https://cdn.acrn.io/cli/default_windows_amd64_v1/acorn.exe) to your PATH

**Windows (Scoop)** <br>
`scoop install acorn`

For up to date installation instructions, visit the [official docs](https://runtime-docs.acorn.io/installation/installing).

## Login with CLI
Back in our local command terminal login to acorn.io with: <br>
`acorn login acorn.io` 

## Preparing Secrets
Your server has settings controlled by a "secrets" object: 
 * **password** - Password for mariadb database (must be at least 10 characters)

Create secrets for your application using acorn-cli.  Change the <> values to your actual credentials.
```
acorn secret create firefly-mariadb \
  --data password=<password> \
  --data username=firefly
```

## Deploying Acorn
Now that we have the acorn cli configured, we can deploy our acorn image with a few simple commands.

Clone the repo locally if you haven't already with:

`git clone https://github.com/randall-coding/firefly-acorn.git`

Next build and run.

`acorn build -t firefly`

`acorn run -s firefly-mariadb:firefly-mariadb -n firefly firefly`

Visit your acorn dashboard to see if your deployment was successful.

Click on the firefly deployment, and find the endpoint section on the right side panel.  This is your firefly instance link.

![firefly_acorn_ui](https://github.com/randall-coding/firefly-acorn/assets/39175191/4f2963e9-47d7-475a-be65-2a579419c761)

![firefly_endpoints](https://github.com/randall-coding/firefly-acorn/assets/39175191/ac24a607-1b91-4089-ae8b-8075a91c06df)

## Configure Firefly
After you deploy the acorn you will see a page like this when you visit the acorn URL:
<img width="606" alt="293944511-665104e4-8fa3-4d6f-b72f-95491de28eba" src="https://github.com/randall-coding/firefly-acorn/assets/39175191/7d789e76-d1af-4167-b69d-5e6e3ddf810b">

Register with email and password and then you'll see the firefly dashboard.

<img width="1082" alt="293944958-04c0763a-c361-43fe-b5a7-248ca41709fc" src="https://github.com/randall-coding/firefly-acorn/assets/39175191/c5bea521-0150-43af-8c66-4de7fc1c7d84">

## Conclusion
We've now got a Firefly server up and running from an acorn image.
For more detailed instructions on working with your Firefly server see the documentation in the section below.

## References
* [Firefly documentation](https://docs.firefly-iii.org/?mtm_campaign=firefly-iii-org&mtm_kwd=top-link)
* [Getting started with Acorn](https://docs.acorn.io/getting-started)
