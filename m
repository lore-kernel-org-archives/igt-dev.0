Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE7A10E465
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 15:53:38 +0000 (UTC)
Date: Wed, 13 Sep 2023 17:53:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: xorg-announce@lists.x.org
Message-ID: <20230913155329.wwwhpurwvr2yiyki@kamilkon-DESK1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [ANNOUNCE] igt-gpu-tools 1.28
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

General changes:

- - New meson options testplan, sphinx and xe_driver. (Mauro Carvalho Chehab)

Library changes:

- - Add amdgpu GFX1036, GFX1037 chips. (Jesse Zhang)

- - Add xe_pciids.h with Lunar Lake (LNL) support. (Lucas De Marchi)

- - Use the new procps library libproc2. (Craig Small)

- - Add helper for srandom seed initialization. (Łukasz Łaguna)

- - Support for vmwgfx driver. (Maaz Mombasawala, Roye Eshed, Zack Rusin)

- - i915_pciids.h updated to include Pontevecchio (PVC) platform.
  (Niranjana Vishwanathapura)

- - Add OAM formats and support for media engines in perf tests.
  (Umesh Nerlige Ramappa)

- - Support for Xe driver. (Matthew Brost, Mauro Carvalho Chehab, Rodrigo Vivi,
  Jason Ekstrand, Francois Dugast, Philippe Lecluse, Zbigniew Kempczyński,
  Maarten Lankhorst, Juha-Pekka Heikkila, Bhanuprakash Modem et al)

Runner changes:

- - igt_runner can now dump GPU state on timeout. (Chris Wilson)

- - igt_runner will now use proper 'abort' as result instead of pseudoresult.
  (Petri Latvala)

Tools changes:

- - New vendor agnostic gputop tool. (Tvrtko Ursulin)

- - New tool to dump Intel GuC/HuC CSS header. (Lucas De Marchi)

- - Improve tools intel_watermark, intel_vbt_decode, intel_reg. (Ville Syrjälä)

Documentation changes:

- - New way for documenting tests will allow to generate documentation and
  testlists during build, see README.md and test_documentation.md. This
  is mandatory for Intel (both i915 and xe) and kms tests. (Mauro Carvalho
  Chehab)

Test changes:

- - Move intel specific tests to new directory. (Bhanuprakash Modem)

- - Ported and refactored drmlib security tests in amdgpu. (Vitaly Prosyak)

- - Switch DRM selftests to KUnit. (Isabella Basso, Dominik Karol Piątkowski,
  Mauro Carvalho Chehab)

- - Enabled MeteorLake aux ccs tests. (Juha-Pekka Heikkila)

- - Exercise oversized object detection for Xe. (Priyanka Dandamudi)

- - Enable validation for VDSC output formats. (Swati Sharma)

- - Add support for Bigjoiner / 8K mode. (Bhanuprakash Modem)

- - Use intel_cmds_info library. (Karolina Stolarek)

- - Use Intel kernel gpu command definitions. (Zbigniew Kempczyński)

- - Add a basic perf_pmu test. (Riana Tauro)

- - Add test for V3D's Wait BO IOCTL. (Maíra Canal)

- - Add i915_power test for power measurement. (Ashutosh Dixit)

- - Remove sysfs_clients. (Lucas De Marchi)


And many other bug fixes, improvements, cleanups and new tests.


Full changelog:

Abhinav Kumar (2):
      lib/igt_fb: add a helper to find drm_id from matching string
      tests/kms_writeback: allow writeback to output custom format

Adrián Larumbe (2):
      gputop: fix region array max iteration index loop bug
      lib/igt_drm_fdinfo: refactor region array population code

Alan Previn (1):
      tests/i915/pxp: test_pxp_stale_buf_optout_execution requires arb session

Albert Esteve (2):
      igt_kms: add hotspot plane property
      kms_cursor_legacy: modeset-atomic-cursor-hotspot

Alex Hung (1):
      tests/kms_universal_plane: Enable sanity_test_pipe for all devices

Andi Shyti (1):
      test/i915/gem_create: Skip the test if the PAT index is set on a non MTL device

Andrzej Hajda (4):
      i915/gem_ctx_persistence: skip heartbeat tests with GuC
      i915/gem_exec_balancer: skip noheartbeat test with GuC
      gem_exec_balancer: move no-GuC requirement to test functions
      i915/kms_busy: reduce heartbeat intervals only if neccessary

Ankit Nautiyal (2):
      tests/kms_lease: Set Aspect ratio client cap in case of legacy commit
      tests/i915/kms_dsc_helper: Fix helper to check dsc with output_format

Anna Karas (1):
      lib/drmtest: Add function drm_reopen_driver()

Anshuamn Gupta (1):
      lib/igt_pm: Remove pci_system_{init, cleanup}

Anshuman Gupta (5):
      perf_pmu: Dump i915_runtime_pm_status
      lib/igt_aux: Disable console suspend for suspend test
      lib/igt_aux: Enable PM Suspend dbg messages
      test/perf_pmu: Dump drpc on C6 failure
      test/xe_pm: Add vram_d3cold_threshold subtest

Arjun Melkaveri (2):
      tests/i915/gem_blits: Use new copy instruction
      tests/i915/gem_linear_blits: Enable XY_FAST_COPY_BLT copy instruction

Arthur Grillo (1):
      lib/igt_fb: Add check for intel device on use_enginecopy

Arun R Murthy (4):
      tests/kms_async_flips: Get rid of i915 specific fb creation
      tests/kms_async_flips: Run the test for all outputs
      tests/kms_async_flips: Split test_init()
      tests/kms_async_flips: Test all modifiers

Ashutosh Dixit (9):
      i915/i915_power: Sanity check power measurement
      i915/i915_power: Also show requested and actual freq's
      lib/igt_sysfs: Make i915_for_each_gt an alias for for_each_sysfs_gt_dirfd
      tests/i915/perf_pmu: Add some more debug
      lib/intel_ctx: Create intel_ctx with physical engines in a single gt
      i915/gem_engine_topology: Support gem_list_engines on platforms prior to MTL
      lib/igt_sysfs: Don't assert in igt_sysfs_dir_id_to_name
      tests/gem_ctx_freq: Disable SLPC efficient freq for the test
      drm-uapi/xe_drm: Sync from drm-xe-next

Aurabindo Pillai (8):
      lib/amdgpu: Add helper functions to return MALL support
      tests/amdgpu: Add test for MALL static screen cache scanout
      lib/amdgpu: Add check for ODM combine segments debugfs endpoint
      tests/amdgpu: Add test for ODM combine
      tests/amdgpu: Fix build error due to external file include
      tests/amdgpu/amd_mall: Add crc check
      tests/amdgpu/amd_mall: remove UMR dependency
      lib/amdgpu: checkpatch.pl fixes

Badal Nilawar (1):
      tests/xe: Verify actual frequency on the basis of GT state

