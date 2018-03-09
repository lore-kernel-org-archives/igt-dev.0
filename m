Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EDF6E2FD
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Mar 2018 14:28:33 +0000 (UTC)
Date: Fri, 9 Mar 2018 16:28:31 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20180309142831.knvvlatjnussxycm@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [ANNOUNCE] intel-gpu-tools 1.22
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1239640227=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, xorg-announce@lists.x.org
Cc: xorg@lists.x.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1239640227==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="df5nyze2tjhujk2p"
Content-Disposition: inline


--df5nyze2tjhujk2p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


A new intel-gpu-tools quarterly release is available with the
following changes:

General changes:

- Libudev has been made a mandatory dependency. (Antonio Argenziano)

- Documentation changed to refer to the new igt-dev mailing
  list. (Rhys Kidd)

Library changes:

- Refactored timer usage for smaller code size. (Chris Wilson)

- Various fixes to support planar framebuffers. (Maarten Lankhorst)

- Added support for fetching the most recent CRC without waiting for a
  vblank, along with flushing the queue of already collected
  CRCs. (Maarten Lankhorst)

- Added a helper to mark BOs purgeable on vc4. (Boris Brezillon)

- Moved handling of a "cork" BO into lib from various tests.
  (Daniele Ceraolo Spurio)

- Added support for looping over physical i915 engines, as opposed to
  uABI engines that can alias. (Chris Wilson)

- Added an accelerated method for reading from WC buffers.
  (Chris Wilson)

Tools changes:

- Improved intel_vbt_decode output, updated the data from current
  kernel. (Jani Nikula)

- intel_reg can now read/write registers using a given engine.
  (Mika Kuoppala)

- Aubdump can now simulate enhanced execlist submission, for
  gen11+. (Scott D Phillips)





And many other bug fixes, improvements, cleanups and new tests.


And the full changelog follows:

Adam Jackson (1):
      intel_vbt_decode: Typo fixes

Antonio Argenziano (9):
      tests/gem_reset_stats: Fix retrieval of hangcheck stats expectation
      igt/gem_exec_params: Drop drm master privileges only on drm master fds
      lib: Move __gem_context_create to common ioctl wrapper library.
      lib/igt_aux: Add function to swap int64 in array
      tests/gem_ctx_param: Update invalid param
      tests/gem_eio: use igt_cork
      tests/gem_busy: Use intel_measure_ring_size
      igt: Use lib gem_execbuf where possible
      igt: Make libudev mandatory

Arkadiusz Hiler (5):
      meson: Use bufmgr stubs headers if libdrm_intel is not found
      meson: Make cairo mandatory
      meson: Get rid of lib_headers
      tests/meson: Build gem_ctx_isolation
      meson: Force libdrm version also for the subpackages

Boris Brezillon (3):
      igt/vc4: Add a helper function to mark BOs purgeable
      igt: Add igt_vc4_get_param() helper
      igt: Add VC4 purgeable BO tests

Carlos Santa (2):
      lib/igt_kms: Add doc for kmstest_ and igt_ functions
      tests/kms_plane_scaling: Use existing igt_kms apis to paint the fb

Chris Wilson (52):
      igt/gem_linear_blits: Compute GTT size using 4G limit
      igt/gem_tiled_fence_blits: Allocate bo array
      igt/pm_rps: Increase load for waitboosting
      igt/pm_rps: Include related kernel RPS info
      igt/kms_frontbuffer_tracking: Show FBC status during the wait
      lib: Refactor igt_wait() to use library timers
      igt/prime_mmap_coherency: Close dmabuf after use
      tools: Clear unused fields in register spec
      igt/pm_rc6_residency: Check debugfs existence before reading
      igt/perf_pmu: Semaphores do not exist before gen6
      igt/gem_exec_schedule: Limit smoketest to the desired engines
      igt/gem_exec_capture: MI_STORE_DWORD requires EXEC_SECURE + DRM_MASTE=
R on ctg/ilk
      lib: force a reset on an uncooperative i915 device
      lib/kms: Clear unused fields for getproperty ioctl
      igt/kms_frontbuffer_tracking: Disable FBC testing for -ENODEV
      igt/perf_pmu: Retain original GTT offset when resubmitting the spinner
      igt/gem_sync: Exercise and measure idle requests
      lib: Cache the debugfs mountpoint
      lib: Always set mismatching index for igt_find_crc_mismatch
      igt/gem_exec_flush: Silence old compiler warning
      igt/syncobj: Tidy ye olde compiler warnings
      lib: Remove overzealous assertion on gem_set_caching()
      igt/gem_fenced_exec_thrash: Use fixed durations
      igt/kms_frontbuffer_tracking: Wait for PSR to be disabled
      igt/gem_exec_schedule: Trim max number of contexts used
      igt/gem_exec_schedule: Dump the engine info prior to sync on preempt_=
