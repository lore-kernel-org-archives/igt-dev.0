Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 31 Aug 2023 13:34:02 -0000
Message-ID: <169348884296.12508.2760393968288773661@emeril.freedesktop.org>
References: <20230831125823.464595-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230831125823.464595-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?cripts/test=5Flist=2Epy=3A_enforce_mandatory_fields_to_be_fille?=
 =?utf-8?q?d?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: scripts/test_list.py: enforce mandatory fields to be filled
URL   : https://patchwork.freedesktop.org/series/123111/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/974496 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48303007):
  time="2023-08-31T13:30:58Z" level=fatal msg="Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian/manifests/dockerfile-4c2929c9dd27567d233d485e532d992eaf34d7d0: dial tcp 147.75.198.156:443: i/o timeout" 
  Building!
  STEP 1: FROM registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-3d166a0af50b13bbc3693b8bcefb1ffd5bd757b8
  Getting image source signatures
  Copying blob sha256:2f92e8d0541551f215cc8116b6a6507a714a936f45b19286a6664467db837932
  Copying config sha256:08904a47f4efcc161569a9b7f88c458fc6e3e85a2225132246af9cf5cc6c4e5b
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-08-31T13:31:13Z" level=warning msg="signal: killed"
  time="2023-08-31T13:31:13Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1693488674:step_script
  section_start:1693488674:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693488674:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48303009):
  time="2023-08-31T13:30:37Z" level=fatal msg="Error determining repository tags: Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-arm64/tags/list?last=commit-06833ffeaf7621c3fef097166539bbe999a33e9c&n=100: dial tcp 147.75.198.156:443: i/o timeout" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:d6b7393fb4f375905c31c483d81ce2a2905f88aba8cb198874da2b54035bc41d
  Copying config sha256:de08540e8ff0e470ff7956df4bed403725a5f45c186e9bf495da5344ff8fbe84
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-08-31T13:30:42Z" level=warning msg="signal: killed"
  time="2023-08-31T13:30:42Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1693488642:step_script
  section_start:1693488642:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693488643:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48303008):
  time="2023-08-31T13:30:38Z" level=fatal msg="Error determining repository tags: Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-armhf/tags/list?last=commit-344887237473c73b09a3cd6893d97e5abf5a229d&n=100: dial tcp 147.75.198.156:443: i/o timeout" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:d6b7393fb4f375905c31c483d81ce2a2905f88aba8cb198874da2b54035bc41d
  Copying config sha256:de08540e8ff0e470ff7956df4bed403725a5f45c186e9bf495da5344ff8fbe84
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-08-31T13:30:42Z" level=warning msg="signal: killed"
  time="2023-08-31T13:30:42Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1693488643:step_script
  section_start:1693488643:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693488643:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48303010):
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 3d166a0a as detached HEAD (ref is intel/IGTPW_9694)...
  
  Skipping Git submodules setup
  section_end:1693488597:get_sources
  section_start:1693488597:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
  Error: error authenticating creds for "registry.freedesktop.org": Get https://registry.freedesktop.org/v2/: net/http: TLS handshake timeout
  section_end:1693488608:step_script
  section_start:1693488608:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693488609:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/974496

