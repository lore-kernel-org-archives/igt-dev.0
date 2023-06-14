Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wu, Hersen" <hersenxs.wu@amd.com>
Date: Wed, 14 Jun 2023 19:26:52 -0000
Message-ID: <168677081237.17429.13338637636542331961@emeril.freedesktop.org>
References: <20230425214710.179129-1-hersenxs.wu@amd.com>
In-Reply-To: <20230425214710.179129-1-hersenxs.wu@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/amdgpu/amd=5Flink=5Fsettings=3A_use_mode_640x480_for_link_?=
 =?utf-8?q?configuration_test_=28rev5=29?=
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

Series: tests/amdgpu/amd_link_settings: use mode 640x480 for link configuration test (rev5)
URL   : https://patchwork.freedesktop.org/series/116892/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/909212 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43779885):
  380/384 assembler test/rnde-intsrc              OK       0.01 s 
  381/384 assembler test/rndz                     OK       0.01 s 
  382/384 assembler test/lzd                      OK       0.01 s 
  383/384 assembler test/not                      OK       0.01 s 
  384/384 assembler test/immediate                OK       0.01 s 
  
  Ok:                  379
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1686770759:step_script
  section_start:1686770759:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686770760:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/43779886):
  380/384 assembler test/rnde-intsrc              OK       0.01 s 
  381/384 assembler test/rndz                     OK       0.01 s 
  382/384 assembler test/lzd                      OK       0.01 s 
  383/384 assembler test/not                      OK       0.01 s 
  384/384 assembler test/immediate                OK       0.01 s 
  
  Ok:                  379
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1686770759:step_script
  section_start:1686770759:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686770760:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/909212
