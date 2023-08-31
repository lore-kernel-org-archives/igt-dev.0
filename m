Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Thu, 31 Aug 2023 05:32:27 -0000
Message-ID: <169345994762.12507.12849704808809031979@emeril.freedesktop.org>
References: <20230825054659.1320824-1-riana.tauro@intel.com>
In-Reply-To: <20230825054659.1320824-1-riana.tauro@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_T?=
 =?utf-8?q?oggle_GT_C_States_and_validate_power_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Toggle GT C States and validate power (rev3)
URL   : https://patchwork.freedesktop.org/series/122552/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/974131 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48279486):
  time="2023-08-31T05:15:18Z" level=fatal msg="Error determining repository tags: Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-minimal/tags/list?last=commit-ef5a3f051763bc1172f4e2c1dc690383a37f9bb9&n=100: dial tcp 147.75.198.156:443: i/o timeout" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:d6b7393fb4f375905c31c483d81ce2a2905f88aba8cb198874da2b54035bc41d
  Copying config sha256:de08540e8ff0e470ff7956df4bed403725a5f45c186e9bf495da5344ff8fbe84
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-08-31T05:15:22Z" level=warning msg="signal: killed"
  time="2023-08-31T05:15:22Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1693458923:step_script
  section_start:1693458923:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693458923:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48279487):
  section_end:1693458856:prepare_executor
  section_start:1693458856:prepare_script
  Preparing environment
  Running on runner-m5dzqx4r-project-3185-concurrent-1 via 15ca4cde06bd...
  section_end:1693458857:prepare_script
  section_start:1693458857:get_sources
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': Failed to connect to gitlab.freedesktop.org port 443 after 132023 ms: Couldn't connect to server
  section_end:1693458990:get_sources
  section_start:1693458990:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693458990:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48279489):
  time="2023-08-31T05:14:55Z" level=fatal msg="Error determining repository tags: Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-mips/tags/list?last=commit-90254c14f4e68bec9d4a114ddf039075f3c1a30c&n=100: dial tcp 147.75.198.156:443: i/o timeout" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:d6b7393fb4f375905c31c483d81ce2a2905f88aba8cb198874da2b54035bc41d
  Copying config sha256:de08540e8ff0e470ff7956df4bed403725a5f45c186e9bf495da5344ff8fbe84
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-08-31T05:14:59Z" level=warning msg="signal: killed"
  time="2023-08-31T05:14:59Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1693458900:step_script
  section_start:1693458900:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693458900:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/974131
