Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFC110E902
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jan 2023 15:32:36 +0000 (UTC)
Date: Thu, 12 Jan 2023 17:29:06 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: xorg-announce@lists.x.org
Message-ID: <Y8AnQlQYW2psZnX0@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [ANNOUNCE] igt-gpu-tools 1.27
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, xorg@lists.x.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

A new igt-gpu-tools release is available with the following changes:

- - Support for Intel discrete graphics and other new platforms (Andrzej
  Turko, Matt Roper, Clint Taylor, Tejas Upadhyay, et al)

- - Support for MSM driver. (Mark Yacoub, Rob Clark)

- - Support for SRIOV device selection. (Łukasz Łaguna)

- - Tiled display emulation support with chamelium. (Kunal Joshi)

- - Support for Chamelium v3. (Mark Yacoub)

- - Initial FreeBSD support. (Jake Freeland)

- - Structured communication from tests to igt_runner. (Petri Latvala)

- - Removed last remaining uses of libdrm_intel in tests and
  tools. (Zbigniew Kempczyński)

- - Automatic kernel code coverage collection during testing. (Mauro
  Carvalho Chehab)


And many other bug fixes, improvements, cleanups and new tests.


Full changelog:

Abhinav Kumar (3):
      lib/igt_fb: fix the plane_size array for yuv formats
      lib/igt_kms: commit only the primary plane which is prepared
      tests/kms_concurrent: check if second primary plane is valid

Ahmad Othman (1):
      tests/amdgpu: fixes for test-4k-mpo

Alan Previn (17):
      i915_drm.h sync
      tests/i915/gem_pxp: Add basic PXP testing of buffer and context alloc
      tests/i915/gem_pxp: Perform a regular 3d copy as a control checkpoint
      lib: Add PXP attribute support in batchbuffer and buffer_ops libs
      lib/intel_reg: Add MI_SET_APPID instruction definition
      lib/rendercopy_gen9: Enable protected session cmd in gen12_render_copyfunc
      tests/i915/gem_pxp: Add subtest to copy raw source to protected dest
      tests/i915/gem_pxp: Add test where both src and dest are protected
      tests/i915/gem_pxp: Verify PXP teardown occurred through suspend-resume
      tests/i915/gem_pxp: Verify execbuf fails with stale PXP context after teardown
      tests/i915/gem_pxp: Verify execbuf fails with stale PXP buffer after teardown
      tests/i915/gem_pxp: Verify execbuf ok with stale PXP buf in opt-out use
      tests/i915/gem_pxp: Verify execution behavior with stale PXP assets through suspend-resume
      tests/i915/gem_pxp: Verify protected surfaces are dma buffer sharable
      tests/i915_pxp: Use ioctl_wrapper for DRM_IOCTL_PRIME_HANDLE_TO_FD
      tests/i915/pxp: PXP debugfs path promoted to global
      tests/i915/pxp: Always use igt helper to get the render function

Alex Hung (18):
      tests/kms_panel_fitting: Use 800x600 as lowest resolution for AMD devices
      tests/kms_panel_fitting: Skip atomic-fastset for non-i915
      tests/kms: Skip kms test cases for DCC and DCC_RETILE
      tests/kms_plane: Check plane format before using
      tests/kms_universal_plane: Enable gen9_test_pipe for all devices
      tests/kms_universal_plane: Skip offscreen test for universal API
      tests/kms_concurrent: remove an AMD device check
      Revert "tests/kms_concurrent: remove an AMD device check"
      tests/kms_plane_cursor: update pipe to output for each test
      tests/kms_plane_multiple: turn off pipe if all planes are off
      tests/kms_universal_plane: turn off pipe when primary plane is off
      tests/kms_universal_plane: skip when pipe and primary plane cannot be off
      tests/kms_cursor_legacy: allow an extra vblank in atomic-transitions tests
      tests/kms_dp_aux_dev: Skip failure on EIO for amdgpu
      kms_chamelium: fix a compile warning
      tests/kms_plane: check before calling i915 libraries
      tests/kms_bw: Test outputs with fb of the same resolutions
      tests/kms_bw: remove fb in the reverse order

Ananya Sharma (1):
      tests/kms_rotation_crc: MPO subtest-mixing of pixel format and tiling on different planes.

Andrzej Hajda (6):
      lib/igt_aux: do not complain about dead processes
      i915/gem_ctx_persistence: adjust hostile test timeout
      gem_ctx_persistence: adjust reset timeout
      tests/kms_plane: skip memory demanding modes in test_plane_panning
      tests/i915/gem_ctx_persistence: adjust timeout according to engines
      tests/kms_plane_scaling: cleanup framebuffers after test

Andrzej Turko (19):
      lib/i915/gem_create: Add gem_create_ext
      lib/i915/intel_memory_region: Add new memory region lib
      tests/i915/gem_exec_basic: Use memory region interface
      tests/i915/gem_gpgpu_fill: Use memory region interface
      tests/i915/gem_media_fill: Use memory region interface
      lib/intel_allocator: Check validity of the file descriptor
      tests/i915/api_intel_allocator: Exercise allocator in multiprocess mode
      lib/intel_allocator: Move ioctl calls to client processes
      lib/intel_allocator_simple: Check boundaries of reserved blocks
      tests/i915/gem_softpin: Adjust the addresses of reverved blocks
      tests/i915/gem_streaming_writes: Support gens without relocations
      tests/gem_exec_gttfill: Require relocation support
      tests/gem_exec_lut_handle: Require relocation support
      tests/gem_lut_handle: Require relocation support
      tests/gem_exec_store: Support gens without relocations
      tests/gem_softpin: Exercise eviction with softpinning
      lib/intel_allocator: Fix argument names in declarations
      tests/gem_exec_capture: Support gens without relocations
      tests/prime_mmap: Add support for local memory

André Almeida (2):
      lib/igt_fb: Add support for drawing rectangles with random colors
      tests/kms_async_flips: Support more vendors

Ankit Nautiyal (3):
      lib: Add helper functions to read/write dsc debugfs
      tests/kms_dp_dsc: Use helper functions to read/write dsc debugfs
      tests/kms_invalid_dotclock: Modify the test for bigjoiner

Anshuman Gupta (27):
      tests/i915_pm_dc: Fix platform version check
      tests: i915_pm_rpm : Dump i915_runtime_pm_status
      lib: Add silent __igt_i915_driver_unload
      perf/perf_pmu: Nuke unload_i915
      lib/igt_kmod: Don't use process exit return value
      test/perf_pmu: Change module unload assertion
      i915_pm_rpm: Use __igt_debugfs_dump for i915_runtime_pm_status
      i915_pm_rpm: Add placement to gem_exec_stress
      test/i915_pm_rpm: Remove igt_describe() from dynamic subtest
      intel-ci: Reorder system suspend tests to last
      test/i915_pm_rpm: Add placement to gem-{mmap-type, execbuf}
      lib/igt_device: Get gfx PCI card root port
      lib/igt_pm: D3Cold runtime pm infrastructure
      lib: Optional autosuspend_delay_ms configuration
      tools: Add intel_pm_rpm tool
      tools/intel_pm_rpm: Add an option to setup d3cold
      test: i915_pm_rpm: init devid in setup_envirnoment
      i915_pm_rpm: s/display_disabled/display_enabled
      test: i915_pm_rpm: conditional initialization of igt_display_t
      i915_pm_rpm: rpm resume by user forcewake
      test/i915_pm_rpm: cache pci_device
      test/i915_pm_rpm: Verify bridge binds with pcieport driver
      lib/igt_pci: helpers to get PCI capabilities offset
      lib/igt_pci: Add PCIe slot cap
      lib/igt_pm: Refactor get firmware_node fd
      test/device_reset: Refactor initiate_device_reset
      tests/device_reset: Add cold reset IGT test

Anson Jacob (3):
      Add Makefile to .gitignore
      lib/igt_fb: Add checks for intel device
      tests/amdgpu: Ensure pipes are enabled before accessing

Anusha Srivatsa (1):
      tests/i915/i915_pm_dc: Remove PC8+ dependency for DGFX DC9

Apoorva Singh (11):
      i915/gem_media_fill: Add support for local memory
      i915/gem_gpgpu_fill: Add support for local memory
      lib/intel_bufops: Add intel_buf_init_in_region
      i915/gem_render_copy: Add support for local memory
      i915/gem_exec_create: Add support for local memory
      i915/gem_mmap: Added test description for test case
      i915/gem_exec_store: Add test description
      lib/i915: Introduce library intel_mocs
      tests/i915/gem_ccs: Check ctrl-surf-copy in new context
      tests/i915/gem_ccs: Add suspend-resume subtest
      i915/i915_getparams_basic: Added test description for test case

Arjun Melkaveri (8):
      tests/i915/gem_exec_nop: Resolve missing context id in sequential test
      tests/i915/gem_exec_schedule: Resolve missing context for independent subtest
      tests/i915/gem_ctx_shared: Resolve missing context for exec_shared_gtt
      tests/i915/gem_exec_capture: Minor fix of bug in code
      tests/i915/gem_ctx_engines: Added out fence for execute-one subtest
      tests/gem_render_copy: Added skip for I915_TILING_Y and I915_TILING_Yf on DG2
      tests/i915/gem_lmem_swapping: Fix bug in test_smem_oom
      tests/prime_vgem: Fix timeout/incomplete issue in MTL simulation

Arkadiusz Hiler (1):
      Revert "tests/kms_vblank: Turn on hardware before testing invalid vblank."

Arun R Murthy (1):
      tests/kms_async_flips: first async flip discarded on i915

Arundhati Hagaragi (4):
      tests/kms_big_fb: Add subtest description
      Added tests description
      tests/kms_lease: Add subtest description
      tests/kms_mmap_write_crc: Add subtest description

Arunpravin Paneer Selvam (1):
      tests/drm_buddy: Add drm buddy test cases

Ashutosh Dixit (24):
      lib/i915/intel_memory_region: free query_info in gem_get_lmem_region_count
      lib/i915: Add i915_drm_local.h
      tests/kms_addfb_basic: Skip basic-y-tiled-legacy on discrete
      tests/i915/gem_cs_tlb: Drop gem_require_ring() check
      Return allocated size in gem_create_in_memory_regions() and friends
      lib: Partially revert 22643ce4014a
      Remove "semaphores" submission method
      lib/i915: Return actual submission method from gem_submission_method
      lib/i915: Clarify gem_submission function names
      tests/gem_ctx_shared: Fix disjoint_timelines test requirements
      lib/igt_dummyload: Drop ahnd from igt_spin_t
      lib/igt_device_scan: Fix -Wdangling-pointer
      tests/drm_read: Fix -Wdeprecated-declarations
      tests/kms_cursor_crc: Fix -Wformat-truncation
      lib/amdgpu/amd_command_submission: Fix -Wuse-after-free
      tests/perf/i915_ref_count: Skip on __drm_open_driver failure
      tests/i915/perf_pmu: Use correct context id in "enable-race"
      tests/i915_pm_freq_mult: New test for media freq factor
      lib/igt_sysfs: Drop igt_debug_on from igt_sysfs_gt_open
      tests/kms_cursor_crc: Fix compile warning
      lib/i915/perf: Propagate return from unsupported_i915_perf_platform
      lib/i915/perf: Include ATSM in ACM metrics
      lib/igt_sysfs: Generic verification of writable sysfs attributes
      i915/i915_hwmon: General verification of hwmon attributes

Aurabindo Pillai (6):
      tests/kms_flip : skip subtest bo-too-big
      tests/kms_bw: Add generic commit test for bandwidth validation
      amdgpu/amd_mode_switch: Introduce mode switch test
      tests/amdgpu: add test for panel self refresh
      test/kms_plane_cursor: Honour max cursor size
      tests/kms_plane_cursor: Wait for an extra vblank on AMD hw

Ayaz A Siddiqui (1):
      lib/rendercopy_gen9: Program MOCS value based on platform

