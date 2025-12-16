Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29ED2D5E39D
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 15:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8ADC10E82A;
	Tue, 16 Dec 2025 15:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BWD+mA5b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5965310E76C
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 15:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765897497; x=1797433497; h=from:date:message-id:to:subject;
 bh=LnXbaYLWsZHrEaHGh2ij4mXp26DRoYc1KC0Y4T0tEkE=;
 b=BWD+mA5beR8C4ZXPDzbhHYpvZbnBuEpwSwxwppohIj5Xx6eBy6bEWa3a
 eyxTH/0fHeQMHvStvEoioTwwVn+hs2+LK/EKsSzKo1WYrHzGebhjSird4
 WUHqWpEBzAsCCnhe+KjKso8YUK2it4nH8UeUFKf+SJ/MzHaii61dvtM4b
 F74BnU1jXlMozl6f7XtpQFzGEsjAhy69FMfZVD+QPYgFsIXUSfCGe6pP3
 u1AFmJJL8cIDZAQ1misk9AWZdMK10ctSiUNLPQeDJFYOG/pEp13hTg+2a
 2Gu43oZHZINIqVYUi4vnx5GEqweblACZ6kWNRUq1aRlYoakeSxOZoZd2s w==;
X-CSE-ConnectionGUID: cDVrxxGSRsKgCUDKNLviBg==
X-CSE-MsgGUID: +8FNjloURs2/qMQIeJNjuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="90475101"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="90475101"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 07:04:56 -0800
X-CSE-ConnectionGUID: pJUwnZyXT1CRSECC33FZbw==
X-CSE-MsgGUID: idyM6Th1SBK0gFM4KCkCuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="202452355"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 07:04:54 -0800
From: kamil.konieczny@linux.intel.com
Date: Tue, 16 Dec 2025 16:04:52 +0100
Message-ID: <5bc1e2a7d0e7155b8eb427a60c8c0abe.kamil.konieczny@linux.intel.com>
To: xorg-announce@lists.x.org
Cc: xorg@lists.x.org
Cc: igt-dev@lists.freedesktop.org
Subject: [ANNOUNCE] igt-gpu-tools 2.3
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

Release 2.03 (2025-12-16)
- -------------------------

General changes:

- - Improved C sources to be more Coccinelle friendly. (Ville Syrjälä)

- - Improved documentation on freedesktop GitLab pages. (Pawel Sikora and
  Swati Sharma)

Library changes:

- - Fixes for MEM_COPY instruction. (Balasubramani Vivekanandan)

- - Added AMDGPU LLVM assembler utility for shader compilation. (Jesse Zhang)

- - Added GFX1200 amdgpu family. (Jesse Zhang)

- - Added support for basic-modeset for xe driver in kms_prime. (Santhosh Reddy
  Guddati)

- - New Xe survivability test for Intel BMG GPU. (Sk Anirban)

- - Added PCI ids for CRI and NovaLake-S. (Kamil Konieczny)

- - Added Panthor driver in drmtest lib. (Daniel Almeida)

- - Fixed device opening with IGT_FORCE_DRIVER (Kamil Konieczny)

- - Corrected MOCS index for displayable surfaces. (Tvrtko Ursulin)

- - Added Virtio-GPU driver in drmtest lib. (Mark Yacoub)

Test changes:

- - New Xe multi queue test. (Niranjana Vishwanathapura)

- - Improved Xe OA testing. (Ashutosh Dixit)

- - Improved Xe EUdebug testing. (Andrzej Hajda, Dominik Karol Piątkowski,
  Jan Maslak, Mika Kuoppala)

- - Added subtest for Intel dgfx Package G7 residency in kms_pm_rpm. (Mohammed
  Thasleem)

- - New AMDGPU memory management test suite. (Jesse Zhang)

- - New KMS color pipeline and LUT testing. (Alex Hung and Harry Wentland)

- - Improved Intel xe_debugfs test. (Piotr Piórkowski)

- - Improved Xe SRIOV testing. (Marcin Bernatowicz)

- - New subtest for content protection with suspend resume HDCP-MST. (Jeevan B)

- - Improved dmabuf test on slow platforms. (Janusz Krzysztofik)

- - New Intel kms_sharpness_filter test. (Swati Sharma)

- - New tests for Panthor. (Daniel Almeida and Boris Brezillon)

