Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA176E97D
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jul 2018 09:13:56 +0000 (UTC)
Date: Wed, 18 Jul 2018 12:13:50 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20180718091350.GA9487@ahiler-mobl1.fi.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [ANNOUNCE] igt-gpu-tools 1.23
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0133669135=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: xorg-announce@lists.x.org, igt-dev@lists.freedesktop.org
Cc: xorg@lists.x.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0133669135==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

A new intel-gpu-tools quarterly release is available with the
following changes:

General changes:

- Bumped used C standard to gnu11. (Lucas De Marchi)

- Bumped required meson version to 0.44. (Petri Latvala)

- Introduced meson options for explicit control over optional dependencies.
  (Petri Latvala)

- Added a meson option to set runpath for the installed executables.
  (Petri Latvala)

- GLib is now a mandatory dependency. (Petri Latvala)

- Added testlists for the vc4 driver. (Maxime Ripard)

- The project has now finalized its name change and is now IGT GPU Tools,
  docs and install paths are now "igt-gpu-tools". (Arkadiusz Hiler)

- Added a blacklist for the Intel CI. (Petri Latvala)


Library changes:

- i915_pciids.h updated to include KBL, ICL, WHL and AML.
  (Jos=C3=A9 Roberto de Souza, Paulo Zanoni)

- Overhaul of gpu_cmds, gpgpu_fill, media_fill and rendercopy.
  (Katarzyna Dec, Lukasz Kalamarz)

- Added igt_matrix and igt_color_encoding helper libraries. (Ville Syrj=C3=
=A4l=C3=A4)

- IGT now shows the kernel stack trace when reporting a GPU hang. (Chris Wi=
lson)

- Added Icelake platform support. (Arkadiusz Hiler, Paulo Zanoni)


Tools changes:

- intel-gpu-top was rewritten to be safe to use. (Tvrtko Ursulin)


Documentation changes:

- Documented commit rights in CONTRIBUTING. (Daniel Vetter)


Test changes:

- kms_prs_sink_crc was renamed to kms_psr. (Dhinakaran Pandiyan)

- kms_frontbuffer_tracking no longer tests sink crc. (Dhinakaran Pandiyan)

- drm_vma_limiter is no more. (Chris Wilson)


And many other bug fixes, improvements, cleanups and new tests.


I got temporary rights to do the upload thanks to Marin Peres.
I'll follow the proper process to get them permanently for the next release=
 :-)


And the full changelog follows:

Adam Sampson (2):
      Use flex -i when building with meson.
      Test that register types are accepted in all valid forms.

Antonio Argenziano (8):
      igt: Replace 'all-engines' magic numbers with macro
      igt/gem_measure_ring_size_inflight: Measure smallest inflight ring si=
ze
      tests/gem_close_race: Wait for work to complete before terminating te=
st
      lib/intel_batchbuffer: Minor cosmetic change in copyright header
      lib/igt_dummyload: Fix possible NULL pointer dereference
      tests/gem_exec_basic: Wait on outstanding work before returning from =
test
      tests/gem_partial_pwrite_pread: Remove commented-out code
      lib/gt: Make use of dummyload library to create recursive batch

Arkadiusz Hiler (5):
      lib: Add Icelake platform definition
      pm_rpm: Skip PC8 tests when set limit doesn't allow entry
      pm_rpm: Lower the timeout for PC8 entry to 30s
      igt: Drop Intel from the name in docs and paths
      Update NEWS, bump version to 1.23.

Chris Wilson (68):
      lib: Run gem_test_engine() in an isolated context
      igt/gem_ctx_switch: Measure qlen for timing loops
      overlay: Call setlocale around strtod
      igt/perf_pmu: Most-busy requires at least one busy engine
      igt/gem_ctx_isolation: Reset a scratch context
      igt/gem_eio: Require context support before creation
      lib: Acquire master for pollable spinbatch on gen4/5
      igt/gem_eio: Drop DRM_MASTER so we can reacquire it in the subtests
      lib: Dump meminfo and slabinfo if we complain about insufficient memo=
