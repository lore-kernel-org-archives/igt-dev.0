Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 21 May 2021 19:38:00 -0000
Message-ID: <162162588017.6035.17466259226168417237@emeril.freedesktop.org>
References: <20210521190641.623110-1-jason@jlekstrand.net>
In-Reply-To: <20210521190641.623110-1-jason@jlekstrand.net>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_tests_for_sync=5Ffile_import/export?=
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
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add tests for sync_file import/export
URL   : https://patchwork.freedesktop.org/series/90433/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/323998 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10000575):
  (runner_test:2443) CRITICAL: error: 0 == 0
  (runner_test:2443) igt_core-INFO: Stack trace:
  (runner_test:2443) igt_core-INFO:   #0 ../lib/igt_core.c:1745 __igt_fail_assert()
  (runner_test:2443) igt_core-INFO:   #1 ../runner/runner_tests.c:288 __real_main239()
  (runner_test:2443) igt_core-INFO:   #2 ../runner/runner_tests.c:239 main()
  (runner_test:2443) igt_core-INFO:   #3 [__libc_start_main+0xf3]
  (runner_test:2443) igt_core-INFO:   #4 [_start+0x2e]
  ****  END  ****
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1621625507:step_script
  section_start:1621625507:cleanup_file_variables
  Cleaning up file based variables
  section_end:1621625509:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10000580):
   #13 [_start+0x34]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1621625574:step_script
  section_start:1621625574:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1619 matching files and directories   
  Uploading artifacts as "archive" to coordinator... ok  id=10000580 responseStatus=201 Created token=gU97skgL
  section_end:1621625587:upload_artifacts_on_failure
  section_start:1621625587:cleanup_file_variables
  Cleaning up file based variables
  section_end:1621625588:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10000581):
   #3 [gsignal+0x76]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1621625569:step_script
  section_start:1621625569:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1619 matching files and directories   
  Uploading artifacts as "archive" to coordinator... ok  id=10000581 responseStatus=201 Created token=P4o8aLt3
  section_end:1621625581:upload_artifacts_on_failure
  section_start:1621625581:cleanup_file_variables
  Cleaning up file based variables
  section_end:1621625583:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10000574):
  (runner_test:2416) CRITICAL: error: 0 == 0
  (runner_test:2416) igt_core-INFO: Stack trace:
  (runner_test:2416) igt_core-INFO:   #0 [__igt_fail_assert+0x10f]
  (runner_test:2416) igt_core-INFO:   #1 [__real_main239+0x8451]
  (runner_test:2416) igt_core-INFO:   #2 [main+0x29]
  (runner_test:2416) igt_core-INFO:   #3 [__libc_start_main+0xf3]
  (runner_test:2416) igt_core-INFO:   #4 [_start+0x2e]
  ****  END  ****
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1621625507:step_script
  section_start:1621625507:cleanup_file_variables
  Cleaning up file based variables
  section_end:1621625509:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10000579):
  Stack trace: 
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1621625549:step_script
  section_start:1621625549:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1619 matching files and directories   
  Uploading artifacts as "archive" to coordinator... ok  id=10000579 responseStatus=201 Created token=KUVad3Wj
  section_end:1621625562:upload_artifacts_on_failure
  section_start:1621625562:cleanup_file_variables
  Cleaning up file based variables
  section_end:1621625563:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/323998
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