- - Added support for MediaTek in few display tests. (Jason-JH Lin)

- - New SRIOV test for VF access to VRAM via BAR. (Lukasz Laguna)

- - Added timeslice preempt test in xe_exec_reset for validation of the restart
  paths in the DRM scheduler TDR (Timeout Detection and Recovery). (Matthew
  Brost)

Tools changes:

- - Added iteration option in intel_gpu_top. (Simon Fairweather)

- - Added Alderlake-P register definitions. (Naladala Ramanaidu)

- - Improved devices filtering in lsgpu. (Zbigniew Kempczyński)

- - Improved intel_vbt_decode and intel_display_poller. (Ville Syrjälä)

Scripts changes:

- - New script for converting a 3D LUT data to igt_3dlut_t array. (Alex Hung)


And many other bug fixes, improvements, cleanups and new tests.


Alex Hung (13):
      drm-uapi/drm: sync with color pipeline commit
      drm-uapi: Add COLOROP objects
      lib/igt_kms: Add writeback functions
      tests/kms_colorop: Add a TF sRGB test
      lib/igt_color: Add 1D LUT color transformation support
      tests/kms_colorop: Add tests that exercise the 1D LUT colorops
      tests/kms_colorop: Add multiplier tests
      scripts/convert_3dlut.py Convert a 3D LUT to igt_3dlut_t array for 3D LUT API
      tests/kms_colorop: Add a 3D LUT subtest
      tests/kms_colorop: Add a colorop uniqueness subtest
      lib/igt_color: Add support for Gamma 2.2
      tests/kms_colorop: Add Gamma 2.2 tests for 1D Curves
      tests/kms_bw: Correct skip message for mx pipe count

Andrzej Hajda (18):
      tests/intel/xe_eudebug_online: use helper to get hwconfig value
      lib/xe/xe_query: introduce helpers for device query
      lib/xe/xe_query: use recently introduced helper to query device
      lib/xe/xe_query: introduce iterator for GT topology masks
      lib/xe/xe_oa: use xe_query helpers for query GT topology
      tests/intel/xe_query: use xe_query helpers for query GT topology
      tests/intel/xe_eudebug_online: use xe_query helpers for query GT topology
      lib/igt_aux: add hweight helper for bitmaps
      lib/xe/xe_query: add helpers to return count of EUs and EU threads
      lib/gpgpu_shader: use recently introduced helper to get EU thread count
      tests/intel/xe_eudebug_online: use igt_bitmap_hweight
      lib/igt_aux: add fls helper for bitmaps
      tests/intel/xe_eudebug_online: use igt_bitmap_fls to calculate max dss count
      tests/intel/xe_eudebug_online: add fd and flags to online_debug_data
      tests/intel/xe_eudebug_online: rename threads_count to thread_hit_count
      tests/intel/xe_eudebug_online: use online_debug_data in get_(shader|sip)
      tests/intel/xe_eudebug_online: cache thread count value
      tests/intel/xe_eudebug_online: add pagefault-one-of-many test

Ashutosh Dixit (23):
      tests/intel/xe_oa: Add OAM formats to lnl_oa_formats
      tests/intel/xe_oa: Get rid of unnecessary DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE
      tests/intel/xe_oa: Rename nth_oa_unit to oa_unit_by_id
      tests/intel/xe_oa: Change oa_unit_engine to take an oa_unit argument
      tests/intel/xe_oa: Add oa_unit_by_type
      tests/intel/xe_oa: Add for_each_oa_unit
      tests/intel/xe_oa: Convert test_oa_formats to take an OA unit argument
      tests/intel/xe_oa: Convert several more tests to take OA unit arguments
      tests/intel/xe_oa: Convert test_non_zero_reason to take an OA unit argument
      tests/intel/xe_oa: Convert blocking/polling tests to take OA unit arguments
      tests/intel/xe_oa: Convert test_mi_rpc to take an OA unit argument
      tests/intel/xe_oa: Convert test_single_ctx_render_target_writes_a_counter
      tests/intel/xe_oa: Convert OA buffer mmap tests to take OA unit arguments
      tests/intel/xe_oa: Convert MMIO trigger tests to take OA unit arguments
      tests/intel/xe_oa: Convert sync tests to take OA unit arguments
      tests/intel/xe_oa: Run test_oa_unit_exclusive_stream on multiple OA units
      tests/intel/xe_oa: Add new non-zero-reason-all test
      tests/intel/xe_oa: Constify arguments to various functions
      tests/intel/xe_oa: Drop oa-unit-exclusive-stream-exec-q
      drm-uapi/xe: Sync with DRM_XE_OA_CAPS_OA_UNIT_GT_ID definition
      tests/intel/xe_oa: Return hwe from same gt from oa_unit_engine()
      tests/intel/xe_oa: Run mmio-trigger tests on all OA units
      tests/intel/xe_oa: Use separate oa unit variables for caps and iterator

