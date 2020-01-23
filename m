Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jan 2020 13:52:20 -0000
Message-ID: <157978754022.1145.745235269447535205@emeril.freedesktop.org>
References: <20200123002517.31327-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20200123002517.31327-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/gem=5Fexec=5Fschedule=3A_Use_mmap=5F=5Fdevice=5Fcoher?=
 =?utf-8?q?ent?=
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
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_exec_schedule: Use mmap__device_coherent
URL   : https://patchwork.freedesktop.org/series/72436/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100247 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1432547):
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
  section_end:1579742232:build_script
  [0Ksection_start:1579742232:after_script
  [0Ksection_end:1579742233:after_script
  [0Ksection_start:1579742233:upload_artifacts_on_failure
  [0Ksection_end:1579742236:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1432551):
   #1 [sigset+0xf4]
   #2 [gnu_get_libc_version+0x119]
   #3 [gsignal+0x76]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579742246:build_script
  [0Ksection_start:1579742246:after_script
  [0Ksection_end:1579742248:after_script
  [0Ksection_start:1579742248:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1376 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1432551 responseStatus[0;m=201 Created token[0;m=LfcMdHTx
  section_end:1579742254:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1432557):
   #1 [sigset+0xf4]
   #2 [gnu_get_libc_version+0x119]
   #3 [gsignal+0x76]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579742278:build_script
  [0Ksection_start:1579742278:after_script
  [0Ksection_end:1579742280:after_script
  [0Ksection_start:1579742280:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1376 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1432557 responseStatus[0;m=201 Created token[0;m=cvvw1Gbx
  section_end:1579742286:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1432558):
   #1 [sigset+0xf4]
   #2 [gnu_get_libc_version+0x119]
   #3 [gsignal+0x76]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579742310:build_script
  [0Ksection_start:1579742310:after_script
  [0Ksection_end:1579742311:after_script
  [0Ksection_start:1579742311:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1376 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1432558 responseStatus[0;m=201 Created token[0;m=xuHfNmqS
  section_end:1579742317:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100247
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