ry
      igt/kms_plane_scaling: Open DRM_MASTER
      igt/prime_mmap: Test for userptr support first
      igt/gem_exec_schedule: Exercise "deep" preemption
      igt/gem_ppgtt: Flush the driver to idle before counting leaks
      test/gem_exec_schedule: Check each engine is an independent timeline
      igt/drv_missed_irq: Sleep in the child waiting for the parent
      igt/gem_exec_fence: Exercise merging fences
      igt/gem_wait: Relax assertion for wait completion
      lib: Show the kernel stack when reporting a GPU hang
      igt/gem_eio: Exercise banning
      overlay: Remove the miscalculation of window position
      lib/audio: Replace sqrt(a*a + b*b) with hypot(a, b)
      tests/gem_eio: Only wait-for-idle inside trigger_reset()
      igt/gem_ctx_thrash: Order writes between contexts
      benchmarks/gem_syslatency: Pass a write hazard around
      benchmarks/gem_syslatency: Allow limiting to just 1 CPU hog
      benchmarks/gem_syslatency: Specify batch duration
      igt/gem_ctx_isolation: Test INSTPM back to gen6
      igt/perf_pmu: Flush to idle after hang
      lib: Assert that we do manage to submit at least one batch when measu=
ring
      lib: Align ring measurement to timer
      lib: Double check ring measurement
      igt/gem_tiled_blits: Show more errors
      igt/gem_exec_await: Tag the final batch in the GTT
      igt/drv_suspend: Suspend under memory pressure
      igt/gem_mmap_gtt: Checking tiling pattern requires known swizzling
      lib: Bump debug information for lack-of-memory to warn
      igt/sw_sync: Wrap threaded counter manipulation with mb
      igt/gem_eio: Make reset-stress safe
      lib: Purge os caches twice for good luck
      lib: Conservatively include residual buffers in the available ram est=
imate
      igt/gem_exec_nop: Drip feed nops
      igt/gem_exec_latency: Measure polling latency between batches
      tests: Drop drm_vma_limiter*
      igt/gem_exec_gttfill: Avoid pwrite into busy handle
      lib: Report file cache as available system memory
      lib/rendercopy: Use gen8_wm_kernel__affine
      amdgpu/amd_prime: Reduce setup time
      igt/perf: Check the GPU is not wedged before running
      igt/gem_set_tiling_vs_pwrite: Show the erroneous value
      igt/gem_tiled_partial_pwrite_pread: Check for known swizzling
      lib: Convert spin batch constructor to a factory
      lib: Spin fast, retire early
      igt/gem_sync: Alternate stress for nop+sync
      igt/gem_sync: Double the wakeups, twice the pain
      igt/gem_sync: Show the baseline poll latency for wakeups
      igt/gem_pwrite_pread: Requires GEM
      igt/gem_render_copy: Check for GEM before running
      lib: Require working GEM (!wedged) to allow hang injection
      lib/kmod: Fail if the module is already loaded
      lib/dummyload: Control whether or not the batch is preemptible
      igt/pm_rpm: Pass NULL to require no extra module options
      igt/gem_gpgpu_fill: Check for GEM before use
      igt/gem_render_copy_redux: Check for GEM before use
      igt/gem_unfence_active_buffers: Check GEM before use
      igt/gem_userptr: Check read-only mappings
      igt/gem_pwrite_snooped: Check for GEM before use
      igt/kms_vblank: Check if hangs are allowed
      igt: Remove gvt_basic

Daniel Stone (6):
      lib: Don't fail if plane IN_FORMATS not present
      tests/kms_getfb: Add test for getfb
      meson: Chamelium depends on GSL
      tests/kms_getfb: Test we reject CCS buffers
      tests/kms_getfb: Split property-ID get into helper
      tests/kms_getfb: Use fixtures and subtest groups

Daniel Vetter (2):
      CONTRIBUTING: commit rights docs
      gtkdoc: Remove the build_by_default hack

