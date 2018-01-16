Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Tue, 16 Jan 2018 16:45:05 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20180116144505.zxsrle6pit3r2lgx@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [ANNOUNCE] intel-gpu-tools 1.21
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1748291907=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: xorg-announce@lists.x.org
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, xorg@lists.x.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1748291907==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kbrqmrcy32hg2q3d"
Content-Disposition: inline


--kbrqmrcy32hg2q3d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


A new intel-gpu-tools quarterly release is available with the
following changes:

Library changes:

- Added helpers for using DRM syncobj. (Jason Ekstrand)

- Refactored several i915 helpers into library functions.
  (Micha=C5=82 Winiarski)

- Improved the GPU quiescing code to more thoroughly flush old data
  and pending work. (Chris Wilson)

- Reworked DRM property handling to be more suitable for
  atomic commits. (Maarten Lankhorst)

- Removed support for legacy CRC API. The generic API has been
  available since kernel 4.10. (Maarten Lankhorst)

- Opening a DRM device now automatically loads its module. (Chris Wilson)

- Imported the drm-uapi headers as copies instead of using what's
  installed in the system. (Eric Anholt)

- Moved the perf code to its own library from
  intel-gpu-overlay. (Tvrtko Ursulin)

- Removed Android support due to lack of use and
  maintenance. (Arkadiusz Hiler)

- Upgraded meson to official production status, automake is still kept
  around for now.

Tools changes:

- Improved the output of intel_vbt_decode. (Jani Nikula)

- intel_error_decode now prints user buffers if they contain debug
  logs. (Chris Wilson)

- Improved the output of intel_watermark. (Ville Syrj=C3=A4l=C3=A4,
  Dhinakaran Pandiyan)

- Aubdump can now simulate execlist submission, converting from ring
  buffer submission method. (Scott D Phillips)

- intel-gpu-overlay can now show data from perf PMU. (Tvrtko Ursulin,
  Chris Wilson)

- intel-gpu-overlay now parses tracepoint locations from
  sysfs. (Lionel Landwerlin)

Documentation changes:

- Documentation can now be built with Meson. (Daniel Vetter)


And many other bug fixes, improvements, cleanups and new tests.


And the full changelog follows:

Abdiel Janulgue (3):
      tests/gem_hangcheck_forcewake: Drop gem_hangcheck_forcewake.c
      tests/gem_pin: Drop gem_pin.c
      tests/gem_seqno_wrap: Drop gem_seqno_wrap.c

Antonio Argenziano (2):
      tests/gem_exec_schedule: Add reset on failed preemption test.
      tests/gem_exec_schedule: Add test for resetting preemptive batch

Arkadiusz Hiler (8):
      meson: Add fallback for xmlrpc discovery
      tests: Clean up igt_skip_on_simulation() uses
      tests/intel-ci: Remove fast-feedback-simulation.testlist
      lib/igt_core: Move write_stderr out of LIBUNWIND ifdef
      igt: Remove Android support
      Revert "lib/igt_aux: Make procps optional"
      igt: Make dependency on libunwind mandatory
      test/kms_plane_lowres: Fix display_commit_mode() so it returns the crc

Chris Wilson (93):
      igt/gem_workarounds: Read the workaround registers from the active co=
ntext
      igt/gem_workarounds: Also exercise fresh contexts not the persistent =
default
      igt/gem_workarounds: Also test new fd (implicit default context)
      igt/gem_workarounds: Reduce manual list to combinatorial loops
      igt/gem_workarounds: Add hibernation coverage
      igt/gem_exec_scheduler: Add small priority sorting smoketest
      igt/gem_fence_thrash: Use streaming reads for verify
      igt/syncobj_wait: Replace open-coded calls to __syncobj_wait()
      igt/syncobj_wait: Close the sw_sync timeline after the test
      igt/drv_hangman: Convert from local recursive batch to igt_spin_t
      benchmark/gem_busy: Compare polling with syncobj_wait
      igt/gem_eio: Check hang/eio recovery during suspend
      igt/gem_mocs_settings: Skip non-existent engines
      igt/prime_mmap_coherency: Only assert correct usage of sync API
      igt/pm_rc6_residency: Allow some leeway on the upper %% bound
      igt/prime_mmap_coherency: Call prime_sync_start before read after wri=
