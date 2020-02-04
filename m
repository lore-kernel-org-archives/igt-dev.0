Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 04 Feb 2020 15:44:53 -0000
Message-ID: <158083109340.25089.8471201181569099285@emeril.freedesktop.org>
References: <20200204114837.887623-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200204114837.887623-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_i?=
 =?utf-8?q?ntel-ci=3A_Delegate_exhaustive_fault-injection_to_the_idle_runs?=
 =?utf-8?q?_=28rev2=29?=
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

Series: intel-ci: Delegate exhaustive fault-injection to the idle runs (rev2)
URL   : https://patchwork.freedesktop.org/series/70452/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/104634 for the overview.

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1541022):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirXyxDFV/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1580830176:build_script
  [0Ksection_start:1580830176:after_script
  [0Ksection_end:1580830178:after_script
  [0Ksection_start:1580830178:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1349 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1541022 responseStatus[0;m=201 Created token[0;m=yVDkKqk-
  section_end:1580830183:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1541153):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirwg0yqf/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1580830528:build_script
  [0Ksection_start:1580830528:after_script
  [0Ksection_end:1580830530:after_script
  [0Ksection_start:1580830530:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1349 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1541153 responseStatus[0;m=201 Created token[0;m=YpnCzzDE
  section_end:1580830535:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1541289):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirO17q0c/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1580830892:build_script
  [0Ksection_start:1580830892:after_script
  [0Ksection_end:1580830894:after_script
  [0Ksection_start:1580830894:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1349 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1541289 responseStatus[0;m=201 Created token[0;m=axCx4PHh
  section_end:1580830899:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/104634
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