Bhanuprakash Modem (271):
      tests/kms_pipe_crc_basic: Limit the execution to two pipes
      tests/i915/kms_draw_crc: Ignore RGB565 & XRGB2101010 formats on simulation
      tests/kms_atomic_transition: Reduce the execution time on simulation
      tests/kms_atomic_transition: Test cleanup
      tests/kms_cursor_edge_walk: Re-org dynamic subtests
      tests/kms_cursor_edge_walk: Limit the execution to two pipes
      tests/i915/kms_draw_crc: Create separate subtest for each draw method
      tests/kms_cursor_legacy: Fix CI tiemout issues
      Revert "tests/intel-ci: Rename kms_cursor_legacy subtests in BAT"
      tests/kms: Cleanup to use linear modifier
      tests/i915/kms_ccs: Cleanup to use linear modifier
      tests/kms: Add missing igt_put_cairo_ctx()
      lib/drmtest: Add helpers to check and require the XE driver
      i915: s/igt_require_intel/igt_require_i915
      lib/xe/xe_query: Add dev_id() interface
      lib/intel_chipset: Add support to XE driver to get devid
      lib/igt_kms: Cache xe_device info for kms tests
      lib/xe/xe_query: Fix the return type of xe_dev_id
      lib/igt_kms: Add a helper for valid pipe/output constraint
      lib/igt_kms: Bigjoiner check in max_bpc constraint
      tests/kms_async_flips: Add support for Bigjoiner
      tests/kms_atomic: Add support for Bigjoiner
      tests/kms_atomic_interruptible: Add support for Bigjoiner
      tests/kms_atomic_transition: Add support for Bigjoiner
      tests/kms_color_helper: Helper to check Bigjoiner constraint
      tests/kms_color: Add support for Bigjoiner
      tests/chamelium/kms_color_chamelium: Add support for Bigjoiner
      tests/kms_content_protection: Add support for Bigjoiner
      tests/kms_concurrent: Add support for Bigjoiner
      tests/kms_cursor_crc: Add support for Bigjoiner
      tests/kms_cursor_edge_walk: Add support for Bigjoiner
      tests/kms_cursor_legacy: Add support for Bigjoiner
      tests/kms_display_modes: Add support for Bigjoiner
      tests/kms_dp_tiled_display: Add support for Bigjoiner
      tests/kms_flip_event_leak: Add support for Bigjoiner
      tests/kms_invalid_mode: Add support for Bigjoiner
      tests/kms_lease: Add support for Bigjoiner
      tests/kms_pipe_crc_basic: Add support for Bigjoiner
      tests/kms_plane: Add support for Bigjoiner
      tests/kms_plane_alpha_blend: Add support for Bigjoiner
      tests/kms_plane_cursor: Add support for Bigjoiner
      tests/kms_plane_lowres: Add support for Bigjoiner
      tests/kms_plane_multiple: Add support for Bigjoiner
      tests/kms_plane_scaling: Add support for Bigjoiner
      tests/kms_prime: Add support for Bigjoiner
      tests/kms_properties: Add support for Bigjoiner
      tests/kms_rmfb: Add support for Bigjoiner
      tests/kms_rotation_crc: Add support for Bigjoiner
      tests/kms_scaling_modes: Add support for Bigjoiner
      tests/kms_sequence: Add support for Bigjoiner
      tests/kms_universal_plane: Add support for Bigjoiner
      tests/kms_vblank: Add support for Bigjoiner
      tests/kms_vrr: Add support for Bigjoiner
      tests/i915/kms_big_fb: Add support for Bigjoiner
      tests/i915/kms_big_joiner: Negative tests for Bigjoiner
      tests/i915/kms_busy: Add support for Bigjoiner
      tests/i915/kms_ccs: Add support for Bigjoiner
      tests/i915/kms_cdclk: Add support for Bigjoiner
      tests/i915/kms_draw_crc: Add support for Bigjoiner
      tests/i915/kms_fence_pin_leak: Add support for Bigjoiner
      tests/i915/kms_flip_scaled_crc: Add support for Bigjoiner
      tests/i915/kms_flip_tiling: Add support for Bigjoiner
      tests/i915/kms_frontbuffer_tracking: Add support for Bigjoiner
      tests/i915/kms_mmap_write_crc: Add support for Bigjoiner
      tests/i915/kms_psr2_sf: Add support for Bigjoiner
      tests/i915/kms_psr2_su: Add support for Bigjoiner
      tests/i915/kms_psr: Add support for Bigjoiner
      tests/i915/kms_psr_stress_test: Add support for Bigjoiner
      tests/i915/kms_pwrite_crc: Add support for Bigjoiner
      lib/xe/xe_ioctl: Add a helper to map the buffer
      lib/igt_fb: Add support for allocating buffers for XE
      tests/kms_addfb_basic: Code cleanup
      tests/kms_addfb_basic: Add XE support
      tests/kms_force_connector_basic: Set the param only if driver supports
      xe-fast-feedback: Add basic kms tests to XE BAT
      tests/kms_lease: Fix the usage of pipe for lessee
      lib/kms: Get pipe enum from debugfs
      tests/kms: s/i915_frequency_info/i915_cdclk_info/
      lib/igt_kms: Fix Bigjoiner checks
      tests/i915/kms_dsc: Update bigjoiner pipe constraint
      tests/kms_invalid_mode: Use helpers from IGT lib
      lib: Use i915 namespace for XE debugfs
      tests/kms_cursor_legacy: Add XE support
      tests/kms_flip: Add XE support
      tests/i915/kms_psr: Use linear modifier to create FB
      tests/i915/kms_psr*: Add XE support
      xe-fast-feedback: Add kms tests to XE BAT
      tests/kms_addfb_basic: Use proper macro for invalid tests
      tests/kms_force_connector_basic: Limit "force-load-detect" test to i915
      lib/igt_fb: Add copy engine support for XE
      lib/igt_draw: Add gpu draw routine support for XE
      tests/i915/kms_big_joiner: Add XE support
      tests/i915/kms_cdclk: Add XE support
      tests/i915/kms_draw_crc: Add XE support
      tests/i915/kms_dsc: Add XE support
      tests/i915/kms_flip_scaled_crc: Add XE support
      tests/i915/kms_flip_tiling: Add XE support
      tests/i915/kms_mmap_write_crc: Add XE support
      tests/kms_3d: Add XE support
      tests/kms_async_flips: No XE support
      tests/kms_atomic_transition: Add XE support
      tests/color: Add XE support
      tests/kms_concurrent: Add XE support
      tests/kms_content_protection: Add XE support
      tests/kms_cursor_crc: Add XE support
      tests/kms_flip_event_leak: Add XE support
      tests/kms_getfb: Add XE support
      tests/kms_hdmi_inject: Add XE support
      tests/kms_hdr: Add XE support
      tests/kms_panel_fitting: Add XE support
      tests/kms_plane: Add XE support
      tests/kms_plane_lowers: Add XE support
      tests/kms_plane_scaling: Add XE support
      tests/kms_rotation_crc: Add XE support
      tests/kms_setmode: Add XE support
      tests/kms_universal_plane: Add XE support
      scripts/test_list: Create dir if it doesn't exist
      tests/kms: Document kms subtests for XE BAT
      testplan: Add testplan support for kms tests
      tests/i915/kms_big_fb: Add XE support
      tests/intel-ci: Add display blocklist for XE
      tests/intel-ci/xe: Blocklist non-Xe tests
      lib/igt_fb: Stop using rendercopy for linear buffers on XE
      tests/kms_cursor_legacy: Add Spin support for XE
      tests/kms_cursor_legacy: Allow busy tests to run on XE
      lib: Interface to close the drm fd
      lib: Cache xe_device at driver open/close level
      lib/xe/xe_query: Add xe_config() interface
      lib/igt_msm: Use drm_close_driver() to close the drm fd
      tests/amdgpu: Close the fd before exit
      tests/i915: Close the fd before exit
      tests/kms: Close the fd before exit
      tests/nouveau_crc: Close the fd before exit
      tests/xe/xe_gpgpu_fill: Close the fd before exit
      tests/i915/kms_mmap_write_crc: Avoid closing the closed fd
      tests/i915/gem_close_race: Fix the double closure of fd
      tests: Use drm_close_driver() to close the drm fd
      tests/amdgpu: Use drm_close_driver() to close the drm fd
      tests/chamelium: Use drm_close_driver() to close the drm fd
      tests/panfrost: Use drm_close_driver() to close the drm fd
      tests/v3d: Use drm_close_driver() to close the drm fd
      tests/vc4: Use drm_close_driver() to close the drm fd
      tests/vmwgfx: Use drm_close_driver() to close the drm fd
      tests/kms: Use drm_close_driver() to close the drm fd
      tests/xe: Use drm_close_driver() to close the drm fd
      tests/i915: Use drm_close_driver() to close the drm fd
      tests/xe/xe_debugfs: Use xe_config() helper to get the config
      tests: Drop xe_device get/put from test level
      Revert "lib/igt_kms: Cache xe_device info for kms tests"
      tests/intel-ci/xe: Drop unsupported tests from BAT
      tests/i915/kms_psr: Fix to use proper API to support XE
      testplan/kms: Keep category as high level entity
      testplan/kms: Add support to differentiate b/w drivers
      testplan/kms: Include testdisplay to kms testplan config
      testplan/kms: Exclude kms helpers from testplan
      tests/chamelium/kms_chamelium_audio: Document each subtest for testplan
      tests/chamelium/kms_chamelium_color: Document each subtest for testplan
      tests/chamelium/kms_chamelium_edid: Document each subtest for testplan
      tests/chamelium/kms_chamelium_frames: Document each subtest for testplan
      tests/chamelium/kms_chamelium_hpd: Document each subtest for testplan
      tests/i915/kms_big_fb: Document each subtest for testplan
      tests/i915/kms_big_joiner: Document each subtest for testplan
      tests/i915/kms_busy: Document each subtest for testplan
      tests/i915/kms_ccs: Document each subtest for testplan
      tests/i915/kms_cdclk: Document each subtest for testplan
      tests/i915/kms_draw_crc: Document each subtest for testplan
      tests/i915/kms_dsc: Document each subtest for testplan
      tests/i915/kms_fb_coherency: Document each subtest for testplan
      tests/i915/kms_fbcon_fbt: Document each subtest for testplan
      tests/i915/kms_fence_pin_leak: Document each subtest for testplan
      tests/i915/kms_flip_scaled_crc: Document each subtest for testplan
      tests/i915/kms_flip_tiling: Document each subtest for testplan
      tests/i915/kms_frontbuffer_tracking: Document each subtest for testplan
      tests/i915/kms_legacy_colorkey: Document each subtest for testplan
      tests/i915/kms_mmap_write_crc: Document each subtest for testplan
      tests/i915/kms_pipe_b_c_ivb: Document each subtest for testplan
      tests/i915/kms_psr: Document each subtest for testplan
      tests/i915/kms_psr2_sf: Document each subtest for testplan
      tests/i915/kms_psr2_su: Document each subtest for testplan
      tests/i915/kms_psr_stress_test: Document each subtest for testplan
      tests/i915/kms_pwrite_crc: Document each subtest for testplan
      tests/kms_3d: Document each subtest for testplan
      tests/kms_addfb_basic: Document each subtest for testplan
      tests/kms_async_flips: Document each subtest for testplan
      tests/kms_atomic: Document each subtest for testplan
      tests/kms_atomic_interruptible: Document each subtest for testplan
      tests/kms_atomic_transition: Document each subtest for testplan
      tests/kms_bw: Document each subtest for testplan
      tests/kms_color: Document each subtest for testplan
      tests/kms_concurrent: Document each subtest for testplan
      tests/kms_content_protection: Document each subtest for testplan
      tests/kms_cursor_crc: Document each subtest for testplan
      tests/kms_cursor_edge_walk: Document each subtest for testplan
      tests/kms_cursor_legacy: Document each subtest for testplan
      tests/kms_display_modes: Document each subtest for testplan
      tests/kms_dither: Document each subtest for testplan
      tests/kms_dp_aux_dev: Document each subtest for testplan
      tests/kms_flip: Document each subtest for testplan
      tests/kms_flip_event_leak: Document each subtest for testplan
      tests/kms_force_connector_basic: Document each subtest for testplan
      tests/kms_getfb: Document each subtest for testplan
      tests/kms_hdmi_inject: Document each subtest for testplan
      tests/kms_hdr: Document each subtest for testplan
      tests/kms_invalid_mode: Document each subtest for testplan
      tests/kms_lease: Document each subtest for testplan
      tests/kms_multipipe_modeset: Document each subtest for testplan
      tests/kms_panel_fitting: Document each subtest for testplan
      tests/kms_pipe_crc_basic: Document each subtest for testplan
      tests/kms_plane: Document each subtest for testplan
      tests/kms_plane_alpha_blend: Document each subtest for testplan
      tests/kms_plane_cursor: Document each subtest for testplan
      tests/kms_plane_lowres: Document each subtest for testplan
      tests/kms_plane_multiple: Document each subtest for testplan
      tests/kms_plane_scaling: Document each subtest for testplan
      tests/kms_prime: Document each subtest for testplan
      tests/kms_prop_blob: Document each subtest for testplan
      tests/kms_properties: Document each subtest for testplan
      tests/kms_rmfb: Document each subtest for testplan
      tests/kms_rotation_crc: Document each subtest for testplan
      tests/kms_scaling_modes: Document each subtest for testplan
      tests/kms_selftest: Document each subtest for testplan
      tests/kms_sequence: Document each subtest for testplan
      tests/kms_setmode: Document each subtest for testplan
      tests/kms_sysfs_edid_timing: Document each subtest for testplan
      tests/kms_tiled_display: Document each subtest for testplan
      tests/kms_tv_load_detect: Document each subtest for testplan
      tests/kms_universal_plane: Document each subtest for testplan
      tests/kms_vblank: Document each subtest for testplan
      tests/kms_vrr: Document each subtest for testplan
      tests/kms_writeback: Document each subtest for testplan
      tests/testdisplay: Document each subtest for testplan
      testplan/kms: Make documentation is mandatory for all kms subtests
      lib: Add tiling support for XE
      tests/kms_cursor_edge_walk: Fix intel specific checks
      tests/kms_getfb: Extended ccs tests to support XE
      tests/kms_addfb_basic: Add tiling support for XE
      tests/kms_plane: Add tiling support for XE
      tests/kms_plane_lowres: Add tiling support for XE
      tests/kms_plane_scaling: Add tiling support for XE
      tests/kms_rotation_crc: Add tiling support for XE
      tests/i915/kms_big_fb: Add tiling support for XE
      tests/i915/kms_draw_crc: Add tiling support for XE
      tests/i915/kms_flip_scaled_crc: Add tiling support for XE
      tests/i915/kms_flip_tiling: Add tiling support for XE
      tests/intel-ci: Drop tiling tests from xe blocklist
      tests/intel-ci: Update Xe BAT & blocklist for kms FBT
      tests/intel-ci: Add tiling tests to XE BAT
      tests/kms_async_flips: Add XE support
      tests/i915/kms_big_fb: Fix testplan documentation
      scripts/test_list: Ignore uncompiled tests
      testplan/kms: Make documentation is mandatory for all kms subtests
      testplan/i915: Exclude non-i915 tests from i915 testplan
      testplan/kms: Move kms testplan to intel dir
      tests/i915/prime_mmap_kms: Add missing documentation
      tests/meson.build: Simplify builds for Chamelium targets
      tests: Move intel specific tests to new directory
      tests/meson.build: Split intel targets based on their nature
      lib/intel_chipset: Read device id from xe_device struct
      scripts/test_list: Add test_documentation ref to the logs
      lib/igt_gt: Fix igt_post_hang_ring for XE driver
      tests/kms_vblank: Allow hang tests to run on XE
      tests/kms_flip: Allow hang tests to run on XE
      tests/kms_flip: Fix testplan documentation for hang tests
      tests/intel-ci/xe.blocklist: Drop hang tests from xe blocklist
      tests/intel/pm: Rename i915_pm_backlight to kms_pm_backlight
      tests/intel/kms_pm_backlight: Fix testplan documentation
      tests/intel/pm: Rename i915_pm_dc to kms_pm_dc
      tests/intel/kms_pm_dc: Fix testplan documentation
      tests/intel/pm: Rename i915_pm_lpsp to kms_pm_lpsp
      tests/intel/kms_pm_lpsp: Fix testplan documentation
      tests/intel/kms: Drop Run type field

