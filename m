Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Wed, 02 Nov 2022 17:33:11 -0000
Message-ID: <166741039178.23606.5343207949531550170@emeril.freedesktop.org>
References: <1667408924-19566-1-git-send-email-nidhi1.gupta@intel.com>
In-Reply-To: <1667408924-19566-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/i915=5Fpm=5Fbacklight=3A_Add_new_subtest_to_validate_?=
 =?utf-8?q?dual_panel_backlight_=28rev5=29?=
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

Series: tests/i915/i915_pm_backlight: Add new subtest to validate dual panel backlight (rev5)
URL   : https://patchwork.freedesktop.org/series/108246/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/727465 for the overview.

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/30889403):
  Ok:                   24
  Expected Fail:         4
  Fail:                293
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1667410341:step_script
  section_start:1667410341:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1819 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=30889403 responseStatus=201 Created token=9w3T3r_9
  section_end:1667410354:upload_artifacts_on_failure
  section_start:1667410354:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1667410354:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/727465
