Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Fri, 08 Apr 2022 17:25:12 -0000
Message-ID: <164943871260.22676.6703926834249905066@emeril.freedesktop.org>
References: <20220407192856.15813-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20220407192856.15813-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/kms=5Fflip=5Fscaled=5Fcrc=3A_Fix_error_message_=28rev?=
 =?utf-8?q?2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/kms_flip_scaled_crc: Fix error message (rev2)
URL   : https://patchwork.freedesktop.org/series/102363/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/554277 for the overview.

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20931772):
  Ok:                   22
  Expected Fail:         3
  Fail:                288
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1649438511:step_script
  section_start:1649438511:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1722 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=20931772 responseStatus=201 Created token=rJSw9Nfb
  section_end:1649438523:upload_artifacts_on_failure
  section_start:1649438523:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649438524:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20931774):
  Ok:                   22
  Expected Fail:         3
  Fail:                288
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1649438534:step_script
  section_start:1649438534:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1722 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=20931774 responseStatus=201 Created token=_YpXhxfA
  section_end:1649438543:upload_artifacts_on_failure
  section_start:1649438543:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649438545:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20931773):
  Ok:                   22
  Expected Fail:         3
  Fail:                288
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1649438533:step_script
  section_start:1649438533:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1722 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=20931773 responseStatus=201 Created token=xUPT8hPm
  section_end:1649438543:upload_artifacts_on_failure
  section_start:1649438543:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649438545:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/554277
