Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A848E1061B26
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 11:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B47310E2AA;
	Tue, 31 Mar 2026 11:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBGJak7c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE9A10E2AA
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 11:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774955251; x=1806491251; h=from:date:message-id:to:subject;
 bh=VrYxfKieuNdXCalxpvzVwqcFhPthkzkk2p1vw7kteSY=;
 b=FBGJak7cNbY/N0jUeIoBY7qgZlqTaxT30SyV0IBf890+/Yz97luZ9fVH
 TMfNHVfp9oGdigP3BCl2Nyk9IlpIfJ5kazlxFUBABjiWmXUxx99wGjpnx
 kFGKHsy2nvWu2XwqP2e5vgtcuBMHq8+ZRQCov1crXBDaH5nufqXSEIiE+
 psT9y3YTY7zHsnL/CBqA0hVuXo1tNT1T4Dh3qLB07TmYcM47/OszVw2vc
 90YsKWsnDiSDus8pZZDA28iKEUWMwVF3wy52Gv64BCvNOOOfihLttOJdR
 u1/ERM5BfZZdOyfXmKseuU6QFFXZB/Wkt4ZUvbduJGBsaFeQ5W4+NOinx w==;
X-CSE-ConnectionGUID: 3Zkui5gESNOJGga7j4YGrw==
X-CSE-MsgGUID: b6FY9tcIRgG2AOreO1ADAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75135717"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="75135717"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 04:07:27 -0700
X-CSE-ConnectionGUID: gHv0MBjfRFOwjNdrJCvR1A==
X-CSE-MsgGUID: FBpaEVi+QgSlWFBe35qAmw==
X-ExtLoop1: 1
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 04:07:24 -0700
From: kamil.konieczny@linux.intel.com
Date: Tue, 31 Mar 2026 13:07:22 +0200
Message-ID: <82352ddc32109eefa0a06c8df3c8c8e4.kamil.konieczny@linux.intel.com>
To: xorg-announce@lists.x.org
Cc: xorg@lists.x.org
Cc: igt-dev@lists.freedesktop.org
Subject: [ANNOUNCE] igt-gpu-tools 2.4
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

Release 2.4 (2026-03-31)
- ------------------------

General changes:

- - libpci is new required library for building and running tests. (Janusz
  Krzysztofik)

Runner changes:

- - jansson library replaced json-c in igt_runner. (Ryszard Knop, Kamil
  Konieczny)

Library changes:

- - Big refactor to move from pipe to CRTC index (Jani Nikula, Ville Syrjälä)

- - Added PCI ids for WildcatLake and NovaLake-P. (Himanshu Girotra)

- - Improved and extending Intel compute kernels for new GPUs. (Zbigniew
  Kempczyński)

- - Added wrappers for painting test patterns to framebuffers and simplifing
  tests using it. (Karthik B S)

- - Added 1D LUT and Gamma 2.2 support in colorpipeline API. (Alex Hung)

- - Added selective sync skipping for error injection tests on AMDGPU. (Jesse
  Zhang)

Test changes:

- - New amd_dmabuf_unload test that validates fence independence during amdgpu
  module unload with cross-driver (VGEM) DMA-BUF shared reservations.
  (Vitaly Prosyak)

- - Skip all kms_flip subtests on MediaTek. (Xiandong Wang)

- - New test xe_non_msix for compute walker interrupt notification on non
  msix mode. (Priyanka Dandamudi)

- - Enable planar-pixel-format-settings subtests to pass on VKMS. (Renjun Wang)

- - New kms_explicit_fence test to explicit fencing for multiple planes
  and a single atomic commit. (S Sebinraj)

- - New test xe_prefetch_fault for L1/L2 prefetch fault handling support.
  (Priyanka Dandamudi)

- - New amd_cross_gpu_sync test that simulates a render on GPU-A and
  display on GPU-B pipeline. (Vitaly Prosyak)

- - Added 10-bit color depth support to CTM test. (Jason-JH Lin)

- - Improved VCN JPEG submission for AMDGPU. (Tessita Thomas)

- - New xe_svm_usrptr_madvise for GPU memory operations between SVM-allocated
  memory and userptr memory with explicit madvise and preferred location
  hints. (Nishit Sharma)

- - New xe_multigpu_svm test for SVM multi-GPU xGPU memory access hints. (Nishit
  Sharma)

- - New xe_sriov_admin SR-IOV test for admin sysfs scheduling attributes. (Marcin
  Bernatowicz)

- - New kms_color_pipeline for Intel plane pipeline tests with LUT1D and CTM.
  (Swati Sharma)

- - Added FBC support to FP16 formats in kms_frontbuffer_tracking.(Pranay Samala)

- - Added SVM compute tests in xe_exec_system_allocator to allow triggering GPU
  page faults from the context of execution units. (Francois Dugast)

- - New amd_cursor_overlay test for native cursor fallback to overlay. (Ivan
  Lipski)

- - New buffer object allocation test for MSM. (Jitta Vignan)

- - Added VM_BIND tests for partial huge page unmaps for panthor.(Adrián Larumbe)

Tools changes:

- - Improved intel_hdcp. (Santhosh Reddy Guddati)

- - Improved vmtb for SR-IOV, also enabling PTL and BMG support. (Adam Miszczak)

- - intel_gpu_top now explicitly reject Xe devices and informs to use gputop.
  (Sebastian Brzezinka)

- - Add GPU frequencies to gputop. (S Sebinraj)

- - lsgpu now shows correct link bandwidth information for discrete GPUs. (Janusz
  Krzysztofik)

- - Improved lsgpu to iterate over all matching devices when using filters.
  (Zbigniew Kempczyński)

- - Improved intel_vbt_decode and intel_display_poller. (Ville Syrjälä)


And many other bug fixes, improvements, cleanups and new tests.


Adam Miszczak (10):
      tools/vmtb: Update QEMU parameters
      tools/vmtb: Fix DUT selection based on card index
      tools/vmtb: Fix VM snapshot query handling
      tools/vmtb: Extend IGT and WSIM abstractions
      tools/vmtb: VF auto/fair provisioning support
      tools/vmtb: Refactor driver interfaces
      tools/vmtb: Introduce VirtualDevice class
      tools/vmtb: Redesign VirtualMachine class
      tools/vmtb: Support max VFs configuration
      tools/vmtb: Platform enabling: PTL and BMG support

