Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2Cv5=2C1/6=5D_lib=3A_Add_blt_command_properties_for_lunarlak?=
 =?utf-8?q?e?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Date: Tue, 12 Dec 2023 01:43:23 -0000
Message-ID: <170234540336.31291.13396704865224769193@emeril.freedesktop.org>
References: <cover.1702386259.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1702386259.git.akshata.jahagirdar@intel.com>
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

Series: series starting with [i-g-t,v5,1/6] lib: Add blt command properties for lunarlake
URL   : https://patchwork.freedesktop.org/series/127658/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
0b796be8ce05cb2070ce5136d248f438c962d11e tests/intel: Add Xe peer2peer test

Tail of build.log:
[418/1665] Compiling C object 'tests/59830eb@@gem_ctx_exec@exe/intel_gem_ctx_exec.c.o'.
[419/1665] Compiling C object 'tests/59830eb@@gem_exec_big@exe/intel_gem_exec_big.c.o'.
[420/1665] Compiling C object 'tests/59830eb@@gem_ctx_sseu@exe/intel_gem_ctx_sseu.c.o'.
[421/1665] Compiling C object 'tests/59830eb@@gem_ctx_param@exe/intel_gem_ctx_param.c.o'.
[422/1665] Compiling C object 'tests/59830eb@@prime_vgem@exe/prime_vgem.c.o'.
[423/1665] Compiling C object 'tests/59830eb@@gem_exec_lut_handle@exe/intel_gem_exec_lut_handle.c.o'.
[424/1665] Compiling C object 'tests/59830eb@@gem_exec_gttfill@exe/intel_gem_exec_gttfill.c.o'.
[425/1665] Compiling C object 'tests/59830eb@@gem_exec_alignment@exe/intel_gem_exec_alignment.c.o'.
[426/1665] Compiling C object 'tests/59830eb@@gem_create@exe/intel_gem_create.c.o'.
[427/1665] Compiling C object 'tests/59830eb@@gem_ctx_isolation@exe/intel_gem_ctx_isolation.c.o'.
[428/1665] Compiling C object 'tests/59830eb@@gem_ctx_create@exe/intel_gem_ctx_create.c.o'.
[429/1665] Compiling C object 'tests/59830eb@@gem_evict_everything@exe/intel_gem_evict_everything.c.o'.
[430/1665] Compiling C object 'tests/59830eb@@gem_exec_parallel@exe/intel_gem_exec_parallel.c.o'.
[431/1665] Compiling C object 'tests/59830eb@@gem_ctx_engines@exe/intel_gem_ctx_engines.c.o'.
[432/1665] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o'.
[433/1665] Compiling C object 'tests/59830eb@@gem_ccs@exe/intel_gem_ccs.c.o'.
[434/1665] Generating i915-perf-metrics-acmgt3 with a custom command.
[435/1665] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[436/1665] Compiling C object 'lib/76b5a35@@igt-igt_core_c@sta/igt_core.c.o'.
[437/1665] Compiling C object 'tests/59830eb@@gem_busy@exe/intel_gem_busy.c.o'.
[438/1665] Compiling C object 'tests/59830eb@@gem_blits@exe/intel_gem_blits.c.o'.
[439/1665] Compiling C object 'tests/59830eb@@api_intel_allocator@exe/intel_api_intel_allocator.c.o'.
[440/1665] Compiling C object 'tests/59830eb@@gen7_exec_parse@exe/intel_gen7_exec_parse.c.o'.
[441/1665] Compiling C object 'tests/59830eb@@gem_ctx_switch@exe/intel_gem_ctx_switch.c.o'.
[442/1665] Compiling C object 'tests/59830eb@@syncobj_timeline@exe/syncobj_timeline.c.o'.
[443/1665] Compiling C object 'tests/59830eb@@gem_exec_params@exe/intel_gem_exec_params.c.o'.
[444/1665] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen8_c@sta/rendercopy_gen8.c.o'.
[445/1665] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[446/1665] Compiling C object 'tests/59830eb@@gem_ctx_persistence@exe/intel_gem_ctx_persistence.c.o'.
[447/1665] Compiling C object 'lib/76b5a35@@igt-igt_chamelium_c@sta/igt_chamelium.c.o'.
[448/1665] Compiling C object 'tests/59830eb@@gem_exec_capture@exe/intel_gem_exec_capture.c.o'.
[449/1665] Compiling C object 'tests/59830eb@@drm_fdinfo@exe/intel_drm_fdinfo.c.o'.
[450/1665] Compiling C object 'lib/76b5a35@@igt-rendercopy_gen9_c@sta/rendercopy_gen9.c.o'.
[451/1665] Compiling C object 'tests/59830eb@@gem_exec_flush@exe/intel_gem_exec_flush.c.o'.
[452/1665] Compiling C object 'tests/59830eb@@gen9_exec_parse@exe/intel_gen9_exec_parse.c.o'.
[453/1665] Compiling C object 'tests/59830eb@@gem_eio@exe/intel_gem_eio.c.o'.
[454/1665] Compiling C object 'tests/59830eb@@gem_exec_fair@exe/intel_gem_exec_fair.c.o'.
[455/1665] Compiling C object 'tests/59830eb@@gem_ctx_shared@exe/intel_gem_ctx_shared.c.o'.
[456/1665] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[457/1665] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[458/1665] Compiling C object 'tests/59830eb@@api_intel_bb@exe/intel_api_intel_bb.c.o'.
[459/1665] Compiling C object 'tests/59830eb@@gem_exec_latency@exe/intel_gem_exec_latency.c.o'.
[460/1665] Compiling C object 'tests/59830eb@@gem_exec_nop@exe/intel_gem_exec_nop.c.o'.
[461/1665] Compiling C object 'tests/59830eb@@gem_concurrent_blit@exe/intel_gem_concurrent_blit.c.o'.
[462/1665] Compiling C object 'lib/76b5a35@@igt-igt_fb_c@sta/igt_fb.c.o'.
[463/1665] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
[464/1665] Compiling C object 'tests/59830eb@@gem_exec_balancer@exe/intel_gem_exec_balancer.c.o'.
[465/1665] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[466/1665] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.

