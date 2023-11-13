Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Mon, 13 Nov 2023 06:34:42 -0000
Message-ID: <169985728202.24212.8640202369328274500@emeril.freedesktop.org>
References: <20231113052304.1092040-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231113052304.1092040-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/syncobj=5Ftimeline=3A_Fix_testplan_documentation_=28rev2?=
 =?utf-8?q?=29?=
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

Series: tests/syncobj_timeline: Fix testplan documentation (rev2)
URL   : https://patchwork.freedesktop.org/series/126315/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1032636 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51501619):
  Warning: Documented igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted doesn't exist on source files
  Warning: Documented igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled doesn't exist on source files
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-single-wait-available-unsubmitted
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699856962:step_script
  section_start:1699856962:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699856963:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51501614):
  Warning: Documented igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted doesn't exist on source files
  Warning: Documented igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled doesn't exist on source files
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-single-wait-available-unsubmitted
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699856956:step_script
  section_start:1699856956:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699856956:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51501618):
  Warning: Documented igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted doesn't exist on source files
  Warning: Documented igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled doesn't exist on source files
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-single-wait-available-unsubmitted
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699856983:step_script
  section_start:1699856983:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699856983:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51501617):
  Warning: Documented igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted doesn't exist on source files
  Warning: Documented igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled doesn't exist on source files
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-single-wait-available-unsubmitted
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699856954:step_script
  section_start:1699856954:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699856955:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51501615):
  Warning: Documented igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted doesn't exist on source files
  Warning: Documented igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled doesn't exist on source files
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-single-wait-available-unsubmitted
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699856966:step_script
  section_start:1699856966:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699856967:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51501616):
  Warning: Documented igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted doesn't exist on source files
  Warning: Documented igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled doesn't exist on source files
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@invalid-single-wait-available-unsubmitted
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699856954:step_script
  section_start:1699856954:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699856955:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1032636