other
      igt/gem_exec_schedule: Replace constant 16 with its magic macro
      igt/gem_eio: Use slow spinners to inject hangs
      igt/gem_ctx_switch: Do a warmup pass over all contexts
      igt/gem_ctx_isolation: Check isolation of registers between contexts
      igt/kms_fbcon_fbt: Handle ENODEV when checking i915_fbc_info for chip=
set support
      igt/perf_pmu: Use a self-correcting busy pwm
      igt/perf_pmu: Fix 64b printf-isms
      igt/gem_ctx_isolation: Fix checking for context support
      Iterate over physical engines
      igt/gem_busy: Fix extended-bsd aliasing checks
      igt/kms_force_connector_basic: Clear any previous connector override
      igt/gem_softpin: Only expect EINVAL for color-overlaps for user objec=
ts
      lib: Export kmsg()
      igt/debugfs_tests: Record which file is being opened in kmsg
      lib/dummyload: Avoid assertions in lowlevel spin constructor
      lib: Provide an accelerated routine for readback from WC
      igt/gem_exec_capture: Exercise readback of userptr
      igt/gem_ctx_switch: Exercise all engines at once
      lib: Fix MI_BATCH_BUFFER_START for hang injection
      tests/perf_pmu: Handle CPU hotplug failures better
      igt/gem_spin_batch: Avoid waiting when running concurrently
      igt/gen7_forcewake_mt: Mark the mmio register as volatile
      igt: Remove gen7_forcewake_mt
      Bump measure_ring_size() timer interval
      lib: Use C99 initialisers to clear context parameters
      igt/drv_hangman: Check that the error state does hold the expected st=
ate

Daniele Ceraolo Spurio (9):
      igt/gem_exec_fence: Test that the in-fence is not overwritten
      lib/igt_dummyload: add igt_cork
      lib/igt_gt: add intel_measure_ring_size
      tests/gem_exec_schedule: use new common functions
      tests/gem_exec_fence: use new common functions
      tests/gem_exec_latency: use new common functions
      tests/gem_wait: use igt_cork
      tests/gem_exec_await: use intel_measure_ring_size
      tests/gem_ringfill: use intel_measure_ring_size

Jani Nikula (4):
      tools/intel_vbt_decode: update vbt defs from kernel
      tools/intel_vbt_decode: print child device count
      tools/intel_vbt_decode: add --header option to only print header
      tools/intel_vbt_decode: add --describe option

Jordan Justen (3):
      tools/aubdump: Support alignment of BO in execbuffer2
      tools/aubdump: Note pinned BO in verbose output
      tools/aubdump: Signal drm sync objects when device override is used

Jyoti Yadav (3):
      tests/kms_plane_scaling: test scaling with tiling rotation and pixel =
formats, v3.
      tests/kms_plane_scaling: test scaler with clipping clamping, v3.
      tests/kms_plane_scaling: test for multi pipe with scaling, v3.

Lionel Landwerlin (10):
      tests/perf: fix report validity check on gen10+
      overlay: add missing foreground option
      overlay: reindent tracepoint parser
      overlay: fix invalid pointer access
      tests/pm_sseu: dump the bit of sysfs
      tests/perf: make oa-exponents subtest more reliable
      test/perf: fixup inverted condition
      tests/perf: simplify enable-disable subtest
      tests/perf: simplify buffer-fill subtest
      tests/pm_sseu: adapt debugfs parsing for newer kernels

Lofstedt, Marta (2):
      igt/kms_fbcon_fbt: Handle ENODEV when checking i915_edp_psr_status fo=
r chipset support
      igt/kms_fronbuffer_tracking: Handle ENODEV when checking i915_edp_psr=
_status for chipset support

Lohith BS (1):
      tests/kms_frontbuffer_tracking: Including DRRS test coverage

Maarten Lankhorst (41):
      tests/kms_plane_scaling: Move the actual test to its own function.
      tests/kms_plane_scaling: Convert from simple test to full test
      tests/kms_plane_scaling: Move get_num_scalers to a function, v2.
      tests/kms_plane_scaling: Clean up tests to work better with igt_kms, =
