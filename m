Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 01 Jun 2023 02:35:49 -0000
Message-ID: <168558694932.16227.5589944754604387616@emeril.freedesktop.org>
References: <20230531174248.29479-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230531174248.29479-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fvrr=3A_New_VRR_test_to_toggle_the_VRR_during_fastset?=
 =?utf-8?q?s_=28rev3=29?=
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

Series: tests/kms_vrr: New VRR test to toggle the VRR during fastsets (rev3)
URL   : https://patchwork.freedesktop.org/series/118404/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/896078 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42831424):
  379/383 assembler test/rnde-intsrc              OK       0.01 s 
  380/383 assembler test/rndz                     OK       0.01 s 
  381/383 assembler test/lzd                      OK       0.01 s 
  382/383 assembler test/not                      OK       0.01 s 
  383/383 assembler test/immediate                OK       0.01 s 
  
  Ok:                  378
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1685586870:step_script
  section_start:1685586870:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685586871:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42831423):
  379/383 assembler test/rnde-intsrc              OK       0.01 s 
  380/383 assembler test/rndz                     OK       0.01 s 
  381/383 assembler test/lzd                      OK       0.01 s 
  382/383 assembler test/not                      OK       0.02 s 
  383/383 assembler test/immediate                OK       0.01 s 
  
  Ok:                  378
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1685586856:step_script
  section_start:1685586856:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685586857:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/896078
