Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 19 Jul 2022 07:45:27 -0000
Message-ID: <165821672767.16364.15355666638552491165@emeril.freedesktop.org>
References: <20220719072451.12323-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220719072451.12323-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_pinned_to_perf=5Fpmu_and_remove_store_dword?=
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

Series: Add pinned to perf_pmu and remove store dword
URL   : https://patchwork.freedesktop.org/series/106467/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/641678 for the overview.

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/25547804):
  section_end:1658216332:prepare_script
  section_start:1658216332:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 877b983a as intel/IGTPW_7539...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  
  Skipping Git submodules setup
  section_end:1658216334:get_sources
  section_start:1658216334:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-877b983af2d0be935bd7f8bfe4e7d14f9185ada9 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1658216335:step_script
  section_start:1658216335:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1658216337:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: failed to get digest sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f: open /var/lib/docker/image/overlay2/imagedb/content/sha256/4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f: no such file or directory (docker.go:654:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/641678
