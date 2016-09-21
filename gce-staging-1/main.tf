provider "google" {
  project = "travis-staging-1"
}

module "gce_project_1" {
  source = "../modules/gce_project"

  bastion_config = "${file("${path.module}/config/bastion-env")}"
  bastion_image = "${var.gce_bastion_image}"
  env = "${var.env}"
  gcloud_cleanup_account_json = "${file("${path.module}/config/gce-cleanup-staging-1.json")}"
  gcloud_cleanup_job_board_url = "${var.job_board_url}"
  gcloud_cleanup_loop_sleep = "2m"
  gcloud_cleanup_scale = "worker=1:Hobby"
  gcloud_zone = "${var.gce_gcloud_zone}"
  heroku_org = "${var.gce_heroku_org}"
  index = "1"
  nat_image = "${var.gce_nat_image}"
  project = "travis-staging-1"
  worker_account_json_com = "${file("${path.module}/config/gce-workers-staging.json")}"
  worker_account_json_org = "${file("${path.module}/config/gce-workers-staging.json")}"
  worker_config_com = "${file("${path.module}/config/worker-env-com")}"
  worker_config_org = "${file("${path.module}/config/worker-env-org")}"
  worker_image = "${var.gce_worker_image}"
}