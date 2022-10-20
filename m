Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672F810E6B4
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Oct 2022 11:26:51 +0000 (UTC)
Date: Thu, 20 Oct 2022 13:26:44 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y1EwdBBJnMZb1ZDQ@zkempczy-mobl2>
References: <20221020065337.26978-1-zbigniew.kempczynski@intel.com>
 <166626372746.8588.5679047663053254189@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166626372746.8588.5679047663053254189@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15=5Fblt=3A_Equalize_pitch_and_aux-ccs_for_full_resolve_=28rev3?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 11:02:07AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/i915_blt: Equalize pitch and aux-ccs for full resolve (rev3) 
>    URL:     https://patchwork.freedesktop.org/series/109922/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7990/index.html   
> 
>          CI Bug Log - changes from CI_DRM_12263_full -> IGTPW_7990_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_7990_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_7990_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7990/index.html
> 
> Participating hosts (11 -> 8)
> 
>    Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_7990_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@gem_contexts:
> 
>           * shard-apl: PASS -> DMESG-FAIL
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>           * shard-iclb: PASS -> FAIL
>      * igt@kms_flip@flip-vs-suspend@b-edp1:
> 
>           * shard-tglb: PASS -> DMESG-WARN

Change is not related to the above failures.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@gem_pread@exhaustion:
>           * {shard-rkl}: SKIP (i915#3282) -> INCOMPLETE
> 
> Known issues
> 
>    Here are the changes found in IGTPW_7990_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3555 / i915#5325)
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5327) +1 similar issue
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5325)
> 
>      * igt@gem_ctx_persistence@engines-mixed-process:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099)
>      * igt@gem_exec_balancer@parallel-bb-first:
> 
>           * shard-iclb: PASS -> SKIP (i915#4525)
>      * igt@gem_exec_capture@capture-invisible@smem0:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#6334)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6334)
> 
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-glk: PASS -> FAIL (i915#2846)
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842)
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#2842)
> 
>      * igt@gem_exec_fair@basic-none@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#2842) +1 similar issue
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-iclb: PASS -> FAIL (i915#2842)
>      * igt@gem_lmem_swapping@heavy-multi:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4613)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4613)
> 
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613)
>      * igt@gem_pxp@fail-invalid-protected-context:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4270) +3 similar issues
>      * igt@gem_pxp@verify-pxp-stale-buf-execution:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4270) +2 similar issues
>      * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#768) +1 similar issue
>      * igt@gem_userptr_blits@probe:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#7247)
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3297)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3297)
> 
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#2724)
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#3318)
> 
>           * shard-glk: NOTRUN -> FAIL (i915#3318)
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#3318)
> 
>      * igt@gen7_exec_parse@basic-rejected:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109289) +4 similar issues
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 similar
>             issue
>      * igt@gen9_exec_parse@bb-start-param:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2856) +1 similar issue
>      * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#7036)
>      * igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658)
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#1937)
>      * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +92 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109293 / fdo#109506)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109506)
> 
>      * igt@i915_pm_rpm@i2c:
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#118)
>      * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110892) +1 similar issue
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111644 / i915#1397)
> 
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4387)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4387)
> 
>      * igt@i915_selftest@live@gem_contexts:
> 
>           * shard-iclb: PASS -> DMESG-FAIL (i915#7270)
>      * igt@i915_selftest@live@gt_heartbeat:
> 
>           * shard-glk: PASS -> DMESG-FAIL (i915#5334)
>      * igt@i915_selftest@mock@requests:
> 
>           * shard-snb: NOTRUN -> INCOMPLETE (i915#7226)
>      * igt@i915_suspend@forcewake:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN (i915#180) +1 similar issue
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#1769)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1769)
> 
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5286) +6 similar issues
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5286) +6 similar issues
>      * igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111614) +2 similar issues
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110725 / fdo#111614) +1 similar
>             issue
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615) +4 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110723) +1 similar issue
>      * igt@kms_big_joiner@2x-modeset:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2705)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2705)
> 
>      * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6095) +2 similar issues
>      * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#6095) +3 similar
>             issues
>      * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886) +2 similar
>             issues
>      * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +10 similar
>             issues
>      * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +193 similar issues
>      * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +8 similar
>             issues
>      * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689) +6 similar issues
>      * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +7 similar
>             issues
>      * igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689) +1 similar
>             issue
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_chamelium@dp-hpd-fast:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +5 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +4 similar
>             issues
> 
>      * igt@kms_chamelium@vga-hpd-without-ddc:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +1 similar
>             issue
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +3 similar
>             issues
> 
>      * igt@kms_color_chamelium@ctm-0-25:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +4 similar
>             issues
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3116 / i915#3299)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3116)
> 
>      * igt@kms_content_protection@legacy:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#7118) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#7118) +1 similar issue
> 
>      * igt@kms_content_protection@uevent:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6944 / i915#7118)
>      * igt@kms_content_protection@uevent@pipe-a-dp-1:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#1339 / i915#7144)
>      * igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109279 / i915#3359)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825) +7 similar
>             issues
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-apl: PASS -> INCOMPLETE (i915#180 / i915#4939)
>      * igt@kms_flip@2x-blocking-wf_vblank:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +8 similar issues
>      * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825 / i915#3637)
>             +4 similar issues
>      * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
> 
>           * shard-glk: PASS -> FAIL (i915#79)
>      * igt@kms_flip@flip-vs-suspend@b-dp1:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180) +2 similar issues
>      * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:
> 
>           * shard-glk: PASS -> FAIL (i915#2122)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2587 / i915#2672) +2 similar
>             issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672) +2 similar issues
>      * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3555) +2 similar issues
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2587 / i915#2672) +4 similar
>             issues
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109285)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>           * shard-glk: PASS -> FAIL (i915#2546)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6497) +9 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +25 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +23 similar
>             issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +190 similar issues
>      * igt@kms_hdr@bpc-switch:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3555)
>      * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-edp-1:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5176) +5 similar issues
>      * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-edp-1:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5176) +7 similar issues
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5235) +2 similar issues
>      * igt@kms_prime@basic-crc-hybrid:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109642 / fdo#111068 / i915#658)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#7037)
> 
>      * igt@kms_psr@psr2_basic:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +1 similar issue
>      * igt@kms_psr@psr2_cursor_blt:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109441) +3 similar issues
>      * igt@kms_psr@psr2_sprite_mmap_cpu:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467) +4 similar
>             issues
>      * igt@kms_selftest@all:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6433)
>      * igt@kms_setmode@basic@pipe-a-vga-1:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#5465) +1 similar issue
>      * igt@kms_vblank@pipe-d-ts-continuation-idle:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +20 similar issues
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2437)
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2437)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2437)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2437)
> 
>      * igt@perf@per-context-mode-unprivileged:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109289) +5 similar issues
>      * igt@perf@polling-parameterized:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#5639)
>      * igt@sysfs_clients@create:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2994) +3 similar issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2994) +1 similar
>             issue
> 
>      * igt@sysfs_clients@fair-0:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2994) +3 similar issues
>      * igt@sysfs_clients@fair-3:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +3 similar
>             issues
> 
>     Possible fixes
> 
>      * igt@fbdev@unaligned-write:
> 
>           * {shard-rkl}: SKIP (i915#2582) -> PASS
>      * igt@feature_discovery@psr2:
> 
>           * shard-iclb: SKIP (i915#658) -> PASS
>      * igt@gem_eio@reset-stress:
> 
>           * shard-tglb: FAIL (i915#5784) -> PASS
>      * igt@gem_exec_endless@dispatch@bcs0:
> 
>           * {shard-rkl}: SKIP (i915#6247) -> PASS
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS +1 similar issue
> 
>           * shard-tglb: FAIL (i915#2842) -> PASS
> 
>      * igt@gem_exec_reloc@basic-write-read:
> 
>           * {shard-rkl}: SKIP (i915#3281) -> PASS +9 similar issues
>      * igt@gem_userptr_blits@forbidden-operations:
> 
>           * {shard-rkl}: SKIP (i915#3282) -> PASS +2 similar issues
>      * igt@i915_pm_rpm@dpms-lpsp:
> 
>           * {shard-rkl}: SKIP (i915#1397) -> PASS
>      * igt@i915_selftest@live@gem_contexts:
> 
>           * shard-glk: DMESG-FAIL (i915#7270) -> PASS
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>           * shard-tglb: FAIL (i915#3743) -> PASS
>      * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS
>      * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
> 
>           * shard-tglb: INCOMPLETE -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#4098) -> PASS +2 similar
>             issues
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
> 
>           * shard-iclb: SKIP (i915#5235) -> PASS +2 similar issues
>      * igt@kms_psr@cursor_render:
> 
>           * {shard-rkl}: SKIP (i915#1072) -> PASS
>      * igt@kms_psr@psr2_sprite_plane_move:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS
>      * igt@kms_pwrite_crc:
> 
>           * {shard-rkl}: SKIP (i915#1845 / i915#4098) -> PASS +8 similar
>             issues
>      * igt@perf@polling-parameterized:
> 
>           * {shard-rkl}: FAIL (i915#5639) -> PASS
>      * igt@prime_vgem@coherency-gtt:
> 
>           * {shard-rkl}: SKIP (fdo#109295 / fdo#111656 / i915#3708) -> PASS
> 
>     Warnings
> 
>      * igt@gem_pread@exhaustion:
> 
>           * shard-apl: INCOMPLETE (i915#7268) -> WARN (i915#2658)
>      * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (i915#658)
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>           * shard-iclb: SKIP (fdo#111068 / i915#658) -> SKIP (i915#2920) +1
>             similar issue
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7020 -> IGTPW_7990
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_12263: 61bd2b99edc3612ed4c47a3ea014db1239c9b507 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_7990: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7990/index.html
>    IGT_7020: 05b7eaf9ade2216d17c069c89439015757ee25f7 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