Aditya Chauhan (3):
      intel-ci: Add NVL core blocklist
      intel-ci: Add NVL Display blocklist to meson.build
      tests/intel/xe_exec_multi_queue: Update test documentation

Adrián Larumbe (2):
      panthor: Allow specifying offset when mapping a BO against a VM
      tests/panthor: Add VM_BIND tests for partial huge page unmaps

Alex Hung (8):
      lib/igt_kms: Increase MAX_NUM_COLOROPS
      lib/igt_color: Improve fb compare time
      README: Update oneliner build command for igt_runner
      tests/kms_atomic: Fix overflow in immutable-zpos
      tests/kms_hdr: Fix typo ST2048 to ST2084
      tests/amdgpu: Add a driver-unload memory leak test
      tests/kms_colorop: Update gamma 2.2 LUT names
      lib/tests: Fix gamma 2.2 naming

Andrzej Hajda (1):
      lib/gpgpu_shader: Add support for xe3p efficient 64bit addressing

Ashutosh Dixit (4):
      drm-uapi/xe: Sync with DRM_XE_OA_UNIT_TYPE_MERT definition
      tests/intel/xe_oa: Add MERT OA unit
      tests/intel/xe_oa: Also print oa_unit_type
      tests/intel/xe_oa: Delete disabled-read-error subtest

Balasubramani Vivekanandan (2):
      tests/intel/xe_fault_injection: Remove probe function wait_for_lmem_ready
      tests/intel/xe_exec_basic: Enable dynamic subtest

Chaitanya Kumar Borah (5):
      tests/kms_color_pipeline: Restore plane color pipeline to Bypass on cleanup
      tests/kms_color_pipeline: use atomic commit helper consistently
      tests/kms_color_pipeline: Run tests on all supported planes
      tests/kms_color_pipeline: Disable pipe color properties in test setup
      tests/kms_color_pipeline: collect reference CRC once per pipe

Chenyu Chen (1):
      tests/kms_properties: Add panel_type to immutable property list

Christoph Manszewski (4):
      drm-uapi-experimental/xe_drm_eudebug: Adjust eudebug uapi numbers
      xe/xe_eudebug: Add reattach function and make plain connect private
      lib/xe/xe_eudebug: Track active debugger sessions and close when disabling
      lib/xe/xe_eudebug: Get drm card sysfs path

Dominik Karol Piątkowski (3):
      tests/xe_eudebug_online: Skip canary check in set-breakpoint-sigint-debugger
      tests/xe/xe_eudebug: Change pthread_join to pthread_timedjoin_np
      lib/xe/xe_eudebug: Modify toggle error handling

Francois Dugast (8):
      tests/intel/xe_exec_system_allocator: Cleanup compute test
      lib/intel_compute: Allow user to override compute kernel loop_count
      tests/intel/xe_exec_system_allocator: Add new SVM compute tests
      tests/intel/xe_exec_system_allocator: Fix compute array migration size
      tests/intel/xe_exec_system_allocator: Allow looping in compute
      tests/intel/xe_exec_system_allocator: Add hw engine argument for compute
      tests/intel/xe_exec_system_allocator: Print page fault duration in compute
      tests/intel/xe_exec_system_allocator: Comment compute output buffer

Gwan-gyeong Mun (1):
      lib/[gpu_cmds|xehp_media]: Introduce gpu execution commands for an efficient 64bit mode.

Himanshu Girotra (7):
      lib/intel_pat: use kernel debugfs as authoritative PAT source for Xe
      lib/intel_pat: Cache PAT config for unprivileged processes
      lib/pciids: sync with kernel commit be07d8f707e4
      lib: Add NVL-P support
      lib: Add WildcatLake support
      lib: Add WildcatLake to compute kernel tables
      lib/intel_pat: add hardcoded PAT fallback for older kernels

Ivan Lipski (1):
      tests/amdgpu: Add test for native cursor fallback to overlay

Jakub Kolakowski (2):
      tests/intel/xe_test_config: Add SR-IOV VF FULL testlist
      intel-ci: Add xe.wcl.core.blocklist.txt

Jan Maslak (1):
      lib/gpgpu_shader: set r1.4 to dim.x