Balasubramani Vivekanandan (7):
      lib/intel_blt: Fix MEM_COPY instruction for xe2+ platforms
      lib: Add Crescent Island Support
      lib/intel_pat: Define pat indices for xe3p_xpc
      lib/intel_blt: Convert BB pointer to uint8_t* in emit_blt_fast_copy
      xe_exercise_blt: Insert a flush between two consecutive FAST_COPY
      lib/xe_spin: Pass drm file handle for mem_copy
      lib/xe_spin: Fix mocs index field in mem_copy for Xe2 platforms

Bhanuprakash Modem (1):
      tests/kms_prime: Add XE support

Boris Brezillon (2):
      drm-uapi/panthor: Sync panthor uapi
      tests/panthor: Add a test to make sure the buffer is zeroed at alloc time

Chaitanya Kumar Borah (1):
      tests/kms_plane_cursor: Use additional FB for reference image

Daniel Almeida (3):
      lib/drmtest: add support for opening Panthor devices
      panthor: add initial infrastructure
      tests/panthor: add panthor tests

Daniele Ceraolo Spurio (2):
      lib/xe/xe_query: move PXP query functions to common file
      tests/intel/xe_fault_injection: Add test for xe_pxp_exec_queue_add

Dominik Karol Piątkowski (10):
      lib/xe_eudebug: Fix safe_pipe_read
      lib/xe_eudebug: Don't fail in __wait_token if pipe was broken
      tests/xe_eudebug_online: Allow dead client in set-breakpoint-sigint-debugger
      lib/xe_eudebug: Introduce xe_eudebug_debugger_kill
      tests/xe_eudebug_online: Improve issuing SIGINT in set-breakpoint-sigint-debugger
      lib/xe_eudebug: Repeat poll in debugger_worker_loop if interrupted
      lib/xe_eudebug: Improve SIGINT handling
      tests/xe_eudebug_online: Introduce proper sync for closing debugger fd in set-breakpoint-sigint-debugger
      lib/xe_eudebug: Introduce SIGTERM handling
      tests/xe_eudebug_online: Issue SIGTERM in set-breakpoint-sigint-debugger

Gustavo Sousa (1):
      igt_kms: Rename igt_pipe member enabled to valid

Harry Wentland (20):
      tests/kms_writeback: Fix kms_writeback for VKMS
      lib/igt_kms: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
      lib/igt_kms: Add COLOROP properties and helper functions
      tests/kms_properties: Add colorop properties test
      lib/igt_color/igt_fb: Add SW color transform functionality
      lib/igt_fb: Add igt_copy_fb function
      lib/drmtest: Add is_vkms_device()
      tests/kms_colorop: Add kms_colorop tests
      lib/igt_kms: Add support for DATA colorop property
      lib/igt_color: Add support for 3x4 matrices
      tests/kms_colorop: Add 3x4 CTM tests
      tests/kms_colorop: Add bypass test
      tests/kms_colorop: Add 10bpc test
      tests/kms_colorop: Skip if writeback does not support fourcc
      tests/kms_colorop: Refactor to use a subtest group with fixtures
      lib/igt_color: Support color transform for XRGB2101010
      lib/igt_color: Add PQ variants for 0-1 and 0-125 range
      tests/kms_colorop: Add tests for PQ variants
      lib/igt_color: add BT2020/BT709 transfer functions
      tests/kms_colorop: Add TF BT2020/BT709 tests

Himanshu Girotra (3):
      tests/intel-ci: Add Xe Multigpu blocklist file
      tests/intel: Adjust test documentation
      tests/intel-ci: Update blocklists for xe

Jan Maslak (4):
      lib/gpgpu_shader: Add num_threads_in_tg to shader struct
      lib/gpgpu_shader: add function for computing max number of threads per tg
      lib/xe/xe_query: add function to retrieve uint32_t value from hwconfig
      tests/intel/xe_eudebug_online: add pagefault stress tests

