Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melissa Wen" <mwen@igalia.com>
Date: Wed, 25 May 2022 18:16:29 -0000
Message-ID: <165350258982.16575.7928872731591974592@emeril.freedesktop.org>
References: <20220525170939.141509-1-mwen@igalia.com>
In-Reply-To: <20220525170939.141509-1-mwen@igalia.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?est/kms=5Fplane=5Falpha=5Fblend=3A_clearer_validation_for_cover?=
 =?utf-8?q?age-7efc?=
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

Series: test/kms_plane_alpha_blend: clearer validation for coverage-7efc
URL   : https://patchwork.freedesktop.org/series/104366/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/595872 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/23136029):
  Preparing environment
  Running on runner-jda81xmt-project-3185-concurrent-1 via fdo-equinix-m3l-9...
  section_end:1653502402:prepare_script
  section_start:1653502402:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 8ea6a654 as intel/IGTPW_7173...
  
  Skipping Git submodules setup
  section_end:1653502403:get_sources
  section_start:1653502403:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:ca01fc804bb92e5df42a202dd7e0470610c6711c66a808525defcb8bbb774078 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-8ea6a654a9a672d82bd075b77d20d82928d79523 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian@sha256:b9fe73c6ff5d68f5692fd18b9076735679c8bfa7ed393e752dd4927a2cdf9874 ...
  section_end:1653502404:step_script
  section_start:1653502404:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1653502405:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: failed to get digest sha256:ca01fc804bb92e5df42a202dd7e0470610c6711c66a808525defcb8bbb774078: open /var/lib/docker/image/overlay2/imagedb/content/sha256/ca01fc804bb92e5df42a202dd7e0470610c6711c66a808525defcb8bbb774078: no such file or directory (docker.go:654:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/595872
