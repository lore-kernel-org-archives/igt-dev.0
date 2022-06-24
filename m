Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: janga.rahul.kumar@intel.com
Date: Fri, 24 Jun 2022 09:26:04 -0000
Message-ID: <165606276405.16789.14380537780641901492@emeril.freedesktop.org>
References: <20220624085031.3436257-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20220624085031.3436257-1-janga.rahul.kumar@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_H?=
 =?utf-8?q?AX_add_test_description_to_gem=5Fexec=5Fsuspend_=28rev5=29?=
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

Series: HAX add test description to gem_exec_suspend (rev5)
URL   : https://patchwork.freedesktop.org/series/104915/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/620887 for the overview.

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/24522779):
  Ok:                   22
  Expected Fail:         3
  Fail:                290
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1656062698:step_script
  section_start:1656062698:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1752 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=24522779 responseStatus=201 Created token=Tp6f-ZGQ
  section_end:1656062708:upload_artifacts_on_failure
  section_start:1656062708:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1656062708:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/620887
