#Introduction
Packer allows us to use JSON or HCL code to describe and generate machine images, such as Google Compute images. 
In this lab, we'll explore using Packer with GCP, including credential creation, 
before writing our build from scratch to save an image of a web instance.

#Solution
On the lab page, right-click Open Google Console and select the option to open it in a new private browser window
(this option will read differently depending on your browser — e.g., in Chrome, it says "Open Link in Incognito Window"). 
Then, sign in to Google Cloud Platform using the credentials provided on the lab page.

On the Welcome to your new account screen, review the text, and click Accept. 
In the "Welcome Cloud Student!" pop-up once you're signed in, check to agree to the terms of service,
choose your country of residence, and click Agree and Continue.

#Access the Console, Create Credentials, and Pull Down Files


1. Copy the project ID at the top of the page, and paste it into a text file. We'll need it later on.

2. Navigate to APIs & Services > Credentials.

3. Click Create > Credentials > Service account.

4. Set the following values:

    Service account name: packer
    Service account description: Packer Account

5. Click Create.

6. For Service account permissions, select Project Editor from the dropdown.

7. Click Continue > Done.

8. Copy the email for the new service account we created (it will begin with packer@packer-and), and paste it into a text file. We'll need it in a few minutes.

9. Navigate to Compute Engine > VM instances.

10. Next to the provisioned packer-workstation instance, click SSH to access the instance.

11. In the terminal that opens, create a working directory:
```
mkdir -p packer/booksite
```

12. Clone the lab GitHub repo:

```
git clone https://github.com/linuxacademy/content-hashicorp-packer
```

13. Copy the files to the packer/booksite directory:

```
cp -r content-hashicorp-packer/labfiles/gcp/* packer/booksite/
```

14. Change to the packer/booksite directory:

```
cd packer/booksite/
```

15. Before creating the account key, we need to authenticate our account:

```
gcloud auth login
```


16. Enter y at the prompt.

17. Click the URL in the output.

18. Choose the cloud_user account.

19. Click Allow.

20. Copy the provided verification code.

21. Back in the GCP terminal, paste in the verification code.

22. Create the account key, replacing <PACKER_SERVICE_ACCOUNT_EMAIL> with the email you copied into a text file earlier:

```
gcloud iam service-accounts keys create account.json --iam-account <PACKER_SERVICE_ACCOUNT_EMAIL>
```