Jani Nikula (77):
      lib/igt_kms: Drop the ioctl fallback for CRTC id to pipe mapping
      lib/igt_kms: Remove kmstest_pipe_to_index()
      tests/kms_setmode: drop redundant drmModeGetCrtc() call
      tests/kms_setmode: use CRTC index instead of pipe for intel_drrs_disable()
      tests/kms_setmode: use __intel_get_pipe_from_crtc_index() directly
      lib/igt_kms: Always return CRTC index from kmstest_get_pipe_from_crtc_id()
      lib/igt_debugfs: rename igt_debugfs_pipe_dir() to igt_debugfs_crtc_dir()
      lib/i915/drrs: switch the interface from pipe to CRTC index
      tools/intel_display_crc: fix DRM device selection
      lib/igt_kms: rename igt_crtc_t crtc_offset member to crtc_index
      lib/igt_kms: rename the rest of crtc_offset to crtc_index
      lib/kms: rename struct kmstest_connector_config pipe member to crtc_index
      lib/igt_kms: rename _kmstest_connector_config_find_encoder() pipe parameter to crtc_index
      tests/kms_flip: switch to CRTC index terminology
      tests/testdisplay: switch to CRTC index terminology
      lib/igt_kms: use for_each_crtc() for iterating CRTCs
      lib/igt_kms: rename kmstest_get_vblank() param to crtc_index
      lib/igt_kms: remove __get_crtc_mask_for_pipe()
      lib/igt_kms: pass crtc to igt_crtc_init()
      lib/igt_kms: use for_each_crtc() for cleaning up CRTCs
      lib/kms: convert output->pending_pipe to output->pending_crtc
      lib/kms: add igt_next_crtc()
      tests/intel/gem_pxp: use igt_next_crtc()
      tests/intel/xe_pxp: use igt_next_crtc()
      tests/kms_multipipe_modeset: use igt_next_crtc()
      lib/kms: add igt_random_crtc() and use it in gem_eio
      lib/kms: add some braces for clarity in __igt_pipe_populate_outputs()
      lib/kms: use for_each_crtc() in __igt_pipe_populate_outputs()
      lib/kms: avoid mixing CRTC index and pipe masks in __igt_pipe_populate_outputs()
      tests/kms_writeback: use igt_crtc_name()
      tests/kms_colorop: use igt_crtc_name()
      tests/kms_color_pipeline: use igt_crtc_name()
      tests/kms_cursor_crc: use CRTC indexes instead of pipes for CRTC tracking
      tests/kms_cursor_edge_walk: use CRTC indexes instead of pipes for CRTC tracking
      tests/kms_pipe_crc_basic: use CRTC indexes instead of pipes for CRTC tracking
      tests/kms_plane_alpha_blend: use CRTC indexes instead of pipes for CRTC tracking
      tests/kms_vblank: use CRTC indexes instead of pipes for CRTC tracking
      tests/kms_cursor_legacy: use CRTC indexes instead of pipes for CRTC tracking
      tests/kms_debugfs: use CRTC indexes instead of pipes for fb tracking
      lib/i915/fbc: switch the interface from pipe to CRTC
      lib/kms: add and use igt_crtc_debugfs_dir()
      lib/kms: add igt_crtc_for_crtc_index()
      lib/i915/drrs: convert the interface to igt_crtc_t
      Revert "lib/i915/intel_fbc: Add fbc supported check based on wa"
      lib/i915/fbc: make intel_fbc_max_plane_size() static
      lib/i915/fbc: pass display to intel_fbc_plane_size_supported()
      lib/i915/fbc: convert intel_fbc_{enable, disable}() into proper functions
      lib/i915/fbc: convert intel_fbc_supported_for_psr_mode() to igt_display_t*
      tests/amdgpu/amd_mode_switch: switch to for_each_crtc()
      tests/prime_vgem: partial conversion to igt_crtc_t *
      tests/intel/kms_pipe_stress: use CRTC index not pipe for vblank ioctl
      lib/kms: fix igt_crtc_connector_valid() validity check
      lib/igt_debugfs: remove mode parameter from igt_debugfs_crtc_dir()
      tests/intel/kms_cdclk: use igt_next_crtc()
      tests/amdgpu/amd_plane: s/crtc->pipe/crtc->crtc_index/
      tests/amdgpu/amd_dp_dsc: s/crtc->pipe/crtc->crtc_index/
      tests/amdgpu/amd_subvp: s/crtc->pipe/crtc->crtc_index/
      tests/amdgpu/amd_hotplug: s/crtc->pipe/crtc->crtc_index/
      tests/amdgpu/amd_multidisplay_modeset: s/crtc->pipe/crtc->crtc_index/
      tests/amdgpu/amd_vrr_range: s/crtc->pipe/crtc->crtc_index/
      tests/kms_atomic_transition: s/crtc->pipe/crtc->crtc_index/
      tests/kms_bw: fix misleading indent
      tests/kms_bw: clarify what's going on with proper variable naming
      tests/kms_bw: avoid igt_crtc_for_pipe() and crtc->pipe usage
      tests/kms_explicit_fence: store igt_crtc_t* instead of pipe in data
      lib/kms: convert igt_crtc_for_pipe() into a proper function
      lib/kms: don't special case igt_get_single_output_for_crtc() implementation
      lib/kms: refactor for_each_crtc_with_single_output() to avoid igt_crtc_for_pipe()
      lib/kms: use CRTC index for __igt_output_crtc_populate()
      tests/amdgpu/amd_multidisplay_modeset: Prepare for returning NULL from igt_crtc_for_pipe()
      tests/intel/kms_joiner: Prepare for returning NULL from igt_crtc_for_pipe()
      tests/intel/kms_joiner_helper: Prepare for returning NULL from igt_crtc_for_pipe()
      tests/intel/kms_pipe_b_c_ivb: Prepare for returning NULL from igt_crtc_for_pipe()
      tests/intel/kms_pipe_stress: Prepare for returning NULL from igt_crtc_for_pipe()
      lib/kms: start returning NULL for invalid pipes from igt_crtc_for_pipe()
      lib/kms: use a for_each_crtc() loop in igt_crtc_for_pipe()
      lib/kms: only keep valid CRTCs in display->crtcs[]

Janusz Krzysztofik (10):
      tests/intel/gem_lmem_swapping: Avoid false failures from oom-killer
      lib/igt_device_scan: Don't print fake link bandwidth attributes
      lib/igt_device_scan: Split out reusable part of update_or_add_parent
      lib/igt_device_scan: Include PCIe bridge upstream port if available
      lib/igt_device_scan: List PCIe bridge ports after their children
      lib/igt_device_scan: Omit AER statistics data from attributes
      lib/igt_device_scan: Print GPU upstream port parent/child relations
      tests/intel/gem_lmem_swapping: Improve concurrency of smem-oom helpers
      tests/intel/gem_lmem_swapping: Be more clear about subprocesses role
      tests/intel/gem_lmem_swapping: Expect gem leak helper crashes

Jason-JH Lin (3):
      tests/kms_color: Add 10-bit color depth support to CTM test for MediaTek
      tests/kms_plane: Add vblank waits for MediaTek CRC timing
      tests/kms_bw: Skip tests when outputs don't support the mode

Jeevan B (4):
      intel-ci: Update display blocklist
      intel-ci: Update argb161616f format tests in display blocklist
      lib/igt_pm: Move DC State Counter Functions to common library
      tests/intel/kms_dirtyfb: Pass output to PSR helpers

Jesse.Zhang (2):
      lib/amdgpu: implement selective sync skipping for error injection tests
      lib/amdgpu: Refactor sched_mask read logic and add XCP partition mode support

Jitta Vignan (1):
      tests/msm: add MSM buffer object allocation tests

Jonathan Cavitt (2):
      tests/intel/xe_exec_multi_queue: No engines in virtual test expected
      tests/intel/kms_fbcon_fbt: Drop igt_device_set_master call

Jouni Högander (4):
      tests/intel/kms_psr2_sf: Drop Early Transport flag from data_t
      tests/intel/kms_psr2_sf: Check pipe and output validity for Selective Fetch test
      tests/intel/kms_psr2_sf: Allow testing of both PSR2 and Panel Replay if supported
      tests/kms_async_flips: Do not skip any tests due to Selective Fetch

Juha-Pekka Heikkila (3):
      tests/intel/i915_module_load: Add kernel default fault injection tests
      tests/intel/i915_module_load: take out reload-with-fault-injection test
      lig/igt_fb: fix x-tiled framebuffers on intel xe driver

Juha-pekka Heikkila (2):
      tests/intel/kms_flip_scaled_crc: add flip to reflect-x tests
      tests/kms_plane: add test and limitations for odd height planar tests

