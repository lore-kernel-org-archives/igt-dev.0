Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE35710E1EC
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Nov 2022 06:56:16 +0000 (UTC)
Date: Wed, 23 Nov 2022 07:56:13 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20221123065613.mrqvacudc5gkndng@zkempczy-mobl2>
References: <20221122140007.71246-1-zbigniew.kempczynski@intel.com>
 <166916058121.2185.17889011092064153407@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166916058121.2185.17889011092064153407@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_remnants_in_i915_code?=
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

On Tue, Nov 22, 2022 at 11:43:01PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Remove libdrm remnants in i915 code                            
>    URL:     https://patchwork.freedesktop.org/series/111200/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/index.html 
> 
>          CI Bug Log - changes from CI_DRM_12417_full -> IGTPW_8142_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_8142_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_8142_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/index.html
> 
> Participating hosts (11 -> 8)
> 
>    Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_8142_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>           * shard-apl: PASS -> INCOMPLETE +1 similar issue

Unreleated to the change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_8142_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-iclb: PASS -> SKIP (i915#4525)
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-glk: PASS -> FAIL (i915#2846)
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-apl: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-none@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_exec_params@rsvd2-dirt:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109283)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109283)
> 
>      * igt@gem_softpin@evict-single-offset:
> 
>           * shard-iclb: PASS -> FAIL (i915#4171)
>      * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3297)
>      * igt@gen9_exec_parse@batch-zero-length:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2527 / i915#2856)
>      * igt@i915_pm_rpm@dpms-non-lpsp:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111644 / i915#1397 / i915#2411)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110892)
> 
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4387)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4387)
> 
>      * igt@i915_selftest@live@hangcheck:
> 
>           * shard-tglb: PASS -> DMESG-WARN (i915#5591)
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3826)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3826)
> 
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1:
> 
>           * shard-glk: PASS -> INCOMPLETE (i915#5584)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5286) +2 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5286)
> 
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110723)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615)
> 
>      * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +2 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#6095)
> 
>      * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +1 similar
>             issue
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886)
> 
>      * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +3 similar
>             issues
>      * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689) +1 similar issue
>      * igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689)
>      * igt@kms_chamelium@dp-audio-edid:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +1 similar
>             issue
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +1 similar
>             issue
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827)
> 
>      * igt@kms_color_chamelium@ctm-limited-range:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +1 similar
>             issue
>      * igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180)
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825 / i915#3637)
>             +4 similar issues
>      * igt@kms_flip@2x-flip-vs-panning:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +1 similar issue
>      * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
> 
>           * shard-iclb: PASS -> DMESG-WARN (i915#2867)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672) +1 similar issue
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 similar
>             issue
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +37 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-glk: PASS -> FAIL (i915#2546)
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
> 
>           * shard-iclb: PASS -> FAIL (i915#2546)
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6497) +2 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +8 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +13 similar
>             issues
>      * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109289)
>      * igt@kms_plane_lowres@tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#112054 / i915#5288)
>      * igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3536) +2 similar issues
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-edp-1:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5235) +3 similar issues
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-dp-1:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +39 similar issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
> 
>           * shard-iclb: PASS -> SKIP (i915#5235) +2 similar issues
>      * igt@kms_psr@psr2_cursor_plane_move:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467)
>      * igt@kms_psr@psr2_sprite_blt:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +5 similar issues
>      * igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3555) +1 similar issue
>      * igt@kms_vblank@pipe-d-wait-busy-hang:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +21 similar issues
>      * igt@kms_vrr@flip-suspend:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3555) +3 similar issues
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2437)
>      * igt@perf@stress-open-close:
> 
>           * shard-apl: PASS -> INCOMPLETE (i915#5213)
> 
>     Possible fixes
> 
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * {shard-rkl}: SKIP (i915#3281) -> PASS +12 similar issues
>      * igt@fbdev@unaligned-read:
> 
>           * {shard-rkl}: SKIP (i915#2582) -> PASS
>      * igt@feature_discovery@psr2:
> 
>           * shard-iclb: SKIP (i915#658) -> PASS
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * shard-tglb: FAIL (i915#6268) -> PASS
>      * igt@gem_eio@in-flight-suspend:
> 
>           * {shard-rkl}: FAIL (fdo#103375) -> PASS
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-iclb: SKIP (i915#4525) -> PASS
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * {shard-rkl}: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_schedule@semaphore-power:
> 
>           * {shard-rkl}: SKIP (i915#7276) -> PASS
>      * igt@gem_set_tiling_vs_pwrite:
> 
>           * {shard-rkl}: SKIP (i915#3282) -> PASS +2 similar issues
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * {shard-rkl}: SKIP (i915#2527) -> PASS
>      * igt@i915_hangman@gt-engine-error@bcs0:
> 
>           * {shard-rkl}: SKIP (i915#6258) -> PASS
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-iclb: FAIL (i915#3989 / i915#454) -> PASS +1 similar issue
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-iclb: SKIP (i915#4281) -> PASS
>      * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * {shard-rkl}: SKIP (i915#1397) -> PASS
>      * igt@i915_pm_rpm@system-suspend-modeset:
> 
>           * {shard-rkl}: SKIP (fdo#109308) -> PASS
>      * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs:
> 
>           * {shard-rkl}: SKIP (i915#1845 / i915#4098) -> PASS +16 similar
>             issues
>      * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> 
>           * shard-glk: FAIL (i915#72) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
> 
>           * shard-glk: FAIL (i915#2346) -> PASS
>      * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
> 
>           * shard-apl: FAIL (i915#79) -> PASS
>      * igt@kms_flip@flip-vs-panning-vs-hang@c-dp1:
> 
>           * shard-apl: SKIP (fdo#109271) -> PASS +1 similar issue
>      * igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1:
> 
>           * shard-glk: SKIP (fdo#109271) -> PASS +3 similar issues
>      * igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS
>      * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
> 
>           * shard-iclb: SKIP (i915#3555) -> PASS
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#4098) -> PASS +9 similar
>             issues
>      * igt@kms_psr@primary_page_flip:
> 
>           * {shard-rkl}: SKIP (i915#1072) -> PASS +1 similar issue
>      * igt@kms_psr@psr2_primary_page_flip:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS
>      * igt@perf@gen12-unprivileged-single-ctx-counters:
> 
>           * {shard-rkl}: SKIP (fdo#109289) -> PASS
>      * igt@perf@mi-rpc:
> 
>           * {shard-rkl}: SKIP (i915#2434) -> PASS
>      * igt@perf_pmu@busy-double-start@vcs1:
> 
>           * {shard-dg1}: FAIL (i915#4349) -> PASS
>      * igt@prime_vgem@basic-read:
> 
>           * {shard-rkl}: SKIP (fdo#109295 / i915#3291 / i915#3708) -> PASS
> 
>     Warnings
> 
>      * igt@gem_pread@exhaustion:
> 
>           * shard-apl: INCOMPLETE (i915#7248) -> WARN (i915#2658)
> 
>           * shard-glk: INCOMPLETE (i915#7248) -> WARN (i915#2658)
> 
>      * igt@kms_content_protection@mei_interface:
> 
>           * shard-tglb: SKIP (i915#7118) -> SKIP (fdo#109300)
> 
>           * shard-iclb: SKIP (i915#7118) -> SKIP (fdo#109300)
> 
>      * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
> 
>           * shard-apl: DMESG-FAIL (IGT#6) -> FAIL (i915#4573) +1 similar
>             issue
>      * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-iclb: SKIP (i915#658) -> SKIP (i915#2920) +2 similar issues
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> 
>           * shard-iclb: SKIP (fdo#111068 / i915#658) -> SKIP (i915#2920) +1
>             similar issue
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (fdo#111068 / i915#658)
>      * igt@runner@aborted:
> 
>           * shard-apl: (FAIL, FAIL, FAIL) (i915#180 / i915#3002 / i915#4312)
>             -> (FAIL, FAIL, FAIL, FAIL) (i915#3002 / i915#4312)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7071 -> IGTPW_8142
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_12417: 146bf59b0038cbb0c1665088db64c46c1d420630 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_8142: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8142/index.html
>    IGT_7071: 0801475083ccb938b1d3b358502ff97fdb435585 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
