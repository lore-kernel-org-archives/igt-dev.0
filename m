Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Mon, 05 Jun 2023 19:50:24 -0000
Message-ID: <168599462452.24738.9411709608900859437@emeril.freedesktop.org>
References: <20230605180745.40121-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230605180745.40121-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_r?=
 =?utf-8?q?unner=3A_Dump_GPU_state_on_timeout?=
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

Series: runner: Dump GPU state on timeout
URL   : https://patchwork.freedesktop.org/series/118881/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/900011 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43131259):
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
  time="2023-06-05T19:47:05Z" level=fatal msg="Error trying to reuse blob sha256:2f92e8d0541551f215cc8116b6a6507a714a936f45b19286a6664467db837932 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/build-debian-minimal: 500 (Internal Server Error)" 
  section_end:1685994425:step_script
  section_start:1685994425:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685994425:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43131261):
  time="2023-06-05T19:47:08Z" level=fatal msg="Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:c722db24a050621ee87ea07acd5d066d3d6a94737c32012f27d73a1ad5cc645c
  Copying config sha256:8b5601a5a7f855241ac7f372ec0042e793b0b3eb3f3a601014845f22bd371c90
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-06-05T19:47:12Z" level=warning msg="signal: killed"
  time="2023-06-05T19:47:12Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1685994433:step_script
  section_start:1685994433:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685994433:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43131260):
  time="2023-06-05T19:47:05Z" level=fatal msg="Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:c722db24a050621ee87ea07acd5d066d3d6a94737c32012f27d73a1ad5cc645c
  Copying config sha256:8b5601a5a7f855241ac7f372ec0042e793b0b3eb3f3a601014845f22bd371c90
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-06-05T19:47:08Z" level=warning msg="signal: killed"
  time="2023-06-05T19:47:08Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1685994429:step_script
  section_start:1685994429:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685994430:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43131262):
  time="2023-06-05T19:47:05Z" level=fatal msg="Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:c722db24a050621ee87ea07acd5d066d3d6a94737c32012f27d73a1ad5cc645c
  Copying config sha256:8b5601a5a7f855241ac7f372ec0042e793b0b3eb3f3a601014845f22bd371c90
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-06-05T19:47:09Z" level=warning msg="signal: killed"
  time="2023-06-05T19:47:09Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1685994429:step_script
  section_start:1685994429:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685994430:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43131263):
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
  time="2023-06-05T19:47:15Z" level=fatal msg="Error trying to reuse blob sha256:b39735705e69a2516323755ff4698ea5cd86b08b31d8c8287bc83d76d34c3bfc at destination: failed to read from destination repository gfx-ci/igt-ci-tags/build-fedora: 500 (Internal Server Error)" 
  section_end:1685994436:step_script
  section_start:1685994436:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685994437:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/900011