Kamil Konieczny (7):
      tests/panthor/panthor_vm: Fix subtest name
      tests/intel/kms_joiner: Fix var usage
      tests/intel/gem_tiled_pread_basic: Create basic subtest
      Dockerfile.build: Replace json-c with jansson
      panthor: Enable compilation on big-endian arch
      tests/kms_dp_aux_dev: Create basic subtest
      Update NEWS, bump version to 2.4

Karthik B S (15):
      Revert "tests/intel/kms_joiner: Cleanup igt_require checks"
      tests/intel/kms_joiner: Add function for pretest checks
      lib/igt_fb: Add wrappers for painting test patterns to framebuffers
      tests/intel/kms_mmap_write_crc: Use lib function to paint fb
      tests/kms_hdr: Use lib function to paint fb
      tests/amdgpu/amd_assr: Use lib function to paint fb
      lib/igt_kms: Add helper to validate modes
      tests/kms_joiner: Add check to validate mode
      intel-ci: Add 3D lut tests to display blocklist
      tests/intel/kms_flip_scaled_crc: Move require checks at the beginning of the subtest
      tests/amdgpu/amd_jpeg_dec: Fix compilation warnings
      intel-ci: Add valid skips on kms_plane to display blocklist
      intel-ci: Add tests applicable after display 35 to blocklist
      intel-ci : Unblocklist HDCP type1 subtests
      intel-ci/xe: Block async-flip with linear modifier

Karthik Poosa (3):
      tests/intel/hwmon: Check temperature limit in hwmon-read
      lib/igt_device: Add API to get pci device upstream port
      tests/intel/xe_pm_residency: Add subtest for ASPM Link state residency

Kunal Joshi (1):
      intel-ci: Update BMG display blocklist

Lukasz Laguna (4):
      tests/intel/xe_wedged: Skip subtests using wedged_mode=2 in SR-IOV cases
      tests/intel-ci/xe.sriov-vf.blocklist: add xe_live_ktest
      tests/intel/xe_sriov_vram: Add support for multitile platforms
      lib/igt_device_scan: Fix attributes fetching

Maaz Mombasawala (1):
      lib/vmwgfx: Fix null mob in vmw_ioctl_buffer_create

Marcin Bernatowicz (19):
      lib/igt_sysfs_choice: Add helpers for sysfs enumerated choice attributes
      lib/tests/igt_sysfs_choice: Add test coverage
      lib/xe/xe_sriov_provisioning: Add string conversion helpers for scheduling priority
      lib/xe/xe_sriov_provisioning: Add sched priority mask to string helper
      lib/igt_sriov_device: Add helper for PF/VF sysfs path formatting
      lib/xe/xe_sriov_admin: Add SR-IOV admin sysfs accessors
      tests/intel/xe_sriov_scheduling: Avoid assert on scheduling params restore in cleanup
      tests/intel/xe_sriov_scheduling: Prefer SR-IOV admin sysfs accessors
      tests/intel/xe_pmu: Prefer SR-IOV admin sysfs accessors
      tests/intel/xe_sriov_admin: Add SR-IOV admin sysfs scheduling attributes tests
      tests/core_hotunplug: Skip unplug when sysfs 'remove' is missing
      lib/igt_sriov_device: Add helper to get VF PCI slot address
      lib/igt_pci: Add generic PCI driver override and bind/unbind helpers
      tests/intel/xe_sriov_flr: Attach VFs to xe-vfio-pci before initiating FLR
      lib/igt_kmod: Fix PCI bind/unbind for module/driver name mismatch
      tests/intel/xe_sriov_flr: Add --wait-flr-ms option
      tests/intel/xe_sriov_flr: Add --no-xe-vfio-pci option
      tests/intel/xe_sriov_flr: Add basic FLR subtest
      tests/intel/xe_sriov_flr: Add --extended for flr-basic

Matt Roper (2):
      tests/intel/xe_exec_balancer: Report skip when test is unable to run
      tests/intel/xe_debugfs: Add subtest for reg_sr programming failures

Michał Grzelak (3):
      xe/igt_kmod_unbind: release audio before unbinding xe
      tests/device_reset: unload audio before descriptor closure
      tests/device_reset: unload audio on xe as well

Mohammed Bilal (11):
      tests/intel-ci/chamelium-only.testlist: Enable additional Chamelium tests
      tests/chamelium/kms_chamelium: Add connector_test() macro
      tests/chamelium/kms_chamelium: use helper function for connector lookup in DP/HDMI/VGA tests
      tests/chamelium: Rename connector_test to connector_subtest
      tests/kms_vrr: Skip LOBF test when aux-less ALPM is not enabled
      lib/igt_kms: Fix invalid mode timing for 2288x1287
      intel-ci: Move suspend/resume chamelium tests to end
      intel: Add Xe FULL chamelium run type to kms_test_config
      intel-ci: Add VGA chamelium exclusion to Xe blocklist
      intel-ci: Enable hdmi 4k resolution test in chamelium testlist
      intel-ci: Add *-planes-random chamelium test to Xe blocklist

Mohammed Thasleem (1):
      tests/intel/kms_pm_rpm: Fix CRTC conflicts in output selection

Nakshtra Goyal (2):
      tests/intel/xe_exec_threads: Initializing exec_threads array
      tests/intel/xe_pat: Add negative subtest for PAT index

Naladala Ramanaidu (5):
      tests/kms_plane: Split pixel‑format validation into modifier specific
      tests/kms_plane: Speed up simulation by limiting YUV range tests
      tests/kms_plane: skip cursor clamping to avoid false positives
      tests/kms_vrr: Avoid LOBF debugfs loss by checking during active display
      lib/igt_kms: Fix joiner force debugfs entry and expected value

Nemesa Garg (1):
      tests/kms_plane: modify the condition for odd pan

Niranjana Vishwanathapura (3):
      Revert "tests/intel/xe_exec_multi_queue: Keep group active in exec-sanity"
      Revert "tests/intel/xe_exec_multi_queue: Sanity test KEEP_ACTIVE flag"
      drm-uapi/xe: Remove multi-queue KEEP_ACTIVE flag

