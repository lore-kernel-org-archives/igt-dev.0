Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jan 2020 13:51:36 -0000
Message-ID: <157978749667.1147.17669227053595286924@emeril.freedesktop.org>
References: <20200122164332.11460-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200122164332.11460-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?ib/igt=5Fcore=3A_Detect_gdb_harder?=
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_core: Detect gdb harder
URL   : https://patchwork.freedesktop.org/series/72413/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100065 for the overview.

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1427577):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirZyMyQ0/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579721465:build_script
  [0Ksection_start:1579721465:after_script
  [0Ksection_end:1579721466:after_script
  [0Ksection_start:1579721466:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1375 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1427577 responseStatus[0;m=201 Created token[0;m=fneLt31V
  section_end:1579721473:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1427843):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirnQLZds/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579721835:build_script
  [0Ksection_start:1579721835:after_script
  [0Ksection_end:1579721837:after_script
  [0Ksection_start:1579721837:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1375 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1427843 responseStatus[0;m=201 Created token[0;m=sqjQ_yZh
  section_end:1579721843:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1427948):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirzZL88m/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579722222:build_script
  [0Ksection_start:1579722222:after_script
  [0Ksection_end:1579722224:after_script
  [0Ksection_start:1579722224:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1375 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1427948 responseStatus[0;m=201 Created token[0;m=ByXFs1ez
  section_end:1579722230:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100065
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
