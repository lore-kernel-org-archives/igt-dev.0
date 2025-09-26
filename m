Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26818CAC5AE
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 16:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB13210E058;
	Fri, 26 Sep 2025 16:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXZgEv2U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C932710EA72
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 16:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758905394; x=1790441394; h=from:date:message-id:to:subject;
 bh=69Ys+q9HlrKCsDS/rvVF7GF83zsJ+gzRisYeWsvYlMU=;
 b=DXZgEv2U3j+wdvo3VlPP+r/FulioQeZWOp5shjQBhiUKbsJHQi8Dd+i1
 BwbDkSkOhF6dbx3BPNs9jqMZBcAz6nmXZEvC7G8SkorD7nAtMzA3oiOC8
 Y/uuHRFL759e6mY+zagbfT+yw2YAdsAioqPsDj5h7YBv0QfpgppTM82vs
 PofKFmERiLBuv/4mosOZdtVcbUfgjkuc1hYcwyOkhdzE95fXMWgot9V8o
 sfoPkiJN0oa0nZoNIkFAudVB/ysTPSCeCgZXiUOpPwgPGO3XKefYIJQ3d
 /LW8GXXN6RovrWMiRg4DYO/5dQjrhLREbJsJnZkhwbHCF2Xw0uBrc1AXu Q==;
X-CSE-ConnectionGUID: FrD6I2INRzi5aOV9/SUsPw==
X-CSE-MsgGUID: ilMo5DeqTB+ARz7ULDpNsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61292623"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61292623"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:49:53 -0700
X-CSE-ConnectionGUID: u0fwvHMiTquZg7DNXD3dCQ==
X-CSE-MsgGUID: 70GHh19DQzSDTiN/7Aa2Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="182062981"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.44])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:49:51 -0700
From: kamil.konieczny@linux.intel.com
Date: Fri, 26 Sep 2025 18:49:49 +0200
Message-ID: <5834caf0533d4acbb68ffc8b76762606.kamil.konieczny@linux.intel.com>
To: xorg-announce@lists.x.org
Cc: xorg@lists.x.org
Cc: igt-dev@lists.freedesktop.org
Subject: [ANNOUNCE] igt-gpu-tools 2.2
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

Release 2.02 (2025-09-26)
- -------------------------

General changes:

- - PNG images moved to new data/ directory. (Naladala Ramanaidu, Swati Sharma)

- - Added default checkpatch config. (Peter Senna Tschudin)

Library changes:

- - New VKMS driver in drmtest lib. (José Expósito)

- - Added PCI ids for BMG and WildcatLake.(Ravi Kumar Vodapalli, Jani Nikula)

- - Separation of Intel compute kernels for easy maintainance. (Zbigniew
  Kempczyński)

- - Reduced logs for KMS tests with IGT_CI_RUN env var. (Pranay Samala)

- - New ASIC-aware gfx hooks for amdgpu. (Vitaly Prosyak)

- - Added SDMA support for user queues for amdgpu. (Jesse Zhang)

- - Improved GTs id handling in Xe. (Matt Roper)

- - New lib for Intel WA checks. (Mohammed Thasleem)

- - New lib for directory traversal and file handling. (Peter Senna Tschudin)

- - Added support for the device filters during device scan. (Soham Purkait)

Test changes:

- - New tests for VKMS. (José Expósito, Louis Chauvet, Jim Shargo, Marius Vlad)

- - Added madvise subtests for Xe system allocator. (Nishit Sharma)

- - Improved Xe configfs testing. (Lucas De Marchi)

- - Improved KMS HDR panel testing. (Chaitanya Kumar Borah)

- - Added subtests for engine activity accuracy. (Soham Purkait, Riana Tauro)

- - Improved Xe OA testing. (Ashutosh Dixit, Umesh Nerlige Ramappa, Sushma
  Venkatesh Reddy)

- - New core and kms tests for sysfs and debugfs. (Peter Senna Tschudin)

- - Improved Xe system allocator testing. (Matthew Brost)

- - Improved Xe SRIOV testing. (Marcin Bernatowicz)

- - Improved KMS async flips tests with async modifiers. (Santhosh Reddy Guddati)

- - New multi-GPU test cases for amdgpu. (Jesse Zhang)