Nishit Sharma (21):
      drm-uapi/xe: Sync with madvise interface
      lib/xe: Add instance parameter to xe_vm_madvise
      lib/xe: Add synchronous helpers for VM bind/unbind operations
      tests/intel/xe_multigpu_svm: Add SVM multi-GPU xGPU memory access test
      tests/intel/xe_multigpu_svm: Add SVM multi-GPU atomic operations
      tests/intel/xe_multigpu_svm: Add SVM multi-GPU coherency test
      tests/intel/xe_multigpu_svm: Add SVM multi-GPU performance test
      tests/intel/xe_multigpu_svm: Add SVM multi-GPU fault handling test
      tests/intel/xe_multigpu_svm: Add SVM multi-GPU simultaneous access test
      tests/intel/xe_multigpu_svm: Add SVM multi-GPU conflicting madvise test
      tests/intel/xe_multigpu_svm: Add SVM multi-GPU migration test
      tests/intel/xe_multigpu_svm: Add test documentation for Mega MultiGPU feature
      tests/intel/xe_exec_system_allocator: Add igt_info instead of igt_warn
      tests/intel/xe_module_load: Unload drivers before force-probe
      tests/intel/xe_svm_usrptr_madvise: Add SVM to userptr copy test with madvise
      tests/intel/xe_exec_system_allocator: Add helpers to enable and reset hugepages for test execution
      tests/intel/xe_exec_store: Validate PCIe6 relax ordering
      tests/intel/xe_exec_store: Extend test coverage to all memory regions
      lib/xe: Introduce aligned buffer mapping
      tests/intel/xe_svm_usrptr_madvise: Unify batch buffer alignment
      tests/intel/xe_exec_system_allocator: Skip madvise-pat-idx-uc-comp-* on PVC

Nitin Gote (3):
      tests/intel/xe_configfs: Reset configfs group after each subtest
      tests/intel/xe_ccs: add VM_BIND DECOMPRESS flag and basic decompression tests
      tests/intel/xe_configfs: Skip ctx-restore subtests on SR-IOV VF

Pawel Sikora (1):
      tests/intel/xe_exec_multi_queue: update test doc

Piotr Rudnicki (4):
      intel-ci: add eudebug tests to multigpu blocklist
      tests/xe_eudebug_online: Extract workload start helpers
      lib/xe_eudebug: Add pipe validation and cleanup improvements
      tests/intel/xe_eudebug_online: test_interrupt_other wait fix

Pranay Samala (8):
      Avoid crash from uninitialized pipe_crc pointer
      tests/intel/kms_frontbuffer_tracking: Add FBC support to FP16 formats
      tests/kms_plane: Skip cursor plane for source clamping
      tests/kms_plane: Skip unsupported modifiers
      tests/kms_plane: Optimize modifier check for unsupported platforms
      lib/igt_kms: Add helper to get non-joiner mode
      tests/intel/kms_sharpness_filter: Detect and bypass joiner modes
      tests/intel/kms_sharpness_filter: Fix stale mode pointer in joiner bypass

Priyanka Dandamudi (13):
      tests/intel/xe_exec_fault_mode: Add multi-queue test support
      tests/intel/xe_evict: Add basic multi-queue test
      tests/intel/xe_evict: Add multi-queue priority test
      tests/intel/xe_evict: Enhance testing of multi-queue functionality
      tests/intel/xe_exec_threads: Add multi-queue basic test
      tests/intel/xe_exec_threads: Add multi queue for compute mode
      tests/xe_pat: Add pat indices for XA App Transient in false-sharing test
      tests/intel/xe_pat: Use intel_get_defer_to_pat_mocs_index() to exercise coherency
      tests/intel/xe_pat: Validate XA App Transient feature
      scripts/generate_iga64_codes: Add support for xe3p and xe3
      tests/intel/xe_prefetch_fault: Add test for prefetch fault
      lib/gpu_cmds: Add support for compute walker interrupt
      tests/intel/xe_non_msix: Test compute walker interrupt on non msix

Ray Wu (1):
      tests/amdgpu/amd_ilr: add disallow replay debugfs and fix CRC read timeout

Renjun Wang (2):
      tests/kms_plane: Allow planar-pixel-format-settings to pass on VKMS
      lib/igt_fb: add YUV|YVU-410|411|444 formats

Ryszard Knop (4):
      runner: Use Jansson in resultgen instead of json-c
      runner/tests: Fix JSON test data
      runner: Add an on-demand test for large files
      lib/uwildmat: Move to a dedicated vendored library directory

S Sebinraj (2):
      tools/gputop: Add GPU frequencies to the client headers
      tests/kms_explict_fence: Add Test for Explicit Fencing

Sai Teja Pottumuttu (1):
      tests/intel/kms_big_fb: NVL supports horizontal flip with linear surfaces

Sanjay Yadav (2):
      include/drm-uapi-experimental: Remove DRM_XE*NO_COMPRESSION macros
      lib/intel_pat: Handle platforms without compressed PAT index

Santhosh Reddy Guddati (16):
      tests/kms_content_protection: Add force HDCP 1.4 subtest
      tests/kms_content_protection: Split dp-mst-suspend-resume tests
      tools/intel_hdcp: Basic init and cleanup for hdcp, constants, enums
      tools/intel_hdcp: Rename variable c to connector
      tools/intel_hdcp: Function to get valid HDCP output
      tools/intel_hdcp: Add helper to set HDCP properties
      tools/intel_hdcp: Add helper to get HDCP status
      tools/intel_hdcp: Add helper to get HDCP content type
      tools/intel_hdcp: Display HDCP details for connectors.
      tools/intel_hdcp: Interactive keypress thread for menu
      tools/intel_hdcp: Add video playback loop with thread
      tools/intel_hdcp: Add interactive control with playback
      tools/intel_hdcp: Implement timer to the video playback
      tests/kms_content_protection: Fix multi outputs using same pipe
      tests/kms_async_flips: Fix PSR2 selective fetch check for cursor tests
      tests/kms_content_protection: Get HDCP capable outputs before modeset

Sasha McIntosh (2):
      tests/kms_colorop: Include local glib header for Android
      include/android: Define additional types in glib.h

Sebastian Brzezinka (3):
      tools/intel_gpu_top: prevent losing original pointer on realloc failure
      tools/intel_gpu_top: fix JSON comma tracking with per-level state
      tools/intel_gpu_top: explicitly reject Xe devices

Shuicheng Lin (3):
      tests/intel/xe_exec_compute_mode: Fix tmpfile open mode
      lib/intel_compute: Add loop_kernel_duration support for xe3p
      tests/intel/xe_fault_injection: Close drm fd before unbind

