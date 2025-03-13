Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0732C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 16:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7353D10E8E4;
	Thu, 13 Mar 2025 16:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7q/sVH0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596A610E8E4
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741883036; x=1773419036;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BjSBDWS8vhBkWP9CFM4E7TuarLctYM4IjyC+oOhu3eQ=;
 b=A7q/sVH0pIRnBeUP5lm9ewgN0AvCGwBfdDjNnxp2PqeH8yewx4FlLTpK
 FeJ0BHWfWvP7XSpV8PQa1zV5duJE4hl5jDMB2t80o6kLO5agXDi6kXn10
 MFdbOP4xA7oaOmL/8reClfs8JIPdEnqNGva73ogP6/IIicZPruFuDSLNZ
 A1ywRBmxy5jyYVFSsVLuzVggt3xrdro67Gb6FSfaGWH9Wrj7wb5c5aSUw
 v+VCdocmUnYAGAIFsHoORx0YlC8Bl6bTeZyx2fJDCo2Opea1v0wZQGqPU
 Da9lv4IhJyvyys+X7NlEEmkScS61kAdCduaeb9kZ8bqbVs8X8ArqSs9tW g==;
X-CSE-ConnectionGUID: d8AqM34RQoOeeDVyWqUmbQ==
X-CSE-MsgGUID: ZpaTXQ78SnSbahboGl8rkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="60552437"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="60552437"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 09:23:54 -0700
X-CSE-ConnectionGUID: Nv53fKMORv6k3miDZS3/TA==
X-CSE-MsgGUID: hv6SIM+OSHq0gn/X5qsuGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="151945049"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.188])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 09:23:53 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: xorg-announce@lists.x.org
Cc: xorg@lists.x.org,
	igt-dev@lists.freedesktop.org
Subject: [ANNOUNCE] igt-gpu-tools 2.0
Date: Thu, 13 Mar 2025 17:23:40 +0100
Message-ID: <20250313162342.177960-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

Release 2.00 (2025-03-13)
- -------------------------

General changes:

- - Added Karthik B S as a new maintainer.

Library changes:

- - Added GFX1153 to GFX1150 amdgpu family. (Tim Huang)

- - Improved kernel module un/loading. (Lucas De Marchi)

- - Added ftrace logs at test boundaries. (Umesh Nerlige Ramappa)

- - Improved device scanning used in device filters. (Zbigniew Kempczyński)

- - Add support to check joiner mode limit. (Jeevan B)

- - Updated PCI ids for DG2/MTL/BMG/PTL. (Matt Atwood)

- - Added PTL opencl kernels. (Janga Rahul Kumar and Priyanka Dandamudi)

- - Extended GPGPU compute square kernel for PTL. (Sai Gowtham Ch)

- - Using Long Running mode for GPGPU compute with Xe. (Francois Dugast)

- - Make running under Valgrind quiet. (Tvrtko Ursulin)

Runner changes:

- - Added igt_runner cmdline to results. (Lucas De Marchi)

- - Added printing GPU related facts. (Peter Senna Tschudin)

- - Added kmemleak scans. (Peter Senna Tschudin)

- - Parse results more persistently. (Kamil Konieczny)

Test changes:

- - Improved Xe EUdebug tests. (Dominik Grzegorzek)

- - Improved support for 3d testing on VMs for vmwgfx. (Maaz Mombasawala)

- - Improved Xe debugfs testing. (Pravalika Gurram)

- - Improved amdgpu PCI unplug test. (Vitaly Prosyak)

- - Added support for page queues in amdgpu tests. (Jesse Zhang)

- - New short hibernate subtest in Intel KMS ccs. (Juha-Pekka Heikkila)

- - Renamed test i915_pipe_stress into kms_pipe_stress and added
  support for Xe in it. (Swati Sharma)

- - New test for devcoredump for Xe. (Zhanjun Dong)

- - New DP link training validation of both UHBR and non-UHBR link
  rates over SST and MST configurations. (Kunal Joshi)

- - New test for Frame Buffer Compression (FBC) with dirty rectangles which
  allows FBC to recompress a subsection of a frame. (Santhosh Reddy Guddati)

- - New test for EU stall sampling for Xe. (Harish Chegondi)

