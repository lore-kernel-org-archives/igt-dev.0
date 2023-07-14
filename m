Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Fri, 14 Jul 2023 15:58:25 -0000
Message-ID: <168935030569.13876.381408295783195830@emeril.freedesktop.org>
References: <20230714153946.36448-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230714153946.36448-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_R?=
 =?utf-8?q?FC=3A_runner=3A_dump_GPU_error_state_on_timeout?=
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

Series: RFC: runner: dump GPU error state on timeout
URL   : https://patchwork.freedesktop.org/series/120789/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/935513 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45508999):
  361/365 assembler test/rnde-intsrc              OK       0.01 s 
  362/365 assembler test/rndz                     OK       0.01 s 
  363/365 assembler test/lzd                      OK       0.01 s 
  364/365 assembler test/not                      OK       0.01 s 
  365/365 assembler test/immediate                OK       0.01 s 
  
  Ok:                  360
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1689350189:step_script
  section_start:1689350189:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1689350190:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45508998):
  361/365 assembler test/rnde-intsrc              OK       0.01 s 
  362/365 assembler test/rndz                     OK       0.01 s 
  363/365 assembler test/lzd                      OK       0.01 s 
  364/365 assembler test/not                      OK       0.01 s 
  365/365 assembler test/immediate                OK       0.01 s 
  
  Ok:                  360
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1689350134:step_script
  section_start:1689350134:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1689350135:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/935513
