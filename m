Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279BCCA5FA2
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 17:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D4110E967;
	Mon, 28 Sep 2026 17:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/g7VkoD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF4510E936
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 17:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790617472; x=1822153472;
 h=from:date:message-id:subject:to:cc;
 bh=9tnF583tDrY9xYV20lLHgZssFoT2soKkaeEmR+nDKPg=;
 b=Q/g7VkoD/ZNiKf04QI9rOpdPO4b4NslVjTjcvZEGf2DbxxWpXsRNvg6o
 S4eF6AQgtXSU00mF7B+34a0Puf8C5ps06VsosrrFpyU2Y28TFPGfYZ7Jy
 iMTf/sK3JU5QQoP3DZB2Iv09M5gplRYLzarnF2LBOIyEzD+XFDsLkeTp9
 +0pKhdXZnE/Maz7p5yvZRSEtyTMO32ZJ6RPnEXvtVM/CTTatp+QrtNOjU
 kaNzc4Tyt+LIEHssv3ngcfvYTmYLhppVPr83yDr1oYytygwx0MVfTXqHB
 69CwrOhVXAXU2/VMJakcx4chEAkJSb0aMnne7KLELEbkwPcSA6vawnff/ A==;
X-CSE-ConnectionGUID: IOG6qZjGQWeZec4oiUHoCw==
X-CSE-MsgGUID: 2cnYco2tQK2+5k3RbJrXSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90541278"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="90541278"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 10:44:32 -0700
X-CSE-ConnectionGUID: jQa67P9nTGGjojy9mBcAqQ==
X-CSE-MsgGUID: SwlX5PfSSrStonTxBFrS8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="304623100"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.81])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 10:44:30 -0700
From: kamil.konieczny@linux.intel.com
Date: Mon, 28 Sep 2026 19:44:28 +0200
Message-ID: <4ff8626e42a8919897421a948437f2b8.kamil.konieczny@linux.intel.com>
Subject: [ANNOUNCE] igt-gpu-tools 2.6
To: xorg-announce@lists.x.org
Cc: xorg@lists.x.org, igt-dev@lists.freedesktop.org
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

A new igt-gpu-tools release is available with the following changes:

Release 2.6 (2026-09-28)
- ------------------------

General changes:

- - Removed xe_eudebug from meson. (Dominik Karol Piątkowski)

Devops changes:

- - Bumped Debian version to bookworm and Fedora to latest 44 (Kamil Konieczny)

Runner changes:

- - New igt_runner option --save-results-after-each-test. (Kamil Konieczny)

Library changes:

- - Continued refactor of display library code. (Jani Nikula)

- - New platform filtering helpers for skipping tests without modifying test
  source code. (Vitaly Prosyak)

- - Improved setting up the render and compute pipelines for Intel GPUs. (Jan
  Maslak)

Test changes:

- - Improved display testing during suspend. (Michał Grzelak)

- - Added subtest for BACKGROUND_COLOR crtc property. (Maarten Lankhorst)

- - New test for HDMI TMDS audio bandwidth constraints on Intel GPUs. (Swati
  Sharma)

- - Added subtest for Content Match Refresh Rate (CMRR) across both fixed and
  video timing display modes. (Naladala Ramanaidu)

- - New Xe page offline tests on Intel CRI GPUs. (Tejas Upadhyay)

- - Added test coverage for FIXED_MATRIX colorops for CSC. (Harry Wentland)

- - Added GT reset submit stress subtest. (Nishit Sharma)

- - New tests for SRIOV GGTT accesses by PF and VFs on Xe. (Piotr Piórkowski,
  Marcin Bernatowicz and Lukasz Laguna).

- - Added FIXED_MATRIX colorop subtests. (Swati Sharma)

- - Added UHBR-to-HBR fallback subtest for UHBR-capable DP connectors.(Sowmiya S)

- - Improved KMS tests on MediaTek. (Jason-JH Lin)

- - Added user fence no signal subtest for Intel Xe driver. (Priyanka Dandamudi)

- - Improved userptr stress test for amdgpu. (Vitaly Prosyak)

- - Improved Xe OA testing. (Umesh Nerlige Ramappa)

- - Improved FBC handling in display tests. (Vinod Govindapillai)

- - Improved amdgpu reset tests. (Jesse Zhang)

- - Added subtest to validate YUV420 with DC3CO. (Jeevan B)

- - Ported dmabuf tests to KUnit. (Krzysztof Niemiec)

