Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 27 Jan 2020 09:18:49 -0000
Message-ID: <158011672937.9687.14369970478948414924@emeril.freedesktop.org>
References: <20200124170337.346187-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200124170337.346187-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_p?=
 =?utf-8?q?erf=3A_Treat_Cometlake_as_an_alias_for_Coffeelake?=
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

Series: perf: Treat Cometlake as an alias for Coffeelake
URL   : https://patchwork.freedesktop.org/series/72545/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/101157 for the overview.

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1455508):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirGnl8WG/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579887046:build_script
  [0Ksection_start:1579887046:after_script
  [0Ksection_end:1579887047:after_script
  [0Ksection_start:1579887047:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1403 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1455508 responseStatus[0;m=201 Created token[0;m=aG8UxSkm
  section_end:1579887052:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1455681):
  tests/gem_exec_balancer:
    Checking invalid option handling...
    Checking valid option handling...
    Checking subtest enumeration...
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579887332:build_script
  [0Ksection_start:1579887332:after_script
  [0Ksection_end:1579887334:after_script
  [0Ksection_start:1579887334:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1378 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1455681 responseStatus[0;m=201 Created token[0;m=dUdcMQkQ
  section_end:1579887339:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1455683):
  --- stdout ---
  tests/gem_eio:
    Checking invalid option handling...
    Checking valid option handling...
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1579887598:build_script
  [0Ksection_start:1579887598:after_script
  [0Ksection_end:1579887599:after_script
  [0Ksection_start:1579887599:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1378 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1455683 responseStatus[0;m=201 Created token[0;m=5MoxQmiL
  section_end:1579887605:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/101157
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
