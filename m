Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jan 2020 13:51:49 -0000
Message-ID: <157978750901.1145.3201857271235349438@emeril.freedesktop.org>
References: <20200122174151.15059-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200122174151.15059-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_i?=
 =?utf-8?q?915/gem=5Fexec=5Fnop=3AAdjusted_test_to_utilize_all_available_e?=
 =?utf-8?q?ngines_=28rev3=29?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_nop:Adjusted test to utilize all available engines (rev3)
URL   : https://patchwork.freedesktop.org/series/72334/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100095 for the overview.

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1428323):
   #7 [main+0x30]
   #8 [__libc_start_main+0xe4]
   #9 [_start+0x34]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579724064:build_script
  [0Ksection_start:1579724064:after_script
  [0Ksection_end:1579724067:after_script
  [0Ksection_start:1579724067:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1377 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1428323 responseStatus[0;m=201 Created token[0;m=TiWfb3qv
  section_end:1579724077:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1428324):
   #1 [sigset+0xf4]
   #2 [gnu_get_libc_version+0x119]
   #3 [gsignal+0x76]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579724079:build_script
  [0Ksection_start:1579724079:after_script
  [0Ksection_end:1579724081:after_script
  [0Ksection_start:1579724081:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1376 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1428324 responseStatus[0;m=201 Created token[0;m=zBs-xFLm
  section_end:1579724091:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1428325):
  runner_test: ../lib/igt_core.c:1952: igt_exit: Assertion `waitpid(-1, &tmp, WNOHANG) == -1 && errno == ECHILD' failed.
  Received signal SIGABRT.
  Stack trace: 
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579724068:build_script
  [0Ksection_start:1579724068:after_script
  [0Ksection_end:1579724070:after_script
  [0Ksection_start:1579724070:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1377 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1428325 responseStatus[0;m=201 Created token[0;m=w7hKYfhh
  section_end:1579724078:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1428331):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirI6x1QH/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579724493:build_script
  [0Ksection_start:1579724493:after_script
  [0Ksection_end:1579724494:after_script
  [0Ksection_start:1579724494:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1375 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1428331 responseStatus[0;m=201 Created token[0;m=D3469B8H
  section_end:1579724500:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1428390):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirLKGt44/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579724874:build_script
  [0Ksection_start:1579724874:after_script
  [0Ksection_end:1579724876:after_script
  [0Ksection_start:1579724876:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1375 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1428390 responseStatus[0;m=201 Created token[0;m=baA1U8kC
  section_end:1579724881:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100095
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