- - Added display feature discovery subtests for HDR, VRR and DSC. (Swati Sharma)

- - Added Panthor sparse VM_BIND tests. (Adrián Larumbe)

- - Extended BO tests to cover GEM_INFO and cache flags on MSM. (Jitta Vignan)

- - New tests for PERFCNTR_CONFIG ioctl on MSM GPUs. (Rob Clark)

- - New tests for PowerVR Imagination GPUs. (Donald Robson, Matt Coster,
  Robert Mazur, Frank Binns and Sarah Walker)

Tools changes:

- - Fixed gputop on Panthor. (Deborah Brouwer)

- - Renamed AMD tool to igt_hdmi_compliance and improved it to work on Intel GPUs
  (Swati Sharma)

- - Improvements in amd_hdmi_compliance. (Fangzhi Zuo and Mark Broadworth)

- - Decreased number of dynamically linked libraries in many tools. (Sebastian
  Brzezinka)


And many other bug fixes, improvements, cleanups and new tests.


Aditya Chauhan (5):
      intel-ci: Update PTL Core blocklist
      intel-ci: Add xe.nvl.core.blocklist to config.json
      intel-ci: Move hotunplug subtest to the end of xe.fastfeedback testlist
      intel-ci: Update Core Blocklists for LNL, PTL & NVL
      intel-ci: Update CRI Core blocklist

Adrián Larumbe (3):
      drm-uapi/panthor: sync with kernel 12cf826bf1dd
      panthor: Add IGT library helper for Panthor sparse mappings
      tests/panthor: Add Panthor sparse VM_BIND tests

Alan Previn (3):
      intel-ci: remove pxp from PTL blocklist
      intel-ci: Add a subset of pxp tests into xe-fast-feedback
      intel-ci: Allow PXP negative testing on CRI

Alex Hung (1):
      tests/amdgpu/amd_cursor_overlay: include fcntl.h for ARM

Ashutosh Dixit (1):
      tools/xe-perf/xe-perf-recorder: don't write OA report multiple times

Aurabindo Pillai (2):
      tests/amdgpu/amd_hotplug: use SUSPEND_STATE_FREEZE for basic-suspend
      tests/kms_atomic: skip missing CRTC props in state snapshot

Bernd Kuhls (2):
      tools/intel_gpu_frequency: include limits.h to fix musl build
      tests/intel/xe_madvise: Fix the type for sighandler_t

Chaitanya Kumar Borah (4):
      Revert "lib/kms: Set display->has_plane_color_pipeline automatically"
      tests/kms_properties: set client cap for color pipeline
      tests/kms_colorop: Get color pipeline cap only once
      lib/igt_eld: Fix 88.2kHz/176.4kHz sample rate parsing

Deborah Brouwer (2):
      tests/panthor: skip sparse VM_BIND tests before v1.9
      lib/igt_profiling: configure Panthor enable state

Dominik Grzegorzek (1):
      lib/gpgpu_fill: Implement gpgpu_fill for XE3 which uses ugm instead of tgm

Dominik Karol Piątkowski (8):
      tests/xe_eudebug: Remove xe_eudebug test
      tests/xe_exec_sip_eudebug: Remove xe_exec_sip_eudebug test
      tests/xe_eudebug_online: Remove xe_eudebug_online test
      tests/xe_eudebug_sriov: Remove xe_eudebug_sriov test
      tests/meson: Remove Xe EUdebug
      lib/xe_eudebug: Remove EUdebug library
      drm-uapi-experimental/xe_drm_eudebug: Remove EUdebug uapi
      meson: Remove Xe EUdebug

Donald Robson (6):
      tests/imagination: Add DEV_QUERY tests
      tests/imagination: Add DEV_QUERY static data area tests
      tests/imagination: Add VM_CONTEXT tests
      tests/imagination: Add DEV_QUERY quirks and enhancements tests
      tests/imagination: Add DEV_QUERY runtime_info tests
      tests/imagination: Add SUBMIT_JOBS tests

Fangzhi Zuo (2):
      tools/amd_hdmi_compliance: Add FRL Test Support
      tools/amd_hdmi_compliance: Add ALLM content type toggle test

Frank Binns (1):
      tests/imagination: Add GPU ID test

George Zhang (2):
      tests/amdgpu/amd_dp_dsc: Do not disable DSC for high bw panels
      tests/amdgpu/amd_dp_dsc: Reset link settings after subtest