te
      lib: Add DROP_IDLE
      lib: Idle the GT when quiescing the GPU
      lib: Flush the driver's internal cache of objects before counting
      lib: Free all internal buffers before measuring available memory
      lib/i915: Add a query for when the guc is enabled.
      igt/drv_misssed_irq: Skip on guc
      igt/prime_mmap_coherency: Remove manual gem_sync() calls
      lib/gt: Always eat the unwanted error state
      igt/gem_fd_exhaustion: Remove stale assert
      igt/gem_exec_nop: Headless requires DRM_MASTER for modesetting
      igt/drv_hangman: Skip aliased I915_EXEC_BSD
      igt/gem_exec_latency: Wire up an interloper for preemption
      lib: Always enable ftrace-dump-on-oops
      lib/i915: Query semaphore status using GETPARAM
      lib/debugfs: Make is_mountpoint() non-fatal
      lib: Attempt to load the module for a missing device
      lib/kmod: Stop reloading i915 after every kselftest
      lib: Dump /sys/kernel/debug/suspend_stats after suspend failure
      lib/i915: Prepare for the loss of i915.enable_execlists parameter
      tools/error_decode: Print ASCII user buffers
      tools: Stop opening the driver just to find the debugfs
      igt/perf_pmu: Test for supported perf before starting test_interrupts
      igt/perf_pmu: Tidy skip message for unsupported kernels
      igt/perf_pmu: Clear errno in between invalid atrr tests
      igt/perf_pmu: Explicitly reset min_freq before max_freq
      igt/perf_pmu: Protect macro args
      igt/perf_pmu: Avoid underflow in measured_sleep()
      igt/perf_pmu: Bump batch_duration for legacy sampling inaccuracy
      igt/perf_pmu: Reduce arbitrary delays before rc6
      igt/perf_pmu: Stop peeking at intel_mmio registers
      igt/perf_pmu: Recalibrate interrupt loop.
      igt/perf_pmu: Keep batch_duration_ns as the minimum measurement durat=
ion
      igt: Remove gem_ctx_basic
      igt/perf_pmu: Increase delay for rc6 to start
      igt/gem_eio: Test we can suspend when the driver is already wedged
      igt/gem_eio: Increase wakeup delay for in-flight-suspend
      igt/gem_busy: Replace arbitrary busy batch with indefinite spinbatch
      igt/drv_selftests: Disable initialising the display
      igt/perf_pmu: Tighten semaphore-wait measurement
      igt/pm_rc6_residency: Measure residency after checking for applicabil=
ity
      igt/pm_rc6_residency: Replace hard-coded sleep before rc6 with a probe
      igt/perf_pmu: Replace hard-coded sleep before rc6 with a probe
      igt/perf_pmu: Tweak wait_for_rc6, yet again
      lib/i915: Update detection of GuC submission
      igt/gem_mocs_settings: Force use of master device
      igt/pm_rps: Replace arbitrary HIGH_LOAD blit with a busyspin
      igt/pm_sseu: Mark requirements with igt_require
      igt/perf: Use igt_sysfs rather than opencoding
      igt/perf: Read RCS0 timestamp directly
      lib: Print other clients when DRM_SET_MASTER fails
      igt/drv_module_reload: Keep injecting load failures until it passes
      tests: Use igt_device_set_master
      igt/kms_vblank: To set a mode requires DRM_MASTER
      igt/kms_flip: Allow very large bo to fail pageflips with E2BIG
      igt/gem_shrink: Exercise allocations in the middle of execbuf under o=
