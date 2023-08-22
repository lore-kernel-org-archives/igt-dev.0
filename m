Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Erik Kurzinger" <ekurzinger@nvidia.com>
Date: Tue, 22 Aug 2023 23:48:27 -0000
Message-ID: <169274810762.20550.9260778757601036398@emeril.freedesktop.org>
References: <498c41b0-d041-67ad-e7ea-1ebc809974c5@nvidia.com>
In-Reply-To: <498c41b0-d041-67ad-e7ea-1ebc809974c5@nvidia.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?yncobj=5Ftimeline=3A_don=27t_expect_EINVAL_for_WAIT=5FUNSUBMITT?=
 =?utf-8?q?ED=2C_=7C_WAIT=5FAVAILABLE?=
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

Series: syncobj_timeline: don't expect EINVAL for WAIT_UNSUBMITTED, | WAIT_AVAILABLE
URL   : https://patchwork.freedesktop.org/series/122766/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/968091 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47874283):
  [3/4] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/i915/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled
  ninja: build stopped: subcommand failed.
  section_end:1692747933:step_script
  section_start:1692747933:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692747933:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47874278):
  [3/4] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/i915/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled
  ninja: build stopped: subcommand failed.
  section_end:1692747915:step_script
  section_start:1692747915:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692747915:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47874282):
  [2/3] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/i915/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled
  ninja: build stopped: subcommand failed.
  section_end:1692747932:step_script
  section_start:1692747932:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692747932:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47874281):
  [3/4] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/i915/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled
  ninja: build stopped: subcommand failed.
  section_end:1692747916:step_script
  section_start:1692747916:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692747918:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47874279):
  [3/4] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/i915/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled
  ninja: build stopped: subcommand failed.
  section_end:1692747921:step_script
  section_start:1692747921:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692747923:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47874280):
  [3/4] Generating i915_tests.rst with a custom command.
  FAILED: docs/testplan/i915_tests.rst 
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt-ci-tags/tests/i915/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path /builds/gfx-ci/igt-ci-tags/build
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-all-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-available-unsubmitted
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-signaled
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted
  Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled
  ninja: build stopped: subcommand failed.
  section_end:1692747914:step_script
  section_start:1692747914:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692747914:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/968091
