Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 05 Jun 2021 05:14:45 -0000
Message-ID: <162287008507.31067.6329320720273496888@emeril.freedesktop.org>
References: <20210604203927.494340-1-matthew.d.roper@intel.com>
In-Reply-To: <20210604203927.494340-1-matthew.d.roper@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_S?=
 =?utf-8?q?plit_display/graphics_versions_and_add_ADL-P_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Split display/graphics versions and add ADL-P (rev2)
URL   : https://patchwork.freedesktop.org/series/91040/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/332888 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10492651):
  ../lib/intel_device_info.c:497:2:
    INTEL_ADLP_IDS(&intel_alderlake_p_info),
    {
  ../lib/intel_device_info.c:406:57: error: missing braces around initializer [-Werror=missing-braces]
   static const struct pci_id_match intel_device_match[] = {
                                                           ^
  ../lib/intel_device_info.c:497:2:
    INTEL_ADLP_IDS(&intel_alderlake_p_info),
    {
  ../lib/intel_device_info.c:500:1:
   };
   }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1622870024:step_script
  section_start:1622870024:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622870025:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10492654):
  ../lib/intel_device_info.c:497:2:
    INTEL_ADLP_IDS(&intel_alderlake_p_info),
    {
  ../lib/intel_device_info.c:406:57: error: missing braces around initializer [-Werror=missing-braces]
   static const struct pci_id_match intel_device_match[] = {
                                                           ^
  ../lib/intel_device_info.c:497:2:
    INTEL_ADLP_IDS(&intel_alderlake_p_info),
    {
  ../lib/intel_device_info.c:500:1:
   };
   }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1622870028:step_script
  section_start:1622870028:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622870029:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10492653):
  ../lib/intel_device_info.c:497:2:
    INTEL_ADLP_IDS(&intel_alderlake_p_info),
    {
  ../lib/intel_device_info.c:406:57: error: missing braces around initializer [-Werror=missing-braces]
   static const struct pci_id_match intel_device_match[] = {
                                                           ^
  ../lib/intel_device_info.c:497:2:
    INTEL_ADLP_IDS(&intel_alderlake_p_info),
    {
  ../lib/intel_device_info.c:500:1:
   };
   }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1622870025:step_script
  section_start:1622870025:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622870026:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10492655):
  ../lib/intel_device_info.c:497:2:
    INTEL_ADLP_IDS(&intel_alderlake_p_info),
    {
  ../lib/intel_device_info.c:406:57: error: missing braces around initializer [-Werror=missing-braces]
   static const struct pci_id_match intel_device_match[] = {
                                                           ^
  ../lib/intel_device_info.c:497:2:
    INTEL_ADLP_IDS(&intel_alderlake_p_info),
    {
  ../lib/intel_device_info.c:500:1:
   };
   }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1622870029:step_script
  section_start:1622870029:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622870030:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10492652):
  ../lib/intel_device_info.c:497:2:
    INTEL_ADLP_IDS(&intel_alderlake_p_info),
    {
  ../lib/intel_device_info.c:406:57: error: missing braces around initializer [-Werror=missing-braces]
   static const struct pci_id_match intel_device_match[] = {
                                                           ^
  ../lib/intel_device_info.c:497:2:
    INTEL_ADLP_IDS(&intel_alderlake_p_info),
    {
  ../lib/intel_device_info.c:500:1:
   };
   }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1622870028:step_script
  section_start:1622870028:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622870029:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10492646):
  ......
    497 |  INTEL_ADLP_IDS(&intel_alderlake_p_info),
        |  {
  ../lib/intel_device_info.c:406:57: error: missing braces around initializer [-Werror=missing-braces]
    406 | static const struct pci_id_match intel_device_match[] = {
        |                                                         ^
  ......
    497 |  INTEL_ADLP_IDS(&intel_alderlake_p_info),
        |  {
  ......
    500 | };
        | }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1622870026:step_script
  section_start:1622870026:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622870028:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10492650):
  #define PCI_MATCH_ANY  (~0U)
                         ^~~~~
  ../lib/i915_pciids.h:39:10: note: expanded from macro 'INTEL_VGA_DEVICE'
          0x8086, id,                             \
                  ^~
  ../lib/intel_device_info.c:497:2: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
          INTEL_ADLP_IDS(&intel_alderlake_p_info),
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          {
  ../lib/intel_device_info.c:497:2: error: initializer element is not a compile-time constant
          INTEL_ADLP_IDS(&intel_alderlake_p_info),
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  1 warning and 3 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1622870035:step_script
  section_start:1622870035:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622870036:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10492649):
  ......
    497 |  INTEL_ADLP_IDS(&intel_alderlake_p_info),
        |  {
  ../lib/intel_device_info.c:406:57: error: missing braces around initializer [-Werror=missing-braces]
    406 | static const struct pci_id_match intel_device_match[] = {
        |                                                         ^
  ......
    497 |  INTEL_ADLP_IDS(&intel_alderlake_p_info),
        |  {
  ......
    500 | };
        | }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1622870029:step_script
  section_start:1622870029:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622870030:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10492647):
  ......
    497 |  INTEL_ADLP_IDS(&intel_alderlake_p_info),
        |  {
  ../lib/intel_device_info.c:406:57: error: missing braces around initializer [-Werror=missing-braces]
    406 | static const struct pci_id_match intel_device_match[] = {
        |                                                         ^
  ......
    497 |  INTEL_ADLP_IDS(&intel_alderlake_p_info),
        |  {
  ......
    500 | };
        | }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1622870029:step_script
  section_start:1622870029:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622870030:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10492648):
  ......
    497 |  INTEL_ADLP_IDS(&intel_alderlake_p_info),
        |  {
  ../lib/intel_device_info.c:406:57: error: missing braces around initializer [-Werror=missing-braces]
    406 | static const struct pci_id_match intel_device_match[] = {
        |                                                         ^
  ......
    497 |  INTEL_ADLP_IDS(&intel_alderlake_p_info),
        |  {
  ......
    500 | };
        | }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1622870028:step_script
  section_start:1622870028:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622870029:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/332888
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
