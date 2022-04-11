Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: venkata.sai.patnana@intel.com
Date: Mon, 11 Apr 2022 09:00:58 -0000
Message-ID: <164966765852.2973.9634488033509082906@emeril.freedesktop.org>
References: <20220308032112.12119-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20220308032112.12119-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/kms=5Fdsc=3A_IGT_clean_up_for_kms=5Fdsc_=28rev3=29?=
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

Series: tests/i915/kms_dsc: IGT clean up for kms_dsc (rev3)
URL   : https://patchwork.freedesktop.org/series/101131/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/556001 for the overview.

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/21018757):
  Ok:                   22
  Expected Fail:         3
  Fail:                288
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1649667376:step_script
  section_start:1649667376:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1721 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=21018757 responseStatus=201 Created token=FNuNiTEr
  section_end:1649667385:upload_artifacts_on_failure
  section_start:1649667385:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649667385:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/556001
