Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dominik Karol Piatkowski" <dominik.karol.piatkowski@intel.com>
Date: Fri, 02 Jun 2023 09:16:24 -0000
Message-ID: <168569738411.15698.2235826233400317529@emeril.freedesktop.org>
References: <20230602082721.7818-1-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230602082721.7818-1-dominik.karol.piatkowski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?ntroduce_KUnit_=28rev4=29?=
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

Series: Introduce KUnit (rev4)
URL   : https://patchwork.freedesktop.org/series/114612/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/897380 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42942059):
  379/383 assembler test/rnde-intsrc              OK       0.02 s 
  380/383 assembler test/rndz                     OK       0.02 s 
  381/383 assembler test/lzd                      OK       0.01 s 
  382/383 assembler test/not                      OK       0.01 s 
  383/383 assembler test/immediate                OK       0.02 s 
  
  Ok:                  376
  Expected Fail:         4
  Fail:                  3
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1685697309:step_script
  section_start:1685697309:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685697312:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42942058):
  379/383 assembler test/rnde-intsrc              OK       0.01 s 
  380/383 assembler test/rndz                     OK       0.01 s 
  381/383 assembler test/lzd                      OK       0.01 s 
  382/383 assembler test/not                      OK       0.01 s 
  383/383 assembler test/immediate                OK       0.01 s 
  
  Ok:                  376
  Expected Fail:         4
  Fail:                  3
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1685697255:step_script
  section_start:1685697255:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1685697257:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/897380
