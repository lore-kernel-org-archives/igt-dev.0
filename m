Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 03 Jun 2022 11:30:38 -0000
Message-ID: <165425583869.17722.8855570398185798163@emeril.freedesktop.org>
References: <20220517120245.3521494-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220517120245.3521494-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=3A_IGT_test_cleanup_=28rev5=29?=
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

Series: tests/kms: IGT test cleanup (rev5)
URL   : https://patchwork.freedesktop.org/series/104029/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/603326 for the overview.

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/23522863):
  Ok:                   22
  Expected Fail:         3
  Fail:                289
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1654255661:step_script
  section_start:1654255661:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1743 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=23522863 responseStatus=201 Created token=kmd3f_UC
  section_end:1654255672:upload_artifacts_on_failure
  section_start:1654255672:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1654255673:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/603326
