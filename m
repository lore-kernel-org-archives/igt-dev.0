Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Ser" <contact@emersion.fr>
Date: Thu, 27 Jul 2023 17:12:16 -0000
Message-ID: <169047793685.19794.671326106837583610@emeril.freedesktop.org>
References: <20230727140502.284387-1-contact@emersion.fr>
In-Reply-To: <20230727140502.284387-1-contact@emersion.fr>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_d?=
 =?utf-8?q?rm-uapi=3A_sync_with_drm-next?=
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

Series: drm-uapi: sync with drm-next
URL   : https://patchwork.freedesktop.org/series/121445/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/946227 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/46243246):
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
  Copying blob sha256:2f92e8d0541551f215cc8116b6a6507a714a936f45b19286a6664467db837932
  time="2023-07-27T17:08:06Z" level=fatal msg="Error reading config blob sha256:08904a47f4efcc161569a9b7f88c458fc6e3e85a2225132246af9cf5cc6c4e5b: Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  section_end:1690477687:step_script
  section_start:1690477687:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1690477688:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/46243248):
  time="2023-07-27T17:08:05Z" level=fatal msg="Error reading manifest dockerfile-f370b1c77e386827453db413b775a4c9bff41794 in registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64: received unexpected HTTP status: 500 Internal Server Error" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:8eb6dba554cffc072c7a6c696c8a23fc311e543399d84ab3ebc55c07ab54414f
  Copying config sha256:1de12428f6f470169eba22c18e53addae00d60e92ebe96b2c3bdd99c17c34010
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-07-27T17:08:09Z" level=warning msg="signal: killed"
  time="2023-07-27T17:08:09Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1690477690:step_script
  section_start:1690477690:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1690477693:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/46243247):
          "intel-IGT_5164"
      ],
      "Created": "2019-11-20T12:54:52.073706506Z",
      "DockerVersion": "",
      "Labels": {},
      "Architecture": "amd64",
      "Os": "linux",
      "Layers": [
          "sha256:45252bb38c9c74dfe76c4b3808269db61d3b2aebe5e26bf7fcd85e48b93e16f9"
      ]
  }
  Skipping, already built
  Getting image source signatures
  time="2023-07-27T17:08:10Z" level=fatal msg="Error trying to reuse blob sha256:45252bb38c9c74dfe76c4b3808269db61d3b2aebe5e26bf7fcd85e48b93e16f9 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/build-debian-armhf: 500 (Internal Server Error)" 
  section_end:1690477691:step_script
  section_start:1690477691:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1690477692:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/46243249):
          "intel-IGT_5164"
      ],
      "Created": "2021-01-22T08:26:53.390348642Z",
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
  time="2023-07-27T17:08:07Z" level=fatal msg="Error trying to reuse blob sha256:04854e5e3796b945522a085073b5a49cadad51bd1c5414c91654fa3d63d8db4d at destination: failed to read from destination repository gfx-ci/igt-ci-tags/build-debian-mips: 500 (Internal Server Error)" 
  section_end:1690477687:step_script
  section_start:1690477687:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1690477688:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/46243250):
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
  time="2023-07-27T17:08:10Z" level=fatal msg="Error trying to reuse blob sha256:b39735705e69a2516323755ff4698ea5cd86b08b31d8c8287bc83d76d34c3bfc at destination: failed to read from destination repository gfx-ci/igt-ci-tags/build-fedora: 500 (Internal Server Error)" 
  section_end:1690477691:step_script
  section_start:1690477691:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1690477693:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/946227
