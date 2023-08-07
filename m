Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Date: Mon, 07 Aug 2023 09:47:40 -0000
Message-ID: <169140166088.13179.7440391021660215962@emeril.freedesktop.org>
References: <20230807091538.3172571-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20230807091538.3172571-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/kms=5Fdsc=5Fhelper=2Ec=3A_Fix_helper_to_check_dsc_wit?=
 =?utf-8?q?h_output=5Fformat?=
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

Series: tests/i915/kms_dsc_helper.c: Fix helper to check dsc with output_format
URL   : https://patchwork.freedesktop.org/series/122091/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/954321 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/46811164):
  time="2023-08-07T09:45:59Z" level=fatal msg="Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:9918064ebccea7fc961fe71dad46105b217763b4b1b3a9dfa7bee2ab29d2039b
  Copying config sha256:1df4474660a180f2a805d8477b78f9774d302afb2d31118106bffc0cb144e910
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-08-07T09:46:03Z" level=warning msg="signal: killed"
  time="2023-08-07T09:46:03Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1691401565:step_script
  section_start:1691401565:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1691401565:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/46811166):
  time="2023-08-07T09:46:08Z" level=fatal msg="Error determining repository tags: Invalid status code returned when fetching tags list 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:9918064ebccea7fc961fe71dad46105b217763b4b1b3a9dfa7bee2ab29d2039b
  Copying config sha256:1df4474660a180f2a805d8477b78f9774d302afb2d31118106bffc0cb144e910
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-08-07T09:46:13Z" level=warning msg="signal: killed"
  time="2023-08-07T09:46:13Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1691401573:step_script
  section_start:1691401573:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1691401573:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/46811167):
  time="2023-08-07T09:45:59Z" level=fatal msg="Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:9918064ebccea7fc961fe71dad46105b217763b4b1b3a9dfa7bee2ab29d2039b
  Copying config sha256:1df4474660a180f2a805d8477b78f9774d302afb2d31118106bffc0cb144e910
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-08-07T09:46:04Z" level=warning msg="signal: killed"
  time="2023-08-07T09:46:04Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1691401564:step_script
  section_start:1691401564:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1691401566:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/954321
