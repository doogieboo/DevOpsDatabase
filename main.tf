{\rtf1\ansi\ansicpg1252\cocoartf2513
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\margl1440\margr1440\vieww23360\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\
# DEPLOY MYSQL ON RDS\
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\
\
# ----------------------------------------------------------------------------------------------------------------------\
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER\
# ----------------------------------------------------------------------------------------------------------------------\
\
terraform \{\
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting\
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it\
  # forwards compatible with 0.13.x code.\
  required_version = ">= 0.12.26"\
\}\
\
# ------------------------------------------------------------------------------\
# CONFIGURE OUR AWS CONNECTION\
# ------------------------------------------------------------------------------\
\
provider "aws" \{\
  region = "us-east-2"\
\}\
\
# ------------------------------------------------------------------------------\
# DEPLOY MYSQL ON RDS\
# ------------------------------------------------------------------------------\
\
resource "aws_db_instance" "example" \{\
  identifier_prefix   = "terraform-up-and-running"\
  engine              = "mysql"\
  allocated_storage   = 10\
  instance_class      = "db.t2.micro"\
  name                = "example_database"\
  username            = "admin"\
  password            = var.db_password\
\
  # Don't copy this to your production examples. It's only here to make it quicker to delete this DB.\
  skip_final_snapshot = true\
\}\
\
\
}