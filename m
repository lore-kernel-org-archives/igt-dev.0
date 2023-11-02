Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Date: Thu, 02 Nov 2023 12:04:29 -0000
Message-ID: <169892666918.28156.4801581911396453109@emeril.freedesktop.org>
References: <20231102110656.2381729-1-jesse.zhang@amd.com>
In-Reply-To: <20231102110656.2381729-1-jesse.zhang@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/amdgpu=3A_add_amdgpu_test_suite?=
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

Series: tests/amdgpu: add amdgpu test suite
URL   : https://patchwork.freedesktop.org/series/125892/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
9e3c3791e7e0297f277211b19a3388a1ee87f3d0 scripts/test_list.py: fix subtest regex match

Tail of build.log:
[410/1711] Compiling C object 'tests/59830eb@@kms_universal_plane@exe/kms_universal_plane.c.o'.
[411/1711] Compiling C object 'tests/59830eb@@gem_ctx_bad_destroy@exe/intel_gem_ctx_bad_destroy.c.o'.
[412/1711] Compiling C object 'tests/59830eb@@sw_sync@exe/sw_sync.c.o'.
[413/1711] Compiling C object 'tests/59830eb@@gem_basic@exe/intel_gem_basic.c.o'.
[414/1711] Compiling C object 'tests/59830eb@@kms_setmode@exe/kms_setmode.c.o'.
[415/1711] Compiling C object 'tests/59830eb@@gem_bad_reloc@exe/intel_gem_bad_reloc.c.o'.
[416/1711] Compiling C object 'tests/59830eb@@gem_compute@exe/intel_gem_compute.c.o'.
[417/1711] Compiling C object 'tests/59830eb@@amd_uvd_enc@exe/amdgpu_amd_uvd_enc.c.o'.
[418/1711] Compiling C object 'tests/59830eb@@testdisplay@exe/testdisplay.c.o'.
[419/1711] Compiling C object 'tests/59830eb@@vgem_basic@exe/vgem_basic.c.o'.
[420/1711] Compiling C object 'tests/59830eb@@kms_rotation_crc@exe/kms_rotation_crc.c.o'.
[421/1711] Compiling C object 'tests/59830eb@@gem_close@exe/intel_gem_close.c.o'.
[422/1711] Compiling C object 'tests/59830eb@@amd_basic@exe/amdgpu_amd_basic.c.o'.
[423/1711] Compiling C object 'tests/59830eb@@amd_uvd_dec@exe/amdgpu_amd_uvd_dec.c.o'.
[424/1711] Compiling C object 'tests/59830eb@@syncobj_wait@exe/syncobj_wait.c.o'.
[425/1711] Compiling C object 'tests/59830eb@@gem_cs_tlb@exe/intel_gem_cs_tlb.c.o'.
[426/1711] Compiling C object 'tests/59830eb@@gem_caching@exe/intel_gem_caching.c.o'.
[427/1711] Compiling C object 'assembler/1ca89e8@@brw@sta/brw_disasm.c.o'.
[428/1711] Compiling C object 'tests/59830eb@@gem_close_race@exe/intel_gem_close_race.c.o'.
[429/1711] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[430/1711] Generating i915-perf-registers-acmgt3 with a custom command.
[431/1711] Compiling C object 'tests/59830eb@@gem_ctx_freq@exe/intel_gem_ctx_freq.c.o'.
[432/1711] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[433/1711] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[434/1711] Compiling C object 'tests/59830eb@@gem_create@exe/intel_gem_create.c.o'.
[435/1711] Compiling C object 'tests/59830eb@@amd_vce_dec@exe/amdgpu_amd_vce_dec.c.o'.
[436/1711] Compiling C object 'tests/59830eb@@gem_ccs@exe/intel_gem_ccs.c.o'.
[437/1711] Generating i915-perf-metrics-acmgt3 with a custom command.
[438/1711] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[439/1711] Compiling C object 'tests/59830eb@@gem_ctx_engines@exe/intel_gem_ctx_engines.c.o'.
[440/1711] Compiling C object 'tests/59830eb@@api_intel_allocator@exe/intel_api_intel_allocator.c.o'.
[441/1711] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[442/1711] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_c@sta/igt_chamelium.c.o'.
[443/1711] Compiling C object 'tests/59830eb@@prime_vgem@exe/prime_vgem.c.o'.
[444/1711] Compiling C object 'tests/59830eb@@gem_ctx_create@exe/intel_gem_ctx_create.c.o'.
[445/1711] Compiling C object 'tests/59830eb@@drm_fdinfo@exe/intel_drm_fdinfo.c.o'.
[446/1711] Compiling C object 'tests/59830eb@@gem_blits@exe/intel_gem_blits.c.o'.
[447/1711] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[448/1711] Compiling C object 'tests/59830eb@@gem_busy@exe/intel_gem_busy.c.o'.
[449/1711] Compiling C object 'tests/59830eb@@syncobj_timeline@exe/syncobj_timeline.c.o'.
[450/1711] Compiling C object 'tests/59830eb@@amd_vcn@exe/amdgpu_amd_vcn.c.o'.
[451/1711] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[452/1711] Compiling C object 'tests/59830eb@@api_intel_bb@exe/intel_api_intel_bb.c.o'.
[453/1711] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[454/1711] Compiling C object 'tests/59830eb@@gem_concurrent_blit@exe/intel_gem_concurrent_blit.c.o'.
[455/1711] Compiling C object 'assembler/1ca89e8@@brw@sta/brw_eu_emit.c.o'.
[456/1711] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[457/1711] Generating i915-perf-equations with a custom command.
[458/1711] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
ninja: build stopped: subcommand failed.