Dhinakaran Pandiyan (23):
      tools/vbt_decode: Print DRRS and PSR flags
      tests/psr: Print the reason for skipping when sink lacks PSR support
      tests/psr: Remove "psr_" prefix from basic and drrs subtests
      tests/psr: Rename psr_active() to psr_enabled()
      tests/psr: Store the debugfs file descriptor
      tests/psr: Assert sink CRC length and make use of igt_sysfs_read()
      tests/psr: Optimize check for green frame.
      tests/psr: Kill MMAP_GTT_WAITING
      tests/psr: Merge PSR dpms and suspend variants.
      tests/psr: Remove delay between dpms toggle.
      tests/psr: Check for drrs status only after checking for PSR
      tests/sink_crc_basic: Debug print CRC values
      tests/psr: Get rid of global variable running_with_psr_disabled
      tests/psr: Eliminate storing pointers for igt_plane_type.
      tests/psr: Pass data_t pointer to dpms_off_on
      tests/frontbuffer_tracking: Do not test sink crc
      tests/kms_psr_sink_crc: Do not test sink crc
      tests/kms_psr_sink_crc: Test PSR source HW status before PSR entry.
      tests/psr: Rename kms_psr_sink_crc.c to kms_psr.c
      tests/sink_crc: Remove kms_sink_crc_basic
      tests/psr: Prepare for moving PSR state checking functions into lib
      tests/psr: Move PSR state test functions to lib
      tests/frontbuffer_tracking: Use the library functions to test PSR.

Jani Nikula (1):
      tools/intel_gpu_frequency: fix usage and examples

Javier Villavicencio (1):
      lib/instdone.c: Add Gen11 Support

John Harrison (4):
      scripts/trace.pl: More hash key optimisations
      scripts/trace.pl: Sort order
      scripts/trace.pl: Calculate stats only after all munging
      scripts/trace.pl: Simplify 'end' & 'notify' generation

Jordan Justen (3):
      tools/aubdump: Add gen8_map_ggtt_range
      tools/aubdump: Add bitmap to track gtt pages that have been mapped
      tools/aubdump: For gen10+ support addresses up to 4GB

Jos=C3=A9 Roberto de Souza (2):
      lib: sync with the newer i915_pciids.h from the Kernel (WHL + AML)
      tests/perf: Add test config uuid for Icelake

Juha-Pekka Heikkila (1):
      tests/kms_available_modes_crc: Test all modes on all planes

Kalamarz, Lukasz (7):
      lib/gen6_render: Removal of duplicated definitions
      lib/gen6_render: Reorder registers and fields definitions
      lib/gen6_render: Cosmetic changes in code
      lib/rendercopy_gen7: Reorganizing batch allocations
      lib/rendercopy_gen7: Cosmetic changes in code
      lib/intel_batchbuffer: Removal of state variable from a intel_batchbu=
ffer structure
      lib/intel_batchbuffer: Move batch functions from media/render/gpgpu l=
ibs

Karol Krol (2):
      igt/gem_fd_exhaustion: Actually test error handling on fd exhaustion
      igt/gem_fd_exhaustion: Modify fs.nr_open for duration of the test

Katarzyna Dec (13):
      lib: Move common gpgpu/media fill functions to gpu_fill library
      lib: Remove duplications in gpu_fill library
      lib/gpgpu_fill: Add missing configuration parameters for gpgpu_fill
      lib: Adjust refactored gpu_fill library to our coding style
      lib/intel_batchbuffer: Reuse gen9_media_fill on Gen 10
      lib/media_spin: Move helper functions to gpu_fill library
      lib/media_spin: Remove gen8lp_media_spin function
      lib: Adjust media_spin and gpu_fill to our code style
      lib/gpu_fill: Further code unification in gpu_fill
      lib: Rename library from gpu_fill to gpu_cmds
      lib/igt_device: Add information why cannot drop drm master
      lib/media_fill: Create common media_fill library for all gens
      lib/gpgpu_fill: Create generic __gen9_gpgpu_fillfunc

