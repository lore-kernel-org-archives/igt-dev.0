Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 07 Jun 2023 17:43:31 -0000
Message-ID: <168615981145.21180.2267443665369359896@emeril.freedesktop.org>
References: <20230607174028.77235-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230607174028.77235-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/xe=5Fcreate=3A_Add_multiple_engines_create/destroy_subtest?=
 =?utf-8?q?_=28rev2=29?=
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

Series: tests/xe_create: Add multiple engines create/destroy subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/118931/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/902568 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43314197):
  time="2023-06-07T17:41:13Z" level=fatal msg="Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:c722db24a050621ee87ea07acd5d066d3d6a94737c32012f27d73a1ad5cc645c
  Copying config sha256:8b5601a5a7f855241ac7f372ec0042e793b0b3eb3f3a601014845f22bd371c90
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-06-07T17:41:18Z" level=warning msg="signal: killed"
  time="2023-06-07T17:41:18Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1686159679:step_script
  section_start:1686159679:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686159681:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43314199):
  time="2023-06-07T17:41:11Z" level=fatal msg="Error determining repository tags: Invalid status code returned when fetching tags list 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:c722db24a050621ee87ea07acd5d066d3d6a94737c32012f27d73a1ad5cc645c
  Copying config sha256:8b5601a5a7f855241ac7f372ec0042e793b0b3eb3f3a601014845f22bd371c90
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-06-07T17:41:16Z" level=warning msg="signal: killed"
  time="2023-06-07T17:41:16Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1686159676:step_script
  section_start:1686159677:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686159677:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43314198):
  time="2023-06-07T17:41:15Z" level=fatal msg="Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:c722db24a050621ee87ea07acd5d066d3d6a94737c32012f27d73a1ad5cc645c
  Copying config sha256:8b5601a5a7f855241ac7f372ec0042e793b0b3eb3f3a601014845f22bd371c90
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-06-07T17:41:19Z" level=warning msg="signal: killed"
  time="2023-06-07T17:41:19Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1686159680:step_script
  section_start:1686159680:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686159683:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43314200):
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
  Copying blob sha256:04854e5e3796b945522a085073b5a49cadad51bd1c5414c91654fa3d63d8db4d
  time="2023-06-07T17:41:13Z" level=fatal msg="Error reading config blob sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448: Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  section_end:1686159673:step_script
  section_start:1686159673:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686159673:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43314201):
  time="2023-06-07T17:41:17Z" level=fatal msg="Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM fedora:31
  Getting image source signatures
  Copying blob sha256:854946d575a439a894349addd141568875d7c1e673d3286b08250f3dde002e6a
  Copying config sha256:7e94ed77b448a8d2ff08b92d3ca743e4e862c744892d6886c73487581eb5863a
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN dnf install -y 	gcc flex bison libatomic meson ninja-build xdotool 	'pkgconfig(libdrm)' 	'pkgconfig(pciaccess)' 	'pkgconfig(libkmod)' 	'pkgconfig(libprocps)' 	'pkgconfig(libunwind)' 	'pkgconfig(libdw)' 	'pkgconfig(pixman-1)' 	'pkgconfig(valgrind)' 	'pkgconfig(cairo)' 	'pkgconfig(libudev)' 	'pkgconfig(glib-2.0)' 	'pkgconfig(gsl)' 	'pkgconfig(alsa)' 	'pkgconfig(xmlrpc)' 	'pkgconfig(xmlrpc_util)' 	'pkgconfig(xmlrpc_client)' 	'pkgconfig(json-c)' 	'pkgconfig(gtk-doc)' 	'pkgconfig(xv)' 	'pkgconfig(xrandr)' 	python3-docutils
  error running container: error creating container for [/bin/sh -c dnf install -y 	gcc flex bison libatomic meson ninja-build xdotool 	'pkgconfig(libdrm)' 	'pkgconfig(pciaccess)' 	'pkgconfig(libkmod)' 	'pkgconfig(libprocps)' 	'pkgconfig(libunwind)' 	'pkgconfig(libdw)' 	'pkgconfig(pixman-1)' 	'pkgconfig(valgrind)' 	'pkgconfig(cairo)' 	'pkgconfig(libudev)' 	'pkgconfig(glib-2.0)' 	'pkgconfig(gsl)' 	'pkgconfig(alsa)' 	'pkgconfig(xmlrpc)' 	'pkgconfig(xmlrpc_util)' 	'pkgconfig(xmlrpc_client)' 	'pkgconfig(json-c)' 	'pkgconfig(gtk-doc)' 	'pkgconfig(xv)' 	'pkgconfig(xrandr)' 	python3-docutils]: time="2023-06-07T17:41:24Z" level=warning msg="signal: killed"
  time="2023-06-07T17:41:24Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN dnf install -y 	gcc flex bison libatomic meson ninja-build xdotool 	'pkgconfig(libdrm)' 	'pkgconfig(pciaccess)' 	'pkgconfig(libkmod)' 	'pkgconfig(libprocps)' 	'pkgconfig(libunwind)' 	'pkgconfig(libdw)' 	'pkgconfig(pixman-1)' 	'pkgconfig(valgrind)' 	'pkgconfig(cairo)' 	'pkgconfig(libudev)' 	'pkgconfig(glib-2.0)' 	'pkgconfig(gsl)' 	'pkgconfig(alsa)' 	'pkgconfig(xmlrpc)' 	'pkgconfig(xmlrpc_util)' 	'pkgconfig(xmlrpc_client)' 	'pkgconfig(json-c)' 	'pkgconfig(gtk-doc)' 	'pkgconfig(xv)' 	'pkgconfig(xrandr)' 	python3-docutils": error while running runtime: exit status 1
  section_end:1686159685:step_script
  section_start:1686159685:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686159686:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/902568
