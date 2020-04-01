Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Apr 2020 02:24:44 -0000
Message-ID: <158570788401.25628.6922051278324316293@emeril.freedesktop.org>
References: <20200331115824.2481-1-mika.kahola@intel.com>
In-Reply-To: <20200331115824.2481-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fconcurrent=3A_Calculate_maximum_number_of_planes_to_?=
 =?utf-8?q?meet_bandwidth_requirement?=
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

Series: tests/kms_concurrent: Calculate maximum number of planes to meet bandwidth requirement
URL   : https://patchwork.freedesktop.org/series/75323/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/126945 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2136974):
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
  section_end:1585707766:build_script
  section_start:1585707766:after_script
  Running after_script
  section_end:1585707767:after_script
  section_start:1585707767:upload_artifacts_on_failure
  Uploading artifacts for failed job
  section_end:1585707769:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2137002):
   #4 [main+0x3c]
   #5 [__libc_start_main+0xe4]
   #6 [_start+0x34]
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1585707801:build_script
  section_start:1585707801:after_script
  section_end:1585707803:after_script
  section_start:1585707803:upload_artifacts_on_failure
  Uploading artifacts...
  build: found 1388 matching files                   
  Uploading artifacts to coordinator... ok            id=2137002 responseStatus=201 Created token=zb1xeA-b
  section_end:1585707814:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2137004):
   #6 [_start+0x34]
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1585707855:build_script
  section_start:1585707855:after_script
  Running after_script
  section_end:1585707856:after_script
  section_start:1585707856:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1388 matching files                   
  Uploading artifacts to coordinator... ok            id=2137004 responseStatus=201 Created token=xyTrQ86u
  section_end:1585707866:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2136970):
  Stack trace: 
   #0 [killpg+0x40]
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
  section_end:1585707738:build_script
  section_start:1585707738:after_script
  section_end:1585707740:after_script
  section_start:1585707740:upload_artifacts_on_failure
  section_end:1585707741:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2137003):
  --- stderr ---
  Received signal SIGSEGV.
  Stack trace: 
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1585707813:build_script
  section_start:1585707813:after_script
  section_end:1585707815:after_script
  section_start:1585707815:upload_artifacts_on_failure
  Uploading artifacts...
  build: found 1388 matching files                   
  Uploading artifacts to coordinator... ok            id=2137003 responseStatus=201 Created token=9ZLurN_w
  section_end:1585707824:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/126945
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
