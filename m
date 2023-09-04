Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Mon, 04 Sep 2023 12:46:59 -0000
Message-ID: <169383161988.21386.17201536929452516188@emeril.freedesktop.org>
References: <20230904110458.24177-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20230904110458.24177-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_copy_basic_test_to_exercise_blt_commands_=28rev2=29?=
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

Series: Add copy basic test to exercise blt commands (rev2)
URL   : https://patchwork.freedesktop.org/series/122615/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/977330 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48486597):
  time="2023-09-04T12:45:37Z" level=fatal msg="Error determining repository tags: Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-minimal/tags/list?last=commit-781e70b5d4038a4d241d8758d9ca089d374e9361&n=100: dial tcp 147.75.198.156:443: i/o timeout" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:d6b7393fb4f375905c31c483d81ce2a2905f88aba8cb198874da2b54035bc41d
  Copying config sha256:de08540e8ff0e470ff7956df4bed403725a5f45c186e9bf495da5344ff8fbe84
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-09-04T12:45:42Z" level=warning msg="signal: killed"
  time="2023-09-04T12:45:42Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1693831543:step_script
  section_start:1693831543:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693831543:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48486598):
  time="2023-09-04T12:45:25Z" level=fatal msg="Error determining repository tags: Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-armhf/tags/list?last=commit-096cfce286be2570ee14f0fe6c3969afdcf5e54e&n=100: dial tcp 147.75.198.156:443: i/o timeout" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:d6b7393fb4f375905c31c483d81ce2a2905f88aba8cb198874da2b54035bc41d
  Copying config sha256:de08540e8ff0e470ff7956df4bed403725a5f45c186e9bf495da5344ff8fbe84
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-09-04T12:45:29Z" level=warning msg="signal: killed"
  time="2023-09-04T12:45:29Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1693831530:step_script
  section_start:1693831530:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693831530:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48486600):
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out fd09cd4e as detached HEAD (ref is intel/IGTPW_9710)...
  
  Skipping Git submodules setup
  section_end:1693831505:get_sources
  section_start:1693831505:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
  Error: error authenticating creds for "registry.freedesktop.org": pinging docker registry returned: Get https://registry.freedesktop.org/v2/: dial tcp 147.75.198.156:443: i/o timeout
  section_end:1693831536:step_script
  section_start:1693831536:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693831536:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48486601):
  time="2023-09-04T12:45:44Z" level=fatal msg="Error determining repository tags: Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-fedora/tags/list?last=commit-223e782226f598acc33a9943caaeb4c9b220d470&n=100: dial tcp 147.75.198.156:443: i/o timeout" 
  Building!
  STEP 1: FROM fedora:31
  Getting image source signatures
  Copying blob sha256:854946d575a439a894349addd141568875d7c1e673d3286b08250f3dde002e6a
  Copying config sha256:7e94ed77b448a8d2ff08b92d3ca743e4e862c744892d6886c73487581eb5863a
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN dnf install -y 	gcc flex bison libatomic meson ninja-build xdotool 	'pkgconfig(libdrm)' 	'pkgconfig(pciaccess)' 	'pkgconfig(libkmod)' 	'pkgconfig(libprocps)' 	'pkgconfig(libunwind)' 	'pkgconfig(libdw)' 	'pkgconfig(pixman-1)' 	'pkgconfig(valgrind)' 	'pkgconfig(cairo)' 	'pkgconfig(libudev)' 	'pkgconfig(glib-2.0)' 	'pkgconfig(gsl)' 	'pkgconfig(alsa)' 	'pkgconfig(xmlrpc)' 	'pkgconfig(xmlrpc_util)' 	'pkgconfig(xmlrpc_client)' 	'pkgconfig(json-c)' 	'pkgconfig(gtk-doc)' 	'pkgconfig(xv)' 	'pkgconfig(xrandr)' 	python3-docutils
  error running container: error creating container for [/bin/sh -c dnf install -y 	gcc flex bison libatomic meson ninja-build xdotool 	'pkgconfig(libdrm)' 	'pkgconfig(pciaccess)' 	'pkgconfig(libkmod)' 	'pkgconfig(libprocps)' 	'pkgconfig(libunwind)' 	'pkgconfig(libdw)' 	'pkgconfig(pixman-1)' 	'pkgconfig(valgrind)' 	'pkgconfig(cairo)' 	'pkgconfig(libudev)' 	'pkgconfig(glib-2.0)' 	'pkgconfig(gsl)' 	'pkgconfig(alsa)' 	'pkgconfig(xmlrpc)' 	'pkgconfig(xmlrpc_util)' 	'pkgconfig(xmlrpc_client)' 	'pkgconfig(json-c)' 	'pkgconfig(gtk-doc)' 	'pkgconfig(xv)' 	'pkgconfig(xrandr)' 	python3-docutils]: time="2023-09-04T12:45:50Z" level=warning msg="signal: killed"
  time="2023-09-04T12:45:50Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN dnf install -y 	gcc flex bison libatomic meson ninja-build xdotool 	'pkgconfig(libdrm)' 	'pkgconfig(pciaccess)' 	'pkgconfig(libkmod)' 	'pkgconfig(libprocps)' 	'pkgconfig(libunwind)' 	'pkgconfig(libdw)' 	'pkgconfig(pixman-1)' 	'pkgconfig(valgrind)' 	'pkgconfig(cairo)' 	'pkgconfig(libudev)' 	'pkgconfig(glib-2.0)' 	'pkgconfig(gsl)' 	'pkgconfig(alsa)' 	'pkgconfig(xmlrpc)' 	'pkgconfig(xmlrpc_util)' 	'pkgconfig(xmlrpc_client)' 	'pkgconfig(json-c)' 	'pkgconfig(gtk-doc)' 	'pkgconfig(xv)' 	'pkgconfig(xrandr)' 	python3-docutils": error while running runtime: exit status 1
  section_end:1693831551:step_script
  section_start:1693831551:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693831551:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/977330
