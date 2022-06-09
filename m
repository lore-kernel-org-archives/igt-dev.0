Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Date: Thu, 09 Jun 2022 17:35:11 -0000
Message-ID: <165479611142.17374.9686641713314734526@emeril.freedesktop.org>
References: <20220609170514.138-1-quic_jesszhan@quicinc.com>
In-Reply-To: <20220609170514.138-1-quic_jesszhan@quicinc.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?ib/igt=5Fdebugfs=3A_Add_IGT=5FCRC=5FSOURCE_environmental_variab?=
 =?utf-8?q?le?=
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

Series: lib/igt_debugfs: Add IGT_CRC_SOURCE environmental variable
URL   : https://patchwork.freedesktop.org/series/104937/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/608834 for the overview.

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/23815734):
  Ok:                   22
  Expected Fail:         3
  Fail:                290
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1654796035:step_script
  section_start:1654796035:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1746 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=23815734 responseStatus=201 Created token=y3yTFi8d
  section_end:1654796046:upload_artifacts_on_failure
  section_start:1654796046:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1654796046:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/608834
