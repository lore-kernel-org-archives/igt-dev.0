Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jan 2020 13:50:57 -0000
Message-ID: <157978745774.1144.1717316739175649817@emeril.freedesktop.org>
References: <20200122110548.22838-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200122110548.22838-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?ib/igt=5Fcollection=3A_Adding_combinatorics_facility_=28rev4=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_collection: Adding combinatorics facility (rev4)
URL   : https://patchwork.freedesktop.org/series/72276/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/99804 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1421070):
   #3 [abort+0x12b]
   #4 [__assert_fail_base.cold+0xf]
   #5 [__assert_fail+0x46]
   #6 [igt_exit+0x18a]
   #7 [main+0x28]
   #8 [__libc_start_main+0xf3]
   #9 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579692904:build_script
  [0Ksection_start:1579692904:after_script
  [0Ksection_end:1579692907:after_script
  [0Ksection_start:1579692907:upload_artifacts_on_failure
  [0Ksection_end:1579692911:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1421071):
   #2 [abort+0x12b]
   #3 [__assert_fail_base.cold+0xf]
   #4 [__assert_fail+0x46]
   #5 [igt_exit+0x249]
   #6 [main+0x2e]
   #7 [__libc_start_main+0xf3]
   #8 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579692909:build_script
  [0Ksection_start:1579692909:after_script
  [0Ksection_end:1579692911:after_script
  [0Ksection_start:1579692911:upload_artifacts_on_failure
  [0Ksection_end:1579692914:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1421073):
   #7 [main+0x30]
   #8 [__libc_start_main+0xe4]
   #9 [_start+0x34]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579692921:build_script
  [0Ksection_start:1579692921:after_script
  [0Ksection_end:1579692922:after_script
  [0Ksection_start:1579692922:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1380 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1421073 responseStatus[0;m=201 Created token[0;m=anzYUJdG
  section_end:1579692933:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1421074):
   #1 [sigset+0xf4]
   #2 [gnu_get_libc_version+0x119]
   #3 [gsignal+0x76]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579692930:build_script
  [0Ksection_start:1579692930:after_script
  [0Ksection_end:1579692934:after_script
  [0Ksection_start:1579692934:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1381 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1421074 responseStatus[0;m=201 Created token[0;m=cxmiGyYJ
  section_end:1579692944:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1421207):
   #3 [abort+0x12b]
   #4 [__assert_fail_base.cold+0xf]
   #5 [__assert_fail+0x46]
   #6 [igt_exit+0x18a]
   #7 [main+0x28]
   #8 [__libc_start_main+0xf3]
   #9 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579692939:build_script
  [0Ksection_start:1579692939:after_script
  [0Ksection_end:1579692942:after_script
  [0Ksection_start:1579692942:upload_artifacts_on_failure
  [0Ksection_end:1579692946:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1421208):
   #2 [abort+0x12b]
   #3 [__assert_fail_base.cold+0xf]
   #4 [__assert_fail+0x46]
   #5 [igt_exit+0x249]
   #6 [main+0x2e]
   #7 [__libc_start_main+0xf3]
   #8 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579692942:build_script
  [0Ksection_start:1579692942:after_script
  [0Ksection_end:1579692946:after_script
  [0Ksection_start:1579692946:upload_artifacts_on_failure
  [0Ksection_end:1579692949:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1421209):
   #7 [main+0x30]
   #8 [__libc_start_main+0xe4]
   #9 [_start+0x34]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579692972:build_script
  [0Ksection_start:1579692972:after_script
  [0Ksection_end:1579692977:after_script
  [0Ksection_start:1579692977:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1380 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1421209 responseStatus[0;m=201 Created token[0;m=HuNe6wsD
  section_end:1579692992:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1421210):
   #1 [sigset+0xf4]
   #2 [gnu_get_libc_version+0x119]
   #3 [gsignal+0x76]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579693003:build_script
  [0Ksection_start:1579693003:after_script
  [0Ksection_end:1579693005:after_script
  [0Ksection_start:1579693005:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1379 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1421210 responseStatus[0;m=201 Created token[0;m=yQFra9fs
  section_end:1579693016:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1421211):
   #3 [abort+0x12b]
   #4 [__assert_fail_base.cold+0xf]
   #5 [__assert_fail+0x46]
   #6 [igt_exit+0x18a]
   #7 [main+0x28]
   #8 [__libc_start_main+0xf3]
   #9 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579692981:build_script
  [0Ksection_start:1579692981:after_script
  [0Ksection_end:1579692984:after_script
  [0Ksection_start:1579692984:upload_artifacts_on_failure
  [0Ksection_end:1579692988:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1421212):
   #2 [abort+0x12b]
   #3 [__assert_fail_base.cold+0xf]
   #4 [__assert_fail+0x46]
   #5 [igt_exit+0x249]
   #6 [main+0x2e]
   #7 [__libc_start_main+0xf3]
   #8 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579692984:build_script
  [0Ksection_start:1579692984:after_script
  [0Ksection_end:1579692988:after_script
  [0Ksection_start:1579692988:upload_artifacts_on_failure
  [0Ksection_end:1579692992:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1421292):
   #1 [sigset+0xf4]
   #2 [gnu_get_libc_version+0x119]
   #3 [gsignal+0x76]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579693072:build_script
  [0Ksection_start:1579693072:after_script
  [0Ksection_end:1579693076:after_script
  [0Ksection_start:1579693076:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1379 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1421292 responseStatus[0;m=201 Created token[0;m=fpdUHtfc
  section_end:1579693088:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/99804
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