Bhanuprakash Modem (92):
      lib/igt_kms: helper to override the mode on all connectors
      tests/kms_frontbuffer_tracking: Fix mode selection for 2x tests
      tests/kms_cursor_legacy: Fix mode selection for 2x tests
      tests/debugfs_test: Fix mode selection for 2x tests
      tests/kms_content_protection: Fix mode selection for 2x tests
      tests/kms_plane_scaling: Fix mode selection for 2x tests
      tests/kms_atomic_transition: Fix mode selection for 2x tests
      tests/kms_plane: Reset the state before exiting the test
      tests/kms_plane_alpha_blend: Reset the state before exiting the test
      tests/kms_cursor_edge_walk: Reset the state before exiting the test
      tests/kms_plane_lowres: Reset the state before exiting the test
      tests/kms_plane_cursor: Reset the state before exiting the test
      tests/kms_flip_scaled_crc: Reset the state before exiting the test
      tests/kms_vblank: Reset the state before exiting the test
      tests/kms_dither: New IGT to validate crtc Dithering
      tests/kms_dither: Make dither tests generic
      lib/igt_kms: Rename dp_dsc to dsc
      tests/kms_dsc: Extend support to HDMI
      tests/kms_invalid_dotclock: Update to use renamed DSC api
      tests/kms_busy: Limit the execution to two pipes
      tests/kms_flip: Restrict the hang tests execution to two pipes
      tests/intel-ci: Remove hang tests from pre-merge blacklist
      lib/i915: Handle QUERY_MEMORY_REGIONS on older kernels
      tests/kms_setmode: Fix mode selection for Nx tests
      lib/intel_batchbuffer: Add allocator support in blitter fast copy
      tests/kms_flip: Adopt to use allocator
      tests/kms_vblank: Adopt to use allocator
      tests/kms_busy: Limit the execution to single connector
      tests/kms_color_chamelium: Skip CTM test if property is not present
      tests/kms: Move Intel specific kms tests to i915 directory
      lib/igt_debugfs: Handle memory allocation failures for CRC
      tests/kms_color: Optimize ctm test execution
      tests/kms_setmode: Use dynamic subtests
      Revert "tests/kms_setmode: Restrict the test execution to two pipes"
      tests/kms_setmode: Sort modes only if they dont fit in link BW
      i915_pm_rpm: Skip i2c read test for DP MST connectors
      tests/kms_color_helper: Read deep-color capability from EDID
      tests/kms_color: Add support for Deep-Color
      tests/kms_setmode: Add support to handle displays having 5k+ modes
      tests/kms_setmode: Limit the execution to two pipes
      tests/kms_vrr: Create dynamic subtests
      tests/kms_flip: Add support to handle displays having 5k+ modes
      tests/kms_setmode: Fix the corner case in handling 5k+ modes
      tests/kms_hdr: Fix dynamic subtest name
      lib/igt_kms: Add helper functions to read few debugfs
      tests/kms_color: Use debugfs apis for deep-color
      tests/kms_hdr: Adopt to use updated debugfs functions
      tests/kms_dither: Adopt to use updated debugfs functions
      tests/amdgpu: Adopt to use updated debugfs functions
      tests/kms_dp_aux_dev: Handle MST NAK reply on disconnected MST connectors
      tests/kms_flip: Fix mode selection for Nx tests
      lib/igt_kms: Fix mixed declarations warning
      lib/igt_kms: Add helper functions to sort drm modes
      tests/kms_hdr: Skip if current & requested BPC doesn't match
      tests/kms_color: Skip if current & requested BPC doesn't match
      lib/igt_kms: Add a helper function to check Bigjoiner support
      tests/kms_cursor_edge_walk: Convert tests to dynamic
      tests/kms_dither: Rename dynamic tests
      tests/kms_cursor_legacy: Convert tests to dynamic
      tests/kms_cursor_legacy: Test Cleanup
      tests/intel-ci: Rename kms_cursor_legacy subtests in BAT
      tests/kms_cursor_crc: Convert tests to dynamic
      tests/kms_cursor_crc: Test Cleanup
      tests/kms: Fix kms tests to use lib helpers to sort connector modes
      tests/kms_pipe_crc_basic: Convert tests to dynamic
      tests/kms_pipe_crc_basic: Test Cleanup
      tests/intel-ci: Rename kms_pipe_crc_basic subtests in BAT
      tests/kms_dither: Skip if current & requested BPC doesn't match
      tests/kms_cursor_edge_walk: Fix test requirement to avoid SKIPs
      tests/kms_pipe_crc_basic: Avoid skips in dynamic subtets
      tests/kms_color: Convert tests to dynamic
      tests/kms_color: Test Cleanup
      tests/kms_dither: Reset max_bpc before exiting the subtest
      tests/kms_color: Fix memory leaks
      tests/kms_cursor_legacy: Avoid usage of same pipe on multiple outputs
      tests/kms_cursor_edge_walk: Fix the usage of single output on pipe
      tests/kms_color: Fix multiple failures in deep-color tests
      lib/igt_kms: Add a helper to check the max_bpc constraints
      tests/kms: Fix to use max_bpc constraint helper
      tests/kms_cursor_crc: Drop max-size test
      tests/kms_color_chamelium: Convert tests to dynamic
      tests/kms_plane_cursor: Convert tests to dynamic
      tests/kms_cursor_crc: Add max-size test back
      lib/igt_kms: Choose default mode based on --environment flag from igt_runner
      tests/kms_atomic_transition: Convert tests to dynamic
      tests/kms_atomic_transition: Test Cleanup
      tests/kms_color: Fix ctm-0.* tests
      tests/chamelium/kms_color_chamelium: Fix ctm-0.* tests
      lib/igt_kms: New api to iterate over all outputs
      tests/kms_atomic_transition: Fix the test execution on internal panels
      tests/kms_cursor_crc: Fix SIGABRT in dynamic subtests
      tests/kms_vrr: Add Negative tests to validate VRR

Bhawanpreet Lakha (4):
      tests/amdgpu: Create mpo panning test
      tests/amdgpu: Create mpo swap between 2 displays test
      tests/amdgpu: Create mpo scaling tests
      tests/amdgpu: Add full screen scaling test case

Bindu Ramamurthy (1):
      tests/kms_content_protection: Enable Primary plane for CRTC.

Bommu Krishnaiah (1):
      i915/gem_eio: Removed early timeout check for forced reset completion

Boris Brezillon (10):
      tests/panfrost: Make sure we open a DUMB capable node for prime tests
      lib/panfrost: Handle the NULL case in igt_panfrost_free_bo()
      lib/panfrost: Add a helper to create a job loop
      lib/panfrost: Add a helper to create a NULL job
      tests/panfrost: Simplify submit tests
      tests/panfrost: Extend the pan-reset test
      lib/panfrost: Get rid of igt_panfrost_trivial_job()
      tests/panfrost: Test FD-close while jobs are still in-flight
      lib/panfrost: Add a helper to create dummy write value jobs
      tests/panfrost: Add a test to validate unhandled pagefault handling

CQ Tang (4):
      tests/i915/gem_lmem_swapping: Add the gem_lmem_swapping test
      tests/gem_lmem_swapping: limit lmem to 4G
      tests/i915/gem_ctx_isolation.c - fix to poison CACHE_MODE_0
      tests/gem_lmem_swapping: retry execbuf on no memory error with oom testing

Ch Sai Gowtham (13):
      tests/gem_exec_params: Support gens without relocations
      tests/gem_mmap: Add allocator support
      tests/gem_mmap_gtt: Add allocator support
      tests/gem_mmap_offset: Add allocator support
      tests/gem_request_retire: Add allocator support
      tests/gem_shrink: Add allocator support
      tests/i915/gem_exec_suspend: Add support for local memory
      tests/i915/gem_exec_capture: Add support for local memory
      tests/prime_mmap_coherency.c: Use intel_bb and intel_buf to remove libdrm dependency
      tests/i915/gem_linear_blits: Added description to the subtest
      tests/i915/gem_basic: Added test description for test case.
      i915/gem_ctx_create: Added test description for test case
      tests/i915/gem_exec_basic: Add test description to the subtest.

Chris Wilson (113):
      lib: Use fast WC reads for gem_pread fallback
      lib: Beware implicit sign extension on large constants
      lib: Ensure the spinner reuses the canonical address
      igt/gem_userptr: Exercise new PROBE flag
      kms_ccs: Require a connected output
      lib: Refactor construction of unique tokens
      lib: Typechecking minmax
      i915/gem_exec_fence: Allow wait_bb to run on !rcs
      i915/gem_eio: Exercise object creation while wedged
      i915/gem_engine_topology: Add helpers for checking driver capabilities
      i915/gem_exec_schedule: Fix context creation for shared-vm
      i915/gem_exec_balancer: Fix execution of parallel-submit on dg2+
      prime_busy: Replace open-coded spinner with igt_spin_t
      i915/gem_exec_fence: Support dg2+ batch predication
      i915/i915_module_load: Randomise fault injection
      i915/i915_module_load: Raise a fatal-error on failing to unload a module
      i915/i915_pm_rps: Check impact of fence ordering on waitboosting
      i915/i915_pm_rps: Write values in pm_rps_exit_handler only for min-max configs
      i915/gem_pipe_control_store_loop: Use a simple spinner to preuse the buffer
      tests/gem_exec_fence: Check stored values only for valid workloads
      tests/gem_exec_fence: Coordinate sleep with the start of the request
      i915/i915_pm_rps: Don't use gem_write in batch_create
      lib: Fix off-by-one-page in 48b obj.flags
      lib/i915: Mark gem_create as handling const memory regions
      i915/gem_create: Verify all regions return cleared objects
      i915/gem_create: Stress creation with busy engines
      i915/gem_mmap_offset: Avoid set_domain when I915_MMAP_OFFSET_FIXED is used
      i915/gem_mmap_offset: Verify all regions return clear mmaps on creation
      i915/gem_mmap_offset: Verify all regions with ptrace
      i915/gem_mmap_offset: Verify all regions remain in isolation
      i915/gem_mmap_offset: Verify all regions have nonblocking pagefaults
      i915/gem_mmap_offset: Check all mmap types reject invalid objects
      i915/gem_mmap_offset: Crudely measure read/write to different mmaps
      i915/gem_mmap_offset: Exercise close race against all types/regions
      lib: Introduce typed cleanups
      i915/gem_basic: Close device before exit
      i915/gem_flink_basic: Close device before exit
      i915/gem_linear_blits: Close device before exit
      i915/gem_blits: Close device before exit
      i915/gem_close: Close device before exit
      i915/gem_create: Close device before exit
      i915/gem_ctx_engines: Close device before exit
      i915/gem_ctx_shared: Close device before exit
      i915/gem_exec_alignment: Close device before exit
      i915/gem_render_copy: Close device before exit
      i915/gem_render_copy_redux: Close device before exit
      i915/gem_media_fill: Close device before exit
      i915/gem_userptr_blits: Close device before exit
      i915/gem_workarounds: Close device before exit
      i915/gem_unref_active_buffers: Close device before exit
      i915/gem_exec_endless: Close device before exit
      i915/gem_request_retire: Close device before exit
      i915/gem_unfence_active_buffers: Close device before exit
      i915/i915_pciid: Close device before exit
      kms_cursor_legacy: Close device before exit
      kms_flip: Close device before exit
      kms_pipe_crc_basic: Close device before exit
      kms_psr: Close device before exit
      kms_flip: Close device before exit
      kms_force_connector_basic: Close device before exit
      dumb_buffer: Close device before exit
      kms_atomic: Close device before exit
      kms_atomic_interruptible: Close device before exit
      kms_atomic_transition: Close device before exit
      i915/kms_big_fb: Close device before exit
      i915/kms_ccs: Close device before exit
      kms_color: Close device before exit
      kms_cursor_crc: Close device before exit
      i915/kms_big_joiner: Close device before exit
      i915/kms_cdclk: Close device before exit
      i915/kms_fence_pin_leak: Close device before exit
      i915/kms_flip_scaled_crc: Close device before exit
      i915/kms_flip_tiling: Close device before exit
      i915/kms_mmap_write_crc: Close device before exit
      i915/kms_pipe_b_c_ivb: Close device before exit
      i915/kms_psr2_sf: Close device before exit
      i915/kms_psr2_su: Close device before exit
      i915/kms_pwrite_crc: Close device before exit
      kms_flip_event_leak: Close device before exit
      kms_hdr: Close device before exit
      kms_invalid_mode: Close device before exit
      kms_panel_fitting: Close device before exit
      kms_plane: Close device before exit
      kms_plane_alpha_blend: Close device before exit
      kms_plane_cursor: Close device before exit
      kms_plane_multiple: Close device before exit
      kms_plane_scaling: Close device before exit
      kms_properties: Close device before exit
      kms_rotation_crc: Close device before exit
      kms_sequence: Close device before exit
      kms_universal_plane: Close device before exit
      kms_vblank: Close device before exit
      syncobj_wait: Close device before exit
      syncobj_basic: Close device before exit
      syncobj_timeline: Close device before exit
      drm_import_export: Close device before exit
      kms_dp_aux_dev: Close device before exit
      kms_hdmi_inject: Close device before exit
      kms_3d: Close device before exit
      kms_scaling_modes: Close device before exit
      kms_dither: Close device before exit
      drm_read: Close device before exit
      kms_cursor_edge_walk: Close device before exit
      kms_plane_lowres: Close device before exit
      kms_content_protection: Close device before exit
      feature_discovery: Close device before exit
      i915/i915_pm_dc: Close device before exit
      core_auth: Close(master) before exit
      i915/gem_exec_balancer: Close device before exit
      i915/gem_ctx_isolation: Close device before exit
      tests/i915/gem_exec_fence: Replacing custom spinner with igt_spin
      lib: Support all future platforms in bufops
      i915/api_intel_bb: Release the crc32 reloc offset after use

Chuansheng Liu (2):
      i915/gem_busy: Prevent context ban with right ctx id
      i915/tests: Pass right ctx id into igt_allow_hang()

Clint Taylor (1):
      lib/i915/adl-p: Basic ADL-P enabling

Daniel Stone (1):
      ci: Use FDO_CI_CONCURRENT to limit build/test concurrency

Daniel Vetter (5):
      tests/gem_exec_schedule: Use store_dword_plug again (v2)
      Revert "test/i915/gem_exec_reloc: Restore interclient testings"
      Revert "i915/gem_exec_reloc: Flood the ring with GPU relocs"
      Revert "i915/gem_exec_reloc: Check that relocations do not block"
      tests/vgem_basic: Fix unload testcase

Daniele Ceraolo Spurio (2):
      lib/igt_kmod: Wait for a kmod to finish its probe before unloding it.
      lib/igt_kmod: Unload mei modules before unloading i915

Daniil Tatianin (1):
      tools/intel_gtt: stop confusing GTT and BAR sizes

David Zhang (22):
      lib/igt_psr: pass higher versions of PSR SU panels
      lib/igt_amd: add helpers to check PSR capibility
      lib/igt_amd: add helpers to check PSR state
      lib/igt_amd: refactor checker of debugfs interface existence
      tests/amdgpu/amd_psr: add PSR-SU MPO subtest case
      lib/igt_amd: add helper to R/W DM visual confirm debug option
      lib/igt_amd: return negative if PSR state debugfs open fails
      tests/amdgpu/amd_psr: use PSR state enum replace the integer
      tests/amdgpu/amd_psr: drop the PSR state check for PSR-SU MPO test
      tests/amdgpu/amd_psr: add interactive option of PSR visual confirm
      tests/amdgpu/amd_psr: add PSR-SU full frame update sub test case
      tests/amdgpu/amd_psr: define reusable wrapper for PSR support check
      tests/amdgpu/amd_psr: add helper to draw cursor pattern
      tests/amdgpu/amd_psr: set visual-confirm default to disabled
      tests/amdgpu/amd_psr: add PSR-SU cursor movement test case
      tests/amdgpu/amd_psr: add PSR-SU test case for cursor move + MPO scenario
      tests/amdgpu/amd_psr: trigger full modeset if visual confirm enabled
      tests/amdgpu/amd_bypass: skip if DSC is enabled on the connector
      tests/amdgpu/amd_psr: some fix for PSR-SU MPO test case
      tests/amdgpu/amd_psr: clean-up the code
      tests/amdgpu/amd_psr: use double framebuffers to emulate MPO case
      tests/amdgpu/amd_psr: add PSR-SU scaling test cases

Deepak Rawat (1):
      tests/kms_atomic: Add a new test case for FB_DAMAGE_CLIPS plane property

Dnyaneshwar Bhadane (1):
      tests/kms_cursor_crc: Skip for invalid pipe connector connection

Dominik Grzegorzek (1):
      tests/gem_gpgpu_fill: Convert from simple to standard igt_main

Dominik Karol Piatkowski (3):
      i915/gem_spin_batch: Typo fix
      lib/intel_allocator: Fixed start offset and alignment
      tests/i915/api_intel_allocator: Fixed start offset