om-pressure
      lib/dummyload: Wrap global list inside its own mutex
      lib/core: Don't leak dummyloads between subtests
      lib: Ask the kernel to quiesce the GPU
      lib: Provide a library function to test nop execution
      igt/tools_test: Check the tools exist before executing
      lib/sysfs: Handle EINTR from vfprintf()
      lib/debug: Convert igt_drop_caches_set() to use common file writers
      lib/draw: Use more typical form for computing swizzle addresses
      igt/kms_frontbuffer_tracking: Access via GGTT is not guaranteed to be=
 tracked
      igt/pm_rps: Always allocate spin[0]
      igt/kms_frontbuffer_tracking: Make assert(false) more informative
      igt/perf_pmu: Tighten busy measurement
      igt/perf_pmu: Tighten measurements for most-busy
      igt/perf_pmu: Measure the reference batch for busy-check-all
      igt/perf_pmu: Measure the reference batch for all-busy-check-all
      igt/perf_pmu: Speed up frequency measurement
      igt/gem_exec_await: Flush the WCB before attempting to queue more work
      lib: Convert sw_sync to use sync_file uapi imported from the kernel
      igt/kms_flip: Do igt_require_gem() just once
      igt/gem_busy: Remove repeated use of igt_spin_batch_new
      igt/perf_pmu: Skip GEM checks for repeated spin_batch allocations
      lib/gem: Reset the global seqno at the start of each test

Daniel Vetter (8):
      tests: remove kms_fbc_crc
      lib: Also copy vc4_packet.h
      automake: include drm-uapi headers in EXTRA_DIST
      lib: avoid < in gtkdoc comments
      meson: gtkdoc support
      meson: build a full dependency for lib_igt_perf
      build: make meson more official
      Revert "build: make meson more official" damage

Daniele Ceraolo Spurio (1):
      tests: Drop gem_bad_length as redundant

Dhinakaran Pandiyan (2):
      tools/intel_watermark: Update intel_watermark with SKL support
      tools/intel_watermark: Try not to dump nonexistent planes on SKL+

Dmitry Rogozhkin (1):
      benchmarks/gem_exec_nop: fix engines selection

Eric Anholt (7):
      headers: Import drm-next uapi headers.
      tests: Convert to using the imported drm-uapi headers.
      tests: Remove libdrm_vc4 dependency.
      lib: Use the imported uapi's addfb2 defines.
      lib: Use drm-uapi/i915_drm.h instead of local defines.
      igt/vc4_tiling: Test vc4's new set/get_tiling ioctls.
      igt/vc4-label: Test setting labels of BOs.

Gabriel Krisman Bertazi (8):
      tests/kms_plane_scaling: Fix off-by-one plane selection
      tests/kms_fbcon_fbt: Report fbc_status on error
      tests/kms_ccs: Test pipes other than pipe A
      lib/igt_kms: Fix off-by-one bug on skip of missing pipe
      tests/kms_ccs: Prevent segfault if pipe is not supported
      tests/kms_ccs: Test case where the CCS buffer was not provided
      tests/kms_ccs: Test case where CCS is on a different BO
      tests/kms_ccs: Test case for wrong aux buffer stride size

Imre Deak (6):
      aux: Suspend signal helper for shell commands
      aux: Use IGT version of system() call to run rtcwake
      kms_atomic_transition: Split out modeset tests on internal panels
      kms_plane: Enumerate outputs before planes in position subtests
      kms_plane: Enumerate outputs before planes in panning subtests
      igt_fb: Add support for drawing to non-32bit Y/Yf tiled FBs

Jani Nikula (10):
      tools/intel_vbt_decode: make a copy of child devices before dumping
      tools/intel_vbt_decode: update dvo port name dumping
      tools/intel_vbt_decode: use %.*s instead of duplicating a string
      tools/intel_vbt_decode: abstract DSI bridge type dump
      tools/intel_vbt_decode: unify child device printing across versions
      tools/intel_vbt_decode: unify legacy child device block dumping
      tools/intel_vbt_decode: dump more child device data for version < 152
      tools/intel_vbt_decode: abstract child devices printing more
      meson: don't assume xmlrpc-c-config is there
      meson: intel_dp_compliance depends on libudev

