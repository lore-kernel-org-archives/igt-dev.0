Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D83CA0ED3
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 13:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E383F10E7C5;
	Wed,  4 Sep 2024 13:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iIsCvT6d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA63B10E7C5
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 13:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725456146; x=1756992146; h=from:date:message-id:cc:subject;
 bh=tZ1xKjWG+1Qs230m3xebO09T3xHHb2eLFn0dPvoa46g=;
 b=iIsCvT6dwWeLCD8toUR8PKfzbqUUEocaj2eZMot7KQNmGbsnhdAfFN4i
 +ni06stSMrMsnJlYdpfKURJtPBeT3H6AsUU2zW/cA0UEUx908SsY2cKc1
 1DMIO8NnWtszKXE6jhE6N4+rDzpDgJia5vu5n36GsGwU1TT+LhaYtpHQB
 83+PcSbte/IRCH07w74/FpWUGD5OEq5v/blZfY4No/3yM5aB4C4YtRVKg
 32Meb5zNENqB80cBsQL2cty1HSYQ4xIrl8mqfbzAqVZFfhIv/dvpgHYnu
 qN3ODet1kaSY3cHSPGT/E6n/Iw0Mp1BQo5sMqkfw0lGPFvoc/PSNzKh9M g==;
X-CSE-ConnectionGUID: 29rx/envToqxGUviHtRzBw==
X-CSE-MsgGUID: AEcH4QPASoq/6dc0YZzlig==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24225092"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="24225092"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 06:22:25 -0700
X-CSE-ConnectionGUID: qZUizG3/Qr6nrzglNakSjA==
X-CSE-MsgGUID: IYcjqjB6TnSAwjsaIlBDKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="69434255"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 06:22:23 -0700
From: kamil.konieczny@linux.intel.com
Date: Wed, 04 Sep 2024 15:22:21 +0200
Message-ID: <3460d00a58111e7e508eefb3763a1841.kamil.konieczny@linux.intel.com>
Cc: xorg@lists.x.org, igt-dev@lists.freedesktop.org
Subject: [ANNOUNCE] igt-gpu-tools 1.29
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

Release 1.29 (2024-09-04)
- -------------------------

General changes:

- - Added gcc warns: dangling-pointer, int-conversion (Bhanuprakash Modem)

- - More guidelines in CONTRIBUTING. (Louis Chauvet, Kamil Konieczny)

- - Reorganized Tests: Moved all vendor specific tests to their own dir
  (Bhanuprakash Modem)

- - Fix musl/uclibc build (Bernd Kuhls, Stefano Ragni)

Benchmarks changes:

- - New KMS framebuffer stress benchmark. (Arthur Grillo)

- - Added basic Xe support in gem_wsim. (Marcin Bernatowicz)

Documentation changes:

- - Add documentation about cross-builds. (Mauro Carvalho Chehab)

- - Improve tests documentation. (Katarzyna Piecielska)

Library changes:

- - Add Battlemage (BMG) support in xe_pciids.h (Andrzej Hajda)

- - Add amdgpu GFX1152, GFX1150 and gfx12. (Jesse Zhang and Tim Huang)

- - Added inline support for iga64 assembly in GPGPU shader. (Andrzej Hajda)

- - Improved KUnit support. (Janusz Krzysztofik)

- - Enable igt run on security enhanced distros (like Gentoo/Hardened)
  (Matt Turner)

- - Use blitter as a default for all KMS tests. (Juha-Pekka Heikkila and
  Bhanuprakash Modem)

- - Increased MAX supported pipes to 16 (Pipe-A to Pipe-P) (Vignesh Raman)

- - Added generic way to reset sysfs/debugfs attrs to default values upon
  exit. (Ville Syrjälä)

Runner changes:

- - Added hook scripts to igt_runner. (Gustavo Sousa)

Test changes:

- - Added support for Xe in KMS tests. (Swati Sharma, Bhanuprakash Modem et al)

- - Added new subtests and improvements to VRR. (Bhanuprakash Modem, Jeevan B,
  Manasi Navare, Sean Paul et al)

- - Added new subtests to force joiner. (Kunal Joshi)

- - Added fbdev tests to Xe. (Bhanuprakash Modem)

- - Added amdgpu fuzzing tests. (Vitaly Prosyak)

- - Added syncobj_eventfd test. (Simon Ser)

- - Added basic Single-Root IO Virtualization (SRIOV) test. (Katarzyna Dec et al)

- - Added prime test for vmwgfx. (Zack Rusin)

- - Improved core_getversion. (Rob Clark, Helen Koike, Kamil Konieczny)

- - Improved kms_atomic on non-mutable planes. (Melissa Wen)

- - Added and improved Xe tests. (Rodrigo Vivi, Matthew Auld, Zbigniew Kempczyński,
  Francois Dugast, Nirmoy Das, Lucas De Marchi, Janga Rahul Kumar et al)

Tools and scripts changes:

- - New Xe perf/OA tools. (Ashutosh Dixit)

- - New intel_tiling_detect tool. (Zbigniew Kempczyński)

- - New option in lsgpu for printing GPU on PCI bus, working also
  in case when no gpu driver is loaded. (Zbigniew Kempczyński)

- - Added sysfs profiling knob to gputop. (Adrián Larumbe)

- - Support for Xe in gputop. (Lucas De Marchi)

- - Improved generating test lists at compilation time.(Mauro Carvalho Chehab)

- - Improved code coverage. (Mauro Carvalho Chehab)

- - Improved intel_vbt_decode and other intel tools. (Ville Syrjälä,
  Lucas De Marchi, Jani Nikula, Tvrtko Ursulin, Gustavo Sousa et al)


And many other bug fixes, improvements, cleanups and new tests.


Abhinav Kumar (2):
      tests/kms_writeback: fix kms_writeback failure for XRGB8888 only devices
      lib/igt_kms: move setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback

Aditya Chauhan (2):
      tests/intel-ci: Move fault_mode tests to the end of xe ffb
      intel-ci/fast-feedback.testlist: Add debugfs_test@sysfs

Adrián Larumbe (2):
      lib: Add DRM driver sysfs profiling knob toggling functions
      tools/gputop: toggle sysfs profiling knob if available for device

Akshata Jahagirdar (9):
      lib: Add blt command properties for lunarlake
      lib/intel_blt: Update calculation of ccs_size and size_of_ctrl_copy
      lib/intel_pat: Add uc_comp pat_index
      lib/intel_blt: Update caching mode and pat_index
      lib/xe/xe_util: Align obj size before bind/unbind
      tests/intel/xe_ccs: Add compression support for Lunarlake
      tests/intel/xe_ccs: fix block-multicopy-inplace subtest
      lib/intel_blt: Add helper function to ensure platform has flat-ccs enabled
      tests/xe_ccs: Update compression check based on flat-ccs enablement

Alex Hung (9):
      lib/igt_fb: use the entire 32 bit for fnv1a_crc
      lib/igt_fb: add 10 bits (XRGB2101010) supports in fnv1a_crc
      tests/kms_writeback: support DRM_FORMAT_XRGB2101010 for writeback
      lib/amd: check output has hpd before trigger hotplug
      tests/amdgpu/amd_vrr_range: Skip on unsupported connector types
      tests/amdgpu/amd_dp_dsc: Correct code style problems
      lib/amd: Return false if dp_fec or dp_dsc is not supported
      tests/amdgpu/amd_dp_dsc: Check connector's dsc capability
      tests/kms_writeback: Set atomic and writeback_connector early

Andrzej Hajda (12):
      lib/igt_aux: fix roundup_power_of_two implementation
      lib/intel_batchbuffer: allow GTT size be not power of 2
      tests/intel/xe_exec_fault_mode: enable copy engine testing for invalid-va
      lib: sync xe_pciids.h with kernel
      lib/intel_chipset: add Battlemage support
      lib/gpu_cmds: add Xe_LP version of emit_vfe_state
      lib/gpgpu_shader: tooling for preparing and running gpgpu shaders
      lib/gpgpu_shader: add inline support for iga64 assembly
      lib/igt_sysfs: add helpers to access engine sysfs directory
      intel/xe_exec_sip: add shader sanity test
      lib/gpgpu_shader: add support for PVC and MTL
      tests/intel/xe_vm: initialize bind_ops.extensions field

Ankit Nautiyal (2):
      lib/igt_kms: Fix typo in documentation
      tests/intel/kms_dsc: Use high resolution mode for output format subtests

Anshuman Gupta (4):
      test/intel/xe_guc_pc: Add debug message for gt freq
      test/xe_pm: Add exit handler to close fw handle
      lib/igt_pm: Add helper to get/set auto_suspenddelay_ms
      tests/xe_pm: Add d3-mmap IGT test

Arjun Melkaveri (1):
      lib/intel_batchbuffer: Add Meteorlake gpgpu fill entry

Arthur Grillo (3):
      benchmarks: Add KMS framebuffer stress benchmark
      lib/igt_kms: Enable DRM_CLIENT_CAP_ATOMIC before enabling DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
      igt: Remove duplicate igt_display_require() calls

Ashutosh Dixit (29):
      tests/xe: Remove xe_perf_pmu
      drm-uapi: sync with drm-next f112b68f273f
      lib/i915/perf: Accumulate clocks for MPEC format too
      lib/xe/oa: Import OA metric generation files from i915
      lib/xe/oa: Add LNL metric guids
      lib/xe/oa: Add OA LNL metrics (oa_lnl.xml)
      lib/xe/oa: Add truncated legacy Xe1 metrics XML's
      lib/xe/oa: Generate LNL metrics/registers files
      lib/xe/oa: Switch generated files to Xe namespace
      drm-uapi/xe: Sync with Perf/OA changes
      lib/xe: Complete xe_oa lib functionality
      tests/intel/xe_query: Add OA units query test
      lib/xe/oa: Add xe_oa_data_reader to IGT lib
      tools/xe-perf: Add xe_perf_recorder
      tools/xe-perf: xe_perf_reader, xe_perf_control and xe_perf_configs
      drm-uapi/xe: Sync with Perf/Observation layer uapi updates
      lib/xe/oa: Add PVC support
      tests/intel/xe_oa: Add first tests
      tests/intel/xe_oa: Add some negative tests
      tests/intel/xe_oa: Add "oa-formats" subtest
      tests/intel/xe_oa: Add oa exponent tests
      tests/intel/xe_oa: buffer-fill, non-zero-reason, enable-disable
      tests/intel/xe_oa: blocking and polling tests
      tests/intel/xe_oa: OAR/OAC tests
      tests/intel/xe_oa: Exclusive/concurrent access, rc6 and stress open close
      tests/intel/xe_oa: add remove OA config tests
      tests/intel/xe_oa: OA buffer mmap tests
      tests/intel/xe_oa: Register whitelisting and MMIO trigger tests
      tests/intel/xe_oa: Drop "xe-ref-count" subtest

Aurabindo Pillai (5):
      lib/amdgpu: Remove unused struct
      llib/amd: Update function documentation
      lib/amd: improve readablity for MALL capability check
      lib/amd: Add check for SubVP feature status
      test/amdgpu: Add test for Sub-viewport

Badal Nilawar (6):
      tests/intel/hwmon: Scale hwmon tests to support xe kmd
      test/intel/xe_guc_pc: Nuke freq_range_exec, freq_fixed_exec tests
      tests/intel/xe_gt_freq: Fix freq_low_max test
      test/intel/xe_gt_freq: Remove act freq check from freq_low_max test
      tests/intel/xe_pm: Install fw close exit handler before rpm tests
      tests/intel/xe_pm: Extend mocs-rpm test to support D3Cold

Balasubramani Vivekanandan (2):
      tests/intel/xe_create: Don't assert on presi execution
      tests/intel/xe_create: Remove the elapsed time validation

Bernd Kuhls (2):
      build: check that outb is present in io.h
      lib/igt_aux.h: Fix musl build

