Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Mon, 04 Sep 2023 13:27:12 -0000
Message-ID: <169383403271.21389.3558377660604465373@emeril.freedesktop.org>
References: <20230904132415.3131740-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230904132415.3131740-1-tejas.upadhyay@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/xe=3A_Add_tests_to_read_and_verify_fdinfo?=
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

Series: tests/xe: Add tests to read and verify fdinfo
URL   : https://patchwork.freedesktop.org/series/123249/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/977355 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48488920):
  section_end:1693833733:prepare_executor
  section_start:1693833733:prepare_script
  Preparing environment
  Running on runner-m5dzqx4r-project-3185-concurrent-0 via 15ca4cde06bd...
  section_end:1693833734:prepare_script
  section_start:1693833734:get_sources
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  fatal: unable to access 'https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags.git/': Failed to connect to gitlab.freedesktop.org port 443 after 128842 ms: Couldn't connect to server
  section_end:1693833864:get_sources
  section_start:1693833864:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693833864:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48488922):
  time="2023-09-04T13:22:48Z" level=fatal msg="pinging docker registry returned: Get https://registry.freedesktop.org/v2/: dial tcp 147.75.198.156:443: i/o timeout" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:d6b7393fb4f375905c31c483d81ce2a2905f88aba8cb198874da2b54035bc41d
  Copying config sha256:de08540e8ff0e470ff7956df4bed403725a5f45c186e9bf495da5344ff8fbe84
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-09-04T13:22:52Z" level=warning msg="signal: killed"
  time="2023-09-04T13:22:52Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1693833773:step_script
  section_start:1693833773:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693833773:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48488921):
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
  Copying blob sha256:45252bb38c9c74dfe76c4b3808269db61d3b2aebe5e26bf7fcd85e48b93e16f9
  Copying config sha256:4a4103f1a476d355d866b481ff96ac05a32a3a715cefcc1cbc1356a8959fb5f8
  Writing manifest to image destination
  time="2023-09-04T13:23:01Z" level=fatal msg="Error writing manifest: Put https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-armhf/manifests/commit-b46d794a03b73bf8ab877c7240b58f1e17575fd2: dial tcp: lookup registry.freedesktop.org on 147.75.207.208:53: read udp 10.88.199.218:53108->147.75.207.208:53: i/o timeout" 
  section_end:1693833782:step_script
  section_start:1693833782:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693833782:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48488923):
  time="2023-09-04T13:23:03Z" level=fatal msg="Error determining repository tags: Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-mips/tags/list?last=commit-86ad7feeadba42668b7d8f1c822526515a0767a8&n=100: dial tcp 147.75.198.156:443: i/o timeout" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:d6b7393fb4f375905c31c483d81ce2a2905f88aba8cb198874da2b54035bc41d
  Copying config sha256:de08540e8ff0e470ff7956df4bed403725a5f45c186e9bf495da5344ff8fbe84
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-09-04T13:23:22Z" level=warning msg="signal: killed"
  time="2023-09-04T13:23:22Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1693833803:step_script
  section_start:1693833803:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693833803:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48488924):
  time="2023-09-04T13:22:55Z" level=fatal msg="Error determining repository tags: Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-fedora/tags/list?last=commit-2824470eeed46d448ccc8111f96736da3abe66b5&n=100: dial tcp 147.75.198.156:443: i/o timeout" 
  Building!
  STEP 1: FROM fedora:31
  Getting image source signatures
  Copying blob sha256:c28ace6b0c4ae099f6f81091731bdf41d9771d28bad96ae4a3507fe950560930
  Copying config sha256:a7a37f74ff864eec55891b64ad360d07020827486e30a92ea81d16459645b26a
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN dnf install -y 	gcc flex bison libatomic meson ninja-build xdotool 	'pkgconfig(libdrm)' 	'pkgconfig(pciaccess)' 	'pkgconfig(libkmod)' 	'pkgconfig(libprocps)' 	'pkgconfig(libunwind)' 	'pkgconfig(libdw)' 	'pkgconfig(pixman-1)' 	'pkgconfig(valgrind)' 	'pkgconfig(cairo)' 	'pkgconfig(libudev)' 	'pkgconfig(glib-2.0)' 	'pkgconfig(gsl)' 	'pkgconfig(alsa)' 	'pkgconfig(xmlrpc)' 	'pkgconfig(xmlrpc_util)' 	'pkgconfig(xmlrpc_client)' 	'pkgconfig(json-c)' 	'pkgconfig(gtk-doc)' 	'pkgconfig(xv)' 	'pkgconfig(xrandr)' 	python3-docutils
  error running container: error creating container for [/bin/sh -c dnf install -y 	gcc flex bison libatomic meson ninja-build xdotool 	'pkgconfig(libdrm)' 	'pkgconfig(pciaccess)' 	'pkgconfig(libkmod)' 	'pkgconfig(libprocps)' 	'pkgconfig(libunwind)' 	'pkgconfig(libdw)' 	'pkgconfig(pixman-1)' 	'pkgconfig(valgrind)' 	'pkgconfig(cairo)' 	'pkgconfig(libudev)' 	'pkgconfig(glib-2.0)' 	'pkgconfig(gsl)' 	'pkgconfig(alsa)' 	'pkgconfig(xmlrpc)' 	'pkgconfig(xmlrpc_util)' 	'pkgconfig(xmlrpc_client)' 	'pkgconfig(json-c)' 	'pkgconfig(gtk-doc)' 	'pkgconfig(xv)' 	'pkgconfig(xrandr)' 	python3-docutils]: time="2023-09-04T13:23:43Z" level=warning msg="signal: killed"
  time="2023-09-04T13:23:43Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN dnf install -y 	gcc flex bison libatomic meson ninja-build xdotool 	'pkgconfig(libdrm)' 	'pkgconfig(pciaccess)' 	'pkgconfig(libkmod)' 	'pkgconfig(libprocps)' 	'pkgconfig(libunwind)' 	'pkgconfig(libdw)' 	'pkgconfig(pixman-1)' 	'pkgconfig(valgrind)' 	'pkgconfig(cairo)' 	'pkgconfig(libudev)' 	'pkgconfig(glib-2.0)' 	'pkgconfig(gsl)' 	'pkgconfig(alsa)' 	'pkgconfig(xmlrpc)' 	'pkgconfig(xmlrpc_util)' 	'pkgconfig(xmlrpc_client)' 	'pkgconfig(json-c)' 	'pkgconfig(gtk-doc)' 	'pkgconfig(xv)' 	'pkgconfig(xrandr)' 	python3-docutils": error while running runtime: exit status 1
  section_end:1693833823:step_script
  section_start:1693833823:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693833823:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/977355
