Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857FBE7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 15:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE6310F050;
	Fri, 13 Dec 2024 15:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPtZCBm+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5729810F048
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 15:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734102564; x=1765638564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0L/GfLr2a061JNK/AxXdOnb99QREb3B5IXjd73U0fLY=;
 b=NPtZCBm+RMx0qh3Xt1vzSWYUR1ZwDN8gthYmrJKrMVLTdiwiFJArCsQE
 XquzF2Gvst1MIEOrQjsN27gvwdpwweUxlLVwP8ZPhOOf5g2rzyGNZFt0R
 5ugwYI0sr+AxJAkeq64Zhah9w9kQUCZIbpz+/ojEnyX3mVSzlrEviGqAT
 REIeq1iigmItr8n7YcoR9E6qxUKJnuFO2fTaMCDUWX28GyJQM9KP/tt2A
 LyB0ERi9TsIuF0WMb8f81N4uUuRMknCmLCDZpXV1phgPErTcs0Y3JlKyq
 TUavoH2vxbPT870a/ozbMefYht+LXzr/5K0KtcsMz9SIJnBP8VQMu0wNJ w==;
X-CSE-ConnectionGUID: JoqcYlpzTfOf9KkT+EZSOg==
X-CSE-MsgGUID: cRmFGT74Qae6cucOnQVmJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="57028951"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="57028951"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 07:09:23 -0800
X-CSE-ConnectionGUID: qxIu/qOHSyS1rHKedVDYHw==
X-CSE-MsgGUID: 8uT6xc7oTC6rI9PhEn5+xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="96327252"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.251])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 07:09:21 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: xorg-announce@lists.x.org
Cc: xorg@lists.x.org,
	igt-dev@lists.freedesktop.org
Subject: [ANNOUNCE] igt-gpu-tools 1.30
Date: Fri, 13 Dec 2024 16:08:35 +0100
Message-ID: <20241213150842.79288-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Release 1.30 (2024-12-13)
- -------------------------

General changes:

- - New meson options xe_eudebug and vmtb.

Library changes:

- - Added PantherLake (PTL) support, unified PCI IDs into one
  common header pciids.h (Ngai-Mint Kwan)

- - Added BMG support for OA (Observability Architecture) for Xe driver.
  (José Roberto de Souza)

- - Added support for Xe3 platforms in GPGPU shader. (Andrzej Hajda)

- - Added 6k resolution support for a single CRTC. (Jeevan B)

- - Added support for MTL platform in GPGPU compute. (Nishit Sharma)

Runner changes:

- - Set option PRUNE_KEEP_ALL as default. (Kamil Konieczny)

- - Allow to dynamically ignore dmesg warn messages when generating
  results, usefull when driver is using kernel fault injection.
  (Kamil Konieczny).

Test changes:

- - Added sanity checks for KMS properties. (Dmitry Baryshkov, Maxime Ripard)

- - Improved GPGPU tests for i915 and Xe. (Zbigniew Kempczyński)

- - New SRIOV test for Functional Level Reset (FLR) for Xe. (Marcin Bernatowicz)

- - Added test that draws triangle without using 3d commands for vmwgfx.
  (Maaz Mombasawala)

- - Added subtest for fallback for DP connector. (Kunal Joshi)

- - Added async flips suspend resume subtest. (Santhosh Reddy Guddati)

- - New test for error handling of Xe at probe time. (Francois Dugast)

- - Added testing SIZE_HINTS property in KMS cursor test. (Ville Syrjälä)

- - Added KMS testing for ultrajoiner. (Karthik B S)

- - New test for TLB invalidation in Xe. (Sai Gowtham Ch)

- - New test for timeslice duration in Xe. (Sai Gowtham Ch)

- - Display brightness test during DPMS on and off. (Mohammed Thasleem)

- - New tests for EU debugging for Xe. (Dominik Grzegorzek, Mika Kuoppala,
  Christoph Manszewski, Karolina Stolarek, Maciej Patelczyk, Pawel Sikora,
  Andrzej Hajda, Dominik Karol Piątkowski, Jonathan Cavitt et al)

Tools changes:

- - New power tool for power/energy measurement. (Ville Syrjälä)

- - New VM Testbench (VMTB) - SR-IOV Virtual Machine testing tool.
  (Adam Miszczak)

- - Fixes in amd_hdmi_compliance. (Stylon Wang and Wayne Lin)

- - Fixes in intel_reg. (Lucas De Marchi)

And many other bug fixes, improvements, cleanups and new tests.