Bhanuprakash Modem (112):
      tests/i915/kms_ccs: Add XE support
      tests/i915/kms_fbcon_fbt: Add XE support
      intel-ci/xe: Update kms blocklist documentation
      intel-ci/xe: Update XE kms blocklist
      lib/igt_fb: Use small case for modifier name
      lib/igt_kms: Expose helper to convert rotation to string
      tests/intel/kms_ccs: Rename subtests
      tests/kms_rotation_crc: Use helpers from lib
      tests/intel/pm: Separate display specific tests from i915_pm_rpm
      tests/intel/pm_rpm: Fix CI with renamed tests
      tests/intel/kms_pm_lpsp: Test optimization
      tests/intel/kms_pm_lpsp: Fix Bigjoiner checks
      lib/kms: Fix the missing documentaion for KMS library
      tests/kms: Use drm_close_driver() to close the drm fd
      tests/i915/kms_fb_coherency: Add XE support
      tests/intel-ci: Drop kms_fb_coherency test from XE blocklist
      lib/intel_aux_pgtable: Add XE support for pagetable mapping
      tests/intel/kms_ccs: Avoid i915 calls on XE device
      tests/intel/kms_pm_lpsp: Fix test constraint for bigjoiner
      Revert "syncobj_timeline: don't expect EINVAL for WAIT_UNSUBMITTED, | WAIT_AVAILABLE"
      tests: s/i915_pipe_output_combo_valid/intel_pipe_output_combo_valid/
      lib/igt_kms: s/is_i915_device/is_intel_device
      tests/i915/kms_big_joiner: Fix Bigjoiner checks
      tests/kms_flip: Fix Bigjoiner checks
      tests/kms_setmode: Fix Bigjoiner checks
      lib/igt_kms: Don't read max dotclock on non-display platforms
      lib/igt_draw: Check for Rendercopy support
      tests/intel/kms_fbt: Use blitter as a default draw method
      tests/intel/kms_fbt: Fill fb region with requested draw method
      tests/intel/kms_dirtyfb: Use blitter if rendercopy isn't present
      tests/intel/kms_dirtyfb: Restructure dynamic subtests
      tests/intel/kms_psr: Use blitter if rendercopy isn't present
      tests/intel/kms_big_joiner: Fix dangling pointer
      tests/kms/testplan: Move testplan documentation to beginning of the file
      tests/kms/testplan: Regroup testplan documentation
      tests/kms/testplan: Optimize KMS testplan documentation
      tests/kms/testplan: Fix Mega Feature in testplan documentation
      tests/kms/testplan: Avoid duplicate names on Mega feature vs Functionality
      tests/intel/kms_pm_lpsp: Use lib helper to iterate connector modes
      tests/kms_addfb_basic: Fix testplan documentation for tiled tests
      tests/intel-ci/xe: Drop unsupported tests from XE BAT
      tests/intel-ci/xe: Add unsupported tests to XE blocklist
      intel-ci/xe.blocklist: Update PSR subtests
      tests/kms_vrr: Use lib helper to print connector modes
      tests/kms_vrr: Clear VRR before exit
      tests/kms_vrr: Move all config constaints to new function
      tests/kms_vrr: Fix pipe/output combo validity constraint
      tests/kms_vrr: Add new subtest to switch RR without modeset
      tests/kms_vrr: Add new subtest for DRRS without modeset
      tests/kms_vrr: New subtest for toggle VRR during fastsets
      lib/i915/intel_drrs: Fix igt helper to get drrs status
      tests/intel/kms_frontbuffer_tracking: Drop unused macros
      tests/intel/kms_frontbuffer_tracking: Re-use devid & display_ver
      tests/intel/kms_dirtyfb: Fix few fixtures
      tests/kms_vrr: Tweak flipline subtest
      tests/kms_vrr: Enhance flip accuracy measurement
      tests/intel/i915_suspend: Fix WARNs of invalid fd
      lib/igt_draw: Fix the usage of FB width & height
      benchmarks/kms_vblank: Add XE support
      lib/i915/intel_drrs: Update DRRS capability check
      tests/intel/kms_dirtyfb: Fix DRRS status check
      tests/intel-ci/xe: Block PSR + DRRS tests
      tests/intel-ci: Block PSR + DRRS tests
      tests/intel-ci/xe: Block pc8-residency tests on XE
      tests/intel-ci: Drop few core tests from XE BAT
      tests/kms_bw: Fix the condition check for max pipe count
      tests/intel/kms_big_fb: Fix width calculation while creating the intel buf
      meson: Turn on few warns
      tests/intel/xe_module_load: Unload module if loaded with modparams
      tests/fbdev: Fix fd closure
      tests/fbdev: Add testplan documentation
      tests/intel/kms_test_config: Add fbdev tests to testplan
      tests/intel-ci/xe: Drop fbdev tests from blocklist
      tests/intel-ci/xe: Add fbdev tests to XE BAT
      tests/intel-ci: Update blocklists
      lib/igt_kms: Check validity of the selcted pipe/output combo
      tests/kms: Drop redundant check for pipe/output combo validity
      tests/chamelium: Use lib helper to check the pipe/output combo validity
      tests/intel/kms: Use lib helper to check the pipe/output combo validity
      tests/kms_dither: Use lib helper to check the pipe/output combo validity
      tests/kms_hdr: Use lib helper to check the pipe/output combo validity
      tests/intel/kms_fence_pin_leak: Test cleanup
      tests/intel/kms_pwrite_crc: Test cleanup
      tests/kms_tiled_display: Test cleanup
      tests/kms_tv_load_detect: Test cleanup
      tests/kms_universal_plane: Test cleanup
      tests/kms_vrr: New subtest for CMRR
      tests/intel-ci: Block unsupported KMS tests for i915
      tests/panfrost: Move Panfrost tests to new dir
      tests/msm: Generate MSM test bins in new dir
      tests/kms_hdr: Fix bpc-switch subtests
      tests/kms_hdr: Add more logs to skips
      tests/kms_vrr: Skip low RR mode check for seamless-virtual subtest
      tests/kms_vrr: Fix hardcoded step size
      tests/intel-ci: Update i915 blocklist
      lib/igt_kms: Format cleanup in DRM mode printing
      tests/kms_color: Add connector name to dynamic subtests
      lib/igt_kms: Split the bigjoiner check into multiple
      lib/igt_kms: Update force joiner debugfs check
      lib/igt_kms: New helper to check force joiner status
      lib/igt_kms: Force joiner support in bigjoiner checks
      tests/intel/kms_pm_lpsp: Force joiner support in bigjoiner checks
      tests/kms_flip: Force joiner support in bigjoiner checks
      tests/kms_setmode: Force joiner support in bigjoiner checks
      tests/kms_vrr: Cleanup in creating the virtual mode
      tests/intel-ci/xe: Block kms_rmfb@close-fd test
      Revert "tests/amdgpu: Add queue reset test"
      tests/kms: Apply igt.cocci transforms
      tests/kms_color: Add more logs to skips
      tests/kms_dither: Add more logs to skips
      tests/kms_vblank: Add more logs to skips
      tests/kms_vrr: Add more logs to skips

Bommu Krishnaiah (5):
      drm-uapi/xe: add exec_queue_id member to drm_xe_wait_user_fence structure
      drm-uapi/xe: Don't wait on user_fence during exec queue reset
      tests/xe_waitfence: remove invalid_engine subtest from xe_waitfence
      tests/xe_waitfence: Removed drm_xe_sync data in exec_queue_reset_wait
      tests/xe_waitfence: Removed duplicate code in waitfence

Brian Welty (4):
      lib/xe_ioctl: Add __xe_wait_ufence()
      tests/intel/xe_exec_reset: Fix cm-gt-reset
      lib/xe_query: Fix xe_supports_faults()
      tests/intel/xe_exec_fault_mode: Fix misuse of __xe_wait_ufence

Chaitanya Kumar Borah (4):
      lib/i915/perf: include i915_pciids_local.h
      lib: Add non-kernel macros to i915_pciids_local.h
      lib: sync i915_pciids.h with kernel
      lib: Add ARL-S PCI ID for perf tests

Chris Wilson (2):
      intel/gem_exec_whisper: Limit workload
      tests/intel/gem_mmap_offset: Partial mmap and munmap

Christoph Manszewski (1):
      tests/intel/xe_vm: Add 'partial-unbinds' subtest

Daniel Mrzyglod (3):
      tests/intel/xe_waitfence: add subtest with provided engine class instance
      intel-ci/xe-fast-feedback: Add xe_waitfence@engine
      lib/igt_sriov_device: add helper for checking if VF DRM driver is probed

Daniele Ceraolo Spurio (1):
      tests/xe_huc_copy: Handle multiple GTs

David Kershner (1):
      tests/intel: Add Xe peer2peer test

Dominik Grzegorzek (5):
      lib/intel_batchbuffer: Use COMPUTE instead of RENDER engine for Xe if missing
      lib/gpu_cmds: be ready to use xe2 gpgpu fill on newer platforms
      lib/gpgpu_shader: Fix iga64 compilation warning
      lib/gpgpu_shader: Fix write dword shader
      lib/gpgpu_fill: Write kernel using inline iga64 api

Dominik Karol Piątkowski (5):
      lib/igt_device_scan: Introduce filtering out non-PCI devices
      lib/drmtest: Introduced drm_open_driver_another
      lib/igt_multigpu: Introduce library for multi-GPU scenarios
      lib/gpu_cmds: Fix hardcoded buffer size
      lib/gpu_cmds: Typo fix

Drew Davenport (1):
      tests/kms_atomic_transition: Address test flakiness

Erik Kurzinger (2):
      syncobj_timeline: don't expect EINVAL for WAIT_UNSUBMITTED, | WAIT_AVAILABLE
      syncobj_timeline: don't expect EINVAL for WAIT_UNSUBMITTED | WAIT_AVAILABLE

Francois Dugast (41):
      tests/intel/xe_query: Print XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY value
      drm-uapi/xe_drm: Separate VM_BIND's operation and flag, align with latest uapi
      drm-uapi/xe_drm: Remove MMIO ioctl and align with latest uapi
      drm-uapi/xe: Remove useless XE_QUERY_CONFIG_NUM_PARAM
      drm-uapi/xe: Remove unused inaccessible memory region
      drm-uapi/xe: Remove unused QUERY_CONFIG_MEM_REGION_COUNT
      drm-uapi/xe: Remove unused QUERY_CONFIG_GT_COUNT
      drm-uapi/xe: Drop interrupt pmu event
      drm-uapi/xe: Add check for access counter granularity
      drm-uapi/xe: Add missing DRM_ prefix in uAPI constants
      drm-uapi/xe: Add _FLAG to uAPI constants usable for flags
      drm-uapi/xe: Change rsvd to pad in struct drm_xe_class_instance
      drm-uapi/xe: Extend drm_xe_vm_bind_op
      drm-uapi/xe: Reject bo creation of unaligned size
      drm-uapi/xe: Align on a common way to return arrays (memory regions)
      drm-uapi/xe: Align on a common way to return arrays (gt)
      drm-uapi/xe: Align on a common way to return arrays (engines)
      drm-uapi/xe: Split xe_sync types from flags
      drm-uapi/xe: Kill tile_mask
      drm-uapi/xe: Crystal Reference Clock updates
      drm-uapi/xe: Add Tile ID information to the GT info query
      drm-uapi/xe: Fix various struct padding for 64b alignment
      drm-uapi/xe: Move xe_exec after xe_exec_queue
      drm-uapi/xe: Remove unused extension definition
      drm-uapi/xe: Kill exec_queue_set_property
      drm-uapi/xe: Align header with current kernel uAPI
      drm-uapi/xe: Remove DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
      drm-uapi/xe: Remove DRM_XE_UFENCE_WAIT_MASK_*
      drm-uapi/xe: Remove PMU from Xe till uapi is finalized
      drm-uapi/xe: Ensure every uapi struct has drm_xe prefix
      drm-uapi/xe: Update header after documentation updates
      lib/intel_compute: Do not skip test with Xe on DG2
      drm-uapi/xe: Remove unused flags
      drm-uapi/xe: Add test to query GuC firmware submission version
      drm-uapi/xe: Add test to query HuC firmware version
      drm-uapi/xe: Align header with drm-xe-next
      drm-uapi/xe: Define topology types as indexes rather than masks
      drm-uapi/xe: Restore flags VM_BIND_FLAG_READONLY and VM_BIND_FLAG_IMMEDIATE
      drm-uapi/xe: Expose the L3 bank mask
      lib/xe/xe_query: Add L3 bank mask test
      tests/intel/xe_exec_mix_modes: Add new tests for parallel execution

Girotra Himanshu (1):
      tests/intel-ci: Add xe_vm large subtest to BAT

Gustavo Sousa (10):
      tests/intel/kms_frontbuffer_tracking: Invalidate cached stuff
      igt_core: Update doc on generated test-list.txt
      runner: Remove useless null check for delim in job_list_from_test_list
      tools/dpcd_reg: Advertise the dump command in usage text
      igt_hook: Add feature
      runner: Make it easier to extend argv
      runner: Add option --hook
      igt_hook: Implement and use set_fake_argv() in test
      igt_hook: Allow multiple hook descriptors
      runner: Allow multiple --hook options

Hamza Mahfooz (1):
      tests/amdgpu: refactor the ABM test to use the new sysfs interface

Helen Koike (2):
      lib/drmtest: add igt_debug when forced and dev_name doesn't match
      core_getversion: drop unused assert

Hersen Wu (8):
      tests/kms_cursor_crc: Fix cursor crop on AMD gpu
      tests/kms_cursor_crc: Fix test intermittent failures on AMD gpu
      tests/amdgpu/amd_link_settings: Fix run eDP link training with unsupported link rate
      lib/igt_amd: add debugfs disallow edp enter psr
      tests/amdgpu/amd_bypass: Fix psr edp rx crc read timeout
      tests/amdgpu/amd_ilr: Fix psr eDP crc read timeout
      tests/amdgpu/amd_multidisplay_modeset: Run mode set and display enable for multidisplays
      tests/amdgpu/amd_ilr: Fix eDP PSR not be re-enabled after test

Himanshu Girotra (2):
      tests/intel-ci: Unblock core hotunplug test
      tests/intel-ci: Addback evict & threads tests to BAT