Leo (Sunpeng) Li (3):
      tests/kms_color: Fill entire frame when painting rectangles
      tests/kms_color: Do not mask LUT for non i915 drivers.
      tests/kms_color: Enable color tests for AMDGPU

Lionel Landwerlin (8):
      include: bump drm uAPI headers
      intel_chipsets: store GT information in device info
      tests: add i915 query tests
      tests/i915_query: split garbage test
      tests/i915_query: fix expected subslice count on hsw
      tests/perf: fix gen8 small cores whitelist expectation
      lib: drop drmtest dependency on intel_batchbuffer
      lib: create new dependency for aubdump

Lofstedt, Marta (3):
      blacklist: Don't run DRRS test on Intel CI system
      blacklist: Don't run tests on pipe-d, pipe-e or pipe-f
      tests/kms_frontbuffer_tracking: Save runtime by removing sleep.

Lucas De Marchi (8):
      run-tests.sh: allow to run without sudo
      run-tests.sh: allow relative IGT_TEST_ROOT and IGT_CONFIG_PATH
      README: clarify comment about tests
      run-tests.sh: use meson build by default
      tests/sw_sync: fix pthread start_routine declaration
      build: bump c std to gnu11
      lib/igt_core: fix check for running under gdb
      lib/igt_kms: simplify pipe <-> name conversion

Lukasz Kalamarz (8):
      lib/surfacestate: Creating surfaceformat header
      lib: Rename all surfaceformat calls in libs
      libs: Removal of duplicated SURFACEFORMAT definitions
      lib/gen7_render: include gen6_render header
      lib/rendercopy: Use gen6 definitions if applicable
      lib/gen7_render: Drop duplicated definitions
      lib/gen8_render: Cleanup of libs
      lib/gen9_render: Header cleanup

Maarten Lankhorst (23):
      tests/gem_fd_exhaustion: Fix build failure
      tests/kms_chamelium: Make tests run without pipe color management sup=
port.
      tests/kms_panel_fitting: Test cleanups.
      lib/igt_kms: Fix igt_plane_reset to handle cursor planes correctly too
      tests/kms_frontbuffer_tracking: Convert test to use igt_display, v3.
      tests/kms_frontbuffer_tracking: Respect mode when collecting CRCs.
      tests/kms_pipe_crc_basic: Remove legacy crc tests
      lib/igt_kms: Fix enum type in igt_pipe_has_prop.
      tests/kms_frontbuffer_tracking: Reduce fbc status spam, v2.
      lib/igt_kms: Add functions to get only a single output for a pipe, v2.
      tests/kms_rmfb: Use for_each_pipe_with_single_output.
      tests/kms_busy: Convert to using igt_get_single_output_for_pipe, v2.
      tests/kms_chv_cursor_fail: Reorder tests, and use igt_display_require=
_output_on_pipe.
      tests/kms_chv_cursor_fail: Handle cleanup better.
      tests/kms_frontbuffer_tracking: Fix Y alignment in the scaledprimary =
subtest, v3.
      lib/igt_kms: Improve connector probing in igt_display_init(), v2.
      kms_frontbuffer_tracking: Remove unnecessary modeset from get_sink_cr=
c.
      lib/igt_kms: Handle outputs with no modes better
      lib/igt_kms: Reset FIFO underruns on first commit after init()/reset(=
).
      lib/igt_debugfs: Add timeouts to opening pipe CRC fd.
      tests: Remove kms_mmio_vs_cs_flip
      tests/kms_panel_fitting: Make test pass on gen9's pipe C
      tests/kms_available_modes_crc: Fix test to work correctly on GLK.

Marta Lofstedt (1):
      tests/kms_psr_sink_crc: Save runtime by not waiting in crc function

Matthew Auld (1):
      tests/gem_userptr_blits: test zero user_size

Maxime Ripard (1):
      tests: Add vc4 test suite

