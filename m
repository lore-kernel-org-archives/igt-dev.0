Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Apr 2020 06:26:12 -0000
Message-ID: <158572237228.25625.1685665020003287065@emeril.freedesktop.org>
References: <20200331115824.2481-1-mika.kahola@intel.com>
In-Reply-To: <20200331115824.2481-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fconcurrent=3A_Calculate_maximum_number_of_planes_to_?=
 =?utf-8?q?meet_bandwidth_requirement_=28rev2=29?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_concurrent: Calculate maximum number of planes to meet bandwidth requirement (rev2)
URL   : https://patchwork.freedesktop.org/series/75323/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/127022 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2139162):
   #0 [fatal_sig_handler+0x103]
   #1 [killpg+0x40]
   #2 [run_tests_for_pipe.constprop.0+0x3b]
   #3 [__real_main371+0xb9]
   #4 [main+0x30]
   #5 [__libc_start_main+0xf3]
   #6 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1585722222:build_script
  section_start:1585722222:after_script
  section_end:1585722224:after_script
  section_start:1585722224:upload_artifacts_on_failure
  section_end:1585722226:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2139163):
   #4 [main+0x3c]
   #5 [__libc_start_main+0xe4]
   #6 [_start+0x34]
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1585722233:build_script
  section_start:1585722233:after_script
  section_end:1585722234:after_script
  section_start:1585722234:upload_artifacts_on_failure
  Uploading artifacts...
  build: found 1388 matching files                   
  Uploading artifacts to coordinator... ok            id=2139163 responseStatus=201 Created token=XVi3RSkz
  section_end:1585722252:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2139160):
   #4 [main+0x26]
   #5 [__libc_start_main+0x98]
   #6 [_start+0x34]
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1585722193:build_script
  section_start:1585722193:after_script
  section_end:1585722195:after_script
  section_start:1585722195:upload_artifacts_on_failure
  Uploading artifacts...
  build: found 1388 matching files                   
  Uploading artifacts to coordinator... ok            id=2139160 responseStatus=201 Created token=wzbxKXcx
  section_end:1585722204:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2139161):
   #1 [run_tests_for_pipe+0x26]
   #2 [__real_main371+0xc2]
   #3 [main+0x36]
   #4 [__libc_start_main+0xf3]
   #5 [_start+0x2e]
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1585722238:build_script
  section_start:1585722238:after_script
  Running after_script
  section_end:1585722239:after_script
  section_start:1585722239:upload_artifacts_on_failure
  Uploading artifacts for failed job
  section_end:1585722241:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2139164):
  --- stderr ---
  Received signal SIGSEGV.
  Stack trace: 
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1585722217:build_script
  section_start:1585722217:after_script
  section_end:1585722218:after_script
  section_start:1585722218:upload_artifacts_on_failure
  Uploading artifacts...
  build: found 1388 matching files                   
  Uploading artifacts to coordinator... ok            id=2139164 responseStatus=201 Created token=iaDYwLy2
  section_end:1585722228:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/127022
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
