Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 27 May 2021 20:58:39 -0000
Message-ID: <162214911983.12239.3005024641401629603@emeril.freedesktop.org>
References: <20210527192750.6453-1-andrzej.turko@linux.intel.com>
In-Reply-To: <20210527192750.6453-1-andrzej.turko@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_F?=
 =?utf-8?q?ix_the_multiprocess_mode_of_intel_allocator_=28rev3=29?=
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
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Fix the multiprocess mode of intel allocator (rev3)
URL   : https://patchwork.freedesktop.org/series/90481/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/327564 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10195320):
  (runner_test:2511) CRITICAL: error: 0 == 0
  (runner_test:2511) igt_core-INFO: Stack trace:
  (runner_test:2511) igt_core-INFO:   #0 ../lib/igt_core.c:1745 __igt_fail_assert()
  (runner_test:2511) igt_core-INFO:   #1 ../runner/runner_tests.c:288 __real_main239()
  (runner_test:2511) igt_core-INFO:   #2 ../runner/runner_tests.c:239 main()
  (runner_test:2511) igt_core-INFO:   #3 [__libc_start_main+0xf3]
  (runner_test:2511) igt_core-INFO:   #4 [_start+0x2e]
  ****  END  ****
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1622148752:step_script
  section_start:1622148752:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622148756:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/327564
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
