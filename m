Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vikas Srivastava" <vikas.srivastava@intel.com>
Date: Thu, 09 Mar 2023 15:20:18 -0000
Message-ID: <167837521859.12424.15519616269899410518@emeril.freedesktop.org>
References: <20230309141940.714569-1-vikas.srivastava@intel.com>
In-Reply-To: <20230309141940.714569-1-vikas.srivastava@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915=3A_skip_gem=5Fset=5Fcaching_call_for_mtl_=28rev2=29?=
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

Series: tests/i915: skip gem_set_caching call for mtl (rev2)
URL   : https://patchwork.freedesktop.org/series/114544/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/825793 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/37779795):
  367/371 assembler test/rnde-intsrc              OK       0.01 s 
  368/371 assembler test/rndz                     OK       0.05 s 
  369/371 assembler test/lzd                      OK       0.04 s 
  370/371 assembler test/not                      OK       0.03 s 
  371/371 assembler test/immediate                OK       0.03 s 
  
  Ok:                  366
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1678374917:step_script
  section_start:1678374917:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1678374918:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/37779907):
  367/371 assembler test/rnde-intsrc              OK       0.02 s 
  368/371 assembler test/rndz                     OK       0.02 s 
  369/371 assembler test/lzd                      OK       0.03 s 
  370/371 assembler test/not                      OK       0.03 s 
  371/371 assembler test/immediate                OK       0.01 s 
  
  Ok:                  366
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1678375028:step_script
  section_start:1678375028:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1678375028:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/825793