Janusz Krzysztofik (11):
      tests/intel/gem_eio: Skip on too few reset-resume cycles
      tests/intel/gem_eio: Try harder to measure median resume time
      tests/intel/gem_eio: Adjust for slow resume after reset on Gen12+
      tests/intel/gem_eio: Iterate over physical rings in stress subtests
      tests/intel/gem_eio: Reduce debug info on stderr from stress subtests
      tests/intel/gem_eio: Reduce debug info on dmesg from kms subtest
      tests/dmabuf: Avoid soft lockups on slow platforms
      tests/intel/gem_lmem_swapping: Run smem-oom helper loop in background
      tests/intel/gem_eio: Fix mistyped symbol
      tests/intel/gem_eio: Convert stress subtests to dynamic
      tests/intel/gem_eio: Avoid skips in stress subtests

Jason-JH Lin (8):
      tests/kms_plane: Add support for planar-settings on non-Intel devices
      tests/kms_pipe_crc_basic: Use SUSPEND_TEST_DEVICES for MediaTek devices
      lib/igt_kms: Add support for mtk_current_bpc debugfs in bpc-switch test
      tests/kms_hdr: Use original 512x512 fb size on devices without scaler
      tests/kms_content_protection: Add "SDC" to HDCP panel blocklist
      tests/kms_content_protection: Exempt outputs with no EDID sink name
      tests/kms_content_protection: Add MediaTek device support for HDCP debugfs
      lib/igt_edid: Fix monitor name parsing and trim EDID string padding

Jeevan B (9):
      tests/kms_setmode: simplify mode selection by removing goto
      tests/kms_setmode: Fix clone mode mismatch by preferring eDP mode
      tests/kms_display_modes: reduce exec. time for sim env
      tests/intel/kms_frontbuffer_tracking: Fix typo
      tests/kms_setmode: Check timing twice before asserting basic subtest
      intel-ci: Block DRRS subtests
      tests/intel/kms_flip_tiling: reduce exec time for sim env
      tests/intel/kms_psr2_sf: Remove unnecessary et_flag set
      tests/kms_content_protection: Add a test for HDCP-MST with suspend resume

Jesse.Zhang (12):
      lib/amdgpu: Add dynamic DRI path detection for debugfs access
      lib/amdgpu: Extend JPEG direct register support to version 5
      lib/amdgpu: skip scheduler mask and memcpy tests for user queues
      lib/amdgpu: handle num_userq_slots compatibility for older driver
      lib/amdgpu: support negative testing for user queue submission
      lib/amdgpu: Fix SDMA packet handling and memory ordering
      lib/amdgpu: Add flexible command context API with external BO support
      lib/amdgpu: Add compute dispatch helper for GPU memory verification
      lib/amdgpu: add GPU memory utilities
      lib/amdgpu: add utility functions and GFX1200 family macro
      lib/amdgpu: add AMDGPU LLVM assembler utility for shader compilation
      tests/amdgpu: Add AMDGPU memory management test suite

Jonathan Cavitt (2):
      tests/intel/xe_fault_injection: Force clear injection list on task end
      tests/intel/xe_exec_reset: Fix LR queue not running in cm-gt-reset test

Jouni Högander (1):
      lib/igt_psr: Use 10x timeouts in simulation environment

Kamil Konieczny (23):
      intel-ci: Fix typo in Xe LNL display blocklist
      tests/core_getclient: Create basic subtest
      tests/intel/xe_noexec_ping_pong: Create basic subtest
      tests/core_getstats: Create basic subtest
      intel-ci: Fix Xe blocklists for xe_noexec_ping_pong test
      intel-ci: Block one Xe subtest
      tests/intel/xe_exec_reset: Fix uninitialized var
      lib/drmtest: Fix device opening with DRIVER_ANY and IGT_FORCE_DRIVER
      lib/pciids: sync with kernel commit c002b1764e7b
      lib/pciids: sync with kernel commit 5e0de2dfbc1b
      intel-ci: Block Panthor testing
      tools/intel_gpu_frequency: Fix help and version options
      lib/igt_dir: Fix fdopendir usage
      tools/intel_gpu_frequency: print short program name
      tools/intel_gpu_frequency: Change Intel card detection
      tools/intel_gpu_frequency: Allow printing by regular user
      tests/amdgpu/amd_mem: fix compilation on armhf
      intel-ci: unify Xe lists naming
      intel-ci: Add symlinks for Xe lists
      intel-ci: unify chamelium testlist
      scripts: remove symlink
      intel-ci: remove few i915 symlinks
      Update NEWS, bump version to 2.3