Granthali Vinodkumar Dhandar (1):
      lib/amdgpu: skip command_ce_write_fence when CE CS is blocked

Harry Wentland (11):
      include/drm-uapi: Add DRM_COLOROP_FIXED_MATRIX
      lib/igt_kms: Add IGT_COLOROP_FIXED_MATRIX property
      tests/kms_colorop_helper: Add Fixed Matrix colorop infrastructure
      lib/igt_fb: Add YUV color pattern framebuffer support
      lib/igt_color_encoding: Add XRGB2101010 format support
      lib/igt_color: Add YUV pixel reading support
      lib/igt_color: Refactor transform_pixels for input/output FBs and CSC
      tests/kms_colorop: Add FIXED_MATRIX colorop tests
      tests/kms_colorop: Add bypass transition tests
      tests/kms_colorop: Increase VKMS bracket to 3 up
      lib/igt_amd: don't rely on NUL separators parsing link_settings

Himanshu Girotra (3):
      tests/intel/xe_exec_threads: ignore expected hang timeout
      intel-ci: Add CRI core blocklist
      intel-ci: Add xe.cri.core.blocklist to config.json

Jagmeet Randhawa (2):
      tests/intel/xe_exec_multi_queue: Check PXP is rejected on multi-queue
      tests/intel/xe_exec_mix_modes: Add multi-queue LR spinner switch subtest

Jakub Kolakowski (3):
      intel-ci: Remove SR-IOV tests from NVL blocklist
      intel-ci: Add expected skips to VF/VM blocklists
      intel-ci: Add xe_sriov_vram to NVL blocklist

James Lin (4):
      tests/amdgpu: Tolerate bandwidth-limited MPO scale combinations in mpo-scale
      tests/kms_plane_alpha_blend: Skip 7efc alpha-swap CRC check on AMD at >8bpc/DSC
      tests/amdgpu/amd_cursor_overlay: reset primary position for reference frame
      Revert "tests/kms_plane_alpha_blend: Skip 7efc alpha-swap CRC check on AMD at >8bpc/DSC"

Jan Maslak (12):
      lib/intel/genxml: Add genxml generators, headers, and build integration
      lib/intel/genxml: Import gen4-gen8 XML hardware definitions from Mesa
      lib/intel/genxml: Import gen9-gen12.5 XML hardware definitions from Mesa
      lib/intel/genxml: Import Xe2/Xe3/Xe3p XML hardware definitions from Mesa
      lib/intel_bufops: Add intel_buf_mocs() helper
      lib/mocs: Add packed MOCS helpers
      lib/rendercopy: Convert surface state and sampler setup to genxml
      lib/rendercopy: Convert vertex data and CC state to genxml
      lib/rendercopy: Convert pipeline emit commands to genxml
      lib/rendercopy: Convert render op and entry points to genxml
      lib: Add genxml annotated batch buffer decode
      lib/rendercopy: Use the Xe2+ depth buffer packet

Jani Nikula (4):
      tests/kms_chamelium_color_pipeline: prefer igt_crtc_name() over kmstest_pipe_name()
      tests/intel/kms_joiner_helper: iterate CRTCs instead of pipes
      lib/kms: rename enum pipe to hardware_pipe, crtc->pipe to crtc->hardware_pipe
      lib/kms: use enum hardware_pipe for __intel_get_pipe_from_crtc_index() return type

Janusz Krzysztofik (3):
      lib/igt_store: Fix unexpected reuse of allocated offset
      tests/device_reset: Cold reset doesn't depend on PCI reset
      tests/intel/i915_module_load: Ignore missing PCI reset

Jari Tahvanainen (2):
      scripts/code_cov_parse_info: add support for lcov/geninfo >1.14 formats
      scripts/code_cov_parse_info: add display include and exclude in only_xe

Jason-JH Lin (4):
      tests/kms_hdr: Skip unsupported formats in bpc-switch test
      lib/igt_pm: Add CPU idle state control
      tests/kms_setmode: Add basic-no-cpu-idle subtest
      tests/kms_plane: Skip CRC frame sequence check on MediaTek

Jeevan B (5):
      tests/kms_display_modes: Skip mirrored pipe combinations
      tests/intel/kms_pm_dc: Detect frame drops via page-flip events
      tests/intel/kms_pm_dc: Fix PSR/PR entry timeout in dynamic subtests
      tests/intel/kms_pm_dc: Add test to validate YUV420 with DC3CO
      lib/igt_core: buffer signal-safe log output per line

