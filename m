Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 02 Feb 2023 05:51:20 -0000
Message-ID: <167531708058.11113.11652311931890359248@emeril.freedesktop.org>
References: <20230202051509.28983-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230202051509.28983-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_L?=
 =?utf-8?q?imit_the_execution_to_few_pipes/planes_=28rev2=29?=
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

Series: Limit the execution to few pipes/planes (rev2)
URL   : https://patchwork.freedesktop.org/series/113526/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/798663 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35743918):
  342/346 assembler test/rnde-intsrc              OK       0.02 s 
  343/346 assembler test/rndz                     OK       0.02 s 
  344/346 assembler test/lzd                      OK       0.03 s 
  345/346 assembler test/not                      OK       0.02 s 
  346/346 assembler test/immediate                OK       0.01 s 
  
  Ok:                  341
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1675316692:step_script
  section_start:1675316692:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1675316692:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35744141):
  342/346 assembler test/rnde-intsrc              OK       0.04 s 
  343/346 assembler test/rndz                     OK       0.02 s 
  344/346 assembler test/lzd                      OK       0.03 s 
  345/346 assembler test/not                      OK       0.03 s 
  346/346 assembler test/immediate                OK       0.03 s 
  
  Ok:                  341
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1675316871:step_script
  section_start:1675316871:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1675316872:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/798663