Bhawanpreet Lakha (2):
      amdgpu/amd_plane: Add multi MPO XRGB8888 test
      amdgpu_amd_plane: Add Multi MPO invalid test

Bommu Krishnaiah (1):
      tests/xe_exec_compute_mode: Increase fence timeout for simulation env

Chang, Bruce (1):
      tests/xe_vm: make sure test can finish within time

Chris Wilson (12):
      i915/gem_(linear, tiled)_blits: Randomise buffer contents
      i915/gem_ppgtt: Terminate batch for evict-vs-shrink*
      i915/gem_exec_params: Cross-check getparam against engine execution
      lib: Don't assert if fd path is unreachable
      runner: Dump GPU state on timeout
      lib: Cancel all outstanding requests at the start of a test
      igt_core: Show the end of each subtest in dmesg
      lib: Add kmsg for igt_abort
      i915/kms_busy: Free spinners after use
      i915/kms_mmap_write_crc: Free the mmap and dma-buf fd
      lib: Make igt_while_interruptible() thread-safe
      i915/gem_exec_await: Avoid DG2 conflicts

Christoph Manszewski (7):
      tests/xe: Set syncs pointer in drm_xe_exec correctly
      lib/intel_bb: Enable custom engine support for xe
      lib/i915/mocs: Move mocs library to 'lib' folder
      lib/[gpu_cmds|intel_bufops]: Enable surface state mocs setting.
      lib: Let gen7/gen8 inherit gen4_render.h
      lib: Apply x/y offsets to GPGPU fill
      lib: Apply rightmost execution mask to xehp gpu walker

Christopher Snowhill (1):
      intel_gpu_top: Add display name for compute engine class

Craig Small (1):
      Use the new procps library libproc2

Daniel Mrzyglod (1):
      tests/intel-ci: fix xe-fast-feedback.testlist

Dnyaneshwar Bhadane (1):
      tests/kms_cursor_crc: s/for_each_pipe/for_each_pipe_with_single_output/

Dominik Grzegorzek (3):
      lib/gpgpu_fill: Implement gpgpu_fillfunc for XEHP
      tests/xe_vm: Do not assert uninitalized variable
      lib/gpgpu_fill/xehpc: Adjust gpgpu_fillfunc for PVC

Dominik Karol Piatkowski (5):
      Change logic of ktap parser to run on a thread
      KUnit: Remove igt_kselftest fallback
      KUnit: Change subtest name from all-tests to module name
      KUnit: gracefully skip on missing KUnit or tested module, fail otherwise
      lib/igt_core.h: Typo fix

Fei Yang (3):
      test/gem_create: exercise gem_create_ext_set_pat
      test/gem_create: limit set_pat only to Meteor Lake
      test/i915/gem_create: skip set_pat for non MTL devices

Francois Dugast (1):
      xe: Rename engine to exec_queue

Garg, Nemesa (1):
      tests/kms_cursor_legacy: Reducing the IOCTL(drm_mode_cursor_ioctl) calls by reducing the timeout

Ghimiray, Himal Prasad (2):
      tests/xe_sysfs_tile: Update documentation fields
      tests/xe_uevent: Update documentation fields

Gustavo Sousa (2):
      tests/i915_query: Add igt_debug() calls for geometry-subslices
      tests/kms_async_flips: Use define for number of framebuffers

Hersen Wu (10):
      tests/amdgpu/amd_dp_dsc: fix basic and bpc test be skipped
      tests/amdgpu/amd_dp_dsc: fix test crash signal sigsegv
      lib/igt_amd: add delay waiting for hotplug complete
      tests/amdgpu/amd_hotplug: fix test crash signal sigsegv
      tests/amdgpu/amd_vrr_range: add vrr range check for display connected
      tests/amdgpu/amd_link_settings: use mode 640x480 for link configuration test
      tests/amdgpu/amd_vrr_range: fix test crash when n_pipes > n_outputs
      tests/amdgpu/amd_color: fix sub test crtc-lut-accuracy failure
      tests/amdgpu/amd_bypass: Skip test when DP Rx output bpc < 8 bpc
      tests/amdgpu/amd_psr: Fix eDP PSR1 test failure

Himal Prasad Ghimiray (7):
      lib/igt_sysfs: Add support to query number of tiles
      lib/igt_sysfs: Handling gt related sysfs uapi changes
      tests/xe/xe_guc_pc: Change the sysfs paths
      tests/xe/xe_sysfs_tile: adds new test to verify per tile vram addr_range
      tests/xe/xe_uevent: add new test for uevent gt reset failure
      tests/xe_sysfs_tile: Update documentation fields
      tests/xe_uevent: Update documentation fields

Imre Deak (3):
      Revert "lib/igt_kms: handle spurious HPDs - IGT part" v2
      tests/kms_dp_aux_dev: Factor out helper checking for sink detect errors
      tests/kms_dp_aux_dev: Treat ENXIO as a sink detect error

Isabella Basso (4):
      lib/igt_kmod: rename kselftest functions to ktest
      lib/igt_kmod.c: check if module is builtin before attempting to unload it
      lib/igt_kmod: add compatibility for KUnit
      tests: DRM selftests: switch to KUnit

Janga Rahul Kumar (16):
      tests/xe/xe_query.c: Update subtest query-engines
      tests/xe/xe_query: Add subtest query-invalid-extension
      tests/xe/xe_query: Add check for expected error
      intel-ci/xe-fast-feedback.testlist: Add eviction tests
      tests/xe/xe_evict: Update beng-large subtest
      lib/instdone: GEN12 and XEHP INSTDONE initialization
      intel-ci/xe-fast-feedback.testlist: Add multi threaded eviction tests
      tests/xe_exec_threads: Increase fence timeout for simulation env
      tests/intel-ci/xe: Unblock unbind rebind test
      intel-ci/xe-fast-feedback.testlist: Add core hotunplug test
      lib/xe/xe_spin: Add support to create non-preemptive spin batch
      tests/core_hotunplug: Improve test documentation
      lib/xe: Add support to reset all GT's
      lib/xe: Add hang library support
      lib/igt_gt: Extend hang library support to XE
      tests/xe_debugfs: skip page table level check for Xe2