Karthik B S (2):
      intel-ci: Update LNL/PTL display blocklists
      tests/intel/kms_joiner: Cleanup igt_require checks

Krzysztof Niemiec (1):
      tests/intel/gem_exec_schedule: Improve synchronization in pi-ringfull

Kunal Joshi (4):
      lib/igt_kms: add helper to check presence of lobf debugfs
      tests/kms_vrr: extend lobf test for supported connectors
      tests/kms_vrr: remove check for PR support in sink
      tests/intel/kms_dp_linktrain_fallback: log before assert

Lucas De Marchi (2):
      tests/intel/xe_configfs: Test invalid engine with valid class
      tests/intel/xe_configfs: More invalid chars check

Lukasz Laguna (5):
      lib/igt_sriov_device: Add helper to iterate over enabled VFs
      lib/intel_vram: Add library for VRAM accesses
      tests/intel/xe_sriov_flr: Use VRAM access helpers from intel_vram library
      tests/intel/xe_sriov_vram: Add test checking VF access to VRAM
      tests/intel/xe_sriov_vram: Skip the test on devices without VRAM

Maarten Lankhorst (1):
      tests/kms_flip: Suspend signal helper while creating fb

Mallesh Koujalagi (2):
      tests/intel/i915_pm_rps: Add Multi-GT support for freq scaling tests
      tests/intel/i915_pm_rps: Extend Multi-GT support to waitboost and reset tests

Marcin Bernatowicz (11):
      tests/intel/xe_mmap: Fix truncation of visible VRAM size
      lib/xe/xe_sriov_debugfs: Adapt SR-IOV debugfs helpers to new layout
      benchmarks/gem_wsim: Fail on thread assertions
      benchmarks/gem_wsim: Verify Xe spinner batch completion
      lib/xe/xe_sriov_debugfs: Add PF restore_auto_provisioning helpers
      lib/xe/xe_sriov_provisioning: Add helper to disable VFs and restore auto provisioning
      tests/intel: Use xe_sriov_disable_vfs_restore_auto_provisioning()
      tests/intel/xe_sriov_flr: Make subchecks Tile aware
      tests/intel/xe_sriov_flr: Use global MMIO context initialized in verify_flr
      tests/intel/xe_sriov_flr: Do not ignore failed prerequisites
      lib/xe/xe_sriov_provisioning: Drop sched_if_idle reads

Mark Yacoub (2):
      lib/drmtest: Add Support for Virtio-GPU
      tests/kms_content_protection: Check for HDCP before setting displays

Matthew Auld (2):
      lib/ioct_wrappers: add __prime_fd_to_handle()
      tests/intel/xe_peer2peer: gracefully handle ENOTSUP

Matthew Brost (9):
      tests/intel/xe_exec_threads: Add many queues section
      tests/intel/xe_exec_reset: Add job cancel tests
      tests/intel/xe_exec_reset: Add timeslice preempt test
      tests/intel/xe_exec_reset: Long spin tests
      tests/intel/xe_exec_reset: Add long-spin-sys-reuse-many-preempt-threads
      tests/intel/xe_exec_reset: Add long-spin-comp-reuse-many-preempt-threads
      tests/xe/xe_exec_system_allocator: Add partial unmap atomic access sections
      tests/intel/xe_exec_compute_mode: Remove non-block section
      tests/intel/xe_exec_queue_property: Use single invalid property

Mika Kuoppala (7):
      lib/xe/xe_eudebug: Fortify xe_eudebug_for_each_event
      lib/xe/xe_eudebug: Fix token to str
      lib/xe/xe_eudebug: Improve pipe error messages
      lib/xe/xe_eudebug: Mark client done after log is read
      lib/xe/xe_eudebug: Assert that there is always client work
      lib/xe/xe_eudebug: Allow empty event log
      lib/xe/xe_eudebug: Don't take timeout for debugger stop

Mitul Golani (4):
      tests/kms_vrr: Fix TEST_LINK_OFF flag handling
      tests/kms_vrr: Avoid direct assignments to data->flag
      tests/kms_vrr: Indicate force refresh rate request
      tests/kms_vrr: Recalculate expected refresh rate from test

