Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Wed, 16 Aug 2023 11:00:56 -0000
Message-ID: <169218365613.10285.7501051971551307915@emeril.freedesktop.org>
References: <20230816102431.2014326-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20230816102431.2014326-1-janga.rahul.kumar@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_Xe_lib_support_for_hang_=26_GT_reset_=28rev6=29?=
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

Series: Add Xe lib support for hang & GT reset (rev6)
URL   : https://patchwork.freedesktop.org/series/121292/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/962688 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47493692):
          "intel-IGT_5164"
      ],
      "Created": "2019-11-20T12:39:41.497492764Z",
      "DockerVersion": "",
      "Labels": {},
      "Architecture": "amd64",
      "Os": "linux",
      "Layers": [
          "sha256:2f92e8d0541551f215cc8116b6a6507a714a936f45b19286a6664467db837932"
      ]
  }
  Skipping, already built
  Getting image source signatures
  time="2023-08-16T10:58:17Z" level=fatal msg="Error trying to reuse blob sha256:2f92e8d0541551f215cc8116b6a6507a714a936f45b19286a6664467db837932 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/build-debian-minimal: 500 (Internal Server Error)" 
  section_end:1692183498:step_script
  section_start:1692183498:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692183499:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47493693):
  time="2023-08-16T10:58:16Z" level=fatal msg="Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:d6b7393fb4f375905c31c483d81ce2a2905f88aba8cb198874da2b54035bc41d
  Copying config sha256:de08540e8ff0e470ff7956df4bed403725a5f45c186e9bf495da5344ff8fbe84
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-08-16T10:58:21Z" level=warning msg="signal: killed"
  time="2023-08-16T10:58:21Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1692183501:step_script
  section_start:1692183501:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692183502:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47493696):
      "Created": "2019-11-11T12:55:05.209459628Z",
      "DockerVersion": "",
      "Labels": {
          "maintainer": "Clement Verna \u003ccverna@fedoraproject.org\u003e"
      },
      "Architecture": "amd64",
      "Os": "linux",
      "Layers": [
          "sha256:b39735705e69a2516323755ff4698ea5cd86b08b31d8c8287bc83d76d34c3bfc"
      ]
  }
  Skipping, already built
  Getting image source signatures
  time="2023-08-16T10:58:30Z" level=fatal msg="Error trying to reuse blob sha256:b39735705e69a2516323755ff4698ea5cd86b08b31d8c8287bc83d76d34c3bfc at destination: failed to read from destination repository gfx-ci/igt-ci-tags/build-fedora: 500 (Internal Server Error)" 
  section_end:1692183513:step_script
  section_start:1692183513:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692183515:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/962688
