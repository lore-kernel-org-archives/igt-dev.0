Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Tue, 26 Sep 2023 05:22:24 -0000
Message-ID: <169570574477.20980.14818288403634256143@emeril.freedesktop.org>
References: <20230926045425.23137-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230926045425.23137-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Ffrontbuffer=5Ftracking=3A_Extend_the_test_to_enable_?=
 =?utf-8?q?FBC_for_each_plane_=28rev2=29?=
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

Series: tests/kms_frontbuffer_tracking: Extend the test to enable FBC for each plane (rev2)
URL   : https://patchwork.freedesktop.org/series/123724/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/994517 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49465217):
  373/377 assembler test/rnde-intsrc              OK       0.01 s 
  374/377 assembler test/rndz                     OK       0.01 s 
  375/377 assembler test/lzd                      OK       0.01 s 
  376/377 assembler test/not                      OK       0.01 s 
  377/377 assembler test/immediate                OK       0.01 s 
  
  Ok:                  372
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1695705675:step_script
  section_start:1695705675:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695705676:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49465218):
  373/377 assembler test/rnde-intsrc              OK       0.02 s 
  374/377 assembler test/rndz                     OK       0.02 s 
  375/377 assembler test/lzd                      OK       0.02 s 
  376/377 assembler test/not                      OK       0.02 s 
  377/377 assembler test/immediate                OK       0.02 s 
  
  Ok:                  372
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1695705685:step_script
  section_start:1695705685:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695705685:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/994517
