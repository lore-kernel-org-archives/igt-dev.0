Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jan 2020 13:52:07 -0000
Message-ID: <157978752736.1146.6492075298074390871@emeril.freedesktop.org>
References: <20200122233326.29131-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20200122233326.29131-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/gem=5Fmmap=5Fwc=3A_Update_test_to_use_mmap=5Fwc_IOCTL?=
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

Series: tests/i915/gem_mmap_wc: Update test to use mmap_wc IOCTL
URL   : https://patchwork.freedesktop.org/series/72431/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100240 for the overview.

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1432328):
   #7 [main+0x30]
   #8 [__libc_start_main+0xe4]
   #9 [_start+0x34]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579740968:build_script
  [0Ksection_start:1579740968:after_script
  [0Ksection_end:1579740970:after_script
  [0Ksection_start:1579740970:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1376 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1432328 responseStatus[0;m=201 Created token[0;m=XGhV3oPs
  section_end:1579740979:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1432334):
   #7 [main+0x30]
   #8 [__libc_start_main+0xe4]
   #9 [_start+0x34]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579741040:build_script
  [0Ksection_start:1579741040:after_script
  [0Ksection_end:1579741042:after_script
  [0Ksection_start:1579741042:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1376 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1432334 responseStatus[0;m=201 Created token[0;m=ufRQcpdP
  section_end:1579741052:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1432335):
   #7 [main+0x30]
   #8 [__libc_start_main+0xe4]
   #9 [_start+0x34]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579741116:build_script
  [0Ksection_start:1579741116:after_script
  [0Ksection_end:1579741118:after_script
  [0Ksection_start:1579741118:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1377 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1432335 responseStatus[0;m=201 Created token[0;m=7ZByGET7
  section_end:1579741127:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100240
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
