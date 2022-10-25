Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Tue, 25 Oct 2022 07:48:45 -0000
Message-ID: <166668412581.15482.18431989231532761826@emeril.freedesktop.org>
References: <20221025065941.13397-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221025065941.13397-1-niranjana.vishwanathapura@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_v?=
 =?utf-8?q?m=5Fbind=3A_Add_VM=5FBIND_validation_support_=28rev9=29?=
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

Series: vm_bind: Add VM_BIND validation support (rev9)
URL   : https://patchwork.freedesktop.org/series/105881/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/720549 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/30371993):
  334/338 assembler test/rnde-intsrc              OK       0.02 s 
  335/338 assembler test/rndz                     OK       0.03 s 
  336/338 assembler test/lzd                      OK       0.04 s 
  337/338 assembler test/not                      OK       0.03 s 
  338/338 assembler test/immediate                OK       0.02 s 
  
  Ok:                  333
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1666683185:step_script
  section_start:1666683185:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1666683186:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/30371994):
  334/338 assembler test/rnde-intsrc              OK       0.05 s 
  335/338 assembler test/rndz                     OK       0.05 s 
  336/338 assembler test/lzd                      OK       0.02 s 
  337/338 assembler test/not                      OK       0.04 s 
  338/338 assembler test/immediate                OK       0.04 s 
  
  Ok:                  333
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1666683361:step_script
  section_start:1666683361:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1666683361:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/30372592):
  Ok:                  319
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1666684040:step_script
  section_start:1666684040:upload_artifacts_on_failure
  Uploading artifacts for failed job
  Uploading artifacts...
  build: found 1816 matching files and directories   
  Uploading artifacts as "archive" to coordinator... 201 Created  id=30372592 responseStatus=201 Created token=_hpHWzYx
  section_end:1666684052:upload_artifacts_on_failure
  section_start:1666684052:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1666684053:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/720549
