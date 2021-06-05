Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 05 Jun 2021 18:57:11 -0000
Message-ID: <162291943149.31068.1655249218326339400@emeril.freedesktop.org>
References: <20210604203927.494340-1-matthew.d.roper@intel.com>
In-Reply-To: <20210604203927.494340-1-matthew.d.roper@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_S?=
 =?utf-8?q?plit_display/graphics_versions_and_add_ADL-P_=28rev3=29?=
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

Series: Split display/graphics versions and add ADL-P (rev3)
URL   : https://patchwork.freedesktop.org/series/91040/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/333029 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10495888):
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
  section_end:1622919258:step_script
  section_start:1622919258:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622919260:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10495891):
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
  section_end:1622919283:step_script
  section_start:1622919283:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622919284:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10495890):
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
  section_end:1622919264:step_script
  section_start:1622919264:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622919265:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10495892):
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
  section_end:1622919259:step_script
  section_start:1622919259:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622919261:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10495889):
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
  section_end:1622919263:step_script
  section_start:1622919263:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622919266:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10495883):
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
  section_end:1622919285:step_script
  section_start:1622919285:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622919286:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10495887):
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
  section_end:1622919275:step_script
  section_start:1622919275:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622919276:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10495886):
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
  section_end:1622919279:step_script
  section_start:1622919279:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622919284:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10495884):
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
  section_end:1622919266:step_script
  section_start:1622919266:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622919267:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/10495885):
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
  section_end:1622919268:step_script
  section_start:1622919268:cleanup_file_variables
  Cleaning up file based variables
  section_end:1622919269:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/333029
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
