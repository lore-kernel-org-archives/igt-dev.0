Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lobo, Melanie" <melanie.lobo@intel.com>
Date: Tue, 24 Oct 2023 07:46:02 -0000
Message-ID: <169813356216.18361.4540167359187985901@emeril.freedesktop.org>
References: <20231010134540.28485-1-melanie.lobo@intel.com>
In-Reply-To: <20231010134540.28485-1-melanie.lobo@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/intel/kms=5Fflip=5Fscaled=5Fcrc=3A_Add_support_for_FP16_fo?=
 =?utf-8?q?rmat_of_MTL_compressed_modifier_=28rev7=29?=
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

Series: tests/intel/kms_flip_scaled_crc: Add support for FP16 format of MTL compressed modifier (rev7)
URL   : https://patchwork.freedesktop.org/series/124956/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1017377 for the overview.

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50673735):
  time="2023-10-24T07:44:03Z" level=fatal msg="Error determining repository tags: unexpected http code: 500 (Internal Server Error), URL: https://gitlab.freedesktop.org/jwt/auth?account=gitlab-ci-token&scope=repository%3Agfx-ci%2Figt-ci-tags%2Fbuild-debian-arm64%3Apull&service=container_registry" 
  Building!
  STEP 1: FROM debian:buster
  Getting image source signatures
  Copying blob sha256:99db33be616a9a2a0b0b1bc913b548317bab7bd11cb6968d357457e201c44077
  Copying config sha256:75719d2c3a70cb6ce34a3faf75de7ff2e97fbd34137e6c2aa86bfe9043c963af
  Writing manifest to image destination
  Storing signatures
  STEP 2: RUN apt-get update
  error running container: error creating container for [/bin/sh -c apt-get update]: time="2023-10-24T07:44:13Z" level=warning msg="signal: killed"
  time="2023-10-24T07:44:13Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
  container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\""
  : exit status 1
  Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1
  section_end:1698133455:step_script
  section_start:1698133455:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698133458:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1017377
