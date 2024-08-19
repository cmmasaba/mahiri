# Macroeconomics And Financial Analysis Application

This application provides macroeconomic and financial data visualizations on the following datapoints in Kenya:
- GDP and Population
- Exchange rates
- Inflation rates
- Safaricom Share Price

## Setup Instructions

### Prerequisites

- Python 3.7+

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/cmmasaba/mahiri.git
   cd mahiri

2. Create a virtual environment, activate it, and install requirements:

   ```bash
   python -m venv .venv
   source .venv/bin/activate
   pip install -r requirements.txt

3. Run the application:

   ```bash
   python app.py or flask run

4. Access the application in your browser at:

   ```bash
   http://127.0.0.1:5000/

## Dependencies
- Flask: Web framework for Python.
- pyrebase: Python wrapper for Firebase API.
- pandas: Data manipulation and analysis library.
- plotly: Library for creating interactive charts and plots.

## Features

**User Authentication** <br>
<div align="justify">
Authentication is done using email/password combination, and handled by Google Firebase. Since the only database
is the record of users in the system, the application makes use of the Firebase user database instead of having
a separate database integration.
</div>

  - Users can sign up, log in, and log out.
  - Access to the dashboards is restricted to authenticated users.

**Macroeconomic Analysis Dashboards**<br>
<div align="justify">
The dashboards are designed to provide qualitative visualizations into the datapoints above. Each dashboard has
a period filter used to adjust the range of analysis and visualization, i.e. 5Y, 10Y, Full.
</div>

  - **Dashboard 1:** Displays historical nominal GDP, population trends, and GDP per capita data.
  - **Dashboard 2:** Shows USD/KES exchange rates from 2019 to date.
  - **Dashboard 3:** Contains two pages:
    - **Page 1:** Freely accessible, comparing the current month's inflation with the prior month's.
    - **Page 2:** Locked behind a paywall, showing historical monthly inflation trends in Kenya.

**Financial Analysis Dashboards**<br>
<div align="justify">
The dashboards are designed to provide informative analysis of Safaricom's historical share prices. Each dashboard has
a period filter used to adjust the range of analysis and visualization, i.e. 5Y, 10Y, Full.
</div>

  - **Dashboard 1:** Contains two pages:
    - **Page 1:** Freely accessible, comparing the current month's inflation with the prior month's.
    - **Page 2:** Locked behind a paywall, showing historical monthly inflation trends in Kenya.
## Routes

### User Authentication

- **/login:** Login page for users.
- **/signup:** Signup page for new users.
- **/logout:** Logs out the user and redirects to the login page.

### Dashboards

- **/dashboard1:** Displays nominal GDP, population, and GDP per capita trends.
- **/dashboard2:** Displays USD/KES exchange rates.
- **/dashboard3:** Displays inflation trends, with restricted access for historical data.

### Data Fetching Routes

- **/fetch_filtered_data:** Fetches filtered data for GDP, population, or GDP per capita based on the selected period.
- **/fetch_filtered_exchanges:** Fetches filtered data for USD/KES exchange rates based on the selected period.
- **/fetch_filtered_inflation:** Fetches filtered data for inflation rates based on the selected period.
- **/fetch_filtered_shares:** Fetches filtered data for share prices based on the selected period.
- **/fetch_filtered_shares_more:** Fetches additional filtered data for share prices for a different dataset.

## Design Choices
**Flask**
<div align="justify">
Flask is well suited for building small to medium sized applications, and prototyping. It is lightweight and offers flexibilty and control.
It offers decent performance for medium loads since it is natively synchronous. The two main other options I could use are Django and FastAPI.
Django would have been suitable for a larger and more complex project. FastAPI would have been suitable if I was strictly developing an API
service.
</div>
<br>

**Firebase for auntentication and Firestore for storage**
<div align="justify">
Firebase offers a robust and automatically scalable platform for managing user authentication and storage. It is free for most use cases, like 
this particular one. It offers a variety of authentication options like email/password, OAuth, etc. It can be integrated easily with other backend services through the use of Firebase admin sdk, for verifying and managing use credentials serverside. Firestore is NoSQL database optimised for
performance. Since the only database needed is for users, with very few fields, using an optimized NoSQL db was a good choice.
</div>

**Stripe Payment Integration**
<div align="justify">
Stripe provides an easy to use REST API that allows VISA and Mastercard integration for payment processing. When processing payments, the app checks 
if a promo code was applied or not. If not, it creates a charge on Stripe using the card details provided, and deducts the amount required in cents. 
After the payment is processed the user document in Firestore is updated to register that. Before displaying premium content, a check is made to see 
if the user has subscribed for premium content or not. If not, they are prompted to subscribe.
</div>

## Improvements

- OpenID Connect for authentication. As long as you have an account with an authentication provide like Google, you can use that account to sign in 
to other services. The main benefit is it takes a way the need to have multiple passwprds for each site and having to remember all of them. 
Due to time constraints I was not able to implement this feature but it is on the way.
- The sites providing the datasets don't provide URLs that can be used to programmatically fetch the data. Therefore you must download the data 
before using it. In order to stay up to date, for example for shares prices, I would have to download the new datasets daily and replace the old 
ones. That approach won't scale well. A solution I will implement is to create a background task that will be visiting the sites with data daily 
and scraping the latest datasets, and replace the old ones. I also wasn't able to do this due to time contraints but it's on the way.
- CI/CD for automatic integrations and deploying after every change is tracked on GitHub.

## License
- This project and intellectual property is licensed under the MIT License - see the LICENSE file for more details. 

### Contact
- For any inquiries, issues or source contributions, please contact [mmasabacollins9@gmail.com].