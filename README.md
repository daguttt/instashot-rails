# Instashot

App to upload images using Rails and Cloudinary

## Developing

### Getting Started

#### 1. Environment variables

Create a `.env` file and populate it based on the content of the `.env.erb` file.
Environment variables include:

  1. Database Credentials.

> [!NOTE]
> Keep the value of the `DATABASE_NAME` as is. It's not used in development but required to run the project

  2. Cloudinary credentials.

#### 2. Database setup

1. Create database `rails db:migrate`.
2. Run migrations `rails db:migrate`.