Jani Nikula (2):
      lib/igt_pm: make igt_pm_dmc_loaded() more robust
      tools/intel_vbt_decode: fix division by zero child device size

Janusz Krzysztofik (7):
      tests: Exercise remote request vs barrier handling race
      tests/gem_barrier_race: Extend support over compute engines
      tests/i915_suspend: Refresh device list after *-without-i915 subtests
      tests/gem_reset_stats: Don't allow request watchdog to interfere
      tests/i915: Exercise coherency of mmapped frame buffers
      lib: Shut some excessive debug messages up
      tests/core_hotunplug: Wait for device nodes to re-appear

Jeevan B (4):
      lib/igt_draw: Use intel_get_uc_mocs to get MOCS value
      lib/igt_draw: Add MOCS values for MTL
      tests/kms_flip: Restrict the hang tests execution to single pipe combinations
      tests/kms_flip: Restrict multi-display hang tests execution

Jesse Zhang (2):
      lib/amdgpu: add GFX1036, GFX1037 chips for IGT tests
      lib/amdgpu: fix typo in function compare_pattern

Jessica Zhang (1):
      tests/kms_plane: Skip plane position test if primary ID > sprite ID

John Harrison (2):
      lib/intel_decode: Decode Gen12 ring/batch instructions correctly
      tools/intel_error_decode: Correctly name the GuC CT buffer

Jonathan Cavitt (1):
      lib/igt_kmod: Allow some leeway in igt_kmod_unload_r

Jouni Högander (15):
      tests/i915/kms_psr2_sf: Some cleanups after
      kms_psr2_sf: Add dynamic subtests which use DSC feature
      tests/i915/kms_psr2_sf: Fix cleanup
      tests/i915/kms_frontbuffer_tracking: Split fbc into library
      tests/i915/kms_frontbuffer_tracking: Split drrs into library
      lib/xe/xe_spin: Handle spinner timer for Xe as well
      tests/kms_dirtyfb: Add new test for dirtyfb ioctl
      Revert "tests/kms_dirtyfb: Add new test for dirtyfb ioctl"
      Revert "tests/i915/kms_frontbuffer_tracking: Split drrs into library"
      Revert "tests/i915/kms_frontbuffer_tracking: Split fbc into library"
      tests/i915: Take into account fbc_status "stolen memory not initialised"
      lib/i915/fbc: Add fbc helpers
      lib/i915/drrs: Add drrs helpers
      tests/i915/kms_frontbuffer_tracking: Utilize added fbc and drrs helpers
      tests/kms_dirtyfb: Add new test for dirtyfb ioctl

Juha-Pekka Heikkila (19):
      tests/kms_plane_scaling: add invalid parameter tests
      tests/kms_flip_event_leak: no need to clear black with black
      tests/kms_vblank: no need to clear black with black
      tests/kms_plane: add invalid pixel format tests
      tests/kms_plane_scaling: reduce work on framebuffer creation
      drm/fourcc: Import drm_fourcc header from commit c7c12de893f8 ("drm/fourcc: define Intel Meteorlake related ccs modifiers")
      lib/mtl: Add MTL related tile4 ccs modifiers handling
      tests/i915/kms_ccs: enable mtl aux ccs tests
      tests/kms_getfb: Add meteorlake related ccs modifiers
      tools/intel_gpu_top: fix segfault on discrete
      lib/veboxcopy: Add packed 64bpp 16b per channel yuv support
      tests/kms_cursor_crc: Fix special handling for Intel CHV
      tests/kms_plane: Add debug prints for pixel format tests if couldn't use custom plane size
      lib/intel_blt: Add offset to block and fast copy
      lib/igt_fb: include lib/intel_blt functions to blitter path
      lib/igt_fb: fix tiling and blitter to require intel instead of i915 device
      lib/igt_fb: On blitter path take clear color modifier into account
      Revert "testplan/kms: Make documentation is mandatory for all kms subtests"
      lib/igt_fb: take x-tile out from blitter path

Kamil Konieczny (14):
      lib/igt_fb: add missing include in header
      tests/prime_vgem: fix test listing problem
      i915/i915_suspend: run in subprocess to catch oom
      runner/resume: change exit code for results gen fail
      runner: check disk limit at dumping kmsg
      tests/i915_pm_freq_api: add missing include
      Revert "runner: check disk limit at dumping kmsg"
      meson: fix testplan building for old meson
      lib/igt_aux: unify procps processing
      intel-ci/xe-fast-feedback: fix xe_mmap tests order
      Update MAINTAINERS
      Update MAINTAINERS
      i915/gem_madvise: fix dontneed-*-mmap subtests
      Update NEWS, bump version to 1.28

Karolina Stolarek (28):
      lib/i915_blt: Rename blt_tiling to blt_tiling_type
      lib/i915_blt: Add T_YFMAJOR tiling type
      lib/i915_blt: Check for Tile-YF in fast_copy
      i915/lib: Add new library for blitter and tiling formats
      lib/intel_device_info: Update platform definitions with blitter information
      lib/i915_blt: Add helpers to check if command or tiling is supported
      lib/i915_blt: Add common functions for blt_copy_object
      tests/gem_exercise_blt: Add fast-copy test
      tests/gem_exercise_blt: Add fast-copy-emit test
      lib/intel_tiling_info: Rename blt_cmd_info to intel_cmds_info
      lib/i915: Rename intel_tiling_info library
      lib/intel_cmds_info: Add flags field to describe command properties
      lib/i915_blt: Add checks for command properties
      tests/gem_ccs: Check for extended block-copy and compression support
      tests/gem_ccs: Remove block-copy-inplace subtest
      tests/gem_exercise_blt: Don't allow hangs
      lib/i915_blt: Add helpers to check XY_SRC_COPY support
      lib/intel_cmds_info: Correct tiling formats for XY_SRC_COPY
      lib/intel_device_info: Add tiling information for early gens
      lib/intel_batchbuffer: Remove unused includes
      lib/intel_cmds_info: Reorder blt_tiling_type enum
      lib/intel_batchbuffer: Handle no support for Tile Y
      tests/gem_blits: Use intel_cmds_info library
      tests/i915/i915_pm_rpm: Check command property instead of gen
      lib/intel_batchbuffer: Remove unused argument in exec_blit
      lib/intel_batchbuffer: Inform about unsupported bpp
      tests/xe_ccs: Improve test documentation
      tests/xe_exercise_blt: Improve test documentation

Katarzyna Dec (7):
      tests/intel-ci: Add xe_mmap and xe_create tests to f-f
      tests/intel-ci: Add xe_waitfence@abstime test to f-f
      tests/intel-ci: Remove unnecessary tests from fast-feedback
      tests/intel-ci: Add detailed description to blocked tests
      tests/intel-ci: Reduce xe_exec_threads tests in BATs
      tests/intel: Add missing documentation fields for tests
      tests/xe: Clean up of test documentation

Kunal Joshi (16):
      tests/chamelium/kms_chamelium_edid: reset state before starting subtest
      tests/chamelium/kms_chamelium_hpd: issue disabling modeset for very plug/unplug cycle
      tests/i915/kms_frontbuffer_tracking: Add xe support
      tests/i915/kms_frontbuffer_tracking: all gem ioctls are not supported for xe as of now
      lib/ioctl_wrappers: GEM_SET_DOMAIN ioctl not supported on xe
      tests/i915/kms_frontbuffer_tracking: xe only supports MMAP_WC, BLT, RENDER
      tests/intel-ci/xe.blocklist: Add not present tests
      lib/igt_chamelium: reset chamelium before starting autodiscovery
      lib/igt_chamelium: Added is_mapped to track mapped ports
      lib/igt_chamelium: Added function to sort chamelium ports based on is_mapped
      tests/intel-ci: Added non-chamelium config blacklist
      tests/intel-ci: Added non-psr config blacklist
      tests/intel-ci: added blacklist to meson.build
      tests/intel-ci: move chamelium testlist inside igt
      lib/igt_fb: add intel_blt for blitter path on xe
      lib/igt_fb: on xe driver switch from rendercopy to blitcopy

Lucas De Marchi (8):
      Remove sysfs_clients
      tools: Add tool to dump GuC/HuC CSS header
      tools/intel-gfx-fw-info: Make it compatible with HuC via GSC
      tests/kms_hdr: Update dmesg error message
      tests/xe_create: Bump max time
      tests/xe_debugfs: Skip test for tile count
      lib: Add xe_pciids.h
      lib/intel_chipset: Add Lunar Lake support

Lukasz Laguna (3):
      lib/igt_aux: use proper directory for "pm_debug_messages" read
      lib/igt_sysfs: add asserting helpers for read/write operations
      lib/xe_query: add helper getting available VRAM

Maaz Mombasawala (7):
      lib/svga: Add generated headers for the svga device
      lib: Add vmwgfx support
      tests/vmwgfx: Add triangle test
      tests/vmwgfx: Add execution buffer test
      tests/vmwgfx: Add surface copy test
      tests/vmwgfx: Add mob stress test
      tests/vmwgfx: Add reference counting tests

Marcin Bernatowicz (1):
      lib/drmtest: Igt info msg on opened device

Matt Atwood (1):
      tests/xe/xe_huc_copy: check debugfs for huc running

Matt Roper (2):
      lib/igt_draw: Use intel_display_ver() for drawing with blits
      tests/xe: Boost command streamer prefetch size

Matthew Auld (9):
      tests/xe/debugfs: fix double-free in test_base
      lib/xe_query: fix vram_memory() and vram_if_possible()
      tests/xe/intel_bb: remove full-batch
      xe: sync small-bar uapi
      lib/xe: add visible vram helpers
      lib/xe: handle small-bar systems
      tests/xe: handle small-bar systems
      tests/xe/query: extend for CPU visible accounting
      tests/xe/mmap: sanity check small-bar

