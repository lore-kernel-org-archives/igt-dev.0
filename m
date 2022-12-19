Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A3310E110
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Dec 2022 08:02:30 +0000 (UTC)
Date: Mon, 19 Dec 2022 09:02:27 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20221219080227.ozr3veoirdytqn7c@zkempczy-mobl2>
References: <20221215113519.36660-1-zbigniew.kempczynski@intel.com>
 <167119782908.5854.2268372169738159727@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167119782908.5854.2268372169738159727@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGJs?=
 =?utf-8?q?ock-multicopy-*_subtests_=28rev2=29?=
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

On Fri, Dec 16, 2022 at 01:37:09PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add block-multicopy-* subtests (rev2)                          
>    URL:     https://patchwork.freedesktop.org/series/111852/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8240/index.html 
> 
>          CI Bug Log - changes from CI_DRM_12510_full -> IGTPW_8240_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_8240_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_8240_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8240/index.html
> 
> Participating hosts (14 -> 11)
> 
>    Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_8240_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * {igt@gem_ccs@block-multicopy-compressed} (NEW):
> 
>           * shard-iclb: NOTRUN -> SKIP +1 similar issue
> 
>           * {shard-rkl}: NOTRUN -> SKIP +1 similar issue
> 
>           * {shard-dg1}: NOTRUN -> SKIP +1 similar issue
> 
>           * shard-tglb: NOTRUN -> SKIP +1 similar issue
> 
>      * {igt@gem_ccs@block-multicopy-inplace} (NEW):
> 
>           * {shard-tglu}: NOTRUN -> SKIP

Test makes sense on discrete with flatccs (dg2+).


>      * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-64:
> 
>           * shard-glk: PASS -> FAIL

