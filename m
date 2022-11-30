Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EA710E475
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Nov 2022 15:05:46 +0000 (UTC)
Date: Wed, 30 Nov 2022 16:05:39 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20221130150539.bec6lxxbp2thwg3d@zkempczy-mobl2>
References: <20221129151220.131979-1-zbigniew.kempczynski@intel.com>
 <166975879107.23272.16574034443243498481@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166975879107.23272.16574034443243498481@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_remnants_in_i915_code_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 29, 2022 at 09:53:11PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Remove libdrm remnants in i915 code (rev3)                     
>    URL:     https://patchwork.freedesktop.org/series/111200/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8169/index.html 
> 
>          CI Bug Log - changes from CI_DRM_12444_full -> IGTPW_8169_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_8169_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_8169_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8169/index.html
> 
> Participating hosts (10 -> 8)
> 
>    Missing (2): pig-skl-6260u pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_8169_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>           * shard-apl: PASS -> INCOMPLETE +2 similar issues

Unrelated to libdrm removal.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a4:
>           * {shard-dg1}: PASS -> FAIL
> 
> Known issues
> 
>    Here are the changes found in IGTPW_8169_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ctx_param@set-priority-not-supported:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109314)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109314)
> 
>      * igt@gem_ctx_persistence@many-contexts:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#2410)
>      * igt@gem_exec_balancer@parallel-contexts:
> 
>           * shard-iclb: PASS -> SKIP (i915#4525) +1 similar issue
>      * igt@gem_exec_endless@dispatch@vcs1:
> 
>           * shard-tglb: NOTRUN -> TIMEOUT (i915#3778)
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-tglb: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-none-vip@rcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#2842)
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#2842)
> 
>      * igt@gem_exec_params@no-blt:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109283)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109283)
> 
>      * igt@gem_exec_params@secure-non-root:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#112283) +1 similar issue
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#112283) +1 similar issue
> 
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4613) +3 similar issues
>      * igt@gem_lmem_swapping@parallel-random-verify:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +4 similar
>             issues
>      * igt@gem_lmem_swapping@verify:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4613) +3 similar issues
>      * igt@gem_pxp@reject-modify-context-protection-off-2:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4270) +2 similar issues
>      * igt@gem_pxp@reject-modify-context-protection-on:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4270) +3 similar issues
>      * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#768)
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3297)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3297)
> 
>      * igt@gen3_render_tiledx_blits:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109289) +2 similar issues
>      * igt@gen9_exec_parse@shadow-peek:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2856) +1 similar issue
> 
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5286) +3 similar issues
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5286) +2 similar issues
>      * igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110725 / fdo#111614) +1 similar
>             issue
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +119 similar issues
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111614) +2 similar issues
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110723) +2 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615) +3 similar issues
>      * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +4 similar
>             issues
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886) +1 similar
>             issue
> 
>      * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +1 similar
>             issue
>      * igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6095) +1 similar issue
>      * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +13 similar issues
>      * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689) +3 similar issues
>      * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#6095)
>      * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689) +2 similar
>             issues
>      * igt@kms_chamelium@hdmi-audio-edid:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +4 similar
>             issues
>      * igt@kms_chamelium@vga-hpd:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +4 similar
>             issues
>      * igt@kms_color_chamelium@degamma:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +3 similar
>             issues
>      * igt@kms_content_protection@lic:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#7118)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#7118)
> 
>      * igt@kms_cursor_crc@cursor-random-512x512:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3359)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3359)
> 
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274)
>      * igt@kms_flip@2x-blocking-wf_vblank:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +6 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825 / i915#3637)
>             +3 similar issues
> 
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-default-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672) +3 similar issues
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2587 / i915#2672) +5 similar
>             issues
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2587 / i915#2672)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +18 similar
>             issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6497) +6 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5438)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5439)
> 
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +15 similar issues
>      * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109289) +2 similar issues
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825)
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109642 / fdo#111068 / i915#658)
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#7037)
> 
>      * igt@kms_psr@psr2_cursor_blt:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +3 similar issues
>      * igt@kms_psr@psr2_sprite_render:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467) +2 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109441) +1 similar issue
> 
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-iclb: PASS -> SKIP (i915#5519)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#5289)
>      * igt@kms_setmode@clone-exclusive-crtc:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3555) +2 similar issues
>      * igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3555) +2 similar issues
>      * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
> 
>           * shard-tglb: PASS -> INCOMPLETE (i915#7500)
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2437)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2437)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2437)
> 
>      * igt@prime_vgem@fence-flip-hang:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109295)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109295)
> 
>      * igt@sysfs_clients@busy:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2994) +1 similar issue
>      * igt@sysfs_clients@sema-25:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2994)
> 
>     Possible fixes
> 
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * {shard-rkl}: SKIP (i915#3281) -> PASS +7 similar issues
>      * igt@gem_exec_balancer@parallel-bb-first:
> 
>           * shard-iclb: SKIP (i915#4525) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-iclb: FAIL (i915#2842) -> PASS +2 similar issues
>      * igt@gem_ppgtt@blt-vs-render-ctxn:
> 
>           * {shard-rkl}: FAIL (i915#3692) -> PASS
>      * igt@gem_tiled_partial_pwrite_pread@writes:
> 
>           * {shard-rkl}: SKIP (i915#3282) -> PASS +1 similar issue
>      * igt@gen9_exec_parse@batch-zero-length:
> 
>           * {shard-rkl}: SKIP (i915#2527) -> PASS +1 similar issue
>      * igt@i915_pm_rpm@cursor-dpms:
> 
>           * {shard-rkl}: SKIP (i915#1849) -> PASS
>      * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * {shard-rkl}: SKIP (i915#1397) -> PASS
>      * igt@i915_pm_rps@engine-order:
> 
>           * shard-apl: FAIL (i915#6537) -> PASS
>      * igt@i915_suspend@forcewake:
> 
>           * {shard-rkl}: FAIL (fdo#103375) -> PASS
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
> 
>           * {shard-rkl}: SKIP (i915#1845 / i915#4098) -> PASS +17 similar
>             issues
>      * igt@kms_cursor_legacy@flip-vs-cursor@varying-size:
> 
>           * shard-iclb: FAIL (i915#2346) -> PASS +2 similar issues
>      * igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#4098) -> PASS +7 similar
>             issues
>      * igt@kms_properties@plane-properties-atomic:
> 
>           * {shard-rkl}: SKIP (i915#4098) -> PASS
>      * igt@kms_psr@sprite_mmap_cpu:
> 
>           * {shard-rkl}: SKIP (i915#1072) -> PASS +2 similar issues
>      * igt@perf@mi-rpc:
> 
>           * {shard-rkl}: SKIP (i915#2434) -> PASS
>      * igt@prime_vgem@basic-write:
> 
>           * {shard-rkl}: SKIP (fdo#109295 / i915#3291 / i915#3708) -> PASS +1
>             similar issue
>      * igt@prime_vgem@coherency-gtt:
> 
>           * {shard-rkl}: SKIP (fdo#109295 / fdo#111656 / i915#3708) -> PASS
> 
>     Warnings
> 
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-iclb: FAIL (i915#6117) -> SKIP (i915#4525)
>      * igt@gem_pread@exhaustion:
> 
>           * shard-tglb: WARN (i915#2658) -> INCOMPLETE (i915#7248)
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-apl: INCOMPLETE (i915#7248) -> WARN (i915#2658)
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (i915#658)
>      * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
> 
>           * shard-iclb: SKIP (i915#658) -> SKIP (i915#2920)
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> 
>           * shard-iclb: SKIP (fdo#111068 / i915#658) -> SKIP (i915#2920)
>      * igt@runner@aborted:
> 
>           * shard-apl: (FAIL, FAIL, FAIL, FAIL) (i915#180 / i915#3002 /
>             i915#4312) -> (FAIL, FAIL, FAIL) (i915#3002 / i915#4312)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7075 -> IGTPW_8169
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_12444: 72e5dd1b5229d0dec188ccbb168b2713dcb143c8 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_8169: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8169/index.html
>    IGT_7075: ae0ad0ffa147445cdf9d33c96a018f5a8b21a5ee @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
