Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 09 Mar 2020 08:57:20 -0000
Message-ID: <158374424098.9449.12157754394994006707@emeril.freedesktop.org>
References: <20200307211751.22125-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200307211751.22125-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?est/kms=3A_Add_support_for_display_with_non-contiguous_pipes?=
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: test/kms: Add support for display with non-contiguous pipes
URL   : https://patchwork.freedesktop.org/series/74431/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/117422 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1867407):
  --- stdout ---
  tests/kms_plane_multiple:
    Checking invalid option handling...
    Checking valid option handling...
    Checking subtest enumeration...
      test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!
  FAIL: tests/kms_plane_multiple
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1583743716:build_script
  section_start:1583743716:after_script
  section_end:1583743717:after_script
  section_start:1583743717:upload_artifacts_on_failure
  section_end:1583743719:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1867413):
    Checking valid option handling...
    Checking subtest enumeration...
      test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!
  FAIL: tests/kms_plane_multiple
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1583743853:build_script
  section_start:1583743853:after_script
  section_end:1583743855:after_script
  section_start:1583743855:upload_artifacts_on_failure
  Uploading artifacts...
  build: found 1367 matching files                   
  Uploading artifacts to coordinator... ok            id=1867413 responseStatus=201 Created token=QihTyF6M
  section_end:1583743865:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1867412):
    Checking valid option handling...
    Checking subtest enumeration...
      test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!
  FAIL: tests/kms_plane_lowres
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1583743824:build_script
  section_start:1583743824:after_script
  section_end:1583743826:after_script
  section_start:1583743826:upload_artifacts_on_failure
  Uploading artifacts...
  build: found 1369 matching files                   
  Uploading artifacts to coordinator... ok            id=1867412 responseStatus=201 Created token=Q2SFDAgq
  section_end:1583743835:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1867408):
  --- stdout ---
  tests/kms_plane_multiple:
    Checking invalid option handling...
    Checking valid option handling...
    Checking subtest enumeration...
      test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!
  FAIL: tests/kms_plane_multiple
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1583743723:build_script
  section_start:1583743723:after_script
  section_end:1583743724:after_script
  section_start:1583743724:upload_artifacts_on_failure
  section_end:1583743726:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1867415):
    Checking valid option handling...
    Checking subtest enumeration...
      test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!
  FAIL: tests/kms_plane_multiple
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1583744103:build_script
  section_start:1583744103:after_script
  section_end:1583744105:after_script
  section_start:1583744105:upload_artifacts_on_failure
  Uploading artifacts...
  build: found 1367 matching files                   
  Uploading artifacts to coordinator... ok            id=1867415 responseStatus=201 Created token=Q7jPbghv
  section_end:1583744115:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/117422
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
