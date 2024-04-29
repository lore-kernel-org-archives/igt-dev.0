Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F2DC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 16:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F87C10EE70;
	Mon, 29 Apr 2024 16:21:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1AE10F1B5;
 Mon, 29 Apr 2024 16:21:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/gpgpu=3A_add_shader?=
 =?utf-8?q?_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 29 Apr 2024 16:21:33 -0000
Message-ID: <171440769324.1756580.3365409596428703367@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com>
In-Reply-To: <20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
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

== Series Details ==

Series: lib/gpgpu: add shader support
URL   : https://patchwork.freedesktop.org/series/133020/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1166154 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58165334):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1516] Generating version.h with a custom command.
  [2/1512] Linking static target lib/libigt-amdgpu_amd_mmd_shared_c.a.
  [3/1512] Linking static target lib/libigt-igt_frame_c.a.
  [4/1512] Linking static target lib/libigt-igt_audio_c.a.
  [5/1512] Linking static target lib/libigt-igt_alsa_c.a.
  [6/1512] Linking static target lib/libigt-igt_chamelium_c.a.
  [7/1512] Linking static target lib/libigt-igt_chamelium_stream_c.a.
  [8/1512] Generating iga64_generated_codes.c with a custom command.
  FAILED: lib/iga64_generated_codes.c 
  ./generate_iga64_codes -o lib/iga64_generated_codes.c -i ../lib/iga64_generated_codes.c lib/libigt-gpgpu_shader_c.a
  /bin/sh: 1: ./generate_iga64_codes: not found
  ninja: build stopped: subcommand failed.
  section_end:1714407656:step_script
  section_start:1714407656:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1714407657:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58165337):
  ninja: Entering directory `build'
  [1/1153] Generating version.h with a custom command.
  [2/1149] Linking static target lib/libigt-igt_kms_c.a.
  [3/1149] Linking static target lib/libigt-amdgpu_amd_ip_blocks_c.a.
  [4/1149] Linking static target lib/libigt-amdgpu_amd_gfx_c.a.
  [5/1149] Linking static target lib/libigt-amdgpu_amd_pci_unplug_c.a.
  [6/1149] Linking static target lib/libigt-igt_frame_c.a.
  [7/1149] Linking static target lib/libigt-amdgpu_amd_cp_dma_c.a.
  [8/1149] Linking static target lib/libigt-amdgpu_amd_mmd_shared_c.a.
  [9/1149] Generating iga64_generated_codes.c with a custom command.
  FAILED: lib/iga64_generated_codes.c 
  ./generate_iga64_codes -o lib/iga64_generated_codes.c -i ../lib/iga64_generated_codes.c lib/libigt-gpgpu_shader_c.a
  /bin/sh: 1: ./generate_iga64_codes: not found
  ninja: build stopped: subcommand failed.
  section_end:1714407669:step_script
  section_start:1714407669:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1714407669:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58165336):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1152] Generating version.h with a custom command.
  [2/1148] Linking static target lib/libigt-amdgpu_amd_ip_blocks_c.a.
  [3/1148] Linking static target lib/libigt-amdgpu_amd_pci_unplug_c.a.
  [4/1148] Linking static target lib/libigt-amdgpu_amd_dispatch_helpers_c.a.
  [5/1148] Linking static target lib/libigt-igt_frame_c.a.
  [6/1148] Linking static target lib/libigt-amdgpu_amd_cp_dma_c.a.
  [7/1148] Linking static target lib/libigt-amdgpu_amd_mmd_shared_c.a.
  [8/1148] Generating iga64_generated_codes.c with a custom command.
  FAILED: lib/iga64_generated_codes.c 
  ./generate_iga64_codes -o lib/iga64_generated_codes.c -i ../lib/iga64_generated_codes.c lib/libigt-gpgpu_shader_c.a
  /bin/sh: 1: ./generate_iga64_codes: not found
  ninja: build stopped: subcommand failed.
  section_end:1714407642:step_script
  section_start:1714407642:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1714407643:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58165338):
  ninja: Entering directory `build'
  [1/1149] Generating version.h with a custom command.
  [2/1145] Linking static target lib/libigt-amdgpu_amd_ip_blocks_c.a.
  [3/1145] Linking static target lib/libigt-amdgpu_amd_pci_unplug_c.a.
  [4/1145] Linking static target lib/libigt-igt_frame_c.a.
  [5/1145] Linking static target lib/libigt-igt_audio_c.a.
  [6/1145] Linking static target lib/libigt-amdgpu_amd_cp_dma_c.a.
  [7/1145] Linking static target lib/libigt-amdgpu_amd_mmd_shared_c.a.
  [8/1145] Linking static target lib/libigt-igt_alsa_c.a.
  [9/1145] Generating iga64_generated_codes.c with a custom command.
  FAILED: lib/iga64_generated_codes.c 
  ./generate_iga64_codes -o lib/iga64_generated_codes.c -i ../lib/iga64_generated_codes.c lib/libigt-gpgpu_shader_c.a
  /bin/sh: 1: ./generate_iga64_codes: not found
  ninja: build stopped: subcommand failed.
  section_end:1714407651:step_script
  section_start:1714407651:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1714407652:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58165335):
  ninja: Entering directory `build'
  [1/331] Generating version.h with a custom command.
  [2/327] Linking static target lib/libigt-igt_kms_c.a.
  [3/327] Linking static target lib/libigt-igt_fb_c.a.
  [4/327] Linking static target lib/libigt-igt_amd_c.a.
  [5/327] Linking static target lib/libigt-igt_msm_c.a.
  [6/327] Linking static target lib/libigt-xe_xe_gt_c.a.
  [7/327] Linking static target lib/libigt-xe_xe_mmio_c.a.
  [8/327] Linking static target lib/libigt-xe_xe_util_c.a.
  [9/327] Generating iga64_generated_codes.c with a custom command.
  FAILED: lib/iga64_generated_codes.c 
  ./generate_iga64_codes -o lib/iga64_generated_codes.c -i ../lib/iga64_generated_codes.c lib/libigt-gpgpu_shader_c.a
  /bin/sh: 1: ./generate_iga64_codes: not found
  ninja: build stopped: subcommand failed.
  section_end:1714407633:step_script
  section_start:1714407633:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1714407634:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58165329):
  ninja: Entering directory `build'
  [1/1527] Generating version.h with a custom command.
  [2/1523] Linking static target lib/libigt-amdgpu_amd_pci_unplug_c.a.
  [3/1523] Linking static target lib/libigt-amdgpu_amd_mmd_shared_c.a.
  [4/1523] Linking static target lib/libigt-amdgpu_amd_dispatch_c.a.
  [5/1523] Linking static target lib/libigt-igt_frame_c.a.
  [6/1523] Linking static target lib/libigt-igt_audio_c.a.
  [7/1523] Linking static target lib/libigt-igt_chamelium_c.a.
  [8/1523] Linking static target lib/libigt-monitor_edids_monitor_edids_helper_c.a.
  [9/1523] Generating iga64_generated_codes.c with a custom command.
  FAILED: lib/iga64_generated_codes.c 
  ./generate_iga64_codes -o lib/iga64_generated_codes.c -i ../lib/iga64_generated_codes.c lib/libigt-gpgpu_shader_c.a
  /bin/sh: ./generate_iga64_codes: No such file or directory
  ninja: build stopped: subcommand failed.
  section_end:1714407644:step_script
  section_start:1714407644:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1714407645:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58165333):
  #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof(arr[0]))
                                 ^~~~~
  ../lib/gpgpu_shader.c:312:3: error: expected ';' after expression
          )ASM", 2, y_offset, 3, value, value, value, value);
           ^
           ;
  ../lib/gpgpu_shader.c:312:6: warning: missing terminating '"' character [-Winvalid-pp-token]
          )ASM", 2, y_offset, 3, value, value, value, value);
              ^
  ../lib/gpgpu_shader.c:312:3: error: use of undeclared identifier 'ASM'
          )ASM", 2, y_offset, 3, value, value, value, value);
           ^
  6 warnings and 12 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1714407645:step_script
  section_start:1714407645:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1714407646:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58165332):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1389] Generating version.h with a custom command.
  [2/1385] Linking static target lib/libigt-igt_kms_c.a.
  [3/1385] Linking static target lib/libigt-xe_xe_spin_c.a.
  [4/1385] Linking static target lib/libigt-igt_audio_c.a.
  [5/1385] Linking static target lib/libigt-igt_alsa_c.a.
  [6/1385] Linking static target lib/libigt-igt_chamelium_c.a.
  [7/1385] Linking static target lib/libigt-igt_chamelium_stream_c.a.
  [8/1385] Generating iga64_generated_codes.c with a custom command.
  FAILED: lib/iga64_generated_codes.c 
  ./generate_iga64_codes -o lib/iga64_generated_codes.c -i ../lib/iga64_generated_codes.c lib/libigt-gpgpu_shader_c.a
  /bin/sh: ./generate_iga64_codes: No such file or directory
  ninja: build stopped: subcommand failed.
  section_end:1714407659:step_script
  section_start:1714407659:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1714407660:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58165330):
  ninja: Entering directory `build'
  [1/1525] Generating version.h with a custom command.
  [2/1521] Linking static target lib/libigt-monitor_edids_monitor_edids_helper_c.a.
  [3/1521] Linking static target lib/libigt-amdgpu_amd_pci_unplug_c.a.
  [4/1521] Linking static target lib/libigt-amdgpu_amd_mmd_shared_c.a.
  [5/1521] Linking static target lib/libigt-amdgpu_amd_dispatch_c.a.
  [6/1521] Linking static target lib/libigt-igt_audio_c.a.
  [7/1521] Linking static target lib/libigt-igt_alsa_c.a.
  [8/1521] Linking static target lib/libigt-igt_chamelium_stream_c.a.
  [9/1521] Generating iga64_generated_codes.c with a custom command.
  FAILED: lib/iga64_generated_codes.c 
  ./generate_iga64_codes -o lib/iga64_generated_codes.c -i ../lib/iga64_generated_codes.c lib/libigt-gpgpu_shader_c.a
  /bin/sh: ./generate_iga64_codes: No such file or directory
  ninja: build stopped: subcommand failed.
  section_end:1714407667:step_script
  section_start:1714407667:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1714407667:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58165331):
  Checking for function "outb" : YES
  Checking if "cpuid.h" links: YES
  Header <unistd.h> has symbol "gettid": YES
  Checking whether type "struct sysinfo" has member "totalram" : YES
  Checking for function "memfd_create" : YES
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  lib/meson.build:236: WARNING: Identifier 'in' will become a reserved keyword in a future release. Please rename it.
  
  lib/meson.build:236:9: ERROR:  Expecting eol got id.
      if f in iga64_assembly_sources
           ^
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1714407632:step_script
  section_start:1714407632:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1714407633:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1166154
