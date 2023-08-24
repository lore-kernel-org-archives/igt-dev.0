Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aurabindo Pillai" <aurabindo.pillai@amd.com>
Date: Thu, 24 Aug 2023 17:41:44 -0000
Message-ID: <169289890480.13341.5513496301670975207@emeril.freedesktop.org>
References: <20230824161504.154365-1-aurabindo.pillai@amd.com>
In-Reply-To: <20230824161504.154365-1-aurabindo.pillai@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBzZXJp?=
 =?utf-8?q?es_starting_with_=5B1/3=5D_tests/amdgpu/amd=5Fmall=3A_Add_crc_c?=
 =?utf-8?q?heck?=
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

Series: series starting with [1/3] tests/amdgpu/amd_mall: Add crc check
URL   : https://patchwork.freedesktop.org/series/122852/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa tests/amdgpu: Fix build error due to external file include

Tail of build.log:
[402/1626] Compiling C object 'tests/59830eb@@kms_plane@exe/kms_plane.c.o'.
[403/1626] Compiling C object 'tests/59830eb@@kms_rotation_crc@exe/kms_rotation_crc.c.o'.
[404/1626] Compiling C object 'tests/59830eb@@i915_suspend@exe/i915_i915_suspend.c.o'.
[405/1626] Compiling C object 'tests/59830eb@@gem_caching@exe/i915_gem_caching.c.o'.
[406/1626] Compiling C object 'tests/59830eb@@sw_sync@exe/sw_sync.c.o'.
[407/1626] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[408/1626] Generating intel_lid.1 with a custom command.
[409/1626] Compiling C object 'tests/59830eb@@kms_lease@exe/kms_lease.c.o'.
[410/1626] Generating intel_upload_blit_large_gtt.1 with a custom command.
[411/1626] Generating intel_reg.1 with a custom command.
[412/1626] Compiling C object 'tests/59830eb@@gem_ctx_freq@exe/i915_gem_ctx_freq.c.o'.
[413/1626] Compiling C object 'tests/59830eb@@vgem_basic@exe/vgem_basic.c.o'.
[414/1626] Compiling C object 'tests/59830eb@@testdisplay@exe/testdisplay.c.o'.
[415/1626] Generating intel_stepping.1 with a custom command.
[416/1626] Compiling C object 'tests/59830eb@@gem_close_race@exe/i915_gem_close_race.c.o'.
[417/1626] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[418/1626] Generating intel_upload_blit_small.1 with a custom command.
[419/1626] Generating intel_panel_fitter.1 with a custom command.
[420/1626] Generating intel_upload_blit_large.1 with a custom command.
[421/1626] Generating intel_upload_blit_large_map.1 with a custom command.
[422/1626] Generating intel_vbt_decode.1 with a custom command.
[423/1626] Compiling C object 'tests/59830eb@@syncobj_wait@exe/syncobj_wait.c.o'.
[424/1626] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[425/1626] Compiling C object 'tests/59830eb@@gem_ctx_create@exe/i915_gem_ctx_create.c.o'.
[426/1626] Compiling C object 'tests/59830eb@@gem_evict_alignment@exe/i915_gem_evict_alignment.c.o'.
[427/1626] Compiling C object 'tests/59830eb@@gem_create@exe/i915_gem_create.c.o'.
[428/1626] Compiling C object 'tests/59830eb@@drm_fdinfo@exe/i915_drm_fdinfo.c.o'.
[429/1626] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_c@sta/igt_chamelium.c.o'.
[430/1626] Compiling C object 'tests/59830eb@@prime_vgem@exe/prime_vgem.c.o'.
[431/1626] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[432/1626] Compiling C object 'tests/59830eb@@gem_ctx_switch@exe/i915_gem_ctx_switch.c.o'.
[433/1626] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[434/1626] Compiling C object 'tests/59830eb@@api_intel_allocator@exe/i915_api_intel_allocator.c.o'.
[435/1626] Compiling C object 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'.
[436/1626] Compiling C object 'tests/59830eb@@kms_big_fb@exe/i915_kms_big_fb.c.o'.
[437/1626] Compiling C object 'tests/59830eb@@gem_blits@exe/i915_gem_blits.c.o'.
[438/1626] Compiling C object 'tests/59830eb@@gem_ctx_engines@exe/i915_gem_ctx_engines.c.o'.
[439/1626] Compiling C object 'tests/59830eb@@gem_busy@exe/i915_gem_busy.c.o'.
[440/1626] Compiling C object 'tests/59830eb@@gem_ctx_isolation@exe/i915_gem_ctx_isolation.c.o'.
[441/1626] Compiling C object 'tests/59830eb@@syncobj_timeline@exe/syncobj_timeline.c.o'.
[442/1626] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[443/1626] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/i915_gem_userptr_blits.c.o'.
[444/1626] Compiling C object 'tests/59830eb@@gem_eio@exe/i915_gem_eio.c.o'.
[445/1626] Compiling C object 'tests/59830eb@@api_intel_bb@exe/i915_api_intel_bb.c.o'.
[446/1626] Compiling C object 'tests/59830eb@@gem_ctx_shared@exe/i915_gem_ctx_shared.c.o'.
[447/1626] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[448/1626] Compiling C object 'tests/59830eb@@gem_concurrent_blit@exe/i915_gem_concurrent_blit.c.o'.
[449/1626] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[450/1626] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.

