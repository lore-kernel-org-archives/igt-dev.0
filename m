Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF86610E073
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 06:06:24 +0000 (UTC)
Date: Mon, 26 Jun 2023 08:06:18 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230626060618.l2uyvormp5q66eta@zkempczy-mobl2>
References: <20230623084635.350402-1-zbigniew.kempczynski@intel.com>
 <168753447414.31833.17744564989417591728@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168753447414.31833.17744564989417591728@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2lu?=
 =?utf-8?q?tel=5Fblt=3A_Prepare_blt_library_to_support_xe?=
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

On Fri, Jun 23, 2023 at 03:34:34PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/intel_blt: Prepare blt library to support xe               
>    URL:     https://patchwork.freedesktop.org/series/119792/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9245/index.html 
> 
>          CI Bug Log - changes from CI_DRM_13312_full -> IGTPW_9245_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_9245_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_9245_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9245/index.html
> 
> Participating hosts (9 -> 8)
> 
>    Missing (1): shard-tglu0
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_9245_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_pm_rps@reset:
>           * shard-tglu: PASS -> FAIL

Unrelated to the change. Structure of code was altered, not the logic.
I'm going to merge it as I need rebase on top of it.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@i915_pm_rps@reset:
>           * {shard-dg2}: PASS -> FAIL
> 
> New tests
> 
>    New tests have been introduced between CI_DRM_13312_full and
>    IGTPW_9245_full:
> 
>   New IGT tests (2)
> 
>      * igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-b-dp-2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
>      * igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-c-dp-2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.0] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_9245_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8411)
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7701)
>      * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#7742)
>      * igt@gem_bad_reloc@negative-reloc-lut:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +2 similar issues
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#4579 / i915#5325)
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4579 / i915#5325)
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4579 / i915#5325)
> 
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * shard-rkl: PASS -> FAIL (i915#6268)
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_endless@dispatch@vcs1:
> 
>           * shard-tglu: PASS -> TIMEOUT (i915#3778)
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-rkl: PASS -> FAIL (i915#2846)
>      * igt@gem_exec_fair@basic-none@vecs0:
> 
>           * shard-rkl: PASS -> FAIL (i915#2842) +1 similar issue
>      * igt@gem_exec_fair@basic-pace@vcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842) +2 similar issues
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2190)
>      * igt@gem_lmem_swapping@massive:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +1 similar issue
>      * igt@gem_lmem_swapping@smem-oom:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +3 similar issues
>      * igt@gem_ppgtt@blt-vs-render-ctx0:
> 
>           * shard-snb: PASS -> DMESG-FAIL (i915#8295)
>      * igt@gem_pxp@create-valid-protected-context:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4270) +1 similar issue
>      * igt@gem_pxp@reject-modify-context-protection-on:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4270) +3 similar issues
>      * igt@gem_set_tiling_vs_pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +4 similar issues
>      * igt@gem_softpin@evict-snoop:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109312)
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109312)
> 
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3323)
>      * igt@gem_userptr_blits@readonly-pwrite-unsync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297)
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 similar
>             issue
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527)
>      * igt@i915_pm_backlight@bad-brightness:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7561)
>      * igt@i915_pm_dc@dc5-psr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#658)
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#658)
> 
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-tglu: PASS -> FAIL (i915#3989 / i915#454)
>      * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-rkl: PASS -> SKIP (i915#1397) +2 similar issues
>      * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1397)
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111644 / i915#1397)
> 
>      * igt@i915_pm_rpm@modeset-pc8-residency-stress:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109506)
>      * igt@i915_query@query-topology-unsupported:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109302)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-rkl: PASS -> FAIL (fdo#103375)
>      * igt@i915_suspend@fence-restore-untiled:
> 
>           * shard-tglu: PASS -> ABORT (i915#5122)
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8502) +3 similar issues
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#5286) +3 similar
>             issues
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286)
> 
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111614 / i915#3638) +1 similar
>             issue
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111614) +3 similar issues
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>           * shard-rkl: PASS -> FAIL (i915#3743) +1 similar issue
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +46 similar issues
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111615)
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615) +3 similar issues
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#110723)
> 
>      * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_mc_ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354 / i915#6095) +7 similar
>             issues
>      * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3689 / i915#5354 / i915#6095) +8
>             similar issues
>      * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +4 similar
>             issues
>      * igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_rc_ccs_cc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5354 / i915#6095) +24 similar
>             issues
>      * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3689 / i915#3886 / i915#5354 /
>             i915#6095) +1 similar issue
>      * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5354) +10 similar issues
>      * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#3689 / i915#5354 /
>             i915#6095) +1 similar issue
>      * igt@kms_chamelium_color@ctm-limited-range:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111827)
>      * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7828) +5 similar issues
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7828)
> 
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4579 / i915#6944 / i915#7116 /
>             i915#7118)
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3359)
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#4579) +3 similar
>             issues
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274)
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274 / fdo#111767)
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-apl: PASS -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: PASS -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@forked-move@pipe-b:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#8011)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4579)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3840 / i915#4579)
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825) +2 similar issues
>      * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL (i915#79) +1 similar issue
>      * igt@kms_flip@2x-nonexisting-fb:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109274 / i915#3637) +5 similar
>             issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2672 / i915#4579)
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672 / i915#4579) +1
>             similar issue
> 
>      * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4579) +4 similar
>             issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +8 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109280) +21 similar issues
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#110189) +21 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111825 / i915#1825) +9 similar
>             issues
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-tglu: PASS -> SKIP (i915#433)
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4579 / i915#6953 / i915#8228)
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4579 / i915#6953 / i915#8228)
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4579 / i915#6301)
>      * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: PASS -> FAIL (i915#8292)
>      * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5176) +2 similar issues
>      * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4579 / i915#5176) +2 similar
>             issues
>      * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +22 similar issues
>      * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-b-vga-1:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#4579) +12 similar
>             issues
>      * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5176) +2 similar issues
>      * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4579 / i915#5176)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5235) +2 similar issues
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4579 / i915#5235)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5235) +2 similar issues
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4579 / i915#5235) +2 similar
>             issues
>      * igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#111068 / i915#658)
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111068 / i915#658) +1 similar
>             issue
>      * igt@kms_psr@psr2_sprite_plane_onoff:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072) +1 similar issue
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#111615 / i915#5289)
>      * igt@kms_scaling_modes@scaling-mode-center:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#4579) +4 similar
>             issues
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#8623) +1 similar issue
>      * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8623)
>      * igt@kms_vblank@pipe-d-query-idle-hang:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4070 / i915#533 / i915#6768)
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2437)
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109295 / fdo#111656)
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109295)
>      * igt@v3d/v3d_job_submission@threaded-job-submission:
> 
>           * shard-rkl: NOTRUN -> SKIP (fdo#109315) +4 similar issues
>      * igt@v3d/v3d_submit_cl@valid-submission:
> 
>           * shard-tglu: NOTRUN -> SKIP (fdo#109315 / i915#2575) +9 similar
>             issues
>      * igt@vc4/vc4_perfmon@get-values-invalid-pointer:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2575) +5 similar issues
>      * igt@vc4/vc4_tiling@get-bad-handle:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7711) +1 similar issue
> 
>     Possible fixes
> 
>      * igt@gem_barrier_race@remote-request@rcs0:
> 
>           * shard-rkl: ABORT (i915#7461 / i915#8211) -> PASS
> 
>           * shard-tglu: ABORT (i915#8211 / i915#8234) -> PASS
> 
>      * igt@gem_ctx_exec@basic-nohangcheck:
> 
>           * shard-tglu: FAIL (i915#6268) -> PASS
>      * igt@gem_eio@unwedge-stress:
> 
>           * {shard-dg1}: FAIL (i915#5784) -> PASS
>      * igt@gem_eio@wait-wedge-immediate:
> 
>           * {shard-dg1}: DMESG-WARN -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-glk: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_suspend@basic-s4-devices@smem:
> 
>           * shard-tglu: ABORT (i915#7975 / i915#8213) -> PASS
>      * igt@gem_workarounds@suspend-resume-fd:
> 
>           * shard-tglu: ABORT (i915#5122 / i915#5251) -> PASS
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-apl: SKIP (fdo#109271) -> PASS
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
> 
>           * {shard-dg1}: SKIP (i915#1937 / i915#4579) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
> 
>           * {shard-dg1}: FAIL (i915#3591) -> PASS
>      * igt@i915_pm_rpm@modeset-lpsp-stress:
> 
>           * {shard-dg2}: SKIP (i915#1397) -> PASS +2 similar issues
>      * igt@i915_pm_rpm@modeset-non-lpsp:
> 
>           * {shard-dg1}: SKIP (i915#1397) -> PASS
>      * igt@i915_pm_rps@engine-order:
> 
>           * shard-apl: FAIL (i915#6537) -> PASS
>      * igt@i915_selftest@live@gt_heartbeat:
> 
>           * shard-glk: DMESG-FAIL (i915#5334) -> PASS
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * {shard-dg2}: FAIL (fdo#103375) -> PASS +4 similar issues
>      * igt@kms_cursor_legacy@forked-move@pipe-b:
> 
>           * {shard-dg1}: INCOMPLETE (i915#8011 / i915#8347) -> PASS
>      * igt@kms_cursor_legacy@single-bo@pipe-b:
> 
>           * shard-rkl: INCOMPLETE (i915#8011) -> PASS
>      * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
> 
>           * shard-glk: FAIL (i915#79) -> PASS
>      * igt@syncobj_timeline@wait-for-submit-complex:
> 
>           * {shard-dg1}: DMESG-WARN (i915#4391) -> PASS +1 similar issue
> 
>     Warnings
> 
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>           * shard-rkl: SKIP (i915#4070 / i915#4816) -> SKIP (i915#4816)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7347 -> IGTPW_9245
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_13312: 08d15de81b3b0db3c9046d2556c10b9f136cc90f @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_9245: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9245/index.html
>    IGT_7347: 621c2d3115d40a1ba0b53668413ea21edf03a5ff @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