Sk Anirban (2):
      tests/intel/xe_gt_freq: Modify test to support new throttle reasons sysfs
      lib/xe/xe_gt: debug print C-state for non-C6 states

Soham Purkait (3):
      lib/xe/xe_spin: Introduce xe_spin_reset
      lib/xe/xe_spin: Export xe_spin_sync_wait
      tests/intel/xe_pmu: Refine engine activity accuracy test

Sowmiya S (1):
      tests/kms_explicit_fence: Separate feature tag block from test description

Suraj Kandpal (1):
      tests/kms_universal_plane: Add vblank wait for cursor fb leak

Swati Sharma (9):
      lib: Refactor color pipeline helpers
      tests/kms_colorop_helper: Add helpers to clear colorops data
      tests/kms_colorop_helper: Cast pixel values to double
      tests/kms_color_pipeline: Add Intel plane pipeline tests with LUT1D and CTM
      tests/kms_color_pipeline: Add 3D LUT subtest for green-only output with RGB traversal
      intel-ci: Add NVL display blocklist
      tests/intel/kms_test_config: Add NVL display blocklist entry
      intel-ci: Block deep-pkgc in NVL display
      intel-ci: Blocklist BMG specific modifiers on NVL/PTL

Tessita Thomas (3):
      lib/amdgpu/amd_mmd_shared: Fix VCN JPEG submission
      tests/amdgpu/amd_jpeg_dec: Add VCN JPEG IB alignment
      lib/amdgpu/amd_jpeg_shared: Fix JPEG decode on VCN 5.x with correct register offsets

Varun Gupta (1):
      tests/intel/xe_prefetch_fault: Add SVM and hit-under-miss validation

