Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF22E112B1E
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 05:16:48 +0000 (UTC)
Date: Wed, 25 May 2022 07:16:43 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yo27u1ibhPdZnCzL@zkempczy-mobl2>
References: <20220524111836.152123-1-zbigniew.kempczynski@intel.com>
 <165340689128.14321.17779387192328249509@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165340689128.14321.17779387192328249509@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2lu?=
 =?utf-8?q?tel=5Fbatchbuffer=3A_Use_detected_start_offset_in_intel-bb_inst?=
 =?utf-8?q?ead_0x0?=
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

On Tue, May 24, 2022 at 03:41:31PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/intel_batchbuffer: Use detected start offset in intel-bb      
>             instead 0x0                                                       
>    URL:     https://patchwork.freedesktop.org/series/104314/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7160/index.html    
> 
>          CI Bug Log - changes from CI_DRM_11694_full -> IGTPW_7160_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_7160_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_7160_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7160/index.html
> 
> Participating hosts (13 -> 10)
> 
>    Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_7160_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@prime_mmap_coherency@ioctl-errors:
>           * shard-apl: PASS -> INCOMPLETE

Looks like kernel bug, not related to the change.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * {igt@kms_hdr@bpc-switch-dpms@pipe-a-hdmi-a-1}:
> 
>           * {shard-tglu}: NOTRUN -> SKIP
> 
>           * {shard-dg1}: NOTRUN -> SKIP
> 
>      * {igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1}:
> 
>           * shard-glk: SKIP (fdo#109271) -> FAIL +1 similar issue
> 
> New tests
> 
>    New tests have been introduced between CI_DRM_11694_full and
>    IGTPW_7160_full:
> 
>   New IGT tests (4)
> 
>      * igt@kms_atomic_interruptible@legacy-dpms@hdmi-a-3-pipe-a:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [6.16] s
>      * igt@kms_flip@2x-dpms-vs-vblank-race@ab-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [4.66] s
>      * igt@kms_flip@2x-dpms-vs-vblank-race@ac-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [4.30] s
>      * igt@kms_flip@2x-dpms-vs-vblank-race@bc-hdmi-a1-hdmi-a2:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [4.24] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_7160_full that come from known issues:
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
>      * igt@feature_discovery@display-4x:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +113 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1839) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#1839)
> 
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3555 / i915#5325)
>      * igt@gem_ccs@block-copy-uncompressed:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5327)
>      * igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180)
>      * igt@gem_ctx_persistence@smoketest:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099) +2 similar
>             issues
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#280)
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-iclb: PASS -> SKIP (i915#4525)
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-tglb: PASS -> FAIL (i915#2842) +2 similar issues
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-apl: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_exec_params@rsvd2-dirt:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109283)
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4613) +3 similar issues
>      * igt@gem_lmem_swapping@heavy-verify-random:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +5 similar
>             issues
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4613) +5 similar issues
> 
>      * igt@gem_lmem_swapping@parallel-multi:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +2 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4613) +3 similar
>             issues
> 
>      * igt@gem_media_vme:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#284)
>      * igt@gem_pxp@reject-modify-context-protection-on:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4270) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4270)
> 
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#768) +2 similar issues
>      * igt@gem_softpin@evict-snoop-interruptible:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109312)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109312)
> 
>      * igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3297) +1 similar issue
>      * igt@gem_userptr_blits@unsync-unmap-cycles:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3297) +3 similar issues
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#3318)
>      * igt@gen7_exec_parse@oacontrol-tracking:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109289) +2 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109289) +1 similar issue
> 
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2527 / i915#2856) +3 similar
>             issues
> 
>           * shard-glk: NOTRUN -> DMESG-WARN (i915#5566 / i915#716)
> 
>      * igt@gen9_exec_parse@valid-registers:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2856) +2 similar issues
>      * igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#658)
>      * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111644 / i915#1397 / i915#2411)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110892)
> 
>      * igt@i915_pm_rpm@pc8-residency:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109293 / fdo#109506)
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109506 / i915#2411)
> 
>      * igt@i915_suspend@fence-restore-untiled:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN (i915#180)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +139 similar issues
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5286) +5 similar issues
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5286) +4 similar issues
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111614) +1 similar issue
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110725 / fdo#111614) +1 similar
>             issue
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615) +6 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110723) +1 similar issue
> 
>      * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689) +5 similar issues
>      * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886) +4 similar
>             issues
>      * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +4 similar
>             issues
>      * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +5 similar
>             issues
>      * igt@kms_ccs@pipe-c-bad-rotation-90-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689) +3 similar
>             issues
>      * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +6 similar
>             issues
>      * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +3 similar
>             issues
>      * igt@kms_chamelium@hdmi-edid-read:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +10 similar
>             issues
>      * igt@kms_chamelium@hdmi-hpd-fast:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +15 similar
>             issues
>      * igt@kms_color@pipe-c-deep-color:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3555) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3555)
> 
>      * igt@kms_color@pipe-d-ctm-blue-to-red:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#1149)
>      * igt@kms_color_chamelium@pipe-b-ctm-blue-to-red:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +6 similar
>             issues
>      * igt@kms_color_chamelium@pipe-c-ctm-0-5:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +8 similar
>             issues
>      * igt@kms_color_chamelium@pipe-c-gamma:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +10 similar
>             issues
>      * igt@kms_color_chamelium@pipe-d-ctm-0-25:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +8 similar
>             issues
>      * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / fdo#109284 / fdo#111827)
>             +1 similar issue
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3116 / i915#3299)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3116)
> 
>      * igt@kms_content_protection@srm:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1063)
> 
>           * shard-kbl: NOTRUN -> TIMEOUT (i915#1319)
> 
>           * shard-apl: NOTRUN -> TIMEOUT (i915#1319)
> 
>      * igt@kms_content_protection@uevent:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109300 / fdo#111066) +1 similar
>             issue
>      * igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109279 / i915#3359) +2 similar
>             issues
>      * igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3319) +1 similar issue
>      * igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / fdo#109279) +4 similar
>             issues
>      * igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +42 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3359) +9 similar issues
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-iclb: PASS -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: PASS -> FAIL (i915#2346 / i915#533)
>      * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_dp_tiled_display@basic-test-pattern:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#426)
>      * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5287) +3 similar issues
>      * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271) +194 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5287) +2 similar issues
> 
>      * igt@kms_dsc@basic-dsc-enable:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825) +8 similar
>             issues
>      * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +4 similar issues
>      * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#79)
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#180) +5 similar issues
>      * igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN (i915#180) +3 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2587)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2587) +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +350 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +37 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +36 similar
>             issues
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
> 
>           * shard-glk: NOTRUN -> FAIL (fdo#108145 / i915#265)
> 
>           * shard-apl: NOTRUN -> FAIL (fdo#108145 / i915#265)
> 
>           * shard-kbl: NOTRUN -> FAIL (fdo#108145 / i915#265)
> 
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#265)
>      * igt@kms_plane_lowres@pipe-d-tiling-4:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5288) +1 similar issue
>      * igt@kms_plane_lowres@pipe-d-tiling-x:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3536) +1 similar issue
>      * igt@kms_plane_scaling@downscale-with-rotation-factor-0-75@pipe-b-edp-1-downscale-with-rotation:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5176) +7 similar issues
>      * igt@kms_plane_scaling@downscale-with-rotation-factor-0-75@pipe-c-edp-1-downscale-with-rotation:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5176) +2 similar issues
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-1-planes-upscale-downscale:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5235) +2 similar issues
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5235) +3 similar issues
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#658) +3 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#111068 / i915#658)
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658) +1 similar
>             issue
> 
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2920) +2 similar issues
>      * igt@kms_psr@psr2_cursor_render:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441)
>      * igt@kms_psr@psr2_primary_page_flip:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109441) +3 similar issues
>      * igt@kms_psr@psr2_sprite_blt:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467) +1 similar
>             issue
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-tglb: PASS -> SKIP (i915#5519)
> 
>           * shard-iclb: PASS -> SKIP (i915#5519)
> 
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#5289) +1 similar
>             issue
>      * igt@kms_vblank@pipe-d-wait-idle:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#533) +1 similar
>             issue
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#533) +1 similar
>             issue
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#533) +1 similar
>             issue
> 
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3555) +1 similar issue
>      * igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2530)
>      * igt@nouveau_crc@pipe-b-source-rg:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2530) +2 similar issues
>      * igt@nouveau_crc@pipe-d-source-rg:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#2530)
>      * igt@prime_nv_pcopy@test3_2:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109291) +6 similar issues
>      * igt@prime_nv_pcopy@test3_3:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109291) +5 similar issues
>      * igt@prime_vgem@fence-flip-hang:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109295)
>      * igt@prime_vgem@fence-read-hang:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109295) +1 similar issue
>      * igt@sysfs_clients@busy:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2994) +4 similar issues
>      * igt@sysfs_clients@recycle-many:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2994) +1 similar
>             issue
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +3 similar
>             issues
> 
>      * igt@sysfs_clients@split-50:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2994) +1 similar issue
> 
>     Possible fixes
> 
>      * igt@fbdev@unaligned-write:
> 
>           * {shard-rkl}: SKIP (i915#2582) -> PASS
>      * igt@gem_busy@close-race:
> 
>           * shard-glk: INCOMPLETE (i915#5753) -> PASS
>      * igt@gem_eio@in-flight-contexts-1us:
> 
>           * shard-tglb: TIMEOUT (i915#3063) -> PASS
>      * igt@gem_eio@suspend:
> 
>           * {shard-rkl}: FAIL (i915#3736 / i915#5115) -> PASS
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-iclb: TIMEOUT (i915#3070) -> PASS
>      * igt@gem_exec_capture@pi@rcs0:
> 
>           * {shard-rkl}: INCOMPLETE (i915#3371) -> PASS
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-iclb: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-kbl: FAIL (i915#2842) -> PASS +3 similar issues
> 
>           * shard-glk: FAIL (i915#2842) -> PASS +3 similar issues
> 
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-apl: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_flush@basic-batch-kernel-default-uc:
> 
>           * shard-snb: SKIP (fdo#109271) -> PASS +2 similar issues
>      * igt@i915_pm_dc@dc5-psr:
> 
>           * {shard-rkl}: SKIP (i915#658) -> PASS
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-iclb: FAIL (i915#454) -> PASS
>      * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * {shard-rkl}: SKIP (i915#1397) -> PASS
>      * igt@kms_async_flips@async-flip-with-page-flip-events:
> 
>           * {shard-rkl}: SKIP (i915#1845 / i915#4098) -> PASS +21 similar
>             issues
>      * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
> 
>           * {shard-dg1}: SKIP (i915#1836) -> PASS +1 similar issue
>      * igt@kms_color@pipe-a-legacy-gamma:
> 
>           * {shard-rkl}: SKIP (i915#4070 / i915#4098) -> PASS
>      * igt@kms_color@pipe-b-ctm-0-75:
> 
>           * {shard-rkl}: SKIP (i915#1149 / i915#1849 / i915#4070 / i915#4098)
>             -> PASS
>      * igt@kms_cursor_crc@pipe-b-cursor-256x85-rapid-movement:
> 
>           * {shard-rkl}: SKIP (fdo#112022 / i915#4070) -> PASS +5 similar
>             issues
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * {shard-rkl}: SKIP (fdo#111825 / i915#4070) -> PASS +3 similar
>             issues
>      * igt@kms_dp_aux_dev:
> 
>           * {shard-rkl}: SKIP (i915#1257) -> PASS
>      * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled:
> 
>           * {shard-rkl}: SKIP (i915#4098 / i915#4369) -> PASS +2 similar
>             issues
>      * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled:
> 
>           * {shard-rkl}: SKIP (fdo#111314 / i915#4098 / i915#4369) -> PASS +4
>             similar issues
>      * igt@kms_flip@flip-vs-suspend@a-dp1:
> 
>           * shard-apl: DMESG-WARN (i915#180 / i915#1982) -> PASS
>      * igt@kms_flip@flip-vs-suspend@b-dp1:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-kbl: DMESG-WARN (i915#180) -> PASS +3 similar issues
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-tglb: SKIP (i915#433) -> PASS
>      * igt@kms_invalid_mode@bad-hsync-end:
> 
>           * {shard-rkl}: SKIP (i915#4278) -> PASS +1 similar issue
>      * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#4098) -> PASS +25 similar
>             issues
>      * igt@kms_plane@plane-position-hole@pipe-b-planes:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#3558) -> PASS +3 similar
>             issues
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#4070 / i915#4098) -> PASS +1
>             similar issue
>      * igt@kms_prime@basic-crc@second-to-first:
> 
>           * {shard-rkl}: SKIP (i915#1849) -> PASS
>      * igt@kms_psr@cursor_plane_move:
> 
>           * {shard-rkl}: SKIP (i915#1072) -> PASS +3 similar issues
>      * igt@kms_psr@psr2_cursor_plane_onoff:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS +1 similar issue
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * {shard-rkl}: SKIP (i915#5461) -> PASS
>      * igt@kms_universal_plane@universal-plane-pipe-a-sanity:
> 
>           * {shard-rkl}: SKIP (i915#1845 / i915#4070 / i915#4098) -> PASS
>      * igt@perf_pmu@module-unload:
> 
>           * shard-snb: DMESG-WARN (i915#4528) -> PASS
>      * igt@perf_pmu@semaphore-busy@vecs0:
> 
>           * {shard-dg1}: FAIL -> PASS +1 similar issue
> 
>     Warnings
> 
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: FAIL (i915#5784) -> TIMEOUT (i915#3063)
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-iclb: SKIP (i915#4525) -> DMESG-WARN (i915#5614) +2 similar
>             issues
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-iclb: SKIP (i915#658) -> SKIP (i915#2920)
>      * igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>           * shard-iclb: SKIP (fdo#111068 / i915#658) -> SKIP (i915#2920)
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (fdo#111068 / i915#658)
>      * igt@runner@aborted:
> 
>           * shard-kbl: (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL,
>             FAIL, FAIL, FAIL) (fdo#109271 / i915#180 / i915#3002 / i915#4312
>             / i915#5257) -> (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL,
>             FAIL, FAIL, FAIL, FAIL, FAIL, FAIL) (i915#180 / i915#3002 /
>             i915#4312 / i915#5257)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6486 -> IGTPW_7160
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_11694: ba77f2196526253b70968472d78ced6dd09bdd4d @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_7160: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7160/index.html
>    IGT_6486: f91af0ee70ed290890d122ece6b3857222f985b0 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
