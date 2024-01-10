Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_add_force_bigjoiner_tes?=
 =?utf-8?q?t?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Wed, 10 Jan 2024 13:09:06 -0000
Message-ID: <170489214695.240792.2184401669336614685@5338d5abeb45>
References: <20240110113906.523857-1-kunal1.joshi@intel.com>
In-Reply-To: <20240110113906.523857-1-kunal1.joshi@intel.com>
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

Series: add force bigjoiner test
URL   : https://patchwork.freedesktop.org/series/128426/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1074724 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/53570581):
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 3ab49f9e as detached HEAD (ref is intel/IGTPW_10501)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1704891789:get_sources
  section_start:1704891789:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:7360075a71dacfc66f0b49b3271b9a459904dbe51c5760efac48fe52da27946c for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-3ab49f9e5214070391356577d100df8a81b76c31 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64@sha256:df8438cd0e218646c3bdc2eb6abccb43c4e884bfd40a1a4dd0365f1f8031d21f ...
  section_end:1704891795:step_script
  section_start:1704891795:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1704891796:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: container create: reading image "7360075a71dacfc66f0b49b3271b9a459904dbe51c5760efac48fe52da27946c": locating image with ID "7360075a71dacfc66f0b49b3271b9a459904dbe51c5760efac48fe52da27946c": image not known (docker.go:570:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1074724