Mohammed Thasleem (11):
      tests/intel/kms_pm_rpm: Refactor system suspend test function parameters
      tests/intel/kms_pm_rpm: Add system suspend idle test case
      Revert "tests/intel/kms_frontbuffer_tracking: Enable the tests support variations based on the WAs"
      Revert "tests/intel/kms_dirtyfb: Enable the tests support variations based on the WAs"
      Revert "tests/intel/kms_fbcon_fbt: Enable the tests support variations based on the WAs"
      Revert "tests/intel/kms_psr: Enable the tests support variations based on the WAs"
      Revert "tests/intel/kms_psr2_sf: Enable the tests support variations based on the WAs"
      tests/intel/kms_*: Remove FBC disable comment
      tests/intel/kms_psr: Skip FBC tests on BMG platform
      tests/intel/kms_psr2_sf: Skip FBC tests on BMG platform
      tests/intel/kms_pm_rpm: Add test to validate G7 residency

Nakshtra Goyal (1):
      tests/intel/xe_exec_multi_queue: Add fault mode test

Naladala Ramanaidu (7):
      tests/kms_vrr: Skip DRRS-related tests on LNL and newer platforms
      tests/kms_vrr: Dynamically verify LOBF across vrefresh steps
      tests/kms_vrr: Reduce unnecessary logging in specific test cases
      tests/kms_vrr: Avoid NULL dereference on cleanup
      tests/kms_vrr: Start virtual RR test above midpoint to avoid mode fallback
      tools/registers: Add Alderlake-P register definitions
      tests/kms_vrr: Fix logical condition for DRRS support

Ngai-Mint Kwan (1):
      tests/kms_atomic_transition: Fix dynamic subtest

Niranjana Vishwanathapura (15):
      drm-uapi/xe: Sync with Multi-Queue uapi
      tests/intel/xe_exec_multi_queue: Add xe_exec_multi_queue test
      tests/intel/xe_exec_multi_queue: Validate exec submissions
      tests/intel/xe_exec_multi_queue: Validate queue priority setting
      tests/intel/xe_exec_multi_queue: Add close-fd tests
      tests/intel/xe_exec_multi_queue: Add multiple placement test
      tests/intel/xe_exec_multi_queue: Add preempt mode test
      lib/xe: Add exec_queue set_property ioctl support
      tests/intel/xe_exec_multi_queue: Add dynamic priority test
      tests/intel/xe_exec_multi_queue: Add userptr invalidation tests
      lib/xe/xe_spin: Add multi-queue switch point for the spinner
      tests/intel/xe_exec_multi_queue: Add priority test
      tests/intel/xe_exec_multi_queue: Add submission sanity test
      tests/intel/xe_exec_multi_queue: Sanity test KEEP_ACTIVE flag
      tests/intel/xe_exec_multi_queue: Keep group active in exec-sanity

Nishit Sharma (5):
      tests/intel/xe_exec_system_allocator: Fix memory leak
      lib/intel_compute: loop_kernel_duration in Pipeline
      tests/intel/xe_compute: Add loop_duration_2s subtest
      tests/intel/xe_compute: Add eu-busy-10s test for EU utilization measurement
      lib/xe: Add multi-queue helper routines

Pawel Sikora (8):
      docs: Set up MkDocs for IGT documentation site
      docs: Create symlinks for NEWS/MAINTAINERS/CONTRIB
      docs: Rename cross-building.txt to .md
      docs: Initialize MkDocs documentation structure
      docs: Add platform-specific documentation
      gitlab-ci: Add MkDocs documentation support
      gitlab-ci: fix api reference pages deploy
      docs: fix intel-specific descriptions

Piotr Piórkowski (9):
      lib/xe_mmio: Introduce tile-level XE MMIO access helpers
      lib/xe_mmio: Add init flag and helper to check initialization
      lib/xe/xe_query: Add tile helpers and iteration macro
      lib/igt_dir: Allow scanning only the current directory
      lib/igt_debugfs: Add debugfs helpers to open tile directory
      tests/intel/xe_debugfs: Rewrite tests to use array-based required debugfs file lists
      tests/intel/xe_debugfs: Add tile-dir subtest for per-tile debugfs validation
      tests/intel-ci/xe-fast-feedback: Rename xe_debugfs subtests
      tests/intel/debugfs: Move VRAM MM checks from root to tile-dir validation

