Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Tue, 28 Nov 2023 22:01:37 -0000
Message-ID: <170120889711.8218.10501809104831756697@emeril.freedesktop.org>
References: <20231128174046.2497024-1-jeevan.b@intel.com>
In-Reply-To: <20231128174046.2497024-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_FBC_support_to_PSR/PSR2_tests_=28rev7=29?=
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

Series: Add FBC support to PSR/PSR2 tests (rev7)
URL   : https://patchwork.freedesktop.org/series/126689/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1044574 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52117714):
  Warning: Missing documentation for igt@kms_psr@psr-sprite-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr-sprite-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-plane-move
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-plane-onoff
  Warning: Missing documentation for igt@kms_psr@psr2-primary-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-primary-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-plane-move
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-plane-onoff
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1701208822:step_script
  section_start:1701208822:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701208822:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52117709):
  Warning: Missing documentation for igt@kms_psr@psr-sprite-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr-sprite-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-plane-move
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-plane-onoff
  Warning: Missing documentation for igt@kms_psr@psr2-primary-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-primary-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-plane-move
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-plane-onoff
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1701208832:step_script
  section_start:1701208832:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701208833:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52117713):
  Warning: Missing documentation for igt@kms_psr@psr-sprite-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr-sprite-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-plane-move
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-plane-onoff
  Warning: Missing documentation for igt@kms_psr@psr2-primary-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-primary-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-plane-move
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-plane-onoff
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1701208833:step_script
  section_start:1701208833:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701208833:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52117712):
  Warning: Missing documentation for igt@kms_psr@psr-sprite-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr-sprite-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-plane-move
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-plane-onoff
  Warning: Missing documentation for igt@kms_psr@psr2-primary-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-primary-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-plane-move
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-plane-onoff
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1701208822:step_script
  section_start:1701208822:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701208823:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52117710):
  Warning: Missing documentation for igt@kms_psr@psr-sprite-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr-sprite-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-plane-move
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-plane-onoff
  Warning: Missing documentation for igt@kms_psr@psr2-primary-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-primary-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-plane-move
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-plane-onoff
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1701208823:step_script
  section_start:1701208823:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701208824:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52117711):
  Warning: Missing documentation for igt@kms_psr@psr-sprite-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr-sprite-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-plane-move
  Warning: Missing documentation for igt@kms_psr@psr2-cursor-plane-onoff
  Warning: Missing documentation for igt@kms_psr@psr2-primary-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-primary-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-mmap-cpu
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-mmap-gtt
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-plane-move
  Warning: Missing documentation for igt@kms_psr@psr2-sprite-plane-onoff
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1701208823:step_script
  section_start:1701208823:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701208824:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1044574
