Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Date: Tue, 29 Aug 2023 15:01:16 -0000
Message-ID: <169332127623.16748.12906787887724126295@emeril.freedesktop.org>
References: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_test_for_Plane_Color_pipeline_UAPI=27s?=
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

Series: Add test for Plane Color pipeline UAPI's
URL   : https://patchwork.freedesktop.org/series/123018/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/972587 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48167954):
  Running with gitlab-runner 16.3.0 (8ec04662)
    on fdo-equinix-m3l-24 mWs1W337, system ID: r_v5KEYEFcG37a
  section_start:1693321133:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  WARNING: Failed to pull image with policy "if-not-present": Error response from daemon: {"progressDetail":{},"errorDetail":{"message":"parsing image configuration: fetching blob: blob unknown to registry"},"error":"parsing image configuration: fetching blob: blob unknown to registry"} (manager.go:237:4s)
  section_end:1693321138:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0" with specified policies [if-not-present]: Error response from daemon: {"progressDetail":{},"errorDetail":{"message":"parsing image configuration: fetching blob: blob unknown to registry"},"error":"parsing image configuration: fetching blob: blob unknown to registry"} (manager.go:237:4s)
  

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48167956):
  Running with gitlab-runner 16.3.0 (8ec04662)
    on fdo-equinix-m3l-24 mWs1W337, system ID: r_v5KEYEFcG37a
  section_start:1693321134:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  WARNING: Failed to pull image with policy "if-not-present": Error response from daemon: {"progressDetail":{},"errorDetail":{"message":"parsing image configuration: fetching blob: blob unknown to registry"},"error":"parsing image configuration: fetching blob: blob unknown to registry"} (manager.go:237:4s)
  section_end:1693321139:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0" with specified policies [if-not-present]: Error response from daemon: {"progressDetail":{},"errorDetail":{"message":"parsing image configuration: fetching blob: blob unknown to registry"},"error":"parsing image configuration: fetching blob: blob unknown to registry"} (manager.go:237:4s)
  

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48167955):
  time="2023-08-29T14:58:58Z" level=fatal msg="Invalid status code returned when fetching blob 404 (Not Found)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:d6b7393fb4f375905c31c483d81ce2a2905f88aba8cb198874da2b54035bc41d
  Copying config sha256:de08540e8ff0e470ff7956df4bed403725a5f45c186e9bf495da5344ff8fbe84
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-08-29T14:59:02Z" level=warning msg="signal: killed"
  time="2023-08-29T14:59:02Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1693321143:step_script
  section_start:1693321143:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693321143:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48167957):
  time="2023-08-29T14:58:58Z" level=fatal msg="Invalid status code returned when fetching blob 404 (Not Found)" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:d6b7393fb4f375905c31c483d81ce2a2905f88aba8cb198874da2b54035bc41d
  Copying config sha256:de08540e8ff0e470ff7956df4bed403725a5f45c186e9bf495da5344ff8fbe84
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-08-29T14:59:02Z" level=warning msg="signal: killed"
  time="2023-08-29T14:59:02Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1693321143:step_script
  section_start:1693321143:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1693321143:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48167958):
  Running with gitlab-runner 16.3.0 (8ec04662)
    on fdo-equinix-m3l-24 mWs1W337, system ID: r_v5KEYEFcG37a
  section_start:1693321134:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  WARNING: Failed to pull image with policy "if-not-present": Error response from daemon: {"progressDetail":{},"errorDetail":{"message":"parsing image configuration: fetching blob: blob unknown to registry"},"error":"parsing image configuration: fetching blob: blob unknown to registry"} (manager.go:237:4s)
  section_end:1693321139:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0" with specified policies [if-not-present]: Error response from daemon: {"progressDetail":{},"errorDetail":{"message":"parsing image configuration: fetching blob: blob unknown to registry"},"error":"parsing image configuration: fetching blob: blob unknown to registry"} (manager.go:237:4s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/972587