Matthew Brost (6):
      tests/xe: Add Xe IGT tests
      xe/xe_exec_basic: A sections to test NULL (sparse) bindings
      xe_vm: MMAP style VM binds section
      xe_vm: Add mmap / munmap sections that split large pages
      xe_vm: Unmap BOs in bind queue independent test
      xe_vm: add bind engine conflict section

Mauro Carvalho Chehab (146):
      scripts:igt-doc.py: add a parser to document tests inlined
      scripts/igt_doc.py: beautify its code
      scripts/igt_doc.py: add JSON file output
      scripts/igt_doc.py: dynamically create fields array from a JSON file
      scripts/igt_doc.py: add support to specify numeric values
      scripts/igt_doc.py: improve --show-subtests logic
      scripts/igt_doc.py: add error handler for subprocess
      scripts/igt_doc.py: improve multi-line logic
      scripts/igt_doc.py: don't use ":=" operator
      scripts/igt_doc.py: make it compatible with Python 3.6
      scripts/igt_doc.py: sets the minimal version to run the script
      scripts/igt_doc.py: use a different logic to get IGT prefix
      testplan/meson.build: add targets to build Xe test documentation
      xe/xe_test_config.json: cleanup the field struct
      xe/xe_huc_copy: add GPU dependency to its documentation
      xe/xe_*: add TEST/SUBTEST documentation
      xe-fast-feedback.testlist: update debugfs tests
      xe_mmap: skip VRAM tests if no VRAM is found
      meson: replace "igt@xe/" by "igt@"
      scripts/igt_doc.py: set have_implemented when --files is used
      xe/xe_test_config.json: cleanup the field struct
      xe/xe_huc_copy: add GPU dependency to its documentation
      xe/xe_*: add TEST/SUBTEST documentation
      xe_mmap: skip VRAM tests if no VRAM is found
      meson: replace "igt@xe/" by "igt@"
      intel-ci: update i915 blacklist to ignore the Xe driver
      lib/igt_kmod: add support for Xe driver
      xe/xe_module_load: add a test to load/unload Xe driver
      meson: build Xe test documentation
      testplan: build also a PDF file with the testplan
      meson.build: place gtk-doc dependencies check at the right place
      meson: get rid of a future-deprecated warning
      meson: get rid of tests/xe/meson.build
      testplan/meson.build: cleanup dependency chain
      testplan/meson.build: use join_paths()
      testplan/meson.build: re-indent file
      conf.py: add some backward-compatibility bits
      docs/testplan/conf.py: avoid using shutil include
      intel-ci/xe-fast-feedback.testlist: use xe_module_load@load
      xe/xe_huc_copy: use IS_TIGERLAKE macro
      xe_test_config.json: do some adjustments at the output hierarchy
      scripts/igt_doc.py: move show_subtests logic to the class
      scripts/igt_doc.py: add support to generate testlists
      scripts/igt_doc.py: prepare to place TestList class on a separate file
      scripts/test_list.py: prepare to place class on a separate file
      scripts/igt_doc.py: re-introduce it by calling test_list.py
      scripts/test_list.py: better handle documentation validation issues
      scripts/test_list.py: add support for igt_simple_main
      testplan/meson.build: Validate documentation at build time
      xe/xe_vm: add documentation for igt@xe_vm@userptr-invalid
      xe/xe_noexec_ping_pong: document subtest
      runner/meson.build: fix minimal build
      testplan/meson.build: only run igt_runner if it is compiled
      compute_square_kernel.cl: add CL file used at xe_compute.c
      xe/xe_compute: place OpenCL kernel on a separate file
      lib/xe/xe_compute: use registers defs from intel_gpu_commands.h
      gen_opencl_kernel: add script to dynamically create OpenCL kernels
      scripts/test_list.py: ignore normal documentation tags
      xe/xe_prime_self_import: remove *-vs-gem_close-race from BAT
      scripts/igt_doc.py: cleanup some pylint warnings
      scripts/igt_doc.py: don't depend on igt_runner anymore
      scripts/test_list.py: use a compiled regex for check
      i915/i915_hangman: use igt_describe_f()
      meson_options.txt: disable Sphinx by default
      scripts/test_list.py: make filtering logic more generic
      testplan/meson.build: don't generate testlist on cross-compilation
      scripts/test_list.py: don't mangle directory names
      meson: add an option to control Xe test builds
      scripts/test_list.py: expand testlist fields
      scripts/test_list.py: add support to exclude files
      scripts/test_list.py: fix some hints pointed by Ruff
      testplan/meson.build: add i915 support for a testplan document
      tests/i915: Improve test documentation
      gem_exec_fence: fix a typo
      tests: better document core_* tests used for i915 validation
      tests: better document the remaining core used by i915 validation
      i915/gem_exec_*: better document gem exec tests used for i915 validation
      i915/gem_ctx_*: better document i915 context tests
      i915/perf_*: better document tests
      i915/: better document the remaining i915 tests
      tests: add documentation for dynamic subtests
      scripts/test_list.py: add dynamic subtest support
      i915_test_config.json: exclude gem_concurrent_blit.c
      i915/perf_pmu: sync documentation with latest changes
      testplan/meson.build: make it check for missing i915 documentation
      scripts/test_list.py: add support to define a name at the config file
      kms_test_config.json: add a name for the KMS Intel testset
      i915_test_config.json: add a driver name
      xe_test_config.json: add a driver name
      scripts/test_list.py: add a method to return an spreadsheet-like array
      scripts/doc_to_xls.py: add an script to generate a doc spreadsheet
      tests/xe: add functionality to several tests
      kunit tests: add an optional name for the selftests
      tests/xe: Add a test that launches the xe driver live kunit tests
      lib/igt_kmod: fill skip message for KUnit skips
      intel-ci: add Xe live KUnit tests to BAT testlist
      xe-fast-feedback.testlist: better name Xe life KUnit tests
      scripts/xls_to_doc.py: add an script to partially import data from a spreadsheet
      tests/xe/xe_spin_batch: fix test documentation
      tests/xe/xe_module_load: fix a typo at the category
      tests/xe: remove an useless TODO message
      meson_options.txt: disable Xe driver tests by default
      scripts/test_list.py: add support for ordering testlists
      xe_test_config.json: add an order for run type
      tests/xe: add run type fields to order testlists
      scripts/test_list.py: produce alphabetically ordered testlists
      xe/xe_test_config.json: add core_hotunplug.c to Xe tests
      tests/i915/kms_fb_coherency: add mega-feature and functionality
      tests/meson.build: Simplify builds for core and i915 targets
      lib/igt_core: use the function when checking for list_subtests
      lib/igt_core: add an option to show the testlist
      tests/meson.build: create testlists at build time
      scripts/test_list.py: speedup testlist check logic
      scripts/test_list.py: optimize check regex
      scripts/test_list.py: fix __filter_subtest() logic
      xe_live_ktest: remove wa from the testlist
      xe_test_config.json: mark some fields are mandatory at subtest level
      scripts/test_list.py: add a check for missing features
      xe_live_ktest: remove xe_pci and xe_rtp tests from IGT testlist
      xe-fast-feedback.testlist: drop device-independent kunit tests
      xe_live_ktest: drop the now removed tests
      README.md and docs: describe how to document tests
      scripts/test_list.py: make the class more generic
      scripts/test_list.py: rename the internal summary value
      scripts/test_list.py: document what BAT stands for
      scripts/test_list.py: close config file before start processing
      scripts/test_list.py: filename arguments for print_ methods are optional
      scripts/test_list.py: add a check before deleting properties
      scripts/test_list.py: skip some internal fields
      scripts/test_list.py: add support to return a string instead of print
      scripts/test_list.py: don't rely on file name to parse config
      scripts/test_list.py: allow passing a config dict directly
      scripts/igt_doc.py: use field names when create a TestList instance
      tests/meson.build: only generate testlists on native builds
      test_list.py: add support for reading testlist regular expressions
      xe_test_config.json: add testlists and blocklists
      kms_test_config.json: add testlists and blocklists
      tests: Intel Xe: drop Run type field
      tests: Intel KMS: drop Run type field
      scripts/test_list.py: move "FULL" testlist to config file
      scripts/test_list.py: don't be greedy while matching data from testlists
      scripts/test_list.py: fix gen_testlist logic
      scripts/test_list.py: add support for expanding fields on spreadsheet
      scripts/doc_to_xls.py: expand GPU excluded platform
      scripts/doc_to_xls.py: improve XLS output format
      scripts/test_list.py: check key before expanding fields

Maíra Canal (25):
      lib/igt_vc4: Rework igt_vc4_get_param()
      tests/vc4_perfmon: Make sure vc4 supports perfmon
      lib/igt_v3d: Rework igt_v3d_get_param()
      tests/v3d_perfmon: Make sure v3d supports perfmon
      tests/vkms: Create a testlist to the vkms DRM driver
      lib/v3d: Add V3D packet helpers
      lib/v3d: Add V3D packet description
      lib/v3d: Introduce the struct v3d_cl_job
      lib/v3d: Add a helper to create a noop job
      tests/v3d_wait_bo: Create test for V3D's Wait BO IOCTL
      tests/v3d_submit_cl: Create test for V3D's Submit CL IOCTL
      lib/v3d: Add a helper to create a empty shader
      tests/v3d_submit_csd: Create test for V3D's Submit CSD IOCTL
      tests/v3d_job_submission: Create tests to mix CL and CSD jobs
      lib/igt_vgem: Use UAPI header
      tests/vgem_basic: Add negative tests
      tests/vc4_purgeable_bo: Fix conditional assertion
      tests/vkms: Add tests that changed its testing structure
      tests/vkms: Add tests that perform operations on the primary plane
      tests/vkms: Remove tests that are skipping
      tests/kms_plane_scaling: negative tests can return -EINVAL or -ERANGE
      tests/kms_plane_scaling: fix variable misspelling
      tests/kms_plane_scaling: remove unused parameters
      tests/kms_flip: Check if is Intel device before doing all the setup
      tests/kms_plane_scaling: Only set rotation if rotation != rotate-0