Unrelated to above fail.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@perf_pmu@all-busy-idle-check-all:
>           * {shard-dg1}: PASS -> FAIL
> 
> New tests
> 
>    New tests have been introduced between CI_DRM_12510_full and
>    IGTPW_8240_full:
> 
>   New IGT tests (2)
> 
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * Statuses : 7 skip(s)
>           * Exec time: [0.0] s
>      * igt@gem_ccs@block-multicopy-inplace:
> 
>           * Statuses : 8 skip(s)
>           * Exec time: [0.0] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_8240_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * shard-tglb: PASS -> FAIL (i915#6268)
>      * igt@gem_ctx_param@set-priority-not-supported:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109314)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109314)
> 
>      * igt@gem_ctx_persistence@legacy-engines-hostile:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099)
>      * igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>           * shard-iclb: PASS -> SKIP (i915#4525) +1 similar issue
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#6117)
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-glk: PASS -> FAIL (i915#2846)
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-iclb: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842) +1 similar issue
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-tglb: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-apl: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace@vcs0:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_lmem_swapping@massive:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4613)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4613) +1 similar issue
> 
>      * igt@gem_lmem_swapping@verify:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4613)
>      * igt@gem_media_vme:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#284)
>      * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4270)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4270)
> 
>      * igt@gem_softpin@evict-single-offset:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#4171)
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
>      * igt@gen9_exec_parse@basic-rejected:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 similar
>             issue
>      * igt@gen9_exec_parse@batch-invalid-length:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2856)
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-iclb: PASS -> FAIL (i915#3989 / i915#454)
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4281)
>      * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
> 
>           * shard-tglb: NOTRUN -> WARN (i915#2681) +3 similar issues
>      * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
> 
>           * shard-iclb: NOTRUN -> WARN (i915#2684) +2 similar issues
>      * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#2684 / i915#3591)
>      * igt@i915_pm_rpm@pc8-residency:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109293 / fdo#109506)
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4387)
>      * igt@i915_query@test-query-geometry-subslices:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5723)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5723)
> 
>      * igt@i915_suspend@forcewake:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN (i915#180)
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
>           * shard-tglb: NOTRUN -> SKIP (fdo#111614)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110725 / fdo#111614)
> 
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615) +1 similar issue
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
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +2 similar
>             issues
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886) +1 similar
>             issue
> 
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689) +3 similar
>             issues
>      * igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6095) +2 similar issues
>      * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +2 similar
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
>      * igt@kms_chamelium@hdmi-crc-fast:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +3 similar
>             issues
>      * igt@kms_chamelium@hdmi-edid-stress-resolution-4k:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +2 similar
>             issues
>      * igt@kms_chamelium@hdmi-hpd:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +2 similar
>             issues
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar
>             issues
> 
>      * igt@kms_chamelium@vga-hpd-with-enabled-mode:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar
>             issues
>      * igt@kms_color@deep-color:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3555) +1 similar issue
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3116 / i915#3299)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3116)
> 
>      * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3840)
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#7205)
> 
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +2 similar issues
>      * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825 / i915#3637)
>             +2 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
> 
>           * shard-iclb: PASS -> SKIP (i915#3555)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2587 / i915#2672)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672) +2 similar issues
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 similar
>             issue
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6497) +4 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +13 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +14 similar
>             issues
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +59 similar issues
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3555) +2 similar issues
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-1:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5235) +2 similar issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
> 
>           * shard-iclb: PASS -> SKIP (i915#5235) +2 similar issues
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658)
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109642 / fdo#111068 / i915#658)
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#7037)
> 
>      * igt@kms_psr@psr2_sprite_blt:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109441) +1 similar issue
>      * igt@kms_psr@psr2_sprite_mmap_cpu:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441)
>      * igt@kms_psr@psr2_sprite_plane_onoff:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +62 similar issues
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467) +1 similar
>             issue
> 
>      * igt@kms_vblank@pipe-c-query-busy-hang:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +89 similar issues
>      * igt@kms_vblank@pipe-d-wait-idle:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +7 similar issues
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#533)
> 
>      * igt@perf_pmu@event-wait@rcs0:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#112283)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#112283)
> 
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
>      * igt@v3d/v3d_create_bo@create-bo-4096:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109315) +1 similar issue
>      * igt@v3d/v3d_perfmon@get-values-invalid-pointer:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109315 / i915#2575) +2 similar
>             issues
> 
>     Possible fixes
> 
>      * igt@gem_eio@kms:
> 
>           * {shard-dg1}: FAIL (i915#5784) -> PASS
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * {shard-rkl}: FAIL (i915#2846) -> PASS
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_reloc@basic-wc-read-noreloc:
> 
>           * {shard-rkl}: SKIP (i915#3281) -> PASS +8 similar issues
>      * igt@gem_mmap_gtt@coherency:
> 
>           * {shard-rkl}: SKIP (fdo#111656) -> PASS
>      * igt@gem_pread@snoop:
> 
>           * {shard-rkl}: SKIP (i915#3282) -> PASS
>      * igt@gen9_exec_parse@bb-start-out:
> 
>           * {shard-rkl}: SKIP (i915#2527) -> PASS +1 similar issue
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * {shard-rkl}: SKIP (i915#3361) -> PASS
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-iclb: FAIL (i915#3989 / i915#454) -> PASS
>      * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * {shard-dg1}: SKIP (i915#1397) -> PASS
>      * igt@i915_suspend@basic-s2idle-without-i915:
> 
>           * {shard-rkl}: FAIL (fdo#103375) -> PASS +1 similar issue
>      * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
> 
>           * shard-glk: FAIL (i915#2346) -> PASS +1 similar issue
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
> 
>           * shard-glk: FAIL (i915#79) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#4098) -> PASS +4 similar
>             issues
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:
> 
>           * shard-iclb: SKIP (i915#5235) -> PASS +5 similar issues
>      * igt@kms_psr@dpms:
> 
>           * {shard-rkl}: SKIP (i915#1072) -> PASS
>      * igt@kms_psr@psr2_primary_page_flip:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS +1 similar issue
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-tglb: SKIP (i915#5519) -> PASS
> 
>           * shard-iclb: SKIP (i915#5519) -> PASS
> 
>      * igt@kms_vblank@pipe-a-ts-continuation-idle:
> 
>           * {shard-rkl}: SKIP (i915#1845 / i915#4098) -> PASS +6 similar
>             issues
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * {shard-rkl}: SKIP (i915#2436) -> PASS
>      * igt@sysfs_heartbeat_interval@precise@rcs0:
> 
>           * {shard-dg1}: FAIL (i915#1755) -> PASS +4 similar issues
> 
>     Warnings
> 
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (i915#658)
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (fdo#111068 / i915#658)
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
> 
>           * shard-iclb: SKIP (i915#658) -> SKIP (i915#2920)
>      * igt@runner@aborted:
> 
>           * shard-apl: (FAIL, FAIL) (i915#3002 / i915#4312) -> (FAIL, FAIL,
>             FAIL) (i915#180 / i915#3002 / i915#4312)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7094 -> IGTPW_8240
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_12510: e7a0d02714edf5ceac30b8da5ed7151d7dadbd40 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_8240: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8240/index.html
>    IGT_7094: 1763071e9d50c5e992257c9197cb26f166de6fae @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