Ville Syrjälä (164):
      tests/intel/kms_dp_linktrain_fallback: Reduce side effects in igt_output_set_pipe() args
      lib/kms: Introduce igt_display_n_crtcs()
      lib/kms: Use igt_display_n_crtcs() everywhere
      lib/kms: Introduce igt_crtc_for_pipe()
      lib/kms: Use igt_crtc_for_pipe() everywhere
      lib/kms: Remove tall tales about 'pipe' in DRM_IOCTL_WAIT_VBLANK
      lib/kms: Pass the entire igt_pipe_t to igt_wait_for_vblank*()
      lib/kms: Introduce igt_output_set_crtc()
      lib/kms: Replace igt_output_set_pipe() with igt_output_set_crtc()
      lib/kms: Rename igt_pipe_t to igt_crtc_t
      lib/kms: Extract igt_crtc_init()
      lib/kms: Nuke 'n_planes' from igt_crtc_init()
      lib/kms: Nuke 'last_plane' from igt_crtc_init()
      lib/kms: Get rid of the 'p' plane index variable
      lib/kms: Extract igt_crtc_plane_init()
      lib/kms: Nuke pipe->plane_primary
      lib/kms: Nuke pipe->plane_cursor
      lib/kms: Use '{old,new}_primary' variable names in plane swapping
      lib/kms: Pimp the primary plane swapping
      lib/kms: Extract plane_type_index()
      lib/kms: Streamline plane index handling further
      tests/kms_plane_cursor: s/or/rect/
      tests/intel/i915_pm_rpm: Nuke bogus NULL check
      tests/kms_rotation_crc: s/0/PIPE_A/
      lib/kms: Nuke pipe_select()
      lib/kms: Simplify kmstest_get_vbl_flag()
      tests/kms_async_flips: Use designated initializers in wait_for_vblank()
      tests/intel/kms_pipe_stress: Eliminate double display.drm_fd initialization
      lib/kms: Turn igt_pipe_connector_valid() into a function
      igt/kms: Nuke igt_pipe_is_prop_changed() and igt_pipe_set_prop_value()
      lib/kms: Rename igt_pipe_obj_*_prop()
      lib/kms: Pass igt_crtc_t to igt_pipe_refresh()
      lib/kms: Don't pass 'display' to igt_fill_pipe_props()
      lib/kms: Rename a bunch of crtc functions
      lib/kms: Eliminate some redundant igt_crtc_for_pipe()s
      lib/crc: Convert igt_pipe_crc away from enum pipe
      lib/kms: Add igt_crtc_t based CRC wrappers
      lib/kms: Use igt_crtc_crc_new()
      lib/kms: Use igt_crtc_crc_new() more
      lib/kms: Use igt_crtc_crc_new_nonblock() more
      lib/kms: Use igt_crtc_crc_new() even more
      tests/kms_content_protection: Convert igt_pipe_is_free() to igt_crtc_is_free()
      lib/kms: Hide output->pending_pipe from tests
      lib/kms: s/igt_output_get_driving_pipe()/igt_output_get_driving_crtc()/
      lib/kms: s/n_pipes/n_crtcs/
      lib/kms: Rename display->pipes[] to display->crtcs[]
      lib/kms: Rename plane->pipe to plane->crtc
      lib/kms: Rename old_pipe to old_crtc
      lib/kms: Rename 'pipe' variables to 'crtc'
      lib/kms: Rename 'pipe[]' variables to 'crtc[]'
      lib/kms: Use igt_crtc_name() where appropriate
      lib/kms: Introduce for_each_crtc*()
      tests/drm_read: Use for_each_crtc*()
      tests/kms_plane_scaling: Use for_each_crtc*()
      tests/kms_color: Convert to for_each_crtc*()
      tests/intel/kms_pm_dc: Use for_each_crtc*()
      tests/kms_rotation_crc: Use for_each_crtc*()
      tests/kms: Use for_each_crtc_with_single_output() and for_each_crtc()
      tests/kms: Use for_each_crtc_with_single_output(), part 1
      tests/kms: Use for_each_crtc_with_single_output(), part 2
      tests/kms: Use for_each_crtc_with_single_output(), part 3
      tests/kms: Use for_each_crtc_with_valid_output(), part 1
      tests/kms: Use for_each_crtc_with_valid_output(), part 2
      tests/kms: Use for_each_crtc_with_valid_output(), part 3
      tests/kms: Use for_each_crtc_with_valid_output(), part 4
      lib/kms: Nuke for_each_pipe_with_*_output()
      tests/intel/kms_frontbuffer_tracking: Convert to for_each_crtc()
      tests/intel/kms_legacy_colorkey: Convert to for_each_crtc()
      tests/kms: Convert problematic tests to use for_each_crtc()
      tests/kms: Use for_each_crtc() for inner loops
      tests/amdgpu/amd_multidisplay_modeset: Clean up some for_each_pipe() local 'crtc' variables
      tests/kms: Convert to for_each_crtc(), part 1
      tests/kms: Convert to for_each_crtc(), part 2
      tests/kms: Convert to for_each_crtc(), part 3
      tests/kms: Convert to for_each_crtc(), part 4
      tests/kms: Convert to for_each_crtc(), part 5
      tests/kms: Convert to for_each_crtc(), part 6
      lib/kms: Nuke for_each_pipe()
      tests/kms: Clean up display variables used for igt_crtc_for_pipe()
      tests/kms: Introduce more local 'display' variables
      tests/kms: Pull the igt_crtc_for_pipe() call earlier
      tests/kms: Pull igt_crtc_for_pipe() calls earlier, when dealing with planes
      tests/kms: Introduce local 'crtc' variables
      tests/kms_plane_alpha_blend: Use igt_crtc_t instead of enum pipe
      tests/kms: Remove unused 'pipe' function parameters
      tests/kms: Remove const qualifier from 'pipe' function parameters
      tests/intel/kms_busy: Use 'enum pipe' instead of 'int'
      tests/kms_atomic_interruptible: s/crtc/drm_crtc/
      tests/intel/kms_psr2_su: Use igt_crtc_t instead of enum pipe
      tests/intel/kms_dsc*: Use igt_crtc_t instead of enum pipe
      tests/kms_cursor_legacy: Use igt_crtc_t instead of enum pipe
      tests/kms_color*: Use igt_crtc_t instead of enum pipe
      tests/kms_atomic_transition: Use igt_crtc_t instead of enum pipe
      tests/kms_plane: Use igt_crtc_t instead of enum pipe
      tests/intel/kms_pipe_b_c_ivb: Use igt_crtc_t instead of enum pipe
      tests/kms_vrr: Use igt_crtc_t instead of enum pipe
      tests/kms_display_modes: Use igt_crtc_t instead of enum pipe
      tests/kms_rotation_crc: Use igt_crtc_t instead of enum pipe
      tests/kms_properties: Use igt_crtc_t instead of enum pipe
      tests/kms: Use igt_crtc_t instead of enum pipe
      tests/intel/kms_psr: Don't pass uninitialized 'pipe' to intel_fbc_supported_on_chipset()
      tests/intel/kms_psr2_sf: Don't pass zero initialized 'data.pipe' to intel_fbc_supported_on_chipset()
      tests/intel/kms_flip_scaled_crc: Remove unused 'enum pipe pipe'
      tests/kms_concurrent: Actually run the test over all connected crtcs
      tests/amdgpu/amd_abm: Don't use uninitialized 'pipe'
      tests/kms: Use 'enum pipe' over int'
      lib/kms: Add igt_crtc_for_crtc_id()
      tests/kms_lease: Use igt_crtc_t instead of enum pipe
      tests/kms_lease: Pass lease_t to prepare_crtc()
      tests/intel/kms_frontbuffer_tracking: Use igt_crtc_t instead of enum pipe
      tests/kms_plane_scaling: Use igt_crtc_t instead of enum pipe
      tests/drm_read: Use igt_crtc_t instead of enum pipe
      tests/intel/kms_psr2_sf: Convert pipes[] to crtcs[]
      tests/kms_vblank: Use igt_crtc_t instead of enum pipe
      tests/kms_plane_multiple: Use igt_crtc_t instead of enum pipe
      tests/kms_tiled_display: Use igt_crtc_t instead of enum pipe
      tests/intel/kms_psr: Use igt_crtc_t instead of enum pipe
      tests/kms_prime: Use igt_crtc_t instead of enum pipe
      tests/chamelium: Use igt_crtc_t instead of enum pipe
      tests/kms: Use igt_crtc_t instead of enum pipe, part 1
      tests/kms: Use igt_crtc_t instead of enum pipe, part 2
      tests/kms: Use igt_crtc_t instead of enum pipe, part 3
      tests/kms: Use igt_crtc_t instead of enum pipe, part 4
      tests/kms_plane_multiple: Clean up n_planes stuff
      tests/kms_async_flips: Remove redundant data.crtc_id
      tests/kms_lease: Consolidate igt_crtc_for_pipe() calls
      tests/kms: Consolidate igt_crtc_for_pipe() calls
      lib/kms: Introduce igt_first_crtc_with_single_output()
      tests/kms: Use igt_first_crtc_with_single_output()
      lib/kms: Introduce and use igt_first_crtc()
      tests/kms: Stop using igt_require_pipe()
      lib/kms: Replace get_num_scalers() with igt_crtc_num_scalers()
      lib/kms: Pass igt_crtc_t* to igt_max_bpc_constraint()
      lib/kms: Introduce for_each_plane_on_crtc()
      tests/kms: Use for_each_plane_on_crtc()
      lib/kms: Nuke for_each_plane_on_pipe()
      tests/kms: Switch to for_each_valid_output_on_crtc_local()
      tests/kms: Replace igt_pipe_connector_valid() with igt_crtc_connector_valid()
      lib/kms: Intreoduce for_each_valid_output_on_crtc()
      tests/intel/kms_frontbuffer_tracking: Use for_each_valid_output_on_crtc()
      tests/kms: Use for_each_valid_output_on_crtc()
      lib/kms: Nuke for_each_valid_output_on_pipe()
      lib/kms: Replace igt_pipe_has_valid_output() with igt_crtc_has_valid_output()
      lib/kms: Replace igt_display_require_output_on_pipe() with igt_display_require_output_on_crtc()
      lib/kms: Replace igt_get_single_output_for_pipe() with igt_get_single_output_for_crtc()
      lib/kms: Make the igt_*_bpc_*() interfaces more abstract
      tests/kms: Use igt_crtc_name()
      tests/kms: Clean up crtc->pipe comparions
      tests/vmwgfx/vmw_prime: Replace igt_pipe_crc_new() with igt_crtc_crc_new()
      lib/kms: Prefer "crtc" over "pipe" in function names
      tests/kms_color*: Prefer "crtc" over "pipe" in function names
      tests/kms: Prefer "crtc" over "pipe" in function names
      tests/kms_tiled_display: Remove mention of PIPE_NONE
      tests/kms: Remove hand rolled get_vblank() stuff
      lib/kms: Fix kmstest_get_vblank() docs
      tests/kms: Pass crtc_index to kmstest_get_vbl_flag()
      tests/kms: Pass crtc_index to kmstest_get_vblank()
      lib/kms: Introduce igt_crtc_get_vbl_flag()
      lib/kms: Introduce igt_crtc_get_vblank()
      tests/nouveau_crc: Extract {setup,cleanup}_test()
      tests/nouveau_crc: Convert to dynamic subtests
      tests/nouveau_crc: Use igt_first_crtc() instead of igt_crtc_for_pipe()
      lib/kms: Make igt_first_crtc() skip if no CRTCs are around
      lib/kms: Make igt_first_crtc_with_single_output() skip if no CRTC/output can be found

