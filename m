Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Mon, 18 Sep 2023 11:50:48 -0000
Message-ID: <169503784835.32417.8415246945971628867@emeril.freedesktop.org>
References: <20230918075448.247197-1-swati2.sharma@intel.com>
In-Reply-To: <20230918075448.247197-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=5Fvblank=3A_Test_cleanup_and_dynamic_conversion?=
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

Series: tests/kms_vblank: Test cleanup and dynamic conversion
URL   : https://patchwork.freedesktop.org/series/123847/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 tests/intel/xe_query: Print XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY value

Tail of build.log:
[382/1636] Compiling C object 'tests/59830eb@@kms_vrr@exe/kms_vrr.c.o'.
[383/1636] Compiling C object 'tests/59830eb@@testdisplay@exe/testdisplay_hotplug.c.o'.
[384/1636] Compiling C object 'tests/59830eb@@gen3_render_linear_blits@exe/intel_gen3_render_linear_blits.c.o'.
[385/1636] Compiling C object 'tests/59830eb@@kms_tiled_display@exe/kms_tiled_display.c.o'.
[386/1636] Compiling C object 'tests/59830eb@@gem_basic@exe/intel_gem_basic.c.o'.
[387/1636] Compiling C object 'tests/59830eb@@gem_compute@exe/intel_gem_compute.c.o'.
[388/1636] Compiling C object 'tests/59830eb@@gen3_render_tiledy_blits@exe/intel_gen3_render_tiledy_blits.c.o'.
[389/1636] Compiling C object 'tests/59830eb@@gen3_render_tiledx_blits@exe/intel_gen3_render_tiledx_blits.c.o'.
[390/1636] Compiling C object 'tests/59830eb@@gen3_render_mixed_blits@exe/intel_gen3_render_mixed_blits.c.o'.
[391/1636] Compiling C object 'tests/59830eb@@debugfs_test@exe/intel_debugfs_test.c.o'.
[392/1636] Compiling C object 'tests/59830eb@@gem_close@exe/intel_gem_close.c.o'.
[393/1636] Generating i915-perf-registers-acmgt3 with a custom command.
[394/1636] Compiling C object 'tests/59830eb@@gem_ctx_bad_destroy@exe/intel_gem_ctx_bad_destroy.c.o'.
[395/1636] Compiling C object 'tests/59830eb@@gem_bad_reloc@exe/intel_gem_bad_reloc.c.o'.
[396/1636] Compiling C object 'tests/59830eb@@gem_close_race@exe/intel_gem_close_race.c.o'.
[397/1636] Compiling C object 'tests/59830eb@@gen3_mixed_blits@exe/intel_gen3_mixed_blits.c.o'.
[398/1636] Compiling C object 'tests/59830eb@@gem_cs_tlb@exe/intel_gem_cs_tlb.c.o'.
[399/1636] Compiling C object 'tests/59830eb@@sw_sync@exe/sw_sync.c.o'.
[400/1636] Compiling C object 'tests/59830eb@@testdisplay@exe/testdisplay.c.o'.
[401/1636] Compiling C object 'tests/59830eb@@prime_mmap_kms@exe/intel_prime_mmap_kms.c.o'.
[402/1636] Compiling C object 'tests/59830eb@@kms_properties@exe/kms_properties.c.o'.
[403/1636] Compiling C object 'tests/59830eb@@kms_universal_plane@exe/kms_universal_plane.c.o'.
[404/1636] Compiling C object 'tests/59830eb@@gem_caching@exe/intel_gem_caching.c.o'.
[405/1636] Compiling C object 'tests/59830eb@@kms_setmode@exe/kms_setmode.c.o'.
[406/1636] Compiling C object 'tests/59830eb@@sysfs_heartbeat_interval@exe/intel_sysfs_heartbeat_interval.c.o'.
[407/1636] Generating i915-perf-metrics-acmgt3 with a custom command.
[408/1636] Compiling C object 'tests/59830eb@@vgem_basic@exe/vgem_basic.c.o'.
[409/1636] Compiling C object 'tests/59830eb@@kms_rotation_crc@exe/kms_rotation_crc.c.o'.
[410/1636] Compiling C object 'tests/59830eb@@gem_create@exe/intel_gem_create.c.o'.
[411/1636] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[412/1636] Compiling C object 'tests/59830eb@@syncobj_wait@exe/syncobj_wait.c.o'.
[413/1636] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[414/1636] Compiling C object 'tests/59830eb@@gem_busy@exe/intel_gem_busy.c.o'.
[415/1636] Compiling C object 'tests/59830eb@@gem_ccs@exe/intel_gem_ccs.c.o'.
[416/1636] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[417/1636] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[418/1636] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_c@sta/igt_chamelium.c.o'.
[419/1636] Compiling C object 'tests/59830eb@@api_intel_allocator@exe/intel_api_intel_allocator.c.o'.
[420/1636] Compiling C object 'tests/59830eb@@gem_blits@exe/intel_gem_blits.c.o'.
[421/1636] Compiling C object 'tests/59830eb@@syncobj_timeline@exe/syncobj_timeline.c.o'.
[422/1636] Compiling C object 'tests/59830eb@@prime_vgem@exe/prime_vgem.c.o'.
[423/1636] Compiling C object 'tests/59830eb@@drm_fdinfo@exe/intel_drm_fdinfo.c.o'.
[424/1636] Compiling C object 'tests/59830eb@@api_intel_bb@exe/intel_api_intel_bb.c.o'.
[425/1636] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[426/1636] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[427/1636] Compiling C object 'tests/59830eb@@gem_concurrent_blit@exe/intel_gem_concurrent_blit.c.o'.
[428/1636] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[429/1636] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[430/1636] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.

