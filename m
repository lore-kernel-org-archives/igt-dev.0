Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Thu, 06 Jul 2023 20:22:27 -0000
Message-ID: <168867494789.18977.4759505336812992391@emeril.freedesktop.org>
References: <20230706195354.22416-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230706195354.22416-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/amdgpu=3A_add_vcn_decoder_and_encoder_tests_=28rev3=29?=
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

Series: tests/amdgpu: add vcn decoder and encoder tests (rev3)
URL   : https://patchwork.freedesktop.org/series/120292/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/928663 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45043141):
  360/364 assembler test/rnde-intsrc              OK       0.01 s 
  361/364 assembler test/rndz                     OK       0.02 s 
  362/364 assembler test/lzd                      OK       0.01 s 
  363/364 assembler test/not                      OK       0.01 s 
  364/364 assembler test/immediate                OK       0.01 s 
  
  Ok:                  359
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1688674753:step_script
  section_start:1688674753:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688674753:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/45043140):
  360/364 assembler test/rnde-intsrc              OK       0.01 s 
  361/364 assembler test/rndz                     OK       0.01 s 
  362/364 assembler test/lzd                      OK       0.01 s 
  363/364 assembler test/not                      OK       0.01 s 
  364/364 assembler test/immediate                OK       0.01 s 
  
  Ok:                  359
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1688674751:step_script
  section_start:1688674751:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688674751:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/928663
