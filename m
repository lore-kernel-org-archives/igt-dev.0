Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 12 Feb 2020 23:30:07 -0000
Message-ID: <158155020797.24264.15778909674363208087@emeril.freedesktop.org>
References: <20200212223431.11060-1-dale.b.stimson@intel.com>
In-Reply-To: <20200212223431.11060-1-dale.b.stimson@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_m?=
 =?utf-8?q?mio=5Fbase_via_debugfs_infrastructure_+_gem=5Fctx=5Fisolation?=
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
To: Dale B Stimson <dale.b.stimson@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: mmio_base via debugfs infrastructure + gem_ctx_isolation
URL   : https://patchwork.freedesktop.org/series/73382/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/107939 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1616755):
   #8 [intel_get_drm_devid+0xa5]
   #9 [_gem_engine_mmio_base_info_get_legacy+0x2a]
   #10 [gem_engine_mmio_base_info_get+0x2f]
   #11 [__real_main894+0x3f]
   #12 [main+0x23]
   #13 [__libc_start_main+0xf3]
   #14 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581549866:build_script
  [0Ksection_start:1581549866:after_script
  [0Ksection_end:1581549868:after_script
  [0Ksection_start:1581549868:upload_artifacts_on_failure
  [0Ksection_end:1581549873:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1616756):
   #6 [__igt_fail_assert+0x470]
   #7 [intel_get_drm_devid+0x97]
   #8 [gem_engine_mmio_base_info_get+0x440]
   #9 [__real_main894+0x14f]
   #10 [main+0x29]
   #11 [__libc_start_main+0xf3]
   #12 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581549866:build_script
  [0Ksection_start:1581549866:after_script
  [0Ksection_end:1581549868:after_script
  [0Ksection_start:1581549868:upload_artifacts_on_failure
  [0Ksection_end:1581549872:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1616758):
   #12 [main+0x2c]
   #13 [__libc_start_main+0xe4]
   #14 [_start+0x34]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581549889:build_script
  [0Ksection_start:1581549889:after_script
  [0Ksection_end:1581549891:after_script
  [0Ksection_start:1581549891:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1349 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1616758 responseStatus[0;m=201 Created token[0;m=TQ8TMs1y
  section_end:1581549898:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1616759):
   #1 [sigset+0xf4]
   #2 [gnu_get_libc_version+0x119]
   #3 [gsignal+0x76]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581549892:build_script
  [0Ksection_start:1581549892:after_script
  [0Ksection_end:1581549894:after_script
  [0Ksection_start:1581549894:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1350 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1616759 responseStatus[0;m=201 Created token[0;m=rd9qhKaG
  section_end:1581549900:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1616760):
  gem_ctx_isolation: ../lib/igt_core.c:1539: igt_fail: Assertion `igt_can_fail()' failed.
  Received signal SIGABRT.
  Stack trace: 
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581549903:build_script
  [0Ksection_start:1581549903:after_script
  [0Ksection_end:1581549904:after_script
  [0Ksection_start:1581549904:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1350 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1616760 responseStatus[0;m=201 Created token[0;m=fivL7sfg
  section_end:1581549915:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1616840):
   #6 [__igt_fail_assert+0x470]
   #7 [intel_get_drm_devid+0x97]
   #8 [gem_engine_mmio_base_info_get+0x440]
   #9 [__real_main894+0x14f]
   #10 [main+0x29]
   #11 [__libc_start_main+0xf3]
   #12 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581549890:build_script
  [0Ksection_start:1581549890:after_script
  [0Ksection_end:1581549892:after_script
  [0Ksection_start:1581549892:upload_artifacts_on_failure
  [0Ksection_end:1581549893:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1616841):
   #8 [intel_get_drm_devid+0xa5]
   #9 [_gem_engine_mmio_base_info_get_legacy+0x2a]
   #10 [gem_engine_mmio_base_info_get+0x2f]
   #11 [__real_main894+0x3f]
   #12 [main+0x23]
   #13 [__libc_start_main+0xf3]
   #14 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581549899:build_script
  [0Ksection_start:1581549899:after_script
  [0Ksection_end:1581549901:after_script
  [0Ksection_start:1581549901:upload_artifacts_on_failure
  [0Ksection_end:1581549902:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1616842):
   #6 [__igt_fail_assert+0x470]
   #7 [intel_get_drm_devid+0x97]
   #8 [gem_engine_mmio_base_info_get+0x440]
   #9 [__real_main894+0x14f]
   #10 [main+0x29]
   #11 [__libc_start_main+0xf3]
   #12 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581549911:build_script
  [0Ksection_start:1581549911:after_script
  [0Ksection_end:1581549913:after_script
  [0Ksection_start:1581549913:upload_artifacts_on_failure
  [0Ksection_end:1581549914:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1616843):
   #12 [main+0x2c]
   #13 [__libc_start_main+0xe4]
   #14 [_start+0x34]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581549961:build_script
  [0Ksection_start:1581549961:after_script
  [0Ksection_end:1581549963:after_script
  [0Ksection_start:1581549963:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1350 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1616843 responseStatus[0;m=201 Created token[0;m=m3HxuEM-
  section_end:1581549975:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1616844):
   #1 [sigset+0xf4]
   #2 [gnu_get_libc_version+0x119]
   #3 [gsignal+0x76]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581549986:build_script
  [0Ksection_start:1581549986:after_script
  [0Ksection_end:1581549987:after_script
  [0Ksection_start:1581549987:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1350 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1616844 responseStatus[0;m=201 Created token[0;m=dXvZLmDi
  section_end:1581549998:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1616845):
   #8 [intel_get_drm_devid+0xa5]
   #9 [_gem_engine_mmio_base_info_get_legacy+0x2a]
   #10 [gem_engine_mmio_base_info_get+0x2f]
   #11 [__real_main894+0x3f]
   #12 [main+0x23]
   #13 [__libc_start_main+0xf3]
   #14 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581549929:build_script
  [0Ksection_start:1581549929:after_script
  [0Ksection_end:1581549931:after_script
  [0Ksection_start:1581549931:upload_artifacts_on_failure
  [0Ksection_end:1581549932:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1616846):
  gem_ctx_isolation: ../lib/igt_core.c:1539: igt_fail: Assertion `igt_can_fail()' failed.
  Received signal SIGABRT.
  Stack trace: 
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581549963:build_script
  [0Ksection_start:1581549963:after_script
  [0Ksection_end:1581549964:after_script
  [0Ksection_start:1581549964:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1349 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1616846 responseStatus[0;m=201 Created token[0;m=qmWkrqDU
  section_end:1581549975:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1616847):
  gem_ctx_isolation: ../lib/igt_core.c:1539: igt_fail: Assertion `igt_can_fail()' failed.
  Received signal SIGABRT.
  Stack trace: 
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581550000:build_script
  [0Ksection_start:1581550000:after_script
  [0Ksection_end:1581550001:after_script
  [0Ksection_start:1581550001:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1349 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1616847 responseStatus[0;m=201 Created token[0;m=SLw67RLh
  section_end:1581550012:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1616848):
   #12 [main+0x2c]
   #13 [__libc_start_main+0xe4]
   #14 [_start+0x34]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581549999:build_script
  [0Ksection_start:1581549999:after_script
  [0Ksection_end:1581550000:after_script
  [0Ksection_start:1581550000:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1349 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1616848 responseStatus[0;m=201 Created token[0;m=s8JxD4hw
  section_end:1581550012:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1616925):
   #1 [sigset+0xf4]
   #2 [gnu_get_libc_version+0x119]
   #3 [gsignal+0x76]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581550037:build_script
  [0Ksection_start:1581550037:after_script
  [0Ksection_end:1581550038:after_script
  [0Ksection_start:1581550038:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1350 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1616925 responseStatus[0;m=201 Created token[0;m=K64V2FVj
  section_end:1581550049:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/107939
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
