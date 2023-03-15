Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dominik Karol Piatkowski" <dominik.karol.piatkowski@intel.com>
Date: Wed, 15 Mar 2023 10:02:51 -0000
Message-ID: <167887457134.19837.4150581261281626166@emeril.freedesktop.org>
References: <20230315094042.5032-1-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230315094042.5032-1-dominik.karol.piatkowski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?ntroduce_KUnit_=28rev2=29?=
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

Series: Introduce KUnit (rev2)
URL   : https://patchwork.freedesktop.org/series/114612/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/830209 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/38098739):
  367/371 assembler test/rnde-intsrc              OK       0.01 s 
  368/371 assembler test/rndz                     OK       0.01 s 
  369/371 assembler test/lzd                      OK       0.01 s 
  370/371 assembler test/not                      OK       0.01 s 
  371/371 assembler test/immediate                OK       0.01 s 
  
  Ok:                  364
  Expected Fail:         4
  Fail:                  3
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1678874355:step_script
  section_start:1678874355:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1678874357:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/38098740):
  367/371 assembler test/rnde-intsrc              OK       0.01 s 
  368/371 assembler test/rndz                     OK       0.01 s 
  369/371 assembler test/lzd                      OK       0.01 s 
  370/371 assembler test/not                      OK       0.01 s 
  371/371 assembler test/immediate                OK       0.01 s 
  
  Ok:                  363
  Expected Fail:         4
  Fail:                  4
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1678874355:step_script
  section_start:1678874355:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1678874357:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/830209