Micha=C5=82 Winiarski (2):
      lib: Extract mlock probing
      igt/evictions: Avoid getting killed by the reaper in mlock

Mika Kahola (2):
      tests/kms_plane_multiple: Drain pipe before reading CRC
      tests: Move wait_for_pageflip as library function

Pandiyan, Dhinakaran (1):
      tests/kms_frontbuffer_tracking: Update check for PSR status

Paulo Zanoni (1):
      lib: sync with the newer i915_pciids.h from the Kernel (KBL + ICL)

Petri Latvala (7):
      meson: Set up runpath for installed executables
      intel-ci: Document meta.testlist
      intel-ci: Document purpose of fast-feedback.testlist
      intel-ci: Add full-suite test round blacklist
      meson: Install amdgpu tests with their subdirectory
      Make GLib mandatory
      meson: Add options to control optional parts

Radhakrishna Sripada (1):
      tools/intel_dp_compliance: Use ARGB8888 format fbs for Gen 10

Rodrigo Siqueira (5):
      Account for NULL character when using strncpy
      Move declaration to the top of the code
      Remove parameter aliases with another argument
      Avoid truncate string in __igt_lsof_fds
      Fix comparison that always evaluates to false

Souza, Jose (2):
      scripts: Use https URL to download piglit
      tests/kms_frontbuffer_tracking: Ignore FBC errors due mode is too lar=
ge

Tvrtko Ursulin (25):
      tests/perf_pmu: Use absolute tolerance in accuracy tests
      intel-gpu-overlay: Update for renamed tracepoints
      lib/dummyload: Add pollable spin batch
      tests/gem_eio: Speed up test execution
      tests/perf_pmu: Improve accuracy by waiting on spinner to start
      tests/perf_pmu: Fix usage of for_each_engine_class_instance
      tests/gem_eio: Never re-use contexts which were in the middle of GPU =
reset
      tests/gem_eio: Add reset and unwedge stress testing
      tools/aubdump: Fix ISO C90 forbids mixed declarations and code warning
      tests/perf_pmu: Avoid RT thread for accuracy test
      trace.pl: Catch-up with tracepoint renames
      trace.pl: Move sortQueue near its user
      trace.pl: Move min/max timestamp lookup to last loop
      intel-gpu-overlay: Fix some build warnings
      intel-gpu-top: Rewrite the tool to be safe to use
      perf_pmu: Stop skipping hotplug test on Broxton
      trace.pl: Add support for colouring context execution
      trace.pl: Remove context squashing option
      scripts/trace.pl: Support class:instance engine tracepoints
      intel_gpu_overlay: Update for class:instance engine tracepoints
      tests/gem_exec_latency: New subtests for checking submission from RT =
tasks
      trace.pl: Fix no context colouring mode
      trace.pl: Fix HTML timestamp generation
      trace.pl: Put single context at single vertical slot
      trace.pl: Fix engine busy accounting in split mode

Vidya Srinivas (2):
      tests/kms_plane_scaling: Change minimum fb height for YUV 420 planar
      tests/kms_plane_scaling: fb height to be min 16 for NV12

Ville Syrj=C3=A4l=C3=A4 (35):
      tests/pm_rpm: Don't try to create an X-tiled ARGB8888 framebuffer
      lib: Add igt_hweight()
      lib: Parse plane IN_FORMATS blobifiers into a nicer form
      lib/kms: Constify some string arrays
      lib/kms: Use named initializers for prop name arrays
      tests/kms_properties: Validate properties harder
      tests/kms_ccs: Don't populate igt_fb structs with stack garbage
      tests/kms_plane_scaling: Allow clip test to fail with YUV
      tests/kms_plane_scaling: Reduce the fb size 8x8 from 9x9
      tests/kms_force_connector_basic: Don't skip when VGA is connected
      lib: Add clamp() to igt_aux and use it for ycbcr<->rgb conversion
      lib: Add igt_matrix
      lib: Add igt_color_encoding
      lib/igt_matrix: Unroll and inline igt_matrix_transform()
      lib/igt_color_encoding: Use the m(row,col) macro to address the matri=
