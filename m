Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D009F10E039
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 10:29:23 +0000 (UTC)
Date: Fri, 22 Apr 2022 12:29:19 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YmKDfy19FOEO83yb@zkempczy-mobl2>
References: <20220421060955.21016-1-zbigniew.kempczynski@intel.com>
 <165053944826.10764.380348029826258761@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165053944826.10764.380348029826258761@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRml4IGNv?=
 =?utf-8?q?uple_of_gem=5Fexec=5Fschedule_subtests_=28rev2=29?=
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

On Thu, Apr 21, 2022 at 11:10:48AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Fix couple of gem_exec_schedule subtests (rev2)                
>    URL:     https://patchwork.freedesktop.org/series/102908/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6963/index.html 
> 
>          CI Bug Log - changes from CI_DRM_11531_full -> IGTPW_6963_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6963_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6963_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6963/index.html
> 
> Participating hosts (13 -> 9)
> 
>    Missing (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6963_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:
>           * shard-tglb: PASS -> INCOMPLETE

Unrelated to the change, I touched gem_exec_schedule only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_6963_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@feature_discovery@display-4x:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +90 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1839) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#1839) +1 similar issue
> 
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5325)
>      * igt@gem_ctx_persistence@many-contexts:
> 
>           * shard-tglb: PASS -> FAIL (i915#2410)
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-iclb: PASS -> SKIP (i915#4525)
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-kbl: PASS -> FAIL (i915#2846)
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-tglb: PASS -> FAIL (i915#2842)
> 
>           * shard-glk: PASS -> FAIL (i915#2842)
> 
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#2842) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#2842)
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#2842)
> 
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-apl: PASS -> FAIL (i915#2842) +1 similar issue
>      * igt@gem_exec_flush@basic-uc-ro-default:
> 
>           * shard-snb: PASS -> SKIP (fdo#109271)
>      * igt@gem_exec_params@no-vebox:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109283)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109283 / i915#4877)
> 
>      * igt@gem_exec_params@secure-non-root:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#112283)
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglb: PASS -> SKIP (i915#2190)
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4613) +2 similar issues
>      * igt@gem_lmem_swapping@verify-random-ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +1 similar
>             issue
>      * igt@gem_pread@exhaustion:
> 
>           * shard-tglb: NOTRUN -> WARN (i915#2658) +1 similar issue
> 
>           * shard-glk: NOTRUN -> WARN (i915#2658)
> 
>           * shard-apl: NOTRUN -> WARN (i915#2658)
> 
>           * shard-iclb: NOTRUN -> WARN (i915#2658)
> 
>           * shard-snb: NOTRUN -> WARN (i915#2658)
> 
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-kbl: NOTRUN -> WARN (i915#2658) +1 similar issue
>      * igt@gem_pxp@create-regular-context-2:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4270) +2 similar issues
>      * igt@gem_pxp@create-valid-protected-context:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271) +215 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#768) +4 similar issues
> 
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3323)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3323)
> 
>      * igt@gem_userptr_blits@unsync-unmap-cycles:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3297) +2 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3297)
> 
>      * igt@gen7_exec_parse@basic-offset:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109289) +7 similar issues
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2856) +1 similar issue
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 similar
>             issue
> 
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#5566 / i915#716)
>      * igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1904)
>      * igt@i915_pm_lpsp@screens-disabled:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1902)
>      * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111644 / i915#1397 / i915#2411)
>             +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110892)
> 
>      * igt@i915_pm_rpm@pc8-residency:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109293 / fdo#109506)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109506 / i915#2411)
> 
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4387)
>      * igt@i915_query@query-topology-unsupported:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109302)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109302)
> 
>      * igt@i915_selftest@live@gt_lrc:
> 
>           * shard-tglb: NOTRUN -> DMESG-FAIL (i915#2373)
>      * igt@i915_selftest@live@gt_pm:
> 
>           * shard-tglb: NOTRUN -> DMESG-FAIL (i915#1759)
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#1769) +1 similar issue
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1769) +1 similar issue
> 
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5286) +7 similar issues
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5286) +6 similar issues
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110725 / fdo#111614) +1 similar
>             issue
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111614) +1 similar issue
> 
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3777) +1 similar
>             issue
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3777)
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615) +4 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110723) +1 similar issue
>      * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689) +6 similar issues
>      * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886) +6 similar
>             issues
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +4 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +2 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +5 similar
>             issues
> 
>      * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +8 similar
>             issues
>      * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689) +6 similar
>             issues
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3742)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3742)
> 
>      * igt@kms_chamelium@vga-hpd:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +15 similar
>             issues
>      * igt@kms_color@pipe-d-ctm-0-75:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#1149) +1 similar
>             issue
>      * igt@kms_color_chamelium@pipe-a-gamma:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +1 similar
>             issue
>      * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +5 similar
>             issues
>      * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +10 similar
>             issues
>      * igt@kms_color_chamelium@pipe-c-ctm-max:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +6 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +1 similar
>             issue
> 
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3116 / i915#3299)
>      * igt@kms_content_protection@lic:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109300 / fdo#111066)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1063)
> 
>           * shard-kbl: NOTRUN -> TIMEOUT (i915#1319)
> 
>      * igt@kms_cursor_crc@pipe-a-cursor-suspend:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#180) +3 similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3359) +2 similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3319)
>      * igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#5691)
>      * igt@kms_cursor_crc@pipe-c-cursor-512x512-sliding:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / fdo#109279)
>      * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109279 / i915#3359) +3 similar
>             issues
>      * igt@kms_cursor_crc@pipe-d-cursor-dpms:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +26 similar issues
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4103) +2 similar issues
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274 / fdo#109278) +1 similar
>             issue
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-glk: PASS -> FAIL (i915#2346)
>      * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3528)
>      * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5287) +2 similar issues
>      * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5287) +2 similar issues
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-apl: PASS -> FAIL (i915#4767)
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#4767)
> 
>      * igt@kms_flip@2x-absolute-wf_vblank:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825 / i915#3966)
>      * igt@kms_flip@2x-blocking-wf_vblank:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +3 similar issues
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825) +9 similar
>             issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2587) +1 similar issue
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2587) +3 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +27 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +42 similar
>             issues
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180)
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5439)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5438)
> 
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +87 similar issues
>      * igt@kms_hdr@static-swap:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3555) +4 similar issues
>      * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#533)
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#265)
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
> 
>           * shard-kbl: NOTRUN -> FAIL (fdo#108145 / i915#265) +1 similar
>             issue
>      * igt@kms_plane_lowres@pipe-a-tiling-x:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3536)
>      * igt@kms_plane_lowres@pipe-b-tiling-4:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5288)
>      * igt@kms_plane_lowres@pipe-c-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / fdo#112054)
>      * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-edp-1-downscale-with-rotation:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5176) +5 similar issues
>      * igt@kms_plane_scaling@downscale-with-rotation-factor-0-5@pipe-b-edp-1-downscale-with-rotation:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5176) +11 similar issues
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-1-planes-upscale-downscale:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5235) +2 similar issues
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2-planes-upscale-downscale:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +42 similar issues
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5235) +3 similar issues
>      * igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2920) +1 similar issue
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#111068 / i915#658)
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#658) +2 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658)
> 
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109642 / fdo#111068 / i915#658)
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1911)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109642 / fdo#111068 / i915#658)
> 
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658) +1 similar
>             issue
>      * igt@kms_psr@psr2_cursor_plane_onoff:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109441)
> 
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-tglb: PASS -> SKIP (i915#5519)
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109309)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109309)
> 
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2437) +1 similar
>             issue
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2437)
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2437) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2437)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2437)
> 
>      * igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2530) +3 similar issues
>      * igt@nouveau_crc@pipe-c-source-outp-complete:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2530) +5 similar issues
>      * igt@perf@unprivileged-single-ctx-counters:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109289) +2 similar issues
>      * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109291) +2 similar issues
>      * igt@prime_nv_api@i915_self_import_to_different_fd:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109291) +4 similar issues
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111656)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109292)
> 
>      * igt@sysfs_clients@busy:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2994) +3 similar issues
>      * igt@sysfs_clients@split-10:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2994) +1 similar issue
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2994)
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994)
> 
>      * igt@sysfs_clients@split-25:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +4 similar
>             issues
> 
>     Possible fixes
> 
>      * igt@gem_eio@in-flight-suspend:
> 
>           * {shard-rkl}: FAIL (fdo#103375) -> PASS
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-iclb: TIMEOUT (i915#3070) -> PASS
> 
>           * {shard-rkl}: TIMEOUT (i915#3063) -> PASS
> 
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-glk: FAIL (i915#2846) -> PASS
>      * igt@gem_exec_fair@basic-none@vecs0:
> 
>           * shard-apl: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-kbl: FAIL (i915#2842) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS +2 similar issues
>      * igt@gem_exec_flush@basic-batch-kernel-default-wb:
> 
>           * shard-snb: SKIP (fdo#109271) -> PASS +1 similar issue
>      * igt@gem_softpin@allocator-evict-all-engines:
> 
>           * shard-glk: FAIL (i915#4171) -> PASS
>      * igt@gem_softpin@noreloc-s3:
> 
>           * shard-kbl: DMESG-WARN (i915#180) -> PASS +1 similar issue
>      * igt@i915_pm_rps@basic-api:
> 
>           * {shard-dg1}: FAIL (i915#4032) -> PASS
>      * igt@kms_big_fb@linear-32bpp-rotate-0:
> 
>           * shard-glk: DMESG-WARN (i915#118) -> PASS +1 similar issue
>      * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled:
> 
>           * shard-glk: FAIL (i915#1888 / i915#5160) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
> 
>           * shard-glk: FAIL (i915#2546) -> PASS
>      * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c:
> 
>           * shard-glk: FAIL (i915#1036 / i915#1888) -> PASS
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS
>      * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
> 
>           * shard-iclb: INCOMPLETE (i915#5243) -> PASS
>      * igt@kms_vblank@pipe-b-ts-continuation-suspend:
> 
>           * shard-snb: DMESG-WARN (i915#5090) -> PASS
>      * igt@perf_pmu@idle@rcs0:
> 
>           * {shard-dg1}: FAIL (i915#4349) -> PASS
>      * igt@sysfs_timeslice_duration@timeout@vecs0:
> 
>           * {shard-dg1}: FAIL (i915#1755) -> PASS +2 similar issues
> 
>     Warnings
> 
>      * igt@gem_eio@kms:
> 
>           * shard-tglb: TIMEOUT (i915#3063) -> FAIL (i915#232)
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: TIMEOUT (i915#3063 / i915#3648) -> FAIL (i915#232)
>      * igt@gem_exec_balancer@parallel:
> 
>           * shard-iclb: DMESG-WARN (i915#5614) -> SKIP (i915#4525)
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-iclb: SKIP (i915#4525) -> DMESG-WARN (i915#5614) +2 similar
>             issues
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-iclb: SKIP (i915#4525) -> DMESG-FAIL (i915#5614)
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (fdo#111068 / i915#658)
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-iclb: SKIP (fdo#109642 / fdo#111068 / i915#658) -> FAIL
>             (i915#4148)
>      * igt@runner@aborted:
> 
>           * shard-apl: (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL) (fdo#109271 /
>             i915#180 / i915#3002 / i915#4312 / i915#5257) -> (FAIL, FAIL,
>             FAIL, FAIL, FAIL) (fdo#109271 / i915#3002 / i915#4312 /
>             i915#5257)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6442 -> IGTPW_6963
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_11531: 82383b93281e2d56a35fda9bbfbd6e20215798e3 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_6963: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6963/index.html
>    IGT_6442: 891ce2ff8769675b52dcfff3cf1c91bb711ddb03 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
