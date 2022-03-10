Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 10 Mar 2022 07:43:59 -0000
Message-ID: <164689823925.17006.14644957218221889263@emeril.freedesktop.org>
References: <20220310071008.10811-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220310071008.10811-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?GT_cleanup_=28rev5=29?=
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

Series: IGT cleanup (rev5)
URL   : https://patchwork.freedesktop.org/series/100801/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/528192 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19604116):
  320/324 assembler test/rnde-intsrc              OK       0.05 s 
  321/324 assembler test/rndz                     OK       0.03 s 
  322/324 assembler test/lzd                      OK       0.03 s 
  323/324 assembler test/not                      OK       0.03 s 
  324/324 assembler test/immediate                OK       0.03 s 
  
  Ok:                  320
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1646898107:step_script
  section_start:1646898107:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646898107:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19604117):
  Ok:                  306
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1646898119:step_script
  section_start:1646898119:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1693 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=19604117 responseStatus=201 Created token=n2RAtAht
  section_end:1646898129:upload_artifacts_on_failure
  section_start:1646898129:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646898129:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19604118):
  Ok:                  306
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1646898147:step_script
  section_start:1646898147:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1693 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=19604118 responseStatus=201 Created token=cx6gLEfW
  section_end:1646898158:upload_artifacts_on_failure
  section_start:1646898158:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646898158:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19604115):
  320/324 assembler test/rnde-intsrc              OK       0.02 s 
  321/324 assembler test/rndz                     OK       0.02 s 
  322/324 assembler test/lzd                      OK       0.02 s 
  323/324 assembler test/not                      OK       0.02 s 
  324/324 assembler test/immediate                OK       0.03 s 
  
  Ok:                  320
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1646898098:step_script
  section_start:1646898098:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646898099:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/19604119):
  Ok:                  306
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1646898157:step_script
  section_start:1646898157:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1693 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=19604119 responseStatus=201 Created token=JE3z_9sy
  section_end:1646898167:upload_artifacts_on_failure
  section_start:1646898167:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646898167:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/528192
