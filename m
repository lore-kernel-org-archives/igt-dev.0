Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 26 May 2021 09:12:29 -0000
Message-ID: <162202034937.13407.14627196885649764711@emeril.freedesktop.org>
References: <20210526072040.2286-1-anshuman.gupta@intel.com>
In-Reply-To: <20210526072040.2286-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_P?=
 =?utf-8?q?C_state_igt_test_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: PC state igt test (rev4)
URL   : https://patchwork.freedesktop.org/series/84737/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/326403 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10112464):
  [1096/1097] Linking target runner/igt_results.
  [1097/1097] Linking target runner/runner_test.
  $ cp build/tests/test-list.txt meson-test-list.txt
  section_end:1622019273:step_script
  section_start:1622019273:upload_artifacts_on_success
  Uploading artifacts for successful job
  Uploading artifacts...
  meson-test-list.txt: found 1 matching files and directories 
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112464 responseStatus=400 Bad Request status=400 token=DzV_TMSa
  WARNING: Retrying...                                context=artifacts-uploader error=invalid argument
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112464 responseStatus=500 Internal Server Error status=500 token=DzV_TMSa
  WARNING: Retrying...                                context=artifacts-uploader error=invalid argument
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112464 responseStatus=500 Internal Server Error status=500 token=DzV_TMSa
  FATAL: invalid argument                            
  section_end:1622019510:upload_artifacts_on_success
  section_start:1622019510:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622019511:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10112467):
  [1029/1031] Linking target tests/gem_exec_schedule.
  [1030/1031] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1031/1031] Linking target runner/runner_test.
  section_end:1622019332:step_script
  section_start:1622019332:upload_artifacts_on_success
  Uploading artifacts for successful job
  Uploading artifacts...
  build: found 1579 matching files and directories   
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112467 responseStatus=500 Internal Server Error status=500 token=14feHmpg
  WARNING: Retrying...                                context=artifacts-uploader error=invalid argument
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112467 responseStatus=500 Internal Server Error status=500 token=14feHmpg
  WARNING: Retrying...                                context=artifacts-uploader error=invalid argument
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112467 responseStatus=500 Internal Server Error status=500 token=14feHmpg
  FATAL: invalid argument                            
  section_end:1622019517:upload_artifacts_on_success
  section_start:1622019517:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622019518:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10112466):
  [1029/1031] Linking target tests/gem_exec_schedule.
  [1030/1031] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1031/1031] Linking target runner/runner_test.
  section_end:1622019314:step_script
  section_start:1622019314:upload_artifacts_on_success
  Uploading artifacts for successful job
  Uploading artifacts...
  build: found 1579 matching files and directories   
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112466 responseStatus=500 Internal Server Error status=500 token=o6ioFHy3
  WARNING: Retrying...                                context=artifacts-uploader error=invalid argument
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112466 responseStatus=500 Internal Server Error status=500 token=o6ioFHy3
  WARNING: Retrying...                                context=artifacts-uploader error=invalid argument
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112466 responseStatus=500 Internal Server Error status=500 token=o6ioFHy3
  FATAL: invalid argument                            
  section_end:1622019499:upload_artifacts_on_success
  section_start:1622019499:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622019500:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10112468):
  [1029/1031] Linking target tests/perf.
  [1030/1031] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
  [1031/1031] Linking target runner/runner_test.
  section_end:1622019380:step_script
  section_start:1622019380:upload_artifacts_on_success
  Uploading artifacts for successful job
  Uploading artifacts...
  build: found 1579 matching files and directories   
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112468 responseStatus=500 Internal Server Error status=500 token=NUy6qnzp
  WARNING: Retrying...                                context=artifacts-uploader error=invalid argument
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112468 responseStatus=500 Internal Server Error status=500 token=NUy6qnzp
  WARNING: Retrying...                                context=artifacts-uploader error=invalid argument
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112468 responseStatus=500 Internal Server Error status=500 token=NUy6qnzp
  FATAL: invalid argument                            
  section_end:1622019683:upload_artifacts_on_success
  section_start:1622019683:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622019684:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10112465):
  [437/439] Linking target tools/i915-perf/i915-perf-configs.
  [438/439] Linking target tools/i915-perf/i915-perf-reader.
  [439/439] Linking target tools/i915-perf/i915-perf-recorder.
  section_end:1622019304:step_script
  section_start:1622019304:upload_artifacts_on_success
  Uploading artifacts for successful job
  Uploading artifacts...
  build: found 680 matching files and directories    
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112465 responseStatus=500 Internal Server Error status=500 token=Ay86Fka_
  WARNING: Retrying...                                context=artifacts-uploader error=invalid argument
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112465 responseStatus=500 Internal Server Error status=500 token=Ay86Fka_
  WARNING: Retrying...                                context=artifacts-uploader error=invalid argument
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112465 responseStatus=500 Internal Server Error status=500 token=Ay86Fka_
  FATAL: invalid argument                            
  section_end:1622019503:upload_artifacts_on_success
  section_start:1622019503:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622019504:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10112459):
  html/igt-gpu-tools-debugfs.html:1600: warning: no link for: "rcu-barrier" -> (<code class="function">rcu_barrier()</code>).
  
  section_end:1622019111:step_script
  section_start:1622019111:upload_artifacts_on_success
  Uploading artifacts for successful job
  Uploading artifacts...
  build: found 1930 matching files and directories   
  installdir: found 502 matching files and directories 
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112459 responseStatus=500 Internal Server Error status=500 token=Rcyovedu
  WARNING: Retrying...                                context=artifacts-uploader error=invalid argument
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112459 responseStatus=502 Bad Gateway status=502 token=Rcyovedu
  WARNING: Retrying...                                context=artifacts-uploader error=invalid argument
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112459 responseStatus=500 Internal Server Error status=500 token=Rcyovedu
  FATAL: invalid argument                            
  section_end:1622019714:upload_artifacts_on_success
  section_start:1622019714:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622019715:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10112463):
  [1095/1097] Linking target runner/runner_test.
  [1096/1097] Compiling C object 'assembler/1ca89e8@@intel-gen4asm@exe/meson-generated_gram.c.o'.
  [1097/1097] Linking target assembler/intel-gen4asm.
  section_end:1622019290:step_script
  section_start:1622019290:upload_artifacts_on_success
  Uploading artifacts for successful job
  Uploading artifacts...
  build: found 1678 matching files and directories   
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112463 responseStatus=500 Internal Server Error status=500 token=zCTDUris
  WARNING: Retrying...                                context=artifacts-uploader error=invalid argument
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112463 responseStatus=500 Internal Server Error status=500 token=zCTDUris
  WARNING: Retrying...                                context=artifacts-uploader error=invalid argument
  WARNING: Uploading artifacts as "archive" to coordinator... failed  id=10112463 responseStatus=500 Internal Server Error status=500 token=zCTDUris
  FATAL: invalid argument                            
  section_end:1622019470:upload_artifacts_on_success
  section_start:1622019470:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622019471:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/326403
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