- - New test for eudebug/SR-IOV exclusion for Xe. (Christoph Manszewski)

- - New test for PMU (Performance Monitoring Unit) for Xe. (Vinay Belgaumkar
  and Riana Tauro)

- - New test for SRIOV auto-provisioning for Xe. (Marcin Bernatowicz)

- - New equal-throughput validation for VFs in SRIOV. (Marcin Bernatowicz)

- - Improved test documentation. (Katarzyna Piecielska and Swati Sharma)

- - Improved Xe OA test. (Umesh Nerlige Ramappa, Sai Teja Pottumuttu and
  Ashutosh Dixit)

Tools and scripts changes:

- - New tool for measuring display memory bandwidth utilization (Ville Syrjälä)

- - New igt_facts tool for displaying GPU related info. (Peter Senna Tschudin)

- - Power tool renamed to igt_power (Kamil Konieczny)

- - New --pci-slot option in intel_reg for multi-GPU configs. (Łukasz Łaguna
  and Kamil Konieczny)

- - Added kmemleak option to run-tests.sh script. (Peter Senna Tschudin)

And many other bug fixes, improvements, cleanups and new tests.


Aditya Chauhan (1):
      tests/intel/xe_compute*: Fix documentation

Andrzej Hajda (1):
      lib/meson.build: allow build IGT with link time optimization

Animesh Manna (1):
      tests/intel/lobf: Remove lobf supported check

Ashutosh Dixit (2):
      drm-uapi/xe: Sync with OA uapi updates
      drm-uapi/xe: Sync with PXP and EU stall changes

Christoph Manszewski (2):
      lib/xe_eudebug: Export __xe_eudebug_enable_getset
      tests/intel/xe_eudebug_sriov: Add new test for eudebug/SR-IOV exclusion

Daniele Ceraolo Spurio (6):
      lib/igt_kmod: fix check to confirm correct driver unload
      lib/igt_kmod: Drop errno checking from igt_kmod_unbind
      lib/igt_kmod: Do not explicitly unload intel mei driver
      tests/intel/xe_vm: Update first invalid flag number
      tests/intel/xe_create: Stop treating the extension field as MBZ
      tests/intel/xe_exec_queue_property: Update first invalid property value

Dominik Grzegorzek (14):
      tests/xe_eudebug: Convert comments to be C-styled
      lib/xe_eudebug: Use igt_container_of instead of (void *) casting
      lib: Export xe_engine_class_to_str function
      lib/xe_eudebug: Use xe_engine_class_short_string
      lib/xe_query: Fix switch indentation
      tests/xe_eudebug_online: Add default threads_per_eu value for platforms without hwconfig
      tests/xe_eudebug.c: Enhance memory access testcases
      lib/xe_eudebug: Fix 32b compilation warnings/errors
      tests/intel/xe_eudebug_online: Fix 32b compilation warnings
      tests/intel/xe_eudebug_online: Fix 32b compilation errors
      tests/xe_eudebug_online: Ignore stale attention events during single-step
      tests/xe_eudebug_online: Adjust bitmask calculation
      lib: Add variable registers per thread (VRT) setup
      tests/intel/xe_eudebug_online: Set VRT

Dominik Karol Piątkowski (7):
      tests/intel/xe_eudebug: Add basic-vm-bind-ufence-delay-ack test
      tests/intel/xe_eudebug: Add basic-vm-bind-ufence-reconnect test
      tests/intel/xe_eudebug: Add basic-vm-bind-ufence-sigint-client test
      tests/intel/xe_eudebug: Add discovery-race-sigint test
      lib/eudebug: Make debugger thread SIGINTable
      lib/eudebug: Fix xe_eudebug_client_stop corner case
      tests/xe_eudebug_online: Add set-breakpoint-sigint-debugger test

Francois Dugast (13):
      tests/intel/xe_exec_mix_modes: Use IGT comparison functions
      lib/intel_compute: Align objects on 64K for xehp
      lib/intel_compute: Align objects on 64K for xehpc
      lib/intel_compute: Use LR mode for compute when using Xe
      lib/intel_compute: Make loop count a parameter
      lib/intel_compute: Rename variables for input and output data
      lib/intel_compute: Allow the user to provide a vm
      lib/intel_compute: Allow the user to provide a custom compute kernel
      lib/intel_compute: Give option to skip results check
      lib/intel_compute: Allow the user to override input and output addresses
      Revert "lib/intel_compute: Allow the user to override input and output addresses"
      lib/intel_compute: Compare floats with igt_assert_eq_double()
      lib/intel_compute: Align objects on 64K for xelpg

