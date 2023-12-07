Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_xe=3A_Validate_fixed_CC?=
 =?utf-8?q?S_mode_setting?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Thu, 07 Dec 2023 21:33:33 -0000
Message-ID: <170198481381.28722.9564736095917155389@emeril.freedesktop.org>
References: <20231207212429.7690-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231207212429.7690-1-niranjana.vishwanathapura@intel.com>
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

Series: xe: Validate fixed CCS mode setting
URL   : https://patchwork.freedesktop.org/series/127527/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1052056 for the overview.

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52515127):
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out fa311f64 as detached HEAD (ref is intel/IGTPW_10372)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing meson-test-list.txt
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1701984498:get_sources
  section_start:1701984498:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:08904a47f4efcc161569a9b7f88c458fc6e3e85a2225132246af9cf5cc6c4e5b for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-fa311f647a6f2e4d4c8feaa5a52befae368491c3 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal@sha256:8b51a86fd81e64c501c9521c37fc8ad6f2550976931c510eb0ff4f6a328d477a ...
  section_end:1701984501:step_script
  section_start:1701984501:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701984502:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:08904a47f4efcc161569a9b7f88c458fc6e3e85a2225132246af9cf5cc6c4e5b: image not known (docker.go:570:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1052056
