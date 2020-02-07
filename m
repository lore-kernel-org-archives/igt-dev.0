Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 07 Feb 2020 03:57:40 -0000
Message-ID: <158104786083.8754.9781105293001854934@emeril.freedesktop.org>
References: <20200207032725.10731-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200207032725.10731-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?ib/igt=5Fvec=3A_assertion_fortification?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_vec: assertion fortification
URL   : https://patchwork.freedesktop.org/series/73125/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/105927 for the overview.

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1574222):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirPJYt8e/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581046847:build_script
  [0Ksection_start:1581046847:after_script
  [0Ksection_end:1581046849:after_script
  [0Ksection_start:1581046849:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1349 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1574222 responseStatus[0;m=201 Created token[0;m=sc9BAghs
  section_end:1581046854:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1574226):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirc2zPSA/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581047237:build_script
  [0Ksection_start:1581047237:after_script
  [0Ksection_end:1581047238:after_script
  [0Ksection_start:1581047238:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1349 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1574226 responseStatus[0;m=201 Created token[0;m=XKvy5hDm
  section_end:1581047244:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1574289):
    [test_root]           Directory that contains the IGT tests. The environment
                          variable IGT_TEST_ROOT will be used if set, overriding
                          this option if given.
  Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdir7gvCp2/test-list.txt
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1581047634:build_script
  [0Ksection_start:1581047634:after_script
  [0Ksection_end:1581047635:after_script
  [0Ksection_start:1581047635:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1349 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1574289 responseStatus[0;m=201 Created token[0;m=x4NddjNn
  section_end:1581047641:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/105927
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
