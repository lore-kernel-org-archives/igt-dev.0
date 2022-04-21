Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Date: Thu, 21 Apr 2022 23:37:08 -0000
Message-ID: <165058422840.10761.12421126355905851518@emeril.freedesktop.org>
References: <20220421213442.366-1-quic_jesszhan@quicinc.com>
In-Reply-To: <20220421213442.366-1-quic_jesszhan@quicinc.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Funiversal=5Fplane=3A_Change_num=5Fprimary_and_num=5F?=
 =?utf-8?q?cursor_asserts_into_warnings_=28rev2=29?=
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

Series: tests/kms_universal_plane: Change num_primary and num_cursor asserts into warnings (rev2)
URL   : https://patchwork.freedesktop.org/series/102966/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/566279 for the overview.

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/21599860):
  Ok:                   22
  Expected Fail:         3
  Fail:                289
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1650584030:step_script
  section_start:1650584030:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1725 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=21599860 responseStatus=201 Created token=8n5LEVK_
  section_end:1650584040:upload_artifacts_on_failure
  section_start:1650584040:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1650584041:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/566279
