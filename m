Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 15 Feb 2022 14:22:38 -0000
Message-ID: <164493495897.15372.16622371851033768444@emeril.freedesktop.org>
References: <20220214150009.26815-1-jeevan.b@intel.com>
In-Reply-To: <20220214150009.26815-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_D?=
 =?utf-8?q?G2_platform_definition_and_Tile_4_plane_format_support_=28rev2?=
 =?utf-8?q?=29?=
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
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: DG2 platform definition and Tile 4 plane format support (rev2)
URL   : https://patchwork.freedesktop.org/series/99784/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/509777 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/18835020):
  ../lib/intel_device_info.c:522:2:
    INTEL_DG2_IDS(&intel_dg2_info),
    {
  ../lib/intel_device_info.c:428:57: error: missing braces around initializer [-Werror=missing-braces]
   static const struct pci_id_match intel_device_match[] = {
                                                           ^
  ../lib/intel_device_info.c:522:2:
    INTEL_DG2_IDS(&intel_dg2_info),
    {
  ../lib/intel_device_info.c:525:1:
   };
   }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1644934692:step_script
  section_start:1644934692:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1644934693:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/18835023):
    INTEL_DG2_IDS(&intel_dg2_info),
    {
  ../lib/intel_device_info.c:428:57: error: missing braces around initializer [-Werror=missing-braces]
   static const struct pci_id_match intel_device_match[] = {
                                                           ^
  ../lib/intel_device_info.c:522:2:
    INTEL_DG2_IDS(&intel_dg2_info),
    {
  ../lib/intel_device_info.c:525:1:
   };
   }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1644934671:step_script
  section_start:1644934671:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1644934672:cleanup_file_variables
  ERROR: Failed to cleanup volumes
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/18835022):
  ../lib/intel_device_info.c:522:2:
    INTEL_DG2_IDS(&intel_dg2_info),
    {
  ../lib/intel_device_info.c:428:57: error: missing braces around initializer [-Werror=missing-braces]
   static const struct pci_id_match intel_device_match[] = {
                                                           ^
  ../lib/intel_device_info.c:522:2:
    INTEL_DG2_IDS(&intel_dg2_info),
    {
  ../lib/intel_device_info.c:525:1:
   };
   }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1644934678:step_script
  section_start:1644934678:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1644934679:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/18835024):
  ../lib/intel_device_info.c:522:2:
    INTEL_DG2_IDS(&intel_dg2_info),
    {
  ../lib/intel_device_info.c:428:57: error: missing braces around initializer [-Werror=missing-braces]
   static const struct pci_id_match intel_device_match[] = {
                                                           ^
  ../lib/intel_device_info.c:522:2:
    INTEL_DG2_IDS(&intel_dg2_info),
    {
  ../lib/intel_device_info.c:525:1:
   };
   }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1644934726:step_script
  section_start:1644934726:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1644934727:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/18835021):
    INTEL_DG2_IDS(&intel_dg2_info),
    {
  ../lib/intel_device_info.c:428:57: error: missing braces around initializer [-Werror=missing-braces]
   static const struct pci_id_match intel_device_match[] = {
                                                           ^
  ../lib/intel_device_info.c:522:2:
    INTEL_DG2_IDS(&intel_dg2_info),
    {
  ../lib/intel_device_info.c:525:1:
   };
   }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1644934653:step_script
  section_start:1644934653:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1644934653:cleanup_file_variables
  ERROR: Failed to cleanup volumes
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/18835015):
  ......
    522 |  INTEL_DG2_IDS(&intel_dg2_info),
        |  {
  ../lib/intel_device_info.c:428:57: error: missing braces around initializer [-Werror=missing-braces]
    428 | static const struct pci_id_match intel_device_match[] = {
        |                                                         ^
  ......
    522 |  INTEL_DG2_IDS(&intel_dg2_info),
        |  {
  ......
    525 | };
        | }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1644934610:step_script
  section_start:1644934610:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1644934610:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/18835019):
  #define PCI_MATCH_ANY  (~0U)
                         ^~~~~
  ../lib/i915_pciids.h:39:10: note: expanded from macro 'INTEL_VGA_DEVICE'
          0x8086, id,                             \
                  ^~
  ../lib/intel_device_info.c:522:2: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
          INTEL_DG2_IDS(&intel_dg2_info),
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          {
  ../lib/intel_device_info.c:522:2: error: initializer element is not a compile-time constant
          INTEL_DG2_IDS(&intel_dg2_info),
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  1 warning and 3 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1644934664:step_script
  section_start:1644934664:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1644934666:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/18835018):
    522 |  INTEL_DG2_IDS(&intel_dg2_info),
        |  {
  ../lib/intel_device_info.c:428:57: error: missing braces around initializer [-Werror=missing-braces]
    428 | static const struct pci_id_match intel_device_match[] = {
        |                                                         ^
  ......
    522 |  INTEL_DG2_IDS(&intel_dg2_info),
        |  {
  ......
    525 | };
        | }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1644934636:step_script
  section_start:1644934636:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1644934637:cleanup_file_variables
  ERROR: Failed to cleanup volumes
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/18835016):
    522 |  INTEL_DG2_IDS(&intel_dg2_info),
        |  {
  ../lib/intel_device_info.c:428:57: error: missing braces around initializer [-Werror=missing-braces]
    428 | static const struct pci_id_match intel_device_match[] = {
        |                                                         ^
  ......
    522 |  INTEL_DG2_IDS(&intel_dg2_info),
        |  {
  ......
    525 | };
        | }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1644934615:step_script
  section_start:1644934615:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1644934615:cleanup_file_variables
  ERROR: Failed to cleanup volumes
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/18835017):
  ......
    522 |  INTEL_DG2_IDS(&intel_dg2_info),
        |  {
  ../lib/intel_device_info.c:428:57: error: missing braces around initializer [-Werror=missing-braces]
    428 | static const struct pci_id_match intel_device_match[] = {
        |                                                         ^
  ......
    522 |  INTEL_DG2_IDS(&intel_dg2_info),
        |  {
  ......
    525 | };
        | }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1644934645:step_script
  section_start:1644934645:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1644934645:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/509777
