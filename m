Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Oct 2023 01:34:29 -0000
Message-ID: <169811126946.18361.14858650631395536441@emeril.freedesktop.org>
References: <20231020133413.135395-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20231020133413.135395-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_f?=
 =?utf-8?q?ix_igt=5Frunner_job_list_handler?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: fix igt_runner job list handler
URL   : https://patchwork.freedesktop.org/series/125402/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1017156 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50664071):
  374/378 assembler test/rnde-intsrc              OK       0.02 s 
  375/378 assembler test/rndz                     OK       0.02 s 
  376/378 assembler test/lzd                      OK       0.02 s 
  377/378 assembler test/not                      OK       0.02 s 
  378/378 assembler test/immediate                OK       0.02 s 
  
  Ok:                  373
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1698111090:step_script
  section_start:1698111090:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698111090:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/50664072):
  374/378 assembler test/rnde-intsrc              OK       0.02 s 
  375/378 assembler test/rndz                     OK       0.03 s 
  376/378 assembler test/lzd                      OK       0.01 s 
  377/378 assembler test/not                      OK       0.01 s 
  378/378 assembler test/immediate                OK       0.02 s 
  
  Ok:                  373
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1698111131:step_script
  section_start:1698111131:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698111132:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1017156