Pranay Samala (1):
      tests/kms_atomic_transition: Reduce iterations on simulation

Priyanka Dandamudi (2):
      tests/intel/xe_configfs: Test gt_types_allowed
      tests/intel/xe_exec_multi_queue: Add multi queues with SMEM

S Sebinraj (4):
      lib/intel_allocator: Add SYSVIPC support check
      tests/kms_concurrent: Fix for msg_queue failure
      tests/api_intel_allocator: Check if multiprocess is supported
      lib/intel_allocator: Initialize maps before SysV IPC check

Sanjay Yadav (2):
      include/drm-uapi-experimental: Drop stale macros from intel_drm_local.h
      tests/intel/xe_pat: Add subtest to validate NO_COMPRESSION flag

Santhosh Reddy Guddati (5):
      tests/intel/kms_fbcon_fbt: Skip CRC check for FBC cursor on simulation platforms
      intel-ci: Update PTL and lnl display blocklist
      tests/kms_prime: Enable basic-modeset for xe
      lib/igt_fb: Apply NEEDS_VISIBLE_VRAM in missing igt_fb
      tests/intel/kms_joiner: Check DSC slices for force ultra joiner

Sebastian Brzezinka (2):
      tools/intel_gpu_top: Show interactive help in usage output
      tools/intel_gpu_top: Refactor flag toggling logic

Shekhar Chauhan (2):
      lib: Add NVL-S support
      lib: Replace NVL with NVL-S

Simon Fairweather (1):
      tools/intel_gpu_top: Add iteration option -n

Sk Anirban (6):
      tests/intel/xe_survivability: Add new xe_survivability test for i2c adapter
      tests/intel/xe_survivability: Add new test runtime survivability
      intel-ci: Fix xe-fast-feedback testlist
      tests/intel/gem_ctx_freq: Fix frequency restoration in exit handler
      tests/intel/gem_ctx_freq: Add null termination to sysfs frequency buffers
      tests/intel/xe_pmu: Fix frequency assertion when RPe raises min frequency

Sobin Thomas (4):
      tests/intel/xe_compute_preempt: Compute preemption check
      lib/intel/intel_compute: Add kernel validation for compute IP versions
      lib/intel_compute: Adjust long kernel usage for WMTP
      tests/intel/xe_exec_system_allocator: Added 64k alignment support

Swati Sharma (15):
      lib/igt_kms: Add "sharpness strength" as crtc property
      lib/igt_kms: Add func() to return scaling mode name string
      tests/kms_sharpness_filter: Add adaptive sharpness basic filter tests
      tests/kms_sharpness_filter: Add toggle subtest
      tests/kms_sharpness_filter: Add filter-tap subtest
      tests/kms_sharpness_filter: Add dpms/suspend subtests
      tests/kms_sharpness_filter: Add scaler subtests
      tests/kms_sharpness_filter: Add invalid subtests
      lib/igt_chamelium: Add chamelium_frame_eq_or_dump_frame_pair()
      tests/chamelium/kms_chamelium_sharpness_filter: Add basic test
      tests/kms_plane_scaling: Clarify skip on early -EINVAL
      intel-ci: Add sharpness filter chamelium test to testlist
      intel-ci: Add sharpness filter tests to i915 blocklist
      tests: Move kms_sharpness_filter to tests/intel/
      intel-ci: Blocklist kms_colorop tests on i915/xe

Thomas Hellström (1):
      intel-ci: Unblock the xe_evict multi-thread tests

Tvrtko Ursulin (2):
      lib/igt_fb/intel: Use correct MOCS for displayable surfaces
      lib/intel_mocs: Add documentation for MOCS helpers

