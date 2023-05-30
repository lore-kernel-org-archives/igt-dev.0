Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Date: Tue, 30 May 2023 14:04:30 -0000
Message-ID: <168545547082.18935.2898512460297433072@emeril.freedesktop.org>
References: <20230529151754.322440-1-christoph.manszewski@intel.com>
In-Reply-To: <20230529151754.322440-1-christoph.manszewski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?ib/intel=5Fbb=3A_Enable_custom_engine_support_for_xe_=28rev3=29?=
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

Series: lib/intel_bb: Enable custom engine support for xe (rev3)
URL   : https://patchwork.freedesktop.org/series/118227/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/894550 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42709996):
  time="2023-05-30T13:59:33Z" level=fatal msg="Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:c722db24a050621ee87ea07acd5d066d3d6a94737c32012f27d73a1ad5cc645c
  Copying config sha256:8b5601a5a7f855241ac7f372ec0042e793b0b3eb3f3a601014845f22bd371c90
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-05-30T13:59:38Z" level=warning msg="signal: killed"
  time="2023-05-30T13:59:38Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1685455180:step_script
  section_start:1685455180:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685455181:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42709998):
  time="2023-05-30T13:59:49Z" level=fatal msg="Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:c722db24a050621ee87ea07acd5d066d3d6a94737c32012f27d73a1ad5cc645c
  Copying config sha256:8b5601a5a7f855241ac7f372ec0042e793b0b3eb3f3a601014845f22bd371c90
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-05-30T13:59:55Z" level=warning msg="signal: killed"
  time="2023-05-30T13:59:55Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1685455196:step_script
  section_start:1685455196:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685455197:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42709997):
  time="2023-05-30T13:59:34Z" level=fatal msg="Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:c722db24a050621ee87ea07acd5d066d3d6a94737c32012f27d73a1ad5cc645c
  Copying config sha256:8b5601a5a7f855241ac7f372ec0042e793b0b3eb3f3a601014845f22bd371c90
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-05-30T13:59:39Z" level=warning msg="signal: killed"
  time="2023-05-30T13:59:39Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1685455180:step_script
  section_start:1685455180:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685455181:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42709999):
  time="2023-05-30T14:00:12Z" level=fatal msg="Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:c722db24a050621ee87ea07acd5d066d3d6a94737c32012f27d73a1ad5cc645c
  Copying config sha256:8b5601a5a7f855241ac7f372ec0042e793b0b3eb3f3a601014845f22bd371c90
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-05-30T14:00:17Z" level=warning msg="signal: killed"
  time="2023-05-30T14:00:17Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1685455220:step_script
  section_start:1685455220:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685455223:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42710000):
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
  Copying config sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f
  Writing manifest to image destination
  time="2023-05-30T14:00:05Z" level=fatal msg="Error writing manifest: Error uploading manifest commit-593f5a445f3b5d0d94702273da07c4aa0097c794 to registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora: received unexpected HTTP status: 500 Internal Server Error" 
  section_end:1685455205:step_script
  section_start:1685455205:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685455207:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/894550
