Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harry Wentland" <harry.wentland@amd.com>
Date: Wed, 08 Nov 2023 17:56:27 -0000
Message-ID: <169946618735.24274.12536507946587170384@emeril.freedesktop.org>
References: <20231108164006.106967-1-harry.wentland@amd.com>
In-Reply-To: <20231108164006.106967-1-harry.wentland@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?GT_tests_for_the_KMS_Color_Pipeline_API_=28rev3=29?=
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

Series: IGT tests for the KMS Color Pipeline API (rev3)
URL   : https://patchwork.freedesktop.org/series/123448/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1029563 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51350992):
  376/380 assembler test/rnde-intsrc              OK       0.01 s 
  377/380 assembler test/rndz                     OK       0.01 s 
  378/380 assembler test/lzd                      OK       0.01 s 
  379/380 assembler test/not                      OK       0.01 s 
  380/380 assembler test/immediate                OK       0.01 s 
  
  Ok:                  375
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1699465905:step_script
  section_start:1699465905:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699465906:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51350991):
  376/380 assembler test/rnde-intsrc              OK       0.02 s 
  377/380 assembler test/rndz                     OK       0.01 s 
  378/380 assembler test/lzd                      OK       0.01 s 
  379/380 assembler test/not                      OK       0.02 s 
  380/380 assembler test/immediate                OK       0.01 s 
  
  Ok:                  375
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1699465901:step_script
  section_start:1699465901:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699465902:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1029563