Adam Miszczak (4):
      tools/vmtb: VM Test Bench core
      tools/vmtb: Basic SR-IOV tests
      tools/vmtb: Test resources - vGPU profiles
      tools/vmtb: Install VMTB with IGT build system

Alyssa Ross (1):
      tests/intel/kms_pm_rpm: use basename from libgen.h

Andrzej Hajda (13):
      lib/gpgpu_shader: Add write_on_exception template
      lib/gpgpu_shader: Add set/clear exception register (cr0.1) helpers
      lib/intel_batchbuffer: Add helper to get pointer at specified offset
      lib/gpgpu_shader: Allow enabling illegal opcode exceptions in shader
      tests/xe_exec_sip: Introduce invalid instruction tests
      tests/xe_exec_sip: skip invalid instruction in SIP routine
      tests/xe_exec_sip: increase timeout margin for tests
      scripts/generate_iga64_codes: add iga64_macros.h to checksum calculation
      lib/gpgpu_shader: simplify load/store shaders
      lib/gpgpu_shader: pass surface desription to shaders via inline data
      lib/gpgpu_shader: add support for Xe3 platforms
      tests/xe_exec_sip_eudebug: increase timeout margin for tests
      scripts/generate_iga64_codes: fix path of iga64_macros.h

Ashutosh Dixit (7):
      tests/intel/oa: Fix oa-exponents test
      lib/xe/oa: Don't skip if freq sysfs are not present
      drm-uapi/xe: Sync with OA syncs uapi update
      tests/intel/xe_oa: Tests for OA syncs
      lib/xe/oa: Re-instate TestOa metric sets in LNL/BMG XML's
      tests/intel/xe_oa: Move Xe2+ check before init_sys_info
      Revert "tests/xe_oa: Drop TestOa from metric_set()"

Bhanuprakash Modem (9):
      Revert "lib/igt_psr: Remove SRD status change check for DP2.1 Panel Replay"
      Revert "lib/igt_psr: Fix PR state check for DisplayPort connectors"
      lib/igt_kms: Add a debug log for invalid pipe/output combo
      lib/igt_kms: Don't abort in lib helper
      tests/intel/kms_frontbuffer_tracking: Fix testplan documentation
      lib/igt_kms: Clear all pipe properties on reset
      tests/intel/kms_fbt: Drop invalid tests
      intel-ci/i915: Drop PSR + DRRS tests from blocklist
      intel-ci/xe: Drop PSR + DRRS tests from blocklist

Bommithi Sakeena (1):
      tests/xe_pm_residency: Fix while loop in toggle_gt_c6

Bommu Krishnaiah (1):
      tests/core_setmaster: simplify device handling

Christoph Manszewski (11):
      drm-uapi/xe: Sync with oa uapi fix
      lib/xe_ioctl: Add wrapper with vm_bind_op extension parameter
      lib/gpgpu_shader: Extend shader building library
      tests/xe_exec_sip: Add sanity-after-timeout test
      tests/xe_exec_sip_eudebug: Port tests for shaders and sip
      tests/xe_live_ktest: Add xe_eudebug live test
      drm-uapi/xe: Move eudebug uapi to experimental directory
      lib/gpgpu_shader: Add x_offset parameter for gpgpu_shader__write_on_exception
      tests/xe_exec_sip: Write on invalidinstr
      tests/xe_eudebug: Set NEEDS_VISIBLE_VRAM for 'create_bind_list'
      lib/xe_eudebug: Fix and update event filters

Dmitry Baryshkov (2):
      tests/kms_properties: drop immutability checks
      tests/kms_properties: add sanity checks for properties

Dominik Grzegorzek (8):
      drm-uapi/xe: Sync with eudebug uapi
      lib/xe_eudebug: Introduce eu debug testing framework
      tests/xe_eudebug: Test eudebug resource tracking and manipulation
      tests/xe_eudebug_online: Debug client which runs workloads on EU
      drm-uapi-experimental/xe_drm_eudebug: Sync after exec_queue placement event addition
      lib/xe_eudebug: Add support for exec queue placements events
      tests/xe_eudebug: Validate exec queue placements
      lib/intel_bufops: Set NEEDS_VISIBLE_VRAM for each buf by default

Dominik Karol Piątkowski (7):
      lib/intel_batchbuffer: Introduce intel_bb_create_with_context_in_region
      lib/igt_sysfs: Introduce engine_class property helpers
      tests/xe_eudebug_online: Adjust interrupt-other test
      tests/xe_eudebug_online: Remove redundant space
      tests/intel/xe_exec_store: Introduce long-shader tests
      tests/intel/xe_eudebug_online: Fix run_online_client memory leak
      tests/intel/xe_eudebug_online: Improve writes-caching-* tests

