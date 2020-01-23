Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jan 2020 13:51:25 -0000
Message-ID: <157978748567.1146.1564228559647561536@emeril.freedesktop.org>
References: <20200122162651.1111-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200122162651.1111-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/gem=5Fuserptr=5Fblits=3A_Enhance_invalid_mapping_exercise?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_userptr_blits: Enhance invalid mapping exercise
URL   : https://patchwork.freedesktop.org/series/72411/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100017 for the overview.

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1426330):
   #7 [main+0x30]
   #8 [__libc_start_main+0xe4]
   #9 [_start+0x34]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579716185:build_script
  [0Ksection_start:1579716185:after_script
  [0Ksection_end:1579716189:after_script
  [0Ksection_start:1579716189:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1376 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1426330 responseStatus[0;m=201 Created token[0;m=udgXWGTC
  section_end:1579716200:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1426504):
   #7 [main+0x30]
   #8 [__libc_start_main+0xe4]
   #9 [_start+0x34]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579716260:build_script
  [0Ksection_start:1579716260:after_script
  [0Ksection_end:1579716262:after_script
  [0Ksection_start:1579716262:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1376 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1426504 responseStatus[0;m=201 Created token[0;m=23syp2wr
  section_end:1579716278:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1426505):
   #7 [main+0x30]
   #8 [__libc_start_main+0xe4]
   #9 [_start+0x34]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579716357:build_script
  [0Ksection_start:1579716357:after_script
  [0Ksection_end:1579716359:after_script
  [0Ksection_start:1579716359:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1377 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1426505 responseStatus[0;m=201 Created token[0;m=ezeXgLcT
  section_end:1579716369:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100017
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
