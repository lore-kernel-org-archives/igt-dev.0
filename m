Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC67C10E1B1
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Dec 2022 06:12:37 +0000 (UTC)
Date: Mon, 19 Dec 2022 07:12:31 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20221219061231.wonejbokrzffuzkg@zkempczy-mobl2>
References: <20221214164747.68626-1-zbigniew.kempczynski@intel.com>
 <167116025961.5852.10636964598978051755@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167116025961.5852.10636964598978051755@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_remnants_in_i915_code_=28rev5=29?=
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

On Fri, Dec 16, 2022 at 03:10:59AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Remove libdrm remnants in i915 code (rev5)                     
>    URL:     https://patchwork.freedesktop.org/series/111200/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8231/index.html 
> 
>            CI Bug Log - changes from IGT_7094_full -> IGTPW_8231_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_8231_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_8231_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8231/index.html
> 
> Participating hosts (11 -> 11)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_8231_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_caching@read-writes:
> 
>           * shard-apl: PASS -> INCOMPLETE +1 similar issue

This is imo unrelated, series drops libdrm usage (bufmgr) so there's
no relationship with the above fail.

I'm going to merge this series.

--
Zbigniew

>      * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
> 
>           * shard-glk: PASS -> WARN
> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@gem_exec_whisper@basic-contexts-priority:
> 
>           * {shard-rkl}: NOTRUN -> INCOMPLETE
>      * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
> 
>           * {shard-tglu}: PASS -> DMESG-WARN
>      * {igt@kms_selftest@all-tests}:
> 
>           * {shard-tglu}: NOTRUN -> SKIP
>      * igt@perf_pmu@all-busy-idle-check-all:
> 
>           * {shard-dg1}: PASS -> FAIL
> 
> New tests
> 
>    New tests have been introduced between IGT_7094_full and IGTPW_8231_full:
> 
>   New IGT tests (1)
> 
>      * igt@kms_ccs:
>           * Statuses :
>           * Exec time: [None] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_8231_full that come from known issues:
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
>      * igt@gem_ctx_persistence@process:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099) +1 similar
>             issue
>      * igt@gem_exec_balancer@parallel:
> 
>           * shard-iclb: PASS -> SKIP (i915#4525)
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#6117)
>      * igt@gem_exec_capture@capture-invisible@smem0:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +79 similar issues
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-glk: PASS -> FAIL (i915#2846)
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-tglb: PASS -> FAIL (i915#2842) +1 similar issue
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842)
>      * igt@gem_lmem_swapping@massive:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4613)
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +1 similar
>             issue
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4613) +1 similar issue
> 
>      * igt@gem_lmem_swapping@verify:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4613)
>      * igt@gem_media_vme:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#284)
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-apl: NOTRUN -> WARN (i915#2658)
>      * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4270)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4270)
> 
>      * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#768)
>      * igt@gem_softpin@evict-single-offset:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#4171)
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#4171)
> 
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3297)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3297)
> 
>      * igt@gen3_render_linear_blits:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109289) +1 similar issue
>      * igt@gen7_exec_parse@basic-allowed:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109289) +2 similar issues
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#5566 / i915#716)
>      * igt@gen9_exec_parse@basic-rejected:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 similar
>             issue
>      * igt@gen9_exec_parse@batch-invalid-length:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2856)
>      * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#7036)
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4281)
>      * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
> 
>           * shard-tglb: NOTRUN -> WARN (i915#2681) +3 similar issues
>      * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
> 
>           * shard-iclb: NOTRUN -> WARN (i915#2684) +3 similar issues
>      * igt@i915_pm_rpm@pc8-residency:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109293 / fdo#109506)
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4387)
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#404)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#404)
> 
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5286)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5286)
> 
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111614) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110725 / fdo#111614) +1 similar
>             issue
> 
>      * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#5138)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615) +2 similar issues
>      * igt@kms_big_joiner@invalid-modeset:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2705)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2705)
> 
>      * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +2 similar
>             issues
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886) +1 similar
>             issue
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689) +3 similar
>             issues
>      * igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6095) +2 similar issues
>      * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +3 similar
>             issues
>      * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +7 similar
>             issues
>      * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#6095) +2 similar
>             issues
>      * igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689) +2 similar issues
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3742)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3742)
> 
>      * igt@kms_chamelium@hdmi-crc-fast:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +4 similar
>             issues
>      * igt@kms_chamelium@hdmi-edid-stress-resolution-4k:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +2 similar
>             issues
>      * igt@kms_chamelium@hdmi-hpd:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +2 similar
>             issues
>      * igt@kms_chamelium@vga-hpd-with-enabled-mode:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar
>             issues
>      * igt@kms_chamelium@vga-hpd-without-ddc:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +6 similar
>             issues
>      * igt@kms_color@deep-color:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3555) +3 similar issues
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3116 / i915#3299)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3116)
> 
>      * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825)
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +2 similar issues
>      * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825 / i915#3637)
>             +3 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2587 / i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672) +2 similar issues
>      * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
> 
>           * shard-iclb: PASS -> SKIP (i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 similar
>             issue
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6497) +3 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +13 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +14 similar
>             issues
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3555) +3 similar issues
>      * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#4573) +5 similar issues
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-1:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5235) +2 similar issues
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5235) +3 similar issues
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:
> 
>           * shard-iclb: PASS -> SKIP (i915#5235) +5 similar issues
>      * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658) +2 similar
>             issues
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658)
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109642 / fdo#111068 / i915#658)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#7037)
> 
>      * igt@kms_psr@psr2_sprite_blt:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109441)
>      * igt@kms_psr@psr2_sprite_mmap_gtt:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +2 similar issues
>      * igt@kms_psr@psr2_sprite_plane_onoff:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +158 similar issues
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467) +2 similar
>             issues
> 
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-tglb: PASS -> SKIP (i915#5519)
> 
>           * shard-iclb: PASS -> SKIP (i915#5519)
> 
>      * igt@kms_vblank@pipe-c-query-busy-hang:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +83 similar issues
>      * igt@kms_vblank@pipe-d-wait-idle:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +7 similar issues
>      * igt@perf_pmu@event-wait@rcs0:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#112283)
>      * igt@prime_vgem@basic-userptr:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109295 / i915#3301)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109295 / i915#3301)
> 
>      * igt@sysfs_clients@pidname:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2994) +1 similar
>             issue
>      * igt@sysfs_clients@recycle:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994)
> 
>     Possible fixes
> 
>      * igt@gem_ctx_isolation@preservation-s3@bcs0:
> 
>           * {shard-rkl}: FAIL (i915#7673) -> PASS +3 similar issues
>      * igt@gem_ctx_persistence@legacy-engines-hang@blt:
> 
>           * {shard-rkl}: SKIP (i915#6252) -> PASS
>      * igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>           * shard-iclb: SKIP (i915#4525) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * {shard-rkl}: FAIL (i915#2846) -> PASS
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS +2 similar issues
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * {shard-rkl}: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_reloc@basic-write-read-active:
> 
>           * {shard-rkl}: SKIP (i915#3281) -> PASS +9 similar issues
>      * igt@gem_partial_pwrite_pread@writes-after-reads-display:
> 
>           * {shard-rkl}: SKIP (i915#3282) -> PASS +2 similar issues
>      * igt@gen9_exec_parse@valid-registers:
> 
>           * {shard-rkl}: SKIP (i915#2527) -> PASS +1 similar issue
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * {shard-tglu}: FAIL (i915#3989 / i915#454) -> PASS
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-iclb: SKIP (i915#4281) -> PASS
>      * igt@i915_pm_rpm@modeset-non-lpsp:
> 
>           * {shard-dg1}: SKIP (i915#1397) -> PASS +1 similar issue
>      * igt@i915_selftest@live@gt_heartbeat:
> 
>           * shard-apl: DMESG-FAIL (i915#5334) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
> 
>           * shard-glk: FAIL (i915#2346) -> PASS
>      * igt@kms_fbcon_fbt@psr:
> 
>           * {shard-rkl}: SKIP (i915#3955) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-badstride:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#4098) -> PASS +10 similar
>             issues
>      * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS +2 similar issues
>      * igt@kms_plane@plane-position-covered@pipe-a-planes:
> 
>           * {shard-rkl}: SKIP (i915#3558) -> PASS +1 similar issue
>      * igt@kms_properties@crtc-properties-atomic:
> 
>           * {shard-rkl}: SKIP (i915#1849) -> PASS
>      * igt@kms_psr@cursor_render:
> 
>           * {shard-rkl}: SKIP (i915#1072) -> PASS
>      * igt@kms_psr@psr2_sprite_render:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS +2 similar issues
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-tglb: SKIP (i915#5519) -> PASS
> 
>           * shard-iclb: SKIP (i915#5519) -> PASS
> 
>      * igt@kms_vblank@pipe-b-wait-busy-hang:
> 
>           * {shard-rkl}: SKIP (i915#1845 / i915#4098) -> PASS +16 similar
>             issues
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * {shard-rkl}: SKIP (i915#2436) -> PASS
>      * igt@perf@stress-open-close:
> 
>           * shard-glk: INCOMPLETE (i915#5213) -> PASS
>      * igt@perf_pmu@idle@rcs0:
> 
>           * {shard-dg1}: FAIL (i915#4349) -> PASS
>      * igt@sysfs_heartbeat_interval@mixed@vecs0:
> 
>           * shard-glk: FAIL (i915#1731) -> PASS
> 
>     Warnings
> 
>      * igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-iclb: SKIP (i915#588) -> SKIP (i915#658)
>      * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
> 
>           * shard-iclb: SKIP (i915#658) -> SKIP (i915#2920)
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (fdo#111068 / i915#658) +1
>             similar issue
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>           * shard-iclb: SKIP (fdo#111068 / i915#658) -> SKIP (i915#2920)
>      * igt@runner@aborted:
> 
>           * shard-apl: (FAIL, FAIL, FAIL, FAIL, FAIL) (i915#180 / i915#3002 /
>             i915#4312) -> (FAIL, FAIL, FAIL) (fdo#109271 / i915#3002 /
>             i915#4312)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7094 -> IGTPW_8231
> 
>    CI-20190529: 20190529
>    CI_DRM_12505: ea0a9ea56dd94ef237bcbaf5ee3641474204a536 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_8231: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8231/index.html
>    IGT_7094: 1763071e9d50c5e992257c9197cb26f166de6fae @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
