Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 27 Jan 2021 13:01:34 -0000
Message-ID: <161175249429.11911.6827751710126514414@emeril.freedesktop.org>
References: <20201215084825.101358-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20201215084825.101358-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/2=5D_tests/gem=5Fuserptr=5Fbli?=
 =?utf-8?q?ts=3A_Rework_userptr_tests_to_copy_with_changes_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/gem_userptr_blits: Rework userptr tests to copy with changes (rev3)
URL   : https://patchwork.freedesktop.org/series/84948/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/262366 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/6919246):
  (runner_test:2404) CRITICAL: error: 0 == 0
  (runner_test:2404) igt_core-INFO: Stack trace:
  (runner_test:2404) igt_core-INFO:   #0 ../lib/igt_core.c:1727 __igt_fail_assert()
  (runner_test:2404) igt_core-INFO:   #1 ../runner/runner_tests.c:288 __real_main239()
  (runner_test:2404) igt_core-INFO:   #2 ../runner/runner_tests.c:239 main()
  (runner_test:2404) igt_core-INFO:   #3 [__libc_start_main+0xf3]
  (runner_test:2404) igt_core-INFO:   #4 [_start+0x2e]
  ****  END  ****
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1611752230:step_script
  section_start:1611752230:cleanup_file_variables
  Cleaning up file based variables
  section_end:1611752232:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/262366
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
