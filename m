Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 16 Nov 2021 08:58:27 -0000
Message-ID: <163705310738.28808.11670151961839263927@emeril.freedesktop.org>
References: <20211112122752.29241-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20211112122752.29241-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/kms=5Fdsc=3A_To_test_modeset_on_highest_mode_=28rev6?=
 =?utf-8?q?=29?=
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

Series: tests/i915/kms_dsc: To test modeset on highest mode (rev6)
URL   : https://patchwork.freedesktop.org/series/96854/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/447284 for the overview.

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/15855831):
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 4da6e2d9 as intel/IGTPW_6402...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  
  Skipping Git submodules setup
  section_end:1637052718:get_sources
  section_start:1637052718:step_script
  Executing "step_script" stage of the job script
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-4da6e2d96a6dfb79ccffdfcb1c819ff007dcc4d9 ...
  Using docker image sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-4da6e2d96a6dfb79ccffdfcb1c819ff007dcc4d9 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips@sha256:c829c44880da4782b7a72626c259ac6904b4bd5f08601e66b3be889ca1c0cf79 ...
  section_end:1637052896:step_script
  section_start:1637052896:cleanup_file_variables
  Cleaning up file based variables
  section_end:1637052919:cleanup_file_variables
  ERROR: Job failed (system failure): Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running? (docker.go:647:120s)
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/15855822):
  section_start:1637052710:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 4da6e2d9 as intel/IGTPW_6402...
  
  Skipping Git submodules setup
  section_end:1637052718:get_sources
  section_start:1637052718:step_script
  Executing "step_script" stage of the job script
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-4da6e2d96a6dfb79ccffdfcb1c819ff007dcc4d9 ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-4da6e2d96a6dfb79ccffdfcb1c819ff007dcc4d9 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1637052885:step_script
  section_start:1637052885:cleanup_file_variables
  Cleaning up file based variables
  section_end:1637052918:cleanup_file_variables
  ERROR: Job failed (system failure): Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running? (docker.go:647:120s)
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/15855823):
  section_start:1637052710:get_sources
  Getting source from Git repository
  $ eval "$CI_PRE_CLONE_SCRIPT"
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 4da6e2d9 as intel/IGTPW_6402...
  
  Skipping Git submodules setup
  section_end:1637052719:get_sources
  section_start:1637052719:step_script
  Executing "step_script" stage of the job script
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-4da6e2d96a6dfb79ccffdfcb1c819ff007dcc4d9 ...
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-4da6e2d96a6dfb79ccffdfcb1c819ff007dcc4d9 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1637052885:step_script
  section_start:1637052885:cleanup_file_variables
  Cleaning up file based variables
  section_end:1637052918:cleanup_file_variables
  ERROR: Job failed (system failure): Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running? (docker.go:647:120s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/447284
