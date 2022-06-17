Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Date: Fri, 17 Jun 2022 13:13:32 -0000
Message-ID: <165547161201.20135.6190562608887022146@emeril.freedesktop.org>
References: <20220617121052.1208971-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20220617121052.1208971-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_H?=
 =?utf-8?q?AX_add_description_to_gem=5Fmmap=5Fgtt?=
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

Series: HAX add description to gem_mmap_gtt
URL   : https://patchwork.freedesktop.org/series/105293/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/615271 for the overview.

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/24217464):
  Ok:                   22
  Expected Fail:         3
  Fail:                290
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1655471306:step_script
  section_start:1655471306:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1753 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=24217464 responseStatus=201 Created token=7666WgwU
  section_end:1655471317:upload_artifacts_on_failure
  section_start:1655471317:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1655471318:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/615271