Jesse Zhang (7):
      tests/amdgpu/amd_queue_reset: Fix random hang during queue reset stress
      tests/amdgpu/amd_deadlock: add gfx user-queue clean-hang reset test
      tests/amdgpu/amd_deadlock: add gfx user-queue priv-fault reset test
      tests/amdgpu/amd_deadlock: add gfx user-queue priv-instruction reset test
      tests/amdgpu/amd_deadlock: add gfx bad-opcode non-zero-count reset test
      lib/amdgpu: fix NULL deref computing available_rings in amdgpu_create_ip_queues
      lib/amdgpu: add gfx12 shader blob for sync_dependency_test

Jia Yao (1):
      xe_exec_system_allocator: fix MADVISE_MULTI_VMA and PREFETCH_SAME_ATTR bo_size for PVC

Jing-Ping Jan (1):
      lib/igt_kms: Add plane type verification in igt_crtc_get_plane_type

Jitta Vignan (2):
      tests/msm: fix BO allocation tests to use explicit cache flags
      tests/msm: extend BO tests to cover GEM_INFO and cache flags

Jonathan Cavitt (2):
      tests/intel/xe_pxp: Require output for display tests
      tests/intel/xe_exec_reset: Update gt reset dmesg ignore regex

Kamil Konieczny (16):
      tests/msm/msm_perfcntrs: Fix compilation break
      tests/intel/kms_pm_dc: Fix compilation on arm64
      intel-ci: Block kms_setmode@basic-no-cpu-idle
      intel-ci: Block non-Intel pvr* Imagination tests
      checkpatch: Ignore camelcase and igt_main()
      man: Make man pages reproducible
      Dockerfile: remove libproc packages
      Dockerfile: bump debian version
      gitlab-ci: Fix computing sum for debian image
      Revert "intel-ci: blocklist multi-queue tests on NVL"
      Update MAINTAINERS
      lib/igt_core: Create new way for finding PNG data files
      Dockerfile: bump fedora version to latest
      runner: Add new option --save-results-after-each-test
      runner: Create results after each tests end
      Update NEWS, bump version to 2.6

Kanala Ramalingeswara Reddy (1):
      lib/amdgpu: add GFX1154 chips for amd tests

Karthik Poosa (1):
      lib/igt_aux: enable serial printk logs during suspend

Krishnaveni Palanisamy (1):
      tests/intel/perf_pmu: Fix double free of drpc in test_rc6

Krzysztof Karas (1):
      intel-ci: Block sriov tests on i915

Krzysztof Niemiec (5):
      tests/intel-ci: Remove dmabuf tests from i915 fast feedback
      tests/dmabuf: Port dmabuf tests to KUnit
      tests/gpu_buddy: Rename the KUnit buddy allocator test
      intel-ci: Rename drm_buddy to gpu_buddy in blocklist
      tests/intel/gem_exec_params: add invalid-offset-multiple-buffers test

Kunal Joshi (1):
      tests/intel/kms_dp_linktrain_fallback: tolerate stale forced-LT-failure counter

Luka Mamrikishvili (1):
      tests/sw_sync: fix invalid fd test

Lukasz Laguna (8):
      lib/xe/xe_ggtt: Extract generic GGTT code into library
      tests/intel/xe_sriov_flr: Extend GGTT clearing checks
      lib/igt_device_scan: Extract helper setting device filter from fd
      tests/sriov_basic: Validate PF unbind with VFs enabled
      lib/xe/xe_device: Add helper for device healthcheck
      tests/device_reset: Add Xe healthcheck to post-reset validation
      intel-ci: Block igt@xe_sriov_ggtt.*
      tests/intel/xe_sriov_ggtt: Install SR-IOV exit handler

Maarten Lankhorst (3):
      drm-uapi: Sync drm_mode.h with drm-next up to 1258f9c9ff1d
      lib/igt_kms: Add support for the BACKGROUND_COLOR property
      tests/kms_color: Add background-color subtest to test the BACKGROUND_COLOR property

