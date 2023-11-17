Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34A210E111
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Nov 2023 05:53:09 +0000 (UTC)
Date: Fri, 17 Nov 2023 06:53:04 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231117055304.7yc4td6wmoagdnsy@zkempczy-mobl2>
References: <20231114114943.79965-1-zbigniew.kempczynski@intel.com>
 <170018036494.7875.941359601075478984@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170018036494.7875.941359601075478984@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGRn?=
 =?utf-8?q?1_compute_pipeline_=28rev4=29?=
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

On Fri, Nov 17, 2023 at 12:19:24AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add dg1 compute pipeline (rev4)                                 
>    URL:     https://patchwork.freedesktop.org/series/126077/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10188/index.html 
> 
>           CI Bug Log - changes from IGT_7589_full -> IGTPW_10188_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_10188_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_10188_full, please notify your bug team
>    (lgci.bug.filing@intel.com) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10188/index.html
> 
> Participating hosts (11 -> 12)
> 
>    Additional (1): shard-tglu0
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_10188_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_ctx_isolation@preservation-s3@bcs0:
> 
>           * shard-tglu: PASS -> INCOMPLETE
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-rkl: NOTRUN -> SKIP +1 other test skip
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-dg2: NOTRUN -> SKIP +2 other tests skip
>      * igt@kms_psr@psr2_sprite_mmap_cpu:
> 
>           * shard-dg1: NOTRUN -> SKIP +4 other tests skip

Above regressions are not related to the series.

<cut>

