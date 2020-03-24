Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Mar 2020 08:12:41 -0000
Message-ID: <158503756186.4558.4862625904528816745@emeril.freedesktop.org>
References: <20200323204621.173722-1-jose.souza@intel.com>
In-Reply-To: <20200323204621.173722-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2Cv5=2C1/7=5D_tests/kms=5Ffrontbuf?=
 =?utf-8?q?fer=5Ftracking=3A_Add_tiling_to_test=5Fmode?=
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,v5,1/7] tests/kms_frontbuffer_tracking: Add tiling to test_mode
URL   : https://patchwork.freedesktop.org/series/74987/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/123383 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2030279):
   #6 [igt_fail+0x11e]
   #7 [__igt_fail_assert+0x114]
   #8 [intel_get_drm_devid+0xa5]
   #9 [__real_main3351+0x1248]
   #10 [main+0x30]
   #11 [__libc_start_main+0xf3]
   #12 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1584999917:build_script
  section_start:1584999917:after_script
  section_end:1584999918:after_script
  section_start:1584999918:upload_artifacts_on_failure
  section_end:1584999920:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2030307):
   #10 [main+0x3c]
   #11 [__libc_start_main+0xe4]
   #12 [_start+0x34]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1585000082:build_script
  section_start:1585000082:after_script
  section_end:1585000084:after_script
  section_start:1585000084:upload_artifacts_on_failure
  Uploading artifacts...
  build: found 1388 matching files                   
  Uploading artifacts to coordinator... ok            id=2030307 responseStatus=201 Created token=QrwSkwVu
  section_end:1585000095:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2030282):
   #1 [sigset+0xf4]
   #2 [gnu_get_libc_version+0x119]
   #3 [gsignal+0x76]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1585000011:build_script
  section_start:1585000011:after_script
  section_end:1585000012:after_script
  section_start:1585000012:upload_artifacts_on_failure
  Uploading artifacts...
  build: found 1388 matching files                   
  Uploading artifacts to coordinator... ok            id=2030282 responseStatus=201 Created token=EXuLGmZW
  section_end:1585000022:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2030280):
   #5 [igt_fail+0xd9]
   #6 [__igt_fail_assert+0x127]
   #7 [intel_get_drm_devid+0x97]
   #8 [__real_main3351+0x447f]
   #9 [main+0x36]
   #10 [__libc_start_main+0xf3]
   #11 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1584999938:build_script
  section_start:1584999938:after_script
  section_end:1584999940:after_script
  section_start:1584999940:upload_artifacts_on_failure
  section_end:1584999942:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2030281):
  kms_frontbuffer_tracking: ../lib/igt_core.c:1543: igt_fail: Assertion `igt_can_fail()' failed.
  Received signal SIGABRT.
  Stack trace: 
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1584999994:build_script
  section_start:1584999994:after_script
  section_end:1584999996:after_script
  section_start:1584999996:upload_artifacts_on_failure
  Uploading artifacts...
  build: found 1388 matching files                   
  Uploading artifacts to coordinator... ok            id=2030281 responseStatus=201 Created token=vdmgyBrv
  section_end:1585000006:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/123383
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