v2.
      tests/kms_flip: Remove blt/rcs flip tests.
      kms_vblank: Reorganize subtests by pipe, v2.
      tests/kms_flip: Move kms_flip.vblank-vs-hang to kms_vblank, v4.
      kms_vblank: Add tests implemented in kms_flip
      kms_flip: Remove redundant vblank tests.
      kms_vblank: Remove teardown code from cleanup_crtc
      tests: Remove kms_render
      lib/igt_fb: Add igt_put_cairo_ctx as counter to igt_get_cairo_ctx
      lib/igt_fb: Pass format to igt_calc_fb_size
      lib/fb: Handle planar formats in igt_calc_fb_size and create_bo_for_fb
      lib/intel_batchbuffer: Add delta argument to igt_blitter_fast_copy__r=
aw, v2.
      lib/intel_batchbuffer: Add src/dst delta arguments to igt_blitter_fas=
t_copy too
      lib/fb: Add support for creating planar framebuffers, v3.
      lib/igt_fb: Add support for NV12 format through conversion, v2.
      tests/kms_vblank: Fix spurious test failure.
      tests/kms_panel_fitting: Remove dead code
      tests/kms_atomic: Add the test for CRTC_ID/FB_ID mismatch.
      tests/kms_plane_scaling: Test all pixel formats in pipe-*-scaler-with=
-rotation
      tests/kms_plane_scaling: Test all pixel formats with clamping and cli=
pping too
      lib/igt_fb: Make igt_remove_fb more robust
      tests: Always call igt_remove_fb without checking.
      lib/igt_fb: Add igt_fb_supported_format()
      lib/igt_fb: Remove igt_get_all_cairo_formats()
      lib/igt_debugfs: Add igt_pipe_crc_get_single and igt_pipe_crc_drain, =
v4.
      tests/kms_rotation_crc: Fix bad-tiling testcase.
      tests/kms_rotation_crc: Move bad_format parameter to test_plane_rotat=
ion
      tests/kms_rotation_crc: Always run the flip tests when available.
      tests/kms_rotation_crc: Remove primary-rotation-90-Y-tiled.
      tests/kms_rotation_crc: Perform lazy cleanup and require atomic.
      tests/kms_rotation_crc: Clean up exhaust-fences subtest
      tests/kms_rotation_crc: Test all pixel formats on all planes.
      lib/igt_debugfs: Fix igt_pipe_get_crcs.
      lib/igt_kms: Fix igt_display_drop_events() to work as intended
      tests/kms_chv_cursor_fail: Use igt_display_reset() and igt_pipe_crc_d=
rain()
      lib/igt_kms: Fix docbook warnings
      lib/igt_kms: Remove remaining docbook warnings mentioning igt_kms fil=
es.
      lib/igt_draw: Fix bo leak in gpu draw routines

Mahesh Kumar (1):
      tests/kms_plane_scaling: Fix basic scaling test, v3.

Mika Kahola (1):
      tests/kms_plane_lowres: Drain pipe before reading CRC

Mika Kuoppala (1):
      tools/intel_reg: Add reading and writing registers through engine

Petri Latvala (7):
      meson: Refactor get_option() calls for directories
      meson: Use absolute path for IGT_DATADIR
      meson: Don't build docs when cross-compiling
      configure.ac: Bump libdrm_amdgpu version requirement
      Update MAINTAINERS
      configure.ac: Properly bump libdrm_amdgpu version requirement
      Update NEWS, bump version to 1.22.

Rhys Kidd (5):
      doc: Fix typos in CONTRIBUTING
      lib/igt.cocci: Fix typo
      doc: Correct sentence in README
      doc: Update CONTRIBUTING for new igt-dev mailing list
      man: Update for new igt-dev mailing list

Rodrigo Vivi (1):
      lib/i915_pciids.h: Add Cannonlake PCI IDs for another SKU.

Sagar Arun Kamble (1):
      tools/intel_guc_logger: Send GuC log level in new i915 expected format

Scott D Phillips (1):
      tools/intel_aubdump: Simulate "enhanced execlist" submission for gen1=
1+

Sean Paul (1):
      CONTRIBUTING: Fix spelling mistake and line length

Thierry Reding (2):
      tests/testdisplay: Explicitly use GLIB_CFLAGS
      tools/intel_dp_compliance: Add missing GLIB_CFLAGS

