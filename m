Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 11 Jul 2023 11:40:44 -0000
Message-ID: <168907564445.18664.5700557395563959593@emeril.freedesktop.org>
References: <20230711112009.122482-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230711112009.122482-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_E?=
 =?utf-8?q?xtend_intel=5Fblt_to_work_on_Xe_=28rev3=29?=
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

Series: Extend intel_blt to work on Xe (rev3)
URL   : https://patchwork.freedesktop.org/series/120162/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/932186 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45263081):
  time="2023-07-11T11:38:24Z" level=fatal msg="Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:8eb6dba554cffc072c7a6c696c8a23fc311e543399d84ab3ebc55c07ab54414f
  Copying config sha256:1de12428f6f470169eba22c18e53addae00d60e92ebe96b2c3bdd99c17c34010
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-07-11T11:38:32Z" level=warning msg="signal: killed"
  time="2023-07-11T11:38:32Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1689075513:step_script
  section_start:1689075513:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1689075516:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45263083):
      "DockerVersion": "",
      "Labels": {},
      "Architecture": "amd64",
      "Os": "linux",
      "Layers": [
          "sha256:a1c4b97398ec8bc7b17c52a01ef6941dc58811cb43f945b093db7a131586297a"
      ]
  }
  Skipping, already built
  Getting image source signatures
  Copying blob sha256:a1c4b97398ec8bc7b17c52a01ef6941dc58811cb43f945b093db7a131586297a
  Copying config sha256:7360075a71dacfc66f0b49b3271b9a459904dbe51c5760efac48fe52da27946c
  Writing manifest to image destination
  time="2023-07-11T11:38:23Z" level=fatal msg="Error writing manifest: Error uploading manifest commit-72ee64f2d536b357e190a6a85a90cdcebc7ed1e8 to registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64: received unexpected HTTP status: 500 Internal Server Error" 
  section_end:1689075504:step_script
  section_start:1689075504:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1689075504:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45263082):
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
  time="2023-07-11T11:38:22Z" level=fatal msg="Error trying to reuse blob sha256:45252bb38c9c74dfe76c4b3808269db61d3b2aebe5e26bf7fcd85e48b93e16f9 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/build-debian-armhf: 500 (Internal Server Error)" 
  section_end:1689075503:step_script
  section_start:1689075503:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1689075504:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45263084):
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
  time="2023-07-11T11:38:23Z" level=fatal msg="Error writing manifest: Error uploading manifest commit-72ee64f2d536b357e190a6a85a90cdcebc7ed1e8 to registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips: received unexpected HTTP status: 500 Internal Server Error" 
  section_end:1689075504:step_script
  section_start:1689075504:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1689075504:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45263085):
  time="2023-07-11T11:38:20Z" level=fatal msg="Error reading manifest dockerfile-d55a9096f48b128e63002d049c1e9ea16a6c5bee in registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora: received unexpected HTTP status: 500 Internal Server Error" 
  Building!
  STEP 1: FROM fedora:31
  Getting image source signatures
  Copying blob sha256:854946d575a439a894349addd141568875d7c1e673d3286b08250f3dde002e6a
  Copying config sha256:7e94ed77b448a8d2ff08b92d3ca743e4e862c744892d6886c73487581eb5863a
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN dnf install -y 	gcc flex bison libatomic meson ninja-build xdotool 	'pkgconfig(libdrm)' 	'pkgconfig(pciaccess)' 	'pkgconfig(libkmod)' 	'pkgconfig(libprocps)' 	'pkgconfig(libunwind)' 	'pkgconfig(libdw)' 	'pkgconfig(pixman-1)' 	'pkgconfig(valgrind)' 	'pkgconfig(cairo)' 	'pkgconfig(libudev)' 	'pkgconfig(glib-2.0)' 	'pkgconfig(gsl)' 	'pkgconfig(alsa)' 	'pkgconfig(xmlrpc)' 	'pkgconfig(xmlrpc_util)' 	'pkgconfig(xmlrpc_client)' 	'pkgconfig(json-c)' 	'pkgconfig(gtk-doc)' 	'pkgconfig(xv)' 	'pkgconfig(xrandr)' 	python3-docutils
  error running container: error creating container for [/bin/sh -c dnf install -y 	gcc flex bison libatomic meson ninja-build xdotool 	'pkgconfig(libdrm)' 	'pkgconfig(pciaccess)' 	'pkgconfig(libkmod)' 	'pkgconfig(libprocps)' 	'pkgconfig(libunwind)' 	'pkgconfig(libdw)' 	'pkgconfig(pixman-1)' 	'pkgconfig(valgrind)' 	'pkgconfig(cairo)' 	'pkgconfig(libudev)' 	'pkgconfig(glib-2.0)' 	'pkgconfig(gsl)' 	'pkgconfig(alsa)' 	'pkgconfig(xmlrpc)' 	'pkgconfig(xmlrpc_util)' 	'pkgconfig(xmlrpc_client)' 	'pkgconfig(json-c)' 	'pkgconfig(gtk-doc)' 	'pkgconfig(xv)' 	'pkgconfig(xrandr)' 	python3-docutils]: time="2023-07-11T11:38:26Z" level=warning msg="signal: killed"
  time="2023-07-11T11:38:26Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN dnf install -y 	gcc flex bison libatomic meson ninja-build xdotool 	'pkgconfig(libdrm)' 	'pkgconfig(pciaccess)' 	'pkgconfig(libkmod)' 	'pkgconfig(libprocps)' 	'pkgconfig(libunwind)' 	'pkgconfig(libdw)' 	'pkgconfig(pixman-1)' 	'pkgconfig(valgrind)' 	'pkgconfig(cairo)' 	'pkgconfig(libudev)' 	'pkgconfig(glib-2.0)' 	'pkgconfig(gsl)' 	'pkgconfig(alsa)' 	'pkgconfig(xmlrpc)' 	'pkgconfig(xmlrpc_util)' 	'pkgconfig(xmlrpc_client)' 	'pkgconfig(json-c)' 	'pkgconfig(gtk-doc)' 	'pkgconfig(xv)' 	'pkgconfig(xrandr)' 	python3-docutils": error while running runtime: exit status 1
  section_end:1689075506:step_script
  section_start:1689075506:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1689075507:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/932186