Melissa Wen (2):
      tests/amdgpu/amd_color: check supported color prop before running tests
      tests/kms_atomic: remove zpos < N-planes assert

Mohammed Thasleem (9):
      tests/i915/i915_pm_dc: Fixed dc6-dpms test description
      lib/igt_kms: Fixed the usage of dereferencing of null pointer
      tests/kms_lease: close mcl.fd when drmModeSetCrtc fails
      tests/i915/i915_pm_dc : Check DC5 state with external active panel
      tests/i915/i915_pm_dc: Add DC6 DPMS test for mtl
      tests/i915/i915_pm_dc: Add DC6 PSR test for mtl
      tests/kms_display_modes: Add negative test for extended display
      lib/igt_kms: Check for other modes to fit on bw when ENOSPC failure
      tests/i915/i915_pm_dc: Fix dc9-dpms test on MTL

Nidhi Gupta (4):
      tests/kms_plane_alpha_blend: Limit the test execution
      tests/kms_cursor_crc: Reduce the execution time on simulation
      tests/intel-ci: update blacklist
      tests/kms_plane_cursor: Handle invalid pipe in big joiner

Niranjana Vishwanathapura (6):
      tests/xe/xe_debugfs: Get gt subtest passing
      lib/xe/xe_query: Extern xe_supports_faults()
      xe/xe_vm: Create BO in proper tile
      lib: Add Pontevecchio platform
      tests/xe/xe_guc_pc: Skip RC6 tests for PVC
      tests/xe/xe_vm: Initialize variable in test_bind_array()

Nirmoy Das (4):
      lib/i915/intel_memory_region: Add gem_has_smallbar
      test/i915/gem_eio: Skip suspend test on smallbar machine
      test/prime_vgem: Remove test_userptr test
      intel-ci: Remove prime_vgem userptr test

Pallavi Mishra (2):
      tests/i915: Increase timeout for GuC submission
      i915/sysfs_timeslice_duration: skip off subtest for GuC submission

Petri Latvala (10):
      lib/igt_debugfs: Fixup docs
      runner: Don't override more results than requested
      runner: Refactor abort-checking to a helper function
      runner: Use 'abort' as result if a test caused an abort
      MAINTAINERS: Change Petri's email address
      gitlab-ci: Remove senseless runner restriction
      scripts/verify-blacklist: Handle multiple given blacklists
      lib/igt_dummyload: Fall back to no scheduling policy if SCHED_FIFO unavailable
      gem_exec_capture: Don't dump the whole error state
      igt_core: Avoid exit_subtest in subthread

Priyanka Dandamudi (16):
      tests/xe/xe_create: Exercise oversized object detection
      intel-ci/xe-fast-feedback.testlist: Add pagefault tests
      xe/xe_mmap: Negative test for mmap flags
      xe/xe_mmap: Negative test to extensions
      xe/xe_mmap: Negative test to object
      lib/igt_sysfs: Add support to iterate over engines
      xe/xe_sysfs_defaults: Verify .defaults in engines directory
      xe/xe_sysfs_scheduler: Verify scheduler control interface
      xe/xe_mmap: Optimise code to use xe_bo_mmap
      tests/intel-ci: Block list xe_sysfs tests
      xe/xe_create: Modify massive test
      xe/xe_sysfs: Updated tests to use xe_sysfs_gt_open
      xe/xe_sysfs_scheduler: Try to set sysfs scheduler with default min
      xe/xe_sysfs: Removing non privileged user test
      tests/intel-ci: Remove xe_sysfs from blacklist
      xe-fast-feedback.testlist: Add sysfs tests to BAT

Riana Tauro (18):
      tests/i915/perf_pmu: Add a basic perf_pmu test
      i915/i915_power: skip power sanity test on simulation
      lib/i915/gem_engine_topology: list engines specific to gt
      perf_pmu: Use correct pmu config for multi-tile
      xe-fast-feedback.testlist: Remove rc6 tests from BAT
      tests/xe/xe_guc_pc: Remove rc6 tests
      xe-fast-feedback.testlist: Remove gt-c6-on-idle from BAT
      tests/xe: Add basic idle residency test
      tests/xe: Validate GT is in C6 on idle
      xe-fast-feedback.testlist: Add gt-c6-on-idle to BAT
      lib/igt_device: Add a function to get the pci slot name
      lib/igt_pm: change d3cold_allowed function parameters
      tests/xe: use igt_pm library functions
      tests/xe: Add a test that validates residency during s2idle
      lib/igt_power: Modify igt_power library for xe
      tests/xe: Add a test to toggle GT C states and validate power
      tests/xe: Add GT id to C6 assertions
      tests/xe: Add GT id to identify failures

Rob Clark (7):
      tests/kms_color: Gamma tests should require hw support
      lib: Add helper to wait and close fence fd
      tests/msm: Add GEM shrinker/eviction test
      tests/msm: Read the devcore back in recovery tests
      tests/kms_plane: Handle hw without legacy gamma support
      tests/kms_plane: Skip QCOM_COMPRESSED
      tests/msm: Add submitoverhead benchmark

Rodrigo Vivi (3):
      lib/igt_pm: Add a helper to query the runtime_usage.
      xe: Removal of XE_QUERY_CONFIG_FLAGS_USE_GUC and guc_enable
      drm-uapi/xe_drm: Remove max_page_size and align with latest uapi

Sai Gowtham Ch (6):
      lib/xe/xe_spin: Integrate igt_spin_new with Xe
      tests/xe/xe_spin_batch: Add new test to exercise igt_spin_new for xe
      intel-ci/xe-fast-feedback.testlist: Add xe_spin_batch test
      tests/xe/xe_exec_store: Add xe_exec_store test to check store dword functionality
      intel-ci/xe-fast-feedback.testlist: Add xe_exec_store@basic-store subtest in fastfeedback
      tests/xe/xe_exec_store: Fix the num of placements check to run test on

Sinjan Kumar (1):
      lib/intel_batchbuffer: Skip media-fill test for Graphics version 12.50 and above

Stylon Wang (1):
      test/amdgpu/amd_color: Add test description to amd_color tests

Swati Sharma (66):
      lib/dsc: Move VDSC functions to separate lib file
      Move wrapper functions from kms_dsc to kms_dsc_helper
      tests/i915/kms_dsc: Add disp_ver as struct data_t member
      tests/i915/kms_dsc_helper: Improve format string
      Revert VDSC lib changes
      lib/dsc: Move VDSC functions to separate lib file
      Move wrapper functions from kms_dsc to kms_dsc_helper
      tests/i915/kms_dsc: Add disp_ver as struct data_t member
      tests/i915/kms_dsc_helper: Improve format string
      lib/dsc: Fix return value
      tests/i915/kms_dsc: Add plane_format as struct data_t member
      tests/i915/kms_dsc: Remove pointless struct
      tests/i915/kms_dsc: Make bpc_list static
      tests/i915/kms_dsc: Rename subtest
      tests/kms_plane_scaling: Add downscaling+upscaling tests
      tests/kms_hdr: Add negative test for invalid metadata sizes
      tests/kms_hdr: Add negative test to enforce HDR on non-HDR panel
      tests/kms_plane_scaling: Prep work
      tests/kms_plane_scaling: Minor fixes
      tests/kms_plane_scaling: Add test to validate max source size
      tests/kms_plane_scaling: Reorg max-source-size subtest
      tests/kms_plane_scaling: Fix out-of-bound array access
      tests/kms_plane_scaling: Fix copy-paste error
      tests/kms_plane_scaling: SKIP subtest if num_planes < 2
      lib/dsc: Add helpers for VDSC output format debugfs entry
      tests/i915/kms_dsc: Enable validation for VDSC output formats
      tests/kms_plane: enable test for sim env
      tests/kms_cursor_crc: limit test to one pipe for sim
      tests/tests/kms_cursor_crc: remove extra \n
      tests/kms_display_modes: reduce exec. time for sim env
      tests/kms_rotation_crc: enable and optimize test for sim
      tests/i915/kms_dsc: add limited flag
      tests/kms_plane_scaling: make test name uniform
      i915/kms_fbcon_fbt: remove hard-coded PIPE_A while computing CRC
      lib/igt_fb: round rgb->yuv conversion results
      tests/kms_pipe_crc_basic: add nv12 crc sanity check
      intel-ci: update fastfeedback testlist
      lib: fix typo in clamp16()
      tests: s/igt_is_dsc_supported/igt_is_dsc_supported_by_sink
      tests: s/check_dsc_on_connector/is_dsc_supported_by_sink
      tests: add igt_is_dsc_supported_by_source()
      Revert "tests/intel-ci/xe.blocklist: Add not present tests"
      tests/intel-ci: blocklist hang and tiling tests
      tests/i915/kms_dsc: add new test flag
      tests/i915/kms_dsc: use uint32_t test flag
      tests/i915/kms_dsc: use #define for default bpc
      tests/i915/kms_dsc: update if conditions
      tests/i915/kms_dsc: use igt_get_pipe_current_bpc()
      tests/i915/kms_dsc: add test validating output formats with input bpc
      tests/i915/kms_dsc: add test summary
      tests/intel-ci: chamelium specific fast-feedback
      tests/i915/kms_dsc_helper: s/by_platform/by_source
      tests/i915/kms_dsc: loop from min to max bpc
      lib/igt_kms: add helper to check if output is mst
      lib/igt_kms: add helper for dp-mst connector id
      tests/kms: use dp-mst helpers
      tests/kms_color: skip deep-color test for mst
      tests/xe/xe_module_load: load snd_hda_intel module
      tests/intel-ci: add files to meson.build
      tests/intel-ci: add basic audio test to ffb
      tests/intel-ci: drop suspend test
      tests/intel-ci: add 4-tile test
      tests: rename feature_discovery to kms_feature_discovery
      tests/kms_feature_discovery: add testplan documentation
      tests/intel-ci: remove feature_discovery from blocklist
      tests/kms_feature_discovery: detect mst configuration