George Zhang (1):
      tests/kms_addfb_basic: Fix addfb25_tests to not require intel

Harish Chegondi (1):
      tests/intel/xe_eu_stall: Add tests for EU stall sampling

Jeevan B (7):
      tests/intel/kms_pm_rpm: Restrict cursor tests to I915 driver
      intel-ci/xe.blocklist: add i915 specific tests
      tests/kms_display_modes: Add check for ≥2 outputs in extended mode test
      lib/igt_kms: Add lib changes to check if joiner is enabled for a pipe
      lib/igt_kms: Add support to check joiner mode limit
      tests/intel/kms_joiner: Add a new test to validate max-non-joiner mode
      tests/intel/kms_pm_dc: Ensure eDP detection before skipping test

Jesse.zhang@amd.com (5):
      lib/amdgpu: Extract PCI device address from file descriptor
      lib/amdgpu: enhance wait memory helper
      lib/amdpgu: fix the hard code when shedule ring.
      lib/amdgpu: Handle -ENODATA in amdgpu_wait_memory
      lib/amdgpu: Add support for page queues in amd_deadlock

Jessica Zhang (1):
      tests/kms_color: Disable CTM at the end of CTM tests

Jonathan Cavitt (3):
      tests/intel/xe_drm_fdinfo: Do not destroy NULL xe_cork
      tests/intel/xe_drm_fdinfo: Do not end NULL xe_cork
      tests/intel/xe_pm_residency: Skip on igt_power_open failure

Juha-Pekka Heikkila (2):
      tests/intel/kms_ccs: add hiberbate test
      tests/intel/kms_ccs: add missed include

Juha-pekka Heikkila (4):
      tests/kms_addfb_basic: fix x-tiled tests for case when there is no x-tile
      tests/intel/kms_draw_crc: fix x-tiled tests for case when there is no x-tile
      tests/kms_cursor_legacy: flip_vs_cursor_busy_crc was requiring any driver but used intel x-tile
      tests/intel/kms_frontbuffer_tracking: fix x-tiled tests for case when there is no x-tile

Kamil Konieczny (8):
      Update MAINTAINERS
      tests/intel/gem_pxp: Fix requirements
      tools: rename power into igt_power
      lib/pciids: update PTL and BMG pci ids
      tests/intel/i915_fb_tiling: convert to subtest basic-x-tiling
      tools: rename lsfacts into igt_facts
      runner: Parse results harder
      Update NEWS, bump version to 2.0

Karthik B S (1):
      tests/intel/kms_test_config.json: Add GPU excluded platform category

Karthik Poosa (1):
      tests/intel: Update sub-category of Xe power management tests

Katarzyna Piecielska (2):
      tests/intel/xe_compute*: Update test documentation
      tests/intel/xe_*: Adjust test documentation

Kunal Joshi (13):
      tests/chamelium/kms_chamelium_hpd: don't unplug multiple times
      tests/intel/kms_dp_linktrain_fallback: refactor find_mst_outputs
      tests/intel/kms_mst_helper: add helper for MST-related functions
      tests/intel/kms_dp_linktrain_fallback: refactor dp-fallback subtest
      tests/intel/kms_dp_linktrain_fallback: fix typo
      tests/intel/kms_dp_linktrain_fallback: add dsc-fallback test
      tests/intel/kms_dp_linktrain_fallback: disable ignore long hpd
      tests/intel/kms_joiner: refactor set_all_master_pipes_for_platform
      tests/intel/kms_joiner_helper: add helper for joiner-related functions
      lib/igt_kms: add function to set link params
      tests/intel/kms_dp_link_training: add tests for UHBR/NON-UHBR over SST/MST
      tests/intel/kms_dp_link_training: do modeset before retraining
      tests/intel/kms_dp_link_training: fix assert for igt_find_all_mst_output_in_topology

