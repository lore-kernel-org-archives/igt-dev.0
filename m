Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ramalingam C" <ramalingam.c@intel.com>
Date: Mon, 18 Apr 2022 15:56:40 -0000
Message-ID: <165029740063.11405.10942293264840530740@emeril.freedesktop.org>
References: <20220418152954.5327-1-ramalingam.c@intel.com>
In-Reply-To: <20220418152954.5327-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/gem=5Flmem=5Fswapping=3A_Add_ccs_subtests_=28rev9=29?=
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

Series: tests/i915/gem_lmem_swapping: Add ccs subtests (rev9)
URL   : https://patchwork.freedesktop.org/series/101324/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/562677 for the overview.

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/21368232):
  Ok:                   22
  Expected Fail:         3
  Fail:                289
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1650297138:step_script
  section_start:1650297138:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1725 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=21368232 responseStatus=201 Created token=S5W1x_rd
  section_end:1650297147:upload_artifacts_on_failure
  section_start:1650297147:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1650297148:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/21368233):
  Ok:                   22
  Expected Fail:         3
  Fail:                289
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1650297158:step_script
  section_start:1650297158:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1725 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=21368233 responseStatus=201 Created token=GWWPPCg8
  section_end:1650297167:upload_artifacts_on_failure
  section_start:1650297167:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1650297168:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/562677