Thomas Hellström (5):
      tests/xe/xe_vm: Add a userptr-invalid test
      text/xe/xe_exec_basic: Wait for the correct vm_bind before exec
      tests/xe/xe_vm: Add a userptr-invalid test
      text/xe/xe_exec_basic: Wait for the correct vm_bind before exec
      tests/xe/xe_noexec_ping_pong: Add a test to expose unnecessary rebinds

Tom Chung (8):
      tests/amdgpu/amd_freesync_video_mode: Adjust indents and spacing
      tests/amdgpu/amd_freesync_video_mode: Fix memory leak and corruption
      tests/amdgpu/amd_freesync_video_mode: Fix wrong resolution setting during the test
      tests/amdgpu/amd_freesync_video_mode: Add some code from kms_vrr to resolve tearing issue
      tests/amdgpu/amd_freesync_video_mode: Add/remove some test progress messages
      tests/amdgpu/amd_freesync_video_mode: Move the vrr setting and display reset
      tests/amdgpu/amd_freesync_video_mode: Fix wrong resolution setting for some panel
      tests/amdgpu/amd_freesync_video_mode: Add amd_freesync_video_mode to meson.build

Tvrtko Ursulin (34):
      intel_gpu_top: Fix cleanup on old kernels / unsupported GPU
      intel_gpu_top: Fix man page formatting
      intel_gpu_top: Automatically enclose JSON output into brackets
      intel_gpu_top: Add command line switch to start in physical engine mode
      intel_gpu_top: Aggregate engine classes in all output modes
      lib/igt_device_scan: Improve Intel discrete GPU selection
      intel_gpu_top: Do not repeat header lines in non-interactive output
      intel_gpu_top: Rename STDOUT to TEXT
      intel_gpu_top: Add CSV output format
      intel_gpu_top: Use actual period when calculating client busyness
      intel_gpu_top: Display large pids nicely in interactive mode
      intel_gpu_top: Use full console width for global metrics
      intel_gpu_top: Show non-normalized client usage in numeric mode
      lib: Extract igt_drm_clients from intel_gpu_top
      lib: Allow specifying custom engine map
      lib/igt_drm_clients: Record client drm minor
      lib/igt_drm_clients: Support multiple DRM cards
      lib/igt_drm_fdinfo: Track largest engine index
      lib/igt_drm_clients: Decouple hardcoded engine assumptions
      lib/igt_drm_clients: Enforce client status sort order in the library
      gputop: Basic vendor agnostic GPU top tool
      perf_pmu: Support multi-tile in rc6 subtest
      perf_pmu: Two new rc6 subtests
      perf_pmu: Support multi-tile in frequency subtest
      gputop: Move client name last
      intel_gpu_top: Move client name last
      intel_gpu_top: Fix frequency and rc6 counters
      lib/igt_dummyload: Extract sync spinner API
      tests/i915_pm_rps: Exercise sysfs thresholds
      tests/i915_pm_rps: Fix test after silent conflict
      tests/i915_pm_rps: Fix test after silent conflict harder
      lib/igt_drm_fdinfo: Parse memory usage
      lib/igt_drm_clients: Store memory info in the client
      gputop: Add memory information

Umesh Nerlige Ramappa (43):
      i915/perf: Add support for 64-bit OA formats
      i915/perf: Define a default engine for OA
      i915/perf: Use default engine for sseu tests
      i915/perf: Ensure rcs0 is present for gen12-mi-rpc
      i915/perf: Use ARRAY_SIZE for buffer-fill test
      i915/perf: Add class:instance support to OA tests
      i915/perf: Enable tests to run on specific engines
      i915/perf: Treat ticks as 64 bit
      i915/perf: Treat timestamp as 64 bit value
      i915/perf: Add OAM format type
      i915/perf: Move OA format array from stack to heap
      i915/perf: Use a helper for OA format
      i915/perf: Add support for oa perf groups
      i915/perf: Test concurrent access to OA in different groups
      i915/perf: Add OAM support
      lib/i915/perf: Prepare to read different OA formats
      lib/i915/perf: Choose OAM format for media metrics
      lib/i915/perf: Set missing metric unit for some counters
      lib/i915/perf: Add MTL to supported HW in OA guid registry
      lib/i915/perf: Add support for OAM format in codegen
      lib/i915/perf: Update MTL GT2 metrics
      lib/i915/perf: Update MTL GT3 metrics
      i915/perf: Add support for engine specific metrics
      i915/perf: Run non-zero-reason on media engines as well
      i915/perf: Make sanity check failures descriptive
      lib/i915/perf: Enable multi-tile support for perf library
      lib/i915/perf: Update MTL OA timestamp and EU thread config
      lib/i915/perf: Add support for select MPEC formats
      lib/i915/perf: Adjust the GPU timestamp for new OA formats
      lib/i915/perf: Apply shift to raw timestamp as well
      lib/drm_fdinfo: Check for compute engines when parsing
      tests/drm_fdinfo: Drop active busyness tests for GuC backend
      perf_pmu: Quiesce GPU if measuring idle busyness without spinner
      intel_gpu_top: Add an array of freq and rc6 counters
      intel_gpu_top: Determine number of tiles
      intel_gpu_top: Capture freq and rc6 counters from each gt
      intel_gpu_top: Switch pmu_counter to use aggregated values
      intel_gpu_top: Add definitions for gt-specific items and groups
      intel_gpu_top: Bump up size of groups to accomodate multi-gt
      intel_gpu_top: Increase visibility for class_view
      intel_gpu_top: Show gt specific values if requested
      intel_gpu_top: Reduce one level of indent
      intel_gpu_top: Add gt specific values to header in interactive mode

Vikas Srivastava (9):
      tests/i915/gem_userptr_blits: Use softpinning support for MTL
      tests/i915/gem_render_copy: Skip the Y-tile test for MTL
      lib/intel_batchbuffer: Add wrapper API to use XY_FAST_COPY_BLT/XY_SRC_BLT
      tests/i915: skip gem_set_caching call for mtl
      tests/i915/gem_caching: Enable XY_FAST_COPY_BLT for MTL
      lib/intel_batchbuffer: Enable XY_FAST_COPY_BLT support for api_intel_bb
      tests/i915/gem_userptr_blits: Enable XY_FAST_COPY_BLT command for gen12+
      lib/intel_cmds_info: Add library support for XY_COLOR_BLT
      tests/i915/i915_pm_rpm: Modify gem-execbuf test for gen12+

Ville Syrjälä (37):
      tools/intel_reg: Simplify negative ports
      tools/intel_reg: Support 8 and 16 bit mmio registers
      tools/intel_reg: Add support for register access via the MCHBAR mirror
      tools/intel_reg: Add support for reading indexed VGA registers
      tools/intel_watermark: Add missing intel_register_access_fini() for skl+
      tools/intel_watermark: Don't do intel_register_access_fini() too early on hsw/bdw
      tools/intel_watermark: Add missing newline
      tools/intel_watermark: Read LP usage from FPGA_DBG on ivb
      tools/intel_watermark: Extract is_cursor()
      tools/intel_watermark: Decode plane enable bits for ilk-bdw
      tools/intel_watermark: Dump all ARB_CTL registers on skl+
      tools/intel_watermark: Use intel_display_ver()
      tools/intel_watermark: Introduce skl_has_nv12_buf_cfg()
      tools/intel_watermark: Decode SAGV WM usage correctly on ADL+
      tests/kms_async_flips: Add missing igt_put_cairo_ctx()
      tests/kms_async_flips: Render the bars full height
      tools/intel_vbt_decode: Dump mode backlight data
      tests/kms_psr: Try all modes on the connector
      lib/i915/perf: Stop generating silly C code
      lib/i915/perf: Stop making copies of the registers
      lib/i915/perf: Convert the metric counters to an array as well
      tests/kms_color: Use legacy LUT for chopping off the lsbs
      tests/kms_color: Use named initializers
      tests/kms_color: Make loads of stuff static const
      tests/kms_color: Pass down the colors used to paint the fb
      tests/kms_color: Get rid of hand coded "expected_colors"
      tests/kms_color: Add an additional "signed" subtest
      tests/kms_color: Dump the CTM before/after color values
      tests/kms_color: Move dynamic subtests up one level
      tests/kms_tiled_display: Get rid of DP stuff
      tests/kms_tiled_display: Make basic_test() static
      tests/kms_tiled_display: Cleanup the chamelium ifdefs
      tests/kms_tiled_display: Replace the igt_display pointer with a struct
      tests/kms_tiled_display: Limit the difference in the timestamps to one scanline
      lib/edid: Add support for making DisplayID tile blocks
      tests/kms_tiled_display: Override the EDID to fake some tiles
      tests/i915_pm_rpm: Try the standard "ddc" symlink for i2c read

Vinay Belgaumkar (11):
      gem_ctx_freq: Remove reference to non-existent sysfs entry
      i915_pm_rps: Enable waitboost tests for SLPC
      lib/debugfs: Add per GT debugfs helpers
      lib: Make SLPC helper function per GT
      i915_pm_freq_api: Add some basic SLPC igt tests
      tests/gem_ctx_persistence: Skip hang subtest with GuC
      tests/gem_ctx_freq: Add support for multi-gts
      tests/i915_pm_freq_api: Add a suspend subtest
      i915_pm_freq_api: Add some debug to tests
      tests/i915_pm_freq_api: Ignore zero register value
      tests/i915_pm_freq_api: Test s2idle instead of S3

Vinod Govindapillai (4):
      lib/igt_debugfs: set provision to ignore long HPDs
      lib/igt_kms: handle spurious HPDs - IGT part
      lib/igt_debugfs: set provision to ignore long HPDs
      lib/igt_kms: handle spurious HPDs