Esha Bharadwaj (1):
      lib/igt_fb: fix stride calculation for igt_fb_get_fnv1a_crc()

Fei Yang (5):
      tests/intel/xe_exec_fault_mode: wait for the completion
      tests/intel/xe_exec_fault_mode: separate exec_sync and batch buffer
      tests/intel/xe_exec_threads: remove redundant wait
      tests/intel/xe_exec_threads: wait for all submissions to complete
      tests/intel/xe_exec_threads: separate exec_sync and batch buffer

Francois Dugast (7):
      lib/igt_sysfs: Promote driver rebind function
      tests/intel/xe_fault_injection: Add new test for fault injection
      tests/intel/xe_fault_injection: Use a static list of functions
      lib/igt_sysfs: Add igt_sysfs_{get,set}_s32
      tests/intel/xe_fault_injection: Use igt_sysfs helpers
      tests/intel/xe_fault_injection: Inject errors during vm create IOCTL
      tests/intel/xe_fault_injection: Inject errors during vm bind IOCTL

George Zhang (3):
      scripts/run-test: Keep original prune behaviour
      tests/amdgpu/amd_abm: Fixed tests to only run on one output per pipe
      tests/kms_async_flips: Only check joiner mode on intel device

Gwan-gyeong Mun (3):
      lib/intel_batchbuffer: Add support for long-running mode execution
      lib/gppgu_shader: Add read D32 from ppgtt virtual address
      tests/intel/xe_eudebug_online: Add read/write pagefault online tests

Imre Deak (3):
      lib/igt_kms: Add igt_kms_frame_time_from_vrefresh()
      lib/igt_kms: Add kmstest_wait_for_pageflip_timeout()
      tests/i915/kms_flip_tiling: Fix pageflip timeout for low vrefresh modes

Jagmeet Randhawa (1):
      tests/intel/xe_vm: Reduce n_execs for bind-array-enobufs

Jakub Kolakowski (1):
      tests/intel-ci/xe-fast-feedback: Add SR-IOV FLR test

Jan Maslak (3):
      lib/xe_query: add hwconfig to xe_device
      lib/xe_query: add xe_hwconfig_lookup_value() helper
      tests/xe_eudebug_online: update thread count handling in query_attention_bitmask_size()

Jan Sokolowski (3):
      tests/xe_eudebug: use proper address when waiting for fence
      /lib/xe/xe_eudebug: Add trigger removal method
      /tests/intel/xe_eudebug_online: Remove vm_open_trigger on debugger reattachment.

Janga Rahul Kumar (1):
      tests/intel/xe_exec_reset: Add mocs reset test

Janusz Krzysztofik (5):
      tests: drm_fdinfo: Fix zero tolerance checks
      lib/gem_mman: Stop lying about I915_MMAP_OFFSET_GTT support
      intel-ci: Blocklist igt@i915_module_load@load
      tests/gem_mmap_offset: Split 'clear' subtest
      tests/gem_mmap_offset: Fix OOM hits

Jeevan B (4):
      tests/intel/kms_psr2_sf: Add eDP check for Early Transport
      lib/igt_kms: Add is_joiner_mode function
      tests/kms_display_modes: Skip test if joiner display is connected
      lib/igt_kms: Add 6k resolution support for a single CRTC

Jeff Dagenais (1):
      scripts/generate_iga64_codes: prevent objcopy from modifying the input file

Jesse.zhang@amd.com (12):
      tests/amdgpu: fix concurrent queue test issue
      tests/amd_queue_reset: Enhance error reporting
      tests/amd_queue_reset: add sdma test in queue reset
      lib/amdgpu: fix sdma linear copy command
      lib/amdgpu: add sdma ring id parameter for deadlock helper
      tests/amdgpu: enhance sdma test for deadlock
      lib/amdgpu: change sdma limit check
      lib/amdgpu: fix ring schedule issue
      lib/amdgpu: add gpu reset check
      tests/amd_queue_reset: modify the asic filter
      tests/amd_deadlock: add the filter for amd deadlock
      tests/amd_dispatch: add the filter for amd dispatch

Jessica Zhang (1):
      tests/kms_writeback: clear writeback properties in teardown path