Jagmeet Randhawa (4):
      lib/gpgpu_fill: Add support for Xe2 platforms
      tests/intel/xe_exec_store: account for prefetch on Xe2
      tests/intel/xe_vm: Fix WB caching PAT index for coherency mode
      lib/xe/xe_spin: Improve description and fix typos

Jakub Kolakowski (1):
      tests/intel-ci/xe-fast-feedback: Add SR-IOV tests

Janga Rahul Kumar (24):
      lib/intel_compute: Fix Incorrect array size for XEHPC platforms
      tests/intel/xe_debugfs: Check tile_count info
      tests/intel/xe_vm: Correct stride to avoid address range collision
      tests/intel/xe_waitfence: Add invalid-flag subtest
      tests/intel/xe_waitfence: Add invalid-ops subtest
      tests/intel/xe_waitfence: Add invalid-engine subtest
      lib/intel_compute: Rename compute state addresses
      lib/intel_compute_square_kernels: Add xe2lpg compute sqaure kernel
      lib/intel_compute: Add XE2 compute implementation
      tests/xe_compute: Update documentation regarding test requirements
      tests/intel/xe_live_ktest: Add mocs kunit test
      lib/intel_compute: Fix incorrect check for opencl kernel support
      tests/intel/xe_exec_store: Remove redundant code
      opencl/compute_increment_kernel: Add opencl increment kernel
      lib/intel_compute_square_kernels: Add xe2lpg wmtp sip and long running opencl kernel
      lib/intel_compute: Add LNL compute preempt library support
      tests/intel/xe_compute_preempt: Add compute preempt test
      tests/intel/xe_compute_preempt: Add compute threadgroup preempt test
      lib/intel_compute: Add documentation of global workgroup size
      tests/intel/xe_debugfs: Extend gt test to check mocs entry
      tests/intel/xe_pm: Add mocs runtime suspend resume test
      tests/intel/xe_pm: Add mocs S2-idle/S3/S4 suspend resume test
      tests/intel/xe_debugfs: Extend gt test to check pat entry
      tests/intel/xe_pm: Disable display for mocs-rpm test

Jani Nikula (17):
      lib: sync i915_pciids.h with kernel commit 432ed92bfb55
      lib: sync i915_pciids.h with kernel commit 41c0f8a36f15
      lib: sync i915_pciids.h with kernel commit 7b43a37348b7
      lib: sync i915_pciids.h with kernel commit 5c8c22adc802
      lib: sync i915_pciids.h with kernel commit aa3d586e1624
      lib: sync i915_pciids.h with kernel commit bfbda4722767
      lib: sync i915_pciids.h with kernel commit 7858cc0b55e3
      lib: sync i915_pciids.h with kernel commit d2c4b1db1c4f
      lib: sync i915_pciids.h with kernel commit cfa7772880f8
      lib: switch i915_pciids_local.h to xe driver style PCI ID macros
      tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit d9981f36e4f3
      tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit 7234f948b58b
      tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit 6ac67ccf4c89
      tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit 8e26690851f9
      tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit cd6891f8e371
      lib/xe/oa: simplify device id array initialization
      lib/intel_device_info: use dedicated macro for struct pci_id_match init

Janusz Krzysztofik (50):
      lib/kunit: Drop unused file stream
      lib/kunit: Stop loading kunit module explicitly
      lib/kunit: Fix struct kmod_module kunit_kmod not freed
      lib/kunit: Optimize calls to igt_success/skip/fail()
      lib/kunit: Fix illegal igt_fail() calls inside subtest body
      lib/ktap: Make sure we fail on premature cancel
      lib/ktap: Drop checks for EINTR on read() failures
      lib/kunit: Cancel KTP parser on module load failure
      lib/ktap: Drop is_running flag
      lib/ktap: Read /dev/kmsg in blocking mode
      lib/kunit: Fail / skip on kernel taint
      lib/ktap: Use IGT linked lists for storing KTAP results
      lib/ktap: Reimplement KTAP parser
      lib/kunit: Load test modules in background
      lib/kunit: Strip "_test" or "_kunit" suffix from subtest names
      lib/ktap: Improve TODO workaround description
      lib/kunit: Fix handling of potential errors from F_GETFL
      lib/kunit: Be more verbose on errors
      lib/kunit: Fix misplaced igt_kunit() doc
      lib/kunit: Parse KTAP report from the main process thread
      lib/kunit: Omit suite name prefix if the same as subtest name
      tests/kms_selftest: Let subtest names match suite names
      lib/kunit: Provide all results cleanup helper
      lib/kunit: Prepare for KTAP parsing after modprobe completed
      lib/kunit: Fetch a list of test cases in advance
      lib/kunit: Execute kunit test cases only when needed
      lib/kunit: Enter legacy path only if applying filters fails
      lib/kmode: Prepare open_parameters() helper for reuse by kunit
      lib/kunit: Unload base KUnit module only before reloading it
      lib/kunit: Support writable filter* parameters of kunit module
      lib/kunit: Report early kernel taints explicitly
      lib/kunit: Process module remove error after list errors
      lib/kunit: Fix API documentation
      lib/kunit: Perform test suite filtering on the kernel side
      lib/kunit: Store igt_ktap_results pointer in a central location
      lib/kunit: Let igt_ktap_free() take care of pointer reset
      lib/kunit: Time out promptly on missing KTAP report
      lib/kunit: Execute test cases synchronously
      lib/kunit: Minimize code duplication
      lib/kunit: Read results from debugfs
      tests/gem_ctx_exec: Notify of failed preempt timeout updates
      lib: Add more debug messages to error paths
      lib/gem_engine_topology: Fix premature break from primary find loop
      lib/gem_engine_topology: Simplify the method of opening a primary
      lib/gem_engine_topology: Fix broken compare of device links
      lib/kunit: Fix selective execution of test cases
      lib/kunit: Drop 'suite' from __igt_kunit arguments list
      lib/kunit: Improve a comment on action=list parameter
      tests/device_reset: Wait for device nodes to re-appear
      tests/core_hotunplug: Fix inline comment on missing device nodes

Jari Tahvanainen (1):
      tests/intel/i915_test_config: align JSON documentation with xe

Jeevan B (12):
      tests/kms_setmode: Update test description
      tests/intel/kms_psr: fix subtest naming
      tests/intel/kms_psr: Add FBC support to PSR/PSR2/PR tests
      tests/intel/kms_psr2_sf: Add FBC support to PSR2 tests
      tests/intel/kms_psr2_sf: Fix primary_format setting
      tests/intel/kms_psr2_sf: Skip the test for bigfb with FBC enabled
      tests/intel/kms_pm_dc: Add a new test to validate the deep sleep state during extended vblank
      lib/igt_psr: Added library functions for early transport
      tests/intel/kms_psr2_sf: Add checks for early transport
      lib/igt_kms: Added library functions for LOBF status
      tests/kms_vrr: Add new test to validate LOBF
      tests/kms_vrr: Grammatical correction in igt_describe

Jesse Zhang (24):
      lib/amdgpu: Fix family id failed during initialization
      tests/amdgpu: skip CE subtest for gfx11
      lib/amdgpu: add shaders for gfx11
      tests/amdgpu: add reset test
      tests/amdgpu: add pstate test
      tests/amd_dispatch: add negative test
      tests/amd_dispatch: add negative test for SDMA
      tests/amd_security: add secure write test for gfx
      lib/amdgpu: add GFX1150 chips for IGT tests
      tests/amdgpu: fix VM test issue
      tests/amdgpu/amd_vm: fix vm test issue
      tests/amd_security: fix secure bounce test
      lib/amdgpu: add GC 11.5.1 to GC 11.5.0 family
      tests/amd_basic: fix eviction test failure
      tests/amdgpu/amd_deadlock: run only on GPUs supporting reset
      lib/amdgpu: add gfx12 family id
      lib/amdgpu: add gfx12 to amd_dispatch test
      lib/amdgpu: fix gfx11 issue about amd_dispatch
      tests/amdgpu: add amd dispatch subtest
      lib/amdgpu: fix amd dispatch issue
      tests/amdgpu: Add queue reset test
      tests/amd_deadlock: add bad memory test for compute
      tests/amdgpu: move bad mem compute test to amd deadlock
      tests/amd_dispatch: fix KGQ hang test

Jesse.zhang@amd.com (7):
      tests/amdgpu: add KGQ test in queue reset
      tests/amd_queue_reset: fix dynamic subtest issue for amd queue reset
      tests/amdgpu: add timeout for queue reset
      tests/amdgpu: Fix unknown subtest issue in queue reset test
      lib/amdgpu: Enhanced SDMA negative test interface
      tests/amd_deadlock: add sdma negative sub tests
      tests/amd_deadlock: fix sdma error type

