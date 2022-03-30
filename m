Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Wed, 30 Mar 2022 18:51:17 -0000
Message-ID: <164866627783.8658.3067722920030628800@emeril.freedesktop.org>
References: <20220330183259.3003663-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20220330183259.3003663-1-daniele.ceraolospurio@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_U?=
 =?utf-8?q?nload_mei=5Fgsc_before_i915?=
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

Series: Unload mei_gsc before i915
URL   : https://patchwork.freedesktop.org/series/101973/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/546085 for the overview.

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20509512):
  Ok:                   22
  Expected Fail:         3
  Fail:                287
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1648666153:step_script
  section_start:1648666153:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1712 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=20509512 responseStatus=201 Created token=nqVDYSko
  section_end:1648666164:upload_artifacts_on_failure
  section_start:1648666164:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1648666165:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/546085