Vitaly Prosyak (11):
      lib/amdgpu: add helper to log total test runtime
      tests/amdgpu: print total runtime in min:sec for whole test binary
      lib/amdgpu: add DMA hardware limits struct and query API
      lib/amdgpu: normalize write_length to bytes and use DMA limits API
      lib/amdgpu: fix SDMA WRITE_LINEAR COUNT field to use DWORDs
      lib/amdgpu: log transfer size before DMA/GFX/Compute submissions
      tests/amdgpu: add cross-GPU DMA-buf synchronization test
      tests/amd_queue_reset: restore ASIC-based subtest skip filter
      tests/amdgpu: add DMA-BUF fence-outlives-module unload test
      tests/amdgpu: add KFD DMA-BUF fence-outlives-module unload test
      Revert "tests/amdgpu: add KFD DMA-BUF fence-outlives-module unload test"

Xiandong Wang (1):
      tests/kms_flip: skip on MTK driver

Xin Wang (7):
      lib/intel_pat: add pat_sw_config debugfs parser
      include/linux_scaffold: add FIELD_GET() bitfield helper
      tests/xe_pat: add pat-sanity subtest for debugfs vs getters
      tests/xe_pat: use debugfs reserved flags
      intel-ci: add xe_pat pat-sanity
      lib/intel_pat: include fcntl.h for O_RDONLY
      tests/intel/xe_multigpu_svm: fix 32-bit build error

Yogesh Mohan Marimuthu (2):
      lib/amdgpu: support FWM packet in user queue
      tests/amdgpu: add fence wait multi packet test

Zbigniew Kempczyński (25):
      lib/intel_compute: Unblock NVL-S compute and preemption tests
      lib/intel_compute: Select engine class by engine accessibility
      tests/xe_render_copy: Skip if platform doesn't support flatccs
      lib/intel_device_info: Add missing flatccs flag for NVL-S
      lib/intel_compute: Add compute-square for xe3p
      lib/intel_compute: Add loop and loop-count shaders for xe3p
      lib/intel_compute: Add xe3p SIP support
      lib/intel_compute: Enable xe3p preemption testing
      Revert "tests/xe_render_copy: Skip if platform doesn't support flatccs"
      tests/xe_exec_system_allocator: Don't leave bo_flags uninitialized
      lib/igt_aux: Protect expressions from premature casting in aux macros
      lib/intel_compute: Add compute and preemption support for NVL-P
      lib/rendercopy: Alter pipeline and add shader for Xe3p
      lib/intel_compute: Wait for compute walker before returning to ring
      tests/xe_pat: Add false-sharing subtest
      tests/xe_pat: Handle false-sharing on Xe3
      lib/xe_util.h: add canonical helper for 48/57 bit vas
      lib/intel_compute: Add types for input and output buffers
      lib/intel_compute: Extend userenv by adding input and output bos
      lib/intel_compute: Enhance Xe3p pipeline to accept user data
      tests/xe_compute: Extend compute test to cover user passed buffers
      tests/xe_compute: Use appropriate feature in compute-square tests
      tests/xe_compute: Change shader and local max x on PVC
      tests/xe_pat: Add subtests for validating cached pagetables
      lib/intel_pat: Fix typo PAT_MODE -> PTA_MODE

git tag: v2.4

https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-2.4.tar.xz
MD5:  341cb6b573ffec2b879029a4c944012b  igt-gpu-tools-2.4.tar.xz
SHA1: a133e337bec768294bf796ca24ed5897cd3114f9  igt-gpu-tools-2.4.tar.xz
SHA256: a44b7d089a27555944d4cd5da372c9339501539e3cd2735bbdb30e0d802f1cbe  igt-gpu-tools-2.4.tar.xz
SHA512: 3f8e8202e3a613faf077ecb3fcc6a13840a8df94f94cb7d3a7933e51888757ea22e4154f2e0f88b896583e23bc8fd472bd286a0b50630b8b5eeb13878a1a2d9f  igt-gpu-tools-2.4.tar.xz
PGP:  https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-2.4.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEETPf8JI3Czo80u+SPwwTEoxBABekFAmnLpMoACgkQwwTEoxBA
Bekwwg/+LVcNurHSTU9D9zJh1xeaZEqNEkCKotKb5+KdwEoC3eo1nGQ3ADl3b+DN
w/YZ/laKhul6vxSgwc3e8GF1LexJ6+BaS+rIJDXEovzYumuPPXOhyFZkEWHaTwui
N5KK0Uku8iFWk48DWQNZhzB+iUfLlMeGmS1B8Tk3/KZKkUiQAU/lV0uV1Cg8OuNe
vOIb5pHpZnel/oAFJG+Wz5r4jtIwpNl+6PybvCbKerwVDr90JimzKfbAQlIftX96
kJqFIh1EqfSYZskT19vKWyj8ezDMgVnGJALeHiNmMas92HQxQU7+80ntCWlpDRah
XO/up2gJcrIQHz22t2aQSQSO8ZsuHIGk57fuLlFy0288o6Atzevpx/AdkEDGsXsO
Fa3gtWDlWMKPAW0sjNgDIqHIjTY26rm/Q7j14CbaaHs5OmWwNgVQ9EiY4IMIao8Y
KowUtz5Ms8sE46xb2CbfVK+71ei4CxiU1BahoobN/u9AXL9GhWRpTjqhY+ty7mlz
KGMdfs8k/5Mic4iNGUGVw5OTdgxiZ02ypoxPU/ijp/JDp4Nxow843PGL/wxVqmJl
WyrFTiCv/8FovRRIiinn49S7goHlC1PeX6h/dq0picis5SGxX2cers0owy86OaNT
1o8hvl7ouKEJ+YPIusx94UQgXHmywg3ppGD2AHVkhcTLvgzlkZM=
=JoYH
-----END PGP SIGNATURE-----
