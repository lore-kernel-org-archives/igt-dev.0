Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Hung" <alex.hung@amd.com>
Date: Wed, 14 Dec 2022 00:15:16 -0000
Message-ID: <167097691616.8285.12576498592081043319@emeril.freedesktop.org>
References: <20221213234332.364224-1-alex.hung@amd.com>
In-Reply-To: <20221213234332.364224-1-alex.hung@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5B1/2=5D_tests/kms=5Fbw=3A_Test_outputs_wi?=
 =?utf-8?q?th_fb_of_the_same_resolutions?=
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

Series: series starting with [1/2] tests/kms_bw: Test outputs with fb of the same resolutions
URL   : https://patchwork.freedesktop.org/series/111914/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/761837 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33465553):
  335/339 assembler test/rnde-intsrc              OK       0.03 s 
  336/339 assembler test/rndz                     OK       0.02 s 
  337/339 assembler test/lzd                      OK       0.02 s 
  338/339 assembler test/not                      OK       0.02 s 
  339/339 assembler test/immediate                OK       0.03 s 
  
  Ok:                  334
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1670976667:step_script
  section_start:1670976667:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1670976668:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33465579):
  335/339 assembler test/rnde-intsrc              OK       0.02 s 
  336/339 assembler test/rndz                     OK       0.03 s 
  337/339 assembler test/lzd                      OK       0.03 s 
  338/339 assembler test/not                      OK       0.02 s 
  339/339 assembler test/immediate                OK       0.03 s 
  
  Ok:                  334
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1670976839:step_script
  section_start:1670976839:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1670976840:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/761837