Luca Coelho (1):
      tests/kms_plane_scaling: get mode only after setting the output pipe

Lucas De Marchi (23):
      lib/igt_kmod: Remove unused module_ref
      Revert tests/kms_histogram: Fix build breakage
      lib/xe/xe_gt: Fix header guards and boilerplate
      lib/xe: Move functions from xe_util to xe_gt
      lib/xe: Rename xe_is_gt_in_c6()
      lib/xe: Split nsec to ticks abstraction
      lib/xe/xe_spin: Move declarations around
      treewide: s/ctx/cork/ when referring to xe_cork
      tests/intel/xe_drm_fdinfo: Stop asserting on usage percentage
      tests/intel/xe_drm_fdinfo: Also test target class with others-*
      tests/intel/perf_pmu: Drop cpu-hotplug subtest
      runner/settings: Fix code_coverage_script leak
      runner: Free settings at the end
      runner/settings: Deduplicate cleanup
      runner/settings: Use wrapper macros for each type
      runner/settings: Match serialization to parse
      runner/settings: Drop extra strdup
      runner: Fix use of newline on arguments
      runner/settings: Add helpers to serialize/parse array
      runner/settings: Serialize command line
      runner/resultgen: Add cmdline to results.json
      lib/igt_kmod: Stop unloading drm
      tests/intel/i915_module_load: Do not skip on snd

Lukasz Laguna (4):
      lib/xe/xe_sriov_debugfs: Add helper to read VF's configuration data
      lib/xe/xe_sriov_provisioning: Add helper to get VF's provisioned quota
      lib/igt_sriov_device: Add helper to iterate over VFs in specified range
      tests/xe_sriov_auto_provisioning: Add subtest to verify VF's configuration

Maaz Mombasawala (1):
      tests/vmwgfx: Check for 3d support on context and surface creation.

Maciej Patelczyk (2):
      tests/xe_eudebug_online: correct calculate the time diff
      tests/xe_eudebug_online: breakpoint-many-sessions-* add delay before resume

Marcin Bernatowicz (21):
      lib/xe/xe_sriov_debugfs: Add debugfs get/set functions for u32, u64, bool
      lib/xe/xe_sriov_debugfs: Add validation for provisioned ranges
      lib/xe/xe_sriov_provisioning: Add accessors for quota/spare attributes
      lib/xe/xe_sriov_provisioning: Add shared resource provisionability check
      lib/igt_sriov_device: Add helper functions for VF range validation
      tests/xe_sriov_auto_provisioning: Add tests for SR-IOV auto-provisioning
      tests/xe_sriov_auto_provisioning: Add 'extended' command line option
      tests/intel/xe_sriov_flr: Add parallel FLR subtest for SR-IOV VFs
      tests/intel/xe_sriov_flr: Add flr-twice subtest
      lib/xe/xe_sriov_provisioning: Add scheduling attributes accessors
      lib/xe/xe_sriov_provisioning: Add helper to check default scheduling attributes
      tests/xe_sriov_scheduling: VF equal-throughput validation
      tests/xe_sriov_scheduling: nonpreempt-engine-resets subtest
      tests/xe_sriov_scheduling: Get job timeout from sysfs
      tests/xe_oa: Skip when no OA units available
      lib/igt_sriov_device: Add intel_is_vf_device helper
      tests/xe_exec_capture: Skip checks on VF devices
      tests/intel/kms_dp_link_training: Restrict to Intel GPUs
      tests/intel/kms_dp_link_training: Add missing DRIVER_XE
      tests/intel/xe_drm_fdinfo: Check prerequisites for utilization subtests
      tests/intel/xe_drm_fdinfo: Fail basic_engine_utilization if no utilization data

Matt Atwood (2):
      lib/intel_chipset: add pantherlake definition and support
      lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL

Matthew Auld (2):
      lib/intel_pat: extend for xe3
      tests/intel/xe_pat: extend for xe3

Maíra Canal (1):
      tests/vkms: Delete VKMS test list

Mika Kuoppala (5):
      tests/xe_eudebug: add basic-vm-access-parameters-userptr
      Revert "tests/xe_eudebug: Validate exec queue placements"
      Revert "lib/xe_eudebug: Add support for exec queue placements events"
      Revert "drm-uapi-experimental/xe_drm_eudebug: Sync after exec_queue placement event addition"
      lib/eudebug: Adjust to upstream uapi rebase