Eryk Brol (2):
      tests/amdgpu: Add amd_link_settings test
      tests/amdgpu: Introduces DP DSC test

Gwan-gyeong Mun (1):
      tests/i915/gem_userptr_blits: Skip sd-probe test for discrete platforms

Igor Matheus Andrade Torrente (1):
      tests/kms_writeback.c: fix the `fill_fb` function

Igor Torrente (1):
      tests/kms_writeback.c: Prevents test failure by the XR48/AR48 format

Imre Deak (18):
      tests/kms_ccs: Skip CCS color clear value check for randomizing subtests
      lib/igt_fb: Fix stride for render_copy based FB conversions
      lib/igt_fb: Remove redundant VC4 SAND plane size alignment
      lib/intel_bufops: Fix CCS plane width calculation
      lib/veboxcopy_gen12: Add support for MC_CCS/XYUV8888 conversions
      tests/kms_ccs: Test the XYUV8888 format as well
      lib/i915: Add ADL-P plane offset restriction for CCS framebuffers
      tests/kms_ccs: Make sure to free GEM and FB objects
      tests/kms_ccs: Use test pattern when possible
      tests/kms_ccs: Fix small aux stride subtest
      tests/kms_ccs: Test bad params for all CCS planes
      lib/igt_fb: Add support for remapping CCS FBs
      lib/igt_fb/adlp: Remove CCS FB stride alignment restrictions
      lib/igt_fb/tgl+: Prevent CCS FB UV surface offset overalignment
      lib/igt_fb/tgl+: Remove CCS FB 4 tile height alignment restriction
      lib/igt_fb/tgl+: Prevent CCS FB AUX surface size overalignment
      lib/igt_fb: Allow XY_FAST_COPY_BLT on DG2
      tests/kms_busy: Ensure GPU reset when waiting for a new FB during modeset

Jake Freeland (13):
      replaced /bin/bash shebangs with /bin/sh for BSD compatibility
      Replaced setpgrp() with setpgid() for standardization in BSD systems
      Replaced get_current_dir_name() with getcwd() for BSD compatibility
      Replace instances of mmap64() with mmap()
      lib/tests/igt_fork.c: Fix error in mmap() flags
      lib/igt_freebsd.h: Create FreeBSD compatibility header
      Ifdef out linux-specific headers
      Include <sys/syscall.h> for FreeBSD systems
      lib/igt_os.c: Add FreeBSD system info collection
      tests/i915/i915_pm_rpm.c: Add FreeBSD I/O iic header
      Include igt_freebsd.h in gem benchmarks
      tests/i915/gem_mmap_*: Add NULL to ptrace() calls
      Restrict sigev_notify_thread_id macro definition to Linux

James Xiong (1):
      tests/i915/kms_frontbuffer_tracking: ignore case when checking DRRS support

Janga Rahul Kumar (9):
      tests/i915/gem_render_tiled_blits : Added subtests description
      tests/i915/gem_tiled_blits : Added subtests description
      tests/i915/gem_tiled_fence_blits : Added subtests description
      tests/i915/gem_exec_suspend : Added subtests description
      tests/i915/gem_exec_parallel : Add subtests description
      tests/prime_vgem : Add subtests description
      tests/i915/gem_exec_fence : Add subtests description
      tests/i915/gem_exec_fence : Add subtests description
      tests/i915/i915_module_load: Use GEM_BUSY instead of SET_CACHE for sanity check

Jani Nikula (3):
      lib/igt: don't include i915_pciids.h everywhere
      tools/intel_vbt_decode: decode VBT MIPI sequence v4 native flag
      tools/intel_vbt_decode: print debug-ish messages to stderr

Janusz Krzysztofik (19):
      lib/i915/perf: Fix non-card0 processing
      lib/core: Add igt_debug_on* variants
      lib/sysfs: Emit debug messages on errors
      i915/intel_memory_region: Add missing forward declaration
      lib/intel_memory_region: Constify info structures
      tests/core_hotunplug: Show device PCI bus address on errors
      lib: Use safe wrappers around libpciaccess initialization functions
      lib/igt_device: Add support for accessing unbound VF PCI devices
      Revert "lib/igt_device: Add support for accessing unbound VF PCI devices"
      lib/igt_device: Add support for accessing unbound VF PCI devices
      lib/intel_mmio: Fix mmapped resources not unmapped on fini
      lib/intel_memory_region: Fix missing header inclusion
      tests/gem_exec_fence: Fix wrong engine checked for store_dword capability
      tests/gem_exec_fence: Exclude 0 from use in store batches
      tests/gem_exec_fence: Restore pre-hang checks in *await-hang scenarios
      tests/core_hotunplug: Free mem allocated by igt_audio_driver_unload
      tests/core_hotunplug: Also unload audio before device unplug
      tests/core_hotunplug: Select health checks for initially detected chipset
      tests/core_hotunplug: Always check device health after late close

Jasmine Newsome (2):
      lib/igt_dummyload: Save spin->opts as part of the spinner
      tests/i915/gem_spin_batch: Removing context persistence

Jason Ekstrand (106):
      tests/i915: Drop gem_ctx_ringsize
      tests/i915/gem_exec_balancer: Drop the ringsize subtest
      tests/i915/gem_exec_endless: Stop setting the ring size
      tests/i915/gem_ctx_param: Drop the zeromap subtests
      tests/i915: Drop gem_ctx_clone
      docs: Add gem_engine_topology.h to the docs
      lib/i915/gem_engine_topology: Expose the __query_engines helper (v2)
      lib/i915/gem_context: Add gem_context_create_ext helpers
      lib: Add an intel_ctx wrapper struct and helpers (v6)
      lib/i915/gem_engine_topology: Rework query_engine_list()
      lib/i915/gem_engine_topology: Factor out static engine listing
      lib/i915/gem_engine_topology: Add an iterator which doesn't munge contexts (v2)
      lib/i915/gem_engine_topology: Add an iterator for intel_ctx_t (v3)
      tests/i915/gem_exec_basic: Convert to intel_ctx_t (v2)
      lib/dummyload: Better document igt_spin_factory
      lib/dummyload: Rename igt_spin_factory::ctx to ctx_id
      lib/dummyload: Support intel_ctx_t (v2)
      lib/i915/gem_submission_measure: Take an optional intel_ctx_cfg_t
      tests/i915/gem_exec_fence: Move the engine data into inter_engine_context (v3)
      tests/i915/gem_exec_fence: Convert to intel_ctx_t (v2)
      tests/i915/gem_exec_schedule: Convert to intel_ctx_t (v3)
      tests/i915/perf_pmu: Convert to intel_ctx_t (v3)
      tests/i915/gem_exec_nop: Convert to intel_ctx_t
      tests/i915/gem_exec_reloc: Convert to intel_ctx_t (v3)
      tests/i915/gem_busy: Convert to intel_ctx_t (v3)
      tests/i915/gem_ctx_isolation: Convert to intel_ctx_t (v2)
      tests/i915/gem_exec_async: Convert to intel_ctx_t (v2)
      tests/i915/sysfs_clients: Convert to intel_ctx_t
      tests/i915/gem_exec_fair: Convert to intel_ctx_t
      tests/i915/gem_spin_batch: Convert to intel_ctx_t (v2)
      tests/i915/gem_exec_store: Convert to intel_ctx_t (v2)
      tests/amdgpu/amd_prime: Convert to intel_ctx_t
      tests/i915/i915_hangman: Convert to intel_ctx_t (v2)
      tests/i915/gem_ringfill: Convert to intel_ctx_t
      tests/prime_busy: Convert to intel_ctx_t
      tests/prime_vgem: Convert to intel_ctx_t (v2)
      tests/gem_exec_whisper: Convert to intel_ctx_t (v2)
      tests/i915/gem_ctx_exec: Stop cloning contexts in close_race
      tests/i915/gem_ctx_exec: Convert to intel_ctx_t
      tests/i915/gem_exec_suspend: Convert to intel_ctx_t (v2)
      tests/i915/gem_sync: Convert to intel_ctx_t (v2)
      tests/i915/gem_userptr_blits: Convert to intel_ctx_t
      tests/i915/gem_wait: Convert to intel_ctx_t (v2)
      tests/i915/gem_request_retire: Convert to intel_ctx_t
      tests/i915/gem_ctx_shared: Convert to intel_ctx_t (v2)
      tests/i915/gem_ctx_shared: Stop cloning contexts
      tests/i915/gem_create: Convert to intel_ctx_t
      tests/i915/gem_ctx_switch: Convert to intel_ctx_t (v3)
      tests/i915/gem_exec_parallel: Convert to intel_ctx_t (v2)
      tests/i915/gem_exec_latency: Convert to intel_ctx_t (v3)
      tests/i915/gem_watchdog: Convert to intel_ctx_t (v2)
      tests/i915/gem_shrink: Convert to intel_ctx_t (v5)
      tests/i915/gem_exec_params: Convert to intel_ctx_t
      tests/i915/gem_exec_gttfill: Convert to intel_ctx_t (v2)
      tests/i915/gem_exec_capture: Convert to intel_ctx_t (v2)
      tests/i915/gem_exec_create: Convert to intel_ctx_t
      tests/i915/gem_exec_await: Convert to intel_ctx_t (v2)
      tests/i915/gem_ctx_persistence: Drop the clone subtest
      tests/i915/gem_ctx_persistence: Drop the engine replace subtests
      tests/i915/gem_ctx_persistence: Convert to intel_ctx_t
      tests/i915/module_load: Convert to intel_ctx_t
      tests/i915/pm_rc6_residency: Convert to intel_ctx_t
      tests/i915/gem_cs_tlb: Convert to intel_ctx_t
      tests/core_hotplug: Convert to intel_ctx_t
      tests/i915/gem_exec_balancer: Stop cloning engines
      tests/i915/gem_exec_balancer: Don't reset engines on a context (v2)
      tests/i915/gem_exec_balancer: Stop munging ctx0 engines
      tests/i915/gem_exec_balancer: Drop bonded tests
      lib/intel_ctx: Add load balancing support (v2)
      tests/i915/gem_exec_balancer: Convert to intel_ctx_t
      tests/i915/gem_exec_endless: Stop munging ctx0 engines
      lib/i915/submission: Rework gem_test_all_engines to use intel_ctx_t (v3)
      lib/i915: Require a context config in gem_submission_measure
      tests/i915/gem_ctx_engines: Rework execute-one*
      tests/i915/gem_ctx_engines: Use better engine iteration
      tests/i915/gem_ctx_engines: Drop the idempotent subtest
      tests/i915/gem_ctx_create: Don't re-open the device in maximum()
      tests/i915/gem_ctx_create: Convert benchmarks to intel_ctx_t
      tests/i915/gem_vm_create: Delete destroy racing tests
      tests/i915/gem_vm_create: Use intel_ctx_t in the execbuf test
      tests/i915/sysfs: Convert to intel_ctx_t
      tests/i915/gem_workarounds: Convert to intel_ctx_t
      lib/i915/gem_context: Delete all the context clone/copy stuff
      tests/i915/gem_ctx_engines: Delete the libapi subtest
      lib/igt_dummyload: Stop supporting ALL_ENGINES without an intel_ctx_t
      lib/i915/gem_engine_topology: Delete the old physical engine iterators
      tests/i915/gem_mmap_gtt: Convert to intel_ctx_t (v2)
      tests/i915/i915_query: Convert to intel_ctx_t
      igt/dummyload: Require an intel_ctx_t for POLL_RUN and !ALL_ENGINES
      lib/i915: Rework engine API availability checks (v4)
      lib/intel_bb: Remove intel_bb_assign_vm and tests (v2)
      tests/i915/gem_ctx_param: Stop setting VMs on old contexts
      tests/i915/gen9_exec_parse: Convert to intel_ctx_t
      tests/i915/gem_ctx_param: Add tests for recently removed params
      tests/i915/gem_ctx_param: Add a couple invalid PARAM_VM cases
      tests/i915/gem_ctx_engines: Fix the invalid subtest for the new rules
      tests/i915/gem_exec_balancer: Fix invalid-balancer and invalid-bonds for the set-once rule (v2)
      tests/i915/gem_exec_balancer: Add a test for combined balancing and bonding (v2)
      tests/i915/exec_balancer: Drop the bonded-slice test
      test/i915/gem_ringfill: Create contexts on the right FD with NEW_FD
      lib/intel_ctx: Add a intel_ctx_cfg_engine_class helper
      tests/i915/gem_eio: Convert to intel_ctx_t
      tests/i915/gem_ctx_persistence: Use intel_ctx_t for hang subtests
      i915: Improve the precision of command parser checks
      tests/dmabuf: Add tests for sync_file export (v6)
      tests/dmabuf: Add tests for sync_file import (v5)

Jeevan B (21):
      tests/kms_flip_tiling: Fix clean up when subtest fails
      tests/core_hotunplug: Drop log level for preventively unloading snd driver
      tests/i915/kms_big_fb: Skip tests if there is no connector connected
      lib/igt_aux: Rename igt_debug_manual_check and assert check if all is supplied
      tests/kms_psr2_sf: Change testcase design
      tests/kms_display_modes: Add test for extended mode
      include/drm-uapi: Import drm_fourcc header from c6e7deb0f092
      igt/lib: Add tile 4(F-tile) format support
      igt/tests: Add support for Tile4(TileF) format to tests/kms_plane_multiple
      igt/tests: Add support for Tile4(TileF) format to tests/kms_plane_lowres
      igt/tests: Add support for Tile4(TileF) format to tests/kms_big_fb
      igt/tests: Add support for Tile4(TileF) format to kms_rotation_crc
      tests/kms_addfb_basic: Add support for Tile4 format
      lib/intel_batchbuffer: Fix typo from src_tiling to dst_tiling
      drm/fourcc: Import drm_fourcc header from 9035039e1ed69
      tests/kms_flip: skip test if compatible mode is not found
      tests/kms_flip: Skip test only for invalid combination
      kms_flip_event_leak: Create dynamic subtests
      tests/i915/kms_psr2_sf: Convert tests to dynamic
      tests/i915/kms_psr2_su: Convert tests to dynamic
      lib/mtl: Add Meteorlake platform definition