John Harrison (7):
      tests/intel/gem_exec_schedule: Update for MTL RCS/CCS w/a
      tests/intel/gem_watchdog: Reduced timeouts for worst case scenario
      tests/intel/gem_spin_batch: Skip compute engines on MTL due to w/a
      tests/intel/gem_exec_schedule: Add w/a tag to prior update for MTL RCS/CCS w/a
      tests/intel/gem_exec_capture: Check for partial register captures
      tests/intel/xe_query: Fail on unknown hwconfig entries
      tests/intel/*_query: Add support for new hwconfig table entry

Jonathan Cavitt (9):
      tests/intel/xe_vm: Do not error on -ECANCELED
      tests/xe_create: Use separate VMs per process
      tests/intel/xe_exec_reset: Do not validate data on GT reset
      tests/xe_spin_batch: Correct xe_vm_bind_async usage
      tests/xe_spin_batch: Sync after vm_bind_async
      lib/xe/xe_query: return errno from xe_supports_faults check
      tests/intel/xe_exec_fault_mode: account for EBUSY in support check
      lib/xe: Add sync and async xe_force_gt_reset options
      test/intel/xe_exec_reset: Synchronize cm-gt-reset gt resets

Jonathan-Cavitt (1):
      tests/intel/gem_spin_batch: Skip compute engines on DG2 due to w/a

José Roberto de Souza (4):
      xe/oa: Fix invalid escape warnings
      xe/oa/mdapi-xml-convert: Add support for 576B_PEC64LL format
      xe/oa: Regenerate oa-lnl.xml now parsing all counters
      xe/oa/oa-metricset-codegen: Fix XE_OA_FORMAT_PEC64u64 offsets

Jouni Högander (12):
      tests/kms_addfb_basic: Skip not relevant subtests for Xe
      tests/kms_pm_dc: Ensure PSR is enabled
      tests/kms_dirtyfb: Ensure PSR is enabled
      tests/intel/kms_fbt: Skip fbcpsr tests on Wa_14016291713
      tests/intel/kms_fbt: Remove checking display_ver for fpcpsr tests
      lib/igt_psr: Set Panel Replay disable bit for PSR modes
      lib/igt_psr: Psr status debugfs interface print "enabled" not "Enabled"
      lib/igt_psr: Handle PR_MODE2_SEL_FETCH and eDP PR_* in psr active check
      tests/intel/kms_psr_stress_test: Provide output to psr_wait_entry
      tests/kms_psr2_sf: Use stored psr mode instead of PSR_MODE_2_SEL_FETCH
      lib/igt_psr: Fix PR_MODE sink support check
      lib/igt_psr: Adjust igt_wait intervals

Juha-Pekka Heikkila (18):
      lib/xe: on xe driver use blitter with all tiling
      lib/igt_fb: on Xe driver take into account adlp with no extended block copy
      Revert "scripts/test_list.py: fix and simplify missing doc check"
      tests/kms_plane: test odd size planar yuv
      tests/intel/kms_ccs: Add Xe2 ccs crc tests
      lib/igt_fb: on Xe device don't apply legacy blitter rules
      tests/intel/kms_ccs: add access to control surface on xe2
      lib/igt_fb: fix intel modifiers for fb copying on xe driver
      tests/kms_plane_scaling: reduce unnecessary work
      lib/igt_fb: Mark Xe framebuffers as slow access
      lib/igt_fb: make blt_compression_format function more readable
      lib/igt_fb: Sanitize blt_fb_init
      lib/igt_fb: separate intel blitter context setup from blitter function
      lib/igt_fb: put intel blt cleanup into its own function
      lib/igt_fb: unify intel blitter fb block copies between xe and i915
      drm/fourcc: Import drm_fourcc header from commit 5151fa3 ("drm/fourcc: define Intel Xe2 related tile4 ccs modifiers")
      lib/igt_fb: add Xe2 ccs modifier support
      tests/intel/kms_ccs: Add testing for Xe2 ccs modifiers

Kamil Konieczny (43):
      tools/intel_gpu_frequency: fix device opening
      drm-uapi/amdgpu: sync with drm-next
      drm-uapi/i915: sync with drm-next
      drm-uapi/nouveau: sync with drm-next
      drm-uapi/virtgpu: sync with drm-next
      lib/igt_device_scan: add multigpu filtering view
      lib/drmtest: add multi-GPU helpers for filtered devices
      tests/intel/xe_create: add multi-GPU basic test
      meson.sh: Remove --quiet from meson call
      meson.sh: add setup option for meson
      tests/intel/xe_query: Refactor subtests
      tests/intel/xe_query: Add multigpu subtests
      lib/drmtest: load forced module
      tests/intel/xe_exec_atomic: fix basic-inc-all
      tests/intel/i915_test_config: fix JSON exclude section
      tests/kms_atomic: fix musl compilation
      tests/core_getversion: convert to subtest
      tests/core_getversion: print version info
      lib/igt_sriov_device: fix musl libc build
      lib/igt_kmod: fix musl builds
      tests/intel/xe_debugfs: fix musl build
      tests/intel/xe_exec_basic: add multigpu subtests
      tests/intel/gem_exec_gttfill: simplify multiGPU subtest
      scripts/doc-tests-cross-check: check for collisions
      scripts/doc-tests-cross-check: allow whitespace in keywords
      tests/intel/xe_exec_queue_property: move skip into subtest
      tests/device_reset: move later skips into subtests
      tests/intel/perf: move igt_require into subtests
      tests/intel/xe_sysfs_defaults: add missing subtest description
      tests/core_getversion: test all drm devices
      CONTRIBUTING: Add more guidelines
      intel-ci: block gem_exec_capture@many*
      lib/igt_kmod: unload mei_gsc_proxy for Intel drivers
      Revert "lib/igt_kmod: unload mei_gsc_proxy for Intel drivers"
      tools/lsgpu: Introduce version printing
      lib/drmtest: add function for retriving chipset
      tests/core_hotunplug: set known chipset before tests
      lib/drmtest: Allow to get drm device name
      tests/core_hotunplug: Open the same driver
      tests/core_hotunplug: Fix device close
      tests/core_hotunplug: Skip if no render available
      tests/intel/kms_pm_backlight: Fixed build on musl
      Update NEWS, bump version to 1.29

Karthik B S (2):
      tests/intel-ci: Update kms_psr subtest names on bat
      tests/kms_ccs: Convert subtests to dynamic subtests

Karthik Poosa (2):
      tests/intel/xe_gt_freq: Rename ACT_FREQ_LATENCY_US to SLPC_FREQ_LATENCY_US
      tests/intel/xe_gt_freq: Add a wait after gt reset

Katarzyna Dec (3):
      lib/igt_sriov_device: add core SR-IOV helpers
      lib/igt_sriov_device: add helper for opening VF device
      tests/sriov_basic: add basic tests for enabling SR-IOV VFs

Katarzyna Piecielska (71):
      tests: Documentation refactoring part 1
      tests/intel: Documentation refactoring part 2
      tests/intel: Documentation refactoring part 3
      tests/intel: Documentation refactoring part 4
      tests/intel: Documentation refactoring part 5
      tests: Introduce uapi subcategory
      tests/intel: Introduce Memory management subcategory
      tests/intel: Introduce CMD submission subcategory
      tests/intel: Let's introduce Workarounds subcategory
      tests/intel: Add tests to Compute subcategory
      tests/intel: Introduce GPGPU subcategory
      tests/intel: Introduce Blitter subcategory
      tests/intel: Introduce FDinfo subcategory
      tests/intel: Introduce Flat-ccs subcategory
      tests/intel: Introduce Firmware subcategory
      tests/intel: Introduce Media subcategory
      tests/intel: Introduce Render copy subcategory
      tests/intel: Introduce Obsolete subcategory
      tests/intel: Introduce Power management subcategory
      tests/intel: Introduce SysMan subcategory
      tests: Introduce Core subcategory
      tests: Introduce Synchronization subcategory
      tests: Introduce intel-nouveau subcategory
      tests/intel: Introduce Debugging subcategory
      tests/intel: Add missing documentation fields in i915_selftest
      tests/intel: Add more tests to Performance subcategory
      tests: Update device_reset functionality
      tests: Add missing documentation fields for SRIOV and Display
      tests: Remove 'Run type' documentation field
      tests/intel: Unify Blitter subcategory for i915 and Xe
      tests/intel: Introduce CMD submission Sub-category for XE
      tests/intel: Fix inconsitency in Sub-category/Functionality names
      tests/intel: Adjust Xe Sub-category/Functionality to i915 test docs
      tests/intel: Let's have Firmware subcategory in Xe tests as well
      tests/intel: Move drm_fdinfo to driver subcategory
      tests/intel: Add xe_prime_self_import to DRM subcategory
      tests/intel: Move xe_mmap to Memory management Sub-category
      tests/intel: Add xe_spin_batch to IGT Lib Sub-category
      tests/intel: Move xe_exec_queue_property to Sub-category uapi
      tests/intel: Move xe_waitfence test to Synchronization sub-category
      tests/intel: Unify functionality for compute tests
      tests/intel: Move xe_exec_reset.c to Reset Sub-category
      tests/intel: Add missing Sub-category for xe_waitfence
      tests/intel: Remove name collision in Display tests visible in Core docs
      tests/intel: Remove documentation collision for Obsolete category
      tests/intel: Remove documentation collisions in i915_selftest
      tests: Remove collisions with Subcategory and Functionality
      tests/intel: Put "Run type" highest in Xe documentation hierarchy
      tests/intel: Put "Run type" highest in KMS documentation hierarchy
      tests/intel: Put "Run type" highest in i915 documentation hierarchy
      tests/intel: Put multiGPU tests in MultiGPU subcategory documentation
      tests/intel: Introduce General Core Mega feature in documentation
      tests: Add Memory management tests to General Core Mega feature
      tests/intel: Add Blitter tests to General Core Mega feature
      tests/intel: Introduce Power management Mega feature
      tests/intel: Introduce Compute Mega feature
      tests: Add DRIVER_ANY tests to General Core Mega feature
      tests/intel: Add legacy i915 tests to General Core Mega feature
      tests/intel: Introduce SysMan Mega feature
      tests/intel: Add general XE tests to General Core Mega feature
      tests/intel: Introduce Performance Mega feature
      tests/intel: Introduce Compression Mega feature
      tests/intel: Introduce Render Mega feature
      tests/intel: Add GPGPU tests to Compute Mega feature
      tests/intel: Introduce Media Mega feature
      tests/intel: Introduce RAS Mega feature
      tests/intel: Add General Display Feature in few tests documentation
      tests: Unify Category for Core tests documentation
      tests/intel: Make Mega feature field mandatory in test documentation
      tests: Fix Sub-category in documentation
      tests/intel: Drop 'Run type' from xe_exec_sip documentation

Khaled Almahallawy (1):
      tests/kms_sysfs_edid_timing: Skip the first detect

Krzysztof Niemiec (3):
      lib/igt: Fix double include statement
      tests/intel/gem_mmap_offset: Introduce mmap-boundaries test
      tests/intel/gem_mmap_offset: Introduce mmap-unmap test

Kunal Joshi (31):
      tests/intel-ci/chamelium-only: update test name
      lib/igt_psr: added enum for panel replay
      lib/igt_psr: modified psr_sink_support for pr compatibility
      lib/igt_psr: modified psr_active_check for pr compatibility
      lib/igt_psr: modified psr_set for pr compatibility
      lib/igt_psr: modified psr_get_mode for pr compatibility
      tests/intel/kms_psr: made test compaitable with pr
      tests/intel-ci/fast-feedback: update renamed tests
      tests/intel-ci/xe-fast-feedback: update renamed tests
      lib/igt_psr: add helper to check of given psr mode can be enabled
      tests/intel/kms_psr: enable given psr mode only after checking enable_psr modparam
      lib/igt_psr: modify library to support multiple PSR/PR outputs
      lib/igt_psr: add support for PR selective update
      tests/intel/kms_psr2_sf: extend tests for panel replay sf
      lib/igt_kms: move bigjoiner_mode_found to lib
      tests/intel/kms_big_joiner: revamp bigjoiner
      lib/igt_kms: add helper to enable/disable force joiner
      tests/intel/kms_big_joiner: add tests for force joiner
      lib/igt_kms: adapt to boolean debugfs for i915_bigjoiner_force_enable
      lib/igt_kms: don't run on unsupported platform
      tests/intel/kms_big_joiner: fix crash in multi joiner test
      tests/intel/kms_big_joiner: add missing commit after reset
      lib/igt_kms: add support for forcing bigjoiner on particular connector
      tests/intel/kms_big_joiner: use kmstest_force_connector_bigjoiner
      lib/igt_kms: remove unused igt_force_and_check_bigjoiner_status
      tests/intel/kms_pipe_b_c_ivb: Test cleanup
      tests/kms_hdmi_inject: Test cleanup
      lib/igt_debugfs: handle xe driver as well
      tests/chamelium/kms_chamelium_color: plug ports before starting the test
      tests/chamelium/kms_chamelium_color: prefer HDMI port for color tests to avoid DP FSM failures
      tests/kms_bw: add subtest for only connected outputs

Lang Yu (1):
      tests/amdgpu: add VPE tests

Lee Shawn C (4):
      tests: save GPU engine information more properly
      lib/i915/drrs: close file handler after update DRRS setting
      tests/kms_setmode: disable DRRS if eDP support variable refresh rate
      tests/kms_flip: disable DRRS if eDP support variable refresh rate

Luca Coelho (4):
      lib/igt_kms: add retry loop in igt_enable_connectors()
      lib/igt_chamelium: check drmModeGetConnector() before using
      tests/intel/i915_pm_rpm: check drmModeGetConnector() before use
      tests/intel/i915_pm_rpm: warn and skip test if reading connector fails

Lucas De Marchi (96):
      lib/rendercopy: Use common mocs function
      lib/gpu_cmds: Remove prefix from gen7_fill_binding_table()
      lib/gpu_cmds: Reorder if/else ladder according to IP version
      lib/gpu_cmds: Fork a gen9_fill_surface_state()
      lib/gpu_cmds: Reduce scope of xehp_fill_surface_state()
      lib: Fork gen9_media.h
      lib/intel_mocs: Stop encoding mocs
      lib/intel_mocs: Add Xe2 mocs indexes
      lib/igt_draw: Add Xe2 mocs to XY_FAST_COLOR_BLT
      lib/intel_mocs: Remove unused lefotver defines
      lib/intel_blt: Support Xe2 in xy-block-copy command
      lib/intel_blt: Support xe2 in xy-fast-copy command
      lib/intel_blt: Support xe2 in ctrl-surf-copy command
      lib/igt_kmod: Remove wrong note regarding dependencies
      build: Build xe tests by default
      lib/xe: Boost prefetch size to 4KB
      lib/igt_drm_fdinfo: Use longest match first
      lib/igt_drm_fdinfo: Mandatory drm-fields first
      lib/igt_sysfs: Fix dir fd documentation
      tests/intel/xe_live_ktest: Rename subtest to match suite
      lib/igt_kmod: Allow to load kunit from alias
      lib/igt_sysfs: Use same var for sizeof()
      lib/igt_sysfs: stop leaking fd on write failures
      lib/igt_sysfs: Fix off-by-one in buffer size
      lib/igt_sysfs: make sure to write empty strings
      xe_live_ktest: Use xe_live_test kernel module
      lib/igt_kmod: stop using KMOD_REMOVE_FORCE
      tests/xe_exec_threads: Reduce copy & paste
      lib/xe_spin: Fix doc whitespaces and typo
      lib/igt_drm_clients: Use calloc
      lib/igt_drm_clients: Fix sizeof calculation
      lib/igt_drm_clients: Fix leaks
      gputop: Free clients on exit
      lib/igt_drm_fdinfo: Simplify find_kv()
      intel_reg: Reorder commands and annotate ones needing reg spec
      intel_reg: Move decoding behind an option
      lib/igt_drm_fdinfo: Fix wrong name len assert
      lib/igt_drm_fdinfo: Assert pdev is not truncated
      lib/igt_drm_fdinfo: Detect invalid drm-client-id
      lib/igt_drm_fdinfo: Stop ignoring space where not needed
      tools/gputop: Extract method to update console size
      tools/gputop: Extract clrscr()
      lib/igt_drm_clients: lazy stat process
      lib/i915/perf: Fix warning on codegen
      tests/intel/xe_pm: Reword *-basic description
      lib/igt_aux: Name function according to sysfs file
      tests/intel/xe_pm: S4 to go up to devices only
      gputop: print percentage number
      gputop: Add option parsing
      gputop: Allow to limit number of executions
      gputop: Allow to set delay interval
      lib/igt_drm_fdinfo: Extract ignore_space()
      lib/igt_drm_fdinfo: Allow any number of spaces before unit
      lib/igt_drm_fdinfo: Stop passing key twice
      lib/igt_drm_fdinfo: Remove prefix arg from parse functions
      lib/igt_drm_fdinfo: Parse drm-cycles
      lib/igt_drm_fdinfo: Start tracking available engine keys
      tests/intel/xe_pm: Rename and clarify mocs_suspend_resume
      tests/intel/xe_pm: Move mocs documentation to the right place
      tests/intel/xe_pm: Fix S4 testing
      treewide: Rename engine busyness variables
      lib/igt_drm_clients: Move engine fields to substruct
      lib/igt_drm_clients: Record drm-cycles
      lib/igt_drm_fdinfo: Parse drm-total-cycles
      lib/igt_drm_clients: Record total cycles
      gputop: Add support to drm-cycles/drm-total-cycles
      man: Add --decode to intel_reg.rst
      drm-uapi/xe: Sync with topology query uapi updates
      tests/intel/xe_query: Sanity check EU width
      lib/xe/oa: Handle SIMD16_EU_PER_DSS
      lib/igt_drm_fdinfo: Improve fdinfo parse documentation
      intel-gfx-fw-info: Hide raw dump behind a flag
      intel-gfx-fw-info: Allow to print checksum
      tests/intel/xe_module_load: Rename enable_display module param
      lib/igt_core: Use unsigned constants for time conversion
      lib/igt_core: Add a couple of time conversion macros
      lib/xe: Remove MS_TO_NS()
      lib/xe: Add XE_MAX_ENGINE_INSTANCE
      lib/xe: Abstract virtual/parallel setup
      tools/intel-gfx-fw-info: Re-format with black
      tools/intel-gfx-fw-info: Annotate abstract method
      tools/intel-gfx-fw-info: Embed fw decoding
      tools/intel-gfx-fw-info: Override kernel types
      tools/intel-gfx-fw-info: do not use bare 'except'
      tools/intel-gfx-fw-info: Add proper HuC parser
      tests/intel/xe_drm_fdinfo: Extend mercy to the upper end
      tests/intel/xe_drm_fdinfo: Print timestamp for debug
      lib/igt_core: Add igt_assert_lt_double()
      tests/intel/xe_drm_fdinfo: Use igt_assert_lt_double()
      tests/intel/xe_drm_fdinfo: Use usec for batch duration
      tests/intel/xe_drm_fdinfo: Half the execution time
      tests/kms_rmfb: Fix subtest description
      tests/intel/xe_drm_fdinfo: Be strict on == 0 comparison
      tests/intel/xe_drm_fdinfo: Remove unused flags
      tests/intel/xe_drm_fdinfo: Use enum with expected load
      tests/intel/xe_drm_fdinfo: Rename and reorder tests

Lukasz Laguna (6):
      lib/xe/xe_query: add media GT presence checker
      lib/igt_core: initialize srandom seed on startup
      tests/intel/xe_create: create-contexts subtest
      lib/igt_sriov_device: add helpers for operations in different VFs scenarios
      lib/igt_sriov_device: add helpers for VF DRM driver bind and unbind
      tests/sriov_basic: validate driver binding to VFs

Maarten Lankhorst (1):
      lib/intel_ctx: Propagate error from __intel_ctx_xe_exec wait timeout

Maaz Mombasawala (1):
      tests/vmwgfx: Removing incorrect assert in mob_repeated_unref

Manasi Navare (1):
      tests/kms_vrr: Add a subtest for seamless modeset to a virtual LRR mode

Marcin Bernatowicz (49):
      lib/xe_spin: xe_spin_opts for xe_spin initialization
      lib/xe_spin: fixed duration xe_spin capability
      tests/xe_spin_batch: spin-fixed-duration
      lib/xe_spin.c: fixed code style
      lib/igt_device_scan: added functions to get first Xe card
      benchmarks/gem_wsim: reposition the unbound duration boolean
      benchmarks/gem_wsim: fix duration range check
      benchmarks/gem_wsim: extract duration parsing code to new function
      benchmarks/gem_wsim: fix conflicting SSEU #define and enum
      benchmarks/gem_wsim: cleanups
      benchmarks/gem_wsim: reposition repeat_start variable
      benchmarks/gem_wsim: use lib code to query engines
      benchmarks/gem_wsim: allow comments in workload description files
      benchmarks/gem_wsim: introduce w_step_sync function
      benchmarks/gem_wsim: extract allocate and prepare contexts code to new functions
      benchmarks/gem_wsim: extract prepare working sets code to new function
      benchmarks/gem_wsim: group i915 fields
      benchmarks/gem_wsim: for_each_dep macro
      benchmarks/gem_wsim: for_each_ctx macro
      benchmarks/gem_wsim: for_each_w_step macro
      benchmarks/gem_wsim: added basic xe support
      benchmarks/gem_wsim: introduce bb_size field
      lib/drmtest: make ALIGN work with uint64_t values
      lib/xe/xe_query: xe_visible_available_vram_size helper
      tests/intel/xe_create: create-big-vram subtest
      benchmarks/gem_wsim: Fix array index issue in xe_sync object referencing
      lib/igt_sriov_device: Cache xe device at open
      tests/sriov_basic: Skip tests if sriov_totalvfs is zero
      tests/sriov_basic: Restore the igt_sriov_is_pf check
      lib/igt_sriov_device: Replace libpciaccess with direct sysfs interaction
      lib/igt_device_scan: Skip attributes in subdirectories
      tests/intel-ci/xe.blocklist: Blocklist SR-IOV stress tests
      tests/sriov_basic: Extract enable-vfs-bind-unbind-each-numvfs-all subtest
      tests/intel-ci/xe.blocklist: Blocklist SR-IOV stress tests
      benchmarks/gem_wsim: Support gens without relocations
      benchmarks/gem_wsim: Fix mmap for discrete graphics cards
      benchmarks/gem_wsim: Introduce intel_engines structure
      benchmarks/gem_wsim: Unify bond handling
      benchmarks/gem_wsim: Introduce engine_idx to streamline engine selection
      benchmarks/gem_wsim: Update request_idx in prepare phase
      benchmarks/gem_wsim: Extend engine selection syntax
      benchmarks/gem_wsim: Option to list physical engines
      lib/igt_sysfs: Add xe_sysfs_gt_has_node to check node existence
      tests/intel/xe_gt_freq: Skip test if 'freq0' node is missing
      tests/intel/xe_pm_residency: Skip test if 'gtidle' node is missing
      tests/intel-ci/xe-sriov-vf.blocklist.txt: Blocklist for SR-IOV VF runs
      tests/intel/drm_fdinfo: Fix type comparison warning
      tests/intel/xe_huc_copy: Enhance HuC status check for VF mode
      lib/igt_sriov_device: Adjust the igt_sriov_is_pf function

Matt Roper (14):
      lib/igt_kmod: Fix uninitialized variable during module unload
      lib/intel_mocs: Initialize MOCS values directly
      lib/intel_mmio: Allow access to full register space on modern platforms
      drm-uapi/xe: Add IP version to GT query
      tests/xe_query: Print and sanity-check GT ip versions
      lib/xe_spin: Fix MI_STORE_REGISTER_MEM instruction usage
      tests/xe_exec_threads: Fill in GT field for second balancer thread
      tests/xe_vm: DRM_XE_VM_BIND_FLAG_DUMPABLE is now a valid flag
      tests/xe_compute: Don't require ccs_mode on every GT
      tests/intel: Use MI_ARB_CHECK definition more consistently
      tests/xe_query: Also allow IP version less than 20 for BMG media
      lib: Add u32 variants of igt_assert_{lt,lte}
      tests/intel: Apply igt.cocci transforms
      tests/intel: Drop unused local variables

Matt Turner (1):
      lib: Inline igt_x86_features() into ifunc resolvers

Matthew Auld (51):
      drm-uapi/xe_drm: sync to get pat and coherency bits
      lib/igt_fb: mark buffers as SCANOUT
      lib/igt_draw: mark buffers as SCANOUT
      lib/xe: support explicit cpu_caching gem_create
      tests/xe/mmap: add some tests for explicit cpu_caching
      lib/intel_pat: add helpers for common pat_index modes
      lib/allocator: add get_offset_pat_index() helper
      lib/intel_blt: support pat_index
      lib/intel_buf: support pat_index
      lib/xe_ioctl: update vm_bind to account for pat_index
      lib/intel_allocator: treat default_alignment as the minimum
      lib/intel_blt: tidy up alignment usage
      lib/intel_batchbuffer: extend to include optional alignment
      tests/xe: add some vm_bind pat_index tests
      tests/intel-ci/xe: add pat and caching related tests
      tests/intel/xe_pat: add sanity check for NULL mappings
      tests/intel/xe_pat: limit number of dynamic tests
      lib/xe_ioctl: fix default cpu_caching helper
      lib: restore FLAG_SCANOUT usage for Xe
      tests/intel/xe_create: sanity check all MBZ fields
      tests/intel-ci/xe-fast-feedback: add create-invalid-mbz
      tests/intel/xe_exec_store: don't pass gt_id as bind queue
      lib/xe/ioctl: introduce xe_bb_size() helper
      lib/xe_spin: account for prefetch
      tests/intel/xe: account for prefetch
      benchmarks/gem_wsim: use xe_bb_size() helper
      lib/igt_fb: use xe_bb_size() helper
      tests/intel/xe: use xe_bb_size() helper
      lib/intel_blt: use BYTE_COPY mode on xe2
      tests/intel/xe_vm: fix xe_bb_size() conversion
      lib/intel_device_info: set has_flatccs on LNL
      tests/intel/xe_pat: assert flat CSS support for xe2
      tests/intel/xe_ccs: require flat CCS on xe2
      tests/prime_nv_test: switch over to intel_buf_init()
      tests/intel: prefer intel_buf_init_in_region()
      lib/intel_bufops: repurpose intel_buf_create_using_handle_and_size()
      tests/intel: replace intel_buf_create_using_handle()
      tests/intel: replace intel_buf_init_using_handle()
      tests/intel/kms_dirtyfb: pass the bo_size
      lib/intel_bufops: keep bo_size separate
      lib/igt_fb: assert fb->size blt_fb_init()
      lib/rendercopy_gen9: use MOCS index helper
      lib/gpu_cmds: default to uc MOCS index
      lib/intel_buf: revamp MOCS usage
      lib/intel_buf: expose mocs_index
      lib/intel_mocs: add defer-to-pat MOCS index
      tests/intel/xe_pat: verify wb-transient with pipe crc
      tests/intel/xe_ccs: fix bo size for ccs
      tests/intel/xe_exec_store: fix sync usage
      lib/intel_pat: account for Wa_16023588340
      tests/intel/xe_pat: account for Wa_16023588340

Matthew Brost (13):
      xe_exec_balancer: Enable parallel submission and compute mode
      xe_exec_threads: Use DRM_XE_VM_CREATE_COMPUTE_MODE when creating a compute VM
      xe: Update uAPI and remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
      xe: Update to new VM bind uAPI
      drm-uapi/xe: Remove sync binds
      Revert "tests/intel/xe_vm: Do not error on -ECANCELED"
      tests/intel/xe_vm: Always have at least 2 pages bound in munmap hammer sections
      xe_exec_reset: Wait for spin batches to start
      tests/intel/xe_vm: Add test for 64k page corners
      tests/intel/xe_exec_compute_mode: Add userptr free / munmap sections
      tests/intel/xe_vm: Add bind array conflict tests
      tests/intel/xe_vm: Add bind array -ENOBUFS section
      xe_exec_reset: Enhance spin test

Mauro Carvalho Chehab (113):
      tests/meson.build: fix build on cross-compiled environments
      docs/cross-building.txt: add documentation about cross-builds
      Revert "docs/cross-building.txt: add documentation about cross-builds"
      docs/cross-building.txt: add documentation about cross-builds
      scripts/test_list.py: allow adding multiple testlist lines with same name
      docs/testplan/conf.py: add sphinx path
      intel/xe_sysfs_scheduler.c: remove nonpriviledged-user tests
      intel/kms_big_fb.c: remove linear-addfb-size*-overflow docs
      intel/kms_frontbuffer_tracking.c: remove fbc-slowdraw docs
      scripts/test_list.py: fix and simplify missing doc check
      testplan/meson.build: disable kms check testlist if not chamelium
      scripts/test_list.py: fix and simplify missing doc check
      scripts/test_list.py: allow ignoring uppercase on testlist read
      intel/kms_test_config.json: set testlist read parser to ignore case
      scripts/test_list.py: better name testlist include/exclude config fields
      tests/device_reset: fix logic to unbind when snd_hda_intel is loaded
      lib/igt_sysfs: move kick_snd_hda_intel() to igt_kmod.c
      igt_runner: don't require root for dry_run
      scripts/test_list.py: better handle list of tests
      runner/job_list: use case-insensitive regular expressions
      runner/runner_tests: add a test to check case-insensitive match
      intel/xe_test_config.json: add igt@intel_hwmon to testplan
      scripts/test_list.py: fix subtest regex match
      intel/intel_hwmon.c: Fix test documentation
      scripts/test_list.py: better parse list of tests
      scripts/test_list.py: speedup update testlist logic
      intel/*.json: better handle FULL testlist
      scripts/test_list.py: fix regex filtering logic
      scripts/test_list.py: use different types for include/exclude
      scripts/test_list.py: better expand subtests
      scripts/test_list.py: don't add a blank description
      scripts/test_list.py: Fix trivial pylint issues
      scripts/test_list.py: fix indent at get_subtests()
      igt_doc.py: move the main code to a main() function
      scripts/igt_doc: Add driver name list at JSON configuration
      tests/intel: *.json: specify what drivers use such tests
      scripts/igt_doc.py: add a logic to generate Intel CI testlists
      scripts/igt_doc.py: rewrite intelci testlist logic
      scripts/test_list.py: better identify planned tests
      tests/intel/xe_live_ktest: document live kunit tests
      tests/xe_sysfs_defaults: add a description for engine-defaults
      tests/intel/xe_media_fill: address a documentation warning
      meson.sh: allow making it less verbose
      meson.sh: add usage instructions at the beginning of the file
      lib/*.h: ensure that all includes will be there
      scripts/igt_doc.py: allow using multiple config files at the same time
      testplan/meson.build: add a ninja PHONY target for Intel CI testlists
      scripts/igt_doc.py: don't be verbose when creating testlists
      scripts/test_list.py: fix a typo on default-if-not-excluded
      scripts/igt_doc.py: better handle issues with empty testlists
      scripts/igt_doc.py: handle empty run_type
      scripts/igt_doc.py: only create dict if subtest will be added
      scripts/igt_doc.py: better handle default gpu
      scripts/igt_doc.py: remove some unused logic
      scripts/igt_doc.py: simplify and cleanup tests_per_list logic
      scripts/igt_doc.py: use an ancillary function to simplify the code
      scripts/code_cov_parse_info: Silent some messages by default
      scripts/code_cov_parse_info: do some renames to make it more coherent
      scripts/code_cov_parse_info: better handle include regexes
      scripts/code_cov_parse_info: add support for filtering Xe driver data
      scripts/code_cov_parse_info: add a tool to analyze branch coverage
      scripts/code_cov_parse_info: prepare $all_branch to get function data
      scripts/code_cov_parse_info: use numeric sort for line numbers
      scripts/code_cov_parse_info: make parse_info_data more generic
      scripts/code_cov_parse_info: stop recording/writing too old fields
      scripts/code_cov_parse_info: add support for parsing JSON files
      scripts/code_cov_parse_info: add an internal JSON format
      scripts/code_cov_parse_info: add support for compressed files
      scripts/code_cov_parse_info: warn if branch block is not zero
      scripts/code_cov_parse_info: better handle branch filtering
      scripts/code_cov_parse_info: add support for filtering branches
      scripts/code_cov_parse_info: fix files statistics
      scripts/code_cov_parse_info: better check if source file exists
      scripts/igt_doc.py: fix intelci testlist generation for complex cases
      scripts/igt_doc.py: ignore "all" when producing testlists
      scripts/igt_doc.py: fix trivial case handling
      scripts/igt_doc.py: fix intelci testlist join logic
      intel/xe_test_config.json: add sriov_basic.c
      tests/intel/xe_query: use Hardware building block for MultiGPU
      tests: use Infrastructure category for all sysman tests
      tests/intel/xe_noexec_ping_pong: change category to hardware building block
      tests/intel/xe_evict_ccs: use a different name for evict on Flat-CCS
      scripts/igt_doc.py: store igt test names in lowercase
      scripts/xls_to_doc.py: make the script work again
      scripts/xls_to_doc.py: remove some dead code
      scripts/xls_to_doc.py: ignore fields filled by lists by default
      scripts/doc_to_xls.py: split code into a XLS conversion and main()
      tests/intel/xe_exec_queue_property: fix documentation output
      scripts/xls_to_doc.py: use a main() function
      scripts/xls_to_doc.py: beautify its coding style
      scripts/xls_to_doc.py: cleanup argparse logic
      scripts/xls_to_doc.py: fix issues with python < 3.7
      scripts/xls_to_doc.py: document all functions
      scripts/xls_to_doc.py: don't be verbose by default
      scripts/xls_to_doc.py: make the message about wildcards clearer
      scripts/xls_to_doc.py: don't ignore the last column
      scripts/xls_to_doc.py: be clearer when ignoring a value in verbose mode
      scripts/xls_to_doc.py: detect field removal
      scripts/xls_to_doc.py: improve the addition logic
      scripts/xls_to_doc.py: preserve line for found fields
      scripts/xls_to_doc.py: don't duplicate a common field
      scripts/xls_to_doc.py: reduce verbosity for writing message
      scripts/xls_to_doc.py: better handle common attributes
      scripts/xls_to_doc.py: add a logic to simplify tags
      scripts/xls_to_doc.py: make pylint happy
      scripts/doc_to_xls.py: fix spreadsheet generation
      benchmarks: fix calloc calls with inverted arguments
      assembler: fix calloc calls with inverted arguments
      tests: fix calloc calls with inverted arguments
      lib: fix calloc calls with inverted arguments
      tests/intel/kms_test_config.json: fix indentation
      tests/intel/*.json: remove some uneeded whitespaces
      tests/intel: add other missing core tests to xe_test_config.json

Melissa Wen (3):
      tests/kms_atomic: skip mutable zpos test on non-mutable planes
      test/kms_async_flips: fix test abortion due to unreadable mod name
      tests/kms_async_flips: test with modifiers only on intel devices

Min Zhou (1):
      opencl/gen_opencl_kernel: Fix code generation

Mohammed Anas (1):
      benchmarks/gem_exec_tracer.c: Fix musl build

Mohammed Thasleem (9):
      tests/kms_atomic_transition: Reduce the number of iterations on modeset-transition
      tests/kms_lease: Terminate lease fd before subtests and remove lease_t from all sub-tests
      tests/kms_lease: Add wrapper to create lease and store mcl.fd
      lib/intel_chipset: Add AT_LEAST_DISPLAY for display version compare
      tests/intel/kms_pm_dc: Add LNL platform for dc9-dpms validation
      tests/intel/xe_pm: Fix d3 subtest
      tests/kms_lease: Cache xe_device info for lease fd
      lib/igt_kms: Correct the check for igt_require
      tests/kms_properties: Create dynamic subtests

Nakshtra Goyal (3):
      tests/intel/xe_sysfs_defaults: Validate for all default values
      tests/intel/xe_compute_preempt: Check skip condition from parent process
      tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe

Naladala Ramanaidu (8):
      tests/kms_plane_scaling: Update the single plane scaling function arguments
      tests/kms_plane_scaling: Update the multi plane scaling function arguments
      tests/kms_plane_scaling: Find display mode fitting in BW
      tests/kms_plane_scaling: Find display mode fitting in BW for rotations
      tests/intel/kms_pm_dc: Add time unit macros and update delay calculation
      tests/intel/kms_pm_dc: Update VRR handling and eDP output check
      tests/intel/kms_pm_dc: Update test duration to 4 seconds
      tests/intel/kms_pm_dc: Add polling for deep-pkgc

Nidhi Gupta (3):
      tests/kms_frontbuffer_tracking: Extend the test to enable FBC for each plane
      tests/intel/kms_frontbuffer_tracking: Add new subtest to test FBC on each pipe
      tests/intel/kms_frontbuffer_tracking: Cleanup pipe crc

Niranjana Vishwanathapura (4):
      lib/xe: Add __xe_exec_queue_create()
      lib/intel_compute: Update intel_compute to run on specified engine
      tests/xe_compute: Validate ccs_mode setting
      lib/xe: Update __xe_exec_queue_create()

Nirmoy Das (20):
      lib/igt_gt: Add gem_engine_can_block_ggtt_binder
      tests/intel/gem_ctx_shared: Skip some test on MTL
      tests/intel/gem_ctx_schedule: Skip some test on MTL
      tests/intel/gem_spin_batch: Skip some test on MTL
      tests/prime_vgem: Use correct blitter
      tests/intel/gem_eio: Skip stress test on BCS0 for MTL
      test/xe_spin_batch: Add spin-fixed-duration-with-preempter
      Revert "test/xe_spin_batch: Add spin-fixed-duration-with-preempter"
      tests/xe_spin_batch: Add spin-fixed-duration-with-preempter
      tests/intel: Add xe_exec_atomic test
      lib/xe/xe_query: Fix compilation -Wshadow warning
      tests/intel-ci: Add mi_atomic test to fast-feedback
      tests/intel/xe_exec_atomic: Skip early on unsupported platform
      tests/intel/xe_exec_atomic: don't test unsupported config
      tests/intel/xe_compute_preempt: Extend it for more engines
      tests/intel/xe_compute_preempt: Add compute-preempt-many
      tests/device_reset: Skip if no drm devices are present
      tests/intel/xe_compute_preempt: Run it on only CCS engine
      lib/intel_compute: Enable compute tests for BMG
      tests/intel/xe_exec_fault_mode: Print engine name on error

Pallavi Mishra (1):
      tests/intel/xe_exec_store: Modify test for Priority Mem Read feature

Peter Senna Tschudin (3):
      tests/intel/gem_exec_capture: fix use of uninitialized hang var
      tests/intel/gem_exec_capture: Fix many-* subtests
      lib/xe/xe_query: Do not require QUERY_OA_UNITS for all Xe tests

Petri Latvala (3):
      runner: Normalize testlist entries that don't list subtests
      runner/runner_tests: Unit tests for binary-name-only testlist entries
      runner/runner_tests: Fix name of no-subtests in unit tests

Piotr Kira (1):
      runner/resultgen: Fix subtest runtimes

Piotr Piórkowski (5):
      lib/drmtest: Add IS_ALIGNED macro
      lib/intel_mmio: Add 64-bits ioread/iowrite
      lib/xe/xe_query: Add helper to check if given gt id points to media gt
      lib/intel_mmio: Map the whole BAR0 for gen12+
      lib/xe_mmio: Introduce Xe MMIO lib

Pranay Samala (6):
      tests/intel/kms_big_fb: Restrict runs on simulation
      tests/kms_plane: Reduce CI logging
      tests/kms_plane: Convert to dynamic subtests
      lib/igt_sysfs: Implement dynamic adjustment of debug log level
      tests/kms_atomic_transition: Reducing debug loglevel dynamically
      tests/kms_getfb: Skip getfb2-accept-ccs subtest on Xe2 platforms

Prike Liang (1):
      tests/amdgpu: update bad length case

Priyanka Dandamudi (8):
      Revert "tests/xe/perf_pmu: Tests for the XE pmu interface"
      tests/xe/xe_access_counter: Negative access counter test
      tests/intel/xe_exec_queue_property: Add exec queue set property tests
      tests/intel/xe_exec_queue_property: Add scheduler exec queue set property
      tests/intel/xe_exec_store: Test to check CONDITIONAL_BATCH_BUFFER_END
      tests/intel/xe_evict: Skip test if smem less than lmem
      tests/intel/xe_exec_fault_mode: Test to check the access of invalid va
      tests/intel/xe_exec_fault_mode: Extend invalid va test

Ravi Kumar Vodapalli (2):
      lib: sync i915_pciids.h with kernel
      lib: sync xe_pciids.h with kernel

Reagan Bohan (7):
      meson: Define _LARGEFILE64_SOURCE for musl libc
      lib: use poll.h in includes
      benchmarks: use poll.h in includes
      runner: use poll.h in includes
      tests: use poll.h in includes
      tools: use poll.h in includes
      tests/intel: Change sys/signal.h to signal.h

Riana Tauro (4):
      tests/xe: Add a test that validates idle residency on exec
      tests/intel/xe_pm_residency: assert only if idle residency is lesser than elapsed time
      tests/intel/xe_gt_freq: re-introduce exec tests of xe_gt_freq
      tests/intel/xe_pm_residency: convert all tests to dynamic subtests

Rob Clark (12):
      core_getversion: Test for desired device
      tests/kms_plane: Fix skips/fails vs CRC cleanup
      tests/msm: Add parallel recovery test
      tests/msm_submit: Fix invalid-duplicate-bo-submit errno
      tests/kms_universal_plane: Re-work expectations for non-intel hw
      tests/kms_plane_cursor: Skip unneeded overlay requirement
      tests/kms_bw: Use reduced blanking mode 1920x1080p timings
      tests/kms_bw: Add 2160x1440p mode
      tests/kms_plane_scaling: Pass display to get_num_scalers()
      tests/kms_plane_scaling: Improve msm support
      tests/dumb_buffer: Fix invalid bpp subtest
      tests/device_reset: Require a PCI device

Rodrigo Vivi (39):
      drm-uapi/xe_drm: Align with new PMU interface
      drm-uapi/xe: Use common drm_xe_ext_set_property extension
      drm-uapi: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
      drm-uapi/xe: Replace useless 'instance' per unique gt_id
      drm-uapi/xe: Remove unused field of drm_xe_query_gt
      drm-uapi/xe: Rename gts to gt_list
      drm-uapi/xe: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
      drm-uapi/xe: Remove GT_TYPE_REMOTE
      drm-uapi/xe: Kill VM_MADVISE IOCTL and the atomic tests
      drm-uapi/xe: Rename *_mem_regions mask.
      drm-uapi/xe: Rename query's mem_usage to mem_regions
      drm-uapi/xe: Standardize the FLAG naming and assignment
      drm-uapi/xe: Differentiate WAIT_OP from WAIT_MASK
      drm-uapi/xe: Be more specific about vm_bind prefetch region
      xe_ioctl: Converge bo_create to the most used version
      xe_ioctl: Rename *xe_bo_create_flags to simply xe_bo_create
      xe_query: Add missing include
      xe_query: Kill visible_vram_if_possible
      drm-uapi/xe: Separate bo_create placement from flags
      xe: s/hw_engine/engine
      drm-uapi/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
      tests/intel/xe: Align change in the name of frequency sysfs attributes
      tests/intel/xe: Align with new xe_gt_freq component
      tests/intel/freq: Test throttle basic API infra
      tests/intel/xe_tile_sysfs: Remove it for now
      tests/intel/xe: Remove xe_uevent for now
      tests/intel/xe_pm: Fix runtime_pm tests
      lib/igt_kmod: drop devcoredump before a PCI module unload
      tests/intel/xe_wedged: Introduce a new test for Xe device wedged state
      tests/intel/xe_wedged: Also add a simple exec to confirm GPU health
      tests/intel/xe_wedged: Introduce test for wedged_mode=2
      tests/intel/xe_wedged: Test wedged_mode=1 after had toggled mode=2
      tests/intel/xe_wedged: Force a rebind before exit
      tests/intel/xe_pm: Update runtime pm conditions
      lib/igt_pm: Fix and standardize IGT PM library documentation
      tests/intel/xe_pm: Also disable display for mmap_system test
      tests/intel/xe_pm: Only check the rpm resume after the first mmap operation
      tests/intel/xe_pm: Convert mmap tests to use existing d3 helpers
      lib/igt_pm: Convert suspended_time from int to uint64_t

Sai Gowtham Ch (20):
      lib/intel_blt: Add check to see if blt commands are supported by the platforms
      lib/intel_blt: Add wrappers to prepare batch buffers and submit exec
      lib/intel_cmds_info: Add M_MATRIX in mem_copy as it is supported for PVC
      intel/xe_copy_basic: Add copy basic test to exercise blt commands
      tests/intel/xe_copy_basic: Fix validating the mem set values.
      tests/intel/xe_exec_store: Add cachelines and page-sized subtests
      tests/intel/xe_exec_queue_property: Negative tests for get exec_queue property ioctl
      tests/intel/xe_exec_store: Fix basic-all subtest
      include/intel_gpu_commands: Add persistent batch buffer instruction
      tests/intel/xe_exec_store: Add Persistent subtest
      tests/intel/xe_exec_compute_mode: Add non-blocking subtest
      lib/intel_cmds_info: Add MEM_COPY/SET support for Lunarlake
      tests/intel/xe_exec_compute_mode: Fix non-blocking subtest
      lib/xe/xe_spin: Update xe_spin with exec_sync
      lib/xe/xe_spin: Add support to store/write timestamp
      tests/intel/xe_exec_compute_mode: Test to validate LR mode
      tests/intel/xe_pm: Test validates vm-bind userptr flag with suspend and resume
      tests/intel/xe_pm: Validate vm-bind prefetch flag with suspend and resume
      tests/intel/xe_pm: Tests vm-unbind all flag functionality with S&R
      lib/igt_sysfs: update igt_sysfs_engines to run dynamic tests with its associated engine class.

Sathishkumar S (2):
      tests/amdgpu: support jpeg test on gfx940
      tests/amdgpu: use 64x64 jpeg bitstream

Sean Paul (8):
      tests/kms_vrr: Move fb0 and fb1 to an array
      tests/kms_vrr: Move vtest_ns into data_t
      tests/kms_vrr: Allow test rate to be altered from the command line
      tests/kms_vrr: Allow test duration to be specified from the command line
      tests/kms_vrr: Change the pattern displayed in the test
      tests/kms_vrr: Add ability to flip static image for flicker profiling
      tests/kms_vrr: Allow for multiple rates in a test
      tests/kms_vrr: Add a max/min test to oscillate between rates

Simon Ser (7):
      drm-uapi: sync with drm-next
      tests/syncobj_eventfd: new test
      drm-uapi/amdgpu_drm: sync with drm-next
      drm-uapi/i915_drm: sync with drm-next
      drm-uapi/msm: sync with drm-next
      drm-uapi/panfrost: sync with drm-next
      drm-uapi/vmwgfx: sync with drm-next

Sk Anirban (1):
      tests/intel/i915_pm_rps: Disable threshold subtests when SLPC is enabled

Stefano Ragni (4):
      lib/igt_x86.c: Fix musl/uclibc build
      lib/igt_halffloat.c: Fix musl/uclibc build
      lib: include limits.h to fix build with musl libc
      tests: include limits.h to fix build with musl libc

Sujaritha Sundaresan (5):
      tests/intel: Add multi-gt support for rc6-idle test
      tests/intel: Add multi-gt support for rc6-fence test
      tests/intel: Add multi-gt support for rc6-accuracy test
      tests/intel: Print drpc info for rc6_residency test
      intel-ci/fast-feedback.testlist: Remove system wide suspend testing

Suraj Kandpal (6):
      tests/kms_content_protection: Add LIC Type 1 scenario
      tests/kms_content_protection: Move HDCP output checks earlier
      tests/kms_content_protection: Move try commit call
      tests/kms_content_protection: Rename igt_commit_style variable
      tests/kms_content_protection: Add retry logic for mst usecase
      tests/kms_content_protection: Set screen red/green based on CP Status

Swati Sharma (51):
      tests/intel-ci: add dsc-basic as part ffb
      tests/intel/kms_pm_backlight: Add XE support
      tests/intel/kms_pm_lpsp: Add XE support
      tests/intel/kms_pm_dc: Use linear modifier to set primary plane
      tests/intel/kms_pm_dc: Use gem_has_lmem()
      tests/intel/kms_pm_dc: Add XE support
      tests/kms_plane_scaling: rename subtests
      tests/intel/kms_psr2_su: fix igt_require_f() print message
      tests/kms_dither: rename subtest
      tests/kms_sequence: remove redundant test doc
      tests/kms_content_protection: rename subtests
      tests/kms_lease: remove redundant test doc
      tests/kms_lease: rename subtests
      tests/kms_universal_plane: convert subtests to dynamic subtests
      tests/kms_concurrent: remove pipe dependency in subtest name
      tests/kms_atomic_interruptible: use pipe_name followed by output_name
      tests/kms_invalid_mode: use pipe_name followed by output_name
      tests/kms_scaling_modes: use pipe_name followed by output_name
      tests/kms_plane: drop planes from dynamic subtest name
      tests/kms_sequence: use pipe_name followed by output_name
      tests/intel/kms_flip_tiling: pipe_name followed by output_name
      tests/kms_vblank: cosmetic changes
      tests/kms_vblank: convert test to dynamic
      tests/kms_vblank: restrict to 2 pipes
      tests/kms_atomic: cosmetic changes
      tests/kms_atomic: rename subtest
      tests/kms_atomic: test cleanup
      tests/kms_atomic: convert subtests to dynamic subtests
      tests/kms_atomic: check validity of pipe-output combo
      tests/kms_atomic: add flexibility to run tests on all pipes
      tests/intel/kms_pm_rpm: use linear modifier
      tests/intel/kms_pm_rpm: add XE support
      lib/igt_kms: cosmetic changes
      lib/igt_kms: add get_num_scalers()
      tests/kms_plane_scaling: use get_num_scalers()
      lib/igt_dsc: update debugfs
      lib/dsc: fix documentation style
      lib/dsc: add helpers for vdsc fractional bpp debugfs entry
      tests/intel/kms_dsc: enable validation for vdsc fractional bpp
      tests/intel/kms_dsc: add test to validate fractional bpp with input bpc
      tests/intel/kms_dsc: remove redundant documentation
      tests/kms_feature_discovery: check display support only
      tests/kms_feature_discovery: add display-1x test
      tests/intel/kms_psr: fix documentation
      tests/kms: fix buckets and mega features
      intel-ci/xe.blocklist: add i915 specific tests
      intel-ci/xe.blocklist: fix regex
      tests/intel/kms: add \n
      intel-ci: remove chamelium/psr blacklists
      tests/intel/kms_dsc: add new constraint
      tests/kms: fix doc pixel format functionality

Tejas Upadhyay (2):
      tests/xe_drm_fdinfo: Add tests to read and verify fdinfo
      tests/intel/xe_exec_queue_property: remove persistence queue subtest

Thomas Hellström (4):
      tests/xe/xe_prime_self_import: Adjust buffer object sizes to min alignment
      tests/intel/xe: Adjust to KMD uAPI changes for long-running VMs
      tests/intel/xe_evict: Reduce allocations to maximum working set
      tests/intel/xe_evict: Reduce the "large" bo size for threaded eviction

Tim Huang (3):
      lib/amdgpu: correct the GFX1150 and GFX1151 IDs range
      lib/amdgpu: add GFX1152 to GFX1150 family
      tests/amdgpu: fix secure bounce test failure on APUs

Tom Chung (3):
      tests/amdgpu/amd_abm: Fix ABM level setting
      tests/amdgpu/amd_replay: Add amd_replay IGT test
      tests/amdgpu/amd_abm: Remove the modeset for ABM level setting

Trigger Huang (1):
      tests/amdgpu: enable amd_deadlock test on Renior

Tvrtko Ursulin (16):
      tools/intel_gpu_top: Restore user friendly error message
      tools/intel_gpu_top: Fix clients header width when no clients
      tools/intel_gpu_top: Fix client layout on first sample period
      tools/intel_gpu_top: Optimise interactive display a bit
      tools/intel_gpu_top: Handle narrow terminals more gracefully
      tests/i915/drm_fdinfo: Check engine info is supported
      tests/i915/drm_fdinfo: Stress test context close versus fdinfo reads
      tests/i915/drm_fdinfo: Add some memory info tests
      lib/igt_drm_fdinfo: Copy over region map name on match
      lib/igt_drm_clients: Fix client id type confusion
      lib/igt_drm_clients: Allow passing in the memory region map
      tools/intel_gpu_top: Fully wrap clients operations
      tools/intel_gpu_top: Add per client memory info
      tools/intel_gpu_top: Add ability to show memory region breakdown
      tools/intel_gpu_top: Fix near full percentage bar formatting
      tools/gputop: Fix engine columns with amdgpu

Umesh Nerlige Ramappa (7):
      tests/intel/xe_query: Add a test for querying engine cycles
      lib/i915/perf: Add ARL support in IGT perf library
      tests/intel/xe_drm_fdinfo: Rename basic to basic-memory test
      tests/intel/xe_drm_fdinfo: Add basic-engine-utilization test
      tests/intel/xe_drm_fdinfo: Add single engine tests
      tests/intel/xe_drm_fdinfo: Add tests to verify all class utilization
      tests/intel/xe_drm_fdinfo: Ensure queue destroy records load correctly

Venkata Ramana Nayana (2):
      tests/xe/perf_pmu: Tests for the XE pmu interface
      tests/xe/perf_pmu: Tests for the XE pmu interface

Vidya Srinivas (1):
      tests/kms_vrr: Reset to High refresh rate before begin drrs test

Vignesh Raman (5):
      lib/igt_kms: Fix memory corruption
      tests: Update test documentation
      intel-ci: Blacklist tests on pipe I to pipe P
      tests/meson.build: Generate test-list for cross build
      docs/chamelium: update broken links

Ville Syrjälä (75):
      tests/kms_frontbuffer_tracking: Remove badstride subtests
      tests/kms_async_flip: Speed up the CRC test on Intel hw
      tools/intel_vbt_decode: Extract dump_panel()
      tools/intel_vbt_decode: Extract panel_str()
      tools/intel_vbt_decode: Change panel indicator from * to (1)
      tools/intel_vbt_decode: Also dump the second panel (panel_type2)
      tools/intel_vbt_decode: Optionally determine panel type from EDID
      lib/kms: Introduce struct igt_forced_connector
      lib/kms: Adjust forced_connectors[] traversal
      lib/kms: Generalize forced_connectors[] to handle arbitrary attributes
      lib/kms: Clear connector_attrs[] upon setting the reset value
      tools/intel_vbt_decode: update vbt defs from kernel
      tools/intel_vbt_decode: Extract default_algorithm()
      tools/intel_vbt_decode: Allow blocks to be named without full decoding
      tools/intel_vbt_decode: Print the block min size
      tools/intel_vbt_decode: Dump AIM offsets
      tools/intel_vbt_decode: Decode the backlight i2c stuff
      tools/intel_vbt_decode: Decode the obsolote DPST supported field
      tools/intel_vbt_decode: Check version before decoding lace_aggressiveness_profile
      tools/intel_vbt_decode: Add version checks for backlight decoding
      tools/intel_vbt_decode: Dump out the backlight entry size
      tools/intel_vbt_decode: Dump MIPI sequences in the order they appear in VBT
      tools/intel_vbt_decode: Decode all the driver feature bits
      tools/intel_vbt_decode: Decode the EFP index
      tools/intel_reg: Fix mchbar register write
      tests/kms_async_flips: Extend the "async flip needs an extra frame" logic
      tests/kms_async_flips: Allow the first async flip to change modifier
      tests/kms_ccs: Test XRGB2101010
      tools/intel_vbt_decode: Finish the s/lvds/lfp/ rename
      tools/intel_vbt_decode: s/dump_sdvo_panel_dtd()/dump_sdvo_lvds_dtd()/
      lib: Define DIV_ROUND_CLOSEST()
      tools/intel_vbt_decode: Fix some tabs
      tools/intel_vbt_decode: Add missing newline
      tools/intel_vbt_decode: Indent ALS dump
      tools/intel_vbt_decode: Use "(LFP<n>)" to indicate LFP panel type
      tools/intel_vbt_decode: Decode the "not HDMI" bit right way up
      tools/intel_vbt_decode: Extract dump_pnp_id()
      tools/intel_vbt_decode: Reuse print_detail_timing_data()
      tools/intel_vbt_decode: Dump the new eDP DSC disable bit
      tools/intel_vbt_decode: Allow dumpers to declare min/max version for the block
      tools/intel_vbt_decode: Use .min_bdb_version to filter out PSR block on pre-165 VBTs
      tools/intel_vbt_decode: Sort dumper table
      tools/intel_vbt_decode: Use struct bdb_sdvo_lvds_dtd
      tools/intel_vbt_decode: Track the SDVO panel type
      tools/intel_vbt_decode: Use find_raw_section() to determine block presence
      tools/intel_vbt_decode: Make device handle names more compact
      tools/intel_vbt_decode: Declare min/max version for child dev handles
      tools/intel_vbt_decode: Decode device handle as a bitmask
      tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit 80c414772d93
      tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit 3e8daf14c47d
      tools/intel_vbt_decode: Dump MIPI config for the correct panel
      tools/intel_vbt_decode: Decode block 3 (Display Toggle Option)
      tools/intel_vbt_decode: Decode block 4 (Mode Support List)
      tools/intel_vbt_decode: Decode block 5 (Generic Mode Table)
      tools/intel_vbt_decode: Decode blocks 6,7,8 (register tables)
      tools/intel_vbt_decode: Decode block 10 (Mode Removal Table)
      tools/intel_vbt_decode: Decode block 12 (Driver Persistent Algorithm)
      tools/intel_vbt_decode: Decode block 15 (Dot Clock Override Table) and block 9 (ALM only)
      tools/intel_vbt_decode: Decode blocks 16,29,31 (Toggle List)
      tools/intel_vbt_decode: Decode blocks 19,30,32 (Display Configuration Removal Table)
      tools/intel_vbt_decode: Decode block 18 (Driver Rotation)
      tools/intel_vbt_decode: Decode block 20 (OEM Customizable Modes)
      tools/intel_vbt_decode: Decode block 21 (EFP List)
      tools/intel_vbt_decode: Decode block 24 (SDVO LVDS PnP ID)
      tools/intel_vbt_decode: Decode block 25 (SDVO LVDS PPS)
      tools/intel_vbt_decode: Decode block 26 (TV Options)
      tools/intel_vbt_decode: Decode block 28 (EFP DTD)
      tools/intel_vbt_decode: Decode block 45 (eDP BFI)
      tools/intel_vbt_decode: Decode block 46 (Chromaticity For Narrow Gamut Panel)
      tools/intel_vbt_decode: Decode block 51 (Fixed Set Mode Table)
      tools/intel_vbt_decode: Decode block 55 (RGB Palette Table)
      tools/intel_vbt_decode: Decode block 57 (Vswing PreEmphasis Table)
      tools/intel_vbt_decode: Decode block 58 (Generic DTD Block)
      tools/intel_vbt_decode: Decode block 253 (PRD Table)
      tools/intel_vbt_decode: Name a few more VBT blocks

Vinay Belgaumkar (5):
      tests/i915_pm_freq_api: Set min/max to expected values
      tests/intel/perf_pmu: Set defaults before frequency test
      tests/intel/xe_gt_freq: Check for RPe freq updates
      test/xe_gt_freq: Add helper to read RPe freq
      tests/xe_gt_freq: Avoid RPe usage in subtests

Vinod Govindapillai (7):
      tests/kms_flip: add possibility to ignore long HPDs
      lib/i915/fbc: print current fbc status if cannot be enabled
      lib/i915/fbc: add fbc frame size check helper functions
      tests/kms_dirtyfb: disable psr feature only if psr possible
      tests/kms_dirtyfb: populate modeinfo before feature support check
      tests/kms_dirtyfb: ensure plane size is within fbc supported limit
      tests/intel/kms_cdclk: skip cdclk tests for bmg

Vitaly Prosyak (22):
      tests/amdgpu: split deadlock tests
      tests/amdgpu: add GFX11 to dispatch tests
      tests/amdgpu: add IP availability condition to deadlock test
      lib/amdgpu: add secure flag to sdma packet
      lib/amdgpu: add support for gang cs
      lib/amdgpu: add a CS helper function
      tests/amdgpu: add gang cs test
      amdgpu/tests: Fix uvd encoder test failure
      tests/amdgpu/amd_vce_enc: Fix test failure
      tests/amdgpu: add fuzzing tests
      tests/amdgpu: add gem create fuzzing test
      tests/amdgpu: improve fuzzing test
      tests/amdgpu/vce_enc: rename file
      tests/amdgpu/vce_enc: disable motion vector test
      lib/amdgpu: allow usage convenient chip info
      tests/amdgpu/gang_cs: skip test for some chips
      lib/amdgpu: refactor deadlock tests
      tests/amdgpu: Add queue reset test
      amdgpu/queue_reset_test: fix list-subtests command failure from script
      tests/amd_queue_reset: Refactor ring sequence for job submissions
      tests/amd_queue_reset: refactor code blocks
      tests/amd_queue_reset: add ability to skip subtest

Vivaik Balasubrawmanian (1):
      tests/intel/gem_pxp: Fix malformed pipectrl command

Zack Rusin (3):
      lib/vmwgfx: Allow using any buffer handle as a surface backing
      tests/vmwgfx: Add a prime test
      tests/vmwgfx: Fix and extend the reference counting test

Zbigniew Kempczyński (72):
      tests/i915_pipe_stress: Remove stack variables
      lib/intel_blt: Release an offset in the allocator on buffer destroy
      lib/intel_blt: Add visible vram flag if object needs to be mapped
      lib/igt_sizes: Add common SZ_* header
      tests/xe_evict_ccs: Add evict ccs test
      intel-ci/xe-fast-feedback: Add two xe_evict_ccs subtests for Xe run
      tests/xe_evict_ccs: Disable compression on platforms without flatccs
      lib/intel_compute: Prepare tgllp compute functions to be dg1 ready
      lib/intel_compute: Add dg1 compute implementation for i915
      lib/rendercopy: Add render-copy xe2 implementation
      lib/intel_batchbuffer: Select xe2 rendercopy for LunarLake
      tests/xe_intel_bb: Use Tile4 instead Y on render subtest
      lib/intel_batchbuffer: Implicitly increase requested bb size for xe
      lib/rendercopy_gen9: Fix Xe2 missing pixels on non-modulo-16 surfaces
      lib/intel_blt: Add helpers for calculating stride and aligned height
      lib/intel_blt: Change surface size calculation
      lib/intel_blt: Use object pitch and aligned height on png write
      tests/xe-ccs: Add tests which exercise small to large blit sizes
      tests/xe_exercise_blt: Exercise small to large fast-copy blits
      lib/igt_draw: Don't call i915 specific ioctls on xe in draw rectangle
      lib/intel_batchbuffer: Add I915_TILING_64 definition
      lib/intel_batchbuffer: Fix intel_bb_dump for Xe
      lib/intel_bufops: Add width and height to intel_buf
      lib/intel_bufops: Simplify buffer dimension calculations
      lib/intel_bufops: Use common helper to fill buffer with pattern
      lib/intel_bufops: Add png dump helper without detiling
      tests/xe_intel_bb: Dump to png without detiling
      lib/rendercopy: Fix Xe2 pixel shader
      lib/intel_blt: Add blitter tile to legacy tile id helper
      lib/intel_bufops: Use printf style filename formatting
      lib/rendercopy_gen9: Add Tile64 support for render-copy
      tests/xe_render_copy: Add render-copy test for xe
      tests/xe_ccs: Separate inc dimension start width
      lib/intel_common: Add placeholder for common i915 and xe functions
      tests/xe_ccs: Simplify subtest skip condition
      lib/intel_blt: Add functions which extract and check object ccs data
      tests/gem|xe_ccs: Check surface ccs data instead of naive comparison
      lib/igt_kmod: Fix sigaction write to uninitialized memory
      tests/xe_evict|exec_threads: Use fd reopen to avoid corrupting global data
      lib/rendercopy: Fix horizontal stride
      lib/intel_batchbuffer: Be ready to use xe2 render-copy on newer hardware
      lib/intel_blt: Rename confusing fb tile to i915 tile
      lib/intel_blt: Add i915 -> blt tile helper converter
      lib/intel_bufops: Store devid on buffer ops creation
      lib/intel_bufops: Restrict tilings on non-flatccs platforms
      lib/intel_bufops: Start supporting compression on Xe2+
      lib/rendercopy_gen9: Separate xe and xe2 compression format
      lib/intel_cmds_info: Define tiling macros
      lib/intel_cmds_info: Introduce render tilings
      lib/intel_blt: Add render tilings and compression support helper
      tests/xe_render_copy: Add subtest which exercises compression
      tests/xe_intel_bb: Use supported tilings instead hardcoded ones
      tests/api_intel_bb: Fix render-ccs subtest hang on DG2
      lib/intel_bufops: Fix offset returned for Tile4
      lib/intel_bufops: Fix mapping/unmapping for i915 and xe
      lib/intel_bufops: Add linear-to-none copy path
      lib/intel_bufops: Add Tile4 in linear_to and to_linear helpers
      lib/intel_bufops: Add Yf tiling
      lib/intel_blt: Add Yf tiling in block-copy
      lib/intel_bufops: Add Ys tiling in linear_to and to_linear path
      lib/intel_bufops: Drop unnecessary Tile4 function assignment
      lib/intel_bufops: Preparation for adding software tiling for Tile64
      lib/intel_bufops: Drop Tile4 swizzling
      lib/intel_bufops: Don't disable x and y on platforms without swizzling
      tools/intel_tiling_detect: Introduce tiling detection tool
      lib/intel_cmds_info: Remove duplicate block-copy tiling definition
      lib/intel_device_info: Add blitter/render definition for BMG
      lib/intel_blt: Fix printing mocs on Xe2+
      lib/rendercopy_gen9: Use AUX_NONE for platforms with unified compression
      tools/lsgpu: Add switch to display gpu pci devices
      tests/intel/xe_intel_bb: Reduce render subtest execution time
      lib|tests: Don't dereference engine outside for_each_ctx_engine macro

git tag: v1.29

https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-1.29.tar.xz
MD5:  a38956517259338638cc2e17e3e8720a  igt-gpu-tools-1.29.tar.xz
SHA1: 0dff15b8a6cc0a3ede227deeeb737c5ef7809eff  igt-gpu-tools-1.29.tar.xz
SHA256: e0fe0d0f088cb50090b212f28b8960fb1e6160c681f5bea0654973aaa9909d8f  igt-gpu-tools-1.29.tar.xz
SHA512: 1bce6cc916b79bee3562cdee945444bfe925efac37c0df61f8adc17b1aade752cb2e31a05c0dc5de5f2c54256f3319cab7ee45014d5d910e16cca50accd2d1ed  igt-gpu-tools-1.29.tar.xz
PGP:  https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-1.29.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEETPf8JI3Czo80u+SPwwTEoxBABekFAmbYVgwACgkQwwTEoxBA
Bel2yRAA3F0sBCpcouNzNlSlR2yiiPfe9ui8FIEYikcRocN6gyhnGsXhsfojs4pV
qIw/NlGHQ3TU7+IB0HCe64UWC+qx5UG0blvN4/zBwKuzUnCBtVvu5eGCa+3pMo60
MrWJEP0sI57uPP3i2W7MbS8Qkrr59kfu5otBgsi+rxW20S848zZMrNbxtwQZY5CG
dZaRGbejOKA/GWOgfihniyjScSmV+ap8Z+NoK6wDJdYCJM3GoeNyMvM3DS6HP3af
5JXssIvbSZQORkJf5V3iwy/Z80BtSNQ4bhLaVF4c9pyyl7+d7jRe6JDbXOM3dxtF
61hv0o0JyEjASZ2v8QGZoydxXlLMUoneHHbES8ot5Lcz9IJ3Fh2vZ1768sME98LO
Sv53GTgaPXQ0zuVoAOD++BamZT6s43uGY/OnbFnI69KJoABYXXF6uQq1BcVFtaR5
Id/B0gDD+Yz5oSdnfjN2JuOmUkuxNuxCtj22FYccImxEgRTNjCyqw9kBw1OFF1FJ
jczHYhDSx06jUWU8Hj7YdH7DRFjtDYaNY58W6PeJYhWm81XWWRMxH1s1O7/cu0HJ
5/y1D0rdOTSMUbwdyzV1wbawVv084lRWHDiOPpEQBFW6dcAPUC5nIejOLRg/FCUr
jmjquJIHhwvfJoRDhJXxNZX0HZT0wojN0r5STFmDZP7R7XIyIyU=
=dmo/
-----END PGP SIGNATURE-----
