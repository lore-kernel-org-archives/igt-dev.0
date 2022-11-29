Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDBE10E25B
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 07:18:04 +0000 (UTC)
Date: Tue, 29 Nov 2022 08:17:51 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20221129071751.27miwc27ywhpmf4x@zkempczy-mobl2>
References: <20221128161537.67096-1-zbigniew.kempczynski@intel.com>
 <166967412261.8063.15924470392790332275@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166967412261.8063.15924470392790332275@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_remnants_in_i915_code_=28rev2=29?=
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

On Mon, Nov 28, 2022 at 10:22:02PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Remove libdrm remnants in i915 code (rev2)                     
>    URL:     https://patchwork.freedesktop.org/series/111200/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8161/index.html 
> 
>            CI Bug Log - changes from IGT_7073_full -> IGTPW_8161_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_8161_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_8161_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8161/index.html
> 
> Participating hosts (8 -> 8)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_8161_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_partial_pwrite_pread@writes-after-reads:
>           * shard-apl: PASS -> INCOMPLETE +1 similar issue

Regression not introduced in this series.

--
Zbigniew


> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@kms_cursor_crc@cursor-random-256x256@pipe-d-hdmi-a-4:
>           * {shard-dg1}: PASS -> FAIL +3 similar issues
> 
> Known issues
> 
>    Here are the changes found in IGTPW_8161_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_create@create-massive:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN (i915#4991)
> 
>           * shard-tglb: NOTRUN -> DMESG-WARN (i915#4991)
> 
>           * shard-iclb: NOTRUN -> DMESG-WARN (i915#4991)
> 
>      * igt@gem_exec_balancer@parallel:
> 
>           * shard-iclb: PASS -> SKIP (i915#4525) +1 similar issue
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#6117)
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#6117)
> 
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4613) +1 similar issue
>      * igt@gem_lmem_swapping@massive-random:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +1 similar
>             issue
>      * igt@gem_pxp@fail-invalid-protected-context:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@reject-modify-context-protection-off-1:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4270) +3 similar issues
>      * igt@gem_userptr_blits@coherency-sync:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109290)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#110542)
> 
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3297)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3297)
> 
>      * igt@gen3_render_linear_blits:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109289)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109289)
> 
>      * igt@gen9_exec_parse@shadow-peek:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2856)
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#3989 / i915#454)
>      * igt@i915_pm_lpsp@screens-disabled:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1902)
>      * igt@i915_pm_rpm@pc8-residency:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109506 / i915#2411)
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6245)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5286) +1 similar issue
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5286)
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110725 / fdo#111614) +1 similar
>             issue
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111614) +1 similar issue
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110723)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615)
> 
>      * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +3 similar
>             issues
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689) +3 similar
>             issues
>      * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +8 similar issues
>      * igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6095) +3 similar issues
>      * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +2 similar
>             issues
>      * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#6095) +3 similar
>             issues
>      * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886)
>      * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689) +4 similar issues
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_chamelium@dp-crc-single:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +3 similar
>             issues
>      * igt@kms_chamelium@hdmi-crc-multiple:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +1 similar
>             issue
>      * igt@kms_chamelium@hdmi-hpd-storm-disable:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +5 similar
>             issues
>      * igt@kms_color@ctm-0-75@pipe-a-edp-1:
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#315 / i915#6946) +2 similar
>             issues
>      * igt@kms_color@ctm-0-75@pipe-c-edp-1:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#315 / i915#6946) +3 similar
>             issues
>      * igt@kms_content_protection@uevent:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#7118)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6944 / i915#7118)
> 
>      * igt@kms_content_protection@uevent@pipe-a-dp-1:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#1339)
>      * igt@kms_cursor_crc@cursor-random-32x32:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3555) +3 similar issues
>      * igt@kms_cursor_legacy@cursor-vs-flip@legacy:
> 
>           * shard-iclb: PASS -> FAIL (i915#5072)
>      * igt@kms_cursor_legacy@cursorb-vs-flipb@atomic:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825) +12 similar
>             issues
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274)
>      * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3528)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3840)
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#7205)
> 
>      * igt@kms_flip@2x-flip-vs-panning-interruptible:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825 / i915#3637)
>             +1 similar issue
>      * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +14 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 similar
>             issue
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#6375)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672) +1 similar issue
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2587 / i915#2672) +8 similar
>             issues
>      * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3555) +2 similar issues
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6497) +6 similar issues
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +85 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +19 similar
>             issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +11 similar issues
>      * igt@kms_plane_lowres@tiling-none@pipe-a-edp-1:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3536) +2 similar issues
>      * igt@kms_plane_lowres@tiling-none@pipe-c-edp-1:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3536) +3 similar issues
>      * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-edp-1:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5176) +3 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5176) +2 similar issues
> 
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2920)
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109642 / fdo#111068 / i915#658)
>      * igt@kms_psr@psr2_basic:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109441)
> 
>      * igt@kms_psr@psr2_sprite_mmap_cpu:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +1 similar issue
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2437) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2437)
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2437)
> 
>      * igt@perf_pmu@event-wait@rcs0:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#112283)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#112283)
> 
>      * igt@sysfs_clients@fair-0:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2994) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2994)
> 
>     Possible fixes
> 
>      * igt@feature_discovery@psr2:
> 
>           * shard-iclb: SKIP (i915#658) -> PASS
>      * igt@gem_eio@in-flight-suspend:
> 
>           * {shard-rkl}: FAIL (fdo#103375) -> PASS
>      * igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>           * shard-iclb: SKIP (i915#4525) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-tglb: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-apl: FAIL (i915#2842) -> PASS +1 similar issue
>      * igt@gem_exec_reloc@basic-wc-read-noreloc:
> 
>           * {shard-rkl}: SKIP (i915#3281) -> PASS +9 similar issues
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglb: SKIP (i915#2190) -> PASS
>      * igt@gem_partial_pwrite_pread@write-display:
> 
>           * {shard-rkl}: SKIP (i915#3282) -> PASS +1 similar issue
>      * igt@gem_softpin@evict-single-offset:
> 
>           * shard-iclb: FAIL (i915#4171) -> PASS
>      * igt@gen9_exec_parse@bb-start-far:
> 
>           * {shard-rkl}: SKIP (i915#2527) -> PASS +2 similar issues
>      * igt@i915_hangman@engine-engine-error@bcs0:
> 
>           * {shard-rkl}: SKIP (i915#6258) -> PASS
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-iclb: FAIL (i915#3989 / i915#454) -> PASS +1 similar issue
>      * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
> 
>           * {shard-rkl}: WARN (i915#2681) -> PASS
>      * igt@i915_pm_rpm@dpms-lpsp:
> 
>           * shard-tglb: INCOMPLETE (i915#2411) -> PASS
>      * igt@i915_pm_rpm@fences-dpms:
> 
>           * {shard-rkl}: SKIP (i915#1849) -> PASS
>      * igt@i915_pm_rps@engine-order:
> 
>           * {shard-rkl}: FAIL (i915#6537) -> PASS
>      * igt@i915_pm_sseu@full-enable:
> 
>           * {shard-rkl}: SKIP (i915#4387) -> PASS
>      * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
> 
>           * shard-iclb: FAIL (i915#5138) -> PASS
>      * igt@kms_dp_aux_dev:
> 
>           * {shard-rkl}: SKIP (i915#1257) -> PASS
>      * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
> 
>           * shard-iclb: SKIP (i915#3555) -> PASS
>      * igt@kms_frontbuffer_tracking@psr-1p-rte:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#4098) -> PASS +9 similar
>             issues
>      * igt@kms_plane@plane-panning-bottom-right@pipe-a-planes:
> 
>           * {shard-rkl}: SKIP (i915#3558) -> PASS +1 similar issue
>      * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1:
> 
>           * shard-iclb: SKIP (i915#5176) -> PASS +4 similar issues
>      * igt@kms_psr@cursor_render:
> 
>           * {shard-rkl}: SKIP (i915#1072) -> PASS +1 similar issue
>      * igt@kms_psr@psr2_sprite_render:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS +3 similar issues
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-iclb: SKIP (i915#5519) -> PASS
>      * igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:
> 
>           * {shard-rkl}: SKIP (i915#1845 / i915#4070 / i915#4098) -> PASS
>      * igt@kms_vblank@pipe-b-wait-idle-hang:
> 
>           * {shard-rkl}: SKIP (i915#1845 / i915#4098) -> PASS +10 similar
>             issues
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * {shard-rkl}: SKIP (i915#2436) -> PASS
>      * igt@perf@mi-rpc:
> 
>           * {shard-rkl}: SKIP (i915#2434) -> PASS
>      * igt@sysfs_heartbeat_interval@precise@rcs0:
> 
>           * {shard-dg1}: FAIL (i915#1755) -> PASS +1 similar issue
> 
>     Warnings
> 
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-tglb: INCOMPLETE (i915#7248) -> WARN (i915#2658)
>      * igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (fdo#111068 / i915#658)
>      * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (i915#658)
>      * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
> 
>           * shard-iclb: SKIP (i915#658) -> SKIP (i915#2920)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7073 -> IGTPW_8161
> 
>    CI-20190529: 20190529
>    CI_DRM_12439: 1e78c0412b6cc27f0b0e3773377011966757ac38 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_8161: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8161/index.html
>    IGT_7073: d021d66e389f4a759dc749b5f74f278ecd2e6cbf @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