Jessica Zhang (11):
      tests/kms_atomic_transition: Separate commits for pipes with shared planes
      tests/kms_universal_plane: Change num_primary and num_cursor asserts into warnings
      meson: Move MSM-specific tests to their own subdirectory
      tests/kms_writeback: Add helper method to detach pipe from output when test finishes
      lib/igt_kms: Set pipe->plane_primary to driver-assigned primary plane when there are multiple possible primary planes
      lib/igt_kms: Call get_assigned_primary only if display is initialized
      lib/igt_debugfs: Add IGT_CRC_SOURCE environmental variable
      tests/kms_writeback: Detach pipe only for valid FB_ID
      tests/kms_cursor_legacy: Add check for overlay planes
      tests/kms_writeback: Fix build warnings
      tests/kms_cursor_crc: Wait extra vblank

Jigar Bhatt (4):
      tests/i915/i915_pm_dc: Refactoring pwr_dmn_info to debugfs_dump
      tests/i915/i915_pm_dc: Fix DC9 test
      tests/i915/i915_pm_dc: Changing sysfs open attribute to O_RDONLY
      tests/i915/i915_pm_dc: Fix condition in dc9-test

John Harrison (29):
      tests/i915: Skip gem_exec_fair on GuC based platforms
      tests/gem_ctx_persistence: Update saturated_hostile for dependent engine resets
      tests/i915/gem_exec_capture: Remove pointless assert
      tests/i915/gem_exec_capture: Cope with larger page sizes
      tests/i915/gem_exec_capture: Make the error decode a common helper
      tests/i915/gem_exec_capture: Use contexts and engines properly
      tests/i915/gem_exec_capture: Check for memory allocation failure
      lib/igt_sysfs: Support large files
      lib/igt_gt: Allow per engine reset testing
      tests/i915/gem_exec_capture: Update to support GuC based resets
      tests/i915/i915_hangman: Add descriptions
      lib/hang: Fix igt_require_hang_ring to work with all engines
      tests/i915/i915_hangman: Update capture test to use engine structure
      tests/i915/i915_hangman: Explicitly test per engine reset vs full GPU reset
      tests/i915/i915_hangman: Add uevent test & fix detector
      tests/i915/i915_hangman: Use the correct context in hangcheck_unterminated
      lib/store: Refactor common store code into helper function
      tests/i915/i915_hangman: Add alive-ness test after error capture
      tests/i915/i915_hangman: Remove reliance on context persistance
      tests/i915/i915_hangman: Run background task on all engines
      tests/i915/i915_hangman: Don't let background contexts cause a ban
      tests/i915/gem_exec_fence: Configure correct context
      lib/i915: Add helper for non-destructive engine property updates
      tests/i915/i915_hangman: Configure engine properties for quicker hangs
      tests/i915/gem_exec_capture: Restore engines
      tests/i915/gem_exec_capture: Fix memory object size in gem_exec_capture
      include/drm-uapi: Update to latest i915_drm.h
      tests/i915/query: Add descriptions to existing tests
      tests/sysfs: Update timeslice/preemption for new range limits

Jonathan Cavitt (1):
      tests/i915/gem_ctx_engines: Avoid SET_CACHING ioctl during fork

José Roberto de Souza (12):
      lib/i915: Add ADL-P stride restrictions for non-linear buffers
      tools/registers: Add missing registers relevant to debug PSR underruns
      tests/kms_cursor_legacy: Handle cursor movements as slow patch for display 9+
      tests/kms_psr2_su: Set the damaged clip in page flips
      test/kms_frontbuffer_tracking: Fix multidraw test
      tests/kms_psr: Add drmModeDirtyFB() calls to handle frontbuffer rendering tests
      lib: Sync Intel PCI ids
      Revert "tests/kms_psr: Skip h/w tracking PSR2 tests for ADL-P"
      tests/kms_psr2_su: Skip test when necessary
      tests/kms_async_flips: Skip test when running with Intel's PSR2 selective fetch enabled
      tests/kms_cursor_legacy: Disable Intel's PSR2 selective fetch in this test
      tests: Add a new test to stress PSR

Jouni Högander (14):
      tests/kms_psr2_su: Add offset to drawn rectangle
      tests/kms_psr2_su: add biplanar selective update tests
      tests/kms_psr2_sf: Add new subtest for biplanar format
      kms_psr2_su: Fix igt_fixture handling
      tests/kms_psr2_sf: Add new testcases for moving plane without updates
      kms_psr2_su: Use FB_DAMAGE_CLIPS only when supported
      tests/kms_psr2_sf: Move continuous testcase preparation for new tests
      tests/kms_psr2_sf: Add new move continuous testcases
      tests/i915/kms_psr2_sf: add sel fetch/big fb test
      tests/i915/kms_psr2_sf.c: Fix for setting wrong size for cursor fb
      tests/i915_kms_psr2_sf: Set big_fb_test as 0 by default
      tests/i915/kms_psr2_sf: Make setting fb and plane sz/pos more clear
      tests/i915/kms_psr2_sf: Fix setting wrong fb size
      tests/i915/kms_frontbuffer_tracking: Skip fbcpsr testcases as needed

Juha-Pekka Heikkila (26):
      tests/kms_cursor_crc: use flipping instead of frontbuffer
      tests/kms_ccs: separate ccs modifiers to separate subtests
      tests/kms_plane: fix rounding error
      tests/kms_flip_scaled_crc: parameterize test sizes and fix test to try other connectors
      tests/kms_cursor_crc: Separate hw and sw runs on tests
      tests/kms_plane_alpha_blend: reset display after test
      tests/kms_cursor_crc: move create_cursor_fb above alpha tests
      tests/kms_cursor_crc: take alpha into use when draw cursor
      tests/kms_cursor_crc: use same test path for alpha and size tests as all other tests
      tests/kms_plane_multiple: Use same modifier for reference crc as for test crc
      tests/i915/kms_flip_tiling: Handle lost flip event
      tests/i915/gem_render_copy_redux: reduce looping if on simulation
      tests/i915/kms_flip_scaled_crc: Fix error message
      tests/i915/kms_big_fb: move start of crc calculation past first commit
      tests/i915/kms_big_fb: Don't fill small fb during test setup
      tests/i915/kms_ccs: Fix 4tiled rc ccs and color clear tests
      lib/intel_chipset: restore usage of has_flatccs flag
      tests/i915/kms_big_fb: fix max stride async flip tests
      tests/kms_cursor_crc: wait for cursor only when needed
      tests/kms_rotation_crc: add I915_FORMAT_MOD_4_TILED to multiplane rotation tests
      lib/rendercopy: separate intel clear color functions
      tests/kms_rotation_crc: try to simplify multiplane rotation tests
      tests/kms_addfb_basic: avoid excessive logging on legacy format test
      tests/i915/kms_big_fb: optimize async flip tests
      tests/kms_cursor_crc: reduce cpu work on restoring image
      tests/kms_plane_alpha_blend: stop crc generation before asserting

Juha-Pekka Heikkilä (6):
      tests/kms_big_fb: Add max HW stride length tests
      tests/kms_big_fb: Add max hw stride lenght async flip test
      lib/DG2: create flat ccs framebuffers with 4-tile
      tests/kms_ccs: Add dg2 tiled-4 ccs modifiers
      tests/kms_getfb: Add flat ccs modifier support
      lib/mtl: Use same path for MTL as DG2 for draw_rect_blt()

K. Eugene Carlson (1):
      tools/intel_gpu_top: Restore terminal attributes

Kai Vehmanen (1):
      tests/core_hotunplug: apply audio unload for all i915 hw

Kalamarz, Lukasz (1):
      tests/i915/gem_exec_basic: Iterate over all memory regions

Kamil Konieczny (20):
      tests/gem_sync: Change duplicate subtest names
      tests/gem_exec_whisper: Change duplicated test names
      tests/gem_blits: Add no-reloc capability
      lib/intel_batchbuffer: add tracking and reset for allocator
      i915/api_intel_allocator: fix standalone subtest
      tests/i915/api_intel_allocator: change copy instruction for new gens
      lib/intel_batchbuffer: add create without relocs
      tests/i915/gem_concurrent_all: Add no-reloc capability
      i915/gem_concurrent_all: fix swap subtest group
      tests/i915/gem_close_race: Adopt to use softpin
      i915/gem_pipe_control_store_loop: Adopt to softpin
      i915/i915_hangman: fail only after freeing spinners
      lib/igt_device_scan: refactor filter adding
      lib/igt_device_scan: add card=all filter selector
      lib/igt_core: add igt_multi_fork for parallel tests
      lib/igt_core: add prefix to logging
      lib/tests/igt_fork: add tests for igt_multi_fork
      tests/i915/gem_basic: add multigpu-create-close subtest
      tests/i915/gem_exec_gttfill: add new subtest multigpu-basic
      tests/i915/gem_close_race: add multiGPU subtests

Karolina Drobnik (7):
      tests/i915: Use correct type for gen parameter
      lib/i915: Add ATS-M definitions
      test/intel-ci/fast-feedback: Add i915_pciid test
      lib/i915: Fix ATS-M definitions
      lib/intel_batchbuffer: Extend __intel_bb_create to handle context config
      lib/intel_batchbuffer: Add support for custom engine layouts
      tests/api_intel_bb: Add misplaced_blitter test

Karolina Stolarek (4):
      tests/api_intel_bb: Run misplaced-blitter only with supported engines
      lib/intel_batchbuffer: Make find_engine() more flexible
      lib/intel_batchbuffer: Use correct engine id in exec_blit()
      tests/gem_ccs: Fix memory leak in destroy_object

Karthik B S (25):
      tests/kms_dp_dsc: Bug fix for DP on Pipe A
      tests/kms_big_joiner: Add dual display subtest
      tests/kms_dp_dsc: Use the correct variables
      tests/intel-ci: Remove kms_rotation_crc from pre-merge blacklist
      tests/i915_pxp: CRC validation for display tests.
      Revert "tests/kms_async_flips: Make the crc test faster"
      tests/kms_flip: Update logic to calculate test duration
      tests/kms_dp_tiled_display: Close fd after igt_display_fini
      tests/i915/kms_big_fb: Move cleanup code to fixture
      tests/kms_async_flips: Convert tests to dynamic
      tests/kms_async_flips: Test Refactoring
      tests/kms_plane_lowres: Convert test to dynamic
      tests/kms_plane_lowres: Test cleanup
      tests/kms_big_joiner: Convert test to dynamic
      tests/i915/kms_big_fb: Move intel_ibb_destroy out of test_cleanup
      tests/kms_plane: Test Refactoring
      tests/kms_cursor_crc: Move output check to the beginning
      tests/kms_prime: Add subtests to validate hybrid GPU
      tests/i915/kms_big_fb: First async flip discarded on i915
      tests/kms_plane_multiple: Convert tests to dynamic
      tests/kms_addfb_basic: Skip y-tile-legacy subtest on platforms w/o fences
      tests/kms_plane_alpha_blend: Convert test to dynamic
      tests/kms_content_protection: Fix MST subtests
      tests/kms_content_protection: Test Cleanup
      tests/kms_content_protection: Convert test to dynamic

Khaled Almahallawy (2):
      tests/kms_content_protection: Skip if not able to create display_hdcp_srm.bin
      tests/chamelium: Move Chamelium tests to their own folder

Kunal Joshi (8):
      Make basic chamelium function accessible to other tests
      Added structures and functions to generate tiled edids
      Added a subtest where chamelium acts as a tiled panel
      lib/igt_chamelium: Retry DP FSM on Failure
      tests/kms_dp_tiled_display: added test description for chamelium subtest
      tests/kms_big_fb: Optimize setup_fb function
      tests/chamelium/kms_color_chamelium: Fix port_idx check
      tests/kms_chamelium: Fix common suspend/hibernate

Lee Shawn C (1):
      tests/kms_dp_dsc: Avoid SIGSEGV when release DRM connector.

Lionel Landwerlin (34):
      lib/i915/perf: add name checker for conversion
      lib/i915/perf-configs: rename metric descriptions
      lib/i915/perf-config: simplify converter script
      lib/i915/perf-config: document devinfo fields
      lib/i915/perf-config: don't forget to resolve single variable
      lib/i915/perf-config: sanitize GT names
      lib/i915/perf: have python scripts a custom_target input
      tools/i915-perf-recorder: print out oa format
      lib/i915/perf: fixup conversion script for XEHPSDV
      lib/i915/perf: make warning message more helpful
      lib/i915/perf: expose new operators for codegen
      lib/i915/perf: add support for new EuDualSubslicesTotalCount var
      lib/i915/perf-config: extend the device info
      i915/perf: update import script
      lib/i915: prepare codegen for new ACM/DG2 variables
      lib/i915/perf: Add ACM GT1 metrics
      lib/i915/perf: Add ACM GT2 metrics
      lib/i915/perf: Add ACM GT3 metrics
      lib/i915/perf: implement report accumulation for new format
      tools/i915-perf-recorder: add ability to select device
      lib/i915/perf: fixup report validity
      lib/i915/perf: add a helper to read timestamps
      lib/i915/perf: store bit shifting required for OA timestamps
      lib/i915/perf: indentation fix
      tools/i915-perf-recorder: capture OA & CS frequencies
      tools/i915-perf: make timestamp range easier to compare
      tools/i915-perf: printout CPU clock used
      tools/i915-perf: record remaining perf data on exit
      lib/i915/perf: add a raw timestamp utility
      lib/i915/perf: add helper function to get report reason
      tools/i915-perf: add option to printout reports data
      lib/i915: add new ACM/DG2 format in codegen
      lib/i915/perf: configure OA timestamp shift and mask for ACM
      v2: Add mtl to perf-metrics-codegen.py (Umesh)

Luca Coelho (4):
      tests/kms_sysfs_edid_timing: increase max time thresholds
      tests/kms_sysfs_edid_timing: fail if probing a single connector takes too long
      tests/kms_sysfs_edid_timing: clarify test description and thresholds
      tests/kms_sysfs_edid_timing: add total mean assertion threshold

Lucas De Marchi (14):
      include/drm-uapi: sync kernel headers
      Remove local copies of I915 macros
      tests/i915/gem_mmap_wc: drop LOCAL_IOCTL_I915_GEM_MMAP_v2
      lib/ioctl_wrappers: drop gem_require_stolen_support()
      benchmarks/gem_exec_tracer: nuke LOCAL_IOCTL_I915_GEM_EXECBUFFER2_WR
      benchmarks/gem_busy: nuke LOCAL_IOCTL_SYNCOBJ_CREATE
      benchmarks/gem_busy: nuke LOCAL_IOCTL_SYNCOBJ_WAIT
      Nuke local versions of DRM_FORMAT and DRM_MODE
      tests/kms_sequence: nuke local drm definitions
      lib/igt_edid: fix edid field name
      lib/igt_edid: fix string padding
      tests/intel-ci/fast-feedback: Move gem_lmem_swapping
      tests/intel-ci/fast-feedback: Move gem_lmem_swapping further
      lib: Force rescan when module is loaded