- - Added subtest for async flips with DPMS. (Karthik B S)

- - Added tests for MSM. (Rob Clark)

Tools changes:

- - Improved intel_vbt_decode. (Jani Nikula)

- - Added Xe support to intel_dp_compliance. (Disantkumar Mistry)

Runner changes:

- - Relaxed timeout reduction on soft lockup. (Janusz Krzysztofik)

- - Added a hook for kmemleak scan after the unbind operation. (Peter Senna
  Tschudin)

Scripts changes:

- - Renamed blocklist verify script. (Kamil Konieczny)


And many other bug fixes, improvements, cleanups and new tests.



Aditya Chauhan (1):
      tests/intel-ci : Add PTL blocklists and GPU excluded platform definition

Alex Deucher (1):
      lib/amdgpu: reduce the job count for deadlock helpers

Ashutosh Dixit (7):
      tests/intel/xe_oa: Look at errno only when system calls fail
      tests/intel/xe-oa: Use subslice_mask in pec_sanity_check
      tests/intel/xe_oa: Fix OA format name typo
      lib/xe/oa: Update LNL XML's
      lib/xe/oa: Update BMG XML's
      lib: Update BMG/PTL device info
      lib/xe/oa: Fix OA media metric set properties

Balasubramani Vivekanandan (1):
      lib/intel_blt: Fix MEM_SET instruction for Xe2+ platforms

Chaitanya Kumar Borah (5):
      lib/igt_pm: Skip LPM policy control on unsupported SATA hosts
      lib/dsc: Add helpers to disable force dsc
      tests/kms_hdr: Set HDR meta-data while testing for panel capability
      tests/kms_hdr: Handle HDR panels requiring DSC
      lib/igt_kms: Handle commit failures while checking bpc constraints

Christoph Manszewski (2):
      tests/intel/xe_vm: Add bind-array-flag-invalid subtest
      tests/intel/xe_vm: Unify bind-flag-invalid and bind-array-flag-invalid test functions

Daniel Charles (1):
      tests/intel/xe_exec_reset: expect error or complete on CAT_ERROR

Daniele Ceraolo Spurio (1):
      tests/intel/xe_fault_injection: Break early if the test is done

Disantkumar Mistry (1):
      tools/intel_dp_compliance: Enabling XE driver support

Francois Dugast (2):
      tests/intel/xe_exec_system_allocator: Add compute test
      tests/intel/xe_exec_mix_modes: Remove absolute duration value

Gustavo Sousa (2):
      lib/xe: Fix allocation for vram_size and visible_vram_size based on max_gt
      tests/intel/xe_gt_freq: Fix usage of xe_dev_max_gt() for array allocation

Harish Chegondi (3):
      tests/intel/xe_eu_stall: Use default sampling rate from the query IOCTL data
      lib/xe/xe_query: Add EU stall info to xe_device
      tests/intel/xe_eu_stall: Use the fastest sampling rate

Harry Wentland (1):
      lib/igt_kms: Move get_writeback_formats_blob to lib

Himanshu Girotra (2):
      intel/xe_fault_injection: Update function name for xe_wa_init
      intel-ci: Update BMG and LNL core blocklists

Jagmeet Randhawa (1):
      tests/intel/xe_dma_buf_sync: Ensure spinner completion

Jakub Kolakowski (5):
      tests/intel/xe_sriov_flr: Update Sub-category name
      tests/intel-ci/xe.bmg.core.blocklist: Unblock SR-IOV tests
      intel-ci/xe-sriov-*: Extend VF and VM blocklists
      tests/intel/xe_test_config: Add SR-IOV testlists
      tests/intel/xe_configfs: Skip survivability-mode subtest on VF

Jan Sokolowski (2):
      tests/intel/xe_eudebug: Reduce debug loglevel
      tests/intel/xe_pm: Reduce debug loglevel