Marcin Bernatowicz (12):
      benchmarks/gem_wsim: skip -V verify on non-BATCH steps
      lib/xe/xe_spin: fix premature batch exit on BO resubmission
      benchmarks/gem_wsim: fix ticks_delta assertion for non-inverted logic
      tests/xe_sriov_scheduling: fix ticks_delta check for non-inverted logic
      benchmarks/gem_wsim: add explicit VM create/assign steps
      benchmarks/gem_wsim: add compute/LR mode support for Xe VMs
      tests/intel/xe_sriov_scheduling: Disable VFs before resetting sched params
      lib/xe/xe_sriov_admin: Rename restore defaults helpers
      lib/xe/xe_sriov_admin: Lower priority before clearing timeslicing
      lib/xe/xe_sriov_admin: Add bulk scheduling params setter
      tests/intel/xe_sriov_scheduling: Use safe scheduling params helpers
      tests/intel/xe_pmu: Disable VFs before restoring sched params

Mark Broadworth (1):
      tools/amd_hdmi_compliance: Fix for HDMI Compliance Automation

Mark Yacoub (3):
      tests/unigraf: Fix DRM master and heap memory leaks in tests
      android: glib: add g_key_file_get_boolean stub
      lib/igt_kms: Do not treat writeback and virtual connectors as connected

Matt Coster (2):
      tests/imagination: Add framework for Imagination tests
      tests/imagination: Add GEM mmap tests

Matt Roper (2):
      lib/xe: Use proper GT lookup in xe_gt_get_tile_id()
      tests/intel/xe_pmu: Ensure stash_gt_freq allocates sufficient storage

Maíra Canal (2):
      tests/v3d: Expect EINVAL for empty multisync submissions
      tests/v3d: Pass the submit struct, not its address, to the ioctl

Michał Grzelak (10):
      lib/igt_aux: remove typos
      lib/igt_kms: s/pipe/crtc/
      tests/kms_frontbuffer_tracking: remove TEST_MODE_ITER_BEGIN() from `suspend`
      tests/kms_frontbuffer_tracking: remove TEST_MODE_ITER_BEGIN() from `fliptrack`
      tests/kms_pipe_crc_basic: limit #crtcs tested during suspend
      tests/kms_psr: limit #outputs tested during suspend
      tests/kms_vblank: split outer test loop into two
      tests/kms_sharpness_filter: fix typo
      tests/kms_sharpness_filter: limit #outputs tested during suspend
      tests/kms_sharpness_filter: limit #crtcs tested during suspend

Mika Kahola (1):
      tests/intel/kms_frontbuffer_tracking: skip PSR/FBC subtests disabled by modparam

Mohammed Thasleem (2):
      tests/intel/kms_pm_dc: Add DC5 DPMS suspend/resume validation test
      tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume validation test

Naladala Ramanaidu (6):
      tests/kms_vrr: Allow low refresh modes with identical clocks
      tests/intel/kms_psr2_sf: Restrict ET validation to eDP only
      lib/igt_vrr: Add VRR helper library for display refresh rate testing
      lib/igt_kms: Add helper to return vblank timestamp and sequence
      tests/kms_vrr: Add CMRR fixed and video mode subtests
      tests/kms_vrr: Retry LOBF detection on low refresh mode

Nishit Sharma (18):
      Revert "tests/intel/xe_prefetch_fault: add L2 prefetch fault subtests"
      tests/intel/xe_exec_system_allocator: fix prefetch-change-attr flow
      tests/intel/xe_exec_system_allocator: use correct DONTNEED test flag
      tests/intel/xe_exec_reset: Add concurrent GT reset submit stress test
      tests/intel/xe_exec_reset: add sync concurrent reset submit subtest
      tests/intel/xe_exec_reset: add gt-stress-reset-memory-pressure subtest
      tests/intel/xe_exec_reset: add gt-stress-reset-bo-invalidation subtest
      tests/intel/xe_exec_reset: add gt-stress-reset-rapid-cycle subtest
      tests/intel/xe_exec_reset: add gt-stress-reset-destroy-vm-context subtest
      tests/intel/xe_exec_reset: add gt-stress-reset-mixed-engine-usage subtest
      tests/intel/xe_exec_reset: add gt-stress-reset-pm-transition subtest
      tests/intel/xe_exec_reset: add gt-stress-reset-engine-hang subtest
      tests/intel/xe_debug: fix NULL dereference in GT register-save-restore debugfs check
      tests/intel/xe_vm: fix double munmap of first mapping
      tests/intel/xe_sysfs_scheduler: fix save/restore array indexing
      tests/intel/xe_exec_reset: add GT reset fault injection stress coverage
      tests/intel/xe_exec_reset: fix mixed-engine reset stress to use actual GT engines
      tests/intel/xe_wedged: ignore expected fault/CAT dmesg in wedged paths

