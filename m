Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 12 Nov 2021 13:23:15 -0000
Message-ID: <163672339517.27231.4303986124027021793@emeril.freedesktop.org>
References: <20211112122752.29241-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20211112122752.29241-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/kms=5Fdsc=3A_To_test_modeset_on_highest_mode?=
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
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/kms_dsc: To test modeset on highest mode
URL   : https://patchwork.freedesktop.org/series/96854/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/445150 for the overview.

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/15758366):
  Running on runner-lb3m2qse-project-3185-concurrent-1 via fdo-packet-m1xl-3...
  section_end:1636722691:prepare_script
  section_start:1636722691:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out c9348b4f as intel/IGTPW_6395...
  
  Skipping Git submodules setup
  section_end:1636722697:get_sources
  section_start:1636722697:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-c9348b4f3ba6927ab40393552080a920589388e9 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1636722702:step_script
  section_start:1636722702:cleanup_file_variables
  Cleaning up file based variables
  section_end:1636722708:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: layer does not exist (docker.go:647:1s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/445150
