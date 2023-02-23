Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE6B10E4FB
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 17:09:21 +0000 (UTC)
Date: Thu, 23 Feb 2023 18:07:20 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230223170720.y36hezpnnjuuvrnt@zkempczy-mobl2>
References: <20230223105321.49048-1-zbigniew.kempczynski@intel.com>
 <167716534104.15875.13824927551912204466@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167716534104.15875.13824927551912204466@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_lib/igt=5Fmap=3A_Add_32-bit_an?=
 =?utf-8?q?d_64-bit_hash_helper_functions?=
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

On Thu, Feb 23, 2023 at 03:15:41PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  series starting with [i-g-t,1/3] lib/igt_map: Add 32-bit and      
>             64-bit hash helper functions                                      
>    URL:     https://patchwork.freedesktop.org/series/114287/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8521/index.html    
> 
>            CI Bug Log - changes from IGT_7170_full -> IGTPW_8521_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_8521_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_8521_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8521/index.html
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_8521_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@migrate:
>           * shard-glk: PASS -> DMESG-FAIL

Unrelated to the change.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * {igt@kms_hdr@invalid-hdr}:
> 
>           * {shard-tglu}: NOTRUN -> SKIP
>      * {igt@kms_hdr@invalid-metadata-sizes}:
> 
>           * shard-tglu-10: NOTRUN -> SKIP
> 
> Known issues
> 
>    Here are the changes found in IGTPW_8521_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@debugfs_test@basic-hwmon:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#7456)
>      * igt@drm_mm@all-tests:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#6433)
>      * igt@feature_discovery@display-2x:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#1839)
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#5325)
>      * igt@gem_exec_fair@basic-none@rcs0:
> 
>           * shard-tglu-10: NOTRUN -> FAIL (i915#2842) +6 similar issues
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842) +2 similar issues
>      * igt@gem_exec_params@rsvd2-dirt:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#109283)
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#4613) +4 similar issues
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613)
>      * igt@gem_pxp@create-regular-buffer:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#4270) +2 similar issues
>      * igt@gem_userptr_blits@readonly-pwrite-unsync:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#3297) +2 similar issues
>      * igt@gen9_exec_parse@batch-without-end:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#2527 / i915#2856) +3 similar
>             issues
>      * igt@i915_pm_rpm@modeset-pc8-residency-stress:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#109506) +1 similar issue
>      * igt@i915_query@query-topology-known-pci-ids:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#109303)
>      * igt@i915_query@test-query-geometry-subslices:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#5723)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#5286) +6 similar issues
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#111614)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#111615) +7 similar issues
>      * igt@kms_big_joiner@2x-modeset:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#2705) +1 similar issue
>      * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#3689 / i915#3886) +5 similar
>             issues
>      * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#3689 / i915#6095) +6 similar
>             issues
>      * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +1 similar
>             issue
>      * igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#111615 / i915#3689) +8 similar
>             issues
>      * igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#6095) +7 similar issues
>      * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#3689) +8 similar issues
>      * igt@kms_chamelium_color@gamma:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#111827) +1 similar issue
>      * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#7828) +9 similar issues
>      * igt@kms_color@ctm-max@pipe-a-hdmi-a-1:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +43 similar issues
>      * igt@kms_content_protection@lic:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118)
>             +2 similar issues
>      * igt@kms_content_protection@srm@pipe-a-dp-1:
> 
>           * shard-apl: NOTRUN -> TIMEOUT (i915#7173)
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#109274) +5 similar issues
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-apl: PASS -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_flip@2x-absolute-wf_vblank:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#109274 / i915#3637 /
>             i915#3966)
>      * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL (i915#79) +2 similar issues
>      * igt@kms_flip@2x-flip-vs-suspend:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#109274 / i915#3637) +8 similar
>             issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#2587 / i915#2672) +3 similar
>             issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#110189) +33 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#5439) +1 similar issue
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#109280) +40 similar issues
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#109289) +3 similar issues
>      * igt@kms_plane_lowres@tiling-4:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#112054 / i915#5288) +1 similar
>             issue
>      * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-1:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#5176) +11 similar issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-1:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#5235) +3 similar issues
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#6524)
>      * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#658) +2 similar issues
>      * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#111068 / i915#658) +1 similar
>             issue
>      * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#5461)
>      * igt@kms_setmode@basic@pipe-a-vga-1:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#5465) +1 similar issue
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#109309)
>      * igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +26 similar issues
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#3555) +4 similar issues
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#2437) +1 similar issue
>      * igt@v3d/v3d_get_param@get-bad-flags:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (fdo#109315 / i915#2575) +4 similar
>             issues
>      * igt@vc4/vc4_purgeable_bo@mark-willneed:
> 
>           * shard-tglu-10: NOTRUN -> SKIP (i915#2575) +9 similar issues
> 
>     Possible fixes
> 
>      * igt@device_reset@unbind-reset-rebind:
> 
>           * {shard-rkl}: FAIL (i915#4778) -> PASS
>      * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
> 
>           * {shard-rkl}: FAIL (i915#7742) -> PASS
>      * igt@fbdev@unaligned-write:
> 
>           * {shard-rkl}: SKIP (i915#2582) -> PASS
>      * igt@gem_ctx_persistence@heartbeat-many:
> 
>           * {shard-rkl}: SKIP (fdo#109315) -> PASS +9 similar issues
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * {shard-rkl}: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-apl: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-pace@vcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS +2 similar issues
>      * igt@gem_exec_reloc@basic-gtt:
> 
>           * {shard-rkl}: SKIP (i915#3281) -> PASS +3 similar issues
>      * igt@gem_mmap_gtt@coherency:
> 
>           * {shard-rkl}: SKIP (fdo#111656) -> PASS
>      * igt@gem_pwrite@basic-self:
> 
>           * {shard-rkl}: SKIP (i915#3282) -> PASS
>      * igt@gen9_exec_parse@bb-secure:
> 
>           * {shard-rkl}: SKIP (i915#2527) -> PASS
>      * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * {shard-rkl}: SKIP (i915#4098) -> PASS
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * {shard-rkl}: SKIP (i915#658) -> PASS
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * {shard-tglu}: SKIP (i915#4281) -> PASS
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
> 
>           * {shard-tglu}: FAIL (i915#3825) -> PASS
>      * igt@i915_pm_rpm@system-suspend-devices:
> 
>           * {shard-rkl}: SKIP (i915#5174) -> PASS
>      * igt@i915_suspend@basic-s2idle-without-i915:
> 
>           * {shard-rkl}: FAIL (fdo#103375) -> PASS
>      * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
> 
>           * {shard-rkl}: SKIP (i915#1845 / i915#4098) -> PASS +5 similar
>             issues
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-apl: FAIL (i915#2346) -> PASS
> 
>           * shard-glk: FAIL (i915#2346) -> PASS
> 
>      * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:
> 
>           * shard-glk: FAIL (i915#79) -> PASS
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#4098) -> PASS +4 similar
>             issues
>      * igt@kms_psr@primary_blt:
> 
>           * {shard-rkl}: SKIP (i915#1072) -> PASS
>      * igt@perf_pmu@cpu-hotplug:
> 
>           * {shard-rkl}: SKIP (i915#5608) -> PASS +1 similar issue
>      * igt@prime_vgem@basic-write:
> 
>           * {shard-rkl}: SKIP (fdo#109295 / i915#3291 / i915#3708) -> PASS
>      * igt@prime_vgem@coherency-gtt:
> 
>           * {shard-rkl}: SKIP (fdo#109295 / fdo#111656 / i915#3708) -> PASS
>      * igt@syncobj_wait@wait-any-interrupted:
> 
>           * {shard-rkl}: SKIP (i915#2575) -> PASS +3 similar issues
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7170 -> IGTPW_8521
> 
>    CI-20190529: 20190529
>    CI_DRM_12771: ece65b96d1b8f85b072394700a32cd30831c4f33 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_8521: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8521/index.html
>    IGT_7170: e6d15f2d2f299ce70206a40609bebf661f7fdc65 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
