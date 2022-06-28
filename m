Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: janga.rahul.kumar@intel.com
Date: Tue, 28 Jun 2022 07:49:42 -0000
Message-ID: <165640258240.14502.4642311754367484869@emeril.freedesktop.org>
References: <20220628062336.3797258-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20220628062336.3797258-1-janga.rahul.kumar@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_H?=
 =?utf-8?q?AX_add_test_description_to_prime=5Fvgem_=28rev3=29?=
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

Series: HAX add test description to prime_vgem (rev3)
URL   : https://patchwork.freedesktop.org/series/105368/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/623863 for the overview.

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/24643614):
  Ok:                   22
  Expected Fail:         3
  Fail:                290
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1656402561:step_script
  section_start:1656402561:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1752 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=24643614 responseStatus=201 Created token=3kBcfRWD
  section_end:1656402571:upload_artifacts_on_failure
  section_start:1656402571:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1656402572:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/623863
