Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christoph Manszewski" <christoph.manszewski@intel.com>
Date: Fri, 09 Jun 2023 10:25:10 -0000
Message-ID: <168630631019.15972.12578528984365783632@emeril.freedesktop.org>
References: <20230609093719.2076046-1-christoph.manszewski@intel.com>
In-Reply-To: <20230609093719.2076046-1-christoph.manszewski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/2=5D_lib=3A_Apply_x/y_offsets_?=
 =?utf-8?q?to_GPGPU_fill?=
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

Series: series starting with [i-g-t,1/2] lib: Apply x/y offsets to GPGPU fill
URL   : https://patchwork.freedesktop.org/series/119126/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/904516 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43454554):
  time="2023-06-09T10:23:15Z" level=fatal msg="Error determining repository tags: Invalid status code returned when fetching tags list 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:c722db24a050621ee87ea07acd5d066d3d6a94737c32012f27d73a1ad5cc645c
  Copying config sha256:8b5601a5a7f855241ac7f372ec0042e793b0b3eb3f3a601014845f22bd371c90
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-06-09T10:23:22Z" level=warning msg="signal: killed"
  time="2023-06-09T10:23:22Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1686306205:step_script
  section_start:1686306205:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686306209:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43454556):
  time="2023-06-09T10:23:00Z" level=fatal msg="Error determining repository tags: Invalid status code returned when fetching tags list 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:c722db24a050621ee87ea07acd5d066d3d6a94737c32012f27d73a1ad5cc645c
  Copying config sha256:8b5601a5a7f855241ac7f372ec0042e793b0b3eb3f3a601014845f22bd371c90
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-06-09T10:23:04Z" level=warning msg="signal: killed"
  time="2023-06-09T10:23:04Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1686306184:step_script
  section_start:1686306184:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686306185:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43454557):
      "DockerVersion": "",
      "Labels": {},
      "Architecture": "amd64",
      "Os": "linux",
      "Layers": [
          "sha256:04854e5e3796b945522a085073b5a49cadad51bd1c5414c91654fa3d63d8db4d"
      ]
  }
  Skipping, already built
  Getting image source signatures
  Copying blob sha256:04854e5e3796b945522a085073b5a49cadad51bd1c5414c91654fa3d63d8db4d
  Copying config sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448
  Writing manifest to image destination
  time="2023-06-09T10:23:19Z" level=fatal msg="Error writing manifest: Error uploading manifest commit-3fc7d9ad3bad16e7596b9633f1d5ce1cb6fc9c9a to registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips: received unexpected HTTP status: 500 Internal Server Error" 
  section_end:1686306200:step_script
  section_start:1686306200:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686306204:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43454558):
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
  Copying blob sha256:b39735705e69a2516323755ff4698ea5cd86b08b31d8c8287bc83d76d34c3bfc
  time="2023-06-09T10:23:03Z" level=fatal msg="Error reading config blob sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f: Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  section_end:1686306183:step_script
  section_start:1686306183:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686306184:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/904516
