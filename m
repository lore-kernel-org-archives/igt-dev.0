Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 27 Jan 2020 20:28:48 -0000
Message-ID: <158015692826.9685.7458733158139571987@emeril.freedesktop.org>
References: <20200127192859.20029-1-bob.j.paauwe@intel.com>
In-Reply-To: <20200127192859.20029-1-bob.j.paauwe@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?ib/color=5Fencoding=3A_Fix_up_support_for_XYUV_format?=
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
To: Bob Paauwe <bob.j.paauwe@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/color_encoding: Fix up support for XYUV format
URL   : https://patchwork.freedesktop.org/series/72636/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/101947 for the overview.

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1474702):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirsaUonV/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1580156049:build_script
  [0Ksection_start:1580156049:after_script
  [0Ksection_end:1580156050:after_script
  [0Ksection_start:1580156050:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1379 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1474702 responseStatus[0;m=201 Created token[0;m=zFZxx7c6
  section_end:1580156056:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1474703):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirXsVs69/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1580156103:build_script
  [0Ksection_start:1580156103:after_script
  [0Ksection_end:1580156104:after_script
  [0Ksection_start:1580156104:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1379 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1474703 responseStatus[0;m=201 Created token[0;m=yj1ycmtf
  section_end:1580156110:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1474712):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirafSQ2R/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1580156393:build_script
  [0Ksection_start:1580156393:after_script
  [0Ksection_end:1580156395:after_script
  [0Ksection_start:1580156395:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1379 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1474712 responseStatus[0;m=201 Created token[0;m=EghC_an_
  section_end:1580156401:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1474713):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirnzJZ1k/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1580156495:build_script
  [0Ksection_start:1580156495:after_script
  [0Ksection_end:1580156496:after_script
  [0Ksection_start:1580156496:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1379 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1474713 responseStatus[0;m=201 Created token[0;m=esYneQy3
  section_end:1580156502:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1474752):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirpDDOKe/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1580156728:build_script
  [0Ksection_start:1580156728:after_script
  [0Ksection_end:1580156729:after_script
  [0Ksection_start:1580156729:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1379 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1474752 responseStatus[0;m=201 Created token[0;m=T1X9DkbS
  section_end:1580156735:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1474757):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdircmw9ir/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1580156857:build_script
  [0Ksection_start:1580156857:after_script
  [0Ksection_end:1580156859:after_script
  [0Ksection_start:1580156859:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1379 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1474757 responseStatus[0;m=201 Created token[0;m=pi3oio8L
  section_end:1580156864:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/101947
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
