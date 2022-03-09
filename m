Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomeu Vizoso" <tomeu.vizoso@collabora.com>
Date: Wed, 09 Mar 2022 11:28:47 -0000
Message-ID: <164682532761.14946.5626370074942569463@emeril.freedesktop.org>
References: <20220309074242.65066-1-tomeu.vizoso@collabora.com>
In-Reply-To: <20220309074242.65066-1-tomeu.vizoso@collabora.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_R?=
 =?utf-8?q?un_CI_on_Qualcomm_devices?=
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

Series: Run CI on Qualcomm devices
URL   : https://patchwork.freedesktop.org/series/101195/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/527408 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19569113):
  Copying config sha256:d40157244907583ef151d2de83245c018a7bf8b2025518dd1e108ec60c1a679c
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2022-03-09T11:17:43Z" level=warning msg="signal: killed"
  time="2022-03-09T11:17:43Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1646824665:step_script
  section_start:1646824665:after_script
  Running after_script
  Running after script...
  $ set +x # collapsed multi-line command
  section_end:1646824665:after_script
  section_start:1646824665:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646824666:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19569115):
  Copying config sha256:d40157244907583ef151d2de83245c018a7bf8b2025518dd1e108ec60c1a679c
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2022-03-09T11:18:51Z" level=warning msg="signal: killed"
  time="2022-03-09T11:18:51Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1646824732:step_script
  section_start:1646824732:after_script
  Running after_script
  Running after script...
  $ set +x # collapsed multi-line command
  section_end:1646824732:after_script
  section_start:1646824732:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646824733:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19569114):
  Copying config sha256:739ca6e61c271e6bbdebda5871516b2761aaa8efbfbd7868fa25dfcedc8161b1
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2022-03-09T11:18:17Z" level=warning msg="signal: killed"
  time="2022-03-09T11:18:17Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1646824699:step_script
  section_start:1646824699:after_script
  Running after_script
  Running after script...
  $ set +x # collapsed multi-line command
  section_end:1646824700:after_script
  section_start:1646824700:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646824700:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19569116):
  Copying config sha256:739ca6e61c271e6bbdebda5871516b2761aaa8efbfbd7868fa25dfcedc8161b1
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2022-03-09T11:19:24Z" level=warning msg="signal: killed"
  time="2022-03-09T11:19:24Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1646824764:step_script
  section_start:1646824764:after_script
  Running after_script
  Running after script...
  $ set +x # collapsed multi-line command
  section_end:1646824765:after_script
  section_start:1646824765:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646824765:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/527408