Nitin Gote (1):
      tests/core_hotunplug: add *-with-load subtests exercising GPU workload during hotplug

Oak Zeng (1):
      tests/intel/xe_exec_fault_mode: Revive atomic tests

Piotr Piórkowski (1):
      tests/intel/xe_sriov_ggtt: Add test checking GGTT accesses

Pranay Samala (2):
      intel-ci: Add audio/color chamelium tests
      intel-ci: Blocklist lud3d for display_ver < 35

Priyanka Dandamudi (5):
      tests/intel/xe_vm: Fix igt_assert_f condition in test_oom
      tests/intel/xe_cw_post_sync: Rename test and relax platform
      tests/intel/xe_cw_post_sync: Run walker-post-sync on all compute engines
      intel-ci: Update NVL, LNL and BMG Xe core blocklists
      tests/xe_waitfence: Add user-fence-no-signal subtest

Rob Clark (2):
      drm-uapi/msm: Sync with drm-next up to a7b378c94937
      tests/msm: Add perfcntrs test

Robert Mazur (2):
      lib/imagination: add device configuration support
      lib/imagination: add GPU memory allocation helpers

Roman Li (1):
      lib/igt_amd: improve link_settings parser for old kernel compatibility

Santhosh Reddy Guddati (3):
      tests/kms_rotation_crc: concurrent cursor movement with rotation
      tests/intel/kms_joiner: Fix mixed_output subtest skips
      lib/intel_fbc: Use display version for FBC max plane size

Sarah Walker (2):
      tests/imagination: Add DEV_QUERY heap info tests
      tests/imagination: Add tests for free list and hwrt creation ioctls

Sebastian Brzezinka (31):
      lib/igt_tools_stub: introduce static sub-library for tools
      lib/igt_stats: introduce static sub-library for tools
      tools/igt_stats: link with minimal sub-libraries
      tools/intel_firmware_decode: link with minimal sub-libraries
      lib/igt_tools_stub: add stubs needed by tools
      lib/igt_drm_stub: introduce for tools needing driver detection
      lib/igt_device_scan: wire to use static sub-libraries
      tools/intel_gpu_top: add explicit drm/tools-stub deps
      lib/igt_halffloat: introduce static sub-library for tools
      lib/i915/intel_decode: replace igt.h with minimal headers
      lib/i915/intel_decode: introduce static sub-library for tools
      lib/intel_mmio: introduce lib_igt_reg_tools static sub-library for tools
      tools/intel_gpu_frequency: link with minimal sub-libraries
      tools/intel_stepping: link with minimal sub-libraries
      tools/intel_gtt: link with minimal sub-libraries
      tools/intel_dump_decode: link with minimal sub-libraries
      tools/intel_error_decode: link with minimal sub-libraries
      tools/intel_vbt_decode: link with minimal sub-libraries
      tools/intel_backlight: link with minimal sub-libraries
      tools/intel_lid: link with minimal sub-libraries
      tools/intel_gpu_time: link with minimal sub-libraries
      tools/intel_audio_dump: link with minimal sub-libraries
      tools/intel_forcewaked: link with minimal sub-libraries
      tools/intel_guc_logger: link with minimal sub-libraries
      tools/intel_infoframes: link with minimal sub-libraries
      tools/intel_panel_fitter: link with minimal sub-libraries
      tools/intel_watermark: link with minimal sub-libraries
      tools/intel_display_poller: link with minimal sub-libraries
      tools/intel_gvtg_test: link with minimal sub-libraries
      lib/igt_core: move igt_load_igtrc to igt_rc
      tools/lsgpu: link with minimal sub-libraries

Shekhar Chauhan (2):
      tools/xe-perf-recorder: Add mmio-trigger support
      tools/xe-perf-recorder: expose some OA stream open properties

Shivtej Patil (2):
      intel-ci: blocklist multi-queue tests on NVL
      intel-ci: blocklist multi-queue tests on BMG, LNL, PTL and WCL

Shuicheng Lin (1):
      tests/intel/xe_exec_system_allocator: Ignore expected CAT error in fault subtest

Sk Anirban (2):
      tests/intel/xe_pm: include PCI domain in i2c adapter name
      tests/intel: Avoid stale errno

