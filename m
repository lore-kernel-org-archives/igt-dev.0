Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C2410E264
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Apr 2022 04:11:52 +0000 (UTC)
Date: Thu, 28 Apr 2022 06:11:47 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YmoUA3+zk/jNN/ju@zkempczy-mobl2>
References: <20220427184204.65427-1-zbigniew.kempczynski@intel.com>
 <165109160965.24235.4877542719112506164@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165109160965.24235.4877542719112506164@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fsoftpin=3A_Exercise_single_offset_eviction_on_all_en?=
 =?utf-8?q?gines_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 27, 2022 at 08:33:29PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/i915/gem_softpin: Exercise single offset eviction on all    
>             engines (rev3)                                                    
>    URL:     https://patchwork.freedesktop.org/series/102154/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/index.html    
> 
>            CI Bug Log - changes from IGT_6458_full -> IGTPW_7017_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_7017_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_7017_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/index.html
> 
> Participating hosts (10 -> 8)
> 
>    Missing (2): shard-skl shard-dg1
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_7017_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_eio@kms:
> 
>           * shard-tglb: NOTRUN -> FAIL

This is unrelated.


>      * {igt@gem_softpin@evict-single-offset} (NEW):
> 
>           * shard-kbl: NOTRUN -> FAIL
> 
>           * shard-glk: NOTRUN -> FAIL
> 
>           * shard-apl: NOTRUN -> FAIL

This is I wanted to catch. I observe this behavior on the very beginning
of the test and we need to fill bug for it.


> 
>      * igt@prime_mmap_coherency@ioctl-errors:
> 
>           * shard-iclb: NOTRUN -> INCOMPLETE