Mohammed Thasleem (6):
      tests/kms_histogram: Added IGT support to validate global histogram
      tests/kms_histogram: Add check for libghe version
      tests/intel/kms_frontbuffer_tracking: Skip fbc-* tests on BMG
      tests/intel/kms_dirtyfb: Skip FBC tests on BMG platform
      tests/intel/kms_fbcon_fbt: Skip FBC testing on BMG platform
      tests/kms_display_modes: Remove negative test for extended display

Nakshtra Goyal (1):
      tests/intel/xe_create: Check negative cases for exec_queue create/destroy ioctl

Naladala Ramanaidu (3):
      tests/kms_scaling_modes: Add informative messages for skipped scaling mode tests
      tests/chamelium/kms_chamelium_edid: Fix hotplug detection with connector reprobe
      tests/kms_atomic: Add necessary checks to ensure proper cleanup

Nirmoy Das (2):
      intel-ci/xe.blocklist: Block the updated shrink test
      tests/xe_live_ktest: Add xe_bo_shrink subtest

Oak Zeng (1):
      tests/intel-ci: Fix a syntax err in xe.blocklist.txt

Peter Senna Tschudin (7):
      lib/igt_facts: Library and unit testing for fact tracking
      tools/lsfacts: Add tool for listing facts
      runner/executor: Integrate igt_facts functionality
      runner: Bump network ping deadline to 40 seconds
      runner/kmemleak: library to interact with kmemleak
      runner/executor: Integrate igt_kmemleak scans
      scripts/run-tests.sh: Add support to kmemleak and igt_facts

Pranay Samala (6):
      tests/chamelium/kms_chamelium_edid: Limit the number of EDIDs tested to prevent CI timeout.
      tests/intel/kms_dirtyfb: Add logs to skips
      tests/kms_plane_scaling: Add logs to skips
      tests/kms_cursor_legacy: Reduce debug loglevel dynamically
      tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically
      tests/intel/kms_draw_crc: Add more logs to skips/failure

Pravalika Gurram (9):
      lib/xe/xe_spin: move the spinner related functions to lib
      tests/xe_spin_batch: Add spin-timestamp-check
      tests/intel/xe_vm: Check negative cases for vm_create/destroy ioctl
      tests/intel/xe_debugfs: Extend gt test to check more entries
      tests/intel/xe_vm: Fixed documentation
      tests/intel/xe_wedged: Read wedged_mode debugfs
      tests/intel/xe_debugfs: Improve gt subtest
      tests/intel/xe_exec_capture: Enhance test to check with DUMPABLE flag
      tests/intel/xe_fault_injection: Inject errors during exec queue create IOCTL

Priyanka Dandamudi (6):
      lib/intel_compute: Add ptl library support for wmtp test
      lib/intel_compute_square_kernels: Add PTL opencl kernels
      tests/xe_compute: Update documentation
      lib/intel_chipset.h: Add macro for PTL device id
      tests/intel/xe_compute_preempt.c: Reduced child count for PTL
      tests/xe_fault_injection: Inject error for xe_sync_entry_parse

Riana Tauro (3):
      lib/igt_perf: Use shift parameter for format
      tests/intel/xe_pmu: Add PMU test to validate engine activity stats
      tests/intel/xe_pmu: Add idle engine activity tests

Sai Gowtham Ch (1):
      lib/intel_compute_square_kernels: Extend compute test for ptl

Sai Teja Pottumuttu (5):
      tests/intel/xe_oa: Remove unused function arguments
      tests/intel/xe_oa: Reduce the number of mmap reports checked
      tests/intel/xe_oa: Remove hardcoded time heuristics
      tests/intel/xe_oa: Extend non-zero-reason test
      tests/intel/xe_oa: Don't limit oa-formats to render engine

Santhosh Reddy Guddati (5):
      tests/kms_invalid_mode: Add ultrajoiner support to adjust_mode_clock_too_high
      lib/igt_kms: Backup connector modes before sorting
      tests/intel/kms_joiner: switch modeset between uj and bj
      lib/igt_kms.c: Enforce strict check for bigjoiner_possible
      tests/intel/kms_fbc_dirty_rect: Add FBC dirty rectangle tests