Maarten Lankhorst (4):
      Fixup clang compiler warnings.
      i915: Handle the case where legacy mmap is not available, v2.
      lib/igt_fb: create i915 bo in lmem, if available
      lib/igt_draw: Use DG-1 compatible mmap calls for draw methods, v2.

Maitreyee Rao (1):
      lib/igt_fb: add an API to support color square DP CTS pattern

Marcin Bernatowicz (2):
      tests/device_reset: remove artificial timeout
      lib/sysfs: helper for number of GTs

Mario Kleiner (1):
      lib/igt_fb: Add support for testing of 16 bpc fixed point formats.

Mark Yacoub (31):
      tests/kms_panel_fitting: Move Intel GEN check under a is_i915_device
      tests/kms_content_protection: Skip on hdcp_sink_capability is not found.
      drmtest: Add is_msm_device check
      kms_addfb_basic: Check for AMDGPU and MSM bad pitch.
      tests/kms_vblank: Turn on hardware before testing invalid vblank.
      lib/igt_fb: Support Tile Size for AMD non linear modifiers.
      Add .vscode to gitignore
      tests/kms_vblank: Turn on hardware before testing invalid vblank.
      tests/kms_atomic_transition: Enable Primary Plane on Enabling CRTC
      tests/kms_atomic: igt_require_pipe_crc for plane_immutable_zpos
      tests/kms_addfb_basic: Test addfb2 with DRM_FORMAT_C8 only if supported.
      tests/template: Use DRIVER_ANY in for drm_open_driver
      tests/kms_addfb_basic: Remove handling for Unknown Vendor.
      tests/kms_flip: Discard any stale event at each retry
      tests/kms_plane_cursor: igt_require_pipe_crc for test_init
      tests/kms_cursor_legacy: Use igt_require_intel before get_reloc_ahnd
      tests: Remove restrictions on tests running only DRIVER_INTEL and DRIVER_AMDGPU
      tests/kms_flip: Do not check for timestamp or sequences on Mediatek
      tests/kms_cursor_legacy: igt_require_pipe_crc for flip-vs-cursor{-busy}-crc
      lib/igt_chamelium: Check for error instead of port id for invalid
      docs: Update Chamelium doc
      lib/chamelium: Use MST Path property to reprobe an MST connector.
      Chamelium: Make autodiscover discover connectors one at a time.
      Chamelium: Handle getting port connector if it's MST.
      chamelium: Get connector After plug to get EDID
      Refactor Display Outputs to handle MST Connectors.
      kms_chamelium: Add new EDID stress resolution test
      Chamelium: Add more real monitor EDIDs
      Chamelium: Add new EDID Resolution List test
      Cv3 workaround: skip plug all at init
      Chamelium: Split kms_chamelium into multiple kms_chamelium tests

Mastan Katragadda (6):
      tests/i915/exec_balancer: Added Skip invalid-bonds
      tests/i915/i915_pm_dc: Moved prev DC counter reading logic
      tests/i915/exec_balancer: Added Skip Guc Submission
      intel-ci: blacklist gem_exec_alignment@pi-shared
      tests/i915/gem_media_vme : skip on no media Samplers
      igt/gem_mmap_offset: Add subtest oob_read

Matt Roper (8):
      lib: sync i915_pciids.h with kernel
      lib/i915: Split 'gen' into graphics version and display version
      lib/i915: Add intel_display_ver() and use it in display tests/libs
      lib/igt_draw: Add pixel math for tile-4
      igt/tests: Add support for Tile4(TileF) format to testdisplay
      lib/igt_draw: Use XY_FAST_COLOR_BLT on DG2
      tests/i915_query: Test new DRM_I915_QUERY_GEOMETRY_SUBSLICES query
      lib: sync i915_pciids.h with kernel

Matthew Auld (56):
      i915_drm.h sync
      tests/i915/gem_create: exercise placements extension
      tests/kms_addfb_basic: pass the actual fd to gem_has_lmem
      lib/intel_memory_region: verify item.length
      tests/i915_query: extract query_garbage_items
      tests/i915_query: add some sanity checking around regions query
      lib/i915/gem_mman: add FIXED mmap mode
      lib/i915/gem_mman: add fixed mode to mmap__device_coherent
      lib/i915/gem_mman: add fixed mode to gem_mmap_offset__cpu
      lib/i915/gem_mman: add fixed mode to gem_mmap__cpu
      lib/i915/gem_mman: update mmap_offset_types with FIXED
      lib/ioctl_wrappers: update mmap_{read, write} for discrete
      lib/intel_bufops: update mmap_{read, write} for discrete
      lib/ioctl_wrappers: update set_domain for discrete
      tests/i915/module_load: update for discrete
      lib/i915/gem_mman: add helper query for has_device_coherent
      tests/i915/gem_exec_fence: use device_coherent mmap
      tests/i915/userptr: fix mapping type
      tests/i915/gem_exec_params: check available memory earlier
      test/gem_lmem_swapping: account for object rounding
      tests/gem_lmem_swapping: reduce the timeout
      test/gem_lmem_swapping: fix physical engine usage
      test/i915/gem_exec_await: prefer gem_mmap__device_coherent
      tests/kms_pwrite_crc: handle missing get_caching
      tests/gem_ctx_engines: handle missing set_caching
      tests/i915/gem_workarounds: handle discrete
      tests/i915/gem_caching: handle discrete
      tests/i915/gem_eio: fix uaf
      tests/i915/kms_mmap_write_crc: handle missing gem_get_caching()
      tests/i915: adapt __copy_ccs for discrete
      lib/i915_drm_local: Add I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS
      lib/i915: wire up optional flags for gem_create_ext
      tests/i915/gem_create: exercise NEEDS_CPU_ACCESS
      lib/i915: add gem_create_with_cpu_access_in_memory_regions
      tests/i915/query: sanity check the probed_cpu_visible_size
      tests/i915/query: sanity check the unallocated tracking
      lib/i915/intel_memory_region: plumb through the cpu_size
      tests/i915/capture: handle uapi changes
      lib/i915: request CPU_ACCESS for fb objects
      tests/gem_exec_capture: adjust the pi subtest
      tests/i915_query: tweak the unallocated tracking test
      Revert "lib/i915: request CPU_ACCESS for fb objects"
      tests/i915/gem_create: use 48b addressing
      tests/gem_lmem_swapping: add some coverage for big objects
      i915_drm.h sync
      tests/i915/query: fix igt_assert_eq_u32
      tests/i915/query: stop checking rsvd0 in region info
      tests/i915/module_load: fix resize-bar on DG1
      tests/i915/query: use 48B_ADDRESS in upload
      tests/i915/module_load: restore gem_sanitycheck for discrete
      tests/i915/gem_create: use cpu_size in always_clear
      tests/i915/gem_mmap_offset: use cpu_size in always_clear
      tests/i915/gem_lmem_evict: verify async eviction with madvise
      lib/dmabuf_sync_file: move common stuff into lib
      tests/i915/gem_exec_balancer: exercise dmabuf import
      tests/i915/gem_ppgtt: verify GTT eviction with contended locks

Matthew Brost (5):
      i915/gem_exec_schedule: Make gem_exec_schedule understand static priority mapping
      i915/gem_ctx_shared: Make gem_ctx_shared understand static priority mapping
      i915/sysfs_preempt_timeout: Update test to work with GuC submission
      i915_drm.h sync with drm-next
      i915/gem_exec_balancer: Test parallel execbuf

Mauro Carvalho Chehab (42):
      runner: check if it has root permissions
      runner: Add support for code coverage
      runner: cleanup code_cov directory, if any
      scripts/code_cov_gather*/sh: add help scripts for code coverage
      scripts/code_cov_gather_on_build.sh: Improve the script
      scripts/code_cov_capture.sh: add a script to use lcov on build+test machine
      scripts/code_cov_gen_report.sh: add a script to generate code coverage reports
      scripts/run-tests.sh: add code coverage support
      docs: add documentation for code coverage
      scripts/code_cov*: remove the extensions from them
      scripts/code_cov_parse_info: add a tool to parse code coverage info files
      scripts/code_cov_gen_report: add support for filtering info files
      runner: execute code coverage script also from PATH
      scripts/meson.build: install code coverage scripts
      scripts/code_cov_selftest.sh: test if IGT code coverage is working
      docs/code_coverage.md: document the code coverage filter script
      scripts/code_cov_parse_info: better handle test name
      code_cov_parse_info: fix error handling when opening files
      code_cov_parse_info: fix --show-lines logic
      code_cov_parse_info: add support for exclude filters
      code_cov_parse_info: add support for generating html reports
      tests/core_hotunplug: properly finish processes using audio devices
      lib/igt_kmod: always fill who when unloading audio driver
      lib/igt_kmod: improve audio unbind logic
      lib/igt_kmod: don't leak who from module unload routines
      core_hotunplug: fix audio unbind logic
      lib/igt_kmod: make it less pedantic with audio driver removal
      lib/igt_core: export kill_children() function
      lib/igt_kmod: properly handle pipewire-pulse
      lib/igt_aux: get rid of passing pipewire-pulse pid on functions
      lib/igt_core: use print_backtrace() on internal_assert()
      lib/igt_aux: fix kselftest module unload
      code_cov_parse_info: output filters at the html report
      benchmarks/gem_blt: fix baseline estimation
      lib/igt_kmod: remove the conditional audio removal code
      igt_core: add a line break at the end of some internal_assert
      scripts/code_cov_parse_info: avoid warning messages on parsing
      scripts/code_cov_parse_info: fix --only-drm filtering rules
      scripts/code_cov_parse_info: fix brf record handling
      scripts/code_cov_parse_info: Fix indentation at the output html file
      scripts/code_cov_parse_info: take gcc IPA optimizations into account
      scripts/code_cov_parse_info: print common coverage and extra per function

Maxime Ripard (3):
      tests/kms_writeback: Use endianness accessor to fill pixels
      lib/igt_fb: Ignore the X component when computing CRC
      tests/kms_writeback: Use a garbage X value to create fill our test buffer

Maíra Canal (17):
      tests/amdgpu: Skip multihead MPO tests on single display
      include/drm-uapi: Update to the latest v3d_drm.h
      tests/v3d: Move V3D tests to their own folder
      tests/v3d: Remove unused or redundant includes
      tests/v3d: Add igt_describe() to all V3D subtests
      lib/igt_v3d: Add PAGE_SIZE macro to V3D
      tests/v3d_create_bo: Create test for V3D's Create BO IOCTL
      tests/v3d_perfmon: Create test for V3D's Perfmon IOCTLs
      tests/amdgpu/amd_bypass: skip if connector is not DisplayPort
      tests/vc4: Move VC4 tests to their own folder
      tests/vc4: Remove unused or redundant includes
      lib/igt_vc4: Add PAGE_SIZE macro to VC4
      tests/vc4: Skip VC4 tests if they are running on BCM2711/RaspberryPi4
      tests/vc4_perfmon: Create test for VC4's Perfmon IOCTLs
      tests/kms_addfb_basic: Avoid open-coded expressions
      tests/v3d_mmap: Improve tests from V3D's Mmap BO IOCTL
      tests/vc4_mmap: Create test for VC4's Mmap BO IOCTL

Melissa Wen (5):
      tests/kms_plane_alpha_blend: refactor alpha-7efc for clearer validation
      test/kms_plane_alpha_blend: clearer validation for coverage-7efc
      tests/kms_color: fix crc assert condition
      tests/kms_color: check degamma and gamma props in CTM subtests
      tests/kms_color: disable degamma/gamma by default for CTM tests

Mika Kahola (6):
      tests/kms_plane_lowres: Use lowest mode for testing
      tests/kms_plane_scaling: Skip 90/270 rotation for ADL-P
      tests/kms_plane_multiple: Limit plane testing to 3 planes by default
      lib/intel_device_info: Add a flag to indicate tiling 4 support
      tests/kms_frontbuffer_tracking: Add support for 4 tiling
      tests/kms_draw_crc: Use 4 tiling when filling framebuffer

Mikita Lipski (1):
      tests/amdgpu: Add multi-eDP support to ABM test

Mohammed Khajapasha (3):
      tests/kms_force_connector_basic: Skip prune stale mode
      tests/kms: Create buffer object from LMEM for discrete
      tests/kms_addfb_basic: Add invalid buffer object test for discrete

Mohammed Thasleem (11):
      tests/i915/i915_pm_lpsp : Close fd after igt_display_fini execution.
      tests/i915/kms_dsc : Close fd after igt_display_fini execution.
      tests/i915/i915_pm_dc: Check dc3co count to skip the test
      tests/i915/kms_legacy_colorkey: Create dynamic subtests
      tests/kms_rmfb: Create dynamic subtests
      tests/kms_rmfb: Test Cleanup
      tests/i915/kms_mmap_write_crc: Create dynamic subtests
      tests/i915/kms_mmap_write_crc: Test Cleanup
      tests/kms_lease: Create dynamic subtests
      tests/kms_lease: Test Cleanup
      tests/kms_force_connector_basic: Test Cleanup

Nicholas Kazlauskas (1):
      tests/amdgpu: Add MPO swizzle mode toggle test

Nidhi Gupta (14):
      tests/kms_frontbuffer_tracking: Extend to test FBC on multiple pipes
      tests/kms: sanitize the system state between subtests
      tests/kms : Added dynamic test cases
      tests/kms_concurrent: Skip the subtest if the resolution is not supported
      tests/kms_invalid_mode: Convert tests to dynamic
      tests/kms_invalid_mode: Test Cleanup
      tests/i915/kms_frontbuffer_tracking: Increase the poll timeout for simulation platform
      tests/kms_invalid_mode: Avoid usage of same pipe on multiple outputs
      tests/kms_concurrent: Fix regression in test_resolution_with_output
      tests/i915/kms_draw_crc: Convert tests to dynamic
      tests/i915/kms_draw_crc: Test Cleanup
      tests/i915/i915_pm_backlight: Add new subtest to validate dual panel backlight
      tests/i915/i915_pm_backlight: Add a common structure for all subtests
      tests/i915/i915_pm_backlight: Create dynamic subtests

