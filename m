Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "vikassri07" <vikas.srivastava@intel.com>
Date: Mon, 17 Oct 2022 08:41:04 -0000
Message-ID: <166599606452.13567.6236527060113705460@emeril.freedesktop.org>
References: <20221017075822.2655487-1-vikas.srivastava@intel.com>
In-Reply-To: <20221017075822.2655487-1-vikas.srivastava@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?void_caching_ioctl_during_fork?=
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

Series: Avoid caching ioctl during fork
URL   : https://patchwork.freedesktop.org/series/109753/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/713040 for the overview.

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/29841864):
  Ok:                   23
  Expected Fail:         4
  Fail:                293
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1665995908:step_script
  section_start:1665995908:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1786 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=29841864 responseStatus=201 Created token=88NWiGgD
  section_end:1665995918:upload_artifacts_on_failure
  section_start:1665995918:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1665995918:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/713040
