Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 06 Jul 2021 05:26:18 -0000
Message-ID: <162554917841.25118.4726567551588101453@emeril.freedesktop.org>
References: <20210705141133.10329-1-andrzej.turko@linux.intel.com>
In-Reply-To: <20210705141133.10329-1-andrzej.turko@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_K?=
 =?utf-8?q?eep_tests_working_without_relocations_=28rev6=29?=
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
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Keep tests working without relocations (rev6)
URL   : https://patchwork.freedesktop.org/series/90049/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/353896 for the overview.

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/11533792):
   #11 [_start+0x34]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1625548962:step_script
  section_start:1625548962:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1623 matching files and directories   
  Uploading artifacts as "archive" to coordinator... ok  id=11533792 responseStatus=201 Created token=Gz3E9jvW
  section_end:1625548977:upload_artifacts_on_failure
  section_start:1625548977:cleanup_file_variables
  Cleaning up file based variables
  section_end:1625548978:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/11533793):
   #3 [gsignal+0x76]
  qemu: uncaught target signal 6 (Aborted) - core dumped
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1625548962:step_script
  section_start:1625548962:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1623 matching files and directories   
  Uploading artifacts as "archive" to coordinator... ok  id=11533793 responseStatus=201 Created token=JNuSy7s6
  section_end:1625548976:upload_artifacts_on_failure
  section_start:1625548976:cleanup_file_variables
  Cleaning up file based variables
  section_end:1625548977:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/353896
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
