Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 03 Mar 2022 04:22:39 -0000
Message-ID: <164628135935.19838.12573628120167144703@emeril.freedesktop.org>
References: <20220303034634.30253-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220303034634.30253-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?GT_cleanup_=28rev3=29?=
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

Series: IGT cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/100801/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/522559 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19381022):
  320/324 assembler test/rnde-intsrc              OK       0.02 s 
  321/324 assembler test/rndz                     OK       0.01 s 
  322/324 assembler test/lzd                      OK       0.02 s 
  323/324 assembler test/not                      OK       0.02 s 
  324/324 assembler test/immediate                OK       0.01 s 
  
  Ok:                  320
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1646280999:step_script
  section_start:1646280999:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646281000:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19381025):
  Ok:                  306
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1646281067:step_script
  section_start:1646281067:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1694 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=19381025 responseStatus=201 Created token=_Rho-Xyd
  section_end:1646281076:upload_artifacts_on_failure
  section_start:1646281076:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646281076:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19381026):
  Ok:                  306
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1646281072:step_script
  section_start:1646281072:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1694 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=19381026 responseStatus=201 Created token=gUsS_-tL
  section_end:1646281081:upload_artifacts_on_failure
  section_start:1646281081:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646281082:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19381024):
  320/324 assembler test/rnde-intsrc              OK       0.02 s 
  321/324 assembler test/rndz                     OK       0.01 s 
  322/324 assembler test/lzd                      OK       0.02 s 
  323/324 assembler test/not                      OK       0.03 s 
  324/324 assembler test/immediate                OK       0.03 s 
  
  Ok:                  320
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1646281030:step_script
  section_start:1646281030:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646281030:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19381027):
  Ok:                  306
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1646281119:step_script
  section_start:1646281119:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1694 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=19381027 responseStatus=201 Created token=SZ5GUuk8
  section_end:1646281128:upload_artifacts_on_failure
  section_start:1646281128:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646281129:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/522559
