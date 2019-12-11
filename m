Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 11 Dec 2019 08:10:39 -0000
Message-ID: <157605183942.30690.11947581064789413262@emeril.freedesktop.org>
References: <20191205130246.21695-1-petri.latvala@intel.com>
In-Reply-To: <20191205130246.21695-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/2=5D_runner=3A_Ensure_generate?=
 =?utf-8?q?d_json_is_properly_UTF8-encoded?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] runner: Ensure generated json is properly UTF8-encoded
URL   : https://patchwork.freedesktop.org/series/70492/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/87140 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1105688):
  (runner_json_test:2389) igt_core-INFO:   #3 ../runner/runner_json_tests.c:40 compare()
  (runner_json_test:2389) igt_core-INFO:   #4 ../runner/runner_json_tests.c:40 compare()
  (runner_json_test:2389) igt_core-INFO:   #5 ../runner/runner_json_tests.c:146 __real_main169()
  (runner_json_test:2389) igt_core-INFO:   #6 ../runner/runner_json_tests.c:169 main()
  (runner_json_test:2389) igt_core-INFO:   #7 [__libc_start_main+0xf3]
  (runner_json_test:2389) igt_core-INFO:   #8 [_start+0x2e]
  ****  END  ****
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1575988880:build_script
  [0Ksection_start:1575988880:after_script
  [0Ksection_end:1575988881:after_script
  [0Ksection_start:1575988881:upload_artifacts_on_failure
  [0Ksection_end:1575988883:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1105689):
  (runner_json_test:2390) igt_core-INFO:   #2 [compare+0x249]
  (runner_json_test:2390) igt_core-INFO:   #3 [compare+0x249]
  (runner_json_test:2390) igt_core-INFO:   #4 [__real_main169+0x154]
  (runner_json_test:2390) igt_core-INFO:   #5 [main+0x29]
  (runner_json_test:2390) igt_core-INFO:   #6 [__libc_start_main+0xf3]
  (runner_json_test:2390) igt_core-INFO:   #7 [_start+0x2e]
  ****  END  ****
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1575988880:build_script
  [0Ksection_start:1575988880:after_script
  [0Ksection_end:1575988881:after_script
  [0Ksection_start:1575988881:upload_artifacts_on_failure
  [0Ksection_end:1575988883:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1105691):
  (runner_json_test:5093) igt_core-INFO:   #6 ../runner/runner_json_tests.c:169 main()
  (runner_json_test:5093) igt_core-INFO:   #7 [__libc_start_main+0xe4]
  (runner_json_test:5093) igt_core-INFO:   #8 [_start+0x34]
  ****  END  ****
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1575988868:build_script
  [0Ksection_start:1575988868:after_script
  [0Ksection_end:1575988869:after_script
  [0Ksection_start:1575988869:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1367 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1105691 responseStatus[0;m=201 Created token[0;m=6daYJK9Q
  section_end:1575988881:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1105692):
  (runner_json_test:4467) igt_core-INFO:   #6 ../runner/runner_json_tests.c:169 main()
  (runner_json_test:4467) igt_core-INFO:   #7 [__libc_start_main+0x98]
  (runner_json_test:4467) igt_core-INFO:   #8 [_start+0x34]
  ****  END  ****
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1575988876:build_script
  [0Ksection_start:1575988876:after_script
  [0Ksection_end:1575988878:after_script
  [0Ksection_start:1575988878:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1366 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1105692 responseStatus[0;m=201 Created token[0;m=Ry_5mmhn
  section_end:1575988888:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1105693):
  (runner_json_test:4924) CRITICAL: Test assertion failure function compare, file ../runner/runner_json_tests.c:109:
  (runner_json_test:4924) CRITICAL: Failed assertion: !strcmp(json_object_get_string(one), json_object_get_string(two))
  (runner_json_test:4924) igt_core-INFO: Stack trace:
  ****  END  ****
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1575988880:build_script
  [0Ksection_start:1575988880:after_script
  [0Ksection_end:1575988881:after_script
  [0Ksection_start:1575988881:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1366 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1105693 responseStatus[0;m=201 Created token[0;m=sgwGgmK5
  section_end:1575988892:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/87140
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