Vitaly Prosyak (20):
      tests/amdgpu: sort alphabetically file names
      tests/amdgpu: add bo tests
      lib/amdgpu: correct the fence status check
      tests/amdgpu: skips query-timestamp-while-idle test on raven/raven2
      lib/amdgpu: prepared shared part of multimedia tests
      tests/amdgpu: add uvd decoder test
      tests/amdgpu: add uvd encoder test
      tests/amdgpu: add vce decoder test
      tests/amdgpu: add jpeg decoder test
      tests/amdgpu: add vcn decoder and encoder tests
      tests/amdgpu: vcn test add session context buffer
      tests/amdgpu: add security tests
      tests/amdgpu: add VM test
      tests/amdgpu: add RAS tests
      lib/amdgpu: Formatting the code
      tests/amdgpu: misc fixes for basic tests
      tests/amdgpu: fix cs nop test when no GFX IP
      tests/amdgpu: add sync object tests
      lib/amdgpu: fix formatting warnings
      lib/amdgpu: add chip details to match the amdgpu kernel

Zack Rusin (2):
      lib/igt_kmod: Switch warning to an info when not using i915
      lib: Fix igt_kms for drivers with 8 crtc's

Zbigniew Kempczyński (99):
      i915/gem_create: Ensure newly created handles are not reusing same offset
      lib/intel_batchbuffer: Remove unwanted logging
      i915/gem_ccs: Use extended block-copy on MTL
      i915/gem_ccs: Change allocator type and enforce softpinning
      i915/gem_tiled_fence_blits: Fix softpinned version of the test
      lib/i915_crc: Use system memory buffer on integrated platforms
      lib/i915_crc: Use graphics version to determine ALU SHL/SHR caps
      i915/gem_softpin: Ensure gpu is idle when we use manual placement
      lib/igt_map: Add 32-bit and 64-bit hash helper functions
      lib/intel_allocator_*: Use common hash helpers
      lib/i915/gem_create: Use hash helper for gem bo pool
      intel_gpu_commands: Use kernel gpu command definitions
      lib/huc_copy: Rename to avoid macro name clash
      igt: Remove duplicated macros
      drm-uapi/xe_drm: Add Xe uAPI
      lib/xe: Introduce Xe library
      tests/xe: Add Xe IGT tests
      tools/xe_reg: Add Xe register read/write tool
      intel-ci/xe-fast-feedback: Introduce xe-fast-feedback list
      runner/job_list: return error on crashes while running --list-subtests
      xe/xe_*: use correct MI_STORE_DWORD_IMM command length
      lib/xe_query: Rename for_each_* macros for Xe tests
      tests/xe/*: Revert and reapply patches to change Author tag
      xe/xe_*: use correct MI_STORE_DWORD_IMM command length
      lib/xe_query: Rename for_each_* macros for Xe tests
      lib/igt_sysfs: Add i915_for_each_gt() macro
      lib/xe_query: Prevent cache corruption on multiple access
      lib/xe_query: Add xe_for_each_mem_region iterator
      lib/xe_query: Add memory region getter from region mask
      xe/xe_create: Add xe_create test
      lib/xe_ioctl: Add missing header for direct resolving
      lib/xe_query: Add region helpers and missing doc
      lib/xe_query: Remove commented out function prototype
      lib/intel_allocator: Add allocator support for Xe
      lib/drmtest: Add driver enum for i915/xe
      lib/intel_bufops: Add Xe support in bufops
      lib/intel_batchbuffer: Rename i915 -> fd as preparation step for xe
      lib/intel_batchbuffer: Reacquire offset for reloc allocator in reset path
      lib/intel_batchbuffer: Update intel-bb docs
      lib/intel_batchbuffer: Add Xe support in intel-bb
      tests/xe_intel_bb: Add new test for intel-bb on Xe platform
      tests/xe-fast-feedback: Add xe_intel_bb test to BAT
      lib/gpgpu_fill: Use RENDER engine flag to work on Xe
      tests/xe_gpgpu_fill: Exercise gpgpu fill on Xe
      lib/igt_fb: For xe assume vram is used on discrete
      lib/igt_draw: Pass region while building intel_buf from flink
      tests/kms_big_fb: Deduce region for xe framebuffer
      lib/intel_batchbuffer: Add bind/unbind debug for single bo for Xe
      lib/intel_batchbuffer: Limit intel-bb to 48-bit va
      xe/xe_query: Add engine class checker
      tests/xe_intel_bb: Skip on platforms without render engine
      lib/intel_batchbuffer: Use COMPUTE instead RENDER engine for Xe on PVC
      lib/intel_allocator: Fix missing alignment bug
      tests/xe_create: Add multiple engines create/destroy subtest
      lib/xe_ioctl: Add xe_wait_ufence_abstime() helper
      lib/xe_ioctl: Return remaining timeout of user fence wait
      tests/xe_waitfence: Rename vague subtest name "test" to reltime
      tests/xe_waitfence: Add abstime subtest for user fence
      lib/intel_blt: Prepare blt library to support xe
      lib/xe_query: Add milliseconds to nanoseconds macro
      tests/xe_*: Use nanoseconds instead jiffies in wait user fence
      tests/xe_vm: Fix missing jiffies -> nanoseconds conversion
      tests/xe_*.c: Fix build break on Ubuntu 22.04.2 LTS
      lib/intel_blt: Add blt_ctrl_surf_object() helper
      tests/gem_ccs: Drop local function for setting ctrl surface object
      lib/intel_blt: Add dump of two surfaces comparison in 8x8 blocks
      tests/gem_ccs: Use global image dump comparison function
      tests/api_intel_allocator: Don't use allocator ahnd aliasing api
      lib/intel_allocator: Drop aliasing allocator handle api
      lib/intel_allocator: Remove extensive debugging
      lib/xe_ioctl: Export non-assert xe_exec function
      lib/xe_query: Use vramN when returning string region name
      lib/xe_query: Add xe_region_class() helper
      lib/drmtest: Add get_intel_driver() helper
      lib/xe_util: Return dynamic subtest name for Xe
      lib/xe_util: Add vm bind/unbind helper for Xe
      lib/intel_allocator: Add intel_allocator_bind()
      lib/intel_ctx: Add xe context information
      lib/intel_blt: Introduce blt_copy_init() helper to cache driver
      lib/intel_blt: Extend blitter library to support xe driver
      tests/xe_ccs: Check if flatccs is working with block-copy for Xe
      tests/xe_exercise_blt: Check blitter library fast-copy for Xe
      tests/api-intel-allocator: Adopt to exercise allocator to Xe
      tests/gem_ccs: Avoid writing png twice
      tests/gem_*: Migrate allocator start/stop to fixtures
      lib/media_fill: Use RENDER engine flag to work on Xe
      tests/xe_media_fill: Exercise media fill on Xe
      lib/intel_ctx|fb: Rename engine to exec_queue in xe lib for completion
      tests/xe_media_fill: Add missing documentation for media test
      lib/intel_device_info: Add blitter cmd info for Lunar Lake
      lib/intel_compute: Migrate xe_compute library to intel_compute
      lib/intel_compute: Add compatibility flags for running compute
      lib/intel_compute: Reorganize the code for i915 version preparation
      lib/intel_compute: Add name field for debugging purposes
      lib/intel_compute: Add i915 path in compute library
      intel/gem_compute: Add test which runs compute workload on i915
      lib/intel_compute: Add XeHP implementation of compute pipeline
      lib/intel_compute: Adding pvc compute pipeline implementation
      tests/gem|xe_compute: Update documentation regarding test requirements

Łukasz Łaguna (1):
      lib/igt_core: add helper for srandom seed initialization

git tag: v1.28

https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-1.28.tar.xz
MD5:  5c11ed8a9698df5fd6663b027168ab1f  igt-gpu-tools-1.28.tar.xz
SHA1: adcebd54ff43d2bbdb17f0ac3476b7f9ca459470  igt-gpu-tools-1.28.tar.xz
SHA256: ffcbdf61bd495803d9ae9dfa83e2fe04b8f583a2296fe059c1d5dd135a8a3b15  igt-gpu-tools-1.28.tar.xz
SHA512: b0bed7fce28a309f5e5b1f044952abf06ede806ef691b4ddbd52ee437bc9c3701822d65c761c69a8ae5b40695d121193f30aa772cdfaf9ab16c800d7fbcd0abc  igt-gpu-tools-1.28.tar.xz
PGP:  https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-1.28.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEeEfyoniRn8//js0joApYnAVKh50FAmUBrd0ACgkQoApYnAVK
h52TVwwAoDtzOGZfqGQicQSxcWCvJckuXyjUS+rHHOT14Bp3N+0AmcbvuFZSfhUx
ZAVsqh4+Rr8wX6yDgyOEbVDfeHnNEhUvfbZYM+foGWaMv9EzdCqqodO299nK/BlM
JB3TZmaqXkCx0Wo4mWVFn7wmvAKQ5DB54XsZM6MtH8j8RdP0JlqgpFUzeCOCjxRk
b1Z5CMGWA5xYHUikmQ1XsYDp97uSUBJIRJEPE+1TtKKaq5ZDTJHK+sdd2oFAxtBq
+Wjbqg76n+7opIpuYMmkakXBL/xL+XuxNg9IIqdIhjGR2cveqtZkNrUT/BlRrhhC
lB5rht3aMAjypb3BLwf0LR7k6S+ufOTmtEZlhylCIFBxmd7yUxw++O713mVKWxj9
BgSmwuF5ew6aiIHeBg4Nsg0gWOGr/rUEmD7bCTxNeRch8cOsiRj3LwGAiePQq6yb
hDkIyX3wPa3dsib9cabPTeQQUIa9cCBY5RTGGBANdLfHxdzLuPgIyjUzi5aS44OH
wxPpfbzX
=kyXA
-----END PGP SIGNATURE-----