x cells
      lib/igt_color_encoding: Appease c90
      lib/igt_fb: Round to nearest when clamping rgb
      lib: Clear packed YUV formats to black
      lib: Don't use dumb buffers for YCbCr
      lib: Clean up format_desc
      lib: Use igt_matrix for ycbcr<->rgb conversion
      lib: Add support for rendering into packed YCbCr framebuffers
      lib/fb: Add color_encoding/color_range to igt_fb
      lib/kms: Respect fb color_encoding/color_range
      tests/kms_plane: crc check plane pixel formats
      tests/gem_render_copy: Use a more elaborate pattern of pixels
      lib/rendercopy: Simplify reloc offsets
      lib: Constify igt_buf
      lib/rendercopy: Set the upper 32bits of surface base address on gen8+
      lib: Add aux surface state to igt_buf
      lib/rendercopy: Add enough surface state for AUX_CCS_E
      tests/gem_render_copy: Add subtests for different tiling modes
      tests/gem_render_copy: Add a subtest for AUX_CCS_E
      lib/igt_draw: Zero initalize the igt_bufs
      tests/kms_flip: Print timevals as float

git tag: igt-gpu-tools-1.23

https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-1.23.tar.=
xz
MD5:  04c1f10d6fd85e079271540b0ea786e9  igt-gpu-tools-1.23.tar.xz
SHA1: 7b3c99fe16aa77c1f6dcd11d961bfc6ddea4362a  igt-gpu-tools-1.23.tar.xz
SHA256: 4d4b086c513bace5c23d0889de3f42ac3ebd3d968c64dedae6e28e006a499ad0  i=
gt-gpu-tools-1.23.tar.xz
SHA512: 8697265a978359e28983f483bf95819844597fc2080923d15d0587f6d648081af27=
e8ea318873e20103bbf8446b9f1005c6bc90a6276d3169837abd181f96839  igt-gpu-tool=
s-1.23.tar.xz
PGP:  https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-1.2=
3.tar.xz.sig


--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEZprGcXk7IjUORpYPBF28VM/knC4FAltPBM0ACgkQBF28VM/k
nC6hUA//TS3X8VHE0J38Yg2gc+bC7y5S9CsuYe0J6apio2JsZjfy4yn2cfSQCXCv
GdwE1Vu1qxnWF0lLDQXvCjjXVKSMbgOAqyETzUPREJ41eEcXNe31nuFFQ859SxZT
WhXY37GtF+GiZoLvNCp/7htmtNgR/evHsuHxT7PhZETL/foGgVXSWlCrc2jSLdVA
5GMjQwVZXjpu5sus8GTxPl3QCjsg2zbhPIqYXpShl29+Mt1FUzxW5qW4vtUIi4Vo
8/2O6vdt57AoeVpP/+045FunwlpTW9tGJRZ5CbNMMIJz0alS/Qs6gLlxWJNltigG
1cuGNtu43ajRWCfWBqUwyUKerN1TL2roaOre/qI7fnBHuU86hVKqatiIp1lle438
i4t4+sYXQg/k5ISr4gB9PFHMn6ONwL4porKahdBAPfZDW6S6JaesP0Q8my++uAft
LfXwaYRbCyqv5s0jJ1s7NESca5+OuYGV+RxLLWF1acjEJxuj0MTQttHSb1fDF18j
0VZPVkI174pzbL4m9IcZHJzbxi7MEZ6ggXfBUxntLqZCIxJ6csxpSuEf6w8c4yBJ
Wtc5nKloTL+aRTz6uyhgo0oFxo/Hx02wpyt1oQjOdA1es6Okz/Mpm1LEa1fDHjac
2GXr1I3tYNuKjt2yW7+zoYPxw3ZepRna7wd+FR+WEFJJ6HrT1wo=
=Sw7u
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--

--===============0133669135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0133669135==--
