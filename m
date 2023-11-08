Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Date: Wed, 08 Nov 2023 06:48:24 -0000
Message-ID: <169942610457.24275.12916393649155948485@emeril.freedesktop.org>
References: <20231108062902.390248-1-vignesh.raman@collabora.com>
In-Reply-To: <20231108062902.390248-1-vignesh.raman@collabora.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?ib/igt=5Fkms=3A_Fix_memory_corruption_=28rev3=29?=
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

Series: lib/igt_kms: Fix memory corruption (rev3)
URL   : https://patchwork.freedesktop.org/series/125599/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1029126 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51327672):
  Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-yf-tiled-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-yf-tiled-ccs
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699425801:step_script
  section_start:1699425801:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699425802:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51327667):
  Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-yf-tiled-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-yf-tiled-ccs
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699425811:step_script
  section_start:1699425811:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699425811:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51327671):
  Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-yf-tiled-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-yf-tiled-ccs
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699425829:step_script
  section_start:1699425829:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699425831:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51327670):
  Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-yf-tiled-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-yf-tiled-ccs
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699425804:step_script
  section_start:1699425804:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699425805:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51327668):
  Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-yf-tiled-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-yf-tiled-ccs
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699425812:step_script
  section_start:1699425812:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699425812:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/51327669):
  Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-yf-tiled-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-mc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-rc-ccs
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-rc-ccs-cc
  Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-yf-tiled-ccs
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1699425809:step_script
  section_start:1699425809:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699425810:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1029126
