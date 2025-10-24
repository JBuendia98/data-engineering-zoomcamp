terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.8.0"
    }
  }
}

provider "google" {
  project = "dotted-music-475316-f3"
  region  = "us-central1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "dotted-music-475316-f3-terra-bucket"
  location      = "US"
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}