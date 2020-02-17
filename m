Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 17 Feb 2020 13:16:21 -0000
Message-ID: <158194538174.16571.9263329218273532524@emeril.freedesktop.org>
References: <20200214214829.4054673-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200214214829.4054673-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?ib=3A_Update_selftests_to_use_dynamic_subtests_=28rev3=29?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: Update selftests to use dynamic subtests (rev3)
URL   : https://patchwork.freedesktop.org/series/73486/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/109461 for the overview.

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1648469):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirxoyF5h/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581944535:build_script
  [0Ksection_start:1581944535:after_script
  [0Ksection_end:1581944536:after_script
  [0Ksection_start:1581944536:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1342 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1648469 responseStatus[0;m=201 Created token[0;m=s2fRwncy
  section_end:1581944542:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1648541):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirXjeWz6/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581944924:build_script
  [0Ksection_start:1581944924:after_script
  [0Ksection_end:1581944926:after_script
  [0Ksection_start:1581944926:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1342 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1648541 responseStatus[0;m=201 Created token[0;m=QfDnCLqG
  section_end:1581944931:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1648546):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdiriG8DYn/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581945329:build_script
  [0Ksection_start:1581945329:after_script
  [0Ksection_end:1581945331:after_script
  [0Ksection_start:1581945331:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1342 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1648546 responseStatus[0;m=201 Created token[0;m=XzgWcj2F
  section_end:1581945336:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/109461
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
