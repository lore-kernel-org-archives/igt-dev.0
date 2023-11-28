Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Tue, 28 Nov 2023 02:51:50 -0000
Message-ID: <170113991047.8220.1667593185189044809@emeril.freedesktop.org>
References: <20231128023348.19418-1-nidhi1.gupta@intel.com>
In-Reply-To: <20231128023348.19418-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/intel/kms=5Ffrontbuffer=5Ftracking=3A_Add_new_subtest_to_t?=
 =?utf-8?q?est_FBC_on_each_pipe_=28rev3=29?=
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

Series: tests/intel/kms_frontbuffer_tracking: Add new subtest to test FBC on each pipe (rev3)
URL   : https://patchwork.freedesktop.org/series/126708/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1043872 for the overview.

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52084114):
  376/380 assembler test/rnde-intsrc              OK       0.01 s 
  377/380 assembler test/rndz                     OK       0.01 s 
  378/380 assembler test/lzd                      OK       0.01 s 
  379/380 assembler test/not                      OK       0.02 s 
  380/380 assembler test/immediate                OK       0.01 s 
  
  Ok:                  375
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1701139734:step_script
  section_start:1701139734:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701139735:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1043872
