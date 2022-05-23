Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Mon, 23 May 2022 11:31:27 -0000
Message-ID: <165330548771.9279.10562052460673522570@emeril.freedesktop.org>
References: <20220523080932.9326-1-swati2.sharma@intel.com>
In-Reply-To: <20220523080932.9326-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2Cv2=2C1/2=5D_tests/kms=5Fplane=5F?=
 =?utf-8?q?scaling=3A_Fix_indentation?=
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

Series: series starting with [i-g-t,v2,1/2] tests/kms_plane_scaling: Fix indentation
URL   : https://patchwork.freedesktop.org/series/104272/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/593695 for the overview.

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/23034864):
  [459/461] Linking target tools/null_state_gen/intel_null_state_gen.
  [460/461] Compiling C object 'tools/f9d35d4@@intel_gpu_top@exe/intel_gpu_top.c.o'.
  [461/461] Linking target tools/intel_gpu_top.
  section_end:1653305098:step_script
  section_start:1653305098:upload_artifacts_on_success
  Uploading artifacts for successful job
  Uploading artifacts...
  build: found 714 matching files and directories    
  WARNING: Uploading artifacts as "archive" to coordinator... POST https://gitlab.freedesktop.org/api/v4/jobs/23034864/artifacts?artifact_format=zip&artifact_type=archive: 500 Internal Server Error  id=23034864 responseStatus=500 Internal Server Error status=500 token=zBNiXp4W
  WARNING: Retrying...                                context=artifacts-uploader error=invalid argument
  WARNING: Uploading artifacts as "archive" to coordinator... POST https://gitlab.freedesktop.org/api/v4/jobs/23034864/artifacts?artifact_format=zip&artifact_type=archive: 500 Internal Server Error  id=23034864 responseStatus=500 Internal Server Error status=500 token=zBNiXp4W
  WARNING: Retrying...                                context=artifacts-uploader error=invalid argument
  WARNING: Uploading artifacts as "archive" to coordinator... POST https://gitlab.freedesktop.org/api/v4/jobs/23034864/artifacts?artifact_format=zip&artifact_type=archive: 500 Internal Server Error  id=23034864 responseStatus=500 Internal Server Error status=500 token=zBNiXp4W
  FATAL: invalid argument                            
  section_end:1653305108:upload_artifacts_on_success
  section_start:1653305108:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1653305109:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/593695
