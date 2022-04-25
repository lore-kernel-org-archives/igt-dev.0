Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pillai, Aurabindo" <aurabindo.pillai@amd.com>
Date: Mon, 25 Apr 2022 19:54:25 -0000
Message-ID: <165091646571.32286.12774446819812553580@emeril.freedesktop.org>
References: <20220425184556.771707-1-dingchen.zhang@amd.com>
In-Reply-To: <20220425184556.771707-1-dingchen.zhang@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_a?=
 =?utf-8?q?mdgpu_PSR-SU_cursor_move_test_cases_=28rev4=29?=
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

Series: amdgpu PSR-SU cursor move test cases (rev4)
URL   : https://patchwork.freedesktop.org/series/102886/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/569071 for the overview.

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/21733586):
  Ok:                  310
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1650916225:step_script
  section_start:1650916225:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1718 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=21733586 responseStatus=201 Created token=ayt62HGC
  section_end:1650916235:upload_artifacts_on_failure
  section_start:1650916235:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1650916236:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/569071