Jonathan Cavitt (9):
      tests/intel/xe_exec_reset: Explicitly declare exec
      tests/intel/xe_fault_injection: Ignore expected errors
      lib/gppgu_shader: Add write D32 to ppgtt virtual address
      eudebug: Add eudebug pagefault event declarations
      lib/igt_sysfs: Add engine list helpers
      tests/intel/xe_sysfs*: Restore values on test failure
      tests/intel/xe_sysfs_timeslice_duration: Restore preempt timeout
      tests/intel/xe_sysfs_scheduler: Assert sysfs params are restored
      lib/xe/xe_gt: Repair xe_gt_stats_get_count function

José Roberto de Souza (4):
      tests/xe_oa: Drop TestOa from metric_set()
      xe/oa: Update oa-lnl.xml
      xe/oa: Update scripts to support BMG
      xe/oa: Add oa-bmg.xml

Jouni Högander (11):
      lib/igt_psr: Add mechanism to check sink status as well
      tests/intel/kms_psr*: Add psr_sink_error_check to PSR tests
      tests/intel/kms_fbt: Add psr_sink_error_check to PSR tests
      test/intel/kms_pm_dc: Add psr_sink_error_check to PSR tests
      tests/intel/kms_dirtyfb: Check features after rendering
      lib/igt_psr: Allow testing without checking sink status
      lib/igt_psr: Assert on sink/source state mismatch
      tests/intel/kms_fbcon_fbt: Use linear instead of x tiled
      lib/igt_psr: Check sink status only when wanted
      tests/kms_vrr: data->switch modes[LOW_RR_MODE] not initialized for lobf test
      tests/kms_vrr: Set VRR_ENABLED property as false for non-VRR panel as well

Juha-Pekka Heikkila (6):
      tests/intel/kms_ccs: recycle framebuffers
      lib/igt_fb: add igt_xe2_blit_with_dst_pat function
      tests/intel/kms_ccs: use igt_fb functions instead of locally defined
      tests/kms_rotation_crc: move plane rotation requirements into helper
      tests/kms_rotation_crc: Intel display version 20 onwards doesn't do hflip with tile4
      tests/intel/kms_ccs: add suspend tests

