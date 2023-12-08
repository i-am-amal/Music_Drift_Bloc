import 'package:flutter/material.dart';

class Privacy {
  privacy(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 46, 4, 53),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Privacy Policy",
                  style: TextStyle(
                      fontFamily: 'Iceberg',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            content: const SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    """
          Privacy Policy for Music Drift on Amazon Appstore

Last Updated: 2023-12-05

Service provided by Amal

This Privacy Policy governs your use of Music Drift on the Amazon Appstore. Please read this policy carefully to understand how we collect, use, and protect your information.

Free Service:
Music Drift is a free app provided by Amal. The service is intended for use as is, and there is no cost associated with its use.

Information Collection and Use:
For an enhanced user experience, Music Drift may require certain personally identifiable information. It's important to note that this information is retained on your device and is not collected by Amal. Additionally, third-party services, such as Amazon services, may collect information for specific purposes.

Log Data:
When you use Music Drift, we collect Log Data in case of app errors. This Log Data may include information such as your device's IP address, device name, operating system version, app configuration, the time and date of your use of the service, and other relevant statistics.

Cookies:
Music Drift does not use cookies explicitly. However, third-party code and libraries integrated into the app may utilize cookies for information collection to improve their services. Users have the option to accept or refuse these cookies.

Service Providers:
Third-party companies and individuals may be engaged by Amal for purposes such as facilitating the service, providing the service on our behalf, performing service-related tasks, or analyzing how the service is used. These third parties may have access to users' Personal Information, but they are obligated not to disclose or use it for any other purpose.

Security:
We value your trust in providing us with Personal Information. We strive to use commercially acceptable means to protect it. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee its absolute security.

Links to Other Sites:
Music Drift may contain links to external sites. Users are encouraged to review the privacy policies of these external websites, as they are not operated by Amal. Amal assumes no responsibility for the content, privacy policies, or practices of any third-party sites or services.

Children’s Privacy:
Music Drift is not intended for users under the age of 13. Amal does not knowingly collect personally identifiable information from children under 13. If such information is discovered, it will be promptly deleted.

Changes to This Privacy Policy:
Amal may update the Privacy Policy from time to time. Users are advised to review this page periodically for any changes. Changes will be communicated by posting the updated Privacy Policy on this page.

Contact Us:
If you have any questions or suggestions about this Privacy Policy, please contact us at amald1011@gmail.com.


""",
                    style: TextStyle(
                      fontFamily: 'Iceberg',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  "Close",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