Jason Ekstrand (5):
      lib: Add some syncobj helpers (v2)
      tests/syncobj: Convert the basic test over to the helpers
      tests/syncobj: Add some wait and reset tests (v7)
      syncobj: Add a test for SYNCOBJ_CREATE_SIGNALED
      igt/syncobj_wait: Don't close the timeline early in wait_snapshot

Jordan Justen (1):
      intel_aubdump: Default to 48-bit AUBs when the gen is unknown

Joseph Garvey (1):
      igt/kms_rotation_crc: Add horizontal flip subtest.

Lionel Landwerlin (9):
      debugger/overlay/tools: make sure to include embedded drm-uapi headers
      include/drm-uapi: bump headers
      tests/perf: drop copied i915 defines/structs
      tests/perf: factorize max oa buffer size define
      tests/perf: query CS timestamp frequency if available
      tests/perf: enable testing on Coffeelake GT3
      tests/perf: add test config uuid for Cannonlake
      tests/perf: skip config tests on older kernels
      overlay: parse tracepoints from sysfs to figure out fields' location

Lucas De Marchi (3):
      lib/i915_pciids.h: synchronize with kernel header
      lib/i915_pciids.h: synchronize with kernel header
      meson: use message() rather than warning()

Maarten Lankhorst (39):
      tests/debugfs_test: Try to light all outputs to increase chances of f=
inding fails, v3.
      tests/pm_backlight: Enable connected output to allow tests to succeed=
, v4.
      tests/drm_read: Change tests to not require fbcon
      lib/igt_kms: Rework connector properties to be more atomic, v2.
      lib/igt_kms: Rework plane properties to be more atomic, v5.
      lib/igt_kms: Rework pipe properties to be more atomic, v7.
      lib/igt_kms: Allow setting any plane property through the universal p=
ath
      lib/igt_kms: Allow setting any output property through the !atomic pa=
ths
      lib/igt_kms: Export property blob functions for output/pipe/plane, v2.
      lib/igt_kms: Unexport broadcast rgb API.
      lib/igt_kms: Add igt_$obj_has_prop functions, v2.
      lib/igt_kms: Add igt_$obj_get_prop functions
      lib/igt_kms: Remove igt_pipe_get_property
      lib/igt_kms: Remove igt_crtc_set_background()
      tests/kms_color: Rework tests slightly to work better with new atomic=
 api
      tests/chamelium: Remove reliance on output->config.pipe
      tests/kms_atomic: Convert/rewrite tests to use igt_kms framework, v2.
      tests/kms_concurrent: Fix testcase fails.
      tests/kms_plane_lowres: Rework tests to work without fbcon, v3.
      tests/kms_atomic_transition: Do not update unbound planes.
      lib/igt_kms: Only print changed mode objects during atomic commit.
      lib/igt_debugfs: Use fstat instead of open for testing CRC support.
      lib/igt_debugfs: Remove support for legacy CRC api.
      tests/debugfs_test: Pretty print subdirectories
      Revert "tests/kms_flip: Make flip-vs-panning-vs-hang change DSPSURF"
      overlay: Fix compiler warning when compiling with recent gcc.
      lib/igt_kms: Add igt_display_reset function, v3.
      lib/igt_kms: Make igt_output_from_connector probe all outputs
      tests/chamelium: Only initialize igt_display once
      tests: Rename chamelium to kms_chamelium.
      tests: Regenerate testlist when Makefile is changed, v2.
      lib/igt_kms: Handle changing rotation property correctly
      tests/kms_vblank: Add test to ensure DRM_CAP_CRTC_IN_VBLANK_EVENT wor=
ks correctly
      tests/kms_color: Rename pipe tests to standard notation
      lib/igt_kms: Drop all stale events on first commit.
      tests/kms_cursor_legacy: Perform lazy cleanup between tests
      tests/kms_cursor_legacy: Rework the 2x-*-vs-cursor-* tests.
      kms_atomic_transition: Remove skip_on_unsupported_nonblocking_modeset.
      lib/igt_kms: Add more braces around macros

