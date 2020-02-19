Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 19 Feb 2020 14:15:47 -0000
Message-ID: <158212174700.21061.4487199923398362876@emeril.freedesktop.org>
References: <20200219133855.67829-1-emil.l.velikov@gmail.com>
In-Reply-To: <20200219133855.67829-1-emil.l.velikov@gmail.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?s/core=5Fsetmaster=3A_new_test_for_drop/set_master_semantics?=
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
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: ts/core_setmaster: new test for drop/set master semantics
URL   : https://patchwork.freedesktop.org/series/73650/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/110333 for the overview.

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1672066):
   #3 [__assert_fail_base.cold+0xf]
   #4 [__assert_fail+0x46]
   #5 [subtest_leak+0xff]
   #6 [main+0x16e]
   #7 [__libc_start_main+0xf3]
   #8 [_start+0x2e]
  igt_fork: ../lib/tests/igt_tests_common.h:41: void internal_assert_wexited(int, int): Assertion `WIFEXITED(wstatus) && WEXITSTATUS(wstatus) == exitcode' failed.
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1582121608:build_script
  [0Ksection_start:1582121608:after_script
  [0Ksection_end:1582121610:after_script
  [0Ksection_start:1582121610:upload_artifacts_on_failure
  [0Ksection_end:1582121611:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:test-list-diff has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1672071):
  [0Ksection_start:1582121597:restore_cache
  [0Ksection_end:1582121598:restore_cache
  [0Ksection_start:1582121598:download_artifacts
  [0K[32;1mDownloading artifacts for build:tests-debian-autotools (1672064)...[0;m
  Downloading artifacts from coordinator... ok      [0;m  id[0;m=1672064 responseStatus[0;m=200 OK token[0;m=5wKH_VsJ
  [32;1mDownloading artifacts for build:tests-debian-meson (1672059)...[0;m
  Downloading artifacts from coordinator... ok      [0;m  id[0;m=1672059 responseStatus[0;m=200 OK token[0;m=CxeHLprz
  section_end:1582121600:download_artifacts
  [0Ksection_start:1582121600:build_script
  [0K[0KAuthenticating with credentials from job payload (GitLab Registry)
  [0;m[32;1m$ diff <(sed "s/ /\n/g" meson-test-list.txt| grep -v 'vc4\|v3d\|panfrost' | sort) <(sed "s/ /\n/g" autotools-test-list.txt | sort)[0;m
  14d13
  < core_setmaster
  section_end:1582121602:build_script
  [0Ksection_start:1582121602:after_script
  [0Ksection_end:1582121603:after_script
  [0Ksection_start:1582121603:upload_artifacts_on_failure
  [0Ksection_end:1582121604:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1672080):
   #3 [__assert_fail_base.cold+0xf]
   #4 [__assert_fail+0x46]
   #5 [subtest_leak+0xff]
   #6 [main+0x16e]
   #7 [__libc_start_main+0xf3]
   #8 [_start+0x2e]
  igt_fork: ../lib/tests/igt_tests_common.h:41: void internal_assert_wexited(int, int): Assertion `WIFEXITED(wstatus) && WEXITSTATUS(wstatus) == exitcode' failed.
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1582121626:build_script
  [0Ksection_start:1582121626:after_script
  [0Ksection_end:1582121627:after_script
  [0Ksection_start:1582121627:upload_artifacts_on_failure
  [0Ksection_end:1582121629:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/110333
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