Niranjana Vishwanathapura (2):
      tests/i915/gem_shrink: Fix alloc_size unit
      tests/i915/gem_shrink: Fix memory requirement assertion

Nirmoy Das (9):
      i915/gem_ctx_shared: handle mmap for discrete
      lib/i915: remove use of debugfs/i915_next_seqno
      i915/gem_exec_balancer: fix parallel_ordering with no-reloc
      lib/i915: Add graphics release subversion to device info
      i915/gem_exec_capture: fix needs_recoverable_ctx
      tests/i915_query: fix cache type iteration
      tests/i915/gem_create: use correct type for assert
      i915/gem_ringfill: Add 48b address flag in store-dword
      i915/i915_hangman: Idle the gpu for next test

Pankaj Bharadiya (4):
      tests/kms_psr2_sf: Add subtest description
      tests/kms_psr2_su: Add subtest description
      tests/kms_psr: Skip h/w tracking PSR2 tests for ADL-P
      lib/rendercopy/dg2: Add rendercopy support for dg2

Patnana Venkata Sai (7):
      tests/kms_plane: Restrict the test execution to two pipes
      intel-ci: Remove pixel-format-source-clamping@* from the pre-merge blacklist
      tests/kms_dp_dsc: Read the debugfs only once
      tests/kms_rotation_crc: Skip 90/270 rotation for ADL-P
      tests/kms_dp_dsc: Add a subtest to force DSC output BPP
      tests/i915/kms_dsc: To test modeset on dsc with highest mode
      tests/kms_cursor_edge_walk: Reduce read pipe CRC count for simulation

Petri Latvala (47):
      lib: Put edid_ar_svds where it's used
      prime_udl: Add test description
      gitlab-ci: Try to avoid runners that jam
      kms_ccs: Don't skip more subtests than necessary
      intel-ci: Block msm tests
      intel-ci: Stop executing kms_bw
      tests/igt_command_line.sh: Check for duplicate subtest names
      lib/meson.build: Fix underscorify call
      tests/kms_cursor_legacy: Fix build warning
      tests/fbdev: Add debug traces to subtest pan
      igt_core: Fix docs for SLOW_QUICK
      lib/igt_core: Ensure subtest result is skip if all dynamic subtests skip
      kms_plane_scaling: Add more scale factor tests to cover more drivers
      runner: Fix handling of per-test-timeout
      runner: Introduce --prune-mode to igt_runner
      runner: Unit tests for the --prune-mode option
      runner_tests: Rename dynamic-subtests json test to dynamic-subtests-keep-dynamic
      runner_tests: json tests for all prune-mode options
      runner: Override results for subtests even when there's dynamic subtests
      gem_lmem_swapping: Check requirements before module unload
      gitlab-CI: Temporarily disable armhf and arm64 selfchecks
      lib: Add missing newline in igt_fopen_data's logging
      i915_pm_dc: Use igt_main
      Update MAINTAINERS
      lib/runnercomms: Structured communication from tests to igt_runner
      lib/igt_core: Send logs to runner with comms
      runner: Use socket communications
      runner/runner_tests: Add tests for socket communications
      lib/tests: Add unit tests for socket communication packet creation
      runner: Add a socket comms decoder
      runner: Disable socket communications for now
      gitlab-CI: Temporarily disable mips selfchecks
      runner: Use a bigger buffer for receiving test outputs
      igt_core: Split too long log lines when sending to runner with comms
      runner: Continue using socket comms when getting an invalid packet
      igt_core: Make sure test result gets to runner when test has no subtests
      lib/runnercomms: Report empty comms dump as empty
      Revert "runner: Disable socket communications for now"
      runner: Fix a memory leak in stderr_contains_warnings
      i915_pm_freq_mult: Compare scale factors as floats
      runner: Don't read journal at all if socket comms are used
      runner: Reset disk usage tracking on subtest change
      tests: Avoid the name "all"
      chamelium: Handle errors when fetching AdapterAllowed
      lib: Also consider TAINT_MACHINE_CHECK as abortable taint
      runner: Correctly handle abort before first test
      Update NEWS, bump version to 1.27

Priyanka Dandamudi (23):
      tests/prime_vgem: use device_coherent mmap
      tests/i915: use device_coherent mmap
      tests/i915/gem_exec_nop: Update poll sequential
      tests/i915: use gem_require_mmap_device_coherent
      lib/i915/i915_drm_local: Add COMPUTE class engine
      tests/i915/gem_userptr_blits: Update for discrete
      i915/gem_create: Added test description for test case
      tests/debugfs_test: Added test description for test case
      tests/vgem_basic: Added test description for test case
      i915/gem_ctx_exec: Added test description for testcase
      i915/gem_flink_basic: Add subtests description for test case
      i915/gem_wait: Add description for test and subtests
      i915/i915_module_load: Add descriptions for test
      tests/gem_reset_stats: Test for shared reset domain
      lib/igt_sysfs: Remove igt_debug_on in igt_sysfs_gt_open()
      prime_self_import: Add description for test
      tests/drm_import_export: Added test description for test case
      i915/gem_set_tiling_vs_blt: Add description for test case
      i915/gem_madvise: added description for test case
      i915/gem_close_race: added description for test case
      tests/i915/gem_ringfill : Added test description
      i915/gem_mmap_gtt: added description for test case
      tests/i915/i915_module_load: Test resizable bar support

Ramalingam C (4):
      tests/kms_prime: Create the exporting BO with smem
      tests/i915/gem_lmem_swapping: move the obj to lmem before init
      tests/i915/gem_lmem_swapping: create batch buffer from obj pool
      tests/i915/gem_lmem_swapping: Add ccs subtests

Riana Tauro (20):
      lib/igt_aux: add library function to read current selected state of mem_sleep
      tests/i915/i915_suspend: Add s2idle and s3 subtests without i915
      tests/intel-ci/fast-feedback: Add suspend tests without i915 to fast-feedback list
      tests/i915/pm_rc6_residency: Refactoring intel_ctx_t to igt_fixture
      tests/i915/pm_rc6_residency: Extend rc6-idle test on remaining engines
      tests/i915/i915_pm_rc6_residency: Use the correct context in rc6-idle
      tests/i915/i915_pm_rc6_residency: Use correct type for power in rc6-fence
      lib/igt_aux : Skip SUSPEND_STATE_S3 if mem_sleep deep state is not supported
      lib/igt_pm : Add pm functions for d3cold_allowed
      tests/i915/i915_suspend: Disable d3cold_allowed for basic-s2idle-without-i915
      lib/igt_device_scan: fix igt_devices_free
      lib/igt_hwmon: Introduce library igt_hwmon
      lib/igt_power: Rename lib igt_rapl with igt_power
      lib/igt_power: Add hwmon interface to igt_power
      i915/i915_pm_rc6_residency: Add energy support for dgfx
      i915/gem_exec_schedule: Add energy support for dgfx
      i915/gem_exec_whisper: Add energy support for dgfx
      lib/igt_power: clean-up igt_power library
      tests/debugfs_test: Add basic-hwmon test
      tests/intel-ci/fast-feedback: Add basic-hwmon test to BAT

Rob Clark (15):
      drmtest: Add DRIVER_MSM support
      msm: Add helper library
      msm: Add submit ioctl tests
      lib/igt_debugfs: Add helper for writing debugfs files
      lib/igt_debugfs: Add helper for detecting debugfs files
      msm: Add helper for cmdstream building and submission
      msm: Add recovery tests
      igt: Split out I/O helpers
      msm: Add test for kernel buffer permissions
      lib/igt_debugfs: Drop-caches support for msm
      igt: Promote/rename OS helpers
      tests/kms_getfb: Fix on non-i915 devices
      tests/msm: Fix mapping test
      tests/kms_bw: Skip unsupported modes
      tests/kms_plane_multiple: Fix assumption about single primary plane

Rodrigo Siqueira (4):
      tests/kms_concurrent: Making the test more generic
      tests/kms_atomic: Initialize array values before checking them
      test/kms_atomic: Skip plane overlay test for amdgpu
      Revert "test/kms_atomic: Skip plane overlay test for amdgpu"

Rodrigo Vivi (16):
      Revert include/drm-uapi/i915_drm.h back to a drm-next one.
      i915_drm.h sync with drm-next
      tests/gem_userptr_blits: Remove LOCAL_
      include/drm-uapi: Sync with drm-next
      README.md: Detail the drm-uapi headers sync.
      include: Introduce linux-uapi for non-drm-uapi files.
      README.md: Accept the i915_drm.h standalone update.
      tests/i915/query: Query, parse and validate the hwconfig table
      lib/igt_aux: Let's use the official mem_sleep names
      tests/i915/i915_suspend: Be more specific on the S3 mem_sleep requirement.
      lib/igt_aux: Check suspend state support directly.
      lib/igt_aux: Introduce the ability to force S3 suspend state.
      test/i915/i915_suspend: Use SUSPEND_STATE_S3 to enforce S3.
      lib/igt_aux: Fix igt_mem_sleep doc
      tools/intel_pm_rpm: Remove unused devid.
      tools/intel_pm_rpm: Only init debufs_fd if needed.

Rohith Iyer (4):
      tests/kms_writeback: Iterate over only non-null pipes
      lib/igt_kms: Add helper to parse mode string
      tests/testdisplay: Use igt_parse_mode_string for command line arguments
      tests/kms_writeback: Enhance kms_writeback for custom modes

Ryszard Knop (14):
      tests/kms_chamelium: Check if port adapters are in use
      tests/i915_module_load: Add the "load" test
      tests/intel-ci/fast-feedback: add i915_module_load@load
      runner: Check for strchr result in parse_dmesg_line
      runner: Remove some unused values
      igt: Allow overriding the commit hash in the version string
      runner: rename free_settings to clear_settings
      runner: make the usage function variadic
      runner: Add the --environment flag
      runner: Serialize the provided environment flags
      runner: Set requested env vars during execution
      runner: Add help for the --environment flag
      runner: Add tests for environment flags
      docs: Update report link to fd.o GitLab

Sai Gowtham Ch (7):
      i915/gem_bad_reloc: Added description for test case
      i915/gem_partial_pwrite_pread: Add subtests description
      i915/gem_pipe_control_store_loop: added description for test case
      i915/gem_exec_gttfill: Added test description for test case.
      i915/gem_exec_create: Added test description for test case.
      tests/i915/gem_sync: Added test description for test case.
      i915/gem_softpin: Added test description for test case.

Simon Ser (2):
      tests/kms_lease: add empty lease test
      tests/kms_plane_alpha_blend: skip coverage tests on missing enum

Sinjan Kumar (1):
      tests/i915/gem_busy : Added subtests description

Solomon Chiu (1):
      tests/amdgpu: new test for Freesync-Video Mode

Stanislav Lisovskiy (2):
      igt/tests: Add support for Tile4(TileF) format to kms_draw_crc
      tests/i915/i915_pipe_stress: Add plane pipes stress test

Steve Hampson (1):
      tests/i915/gem_ctx_isolation: Increase MAX_REG

Stylon Wang (9):
      tests/amdgpu: New ASSR test on DP/eDP links
      tests/amdgpu: Add suspend and DPMS subtests to ASSR test
      tests/amdgpu: Add tests that check for memory leaks
      tests/amdgpu: Add tests for Freesync capability reporting on HDMI & DP displays
      tests/amdgpu: Add tests for relaxed reporting of Freesync capability
      tests/amdgpu: Add tests for Freesync capability with suspend-resume
      test/amdgpu: Test max-bpc fallback for 4K modes on HDMI
      tests/kms_hdr: Fix failure to read output_bpc
      tests/amdgpu: Add P010 format to MPO tests and add test descriptions

Swati Sharma (39):
      tests/kms_cdclk : Add test to validate cdclk crawling
      tests/kms_cdclk: Drop basic subtest
      tests/kms_cdclk: Fix CDCLK failure condition
      tests/i915/kms_flip_scaled_crc: Rename downscaling tests
      tests/i915/kms_flip_scaled_crc: Add upscaling tests
      tests/kms_scaling_modes: New IGT to validate scaling modes
      tests/kms_plane_scaling: Removal of plane-scaling subtest
      tests/kms_plane_scaling: Cleanup
      tests/kms_plane_scaling: Minor changes with existing tests
      tests/kms_plane_scaling: Addition of 0.75 scaling factor downscaling tests
      tests/kms_plane_scaling: Upscaling on 2 planes
      tests/kms_plane_scaling: Downscaling on 2 planes
      tests/kms_plane_scaling: Upscaling and downscaling scenario
      tests/kms_plane_scaling: Add negative test to check num of scalers
      tests/kms_hdr: Test cleanup
      tests/kms_plane_scaling: Fix modifier
      tests/kms_plane_scaling: Fix modifier and format
      tests/kms_plane_scaling: Tests to validate modifiers
      tests/kms_plane_scaling: Fix indentation
      tests/kms_plane_scaling: Add tests as list
      lib/kms: Replace libdrm connector name with output
      tests/kms: Update tests with lib changes
      tests/i915/kms_dsc: IGT cleanup
      tests/i915/kms_cdclk: Add new subtest
      tests/i915/kms_dsc: Validate dsc with diff plane formats
      tests/kms_panel_fitting: Convert test to dynamic
      tests/i915/kms_flip_scaled_crc: Convert tests to dynamic
      tests/i915/kms_flip_scaled_crc: Add new tests covering modifiers and pixel-formats
      lib/igt_kms: Add scaling filter property
      tests/kms_flip_scaled_crc: Validate NN scaling filter
      tests/i915/kms_dsc: Skip test if DP res. < 5K
      tests/testdisplay: Skip modeset if no display is connected
      tests/testdisplay: Add test description and remove extra newlines
      tests/i915/i915_pm_dc: Add test description
      tests/i915/i915_pm_dc: Change debugfs for reading platform info
      lib/pm: Add helper functions to get runtime suspended time
      tests/i915/i915_pm_dc: Modify dc9 test
      tests/i915/i915_pm_dc: Sleep not reqd. to reset counter
      tests/i915/kms_dsc: Modify compressed bpp test

Tauro, Riana (2):
      tests/i915/i915_suspend: Add system-suspend-without-i915 subtest
      tests/intel-ci/fast-feedback: Add system-suspend-without-i915 subtest into fast-feedback list

