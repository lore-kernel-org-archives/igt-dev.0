Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 19 Nov 2021 13:56:45 -0000
Message-ID: <163733020571.2299.15100800322688920773@emeril.freedesktop.org>
References: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/6=5D_tests/api=5Fintel=5Falloc?=
 =?utf-8?q?ator=3A_Fix_build_warning?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/6] tests/api_intel_allocator: Fix build warning
URL   : https://patchwork.freedesktop.org/series/97101/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/449803 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/16002336):
  311/315 assembler test/rnde-intsrc              OK       0.02 s 
  312/315 assembler test/rndz                     OK       0.01 s 
  313/315 assembler test/lzd                      OK       0.02 s 
  314/315 assembler test/not                      OK       0.02 s 
  315/315 assembler test/immediate                OK       0.02 s 
  
  Ok:                  311
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1637330018:step_script
  section_start:1637330018:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1637330018:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/16002335):
  Ok:                  297
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1637329911:step_script
  section_start:1637329911:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1661 matching files and directories   
  Uploading artifacts as "archive" to coordinator... ok  id=16002335 responseStatus=201 Created token=F4gSR22q
  section_end:1637329925:upload_artifacts_on_failure
  section_start:1637329925:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1637329927:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/16002337):
  Ok:                  297
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1637329927:step_script
  section_start:1637329927:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1661 matching files and directories   
  Uploading artifacts as "archive" to coordinator... ok  id=16002337 responseStatus=201 Created token=FeWN7Cg4
  section_end:1637329939:upload_artifacts_on_failure
  section_start:1637329939:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1637329940:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/16002334):
  311/315 assembler test/rnde-intsrc              OK       0.03 s 
  312/315 assembler test/rndz                     OK       0.03 s 
  313/315 assembler test/lzd                      OK       0.05 s 
  314/315 assembler test/not                      OK       0.04 s 
  315/315 assembler test/immediate                OK       0.03 s 
  
  Ok:                  311
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1637329854:step_script
  section_start:1637329854:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1637329855:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/16002333):
  20/24 lib igt_thread                          OK       0.05 s 
  21/24 lib i915_perf_data_alignment            OK       0.03 s 
  22/24 lib igt_no_subtest                      EXPECTEDFAIL 0.03 s 
  23/24 lib igt_simple_test_subtests            EXPECTEDFAIL 0.02 s 
  24/24 lib igt_timeout                         EXPECTEDFAIL 1.03 s 
  
  Ok:                   20
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1637329811:step_script
  section_start:1637329811:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1637329811:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/16002332):
  Ok:                  297
  Expected Fail:         3
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1637329830:step_script
  section_start:1637329830:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1661 matching files and directories   
  Uploading artifacts as "archive" to coordinator... ok  id=16002332 responseStatus=201 Created token=xQFk6g_R
  section_end:1637329843:upload_artifacts_on_failure
  section_start:1637329843:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1637329845:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/449803
