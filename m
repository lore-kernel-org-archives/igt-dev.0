Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melissa Wen" <mwen@igalia.com>
Date: Thu, 31 Mar 2022 17:30:27 -0000
Message-ID: <164874782770.14474.9535419622516592112@emeril.freedesktop.org>
References: <20220331145344.2503592-1-mwen@igalia.com>
In-Reply-To: <20220331145344.2503592-1-mwen@igalia.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fplane=5Falpha=5Fblend=3A_refactor_alpha-7efc_for_cle?=
 =?utf-8?q?arer_validation?=
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

Series: tests/kms_plane_alpha_blend: refactor alpha-7efc for clearer validation
URL   : https://patchwork.freedesktop.org/series/102026/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/547045 for the overview.

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20569675):
  Ok:                   22
  Expected Fail:         3
  Fail:                287
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1648747524:step_script
  section_start:1648747524:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1713 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=20569675 responseStatus=201 Created token=ZkXD-TSJ
  section_end:1648747535:upload_artifacts_on_failure
  section_start:1648747535:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1648747536:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20569676):
  Ok:                   22
  Expected Fail:         3
  Fail:                287
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1648747524:step_script
  section_start:1648747524:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1713 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=20569676 responseStatus=201 Created token=GWysfov2
  section_end:1648747535:upload_artifacts_on_failure
  section_start:1648747535:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1648747535:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/547045
