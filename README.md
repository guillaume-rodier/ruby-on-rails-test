# Technical Test WAKEO
This test's purpose is to evaluate you have or you are able to learn the minimum set of technical skills required to work as a backend developper at Wakeo.
## Getting started
- We have made a boilerplate of the App in Ruby on Rails, if you want to use this framework, you can follow the steps to get started.
- If you do not want to use the boilerplate, you can make your own app (using the Ruby on Rails framework)
    ### Ruby on Rails boilerplate setup
    - Install `docker` and `docker-compose`
    - Launch the app with `docker-compose build && docker-compose up` (Add `-d` to run it in the background)
    - To run tests : `docker-compose exec wakeo_test bundle exec rspec`
    - To access rails console : `docker-compose exec wakeo_test bundle exec rails c`
    - You can now make requests to http://localhost:6001/
## Objectives
- The wakeo_back_candidate_test is a WebApp which can serve data through an API.
- You can find the API documentation [here](https://redocly.github.io/redoc/?url=https://wakeo-technical-test.s3.eu-west-3.amazonaws.com/wakeo_test_doc.yml)
- The RoR boilerplate already contains the code for the index route (`/orders`) as an example
- The candidate needs to implement two routes :
    - `/orders/active`
    - `/orders/refresh`
## Additional information
- If you are not using the RoR boilerplate, please provide a proper README.md explaining how to setup and run your code
- Delivering a solution that just work may not be enough: we expect code to follow best developpment pratices and to be ready to be shipped in production
- Time is not limited but it should usually take up to 2 hours to complete. It is acceptable to document as TODO things you were planning to do
- Do not hesitate to document your questions, hypothesis, and general thoughts as comments or in the readme
- You can add whatever plugin/gem you may need during the test
- If you have questions, you can contact us at techs@wakeo.co
- When you are done, please send us your test by mail in a zipped archive at techs@wakeo.co
- Everything must be written in English
