Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Tue, 27 Jun 2023 14:18:07 -0000
Message-ID: <168787548779.2458.5041429165062272680@emeril.freedesktop.org>
References: <20230627122305.4097852-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230627122305.4097852-1-himal.prasad.ghimiray@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_H?=
 =?utf-8?q?andle_GT_and_tile_seperation_in_IGT_=28rev2=29?=
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

Series: Handle GT and tile seperation in IGT (rev2)
URL   : https://patchwork.freedesktop.org/series/119801/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/920029 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44504477):
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
  time="2023-06-27T14:13:21Z" level=fatal msg="Error trying to reuse blob sha256:2f92e8d0541551f215cc8116b6a6507a714a936f45b19286a6664467db837932 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/build-debian-minimal: 500 (Internal Server Error)" 
  section_end:1687875202:step_script
  section_start:1687875202:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687875203:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44504479):
  time="2023-06-27T14:13:20Z" level=fatal msg="Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:ac8bb7e1a32398e26c129ce64e2ddc3e7ec6c34d93424b247f16049f5a91cff4
  Copying config sha256:49ae9acb659161695228c0667681983289fc1a40d5056e99a72eb66538086c15
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-06-27T14:13:27Z" level=warning msg="signal: killed"
  time="2023-06-27T14:13:27Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1687875208:step_script
  section_start:1687875208:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687875208:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44504478):
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
  time="2023-06-27T14:13:21Z" level=fatal msg="Error trying to reuse blob sha256:45252bb38c9c74dfe76c4b3808269db61d3b2aebe5e26bf7fcd85e48b93e16f9 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/build-debian-armhf: 500 (Internal Server Error)" 
  section_end:1687875201:step_script
  section_start:1687875201:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687875202:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44504480):
  time="2023-06-27T14:13:46Z" level=fatal msg="Error determining repository tags: Invalid status code returned when fetching tags list 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:ac8bb7e1a32398e26c129ce64e2ddc3e7ec6c34d93424b247f16049f5a91cff4
  Copying config sha256:49ae9acb659161695228c0667681983289fc1a40d5056e99a72eb66538086c15
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-06-27T14:13:53Z" level=warning msg="signal: killed"
  time="2023-06-27T14:13:53Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1687875236:step_script
  section_start:1687875236:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687875256:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44504481):
  time="2023-06-27T14:13:51Z" level=fatal msg="Invalid status code returned when fetching blob 500 (Internal Server Error)" 
  Building!
  STEP 1: FROM fedora:31
  Getting image source signatures
  Copying blob sha256:854946d575a439a894349addd141568875d7c1e673d3286b08250f3dde002e6a
  Copying config sha256:7e94ed77b448a8d2ff08b92d3ca743e4e862c744892d6886c73487581eb5863a
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN dnf install -y 	gcc flex bison libatomic meson ninja-build xdotool 	'pkgconfig(libdrm)' 	'pkgconfig(pciaccess)' 	'pkgconfig(libkmod)' 	'pkgconfig(libprocps)' 	'pkgconfig(libunwind)' 	'pkgconfig(libdw)' 	'pkgconfig(pixman-1)' 	'pkgconfig(valgrind)' 	'pkgconfig(cairo)' 	'pkgconfig(libudev)' 	'pkgconfig(glib-2.0)' 	'pkgconfig(gsl)' 	'pkgconfig(alsa)' 	'pkgconfig(xmlrpc)' 	'pkgconfig(xmlrpc_util)' 	'pkgconfig(xmlrpc_client)' 	'pkgconfig(json-c)' 	'pkgconfig(gtk-doc)' 	'pkgconfig(xv)' 	'pkgconfig(xrandr)' 	python3-docutils
  error running container: error creating container for [/bin/sh -c dnf install -y 	gcc flex bison libatomic meson ninja-build xdotool 	'pkgconfig(libdrm)' 	'pkgconfig(pciaccess)' 	'pkgconfig(libkmod)' 	'pkgconfig(libprocps)' 	'pkgconfig(libunwind)' 	'pkgconfig(libdw)' 	'pkgconfig(pixman-1)' 	'pkgconfig(valgrind)' 	'pkgconfig(cairo)' 	'pkgconfig(libudev)' 	'pkgconfig(glib-2.0)' 	'pkgconfig(gsl)' 	'pkgconfig(alsa)' 	'pkgconfig(xmlrpc)' 	'pkgconfig(xmlrpc_util)' 	'pkgconfig(xmlrpc_client)' 	'pkgconfig(json-c)' 	'pkgconfig(gtk-doc)' 	'pkgconfig(xv)' 	'pkgconfig(xrandr)' 	python3-docutils]: time="2023-06-27T14:14:03Z" level=warning msg="signal: killed"
  time="2023-06-27T14:14:03Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN dnf install -y 	gcc flex bison libatomic meson ninja-build xdotool 	'pkgconfig(libdrm)' 	'pkgconfig(pciaccess)' 	'pkgconfig(libkmod)' 	'pkgconfig(libprocps)' 	'pkgconfig(libunwind)' 	'pkgconfig(libdw)' 	'pkgconfig(pixman-1)' 	'pkgconfig(valgrind)' 	'pkgconfig(cairo)' 	'pkgconfig(libudev)' 	'pkgconfig(glib-2.0)' 	'pkgconfig(gsl)' 	'pkgconfig(alsa)' 	'pkgconfig(xmlrpc)' 	'pkgconfig(xmlrpc_util)' 	'pkgconfig(xmlrpc_client)' 	'pkgconfig(json-c)' 	'pkgconfig(gtk-doc)' 	'pkgconfig(xv)' 	'pkgconfig(xrandr)' 	python3-docutils": error while running runtime: exit status 1
  section_end:1687875246:step_script
  section_start:1687875246:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687875256:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/920029