>     Possible fixes
> 
>      * igt@api_intel_bb@blit-reloc-purge-cache:
> 
>           * shard-rkl: SKIP ([i915#8411]) -> PASS
>      * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
> 
>           * shard-rkl: FAIL ([i915#7742]) -> PASS
>      * {igt@drm_mm@drm_mm@drm_test_mm_lowest}:
> 
>           * shard-snb: TIMEOUT -> PASS
>      * {igt@gem_compute@compute-square}:
> 
>           * shard-dg1: SKIP ([i915#9310]) -> PASS

Series fixes above skip on dg1 so I'm going to merge it.

--
Zbigniew


>      * igt@gem_ctx_persistence@hang:
> 
>           * shard-rkl: SKIP ([i915#6252]) -> PASS
>      * igt@gem_eio@kms:
> 
>           * shard-mtlp: ABORT ([i915#7892] / [i915#9414]) -> PASS
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-rkl: FAIL ([i915#2846]) -> PASS
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-glk: FAIL ([i915#2842]) -> PASS
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-rkl: FAIL ([i915#2842]) -> PASS +1 other test pass
>      * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>           * shard-rkl: SKIP ([i915#3281]) -> PASS +3 other tests pass
>      * igt@gem_set_tiling_vs_pwrite:
> 
>           * shard-rkl: SKIP ([i915#3282]) -> PASS +1 other test pass
>      * igt@gem_userptr_blits@huge-split:
> 
>           * shard-dg2: FAIL ([i915#3318]) -> PASS
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-rkl: SKIP ([i915#2527]) -> PASS
>      * igt@i915_hangman@gt-engine-error@bcs0:
> 
>           * shard-rkl: SKIP ([i915#9588]) -> PASS
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-mtlp: ABORT ([i915#8489] / [i915#8668]) -> PASS
>      * igt@i915_pipe_stress@stress-xrgb8888-untiled:
> 
>           * shard-apl: FAIL ([i915#7036]) -> PASS
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-rkl: SKIP ([i915#4387]) -> PASS
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-tglu: FAIL ([i915#3743]) -> PASS
>      * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:
> 
>           * shard-mtlp: ABORT ([i915#9414]) -> PASS
>      * igt@kms_color@gamma@pipe-a:
> 
>           * shard-rkl: SKIP ([i915#4098]) -> PASS +6 other tests pass
>      * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
> 
>           * shard-glk: DMESG-FAIL (i915#118) -> PASS
>      * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
> 
>           * shard-rkl: SKIP (i915#1845 / [i915#4098]) -> PASS +18 other tests
>             pass
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-apl: FAIL (i915#2346) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-dg2: FAIL ([i915#6880]) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
> 
>           * shard-rkl: SKIP (i915#1849 / [i915#4098]) -> PASS +12 other tests
>             pass
>      * {igt@kms_pm_dc@dc6-dpms}:
> 
>           * shard-tglu: FAIL ([i915#9295]) -> PASS
>      * {igt@kms_pm_rpm@dpms-lpsp}:
> 
>           * shard-rkl: SKIP ([i915#9519]) -> PASS +2 other tests pass
>      * {igt@kms_pm_rpm@modeset-lpsp-stress}:
> 
>           * shard-dg1: SKIP ([i915#9519]) -> PASS +3 other tests pass
>      * igt@kms_properties@plane-properties-legacy:
> 
>           * shard-rkl: SKIP (i915#1849) -> PASS +1 other test pass
>      * {igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode}:
> 
>           * shard-tglu: TIMEOUT -> PASS
>      * {igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create}:
> 
>           * shard-glk: TIMEOUT -> PASS
> 
>           * shard-rkl: TIMEOUT -> PASS +1 other test pass
> 
>      * {igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:
> 
>           * shard-apl: TIMEOUT -> PASS
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1:
> 
>           * shard-snb: FAIL ([i915#9196]) -> PASS
>      * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
> 
>           * shard-mtlp: FAIL ([i915#9196]) -> PASS +1 other test pass
>      * {igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-dp-1}:
> 
>           * shard-apl: INCOMPLETE ([i915#9159]) -> PASS
>      * igt@perf_pmu@busy-double-start@bcs0:
> 
>           * shard-mtlp: FAIL ([i915#4349]) -> PASS
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * shard-rkl: SKIP (fdo#109295 / [i915#3708] / [i915#4098]) -> PASS
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-rkl: SKIP (fdo#109295 / fdo#111656 / [i915#3708]) -> PASS
> 
>     Warnings
> 
>      * igt@gem_ccs@block-multicopy-inplace:
> 
>           * shard-rkl: SKIP ([i915#7957]) -> SKIP ([i915#3555])
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-rkl: SKIP ([i915#7957]) -> SKIP ([i915#4098] / [i915#9323])
>      * igt@gem_eio@in-flight-external:
> 
>           * shard-mtlp: ABORT ([i915#9414]) -> ABORT ([i915#9262])
>      * igt@gem_exec_fair@basic-none@bcs0:
> 
>           * shard-rkl: FAIL ([i915#2842]) -> SKIP ([i915#9591])
>      * igt@gem_mmap_gtt@basic-short:
> 
>           * shard-dg1: SKIP ([i915#4077]) -> SKIP ([i915#4077] / [i915#4423])
>      * igt@gen9_exec_parse@bb-oversize:
> 
>           * shard-rkl: SKIP ([i915#2532]) -> SKIP ([i915#2527])
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> 
>           * shard-rkl: SKIP ([i915#5286]) -> SKIP (i915#1845 / [i915#4098])
>             +3 other tests skip
>      * igt@kms_big_fb@4-tiled-addfb:
> 
>           * shard-rkl: SKIP (i915#1845 / [i915#4098]) -> SKIP ([i915#5286])
>             +3 other tests skip
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-rkl: SKIP (fdo#111614 / [i915#3638]) -> SKIP (i915#1845 /
>             [i915#4098]) +1 other test skip
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> 
>           * shard-rkl: SKIP (i915#1845 / [i915#4098]) -> SKIP (fdo#111614 /
>             [i915#3638]) +1 other test skip
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
> 
>           * shard-rkl: SKIP (i915#1845 / [i915#4098]) -> SKIP (fdo#110723) +3
>             other tests skip
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>           * shard-rkl: SKIP (fdo#110723) -> SKIP (i915#1845 / [i915#4098]) +4
>             other tests skip
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-rkl: SKIP (i915#1845 / [i915#4098]) -> SKIP ([i915#3116])
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg2: SKIP ([i915#7118] / [i915#7162]) -> SKIP ([i915#7118])
>      * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> 
>           * shard-rkl: SKIP (fdo#111825) -> SKIP (i915#1845 / [i915#4098])
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>           * shard-rkl: SKIP (i915#1845 / [i915#4098]) -> SKIP (fdo#111767 /
>             fdo#111825)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>           * shard-rkl: SKIP (i915#1845 / [i915#4098]) -> SKIP (fdo#111825) +2
>             other tests skip
>      * igt@kms_dsc@dsc-with-bpc:
> 
>           * shard-rkl: SKIP ([i915#3555] / [i915#3840]) -> SKIP (i915#1845 /
>             [i915#4098]) +1 other test skip
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-rkl: SKIP (fdo#110189 / [i915#3955]) -> SKIP ([i915#3955])
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-rkl: SKIP ([i915#3955]) -> SKIP (fdo#110189 / [i915#3955])
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * shard-rkl: SKIP (fdo#109285 / [i915#4098]) -> SKIP (fdo#109285)
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
> 
>           * shard-rkl: SKIP (i915#1849 / [i915#4098]) -> SKIP (fdo#111825 /
>             i915#1825) +32 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
> 
>           * shard-rkl: SKIP (fdo#111825) -> SKIP (i915#1849 / [i915#4098])
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
> 
>           * shard-rkl: SKIP (i915#1849 / [i915#4098]) -> SKIP ([i915#3023])
>             +14 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (fdo#111825 / i915#1825) -> SKIP (i915#1849 /
>             [i915#4098]) +22 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#1849 / [i915#4098]) -> SKIP (fdo#111825)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP ([i915#3023]) -> SKIP (i915#1849 / [i915#4098])
>             +18 other tests skip
>      * igt@kms_hdr@static-swap:
> 
>           * shard-rkl: SKIP (i915#1845 / [i915#4098]) -> SKIP ([i915#3555] /
>             [i915#8228])
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-rkl: SKIP ([i915#3555] / [i915#8228]) -> SKIP (i915#1845 /
>             [i915#4098])
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-rkl: SKIP ([i915#4070] / [i915#4816]) -> SKIP (i915#1839 /
>             [i915#4070] / [i915#4816])
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-rkl: SKIP (i915#1845 / [i915#4098]) -> SKIP ([i915#6301])
>      * igt@kms_plane_lowres@tiling-yf:
> 
>           * shard-rkl: SKIP (i915#1845 / [i915#4098]) -> SKIP ([i915#3555])
>             +3 other tests skip
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-rkl: SKIP (fdo#111825) -> SKIP (fdo#111825 / [i915#8152])
>      * igt@kms_scaling_modes@scaling-mode-center:
> 
>           * shard-rkl: SKIP ([i915#3555]) -> SKIP (i915#1845 / [i915#4098])
>             +1 other test skip
>      * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
> 
>           * shard-dg2: INCOMPLETE ([i915#5493]) -> CRASH ([i915#9351])
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
