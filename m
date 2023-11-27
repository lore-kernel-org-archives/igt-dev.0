Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Mon, 27 Nov 2023 07:35:26 -0000
Message-ID: <170107052648.3003.9745478821892704953@emeril.freedesktop.org>
References: <20231127055526.2351645-1-jeevan.b@intel.com>
In-Reply-To: <20231127055526.2351645-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_FBC_support_to_PSR/PSR2_tests_=28rev5=29?=
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

Series: Add FBC support to PSR/PSR2 tests (rev5)
URL   : https://patchwork.freedesktop.org/series/126689/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1043227 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52046443):
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_blt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_mmap_cpu
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_mmap_gtt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_page_flip
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_render
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_blt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_mmap_cpu
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_mmap_gtt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_plane_move
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_plane_onoff
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_render
  Warning: Missing documentation for igt@kms_psr@fbc_psr_suspend
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1701070361:step_script
  section_start:1701070361:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701070362:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52046447):
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 4d9b1b43 as detached HEAD (ref is intel/IGTPW_10271)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1701070325:get_sources
  section_start:1701070325:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-4d9b1b43929e1cd15e8be9cb6f27bada2d9a52ea with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips@sha256:c829c44880da4782b7a72626c259ac6904b4bd5f08601e66b3be889ca1c0cf79 ...
  section_end:1701070327:step_script
  section_start:1701070327:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701070328:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448: image not known (docker.go:570:0s)

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52046438):
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_blt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_mmap_cpu
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_mmap_gtt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_page_flip
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_render
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_blt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_mmap_cpu
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_mmap_gtt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_plane_move
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_plane_onoff
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_render
  Warning: Missing documentation for igt@kms_psr@fbc_psr_suspend
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1701070360:step_script
  section_start:1701070360:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701070360:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52046442):
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_blt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_mmap_cpu
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_mmap_gtt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_page_flip
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_render
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_blt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_mmap_cpu
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_mmap_gtt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_plane_move
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_plane_onoff
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_render
  Warning: Missing documentation for igt@kms_psr@fbc_psr_suspend
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1701070409:step_script
  section_start:1701070409:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701070410:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52046441):
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_blt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_mmap_cpu
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_mmap_gtt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_page_flip
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_render
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_blt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_mmap_cpu
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_mmap_gtt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_plane_move
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_plane_onoff
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_render
  Warning: Missing documentation for igt@kms_psr@fbc_psr_suspend
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1701070359:step_script
  section_start:1701070359:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701070360:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52046439):
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_blt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_mmap_cpu
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_mmap_gtt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_page_flip
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_render
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_blt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_mmap_cpu
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_mmap_gtt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_plane_move
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_plane_onoff
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_render
  Warning: Missing documentation for igt@kms_psr@fbc_psr_suspend
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1701070391:step_script
  section_start:1701070391:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701070391:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/52046440):
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_blt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_mmap_cpu
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_mmap_gtt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_page_flip
  Warning: Missing documentation for igt@kms_psr@fbc_psr_primary_render
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_blt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_mmap_cpu
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_mmap_gtt
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_plane_move
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_plane_onoff
  Warning: Missing documentation for igt@kms_psr@fbc_psr_sprite_render
  Warning: Missing documentation for igt@kms_psr@fbc_psr_suspend
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1701070359:step_script
  section_start:1701070359:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701070359:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1043227
