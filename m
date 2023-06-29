Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Liu" <haoping.liu@amd.com>
Date: Thu, 29 Jun 2023 15:36:57 -0000
Message-ID: <168805301730.28966.9957363316824606564@emeril.freedesktop.org>
References: <20230629151001.13821-1-HaoPing.Liu@amd.com>
In-Reply-To: <20230629151001.13821-1-HaoPing.Liu@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/amdgpu/amd=5Fchecksum=5Fregion=3A_Add_test_for_checksum=5F?=
 =?utf-8?q?region?=
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

Series: tests/amdgpu/amd_checksum_region: Add test for checksum_region
URL   : https://patchwork.freedesktop.org/series/120017/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/922476 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44684201):
  356/360 assembler test/rnde-intsrc              OK       0.01 s 
  357/360 assembler test/rndz                     OK       0.01 s 
  358/360 assembler test/lzd                      OK       0.01 s 
  359/360 assembler test/not                      OK       0.01 s 
  360/360 assembler test/immediate                OK       0.01 s 
  
  Ok:                  354
  Expected Fail:         4
  Fail:                  2
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1688052919:step_script
  section_start:1688052919:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688052920:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44684202):
  356/360 assembler test/rnde-intsrc              OK       0.01 s 
  357/360 assembler test/rndz                     OK       0.01 s 
  358/360 assembler test/lzd                      OK       0.01 s 
  359/360 assembler test/not                      OK       0.01 s 
  360/360 assembler test/immediate                OK       0.01 s 
  
  Ok:                  355
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1688052919:step_script
  section_start:1688052919:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688052920:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/922476