Jani Nikula (11):
      lib/pciids: lib/pciids: Add Wildcat Lake
      tools/intel_vbt_decode: Change field name in structure
      tools/intel_vbt_decode: Update entries in VBT BDB
      tools/intel_vbt_decode: Update eDP power sequence
      tools/intel_vbt_decode: Fix documentation
      tools/intel_vbt_decode: Split up DSI VBT defs to a separate file
      tools/intel_vbt_decode: Remove intel_bios.h
      tools/intel_vbt_decode: Add anonymous structs to group DSI VBT defs
      tools/intel_vbt_decode: Flip bta_enabled to bta_disable
      tools/intel_vbt_decode: Add missing DSI VBT defs
      tools/intel_vbt_decode: convert copyright sign from latin1 to utf8

Janusz Krzysztofik (1):
      runner: Relax timeout reduction on soft lockup

Jeevan B (2):
      tests/kms_vrr: Pull Panel Replay check before setting up output
      intel-ci: Reorder chamelium audio tests to fix init issue

Jesse.Zhang (13):
      lib/amdgpu: Add SDMA support for user queues
      lib/amdgpu: Fix SDMA user queue submission by using hw_ip_info from ring context
      drm/amdgpu: Add RPTR support and volatile qualifiers for user queues
      tests/amdgpu: Replace AMDGPU_DISABLE_USERQTEST with AMDGPU_ENABLE_USERQTEST
      lib/amdgpu: Consolidate user queue implementation into amd_ip_blocks.h
      drm-uapi/amdgpu: Add num_userq_slots to hw_ip_info structure
      lib/amdgpu: add multi-IP block write command submission helper
      tests/amdgpu: Add test coverage for all user-mode queues across IP blocks
      lib/amdgpu: Use available_rings mask for user queues
      lib/amdgpu: Add user queue support to amdgpu_wait_memory_helper
      tests/amdgpu: Add user queue tests for SDMA in deadlock tests
      lib/amdgpu: unify SDMA protected fence sub-opcode
      lib/amdgpu: fix double free in deadlock helper

Jesse.zhang (2):
      tests/amdgpu: Add multi-GPU test cases for AMDGPU basic functionality
      lib/amdgpu: add support for user queue mode in dispatch tests

John Harrison (1):
      tests/intel/xe_fault_injection: Add GuC load to list of injection functions

Jonathan Cavitt (1):
      lib/xe/xe_spin: Write to start only once

José Expósito (41):
      lib/drmtest: Add VKMS as a known driver type
      lib/vkms: Add minimal VKMS library and test device default files
      lib/vkms: Allow to enable/disable VKMS devices
      tests/vkms_configfs: Test device invalid values
      lib/vkms: Test plane default files
      lib/vkms: Test plane default values
      lib/vkms: Test plane invalid values
      tests/vkms_configfs: Test plane valid values
      lib/vkms: Test CRTC default files
      lib/vkms: Test CRTC default values
      lib/vkms: Test CRTC invalid values
      tests/vkms_configfs: Test CRTC valid values
      lib/vkms: Test encoder default files
      lib/vkms: Test connector default files
      lib/vkms: Test connector default values
      lib/vkms: Test connector invalid values
      tests/vkms_configfs: Test connector valid values
      lib/vkms: Test attaching planes to CRTCs
      lib/vkms: Test attaching encoders to CRTCs
      lib/vkms: Test attaching connectors to encoders
      lib/igt_device_scan: Allow to find device by sysname
      tests/vkms_configfs: Test enablement without pipeline items
      lib/vkms: Create VKMS device from static config
      tests/vkms_configfs: Test adding too many planes
      tests/vkms_configfs: Test not adding a primary plane
      tests/vkms_configfs: Test adding multiple primary planes
      tests/vkms_configfs: Test adding multiple cursor planes
      tests/vkms_configfs: Test adding a plane without possible CRTCs
      tests/vkms_configfs: Test enabling a device without CRTCs
      tests/vkms_configfs: Test enabling a device with too many CRTCs
      tests/vkms_configfs: Test enabling a device without encoders
      tests/vkms_configfs: Test enabling a device with too many encoders
      tests/vkms_configfs: Test adding an encoder without possible CRTCs
      tests/vkms_configfs: Test adding a CRTC without encoders
      tests/vkms_configfs: Test enabling a device without connectors
      tests/vkms_configfs: Test enabling a device with too many connectors
      lib/vkms: Test changing enabled device planes
      lib/vkms: Test changing enabled device CRTCs
      lib/vkms: Test changing enabled device encoders
      lib/vkms: Test changing enabled device connectors
      tests/vkms_configfs: Test connector hot-plug