Sobin Thomas (1):
      tests/intel/xe_debugfs: add uc debugfs validation and read tests

Sowmiya S (8):
      tests/intel/kms_pipe_stress: fix inverted condition skipping plane setup
      tests/intel/kms_pipe_stress: fix plane source crop and separate cursor loop
      tests/intel/kms_pipe_stress: use ARGB8888/LINEAR for cursor framebuffer
      lib/igt_kms: Add platform-specific joiner exception mode handling
      lib/igt_kms: Skip joiner exception modes in boundary non-joiner search
      lib/i915/i915_dp: Add UHBR helpers and const-correct set_link_params
      tests/intel/kms_dp_linktrain_fallback: Reset traversed MST output count
      tests/intel/kms_dp_linktrain_fallback: Add UHBR-to-HBR fallback subtest

Sujaritha Sundaresan (2):
      lib/intel_pat: add intel_has_pat_wt()
      tests/intel/xe_pat: skip the write-through checks without a WT index

Suraj Kandpal (1):
      tests/kms_force_connector_basic: Rebaseline connection state before compare

Swati Sharma (23):
      tests/intel/kms_sharpness_filter: Skip downscale test on first commit failure
      tests/kms_hdr: Enable DRM KMS debug mask for invalid-hdr subtest
      tests/intel/kms_sharpness_filter: Skip joiner modes
      tests/intel/kms_sharpness_filter: Restore CRTC binding
      tests/kms_feature_discovery: add HDR, VRR and DSC discovery
      tests/kms_feature_discovery: log output count on skip
      intel-ci: remove dc3co-vpb-simulation from NVL blocklist
      intel-ci: Skip tiled tests on xe nvl
      tests/kms_feature_discovery: Fix subtest documentation
      tests/kms_plane: fix planar subtest documentation
      tools: rename HDMI compliance utility
      tests/intel/kms_cdclk: Skip CDCLK bump validation when mode is exactly 4K@30
      tests/intel: Add kms_hdmi_audio_bw test
      tests/intel: Add mode-rejected-max-dotclock subtest to kms_cdclk
      lib/kms: Add NVL joiner exceptions for 4K high-refresh modes
      tests/kms_atomic: skip BACKGROUND_COLOR in CRTC state checks
      lib/igt_kms: Rename IGT_COLOROP_FIXED_MATRIX to IGT_COLOROP_FIXED_MATRIX_TYPE
      lib/igt_kms: Order IGT_COLOROP_FIXED_MATRIX_TYPE before IGT_COLOROP_NEXT
      tests/kms_colorop_helper: Add Fixed Matrix enum names table
      tests/kms_color_pipeline: Add FIXED_MATRIX colorop tests
      tests/kms_color_pipeline: Remove unused color_depth and drm_format
      tests/kms_chamelium_color_pipeline: Add FIXED_MATRIX colorop tests
      intel-ci: Add fixed-matrix chamelium tests

Tejas Upadhyay (1):
      tests/intel/xe_mempage_offline: Add fault-inject based page offline tests

Thadeu Lima de Souza Cascardo (1):
      Revert "lib/igt_kms: Do not treat writeback and virtual connectors as connected"

Tony Qi (1):
      tests/amdgpu/amd_cursor_overlay: skip scaling subtests unsupported by hardware

Uma Shankar (1):
      lib/igt_eld: Poll for async HDA codec probe in eld_is_supported()

Umesh Nerlige Ramappa (4):
      tests/intel/xe_oa: Allow disabling load helper from command line
      tests/intel/xe_oa: Do not assume OA buffer is prefilled with zeroes
      tests/intel/xe_oa: Enable capture just prior to reading OA data
      tests/intel/xe_oa: Cleanup blocking and polling tests

Varun Gupta (3):
      tests/intel/xe_prefetch_fault: refactor test to accept shader function pointer
      tests/intel/xe_prefetch_fault: add L2 prefetch fault subtests
      tests/intel/xe_prefetch_fault: add L2 prefetch fault subtests

Venkateswara Rao Muppidi (1):
      intel-ci: Add multigpu to CRI Core blocklist

