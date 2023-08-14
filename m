Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Date: Mon, 14 Aug 2023 19:29:42 -0000
Message-ID: <169204138211.19472.12041816202611211336@emeril.freedesktop.org>
References: <20230814181316.408017-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20230814181316.408017-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915=5Fpm=5Ffreq=5Fapi=3A_Ignore_zero_register_value_=28re?=
 =?utf-8?b?djIp?=
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

Series: tests/i915_pm_freq_api: Ignore zero register value (rev2)
URL   : https://patchwork.freedesktop.org/series/122187/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/961188 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47374657):
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
  time="2023-08-14T19:24:38Z" level=fatal msg="Error trying to reuse blob sha256:2f92e8d0541551f215cc8116b6a6507a714a936f45b19286a6664467db837932 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/build-debian-minimal: 500 (Internal Server Error)" 
  section_end:1692041078:step_script
  section_start:1692041078:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692041079:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47374659):
  time="2023-08-14T19:24:36Z" level=fatal msg="Error reading manifest dockerfile-f370b1c77e386827453db413b775a4c9bff41794 in registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64: received unexpected HTTP status: 500 Internal Server Error" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:9918064ebccea7fc961fe71dad46105b217763b4b1b3a9dfa7bee2ab29d2039b
  Copying config sha256:1df4474660a180f2a805d8477b78f9774d302afb2d31118106bffc0cb144e910
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-08-14T19:24:40Z" level=warning msg="signal: killed"
  time="2023-08-14T19:24:40Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1692041081:step_script
  section_start:1692041081:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692041082:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47374658):
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
  time="2023-08-14T19:24:38Z" level=fatal msg="Error trying to reuse blob sha256:45252bb38c9c74dfe76c4b3808269db61d3b2aebe5e26bf7fcd85e48b93e16f9 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/build-debian-armhf: 500 (Internal Server Error)" 
  section_end:1692041079:step_script
  section_start:1692041079:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692041079:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/961188