Sebastian Brzezinka (2):
      tests/intel/gem_exec_balancer: Decrease expected load value
      tests/intel/gem_exec_balancer: Decrease required load in `full` test

Swati Sharma (12):
      lib/dsc: Add helper igt_get_dsc_sink_max_slice_count()
      tests/intel/kms_joiner: Add igt_get_dsc_sink_max_slice_count() constraint
      tests/intel/i915_pipe_stress: Add XE support
      tests/intel/i915_pipe_stress: s/i915_pipe_stress/kms_pipe_stress
      tests/intel/kms_pipe_stress: Fix testplan documentation
      tests/intel-ci: Add kms_sysfs_edid_timing to blocklist
      lib/igt_kms: Add func() to read and parse cdclk debugfs
      lib/igt_kms: Add highres() and lowres() func
      tests/intel/kms_cdclk: Add conditions to filter valid outputs
      tests/intel/kms_cdclk: Introduce set_mode()
      tests/intel/kms_cdclk: Use igt_get_max_cdclk()
      tests/kms: Drop 'Functionality' and 'Test category' from documentation

Tejas Upadhyay (5):
      lib/i915_drm_local: Remove macros added via merged kernel
      include/drm-uapi-experimental: Move i915_drm_local.h to drm-uapi-experimental
      include/intel_drm_local.h: Add DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER
      tests/xe/mmap: add tests for pci mem barrier
      tests/intel/xe_create: Add test for low latency hint support

Thomas Hellström (1):
      tests/intel-ci/xe*: Disable a few xe_evict subtests

Thomas Petazzoni (1):
      lib/igt_aux: since procps-ng 4.0.5, PIDS_VAL() takes 3 arguments, not 4

Tim Huang (1):
      lib/amdgpu: add GFX1153 to GFX1150 family

Tom Chung (5):
      tests/amdgpu/amd_vrr_range: Fix panel cannot light up after test
      tests/amdgpu/amd_abm: Disable the ABM after test
      tests/amdgpu/amd_abm: Skip the test if panel does not support ABM
      tests/amdgpu/amd_abm: Fix test failed on self-refresh panel
      tests/amdgpu/amd_replay: Skip test if no DRM DP AUX Interface

Tvrtko Ursulin (2):
      lib/syncobj: Make running under Valgrind quiet
      lib/xe: Make running under Valgrind quiet

Umesh Nerlige Ramappa (17):
      lib/igt_core: Add ftrace logs at test boundaries
      tests/intel/xe_oa: Use static for global variables
      tests/intel/xe_oa: Drop unused macro
      tests/intel/xe_oa: Use period_ns in max_oa_exponent_for_period_lte
      tests/intel/xe_oa: Rename oa_exp_1_millisec to oa_exponent_default
      tests/intel/xe_oa: Use default exponent for some tests
      tests/intel/xe_oa: Use same render copy width and height across tests
      tests/intel/xe_oa: Rewrite the polling small buf test
      tests/intel/xe_oa: Simplify the buffer-fill test
      tests/intel/xe_oa: Use default buffer size for non-zero reason
      tests/intel/xe_oa: Test oa buffer sizes
      tests/intel/xe_oa: Rewrite enable-disable test
      tests/intel/xe_oa: Enable unprivileged-single-ctx-counters and fix it
      tests/intel/xe_oa: Fix mmio_trigger_reports testing
      tests/intel/xe_oa: Set boundaries for OA exponent test
      tests/intel/xe_oa: Do not discard single reports in oa-formats
      tests/intel/xe_oa: Enable OA tests for simulation

Ville Syrjälä (5):
      lib/intel_bufops: Provide pread/pwrite based fallback when we don't have WC
      tests/kms_draw_crc: Test 64bpp
      tests/kms_invalid_mode: Attempt divide-by-zero in drm_mode_vrefresh()
      tools/intel_display_bandwidth: Tool for measuring display memory bandwidth utilization
      tests/intel/kms_draw_crc: Skip formats not supported by the plane

