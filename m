Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Date: Thu, 31 Mar 2022 17:00:16 -0000
Message-ID: <164874601658.14471.14579123295868029228@emeril.freedesktop.org>
References: <20220331140348.2985832-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220331140348.2985832-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_P?=
 =?utf-8?q?er_client_GPU_utilisation_=28rev2=29?=
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

Series: Per client GPU utilisation (rev2)
URL   : https://patchwork.freedesktop.org/series/100571/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/547021 for the overview.

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20568232):
  Ok:                   22
  Expected Fail:         3
  Fail:                288
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1648745778:step_script
  section_start:1648745778:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1729 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=20568232 responseStatus=201 Created token=cvtm6eCL
  section_end:1648745788:upload_artifacts_on_failure
  section_start:1648745788:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1648745788:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20568233):
  Ok:                   22
  Expected Fail:         3
  Fail:                288
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1648745783:step_script
  section_start:1648745783:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1728 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=20568233 responseStatus=201 Created token=BmgKsm5T
  section_end:1648745792:upload_artifacts_on_failure
  section_start:1648745792:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1648745792:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/547021
