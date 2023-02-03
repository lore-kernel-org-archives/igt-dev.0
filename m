Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Fri, 03 Feb 2023 02:40:24 -0000
Message-ID: <167539202457.8764.14169331364260565233@emeril.freedesktop.org>
References: <20230202051509.28983-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230202051509.28983-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_L?=
 =?utf-8?q?imit_the_execution_to_few_pipes/planes_=28rev5=29?=
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

Series: Limit the execution to few pipes/planes (rev5)
URL   : https://patchwork.freedesktop.org/series/113526/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/799705 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35824947):
  342/346 assembler test/rnde-intsrc              OK       0.02 s 
  343/346 assembler test/rndz                     OK       0.02 s 
  344/346 assembler test/lzd                      OK       0.02 s 
  345/346 assembler test/not                      OK       0.02 s 
  346/346 assembler test/immediate                OK       0.03 s 
  
  Ok:                  341
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1675391760:step_script
  section_start:1675391760:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1675391761:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35825005):
  342/346 assembler test/rnde-intsrc              OK       0.02 s 
  343/346 assembler test/rndz                     OK       0.02 s 
  344/346 assembler test/lzd                      OK       0.02 s 
  345/346 assembler test/not                      OK       0.03 s 
  346/346 assembler test/immediate                OK       0.03 s 
  
  Ok:                  341
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1675391939:step_script
  section_start:1675391939:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1675391940:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/799705