This is unrelated.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between IGT_6458_full and IGTPW_7017_full:
> 
>   New IGT tests (1)
> 
>      * igt@gem_softpin@evict-single-offset:
>           * Statuses : 3 fail(s) 2 pass(s) 1 skip(s)
>           * Exec time: [0.0, 36.11] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_7017_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@feature_discovery@display-3x:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#1839)
>      * igt@feature_discovery@display-4x:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1839) +1 similar issue
>      * igt@gem_create@create-massive:
> 
>           * shard-iclb: NOTRUN -> DMESG-WARN (i915#4991)
>      * igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN (i915#180) +1 similar issue
>      * igt@gem_ctx_persistence@hostile:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099)
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@in-flight-immediate:
> 
>           * shard-tglb: PASS -> TIMEOUT (i915#3063)
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-iclb: PASS -> TIMEOUT (i915#3070)
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-iclb: PASS -> SKIP (i915#4525)
>      * igt@gem_exec_fair@basic-none@rcs0:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#2842) +1 similar issue
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#2842) +4 similar issues
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#2842)
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842)
> 
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-iclb: PASS -> FAIL (i915#2849)
>      * igt@gem_exec_params@no-vebox:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109283)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109283 / i915#4877)
> 
>      * igt@gem_exec_suspend@basic-s3@smem:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180)
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglb: PASS -> SKIP (i915#2190)
>      * igt@gem_lmem_swapping@parallel-random:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +2 similar
>             issues
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4613) +1 similar
>             issue
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4613) +4 similar issues
> 
>      * igt@gem_lmem_swapping@smem-oom:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +5 similar
>             issues
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4613) +2 similar issues
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-kbl: NOTRUN -> WARN (i915#2658)
> 
>           * shard-apl: NOTRUN -> WARN (i915#2658)
> 
>      * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4270) +3 similar issues
>      * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4270) +1 similar issue
>      * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#768)
>      * igt@gem_softpin@evict-snoop:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109312)
>      * igt@gem_userptr_blits@unsync-unmap-cycles:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3297) +2 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3297) +2 similar issues
> 
>      * igt@gen7_exec_parse@cmd-crossing-page:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109289) +5 similar issues
>      * igt@gen9_exec_parse@batch-invalid-length:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2527 / i915#2856)
>      * igt@i915_pm_backlight@bad-brightness:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +112 similar issues
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-tglb: NOTRUN -> WARN (i915#2681)
> 
>           * shard-iclb: NOTRUN -> WARN (i915#2684)
> 
>      * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111644 / i915#1397 / i915#2411)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110892)
> 
>      * igt@i915_pm_rpm@fences:
> 
>           * shard-iclb: PASS -> INCOMPLETE (i915#4185)
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5286) +3 similar issues
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5286) +4 similar issues
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110725 / fdo#111614)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111614) +1 similar issue
> 
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3777) +1 similar
>             issue
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3777) +5 similar
>             issues
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3777) +4 similar
>             issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +187 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110723) +1 similar issue
> 
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615) +4 similar issues
>      * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689) +12 similar issues
>      * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +8 similar
>             issues
>      * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689) +3 similar
>             issues
>      * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +4 similar
>             issues
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886) +3 similar
>             issues
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +7 similar
>             issues
> 
>      * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +5 similar
>             issues
>      * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +158 similar issues
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3742)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3742)
> 
>      * igt@kms_chamelium@dp-hpd-storm:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +6 similar
>             issues
>      * igt@kms_chamelium@hdmi-hpd:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +4 similar
>             issues
>      * igt@kms_chamelium@vga-hpd:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +7 similar
>             issues
>      * igt@kms_color@pipe-d-ctm-0-25:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#1149) +1 similar
>             issue
>      * igt@kms_color_chamelium@pipe-a-degamma:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +18 similar
>             issues
>      * igt@kms_color_chamelium@pipe-c-ctm-green-to-red:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +4 similar
>             issues
>      * igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / fdo#109284 / fdo#111827)
>      * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +12 similar
>             issues
>      * igt@kms_content_protection@lic:
> 
>           * shard-apl: NOTRUN -> TIMEOUT (i915#1319) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109300 / fdo#111066) +1 similar
>             issue
> 
>           * shard-kbl: NOTRUN -> TIMEOUT (i915#1319)
> 
>      * igt@kms_content_protection@uevent:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#2105)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1063) +2 similar issues
> 
>           * shard-apl: NOTRUN -> FAIL (i915#2105)
> 
>      * igt@kms_cursor_crc@pipe-c-cursor-32x32-random:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3319)
>      * igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109279 / i915#3359) +6 similar
>             issues
>      * igt@kms_cursor_crc@pipe-c-cursor-512x512-onscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / fdo#109279) +1 similar
>             issue
>      * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3359) +8 similar issues
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274 / fdo#109278)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3528)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3528)
> 
>      * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5287) +1 similar issue
>      * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5287) +1 similar issue
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#4767)
> 
>           * shard-kbl: NOTRUN -> INCOMPLETE (i915#180)
> 
>      * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +4 similar issues
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825) +5 similar
>             issues
>      * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
> 
>           * shard-tglb: PASS -> DMESG-WARN (i915#2411)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>           * shard-iclb: PASS -> SKIP (i915#3701)
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109285)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +42 similar
>             issues
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#180) +2 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +27 similar issues
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3555) +1 similar issue
>      * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109289) +5 similar issues
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#533)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#533)
> 
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#265)
> 
>           * shard-apl: NOTRUN -> FAIL (i915#265)
> 
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
> 
>           * shard-kbl: NOTRUN -> FAIL (fdo#108145 / i915#265) +2 similar
>             issues
> 
>           * shard-apl: NOTRUN -> FAIL (fdo#108145 / i915#265)
> 
>      * igt@kms_plane_lowres@pipe-c-tiling-x:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3536) +2 similar issues
>      * igt@kms_plane_lowres@pipe-d-tiling-4:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5288)
>      * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-dp-1-downscale-with-rotation:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271) +253 similar issues
>      * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-a-edp-1-downscale-with-rotation:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5176) +2 similar issues
>      * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5176) +7 similar issues
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5235) +2 similar issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5235) +7 similar issues
>      * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-edp-1-scaler-with-clipping-clamping:
> 
>           * shard-iclb: PASS -> SKIP (i915#5176)
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2920)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#658)
> 
>      * igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658) +1 similar
>             issue
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#658) +1 similar
>             issue
> 
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109642 / fdo#111068 / i915#658)
> 
>      * igt@kms_psr@psr2_cursor_plane_onoff:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467) +3 similar
>             issues
>      * igt@kms_psr@psr2_dpms:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109441) +2 similar issues
>      * igt@kms_psr@psr2_no_drrs:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +1 similar issue
>      * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5289)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5289)
> 
>      * igt@kms_vblank@pipe-d-ts-continuation-idle-hang:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +35 similar issues
>      * igt@kms_vblank@pipe-d-wait-idle:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#533) +1 similar
>             issue
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2437)
>      * igt@nouveau_crc@pipe-c-source-rg:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2530) +2 similar issues
>      * igt@nouveau_crc@pipe-d-source-rg:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2530) +2 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#2530)
> 
>      * igt@prime_nv_api@i915_nv_double_export:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109291) +1 similar issue
>      * igt@prime_nv_test@nv_write_i915_cpu_mmap_read:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109291) +4 similar issues
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111656)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109292)
> 
>      * igt@syncobj_timeline@transfer-timeline-point:
> 
>           * shard-iclb: NOTRUN -> DMESG-FAIL (i915#5098)
> 
>           * shard-kbl: NOTRUN -> DMESG-FAIL (i915#5098)
> 
>           * shard-tglb: NOTRUN -> DMESG-FAIL (i915#5098)
> 
>      * igt@sysfs_clients@fair-3:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +5 similar
>             issues
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2994) +4 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2994) +2 similar issues
> 
>      * igt@sysfs_clients@recycle-many:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +3 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2994) +2 similar
>             issues
> 
>      * igt@tools_test@sysfs_l3_parity:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109307)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109307)
> 
>     Possible fixes
> 
>      * igt@drm_read@short-buffer-nonblock:
> 
>           * {shard-rkl}: SKIP (i915#4098) -> PASS
>      * igt@fbdev@unaligned-read:
> 
>           * {shard-rkl}: SKIP (i915#2582) -> PASS
>      * igt@gem_exec_create@madvise@smem:
> 
>           * {shard-rkl}: INCOMPLETE (i915#5385) -> PASS
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-tglb: FAIL (i915#2842) -> PASS +2 similar issues
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * {shard-rkl}: FAIL (i915#2842) -> PASS
>      * igt@i915_pm_backlight@fade_with_suspend:
> 
>           * {shard-rkl}: SKIP (i915#3012) -> PASS
>      * igt@i915_pm_dc@dc5-psr:
> 
>           * {shard-rkl}: SKIP (i915#658) -> PASS
>      * igt@i915_pm_rpm@gem-execbuf:
> 
>           * {shard-rkl}: SKIP (fdo#109308) -> PASS
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * {shard-rkl}: SKIP (i915#1845 / i915#4098) -> PASS +14 similar
>             issues
>      * igt@kms_color@pipe-c-invalid-degamma-lut-sizes:
> 
>           * {shard-rkl}: SKIP (i915#4070) -> PASS +4 similar issues
>      * igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
> 
>           * {shard-rkl}: SKIP (fdo#112022 / i915#4070) -> PASS +4 similar
>             issues
>      * igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#4070 / i915#4098) -> PASS +3
>             similar issues
>      * igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:
> 
>           * {shard-rkl}: SKIP (i915#4070 / i915#4098) -> PASS
>      * igt@kms_cursor_legacy@cursora-vs-flipa-atomic:
> 
>           * {shard-rkl}: SKIP (fdo#111825 / i915#4070) -> PASS +3 similar
>             issues
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-glk: FAIL -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: FAIL (i915#2346 / i915#533) -> PASS
>      * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled:
> 
>           * {shard-rkl}: SKIP (i915#4098 / i915#4369) -> PASS
>      * igt@kms_draw_crc@fill-fb:
> 
>           * {shard-rkl}: SKIP (fdo#111314 / i915#4098 / i915#4369) -> PASS +1
>             similar issue
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:
> 
>           * shard-snb: DMESG-WARN (i915#5090) -> PASS
>      * igt@kms_flip@flip-vs-suspend@a-edp1:
> 
>           * shard-iclb: INCOMPLETE -> PASS
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>           * shard-iclb: SKIP (i915#3701) -> PASS
>      * igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS +3 similar issues
>      * igt@kms_invalid_mode@uint-max-clock:
> 
>           * {shard-rkl}: SKIP (i915#4278) -> PASS
>      * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#4098) -> PASS +19 similar
>             issues
>      * igt@kms_plane@plane-panning-bottom-right@pipe-b-planes:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#3558) -> PASS +1 similar
>             issue
>      * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format:
> 
>           * shard-iclb: SKIP (i915#5176) -> PASS +2 similar issues
>      * igt@kms_properties@crtc-properties-legacy:
> 
>           * {shard-rkl}: SKIP (i915#1849) -> PASS
>      * igt@kms_psr@psr2_primary_mmap_cpu:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS +2 similar issues
>      * igt@kms_psr@sprite_render:
> 
>           * {shard-rkl}: SKIP (i915#1072) -> PASS +1 similar issue
>      * igt@kms_rotation_crc@primary-rotation-180:
> 
>           * shard-glk: DMESG-FAIL (i915#118 / i915#1888) -> PASS
>      * igt@perf@polling-small-buf:
> 
>           * {shard-rkl}: FAIL (i915#1722) -> PASS
> 
>     Warnings
> 
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-iclb: SKIP (i915#4525) -> DMESG-FAIL (i915#5614)
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-iclb: DMESG-WARN (i915#5614) -> SKIP (i915#4525) +2 similar
>             issues
>      * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
> 
>           * shard-iclb: INCOMPLETE (i915#5243) -> SKIP (i915#5176)
>      * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (i915#658)
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>           * shard-iclb: SKIP (fdo#111068 / i915#658) -> SKIP (i915#2920)
>      * igt@runner@aborted:
> 
>           * shard-kbl: (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL,
>             FAIL, FAIL) (i915#4312 / i915#5257) -> (FAIL, FAIL, FAIL, FAIL,
>             FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL)
>             (fdo#109271 / i915#180 / i915#4312 / i915#5257 / i915#92)
> 
>           * shard-apl: (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL)
>             (fdo#109271 / i915#180 / i915#3002 / i915#4312 / i915#5257) ->
>             (FAIL, FAIL, FAIL, FAIL, FAIL) (i915#180 / i915#3002 / i915#4312
>             / i915#5257)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6458 -> IGTPW_7017
> 
>    CI-20190529: 20190529
>    CI_DRM_11550: 56b089ae03ef8ea8ab7f474eaa70367898891ef0 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_7017: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7017/index.html
>    IGT_6458: bcc26bd2b26220147b00f87d91e2ff1d4bd3ce5e @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