Mahesh Kumar (1):
      tests/kms_plane: Run test for all supported pixel formats, v2.

Marta Lofstedt (1):
      test/kms_psr_sink_crc - subtests psr_basic and psr_drrs need test cle=
anup

Michal Wajdeczko (2):
      lib/igt_sysfs: Let igt_sysfs_read|write return -errno
      tests/kms_frontbuffer_tracking: Correctly handle debugfs errors

Micha=C5=82 Winiarski (5):
      lib: Extract helpers for determining submission method
      lib/i915: Extract helpers for determining scheduler capabilities
      lib/i915: Move context related helpers to lib/i915/gem_context
      lib/i915: Extract context priority setparam to a helper
      lib/i915: Move submission related helpers to lib/i915/gem_submission

Mika Kahola (1):
      tools: Cannonlake port clock programming

Mike Frysinger (1):
      include inttypes.h for PRI defines

Petri Latvala (18):
      run-tests.sh: Use piglit names when listing available tests
      tests/gem_eio: Nerf in-flight-suspend
      lib/igt_gt: Add sentinel to intel_execution_engines2
      lib: Make sure intel_aub.h gets packed in dist
      meson: Don't install headers
      meson: Don't install selfcheck binaries
      meson: Install benchmarks to $libexec/intel-gpu-tools/benchmarks
      meson: Install test-list.txt to libexecdir
      meson: Also install gem_stress.
      meson: Install .testlist files and README from tests/intel-ci
      lib/igt_kms.c: Unconditionally include poll.h
      run-tests.sh: Allow users to override IGT_TEST_ROOT
      tools: Update .gitignore
      meson: Build cnl_compute_wrpll
      meson: Add quotes in man/rst2man.sh
      meson: Add quotes in assembler/test/run-test.sh
      meson: Name the project intel-gpu-tools
      Update NEWS, bump version to 1.21.

Radoslaw Szwichtenberg (1):
      tests/pm_rps: Move some test logic out of boost function

Rhys Kidd (2):
      assembler: Fix bashism in run-test.sh
      overlay: Update .gitignore

Scott D Phillips (4):
      lib: copy intel_aub.h from libdrm
      tools/intel_aubdump: Set addr_bits before write_header
      lib/intel_aub: Add new MEM_TRACE commands
      tools/intel_aubdump: Add ability to simulate execlist submission

Thierry Reding (4):
      tests/perf: Fix a bunch of warnings on 32-bit systems
      tools/aubdump: Avoid ISO C90 warning
      lib: Fix compilation on non-x86
      lib/drmtest: Fix typo

Tvrtko Ursulin (26):
      igt/gem_exec_fence: Add subtest for invalid flags
      intel-gpu-overlay: Move local perf implementation to a library
      intel-gpu-overlay: Consolidate perf PMU access to library
      lib/perf: Fix data types and general tidy
      intel-gpu-overlay: Fix interrupts PMU readout
      intel-gpu-overlay: Catch-up to new i915 PMU
      intel-gpu-overlay: Use RAPL PMU for power reading
      tests/perf_pmu: Tests for i915 PMU API
      gem_wsim: Busy stats balancers
      media-bench.pl: Add busy balancers to the list
      gem_syslatency: Avoid arithmetic on void * warning
      intel_gvtg_test: Handle system(3) return value.
      lib/core: Avoid unused result in backtrace printing
      tests/perf_pmu: Make the invalid-init failure place more obvious
      tests/perf_pmu: Bump measuring duration for semaphores as well
      intel/pmu: Catch-up with i915 RC6 aggregation changes
      tests/perf_pmu: Sync invalid-init with i915 changes
      scripts/trace.pl: Auto-detect tracepoint field order
      scripts/trace.pl: Remove some old code
      scripts/trace.pl: Fix ring ignore
      scripts/trace.pl: Fix context id recycling
      lib/dummyload: Support returning output fence
      tests/perf_pmu: Simplify interrupt testing
      scripts/trace.pl: Optimize event parsing and processing
      tests/perf_pmu: Verify busyness when PMU is enabled after engine got =
