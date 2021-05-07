Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 07 May 2021 09:19:36 -0000
Message-ID: <162037917699.10704.1505347519781010320@emeril.freedesktop.org>
References: <20210504054027.12895-1-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20210504054027.12895-1-pankaj.laxminarayan.bharadiya@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fpsr2=5Fsf=3A_?=
 =?utf-8?q?Add_subtest_description?=
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
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_psr2_sf: Add subtest description
URL   : https://patchwork.freedesktop.org/series/89769/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/313227 for the overview.

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/9430401):
  (runner_test:4029) CRITICAL: error: 0 == 0
  (runner_test:4029) igt_core-INFO: Stack trace:
  (runner_test:4029) igt_core-INFO:   #0 [__igt_fail_assert+0x10f]
  (runner_test:4029) igt_core-INFO:   #1 [__real_main239+0x8451]
  (runner_test:4029) igt_core-INFO:   #2 [main+0x29]
  (runner_test:4029) igt_core-INFO:   #3 [__libc_start_main+0xf3]
  (runner_test:4029) igt_core-INFO:   #4 [_start+0x2e]
  ****  END  ****
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1620109028:step_script
  section_start:1620109028:cleanup_file_variables
  Cleaning up file based variables
  section_end:1620109032:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/313227
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