Tejas Upadhyay (21):
      tests/i915/gem_bad_reloc: Check reloc support
      lib/i915: find scheduler caps for timeslicing
      i915/gem_exec_schedule: Check for timeslicing
      i915/gem_exec_fair: Extend icl ctx timestamp w/a to gen11
      lib/i915: Fix the check for scheduler caps for timeslicing
      tests/kms_prime: Use 256B aligned width
      tests/kms_plane_alpha_blend: Align width to 256B
      lib: sync ADL-S PCI ids with kernel
      tests/kms_setmode: Handle unsupported modes for invalid crtc test
      lib/i915: Use FIXED mapping only for discrete memory
      i915_drm.h sync
      tests/i915/gem_lmem_swapping: run only for discrete platform
      tests/i915/gem_exec_balancer: bonding support check in invalid-balancer
      lib: sync i915_pciids.h with kernel
      lib/rpl_s: Add Raptor Lake S platform definition
      lib: sync i915_pciids.h with kernel
      lib/adl_n: Add Alder Lake N platform definition
      i915/perf: Enable perf OA tests for RPLS
      i915/perf: Enable perf OA tests for ADL-N
      lib: sync i915_pciids.h with kernel
      lib/rpl_p: Add Raptor Lake P platform definition

Thomas Hellström (1):
      test/gem_exec_suspend: Enable the test for discrete GPUs

Thomas Zimmermann (2):
      tests/fbdev: Test for validity of video mode settings
      tests/fbdev: Add tests for display panning

Tianci.Yin (1):
      tests/kms_atomic_interruptible: fix a warning message on AMD GPU

Tomi Sarvela (1):
      scripts:code_cov_gather_on_test: use a faster script

Tvrtko Ursulin (16):
      gem_watchdog: Skip test if default request expiry is not compiled in
      i915/gem_engine_topology: Add compute class
      tests/api_intel_allocator: Fix build warning
      intel_gpu_top: Remove clients support
      intel_gpu_top: Add a sanity check discovered busy metric is per engine
      tests/i915/perf_pmu: Fix allow hang handling
      intel_gpu_top: Improve error message when insufficient privilege
      lib: Helper library for parsing i915 fdinfo output
      tests/i915/drm_fdinfo: Basic and functional tests for GPU busyness exported via fdinfo
      intel-gpu-top: Add support for per client stats
      intel_gpu_top: Don't show client header if no kernel support
      lib/igt_device_scan: Free filtered devices in igt_devices_free
      lib/drm_fdinfo: Ensure buffer is null terminated
      intel_gpu_top: Free all memory on exit
      intel-gpu-top: Optimise the scanning loop a bit
      tests/drm_fdinfo: Test virtual engines

Uma Shankar (2):
      tests/device_reset: Unload snd driver before i915 unbind
      tests/core_hotunplug: Unload snd driver before i915 unbind

Umesh Nerlige Ramappa (17):
      i915/perf: Enable perf OA tests for ADLP
      lib/igt_sysfs: Add helpers to iterate over GTs
      lib/igt_sysfs: Add RPS sysfs helpers
      lib/i915/perf-config: Bump up the soversion
      i915/perf: Check regularly if we are done reading reports
      i915/perf: Fix OA short_reads test
      i915/perf: Check return value from getparam
      i915/perf: Skip sseu-config tests for gfx12.50+
      i915/perf: Account for OA sampling interval in polling test
      i915/perf: Define OA report types and fix oa-formats test
      i915/perf: Use ARRAY_SIZE consistently for num_properties
      i915/perf: Use gt in perf tests and lib
      i915/perf: Explicitly state rendercopy needs for a test
      i915/perf: Skip tests that use rendercopy
      i915/perf: Add OA formats for DG2
      i915/perf: Fix CS timestamp vs OA timstamp mismatch
      i915/perf: Enable MTL OA tests

Vanshidhar Konda (2):
      i915/i915_fb_tiling: Check if device supports tiling
      tests/kms_addfb_basic: Skip tiling subtests on device without hw tiling

Victor Lu (6):
      tests/amdgpu: Add amdgpu module reload test
      tests/kms_plane_multiple: Start continuous CRC capture after commit
      tests/amdgpu: Introduce amd_hotplug tests
      tests/amdgpu: Introduced 4K MPO test
      tests/amdgpu: Switch mpo-swizzle-toggle to single-head
      tests/amdgpu: Add MPO scale and pan subtest single display option

Vidya Srinivas (15):
      tests/kms_color: Disable gamma in degamma tests
      tests/kms_color_chamelium: Disable gamma in degamma tests
      tests/kms_big_fb: Use igt_pipe_crc_get_current instead of igt_pipe_crc_collect_crc
      tests/drm_read: Fix subtest invalid-buffer
      tests/kms_plane_alpha_blend: Skip coverage-vs-premult-vs-none for 6bpc panels
      tests/kms_plane_alpha_blend: Fix a check in is_6bpc function
      Revert "tests/kms_plane_alpha_blend: Fix a check in is_6bpc function"
      Revert "tests/kms_plane_alpha_blend: Skip coverage-vs-premult-vs-none for 6bpc panels"
      Revert "tests/kms_plane_alpha_blend: Align width to 256B"
      tests/kms_plane_alpha_blend: Fix rounding in draw_squares
      tests/kms_cursor_legacy: Fix CRC mismatch for flip-vs-cursor-busy-crc-*
      lib/intel_bufops: Fix regression on 5.4 kernel
      tests/kms_concurrent: Fix regression in test_resolution_with_output
      tests/kms_psr2_sf: Skip tests if selected fetch is not available
      tests/kms_plane_multiple: Fix regression test_plane_position_with_output

Ville Syrjälä (126):
      tests/kms_async_flips: Fix flip timestamp checks
      tools/intel_watermark: Parse WM_DBG to help diagnose watermark issues
      tools/intel_watermark: Use WM_SR_CNT to observe SR residency
      tools/intel_watermark: Deal with TGL planes
      tools/intel_watermark: Reduce the number of planes for rkl/adls/adlp
      tools/intel_watermark: TGL+ can have 4 pipes
      tools/intel_watermark: Make reg dump section less wide
      tools/intel_watermark: Handle ADL-P dedicated SAGV watermarks
      tools/intel_watermark: Widen register bitfields
      tools/intel_display_poller: Fix TILEOFF vs. LINOFF for skl+
      tools/intel_display_poller: Unify ilk+ and bdw+ codepaths
      tools/intel_display_poller: Use intel_gen()
      tools/intel_display_poller: Add pipe D support
      tools/intel_display_poller: Add flipdone tests
      tests/gem_fenced_exec_thrash: s/EDEADLK/ENOBUFS/
      lib/kms: Add igt_rotation_90_or_270()
      tests/kms_big_fb: Use igt_rotation_90_or_270()
      tests/kms_plane_scaling: Use igt_rotation_90_or_270()
      tests/kms_rotation_crc: Use igt_rotation_90_or_270()
      tests/kms_color_chamelium: Remove invalid LUT size tests
      tests/kms_color: Refactor invalid LUT size tests
      tests/kms_color: Store r/g/b separately for LUT color tests
      tests/kms_color: Pass pipe to invalid LUT size tests
      tests/kms_color: Run each subtest only for a single connector
      lib/kms: Add igt_plane_has_rotation()
      tests/kms_rotation_crc: Use igt_plane_has_rotation()
      tests/kms_plane_scaling: Use igt_plane_has_rotation()
      tests/kms_big_fb: Use igt_plane_has_rotation()
      tests/kms_big_fb: Use igt_has_drm_cap()
      tests/kms_async_flips: Add CRC test to make sure the correct fb is being scanned out
      tests/kms_invalid_dotclock: Rename to kms_invalid_mode
      tests/kms_invalid_mode: Convert the max dotclock test into a subtest
      tests/kms_invalid_mode: Move bigjoiner handling into the proper place
      tests/kms_invalid_mode: Test various bogus timings
      tests/kms_invalid_mode: Test clock==(U)INT_MAX
      tests/kms_invalid_mode: Allow the test on !i915
      igt: s/DRM_FORMAT_MOD_NONE/DRM_FORMAT_MOD_LINEAR/
      igt: s/tiling/modifier/ all over
      tests/i915/i915_pm_dc: Nuke pointless snprintf()
      tools/intel_display_poller: Add async flip test mode
      lib: Add transcoder VRR registers
      lib: Add timestmap registers
      tools/intel_display_poller: Extract wait_scanline()
      tools/intel_display_poller: Add frame timestamp tests
      lib: Introduce igt_memdup()
      tests/i915/kms_frontbuffer_tracking: Get rid of the funny mode_copy
      lib/kms: Have igt_std_1024_mode_get() return a copy of the mode
      lib/kms: Have igt_std_1024_mode_get() return a mode with specific refresh
      lib/kms: Introduce igt_output_preferred_vrefresh()
      tests/i915/kms_frontbuffer_tracking: Use preferred modes's vrefresh
      tests/kms_concurrent: Use preferred modes's vrefresh
      lib/fb: Introduce igt_fb_modifier_name()
      tests/kms_plane: Use IGT_MODIFIER_{FMT,ARGS}
      tests/i915/kms_flip_tiling: Drop ancient stride change restriction
      tests/i915/kms_flip_tiling: Replace i915 interlace check with try_commit
      tests/i915/kms_flip_tiling: Generalize away copy-pasta
      tests/i915/kms_flip_tiling: Drop useless i915 include
      tests/i915/kms_flip_tiling: Stick pipe_crc into data_t
      tests/i915/kms_flip_tiling: Keep CRC running all the time
      tools/intel_display_poller: Rework some loops
      tools/intel_display_poller: Add VRR push support
      tools/intel_display_poller: Add vrr-push test
      tests/kms_big_fb: Move batch creation into lower level functions
      tests/kms_big_fb: Move format/modifier checks lower
      tests/kms_big_fb: Nuke the stride/format overrides
      tests/kms_big_fb: Check whether the rotation is supposed in the async flip test
      tests/kms_plane: Abstract single vs. multiple crsc better
      tests/kms_plane: Use single colors during extended test
      tests/kms_frontbuffer_tracking: Accept missing FBC debugfs files
      tests/kms_big_fb: Check plane capabilities properly in async flip tests
      tests/kms_async_flips: Fix the crc test vblank request
      tests/kms_async_flips: Make the crc test faster
      tools/intel_vbt_decode: update vbt defs from kernel
      tools/intel_vbt_decode: Decode more DVO ports
      tools/intel_vbt_decode: Decode mode HDMI data rates
      tools/intel_vbt_decode: Clean up SSC freq decoding
      tools/intel_vbt_decode: Decode DP max link rate
      tools/intel_vbt_decode: Unify panel type handling
      tools/intel_vbt_decode: Dump the block size
      tools/intel_vbt_decode: Decode the LFP power block
      tools/intel_vbt_decode: Dump the LVDS panel options
      tools/intel_vbt_decode: Decode new fast link training rate
      tools/intel_vbt_decode: Parse the old fast link training rate correctly
      tools/intel_vbt_decode: Parse the new eDP max link rate
      tools/intel_vbt_decode: Include BDB block header in hex dump
      tools/intel_vbt_decode: Make copies of the BDB blocks
      tools/intel_vbt_decode: Specify a minimum size for the BDB block copy
      tools/intel_vbt_decode: Convert LFP data pointers to be relative to the data block
      tools/intel_vbt_decode: Simplify LVDS data block parsing
      tools/intel_vbt_decode: Dump the panel PNP ID
      tools/intel_vbt_decode: Decode the end of the LFP data
      tools/intel_vbt_decode: Dump the LVDS data ptrs
      tools/intel_vbt_decode: Validate LVDS data table pointers
      tools/intel_vbt_decode: Generate LVDS data table pointes if not provided
      tools/intel_vbt_decode: Warn if we lack the full definiton of the BDB block
      tools/intel_vbt_decode: Simplify fast link training lane count
      tools/intel_vbt_decode: Extract dp_vswing()/dp_preemph()
      tools/intel_vbt_decode: Fix mipi sequence block size
      tools/intel_vbt_decode: Validate fp_timing terminator presence
      tools/intel_vbt_decode: Use hardcoded fp_timing size for generating LFP data pointers
      tools/intel_vbt_decode: update vbt defs from kernel
      tools/intel_vbt_decode: Introduce panel_bits()/panel_bool()
      tools/intel_vbt_decode: Remove pointless variables
      tools/intel_vbt_decode: Extract lvds_config[]
      tools/intel_vbt_decode: Extract panel_fitting[]
      tools/intel_vbt_decode: Parse HDMI FRL rate
      tools/intel_vbt_decode: Decode the "use VBT vswing tables" flag
      tools/intel_vbt_decode: Decode eDP/DP max lane count
      tools/intel_vbt_decode: Clean up driver features block decoding
      tools/intel_vbt_decode: Decode AUX CH
      tools/intel_vbt_decode: Adjust DVO port printing
      tools/intel_vbt_decode: Dump the compression structure index as decimal
      tools/intel_vbt_decode: Dump all panels from MIPI blocks
      tools/intel_vbt_decode: Print panel_type2
      tests/kms_frontbuffer_tracking: Check compression state on all gens
      tests/kms_frontbuffer_tracking: Convert DRRS over to per-crtc/connector debugfs files
      tools/intel_vbt_decode: update vbt defs from kernel
      tools/intel_vbt_decode: Decode the i2c speed
      tools/intel_vbt_decode: Resort block 2 decoding
      tools/intel_vbt_decode: Add version checks for a lot of child dev fields
      tools/intel_vbt_decode: Decode more child dev fields
      lib/crc: s/INTEL_PIPE_CRC_SOURCE_AUTO/IGT_PIPE_CRC_SOURCE_AUTO/
      tests/crc: s/"auto"/IGT_PIPE_CRC_SOURCE_AUTO/
      lib/crc: Move pipe CRC stuff out from igt_debugfs
      Revert "tests/kms_invalid_mode: Avoid usage of same pipe on multiple outputs"
      Revert "tests/kms_invalid_mode: Test Cleanup"

Vinay Belgaumkar (2):
      i915/guc: Disable i915_pm_rps when SLPC is enabled
      i915/i915_pm_rps: Actual freq can be 0 when idle or in RC6

Viswa Krishna Raveendra Talabattula (1):
      tests/i915: test pass for no caching case