Tvrtko Ursulin (23):
      tests/perf_pmu: Tighten busy measurement
      tests/perf_pmu: More busy measurement tightening
      tests/perf_pmu: Use measured sleep in all time based tests
      tests/perf_pmu: Convert to flags
      tests/perf_pmu: Add trailing edge idle test variants
      tests/perf_pmu: PMU enable race test
      tests/perf_pmu: Always skip missing engines
      tests/perf_pmu: Explicitly test for engine availability in init tests
      tests/perf_pmu: Use short batches from hotplug test
      tests/perf_pmu: Use perf timestamps when calculating average frequency
      tests/perf_pmu: Test RC6 during runtime suspend
      tests/perf_pmu: Use perf timestamps in a few more places
      tests/perf_pmu: Handle thermally throttled devices
      tests/perf_pmu: Give sampling more time
      tests/perf_pmu: Log perf timestamp in semaphore wait tests
      tests/perf_pmu: Verify engine busyness accuracy
      perf_pmu: Fix some compile warnings with old compilers / 32-bit builds
      tests/perf_pmu: Skip hotplug test on Broxton
      lib/igt_perf: Find active perf CPU
      tests/kms_frontbuffer_tracking: Fix build warning
      tests/perf: Fix build warning
      tests/perf_pmu: Test busyness reporting in face of GPU hangs
      lib/igt_pm: Restore runtime pm state on test exit

Ville Syrj=E4l=E4 (6):
      tests/kms_ccs: Grab the CRC when the plane is actually enabled
      tests/kms_atomic_transition: Don't abuse the HSKEW flag to force a mo=
deset
      tests/kms_ccs: Move fbs out from data
      tests/kms_ccs: Don't skip the entire subtest if one plane can't do CCS
      lib/sysfs: Fix fbcon unbind, again
      lib/sysfs: s/kick_fbcon/bind_fbcon/

git tag: intel-gpu-tools-1.22

https://xorg.freedesktop.org/archive/individual/app/intel-gpu-tools-1.22.ta=
r.xz
MD5:  965c591b23a132084113c2a0604f537a  intel-gpu-tools-1.22.tar.xz
SHA1: 5d624efb14eca16237e1ae2141aeed6ac51df6e3  intel-gpu-tools-1.22.tar.xz
SHA256: 3d66c1dc5110712ca4d22199b3ce9853f261be1690064edf87e69e5392e39a5c  i=
ntel-gpu-tools-1.22.tar.xz
SHA512: af7964a3782bbc335c50c1c9c42f090306932423e76b9968d6919a2b633f3c11837=
e7ba572d352632c2b4db79bc98218d9d425c3b62e69abad5aa83d733dea8a  intel-gpu-to=
ols-1.22.tar.xz
PGP:  https://xorg.freedesktop.org/archive/individual/app/intel-gpu-tools-1=
=2E22.tar.xz.sig


--df5nyze2tjhujk2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd1lluFZQGVrOd+GNc3AFXbdMJHUFAlqimg8ACgkQc3AFXbdM
JHWbXQ//QySh5UXvMmgUFDkFSGGW1qAvd+9ZuM9tjLkAPkGbAFek/lONRmtW/99e
L3LdgbamiW67cxvDkPIuY8nKyNlH5HWjG2+oDQdepc7kklYspAXB+1SSemcPlYsA
A5DsNlNmIu17/H+kv/KEscszjTc7ALdqjCKZAp3+CXrBq3uztkXLfMdl9Do12JT0
dKV4wGL3q83sHCENL6jAlZYexiY6UMxJYZ7EPPD/6dj/C2M9voKnQ4va3OyF7uaK
HUG+hNNS2Ep1/tE0iO7T2yPdYeHImpz13H4vsPZuotPAlm55eT2H1boeiQ/+37jp
XeoS3EPJslKYVNBo8yTg3GYYP+tjUdJhmA3q3ln0wTcF8QVEIYK7bxLieTJfej7I
BwOzQQIwssmQczs6BfBExHnkT5q/5xwIPOQbzMvOnYLihiX9yKtrpeG3p1j2pGrj
GBH8yM4xaMYuIQpaKTLsISwjypWySo7ZsNQ4z2LeKlV4Ur1hljJgZTC4+mJ1iQFx
OL9hkLjb8/IX5bxGIm/OETO8FI3HUlUyFFAypGgzqJQh3zGplOvCGF8jj6Ck+DuM
XPMd9tLXhxaeCVNDSk7qUZ6bZhCeefc2lo5HXQ0JYvEf4SladS7tFq+lRtdMVvUB
n21itVcxgmgsXqD1O31/jV6ItswRho+FANcrfHrg6Xa9IMU/09s=
=6Wy4
-----END PGP SIGNATURE-----

--df5nyze2tjhujk2p--

--===============1239640227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1239640227==--