Vinod Govindapillai (13):
      lib/i915/fbc: extract intel_fbc_get_fbc_status()
      tests/intel/kms_frontbuffer_tracking: use intel_fbc_get_status()
      tests/intel/kms_frontbuffer_tracking: update the outdated fbc status reasons
      tests/intel/kms_frontbuffer_tracking: consolidate fbc tests skip checks
      tests/intel/kms_frontbuffer_tracking: use a bigger buffer for fbc status
      tests/intel/kms_fbcon_fbt: use a bigger buffer for fbc status
      tests/intel/kms_fbcon_fbt: update the outdated fbc skip reasons
      tests/intel/kms_fbcon_fbt: refactor the code to get the right fbc status
      tests/intel/kms_fbcon_fbt: find and store the crtc index
      tests/intel/kms_fbcon_fbt: find the correct fbc status of a pipe
      tests/intel/kms_fbcon_fbt: use common routine to skip tests on fbc status
      tests/intel/fbc: detatiled debug info for unsupported plane size for fbc
      lib/i915/fbc: xe3_lpd+ update the plane size checks for FBC support

Vitaly Prosyak (12):
      tests/amdgpu/amd_lockdep: Add lockdep false positive reproducer test (v3)
      tests/amdgpu: replace fork-based memory pressure with mmap in userptr stress test
      lib: Add generic platform filtering framework
      lib/amdgpu: Add AMD platform filtering backend
      lib/igt_core: Enable automatic platform filtering in subtest execution
      docs: Add platform filtering documentation
      tests/amdgpu: initialize platform filtering for amd_basic
      lib/amdgpu/amd_gfx: skip CE IB tests when kernel blocks CE CS
      tests/amdgpu: always enable UQ test coverage
      lib/amdgpu: use asic_id for GFX11 platform matching
      lib/amdgpu: Add shared lockdep violation helpers
      tests/amdgpu: Check lockdep violations in reset tests

Xiandong Wang (1):
      tests/kms_atomic_transition: Skip blocking transitions on MTK

Zbigniew Kempczyński (1):
      lib/gpgpu_fill: Rename variable to reflect function purpose

git tag: v2.6

https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-2.6.tar.xz
MD5:  58d7fd4792da220c270c5106202a4492  igt-gpu-tools-2.6.tar.xz
SHA1: 0d28a64d0ff21467d41ccd618a7cd1c6bbfaceac  igt-gpu-tools-2.6.tar.xz
SHA256: 5d5190debfec0ee1728430897f243d0afa271856c2cb5834a23b23f08be8d06e  igt-gpu-tools-2.6.tar.xz
SHA512: 7b06f2aa9c1e4cc87092625d9b8eae946dcb7ac4b0a77534d4f49a880a071fba85fdb9e519e6a9d3cedeeb5181c8d6051a9a3ecd27c7b667d389008752102fe2  igt-gpu-tools-2.6.tar.xz
PGP:  https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-2.6.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEETPf8JI3Czo80u+SPwwTEoxBABekFAmq6iYwACgkQwwTEoxBA
Benn2g/+Nz1VPNF335tes1FT8vUm+ZqCKqnbcOf8ExW2NDd2//gncrPWGXRUKBpf
DkDgPk0d7P9+vRM9rL50URs+WrbaP1z9oBoeWPHWDSJjPdg+OhFrBMs7QQJK3Jm3
pI5PsGUYOhlHbuVb5nfxjtHAiEqMzGSOWNBatN+a2YxMfny4jLfmiRG4SfeqRGv5
hkPDVvXW0M00I+faprzYHPRZkmR5MrlJIbbkog9jDZ3j6kDo37RITvs8JB2nibDX
ZLrXWzSizyBNqlknl+ekf6OvVkn4a0/93lsnS2dnnJrs73/p180jjaQxuYvBemg7
XjAeP/x7pJ/YDdbwz2M+4FwYhCvKy9M3/f3aiP1fs2JAsnGeFl0H74xPNf5vL6Sm
sUgKQX6OVQjHHH/RrTu/Mzslsccz1WV5FZRsthOJZzL3pnQKf97DuiffkE8p+9Xg
r4uyrCotN+/VxXsX5vX9qZM88ymzjsQ+6L09GaDU7uhey1QufjbQci0KapG+k5SF
A8JGx5iqVUd7vZj7r5ZUMWrLMFU/z7mu3WluRMqMZVXAxve+yLL2uL6JdPr5J86b
hxxixxc+tiqPP622qr5a3eLROOqAExGrZVYEAWsJfaIuU40qPGvrW+oia5bKKlg0
/R+ktVFRbKZNKfgTNRGfg3JImI6liGXL0m63VGcEm8msEhrr888=
=0I+M
-----END PGP SIGNATURE-----