Vitaly Prosyak (27):
      tests/amdgpu: refactoring and update amd_basic tests
      lib/amdgpu: increase number of resources
      lib/amdgpu: add bo allocation helper function
      tests/amdgpu: add memory eviction test
      lib/amdgpu: add simple buf management to emit commands
      lib/amdgpu: add ASIC gfx 8 registers
      lib/amdgpu: add shaders in binary form
      tests/amdgpu: add sync dependency test
      lib/amdgpu: improve operations to create commands and misc
      lib/amdgpu: added binary shaders with disassembled annotations
      lib/amdgpu: added dispatch helper functions
      lib/amdgpu: added dispatch tests for gfx and compute
      tests/amdgpu: add deadlock tests
      lib/amdgpu: add SPDX-License-Identifier: MIT
      lib/amdgpu: add predefined constants for PM4 and SDMA
      lib/amdgpu: add amdgpu_bo_alloc_and_map_raw helper
      lib/amdgpu: add deadlock helper
      tests/amdgpu: add GPU reset tests for gfx, compute and sdma.
      lib/amdgpu: add memory and reg. access helper function
      tests/amdgpu: add tests for invalid memory and register access
      tests/amdgpu: reuse predefined const GFX_COMPUTE_NOP
      tests/amdgpu: PCI unplug 4 tests for different scenario.
      lib/amdgpu: activate GFX9 test support
      lib/amdgpu: rename function parameter
      lib/amdgpu: small refactoring
      lib/amdgpu: add cp dma helper functions
      tests/amdgpu: add cp dma tests

Wayne Lin (4):
      lib/igt_amd: correct the link_settings bug
      test/amdgpu: Add ilr test
      tests/amdgpu/amd_link_settings: Ignore CRC checking
      tests/amdgpu/amd_link_settings: Change the flow when exit test

Zbigniew Kempczyński (158):
      tests/kms_psr2_sf: Remove bufmgr leftover
      benchmarks/gem_userptr_benchmark: Remove tests with unsynchronized flag
      lib/igt_dummyload: Add support of using allocator in igt spinner
      lib/intel_allocator: Add few helper functions for common use
      lib/igt_gt: Add passing ahnd as an argument to igt_hang
      lib/intel_batchbuffer: Ensure relocation code will be called
      lib/intel_batchbuffer: Add allocator support in blitter src copy
      lib/intel_batchbuffer: Try to avoid relocations in blitting
      lib/huc_copy: Extend huc copy prototype to pass allocator handle
      tests/gem_busy: Adopt to use allocator
      tests/gem_create: Adopt to use allocator
      tests/gem_ctx_engines: Adopt to use allocator
      tests/gem_ctx_exec: Adopt to use allocator
      tests/gem_ctx_freq: Adopt to use allocator
      tests/gem_ctx_isolation: Adopt to use allocator
      tests/gem_ctx_param: Adopt to use allocator
      tests/gem_eio: Adopt to use allocator
      tests/gem_exec_async: Adopt to use allocator
      tests/gem_exec_fair: Add softpin support
      tests/gem_exec_suspend: Adopt to use allocator
      tests/gem_exec_parallel: Adopt to use alloctor
      tests/gem_exec_whisper: Adopt to use allocator
      tests/gem_fenced_exec_thrash: Adopt to use allocator
      tests/gem_mmap_wc: Adopt to use allocator
      tests/gem_ringfill: Adopt to use allocator
      tests/gem_spin_batch: Adopt to use allocator
      tests/gem_tiled_fence_blits: Adopt to use allocator
      tests/gem_unfence_active_buffers: Adopt to use allocator
      tests/gem_unref_active_buffers: Adopt to use allocator
      tests/gem_userptr_blits: Adopt to use allocator
      tests/gem_wait: Adopt to use allocator
      tests/gem_watchdog: Adopt to use no-reloc
      tests/gem_workarounds: Adopt to use allocator
      tests/i915_hangman: Adopt to use allocator
      tests/i915_module_load: Adopt to use allocator
      tests/i915_pm_rc6_residency: Adopt to use allocator
      tests/i915_pm_rpm: Adopt to use no-reloc
      tests/i915_pm_rps: Alter to use no-reloc
      tests/kms_busy: Adopt to use allocator
      tests/kms_cursor_legacy: Adopt to use allocator
      tests/perf_pmu: Adopt to use allocator
      tests/sysfs_heartbeat_interval: Adopt to use allocator
      tests/sysfs_preempt_timeout: Adopt to use allocator
      tests/sysfs_timeslice_duration: Adopt to use allocator
      tests/gem_ctx_persistence: Adopt to use allocator
      tests/gem_exec_balancer: Adopt to use allocator
      tests/gem_exec_big: Skip relocation part
      tests/gem_exec_flush: Adopt to no-reloc
      tests/gem_exec_capture: Remove unnecessary multiprocess stop() call
      tests/gem_exec_big: Move check of pressumed offset out of no-reloc scope
      tests/gem_exec_fence: Adopt to use allocator
      tests/gem_exec_schedule: Adopt to use allocator
      tests/gem_ctx_shared: Adopt to use allocator
      tests/gem_exec_params: Fix context within which batch is executed
      lib/intel_batchbuffer: Remove duplicated assignment
      lib/intel_bufops: Rename intel_buf_bo_size() -> intel_buf_size()
      lib/intel_bufops: Store gem bo size
      lib/gem_submission: Add kernel exec object alignment capability
      lib/intel_batchbuffer: Detect and use kernel alignment capability
      tests/gem_exec_alignment: Add prerequisite alignment condition
      tests/gem_evict_alignment: Skip if kernel doesn't support obj alignment
      tests/i915_pm_rpm: Fix invalid alignment
      benchmarks/gem_exec_fault: Add timeout argument
      benchmarks/gem_exec_fault: Add softpin mode to support gens with ppgtt
      tests/gem_exec_await: Adopt to no-reloc mode
      tests/gem_sync: Use softpin path for no-reloc gens
      tests/intel-ci/fast-feedback: Add four subtests of gem_lmem_swapping to BAT
      tests/api_intel_bb: Use alignment only when kernel support it
      lib/i915/intel_memory_region: Provide system memory region stub
      lib/i915/intel_memory_region: Add fallback for creating gem bo
      lib/i915/intel_memory_region: Handle -ENODEV path individually
      lib/intel_memory_region: Add start offset and alignment detection
      tests/i915/gem_softpin: Add safe-alignment test
      tests/fast-feedback.testlist: Add gem_softpin@safe-alignment subtest
      tests/gem_exec_fence: Adopt to use no-reloc in three syncobj subtests
      i915/api_intel_bb: Correct size for munmap
      tests/api_intel_bb: Handle different alignments in delta-check
      lib/intel_device_info: Introduce i915_pciids_local.h and add DG2 definition
      lib/intel_chipset: Add flatccs flag for DG2
      lib/intel_allocator: Add safe alignment as a default
      tests/api_intel_allocator: Add default-alignment test
      lib/intel_memory_regions: Add helper which creates supported dma-buf set
      tests/prime_mmap: Iterate over dma-buf supported memory regions
      lib/intel_batchbuffer: Use safe alignment for intel-bb
      lib/i915/gem_create: Introduce gem-pool bo cache
      tests/api_intel_allocator: Verify gem-pool is working as expected
      lib/i915_blt: Add library for blitter
      tests/gem_ccs: Verify uncompressed and compressed blits
      tests/i915/gem_exec_suspend: Add 48b exec flag for execbuf
      tests/i915/gem_exec_parallel: Add 48b flag to execbuf
      tests/i915/gem_eio: Fix missing multiprocess allocator environment
      tests/i915/gem_ctx_isolation: Use allocator for registers write
      tests/i915/gem_exec_gttfill: Reenable test for discrete
      tests/i915/gem_softpin: Use valid context when iterating over engines
      tests/i915/gem_lmem_swapping: Add parallel-random-verify-ccs subtest
      tests/i915/gem_exec_schedule: Don't use default context
      tests/i915/gem_exec_schedule: Use separate context for spinner
      tests/i915/gem_softpin: Exercise single offset eviction on all engines
      lib/intel_memory_region: Use separate context for probing offset and alignment
      tests/kms_concurrent: For i915 devices run allocator in multiprocess mode
      lib/intel_batchbuffer: Use detected start offset in intel-bb instead 0x0
      lib/intel_allocator: Add flag signalling multiprocess readyness
      tests/i915/gem_exec_schedule: Run spinner in non-default context
      tests/i915/gem_exec_schedule: Execute spinner in valid context
      tests/i915/gem_exec_schedule: Add 48b address flag in store-dword
      lib/intel_reg: Add common MI_* macros to remove duplicates
      lib/igt_crc: Introduce common place for crc tables and functions
      lib/i915_crc: Introduce crc32 on gpu for DG2
      tests/api_intel_bb: Add crc32 checking test for DG2
      tests/i915/sysfs_heartbeat_interval: Avoid signal delivery race
      lib/igt_gt: Remove static vcs2 engine
      lib/igt_device_scan: Migrate pci assignment
      lib/igt_device_scan: Introduce codename for platform selection
      tools/lsgpu: Add codename switch (-c)
      lib/igt_device_scan: Align microseconds to six leading zeros
      lib/igt_device_scan: Add discrete/integrated pseudo-codenames
      tests/i915/perf_pmu: Add softpin flag for no-reloc path
      tests/i915/perf_pmu: Avoid unordered sampling with SEMA_WAIT
      lib/intel_batchbuffer: Ensure obj.alignment is zeroed for softpinning
      lib/drmtest: Don't log a warning when drm driver is not loaded
      lib/igt_device_scan: Assert if there's empty PCI_SLOT_NAME
      lib/igt_device_scan: Rescan pci properties if PCI_SLOT_NAME wasn't found
      lib/igt_device_scan: Retry when parent pci device lacks properties
      tests/prime_mmap: Use batch sizes appropriate for regions
      tests/gem_exec_basic: Don't use hardcoded batch size
      lib/intel_memory_region: Remove function which returns batch size in regions
      i915/gem_mmap_offset: Ignore ENOSPC error for making residency execbuf
      lib/i915_blt: Equalize pitch and aux-ccs for full resolve
      lib/i915_blt: Narrow setting same pitch and aux-ccs to Tile64 only
      tests/gem_lmem_swapping: Use feature macro instead checking platform
      lib/intel_allocator: Remove RANDOM allocator
      tests/api_intel_allocator: Remove duplicated reuse and reserve subtests
      lib/intel_allocator_reloc: Introduce stateful allocations in reloc
      tests/gem_ctx_shared: Remove necessity of passing offset to function call
      tests/gem_exec_parallel: Avoid acquiring offset for overlapping handle
      tests/gem_softpin: Add prime reopen eviction subtest
      tests/i915_pipe_stress: Remove unused bufmgr field
      tests/prime_udl: Remove intel-libdrm dependency
      tests/prime_nv: Remove intel-libdrm calls
      tests/drm_import_export: Remove the test
      benchmarks/intel_upload_blit_*: Remove libdrm in upload blits
      lib/intel_batchbuffer: Get rid of libdrm batchbuffer
      lib/intel_decode: Get drm decode code and adopt to use in igt
      tools/intel_dump|error_decode: Use local igt decode code
      lib/ioctl_wrappers: Remove gem_handle_to_libdrm_bo
      tools/meson: Move tools out of libdrm scope
      lib/meson: Remove libdrm configuration and intel_bufmgr stubs
      lib/i915_blt: Remove src == dst pitch restriction
      lib/i915_blt: Extract blit emit functions
      tests/gem_ccs: Add block-multicopy subtest
      tests/gem_*: Fix release offsets
      tests/gem_exec_whisper: Fix offsets handling and separate allocators
      tests/gem_ctx_shared: Release offset after use
      i915/gem_mmap_offset: Check mapping availability
      i915/gem_mmap_offset: Avoid FPE in calculating npages to clear
      lib/intel_allocator: Fix alignment variable used in debug path
      lib/igt_dummyload: Don't assume dependency object size
      tests/kms_cursor_legacy: Add dependency size for spinner creation

Łukasz Łaguna (1):
      lib/igt_device_scan: Add sriov selector

git tag: v1.27

https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-1.27.tar.xz
MD5:  80ca1099b65bbf5fce8f36ddde34edfc  igt-gpu-tools-1.27.tar.xz
SHA1: b3c561b67dc6207fdf44b486219411f6c5eae7f8  igt-gpu-tools-1.27.tar.xz
SHA256: 602bfe310d669f58e2f7fc8839532368492fd1317d564e06f8ce42049e3b61cb  igt-gpu-tools-1.27.tar.xz
SHA512: 43728c1981862f48180652849fbf04e36f976ae39a20f166fd5b4413ad3d682f7eea5db27c53d48d88d516577b053a6cc5afe000d1cad19ba65dedc248edf4a6  igt-gpu-tools-1.27.tar.xz
PGP:  https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-1.27.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEd1lluFZQGVrOd+GNc3AFXbdMJHUFAmPAJnwACgkQc3AFXbdM
JHX/FxAAm5jHj6aMoCp43Nmx39IUEA/l/LlpE6/YnDNMen1E/nS9OkU6UicxY32v
aZ6E1xPa16UkTKwtV9oull/t1IyBRQbpewAh/G/3E8QxpJucATz5dQ/xNJ+4Ggeb
qhM/Z2oEOqEFVJMK83D9N8I+vn+L/dY81CYTHmI1L6Wy58QnyRHZduhLtJiEUJln
CjwQkhrVTuRbPPsqkVpAZzeRViNLvIrcAPvyLYqS1JFEV5DMS+teKvDQt0MBxvPi
mdlu0RNFpnga6h12gnUBs++eerNf2t5C1qMYHWjQX0oHbNyoWajHSgExMVIU3tsD
jVML5WK2CSk3aPK5BWz34aRsb4q0bQ0Xt7xCoq4YoM6MbVtdokGHjTaIOChUe6mR
qszAeK8qJgzlfR/41P6rx7Y3g/90u5BFyAZoJamH/4G+xbeU5wHEGNIWaJOaKujB
CdlsIdlB5FRQSntdpY8rm54aHbppqvYIARmwHn0rD041JVebupTmO6SaSCMbtS4Z
arlTSo43ZK0bFxpAww9lMuMoG3ohIPN4+CdSNBBmNUxi6TvWQgbkKg41QPtNfQtv
S0sTlL3m0Ri5KMJCUajT6vApo7f0jtogkihNMBYkdn35RRvUjhHG4J8vSmv58bkU
mOG9eH2ySfhFtYbzVJTn0kZCA0d0SlLcikmJislRP99ETYbOlE0=
=G37q
-----END PGP SIGNATURE-----