Ville Syrjälä (28):
      lib/gt: Fix IGT_NO_FORCEWAKE handling
      tools/intel_vbt_decode: Introduce to_str()
      tools/intel_vbt_decode: Use to_str() more
      tools/intel_vbt_decode: Convert eDP decoding to use to_str()
      tools/intel_vbt_decode: Use panel_bits()
      tools/intel_vbt_decode: Decode display refclk mode
      tools/intel_vbt_decode: Decode the backlight control method type
      tools/intel_display_poller: Fix long opts
      tools/intel_display_poller: Use intel_display_ver() instead of intel_gen()
      tools/intel_display_poller: Add --scanline-offset/-o command line option
      tools/intel_display_poller: Add --auto-scanline-offset/-O comamnd line option
      tools/intel_display_poller: Add dsb-status-live test
      tools/intel_display_poller: Add --dsb-id/-d command line option
      lib/kms: Nuke PIPE_ANY
      lib/kms: Nuke unused kmstest_{crtc,plane}
      igt/kms: Nuke unused igt_pipe_*prop*() marcos and functions
      igt: Make igt_fixture look like an iterator
      igt: Make igt_subtest_group look like an iterator
      igt: Make igt_main look more like a function
      igt: Make igt_simple_main look more like a function
      igt: Make igt_main*() look like normal function definition
      igt: Make igt_simple_main*() look like normal function definition
      scripts/cocci: Add iterators.cocci
      igt: Name drmModeCrtc variables 'drm_crtc'
      lib/kms: Turn the igt_plane*prop*() macros into functions
      lib/kms: Turn the igt_output*prop*() marcos into functions
      lib/kms: Turn the igt_pipe_obj*prop*() macros into functions
      test/kms_color: Don't dig around in display->pipes[] so much

Vitaly Prosyak (1):
      lib/amdgpu: fix build without amdgpu_device_get_fd

Zbigniew Kempczyński (4):
      lib/xe_util: Add xe fast-copy helper
      tests/xe_pat: Use blitter to copy to uc-comp surface
      tools/lsgpu: iterate over all matching devices
      lib/intel_blt: fix pointer arithmetic in ctrl-surf-copy and mem-copy

Zhanjun Dong (1):
      tests/intel/xe_fault_injection: Set guc_wait_ucode pf only

git tag: v2.3

https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-2.3.tar.xz
MD5:  8730f343bdd9e22204a707a0908476bf  igt-gpu-tools-2.3.tar.xz
SHA1: ed844738ce971fd0a3ce3f857a1a0d95ebb7c562  igt-gpu-tools-2.3.tar.xz
SHA256: 429f2578fb16cff7402e9beb325c5c267ad30a2b7b957343c77e8ea24af03887  igt-gpu-tools-2.3.tar.xz
SHA512: 669e5f124c1177ed58c43b8b9b945f6436fc37b1162b16bbd1db78c5e170c68be98cc3b08b5ecb438d1313722fee2ab8bba8ca86a971443401c2acc3f3ec68ff  igt-gpu-tools-2.3.tar.xz
PGP:  https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-2.3.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEETPf8JI3Czo80u+SPwwTEoxBABekFAmlBWhsACgkQwwTEoxBA
BelOWBAAsPMrcIBSIo16eRoPonCklnKALNAUW0i/iPiBRsx+ebzWpihVlGgAjCOH
zyjBficFeXyWmBRgQJD2DSPzxJ14cf0a66z6DORJyW9Notj+SWkrC3HqIXwtJp+J
Gx95DmSrgC8zv4C90s2jT7Dqi0ti1Juw5OOt0prUz4/u33Dq1tNghxSs6725fWl3
ckWsLVIQ++rHA9k5ZvDRBDGP6UKX3CFZtw1mOAYytlOd5hIxoKXdpNDoikWweb2Z
M8vfCnMHLZrjMNs3kfEwNH9RJoHiUe7zsCXz0IKvx5hqH+UGwINE9BsUGZg39mN6
qlUAqGJVHutcL0bcuUHgAsa7v9vCPXonXTjXKqEUGt+TGrkGvEE9oE5xxV3BIkrN
NjimPkwZqzWVxg/HosjNWve5AI211FoQ3IxsVYQg52P+BnAZHKRanBUATl0y+b3J
Pr3IlFRbvT8PGX9flIe5V72T6ZN6S5PZZZCR1Fliib0H7mUNxYVfL6WbxP8f6KS6
8KrnUSI00M2NWMdv8uAwBhMR7nknJhtvMJp4Nfj9Cj2f0rEX89WWZegJIN3b7Neg
Vj/YEX3ocM1sR57oNZSsdcaQQ5QptWsBWqFU6fDVeqda0Tji9AWMcjHtYQKsc0vU
tqRPn3AG9h9+jmWFozEqTv8x5eMlhpYXl5LiBgDob68oSyP0i8I=
=b2YC
-----END PGP SIGNATURE-----