Vinay Belgaumkar (3):
      lib/igt_core: Add tolerance and measured_usleep utils
      lib/igt_perf: Add utils to extract PMU event info
      tests/xe/pmu: Add pmu tests for gt-c6

Vinod Govindapillai (8):
      lib/i915/fbc: fbc psr combo support check helper function
      tests/intel/kms_psr: update to FBC support check
      tests/intel/kms_frontbuffer_tracking: update to FBC support check
      tests/intel/kms_psr2_sf: update to FBC support check
      lib/i915/fbc: fbc psr combo support update for xe3
      tests/intel/kms_dirty-fb: update modifier based on display version for fbc
      tests/intel/kms_fbc_dirty_rect: fix the log level in fbc enabled check
      tests/intel/kms_fbc_dirty_rect: cleanup the dirty rect tests

Vitaly Prosyak (5):
      lib/amdgpu: enhance readability of packet creation logic
      lib/amdgpu: improve pci_unplug test
      tests/amdgpu: find PCI bus, device and function and use it
      amd/lib: refactor function is_reset_enable
      lib/amd: add memleak functions

Zbigniew Kempczyński (4):
      lib/igt_core: fix overflow in micro/nano-seconds calculations
      lib/igt_device_scan: drop device scan cache logic
      lib/igt_device_scan: fix multithreading support in device scanning
      lib/igt_device_scan: limit fetched device attributes from udev

Zhanjun Dong (1):
      tests/intel/xe_exec_capture: Add xe_exec_capture test

Łukasz Łaguna (1):
      tools/intel_reg: Add --pci-slot option

git tag: v2.0

https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-2.0.tar.xz
MD5:  dfd4dd415c3b3e53ddf4d13f4164a62b  igt-gpu-tools-2.0.tar.xz
SHA1: 55a2ee0bfb5f085ef56ba3ed62e156294fb6d75d  igt-gpu-tools-2.0.tar.xz
SHA256: ab060a2652509e3bbaeb19d8b227c3b063074c9a905a37508830360435d2bb8f  igt-gpu-tools-2.0.tar.xz
SHA512: e9eeb15580fb6e7073ad86bad2e8d99ab7823b9e0af0898aefcc2f7080a3890f61abd09d8da0dff8a8e360b2812998a3dceb282408e301b6a692ef364a1d03f3  igt-gpu-tools-2.0.tar.xz
PGP:  https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-2.0.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEETPf8JI3Czo80u+SPwwTEoxBABekFAmfS9vwACgkQwwTEoxBA
Bel2Tw/+MdkgoAL8IBY28cafjGsKNwaO5tF9eiKNLrM2APmSA6C7lnrN+IEFFiI7
11ML+OFz5SoqWthL/PM+prQKaE1kd1Ttj1s51NXYHtW2yiegF2TJ0nXsl47e7NwN
3REriLB+3Axu00ewQGvtatoh3r0rNgaIKWPRXDnNfaCFrRyFARPLL05euZqvFE3E
hsB2IT/ZpKpHEg1DqnrniFj1maow/xWUOgRnq6O2SIwFh1MMLb7yroq7ddo4bPd/
JlQuT+qA60pvSvNV2cBDLh5YHSBPVYhWoP+5nooHo57rW7Og4NHO9BS4PCt6AZ21
9dTzX0oqlxoyW8xq3wnhSeXnC/lfAfx8kHZg/ZSfA+zpClVCiXOQEvlWGF0ew2xs
IREGbsOvNM/oEt3PTr1eTRnB/wuhtyRa1IO149GJDUDn+l1A8faNckNi5d+D5URT
wWNffVNVrLGXbzFQobyz9eftGaqeGJ6quStkKQBmnasq0+0IJHEbnB9r+TfVyOAY
NcemQ1px+pJE3Tr660B51LyYRzIq5kx94Bpx/ZKJuYb1KHtBkw9SyMLwZnHKkKVV
wzmkuRG2o6LxDiwaJDOZBKK6qvgtypBsK3cSH6SDJOhjOtXsc39ITMnRxZ851mbP
35PmNiQ1QKWQ9NPzTfztlkUtE5TktGwXkDRc4vzmSO5p/xbFWcM=
=s3zQ
-----END PGP SIGNATURE-----