Jouni Högander (1):
      tests/intel/kms_psr: Do not test frontbuffer rendering on cursor plane

Kamil Konieczny (28):
      tests/amdgpu/amd_basic: fix compilation warning
      lib/xe/xe_sriov_debugfs: fix musl libs compilation
      intel-ci: rename i915 blocklists
      gitlab-ci: Update Intel i915 blocklists
      intel-ci: Add symlinks for old i915 blocklists
      intel-ci: rename i915 testlists
      intel-ci: Add symlinks for old i915 testlists
      tests/intel/*test_config: Fix i915 blocklists rename
      intel-ci/meson: Use follow_symlinks only for new meson
      tools/gputop/meson: Fix warning
      meson: Fix warning in running xmlrpc_cmd
      lib/igt_vc4: Fix musl libc compilation
      lib/svga/vm_basic_types: fix musl libc compilation on Void Linux
      intel-ci: Block VKMS for i915 runs
      intel-ci: Block VKMS for xe runs
      tests/intel/i915_test_config: Add all core tests
      scripts/run-tests: Update help
      gitlab-ci: Rename blocklist verify script
      scripts: Update documentation for blocklist verification
      scripts: Add symlink to verify-blocklist.sh
      lib/igt_fb: Add check before loading PNG file
      tests/kms_3d: Convert to subtest
      tests/kms_3d: Add resources cleanup
      lib/drmtest: Refactor chipset to string
      Revert "runner/settings: Add function to set IGT_DATA_PATH environment variable"
      README: refer to lastest software version
      Revert "tools/gputop/gputop: Enable support for multiple GPUs and instances"
      Update NEWS, bump version to 2.2

Karthik B S (10):
      tests/intel/test_config: Add GPU excluded platform definition for i915
      lib/igt_kms: Update igt_fit_modes_in_bw to add legacy commit check
      tests/kms_debugfs: Add a commit after igt_fit_modes_in_bw
      tests/intel/kms_joiner: Update ultra joiner supported platforms
      tests/kms_async_flips: Fix suspend-resume subtest
      tests/kms_async_flips: Modify subtest runtime for suspend resume subtest
      tests/kms_async_flips: Add hang subtest
      lib/igt_pm: Move check_dpms to igt_pm lib
      tests/kms_async_flips: Add DPMS subtest
      intel-ci: Blocklist cursor frontbuffer rendering tests on xe

Kunal Joshi (3):
      tests/chamelium/kms_chamelium_color: poll connector status instead of HPD uevents
      intel-ci: Block unsupported test on chamelium v1
      intel-ci: Update BMG display blocklist

Lucas De Marchi (6):
      tests/intel/xe_configfs: Do not execute with open fd
      tests/intel/xe_configfs: Unbind before testing engines_allowed
      tests/intel/xe_configfs: Install exit handler once
      tests/intel/xe_configfs: Reset all custom settings on exit
      tests/intel/xe_configfs: Save pci_device
      tests/intel/xe_configfs: Check ctx_restore_post_bb

Lukasz Laguna (2):
      tests/intel/xe_vm: Fix skip condition to account for padded BO size
      tests/intel/xe_*: Apply NEEDS_VISIBLE_VRAM in remaining affected tests

Maciej Patelczyk (1):
      drm-uapi-experimental: adjust eudebug ioctl numbers

Marcin Bernatowicz (8):
      tests/intel/xe_sriov_scheduling: Keep K submissions in flight
      tests/intel/xe_sriov_scheduling: Compute throughput from completion timestamps
      tests/intel/xe_sriov_scheduling: Make in-flight submissions configurable
      lib/xe/xe_query: Add xe_gt_type() and xe_is_main_gt() helpers
      tests/intel/xe_sriov_flr: Skip non-MAIN GTs when reading provisioning data
      tests/intel/xe_pm: Don’t fail when runtime PM is disabled
      lib/xe/xe_query: Don’t assume sequential GT IDs in xe_gt_type()
      tests/intel/xe_sriov_flr: Use xe_for_each_gt() for GT iteration

Matt Roper (7):
      lib/xe: Track valid GT IDs
      lib/xe: Don't assume GT ID matches location in GT query list
      lib/xe: Populate vram_size[] and visible_vram_size[] by GT ID
      lib/xe: Ensure GT loops iterate over all GTs properly
      tests/intel/xe_query: Look up GT reference clock correctly
      lib/xe: Add xe_dev_max_gt()
      tests/xe: Don't assume max GT ID is num_gt - 1

Matthew Auld (1):
      tests/intel/kms_ccs: stop using l3 enabled PAT index

Matthew Brost (5):
      tests/intel/xe_exec_system_allocator: Add section to trigger 64k fault
      tests/intel/xe_exec_system_allocator: Add prefetch sections
      tests/intel/xe_exec_system_allocator: Wait on mapping BO's to mirror
      tests/intel/xe_exec_system_allocator: Set data to non-zero value
      tests/intel/xe_exec_system_allocator: Add prefetch-sys-benchmark

Michael J. Ruhl (2):
      script/test_list: fix a document generator bug
      scripts/igt_doc: fix a deprecation warning

Michał Grzelak (2):
      tests/kms_cursor_legacy: don't inhibit pipe CRC calculation
      lib/igt_psr: Skip the test when PSR is disabled

Mohammed Thasleem (7):
      lib/intel_wa: Add check for workaround in GTs
      lib/i915/intel_fbc: Add fbc supported check based on wa
      tests/intel/kms_frontbuffer_tracking: Enable the tests support variations based on the WAs
      tests/intel/kms_dirtyfb: Enable the tests support variations based on the WAs
      tests/intel/kms_fbcon_fbt: Enable the tests support variations based on the WAs
      tests/intel/kms_psr: Enable the tests support variations based on the WAs
      tests/intel/kms_psr2_sf: Enable the tests support variations based on the WAs

Naladala Ramanaidu (9):
      tests/kms_flip: Adjust pass rate threshold based on frame rate
      tests/kms_flip: Remove assertion dependency on link reset retry condition
      tests/kms_flip: Skip timestamp checks in Intel simulation environments
      data: Move PNG images to new data directory
      runner/settings: Constify absolute_path parameter
      lib/igt_core: Enhance __igt_fopen_data to support additional directories
      runner/settings: Add function to set IGT_DATA_PATH environment variable
      tests/intel-ci: Block unsupported downscaling tests
      tests/kms_vblank: Skip timing check in simulation to avoid false negatives

Nemesa Garg (1):
      tests/kms_plane: Add test to validate odd panning

Nishit Sharma (6):
      drm-uapi/xe: Sync with madvise interface
      lib/xe: Add xe_vm_madvise ioctl support
      lib/xe: Add Helper to get memory attributes
      tests/intel/xe_exec_system_allocator: Add madvise subtests
      lib/xe: Track valid Tile IDs
      tests/intel/xe_exec_system_allocator: Extend madvise test coverage in IGT

Peter Senna Tschudin (12):
      checkpatch: Add default config for IGT
      lib/igt_dir: utilities for directory traversal and file handling
      tests: Add core_debugfs
      tests: Add kms_debugfs
      tests: Add core_sysfs
      tests: Add xe_debugfs
      tests/intel: Remove intel_sysfs_debugfs
      tests/kms_debugfs: Use static var for display
      lib/igt_core: Expose igt_hook pointer for other libs
      lib/igt_kmod: Add IGT_HOOK_POST_KMOD_UNBIND
      lib/tests: Update hook unit testing
      lib/igt_dir: Use actual length for string termination

Pranay Samala (11):
      lib/igt_sysfs: Rename log_level to saved_drm_debug_mask
      lib/igt_sysfs: Rename debug level APIs/variables to debug mask
      lib/igt_sysfs: Update new debug mask requested by user
      tests/kms: Use IGT_CI_RUN environment variable
      lib/igt_sysfs: Move igt_exit_handler into test
      tests/kms_plane_cursor: Optimise plane cursor behavior on simulation
      lib/igt_sysfs: Remove redundant variable assignment
      tests/intel/kms_frontbuffer_tracking: Reduce test complexity for simulation
      tests/kms_plane_alpha_blend: Reduce test complexity for simulation
      lib/igt_kms: Add helper to get count of connected outputs
      tests/kms_atomic_transition: Update debug mask for multi-output modeset tests

Pravalika Gurram (1):
      tests/intel/xe_exec_system_allocator: Add pat-index-madvise

Priyanka Dandamudi (2):
      lib/xe_gt: Assertion related to xe_gt_stats_get_count
      tests/xe_vm: Report OOM for vm_bind ioctl under memory pressure

Raag Jadav (1):
      tests/intel/xe_pm: Introduce i2c subtests

Ravi Kumar Vodapalli (1):
      lib/pciids: Add one more PCI ID to BMG

Rob Clark (9):
      tests/msm/msm_mapping: Fix memory leak
      tests/msm/msm_recovery: Wait for devcore
      tests/msm/msm_recovery: add iova-fault-stress test
      tests/msm/msm_mapping: update for sparse
      tests/msm/msm_mapping: Handle BO names with spaces
      tests/msm/msm_mapping: Add additional subtests
      tests/msm/msm_mapping: Wait for devcore
      tests/msm/msm_mapping: Handle larger gmem file size
      tests/msm/msm_mapping: Add wait for stall-on-fault to re-arm

Rodrigo Vivi (1):
      tests/intel/xe_pm: Ensure we open as primary for setting display off

Santhosh Reddy Guddati (8):
      tests/kms_cursor_crc: optimise cursor crc on simulation
      tests/kms_cursor_crc: Rename async cursor crc subtests
      tests/kms_async_flips: Replace hard coded modifiers with async modifiers
      tests/kms_async_flips: Remove unused format modifier checks
      tests/kms_async_flips: Fix for HRR panels
      tests/kms_async_flips: Optimise subtests for simulation platforms
      tests/intel/kms_fbc_dirty_rect: Limit to single pipe on simulation
      tests/kms_fbc_dirty_rect: Limit to one format on simulation

Smitha Balasubramanyam (1):
      lib/intel_compute: choose BO alignment based on driver type

Sobin Thomas (2):
      tests/intel/xe_copy: Add skips for mem-set-linear and page-memcopy
      tests/intel/xe_evict_ccs: Adjust object size for non-resizable BAR

Soham Purkait (8):
      lib/igt_device_scan: Add support for the device filter
      lib/igt_device_scan: Enable finding all matched IGT devices
      tools/gputop/utils: Add gputop utility functions common to all drivers
      tools/gputop/xe_gputop: Add gputop support for xe specific devices
      tools/gputop/gputop: Enable support for multiple GPUs and instances
      tools/gputop/xe_gputop: Keep engine activity percentage between 0 and 100
      tests/intel/xe_pmu: Skip if the engine-active-ticks event is not present
      tests/intel/xe_pmu: Add tests to validate engine activity accuracy

Sushma Venkatesh Reddy (2):
      lib/xe/oa: Add perf consts to support more metrics
      lib/xe/oa: Update PTL oa-metrics with new compute, memory, and stall counters

Swati Sharma (5):
      tests/intel/kms_pipe_stress: Add support for additional tiling formats
      tests/intel/kms_draw_crc: limit formats in simulation env
      tests/kms_color: limit iterations in simulation
      tests/kms_pipe_stress: lower minimum iterations in simulation
      tests/intel/kms_mmap_write_crc: lower rounds in simulation

Tvrtko Ursulin (1):
      lib/intel/veboxcopy: Respect buffer MOCS index

Uma Shankar (1):
      tests/intel/kms_frontbuffer_tracking: Remove FBC modulo 4 restriction for ADL-P+

Umesh Nerlige Ramappa (5):
      tests/intel/xe_oa: Fix report dumps in sanity check
      tests/intel/xe_oa: Fix waiting for mmaped reports
      tests/intel/xe_oa: Clean up buffer-fill test
      tests/intel/xe_oa: Add a test for tail address wrap
      tests/intel/xe_oa: Add an option to capture register accesses in ftrace

Varun Gupta (1):
      tests/intel/xe_query: Print both GT and tile in query-engines test

Vitaly Prosyak (7):
      lib/amdgpu: add ASIC-aware gfx hooks and introduce amd_ip_blocks_ex
      amdgpu/tests: Refactor amdgpu_sync_dependency_test
      amdgpu/tests: make amdgpu_sync_dependency_test work on gfx12
      lib/amdgpu: add hooks to hide PM4 packet creation for NOPs and WRITE_DATA
      tests/amdgpu: add CE write/fence subtest using new PM4 hooks
      lib/amdgpu: Temporarily skip VCN ENC/DEC tests for RX 7600 until proper fix
      Refine VCN test skip condition to target RX9000 (GFX12)

Yinjie Yao (3):
      lib/amdgpu: increase IB_SIZE for VCN
      tests/amdgpu: fix vcn encode test on VCN5
      Revert "lib/amdgpu: Temporarily skip VCN ENC/DEC tests for RX 7600 until proper fix"

Zbigniew Kempczyński (11):
      lib/intel_mocs: fix wb mocs entry for MTL
      lib/intel_compute: use macros instead of binary data in post-sync op
      lib/intel_compute: use post-sync write to detect command level preemption
      lib/intel_compute: reuse bo checking code
      tests/xe_compute_preempt: remove WMTP check in multiprocess tests
      lib/intel_compute_krn_sip: separate sip from the shaders
      lib/intel_compute: migrate compute square kernels
      lib/intel_compute: migrate compute loop count kernels
      lib/intel_compute: migrate compute loop kernels
      lib/xe_util: use valid pat_index during vm-bind/unbind
      lib/xe_ioctl: use valid type for bo

Zongyao Bai (1):
      tests/intel/xe_exec_balancer: use xe_wait_ufence to replace sleep action

git tag: v2.2

https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-2.2.tar.xz
MD5:  db699c641409097041af91accbc35a91  igt-gpu-tools-2.2.tar.xz
SHA1: 698bc96cea6d88a711bf43a4cf82b0b7dbab4a23  igt-gpu-tools-2.2.tar.xz
SHA256: 88178558b352a5e8a287954cb2eef05d775aedfacf43b88251509ea014b6182d  igt-gpu-tools-2.2.tar.xz
SHA512: 20032b90e397ca73f9f8f5b453034fffc09e28372adddebd1a71b1323235e3e379bf452d5a4dd76b895e4c47df67595051c16b8a1488249e5aae946f6a35258c  igt-gpu-tools-2.2.tar.xz
PGP:  https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-2.2.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEETPf8JI3Czo80u+SPwwTEoxBABekFAmjWst0ACgkQwwTEoxBA
Ben0UBAAlvkkdoSiMkkIkAF2ISRJLdk0CjqzZ0y8QocSIo7cVDVHXetNNYaOzEs3
5A7QoQuuggLmJND309PncAUvmUzTmbY02qYznoT4h6bctTIiO6nwtWv5pefYNc6x
hpUOoCL9iHraj78s/VGTQU8RkoYKCEhl12tsW2cfI95hnLldPKKCVDQHkyRLFCfr
v/Sy81biZKs2Wp/kI60AY5IUiCACG5J3RQthqTMSonv0ZnzoCgYn2Lkek6XjaZx+
piOOc9UD8JeGFiZfh4DIhWoi19lcC72up0YTMOUnLcwXk0gylOO+2zba/EwPkiGI
y2lfOoU5/0J2duEN1E94Wnb4pON9hOQBxhulpk9ABV8RI1VGI3H/mOtuk3bZYGcQ
iPoL9Y9vPW1KZMUJ9VsvuRhkBMupFYmxZXLx/VhvTkHMv5AfuHQKtFVv/BLGQD5g
3KGBztgpX5hVUAqrtWMRve3hHdtrttFF7czc4Mz9dVXpcbBcQ3zJCriq8kBQbXt4
MlNr1c+snIJpK5LvPGrdsR0ceKEXuKbKLl4hHtBkE0FSJtYDx9Qq8k6HSi6ZbtgG
0mVlPxmeQgDjqI3v5Imzl9CbpNwWOev6HfuRIVp6p8BCIN5d+y1jFHTeYwteBTnn
aw1aEwyVLUZdChmCsXFKlsNnh+UNlERbFdrg1er5qDOT6kg0BLk=
=QttI
-----END PGP SIGNATURE-----
