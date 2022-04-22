Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0AD10EAE5
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 11:11:54 +0000 (UTC)
Date: Fri, 22 Apr 2022 13:11:50 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YmKNduulUzc04OkO@zkempczy-mobl2>
References: <20220422072825.11563-1-zbigniew.kempczynski@intel.com>
 <165062487218.14004.16868766420637190985@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165062487218.14004.16868766420637190985@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fisolation=2Ec_-_fix_to_poison_CACHE=5FMODE=5F0?=
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

On Fri, Apr 22, 2022 at 10:54:32AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/i915/gem_ctx_isolation.c - fix to poison CACHE_MODE_0    
>    URL:     https://patchwork.freedesktop.org/series/102974/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/index.html 
> 
>          CI Bug Log - changes from CI_DRM_11539_full -> IGTPW_6977_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6977_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6977_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/index.html
> 
> Participating hosts (10 -> 9)
> 
>    Additional (3): shard-rkl shard-dg1 shard-tglu
>    Missing (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6977_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@syncobj_wait@wait-for-submit-snapshot:
>           * shard-glk: PASS -> FAIL

Unrelated, change touches gem_ctx_isolation.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * {igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0}:
> 
>           * {shard-dg1}: NOTRUN -> SKIP +1 similar issue
>      * igt@gem_softpin@noreloc-s3:
> 
>           * {shard-rkl}: NOTRUN -> DMESG-WARN
> 
>           * {shard-tglu}: NOTRUN -> DMESG-WARN
> 
> Known issues
> 
>    Here are the changes found in IGTPW_6977_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@feature_discovery@chamelium:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111827)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#111827)
> 
>      * igt@feature_discovery@display-2x:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1839)
>      * igt@feature_discovery@psr2:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#658)
>      * igt@gem_ccs@block-copy-uncompressed:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5327) +1 similar issue
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5325) +1 similar issue
>      * igt@gem_ctx_persistence@legacy-engines-persistence:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099) +2 similar
>             issues
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#280)
>      * igt@gem_exec_balancer@parallel:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN (i915#5076 / i915#5614) +1
>             similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4525)
> 
>           * shard-tglb: NOTRUN -> DMESG-WARN (i915#5076 / i915#5614)
> 
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-kbl: NOTRUN -> DMESG-FAIL (i915#5076 / i915#5614)
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#2842) +2 similar issues
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#2842) +2 similar issues
> 
>           * shard-apl: NOTRUN -> FAIL (i915#2842)
> 
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-apl: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842) +1 similar issue
> 
>           * shard-tglb: PASS -> FAIL (i915#2842)
> 
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_exec_flush@basic-wb-rw-default:
> 
>           * shard-snb: PASS -> SKIP (fdo#109271) +1 similar issue
>      * igt@gem_exec_params@secure-non-master:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#112283)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#112283)
> 
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2190)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2190)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2190)
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2190)
> 
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4613)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4613)
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +1 similar
>             issue
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4613)
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#4613)
> 
>      * igt@gem_media_vme:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#284)
>      * igt@gem_pread@exhaustion:
> 
>           * shard-kbl: NOTRUN -> WARN (i915#2658)
> 
>           * shard-tglb: NOTRUN -> WARN (i915#2658)
> 
>           * shard-glk: NOTRUN -> WARN (i915#2658)
> 
>      * igt@gem_pxp@create-regular-context-1:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4270) +1 similar issue
>      * igt@gem_pxp@reject-modify-context-protection-on:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4270) +2 similar issues
>      * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271) +308 similar issues
>      * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#768) +1 similar issue
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3323)
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3323)
> 
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3297)
>      * igt@gen7_exec_parse@cmd-crossing-page:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109289) +4 similar issues
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#5566 / i915#716)
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#5566 / i915#716) +1 similar
>             issue
> 
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2527 / i915#2856) +6 similar
>             issues
>      * igt@gen9_exec_parse@bb-start-out:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2856) +2 similar issues
>      * igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1904)
>      * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109506 / i915#2411)
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3826)
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1769)
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5286) +3 similar issues
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5286) +7 similar issues
>      * igt@kms_big_fb@linear-32bpp-rotate-180:
> 
>           * shard-glk: NOTRUN -> DMESG-WARN (i915#118)
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111614) +2 similar issues
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3777) +2 similar
>             issues
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3777) +2 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3777) +3 similar
>             issues
> 
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615) +4 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110723)
>      * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689) +5 similar issues
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +4 similar
>             issues
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886) +6 similar
>             issues
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +2 similar
>             issues
> 
>      * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +9 similar
>             issues
>      * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +1 similar
>             issue
>      * igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689) +7 similar
>             issues
>      * igt@kms_chamelium@dp-hpd-for-each-pipe:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +24 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +4 similar
>             issues
> 
>      * igt@kms_chamelium@hdmi-crc-single:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +10 similar
>             issues
>      * igt@kms_color@pipe-d-ctm-blue-to-red:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#1149)
>      * igt@kms_color_chamelium@pipe-b-ctm-max:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +15 similar
>             issues
>      * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +10 similar
>             issues
>      * igt@kms_color_chamelium@pipe-d-gamma:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +7 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / fdo#109284 / fdo#111827)
>             +1 similar issue
> 
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-kbl: NOTRUN -> TIMEOUT (i915#1319)
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3116)
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3116 / i915#3299) +1 similar
>             issue
>      * igt@kms_cursor_crc@pipe-a-cursor-suspend:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180) +1 similar issue
>      * igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3359) +4 similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / fdo#109279)
>      * igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +26 similar issues
>      * igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3319) +1 similar issue
>      * igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109279 / i915#3359) +5 similar
>             issues
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4103) +2 similar issues
>      * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274 / fdo#109278) +2 similar
>             issues
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-iclb: PASS -> FAIL (i915#2346)
>      * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:
> 
>           * shard-glk: PASS -> FAIL (i915#1888 / i915#5160)
>      * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5287) +3 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5287) +1 similar issue
> 
>      * igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:
> 
>           * shard-glk: PASS -> DMESG-FAIL (i915#118 / i915#1888)
>      * igt@kms_flip@2x-dpms-vs-vblank-race:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +4 similar issues
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825) +14 similar
>             issues
>      * igt@kms_flip@flip-vs-expired-vblank@a-dp1:
> 
>           * shard-apl: PASS -> FAIL (i915#79)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2587)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2587)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +23 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN (i915#180) +3 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +201 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +43 similar
>             issues
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3555) +1 similar issue
>      * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109289) +4 similar issues
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#265) +1 similar issue
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#265)
>      * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
> 
>           * shard-kbl: NOTRUN -> FAIL (fdo#108145 / i915#265)
>      * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
> 
>           * shard-glk: NOTRUN -> FAIL (fdo#108145 / i915#265)
> 
>           * shard-apl: NOTRUN -> FAIL (fdo#108145 / i915#265)
> 
>      * igt@kms_plane_lowres@pipe-c-tiling-4:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5288)
>      * igt@kms_plane_lowres@pipe-d-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / fdo#112054)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5235) +3 similar issues
>      * igt@kms_plane_scaling@upscale-with-rotation-factor-0-25@pipe-a-edp-1-upscale-with-rotation:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5176) +3 similar issues
>      * igt@kms_plane_scaling@upscale-with-rotation-factor-0-25@pipe-b-edp-1-upscale-with-rotation:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5176) +2 similar issues
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2920)
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#658) +2 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#111068 / i915#658)
> 
>      * igt@kms_psr@psr2_basic:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467) +3 similar
>             issues
>      * igt@kms_psr@psr2_cursor_mmap_cpu:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109441)
>      * igt@kms_psr@psr2_suspend:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +1 similar issue
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-iclb: PASS -> SKIP (i915#5519)
>      * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +153 similar issues
>      * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +193 similar issues
>      * igt@kms_vblank@pipe-d-wait-idle:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#533) +2 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#533) +1 similar
>             issue
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#533) +1 similar
>             issue
> 
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2437)
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2437)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2437)
> 
>      * igt@nouveau_crc@pipe-d-source-rg:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2530) +1 similar issue
>      * igt@prime_nv_pcopy@test3_2:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109291) +2 similar issues
>      * igt@prime_nv_test@i915_import_gtt_mmap:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109291) +4 similar issues
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111656)
>      * igt@sysfs_clients@fair-3:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2994) +3 similar
>             issues
>      * igt@sysfs_clients@recycle-many:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +2 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2994) +1 similar issue
> 
>      * igt@sysfs_clients@split-50:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +5 similar
>             issues
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2994) +4 similar issues
> 
>      * igt@tools_test@sysfs_l3_parity:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109307)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109307)
> 
>     Possible fixes
> 
>      * igt@gem_exec_fair@basic-none@vecs0:
> 
>           * shard-apl: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS +2 similar issues
>      * igt@gem_exec_flush@basic-wb-ro-before-default:
> 
>           * shard-snb: SKIP (fdo#109271) -> PASS +2 similar issues
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-kbl: DMESG-WARN (i915#5566 / i915#716) -> PASS
>      * igt@i915_selftest@live@hangcheck:
> 
>           * shard-tglb: DMESG-WARN (i915#5591) -> PASS
>      * igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:
> 
>           * shard-iclb: FAIL (i915#1888) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: FAIL (i915#2346 / i915#533) -> PASS
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-iclb: TIMEOUT -> PASS
>      * igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a1:
> 
>           * shard-glk: FAIL -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
> 
>           * shard-iclb: FAIL (i915#2546) -> PASS
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
> 
>           * shard-kbl: DMESG-WARN (i915#180) -> PASS
>      * igt@kms_plane_lowres@pipe-b-tiling-yf:
> 
>           * shard-glk: FAIL (i915#1888) -> PASS
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1-planes-upscale-downscale:
> 
>           * shard-iclb: SKIP (i915#5235) -> PASS +2 similar issues
>      * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
> 
>           * shard-iclb: INCOMPLETE (i915#5243) -> PASS
>      * igt@kms_psr@psr2_cursor_render:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS +4 similar issues
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-iclb: SKIP (i915#5519) -> PASS
>      * igt@kms_vblank@pipe-c-ts-continuation-suspend:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS +1 similar issue
> 
>     Warnings
> 
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: TIMEOUT (i915#3063 / i915#3648) -> FAIL (i915#232)
>      * igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>           * shard-iclb: SKIP (i915#4525) -> DMESG-WARN (i915#5614)
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-iclb: SKIP (i915#4525) -> DMESG-FAIL (i915#5614)
>      * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (fdo#111068 / i915#658)
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
> 
>           * shard-iclb: SKIP (fdo#111068 / i915#658) -> SKIP (i915#2920)
>      * igt@runner@aborted:
> 
>           * shard-apl: (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL) (i915#180 /
>             i915#3002 / i915#4312 / i915#5257) -> (FAIL, FAIL, FAIL, FAIL,
>             FAIL, FAIL, FAIL, FAIL) (fdo#109271 / i915#3002 / i915#4312 /
>             i915#5257)
> 
>           * shard-kbl: (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL,
>             FAIL, FAIL, FAIL, FAIL, FAIL) (fdo#109271 / i915#180 / i915#3002
>             / i915#4312 / i915#5257 / i915#716) -> (FAIL, FAIL, FAIL, FAIL,
>             FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL)
>             (fdo#109271 / i915#180 / i915#3002 / i915#4312 / i915#5257)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6445 -> IGTPW_6977
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_11539: 6cb847509fe9aa278324a4f9662df271c42851f8 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_6977: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6977/index.html
>    IGT_6445: 8c2ac78f0d80a2af3c7b47dd2df064cdd07f24b6 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
