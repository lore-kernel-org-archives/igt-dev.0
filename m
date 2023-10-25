Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Date: Wed, 25 Oct 2023 10:15:54 -0000
Message-ID: <169822895449.20487.10248613141717098420@emeril.freedesktop.org>
References: <20231025092432.726460-1-jesse.zhang@amd.com>
In-Reply-To: <20231025092432.726460-1-jesse.zhang@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/amd=5Fdispatch=3A_add_dispatch_test_for_gfx_and_compute?=
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

Series: tests/amd_dispatch: add dispatch test for gfx and compute
URL   : https://patchwork.freedesktop.org/series/125554/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1018406 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50736539):
  374/378 assembler test/rnde-intsrc              OK       0.02 s 
  375/378 assembler test/rndz                     OK       0.02 s 
  376/378 assembler test/lzd                      OK       0.01 s 
  377/378 assembler test/not                      OK       0.01 s 
  378/378 assembler test/immediate                OK       0.02 s 
  
  Ok:                  372
  Expected Fail:         4
  Fail:                  2
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1698228802:step_script
  section_start:1698228802:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698228802:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50736538):
  374/378 assembler test/rnde-intsrc              OK       0.02 s 
  375/378 assembler test/rndz                     OK       0.02 s 
  376/378 assembler test/lzd                      OK       0.02 s 
  377/378 assembler test/not                      OK       0.01 s 
  378/378 assembler test/immediate                OK       0.02 s 
  
  Ok:                  373
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1698228796:step_script
  section_start:1698228796:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698228797:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1018406
