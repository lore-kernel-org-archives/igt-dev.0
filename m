Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 17 Jun 2021 16:02:19 -0000
Message-ID: <162394573995.3754.11298709405945504373@emeril.freedesktop.org>
References: <20210617152032.431594-1-markyacoub@chromium.org>
In-Reply-To: <20210617152032.431594-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fvblank=3A_Turn_on_hardware_before_testing_invalid_vb?=
 =?utf-8?b?bGFuay4gKHJldjMp?=
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
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_vblank: Turn on hardware before testing invalid vblank. (rev3)
URL   : https://patchwork.freedesktop.org/series/90382/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/341723 for the overview.

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/11002462):
  [7447940.955795] Test exited with IGT_EXIT_ABORT, aborting.
  [7447942.102058] Test exited with IGT_EXIT_ABORT, aborting.
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1623945545:step_script
  section_start:1623945545:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1615 matching files and directories   
  Uploading artifacts as "archive" to coordinator... ok  id=11002462 responseStatus=201 Created token=LrUrJB_K
  section_end:1623945557:upload_artifacts_on_failure
  section_start:1623945557:cleanup_file_variables
  Cleaning up file based variables
  section_end:1623945559:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/11002463):
  [7447945.994431] Test exited with IGT_EXIT_ABORT, aborting.
  [7447947.867827] Test exited with IGT_EXIT_ABORT, aborting.
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1623945550:step_script
  section_start:1623945550:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1618 matching files and directories   
  Uploading artifacts as "archive" to coordinator... ok  id=11002463 responseStatus=201 Created token=DbpQq_sw
  section_end:1623945562:upload_artifacts_on_failure
  section_start:1623945562:cleanup_file_variables
  Cleaning up file based variables
  section_end:1623945563:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/341723
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
