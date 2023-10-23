Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lobo, Melanie" <melanie.lobo@intel.com>
Date: Mon, 23 Oct 2023 17:52:13 -0000
Message-ID: <169808353381.19838.3597981281202567305@emeril.freedesktop.org>
References: <20231010134540.28485-1-melanie.lobo@intel.com>
In-Reply-To: <20231010134540.28485-1-melanie.lobo@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/intel/kms=5Fflip=5Fscaled=5Fcrc=3A_Add_support_for_FP16_fo?=
 =?utf-8?q?rmat_of_MTL_compressed_modifier_=28rev6=29?=
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

Series: tests/intel/kms_flip_scaled_crc: Add support for FP16 format of MTL compressed modifier (rev6)
URL   : https://patchwork.freedesktop.org/series/124956/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1016870 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50646666):
  374/378 assembler test/rnde-intsrc              OK       0.06 s 
  375/378 assembler test/rndz                     OK       0.04 s 
  376/378 assembler test/lzd                      OK       0.04 s 
  377/378 assembler test/not                      OK       0.04 s 
  378/378 assembler test/immediate                OK       0.03 s 
  
  Ok:                  370
  Expected Fail:         4
  Fail:                  0
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               4
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1698083522:step_script
  section_start:1698083522:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698083524:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1016870
