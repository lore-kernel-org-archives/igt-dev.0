Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Add_Xe2_render-copy_imp?=
 =?utf-8?q?lementation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 08 Jan 2024 12:09:35 -0000
Message-ID: <170471577542.146943.9550877460967471626@5338d5abeb45>
References: <20240108113012.382557-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240108113012.382557-1-zbigniew.kempczynski@intel.com>
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

Series: Add Xe2 render-copy implementation
URL   : https://patchwork.freedesktop.org/series/128318/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1072960 for the overview.

test:list-undocumented-tests has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/53465678):
  Checking out 03df220a as detached HEAD (ref is intel/IGTPW_10484)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1704715585:get_sources
  section_start:1704715585:download_artifacts
  Downloading artifacts
  Downloading artifacts for build:tests-fedora (53465665)...
  Downloading artifacts from coordinator... ok        host=gitlab.freedesktop.org id=53465665 responseStatus=200 OK token=64_rDLpC
  section_end:1704715597:download_artifacts
  section_start:1704715597:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-03df220a1f18af2023cb4411281343cfa0168750 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1704715598:step_script
  section_start:1704715598:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1704715600:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f: image not known (docker.go:570:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1072960
