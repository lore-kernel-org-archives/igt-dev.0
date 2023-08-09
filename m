Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Wed, 09 Aug 2023 05:12:52 -0000
Message-ID: <169155797209.10296.4731653778243654937@emeril.freedesktop.org>
References: <20230809045740.275175-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230809045740.275175-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=5Fplane=5Fcursor=3A_Handle_invalid_pipe_in_big_joiner_=28?=
 =?utf-8?q?rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_plane_cursor: Handle invalid pipe in big joiner (rev3)
URL   : https://patchwork.freedesktop.org/series/119890/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
f12c2533941c9dfce43f455a02b7986605692b29 tests/amdgpu: Add test for MALL static screen cache scanout

Tail of build.log:
[134/1622] Compiling C object 'lib/76b5a35@@igt-i915_gem_context_c@sta/i915_gem_context.c.o'.
[135/1622] Compiling C object 'tests/59830eb@@kms_atomic_interruptible@exe/kms_atomic_interruptible.c.o'.
[136/1622] Compiling C object 'tests/59830eb@@kms_async_flips@exe/kms_async_flips.c.o'.
[137/1622] Compiling C object 'lib/76b5a35@@igt-igt_color_encoding_c@sta/igt_color_encoding.c.o'.
[138/1622] Compiling C object 'tests/59830eb@@kms_plane_lowres@exe/kms_plane_lowres.c.o'.
[139/1622] Compiling C object 'lib/76b5a35@@igt-i915_gem_submission_c@sta/i915_gem_submission.c.o'.
[140/1622] Compiling C object 'lib/76b5a35@@igt-i915_i915_crc_c@sta/i915_i915_crc.c.o'.
[141/1622] Compiling C object 'tests/59830eb@@kms_plane_multiple@exe/kms_plane_multiple.c.o'.
[142/1622] Compiling C object 'tests/59830eb@@kms_pipe_crc_basic@exe/kms_pipe_crc_basic.c.o'.
[143/1622] Compiling C object 'lib/76b5a35@@igt-drmtest_c@sta/drmtest.c.o'.
[144/1622] Compiling C object 'lib/76b5a35@@igt-igt_drm_fdinfo_c@sta/igt_drm_fdinfo.c.o'.
[145/1622] Compiling C object 'tests/59830eb@@kms_hdr@exe/kms_hdr.c.o'.
[146/1622] Compiling C object 'tests/59830eb@@kms_prop_blob@exe/kms_prop_blob.c.o'.
[147/1622] Compiling C object 'lib/76b5a35@@igt-i915_gem_mman_c@sta/i915_gem_mman.c.o'.
[148/1622] Compiling C object 'tests/59830eb@@kms_color@exe/kms_color.c.o'.
[149/1622] Compiling C object 'tests/59830eb@@kms_prime@exe/kms_prime.c.o'.
[150/1622] Compiling C object 'tests/59830eb@@gem_watchdog@exe/i915_gem_watchdog.c.o'.
[151/1622] Compiling C object 'tests/59830eb@@kms_content_protection@exe/kms_content_protection.c.o'.
[152/1622] Compiling C object 'lib/76b5a35@@igt-igt_gt_c@sta/igt_gt.c.o'.
[153/1622] Compiling C object 'tests/59830eb@@kms_getfb@exe/kms_getfb.c.o'.
[154/1622] Compiling C object 'tests/59830eb@@core_hotunplug@exe/core_hotunplug.c.o'.
[155/1622] Compiling C object 'lib/76b5a35@@igt-i915_gem_engine_topology_c@sta/i915_gem_engine_topology.c.o'.
[156/1622] Compiling C object 'tests/59830eb@@kms_plane_alpha_blend@exe/kms_plane_alpha_blend.c.o'.
[157/1622] Compiling C object 'lib/76b5a35@@igt-igt_device_c@sta/igt_device.c.o'.
[158/1622] Compiling C object 'lib/76b5a35@@igt-igt_collection_c@sta/igt_collection.c.o'.
[159/1622] Generating i915-perf-registers-acmgt2 with a custom command.
[160/1622] Compiling C object 'lib/76b5a35@@igt-igt_debugfs_c@sta/igt_debugfs.c.o'.
[161/1622] Generating i915-perf-metrics-acmgt2 with a custom command.
[162/1622] Compiling C object 'tests/59830eb@@gem_create@exe/i915_gem_create.c.o'.
[163/1622] Compiling C object 'lib/76b5a35@@igt_device_scan@sta/igt_device_scan.c.o'.
[164/1622] Compiling C object 'tests/59830eb@@kms_cursor_crc@exe/kms_cursor_crc.c.o'.
[165/1622] Compiling C object 'lib/76b5a35@@igt-i915_intel_memory_region_c@sta/i915_intel_memory_region.c.o'.
[166/1622] Compiling C object 'tests/59830eb@@gem_ctx_persistence@exe/i915_gem_ctx_persistence.c.o'.
[167/1622] Compiling C object 'lib/76b5a35@@igt-igt_halffloat_c@sta/igt_halffloat.c.o'.
[168/1622] Compiling C object 'tests/59830eb@@kms_properties@exe/kms_properties.c.o'.
[169/1622] Compiling C object 'tests/59830eb@@kms_addfb_basic@exe/kms_addfb_basic.c.o'.
[170/1622] Compiling C object 'tests/59830eb@@kms_plane@exe/kms_plane.c.o'.
[171/1622] Compiling C object 'tests/59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.o'.
[172/1622] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[173/1622] Compiling C object 'tests/59830eb@@kms_lease@exe/kms_lease.c.o'.
[174/1622] Compiling C object 'lib/76b5a35@@igt-igt_device_scan_c@sta/igt_device_scan.c.o'.
[175/1622] Compiling C object 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o'.
[176/1622] Compiling C object 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'.
[177/1622] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
[178/1622] Generating i915-perf-registers-acmgt3 with a custom command.
[179/1622] Generating i915-perf-metrics-acmgt3 with a custom command.
[180/1622] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[181/1622] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[182/1622] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.

