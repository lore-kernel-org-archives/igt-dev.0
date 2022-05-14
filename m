Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Date: Sat, 14 May 2022 00:39:31 -0000
Message-ID: <165248877178.14454.17274021131199990232@emeril.freedesktop.org>
References: <20220513234838.174-1-quic_jesszhan@quicinc.com>
In-Reply-To: <20220513234838.174-1-quic_jesszhan@quicinc.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fwriteback=3A_Add_helper_method_to_detach_pipe_from_o?=
 =?utf-8?q?utput_when_test_finishes?=
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

Series: tests/kms_writeback: Add helper method to detach pipe from output when test finishes
URL   : https://patchwork.freedesktop.org/series/104003/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/585850 for the overview.

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/22679908):
  Ok:                   22
  Expected Fail:         3
  Fail:                289
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1652488701:step_script
  section_start:1652488701:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1725 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=22679908 responseStatus=201 Created token=qR4L1kEi
  section_end:1652488711:upload_artifacts_on_failure
  section_start:1652488711:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1652488712:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/585850
