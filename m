Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: janga.rahul.kumar@intel.com
Date: Thu, 14 Sep 2023 13:31:36 -0000
Message-ID: <169469829664.29166.1648526307234935414@emeril.freedesktop.org>
References: <20230914102156.412238-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20230914102156.412238-1-janga.rahul.kumar@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/intel/xe=5Fvm_=3A_Validate_tile_mask?=
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

Series: tests/intel/xe_vm : Validate tile mask
URL   : https://patchwork.freedesktop.org/series/123682/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/985912 for the overview.

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48995122):
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out c2e41597 as detached HEAD (ref is intel/IGTPW_9786)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1694697853:get_sources
  section_start:1694697853:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:08904a47f4efcc161569a9b7f88c458fc6e3e85a2225132246af9cf5cc6c4e5b for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-c2e41597608922bd356ca0c963b2b85d3b437e70 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal@sha256:8b51a86fd81e64c501c9521c37fc8ad6f2550976931c510eb0ff4f6a328d477a ...
  section_end:1694697854:step_script
  section_start:1694697854:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1694697855:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:08904a47f4efcc161569a9b7f88c458fc6e3e85a2225132246af9cf5cc6c4e5b: image not known (docker.go:570:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/985912