busy
      tests/perf_pmu: Exercise busy stats and lite-restore

Ville Syrj=C3=A4l=C3=A4 (12):
      lib/igt_kms: Don't assert on non-existent plane
      tests/kms_draw_crc: Skip tests for unsupported formats
      meson: Make syncobj tests build
      tools/intel_watermark: Print linetime wms in usec
      tools/intel_watermark: Eliminate pointless %s in printf()
      tools/intel_watermark: Polish SKL+ register dump output a bit
      tools/intel_watermark: Dump WM_LINETIME on SKL+
      tools/intel_watermark: Silence gcc7 snprintf() warnings
      tools/intel_watermark: Refactor reg name stuff
      tools/intel_watermark: Clean up SKL plane names
      tools/intel_watermark: Clean up formatting
      tools/intel_watermark: Right justify register names

Vinay Belgaumkar (1):
      lib/igt_gt: Allow non-default contexts to hang non-render rings

git tag: intel-gpu-tools-1.21

https://xorg.freedesktop.org/archive/individual/app/intel-gpu-tools-1.21.ta=
r.xz
MD5:  94125e46d528b67b060ba98f3c2e3bee  intel-gpu-tools-1.21.tar.xz
SHA1: 05568e031a88fde56f8a1651b4ab4361608db796  intel-gpu-tools-1.21.tar.xz
SHA256: d9af6e7a24cb22e5b6ff8db03a0e6b230f08c17908cedee59e8795d74e18703f  i=
ntel-gpu-tools-1.21.tar.xz
SHA512: 44b2367bc4647c4a1dfbe3198903498c17c158ddee548a48c57e26869d893f61606=
682ffe50281af12216d58cc3f7088a6579578431141074863ea9d1d302b5f  intel-gpu-to=
ols-1.21.tar.xz
PGP: https://xorg.freedesktop.org/archive/individual/app/intel-gpu-tools-1.=
21.tar.xz.sig


--kbrqmrcy32hg2q3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd1lluFZQGVrOd+GNc3AFXbdMJHUFAlpeD+0ACgkQc3AFXbdM
JHU4RhAAtvkKbMAwWBUg+y9R29ky9yNwLHJG39h4pzIes+YaTz8R9eLSDlL8AD1z
SRipoyXIvlNy8/62gXBcghmi8lbqNIm0xZnpmr6dYfI04GMvP75sTtvpD3ACCKVE
UV/UtbREi/XI+/JuNlTGDAVIixa5A70xAGGL7kqQZG+9A/V475/SG+GzJOngYnsR
v1RnD0iK+qDYHBDsaftJt4Lkx9dXh16ld3/lb1eL0aJpMAdAx+DNhF1C9weQbTfW
65ruc2d4OksYRAGN7+CkHL8gzm3U6MvbAFPT6RYgI3egDfXcQSQQGwZLXDqY2lGi
RFkRFSgLrWS4CT0FHwSCka3cqpSZVQRT4gztLnB0IFUzEvR/a3B3hqBtKxP/YW32
UO3uwhSMwGws5ppnkjehvfJcJdrANk/u8bAFTOqhbau5Pjbqt6y26eoon1Sj8/ec
S0aFO8MGcRNTuC4L3x+dUzBpzQBiFABBjPFVhauoc1leOT4IboygJFAyjlxpLaKZ
vhQnIT69rlC9k9NAF4H5K+WOFOrh290B8m5okkHlAf4QL9wt6u/8dXIhj8icakMl
ImLhP02uuIOG4Hjwm9wIgLMB57hFvMP4T6W5UL+5bYiio8ckPXPzqzbfcDRmnH1N
uhCzy6aJTPw3cmQy1yXip1JVlbLYf4fwzc4ZkjU2AleIeFaa/R8=
=ox57
-----END PGP SIGNATURE-----

--kbrqmrcy32hg2q3d--

--===============1748291907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============1748291907==--