Julia Filipchuk (1):
      tests/intel/*_query: Add new hwconfig table entry

Kamil Konieczny (11):
      runner/settings: set PRUNE_KEEP_ALL as default
      runner/resultgen: Added dynamically ignored dmesg messages
      lib/igt_core: Added message to runner about ignoring kernel warns
      tests/intel/xe_wedged: Inform runner about expected error
      scripts/test_list: Relax treatment of non-compiled tests
      MAINTAINERS: Change Bhanuprakash's email address
      tests/intel/xe_wedged: Ignore more dmesg warnings
      runner/executor: Limit reading dmesg to chunks
      runner/executor: Fix error handling at terminating test
      runner/executor: Inform about terminating
      Update NEWS, bump version to 1.30

Karthik B S (5):
      tests/kms_joiner: Add tests for ultrajoiner validation
      lib/kms: Update force joiner helpers to accomodate ultrajoiner
      tests/kms_joiner: Add subtests for force ultrajoiner validation
      tests/kms_joiner: Reset the force_joiner_supported variable
      tests/intel-ci: Update chamelium-only.testlist

Karthik Poosa (1):
      tests/intel/xe_pm_residency: Add an assertion on MI_STORE execution time

Katarzyna Piecielska (2):
      tests/intel-ci: Block all gem_exec_fair tests
      tests/intel: Adjust test documentation to given standard

Krzysztof Niemiec (4):
      tests/syncobj_timeline: Update invalid-wait-zero-handles test
      tests/syncobj_wait: Update invalid-wait-zero-handles test
      tests/intel/gem_ctx_persistence: Wait for context termination
      tests/intel/gem_exec_balancer: Disable parallel tests on execlists

Kunal Joshi (5):
      lib/igt_kms: add DP link management helper functions
      lib/igt_kms: add function to reset link params
      lib/igt_kms: fix helper igt_get_dp_mst_connector_id
      lib/igt_kms: Handle EINVAL error as well
      tests/intel/kms_dp_linktrain_fallback: add test for validating fallback

Lucas De Marchi (21):
      tests/intel/xe_drm_fdinfo: Wire up parallel/virtual submission
      tests/intel/xe_drm_fdinfo: Implement virtual/parallel exec queues
      gputop: Print message without clients
      lib/igt_kmod: Rewrite xe unload logic
      tests/kms_rmfb: Fix support for xe
      tests/intel-ci/xe: Remove kms_rmfb@close-fd from blocklist
      lib/igt_gt: Fix forcewake open
      lib/igt_gt: Make igt_open_forcewake_handle() xe-compatible
      lib/igt_gt: Add igt_open_forcewake_handle_for_pcidev()
      treewide: Fix intel_register_access_init()
      lib/igt_gt: Stop passing fd == -1 in igt_open_forcewake_handle()
      tests/intel/xe_query: Stop getting refclock multiple times
      tests/intel/xe_query: Add debug message with calculated refclock
      tests/intel/xe_query: Clarify delta engine_cycles calculation
      lib/igt_kmod: Drop PM interaction on unbind
      lib/igt_kmod: Export igt_kmod_unbind()
      lib/igt_kmod: Simplify kunit_set_filtering()
      tests/intel/xe_drm_fdinfo: Increase sampling period
      lib/igt_kmod: Drop legacy kunit fallback
      lib/igt_kmod: Fix leaking subtest name
      lib/igt_kmod: stop using KMOD_REMOVE_FORCE, again

Lukasz Laguna (1):
      lib/xe_sriov_debugfs: Add helper for opening attributes

Maaz Mombasawala (1):
      tests/vmwgfx: Add test that draws triangle without using 3d commands.

Marcin Bernatowicz (17):
      lib/xe/xe_mmio: Fix assertion logic in xe_mmio_vf_access_init
      lib/xe/xe_mmio: Remove redundant PCI system cleanup
      lib/igt_core: Refactor libpciaccess init/cleanup wrappers
      lib/igt_sriov_device: add helper for opening SR-IOV device sysfs
      lib/igt_sriov_device: add helper for resetting SR-IOV device
      tests/intel/xe_sriov_flr: Add skeleton for clear and isolation tests
      tests/intel/xe_sriov_flr: Implement clear-ggtt subcheck
      tests/intel/xe_sriov_flr: Implement clear-lmem subcheck
      tests/intel/xe_sriov_flr: Implement clear-scratch-regs and clear-media-scratch-regs subchecks
      lib/xe/xe_sriov_provisioning: Define resource types and provisioned range structure
      lib/xe/xe_sriov_debugfs: Add function to read provisioned ranges
      tests/intel/xe_sriov_flr: Verify full LMEM range
      lib/xe/xe_sriov_provisioning: Extract function to search provisioned PTE ranges
      lib/xe/xe_mmio: Replace open-coded init/cleanup with existing functions
      lib/xe/xe_sriov_provisioning: Refactor range handling and logging
      tests/xe/xe_sriov_flr: Use SKIP for unmet subcheck prerequisites
      lib/xe/xe_sriov_provisioning: Iterate only within valid PTE offsets

Matt Roper (4):
      tests/intel/xe_wedged: Avoid racy cleanup
      lib/intel_device_info: Use per-thread device info cache
      tests/intel/xe_wedged: Manage verbosity of GT reset fault injection
      tests/intel/xe_fault_injection: Pick a valid PAT index for vm_bind

Matthew Auld (3):
      tests/intel-ci/xe-fast-feedback: fixup xe_dma_buf_sync
      lib/pciids: sync with kernel
      tests/intel/xe_mmap: fix assert_caching on small-bar

Matthew Brost (1):
      tests/intel/xe_dma_buf_sync: Update dma-buf sync to use import read / write deps

Melanie Lobo (1):
      lib/intel_aux_pgtable: Library to add support for RGB16161616_64B format

Mika Kahola (1):
      tests/kms_plane_scaling: Require at least 30 Hz refresh rate

Mika Kuoppala (4):
      tests/xe_eudebug: Keep engine for each client
      tests/xe_eudebug: Detect thread starvation on discovery
      lib/xe_eudebug: Warn on pipe timeouts
      lib/xe_eudebug: Increase default pipe timeout value

Mohammed Thasleem (4):
      tests/intel/kms_pm_backlight: Add brightness test during DPMS on and off
      tests/intel/kms_pm_backlight: Remove eDP check for backlight
      tests/intel/kms_pm_lpsp: Add display version check on external panel
      tests/intel/kms_pm_dc: Add DC5 retention flops test

Naladala Ramanaidu (11):
      lib/igt_psr: Remove SRD status change check for DP2.1 Panel Replay
      lib/igt_psr: Fix PR state check for DisplayPort connectors
      tests/kms_plane_scaling: Update scaling functions to return error codes
      tests/kms_plane_scaling: Add informative logs for single plane scaling operations
      tests/kms_plane_scaling: Return error code in test_planes_scaling_combo
      tests/kms_plane_scaling: Add debug logs for output scaling attempts
      lib/igt_psr: Remove SRD status change check for DP2.1 Panel Replay
      lib/igt_psr: Fix PR state check for DisplayPort connectors
      lib/igt_kms: allow set and reset value to be same
      tests/kms_plane_scaling: Add mode override in scaling test
      tests/kms_plane_scaling: Improve error handling in kms_plane_scaling tests

Ngai-Mint Kwan (1):
      lib: sync PCI ID macros with kernel

Nirmoy Das (3):
      tests/intel/xe_exec_fault_mode: Don't return early
      tests/intel/xe_exec_compute_mode: Print engine name on error
      tests/intel-ci: Remove xe_bo_shrink_kunit

Nishit Sharma (1):
      lib/intel_compute: GPGPU support for MTL platform

Peter Senna Tschudin (3):
      tests/intel/xe_pm: one suspend/resume cycle for all xe
      tests/intel/xe_module_load: Handling of snd_hda_intel
      tests/intel/xe_pm: Fix code style issues

Petr Vaněk (1):
      lib/igt_profiling: add include for PATH_MAX constant

Pranay Samala (7):
      tests/intel/kms_psr2_sf: Modify kms_psr2_sf test
      tests/kms_flip: Update the skip message
      tests/kms_3d: Add more logs to skips/failure
      tests/chamelium/kms_chamelium_edid: Use extended flag to reduce the number of edid
      lib/monitor_edids/hdmi_edids: Swap edids
      tests/intel/kms_big_fb: Intel display version 20 onwards doesn't do hflip with tile4
      tests/kms_plane:Add more logs to skips/failure

Pravalika Gurram (3):
      lib/xe/xe_query: xe_find_engine_by_class helper
      tests/intel/xe_exec_compute_mode: Use xe_find_engine_by_class
      tests/intel/perf_pmu: Skip frequency test on older platforms

Sai Gowtham Ch (2):
      tests/intel/xe_sysfs_timeslice_duration: Add test to validate timeslice duration
      tests/intel/xe_tlb: Add test to check TLB invalidation

Sai Teja Pottumuttu (1):
      tests/intel/xe_oa: Fetch OA buffer size from observation IOCTL

Santhosh Reddy Guddati (7):
      tests/kms_async_flips: Async flips suspend resume test
      lib/igt_kms: Move backlight read and write to lib
      tests/intel/kms_pm_backlight: Refactor and use functions from lib
      tests/kms_hdr: Test brightness manipulation in HDR mode
      tests/kms_hdr: Skip brightness on non-internal panels
      tests/kms_async_flips: subtests to validate async flips on atomic path
      tests/kms_async_flips: Skip async flips on joiner output

Sk Anirban (1):
      tests/intel/xe_pm_residency: Add GT coarse power gating validation

Soham Purkait (1):
      tests/intel/xe_oa: Skip rc6 disable test if gtidle node is missing

Stylon Wang (2):
      tools/amd_hdmi_compliance: Fix atomic commit failure
      tools/amd_hdmi_compliance: Add timeout option

Suraj Kandpal (6):
      test/kms_content_protection: Fix variable declaration
      tests/kms_content_protection: Print correct output
      test/kms_content_protection: Move color change code
      tests/kms_content_protection: Make mst_cp_enable_with_retry() void
      tests/kms_universal_plane: Use COMMIT_ATOMIC flag when doing commit
      test/kms_content_protection: Account for reauthetication in LIC

Swati Sharma (5):
      tests/intel/psr: update documentation
      tests/intel/psr: fix documentation
      tests/kms_color: fix data->output
      tests/intel/dsc: Convert debug msg to info msg
      tests/intel/kms_dsc: Split max_bpc constraint

Tejas Upadhyay (1):
      lib/xe: set hwconfig NULL for unsupported platforms

Tim Huang (1):
      tests/amdgpu: fix a random P-state test failure

Tom Chung (1):
      tests/amdgpu/amd_replay: Add some page flips before test start

Tvrtko Ursulin (1):
      lib/igt_drm_fdinfo: Handle (somewhat) amdgpu memory stats

Umesh Nerlige Ramappa (2):
      i915/drm_fdinfo: Quiesce GPU prior to running some tests
      tests/intel/xe_oa: Use buf->bo_size for xe_bo_map

Ville Syrjälä (76):
      lib/rendercopy: Add deltas to all surface relocs
      tests/kms_big_fb: Use igt_fb_create_intel_buf()
      tests/kms_frontbuffer_tracking: Use igt_create_fb()
      lib/igt_fb: Make igt_calc_fb_size() somewhat usable
      lib/rendercopy: Always setup clear color for TGL
      lib/rendercopy: Don't skip clearcolor on flat CCS
      lib/rendercopy: Fix fastclear scaling
      lib/rendercopy: Extract gen4_surface_format()
      lib/rendercopy: Extract {dg2,lnl}_compression_format()
      lib/igt_fb: Extract is_gen12_rc_ccs_cc_modifier()
      lib/igt_fb: Extract ccs_needs_enginecopy()
      lib/igt_fb: Require enginecopy for clear color
      lib/igt_fb: Expose igt_fb_is_ccs_modifier()
      lib/igt_fb: Expose igt_fb_is_gen12_rc_ccs_cc_modifier()
      lib/igt_fb: Expose igt_fb_is_gen12_mc_ccs_modifier()
      lib/igt_fb: Adjust how we pick the blitter compression format
      lib/igt_fb: Fix planar block copy
      lib/igt_fb: Fix blitter compression format handling
      lib/igt_fb: Assert that we have no clear color when using the bltter
      tests/kms_plane: Extract skip_format_mod()
      tests/kms_ccs: Reuse igt_fb_is_gen12_rc_ccs_cc_modifier()
      tests/kms_ccs: Skip testing on identical plane types
      tests/kms_ccs: Provide a hint as to what we're testing
      tests/kms_display_modes: Fix the plane setup in extended-mode-basic
      lib/rendercopy: Add specific support for 2:10:10:10 formats
      lib/rendercopy: Use the proper compression format for 10bpc on dg2/lnl+
      lib/rendercopy: Use the proper compression format for 16bpc on dg2/lnl+
      lib/rendercopy: Skip AUX surface setup in TGL+
      lib/igt_fb: Add 10bpc compression format for the blitter
      lib/igt_fb: Add 16bpc compression format for the blitter
      lib/igt_fb: Try to fix block copy media compression handling
      tests/kms_plane: Skip 10bpc formats with media compression
      tests/kms_ccs: Skip 10bpc formats with media compression
      lib/igt_fb: Treat 2:10:10:10 properly
      lib/vebox: Add support for fp16 RGB formats
      lib/vebox: Document that 2:10:10:10 is unusable with VEBOX
      tests/kms_ccs: Correctly check clear color for 10bpc formats
      tests/kms_ccs: Correctly check clear color for fp16 formats
      tests/kms_ccs: Fix planar blits for xe2
      tests/kms_ccs: Try to fix the xe2 blitter compression format
      lib/intel_aux_pgtable: Pick a more optimal aux format for 10bpc
      tests/gem_ctx_engines: Fix gen6+ check
      tests/kms_frontbuffer_tracking: Simplify tiling vs. platform tests
      tests/kms_ccs: Use logical && instead of bitwise &
      tests/xe_ccs: Use logical && instead of bitwise &
      igt: Get rid of AT_LEAST_DISPLAY()
      igt: Get rid of AT_LEAST_GEN()
      include/drm-uapi: Update uapi headers
      lib/igt_kms: Add IGT_PLANE_SIZE_HINTS
      tests/kms_cursor_crc: Make require_cursor_size() a bit more sensible
      tests/kms_cursor_crc: Test the SIZE_HINTS property
      igt: Fix printf formats on x86-32
      tests: Fix gcc warnings about _Atomic(uint64_t) alignment
      lib/intel_compute: Fix compiler warnings on x86-32
      tools/intel_gpu_top: Fix intel_gpu_top for pre-snb
      lib/intel: Extract gem_store_dword_needs_physical()
      lib/intel: Unify MI_STORE_DWORD secure batch checks
      lib/intel: MI_STORE_DWORD doesn't need secure batches on i965
      lib/intel: Documnent gem_can_store_dword()
      lib/power: Allow use of rapl by specifying fd=-1
      igt: Use is_intel_dgfx()
      lib/igt_power: Add power_supply/BAT based measurement
      tools/power: Introduce a small power/energy measurement tool
      tests/kms_color: Move dynamic subtests even further out
      lib/igt_fb: Fix intel_buf surface init
      lib/igt_draw: Use void* where appopriate
      lib/igt_draw: Extend the API to support 64bpp colors
      lib/igt_draw: Support 64bpp int the mmap/pwrite paths
      lib/igt_draw: Support 8bpp int the mmap/pwrite paths
      lib/igt_draw: Add 64bpp support to the XY_FAST_COLOR_BLT path
      lib/rendercopy: Use igt_require() to validate gen2/3 surface size
      lib/igt_aux: Add igt_ror() and igt_rol()
      lib/igt_draw: Use function pointers for the linear<->tiled conversion
      lib/igt_draw: Add support for gen2 and i915 tiling layouts
      lib/igt_draw: Add 64bpp support for the non-XY_FAST_COLOR_BLT path
      lib/intel_bufops: Add support for gen2 and i915 tiling layouts

Vinay Belgaumkar (1):
      tests/intel/xe_gt_freq: Use sync reset

Vitaly Prosyak (5):
      tests/amd_queue_reset: add expected error codes
      tests/amd_queue_reset: refactor monitoring child process into a worker thread
      lib/amdgpu_pci_unplug: fix bo mapping to CPU
      tests/amdgpu: refactor multimedia tests for improved modularity
      lib/amdgpu: Introduce process spawning with synchronization

Wayne Lin (1):
      tools/amd_hdmi_compliance: Additional functionalities

Zbigniew Kempczyński (13):
      scripts/test_list: Don't log missing testlist
      scripts/test_list: Drop logging out list of not compiled tests
      tests/xe_exec_compute_mode: Use valid exec queue for bind
      lib/intel_blt: Handle multiple ctrl-surf-copy blits on big surface
      tests/xe_ccs: Add large-ctrl-surf-copy subtest
      tests/gem_ccs: Add large-ctrl-surf-copy subtest
      lib/intel_compute: Use valid number of array size for unbind
      tests/xe_gpgpu_fill: Add command line switch to dump the surface
      tests/xe_gpgpu_fill: Add width/height/x/y command line args
      tests/xe_gpgpu_fill: Add offset-16x16 subtest
      tests/gem_gpgpu_fill: Add command line switch to dump the surface
      tests/gem_gpgpu_fill: Add width/height/x/y command line args
      tests/gem_gpgpu_fill: Add offset-16x16 subtest

jesse(jie) zhang (1):
      tests/amdgpu: filter some asic for invalid packet length.

git tag: v1.30

https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-1.30.tar.xz
MD5:  10706e68a57f464408d309ae74bec5e2  igt-gpu-tools-1.30.tar.xz
SHA1: 678594b42f125b7abc0454df548cf71d4469b721  igt-gpu-tools-1.30.tar.xz
SHA256: b29f969d54cc620756f75517971fb3197e1488eec60af720a18a0ba7ab541ab1  igt-gpu-tools-1.30.tar.xz
SHA512: be0af7c7b3bbf6d47ac5267b6be9af356cfd148f2588d624635e642299df0ab0a825bc1498c6ba2b9f8b6c1e4f0126b6fdf22c82548bfa1df1906efad492db60  igt-gpu-tools-1.30.tar.xz
PGP:  https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-1.30.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEETPf8JI3Czo80u+SPwwTEoxBABekFAmdcQrQACgkQwwTEoxBA
BekzUQ//TWPVCU/1u5ZSomORQfW6Slhcvha0k4RUqTleAojviknkAhgR4WTnv5nr
REwSJ6k08iPqAlDvCeB9/ooqBS4nNoLPNC//ADTxZknM7/QBKFK13d+GKZxlgADa
KIjj5dlRz1kdxrY+ZT/O4RSavz+AVIPS9JstN9LIWj6thp1nckm4nRDCjxkhJFis
+XST2oLfeLWELXhnZsFawOV/hgvmLw+HT7mBEqJnGR5VV4V4VveP/fcV0Dt9DWET
7512I5plGSZvIfjs0HGDZ4TziDMi+eWB5GyEVofafOcqzTyWrChYp9RlhF4D0aK6
a34DxV3VqstSYQGrzf0yEwwt3tsXBKANibj5KUcfN+nKyWBIv9Q5IuHoQRwRv5no
lt8cCbwwRAz0mhO73TIx8T3L5ccmWYER77WyqxQtlwnJDWgHHbRS8FmNR2l/uAsW
Dsn3iLgbK5m5ltMys5NVNqaKli35jC+49OCj4tumZLmJC93rZuLjg+JGQ8MUmVtq
8g/odJXppBXZFjerrPq1yFoF2Upn6yH2bG5IBRKX/d6OHNN2lmYLhjxpRYoxfT27
PAOscZfQrqCMR9BT+X1eRhwl5AMDqqE1R0TffMSJ0vV3siEVRspZLlMEVLU20gUs
UeepdO9c+DCoRSNE597H/LfKgoStSSVQhq0nbg8Y803FhOFLs1I=
=GC/q
-----END PGP SIGNATURE-----
