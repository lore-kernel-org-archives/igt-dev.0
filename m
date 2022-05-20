Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A3811AFE4
 for <igt-dev@lists.freedesktop.org>; Fri, 20 May 2022 04:29:16 +0000 (UTC)
Date: Fri, 20 May 2022 06:29:11 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YocZF6BJ2zlWivZx@zkempczy-mobl2>
References: <20220519141745.118599-1-zbigniew.kempczynski@intel.com>
 <165298251500.515.11192129573941726417@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165298251500.515.11192129573941726417@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fconcurrent=3A_For_i915_devices_run_allocator_in_multiproc?=
 =?utf-8?q?ess_mode?=
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

On Thu, May 19, 2022 at 05:48:35PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/kms_concurrent: For i915 devices run allocator in           
>             multiprocess mode                                                 
>    URL:     https://patchwork.freedesktop.org/series/104188/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7145/index.html    
> 
>          CI Bug Log - changes from CI_DRM_11677_full -> IGTPW_7145_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_7145_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_7145_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7145/index.html
> 
> Participating hosts (13 -> 8)
> 
>    Missing (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_7145_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_cursor_legacy@pipe-b-torture-move:
>           * shard-kbl: PASS -> INCOMPLETE

Unrelated, change touches kms_concurrent test only.

--
Zbigniew


> 
> Known issues
> 
>    Here are the changes found in IGTPW_7145_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@feature_discovery@display-2x:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1839)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#1839)
> 
>      * igt@feature_discovery@psr2:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#658) +1 similar issue
>      * igt@gem_ctx_persistence@legacy-engines-persistence:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099) +2 similar
>             issues
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@kms:
> 
>           * shard-tglb: PASS -> FAIL (i915#5784)
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#5784)
> 
>           * shard-snb: NOTRUN -> FAIL (i915#3354)
> 
>      * igt@gem_exec_balancer@parallel-contexts:
> 
>           * shard-tglb: NOTRUN -> DMESG-WARN (i915#5076 / i915#5614)
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN (i915#5076 / i915#5614) +1
>             similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4525)
> 
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#2846)
> 
>           * shard-glk: PASS -> FAIL (i915#2846)
> 
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-kbl: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-none@rcs0:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#2842) +5 similar issues
>      * igt@gem_exec_fair@basic-pace@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#2842) +6 similar issues
>      * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109313)
>      * igt@gem_exec_params@no-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109283)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109283) +1 similar issue
> 
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2190)
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2190)
> 
>      * igt@gem_lmem_swapping@heavy-random:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4613) +2 similar issues
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4613)
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +1 similar
>             issue
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +4 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4613)
> 
>      * igt@gem_mmap_gtt@coherency:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109292)
>      * igt@gem_pread@exhaustion:
> 
>           * shard-tglb: NOTRUN -> WARN (i915#2658) +1 similar issue
> 
>           * shard-apl: NOTRUN -> WARN (i915#2658) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> WARN (i915#2658) +1 similar issue
> 
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-snb: NOTRUN -> WARN (i915#2658) +1 similar issue
> 
>           * shard-kbl: NOTRUN -> WARN (i915#2658) +1 similar issue
> 
>           * shard-glk: NOTRUN -> WARN (i915#2658)
> 
>      * igt@gem_pxp@create-regular-context-1:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4270) +1 similar issue
>      * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4270) +1 similar issue
>      * igt@gem_render_copy@linear-to-vebox-yf-tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#768) +5 similar issues
>      * igt@gem_softpin@evict-snoop:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109312)
>      * igt@gem_softpin@evict-snoop-interruptible:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109312) +1 similar issue
>      * igt@gem_softpin@noreloc-s3:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN (i915#180)
>      * igt@gem_userptr_blits@coherency-sync:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#110542)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109290)
> 
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@input-checking:
> 
>           * shard-tglb: NOTRUN -> DMESG-WARN (i915#4991)
> 
>           * shard-iclb: NOTRUN -> DMESG-WARN (i915#4991)
> 
>      * igt@gen3_render_linear_blits:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109289) +6 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109289) +3 similar issues
> 
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#5566 / i915#716)
>      * igt@gen9_exec_parse@bb-oversize:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2527 / i915#2856) +2 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2856) +2 similar issues
> 
>      * igt@i915_hangman@engine-engine-hang:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +217 similar issues
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#454)
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-tglb: NOTRUN -> WARN (i915#2681)
> 
>           * shard-iclb: NOTRUN -> WARN (i915#2684)
> 
>      * igt@i915_pm_rpm@modeset-non-lpsp-stress:
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
>      * igt@i915_query@query-topology-known-pci-ids:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109303)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109303)
> 
>      * igt@i915_query@test-query-geometry-subslices:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5723)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5723)
> 
>      * igt@i915_selftest@live@gt_lrc:
> 
>           * shard-tglb: NOTRUN -> DMESG-FAIL (i915#2373)
>      * igt@i915_selftest@live@gt_pm:
> 
>           * shard-tglb: NOTRUN -> DMESG-FAIL (i915#1759)
>      * igt@i915_suspend@forcewake:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#180) +1 similar issue
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#1769)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1769)
> 
>      * igt@kms_big_fb@4-tiled-addfb-size-overflow:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5286) +5 similar issues
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5286) +7 similar issues
>      * igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110725 / fdo#111614) +1 similar
>             issue
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111614) +4 similar issues
> 
>      * igt@kms_big_fb@yf-tiled-addfb:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615) +7 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110723)
>      * igt@kms_big_joiner@basic:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2705)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2705)
> 
>      * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +5 similar
>             issues
>      * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +14 similar
>             issues
>      * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +6 similar
>             issues
>      * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +11 similar
>             issues
>      * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689) +2 similar
>             issues
>      * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886) +6 similar
>             issues
>      * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689) +9 similar issues
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_color@pipe-a-deep-color:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#6029)
>      * igt@kms_color@pipe-d-deep-color:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6029) +2 similar issues
>      * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +22 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +8 similar
>             issues
> 
>      * igt@kms_color_chamelium@pipe-b-ctm-0-5:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +7 similar
>             issues
>      * igt@kms_color_chamelium@pipe-b-ctm-0-75:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +17 similar
>             issues
>      * igt@kms_color_chamelium@pipe-c-ctm-0-25:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +9 similar
>             issues
>      * igt@kms_color_chamelium@pipe-d-ctm-0-5:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +10 similar
>             issues
>      * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / fdo#109284 / fdo#111827)
>             +2 similar issues
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3116)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3116 / i915#3299)
> 
>      * igt@kms_content_protection@legacy:
> 
>           * shard-kbl: NOTRUN -> TIMEOUT (i915#1319)
> 
>           * shard-apl: NOTRUN -> TIMEOUT (i915#1319)
> 
>      * igt@kms_content_protection@uevent:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#2105)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1063) +2 similar issues
> 
>           * shard-apl: NOTRUN -> FAIL (i915#2105)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109300 / fdo#111066)
> 
>      * igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / fdo#109279) +6 similar
>             issues
>      * igt@kms_cursor_crc@pipe-a-cursor-suspend:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180)
>      * igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3319) +4 similar issues
>      * igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109279 / i915#3359) +7 similar
>             issues
>      * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3359) +9 similar issues
>      * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274 / fdo#109278) +4 similar
>             issues
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-iclb: PASS -> FAIL (i915#2346)
>      * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#6029)
>      * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5287)
>      * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5287) +2 similar issues
>      * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +9 similar issues
>      * igt@kms_flip@2x-plain-flip-ts-check:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825) +17 similar
>             issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2587) +2 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
> 
>           * shard-glk: PASS -> FAIL (i915#4911)
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2587) +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +34 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +50 similar
>             issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +76 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#533)
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#265) +1 similar issue
>      * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
> 
>           * shard-kbl: NOTRUN -> FAIL (fdo#108145 / i915#265) +1 similar
>             issue
>      * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +42 similar issues
>      * igt@kms_plane_lowres@pipe-a-tiling-none:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3536) +2 similar issues
>      * igt@kms_plane_lowres@pipe-b-tiling-4:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5288)
>      * igt@kms_plane_multiple@atomic-pipe-c-tiling-4:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5288) +2 similar issues
>      * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-c-edp-1-downscale-with-modifier:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5176) +5 similar issues
>      * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-edp-1-downscale-with-modifier:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5176) +7 similar issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5235) +3 similar issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-1-planes-upscale-downscale:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5235) +2 similar issues
>      * igt@kms_prime@basic-crc@first-to-second:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#1836)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1836)
> 
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#658) +2 similar
>             issues
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2920)
> 
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658)
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1911)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109642 / fdo#111068 / i915#658)
> 
>      * igt@kms_psr@psr2_primary_page_flip:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109441) +1 similar issue
>      * igt@kms_psr@psr2_sprite_blt:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467) +4 similar
>             issues
>      * igt@kms_psr@psr2_sprite_plane_move:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +1 similar issue
>      * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5289)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5289)
> 
>      * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5030) +3 similar issues
>      * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5030) +2 similar issues
>      * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3555) +1 similar issue
>      * igt@kms_tv_load_detect@load-detect:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109309)
>      * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271) +275 similar issues
>      * igt@kms_vblank@pipe-d-ts-continuation-idle:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +127 similar issues
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3555) +1 similar issue
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2437) +1 similar issue
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2437)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2437)
> 
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2437) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2437) +1 similar issue
> 
>      * igt@nouveau_crc@pipe-a-source-rg:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2530) +1 similar issue
>      * igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2530) +1 similar issue
>      * igt@nouveau_crc@pipe-d-source-rg:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#2530)
>      * igt@prime_nv_api@nv_self_import:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109291) +4 similar issues
>      * igt@prime_nv_test@nv_i915_sharing:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109291) +5 similar issues
>      * igt@prime_vgem@basic-userptr:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3301)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3301)
> 
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111656) +1 similar issue
>      * igt@prime_vgem@fence-read-hang:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109295)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109295)
> 
>      * igt@syncobj_timeline@transfer-timeline-point:
> 
>           * shard-kbl: NOTRUN -> DMESG-FAIL (i915#5098)
>      * igt@sysfs_clients@fair-1:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2994) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2994) +1 similar issue
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +2 similar
>             issues
> 
>      * igt@sysfs_clients@recycle:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +1 similar
>             issue
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2994)
> 
>     Possible fixes
> 
>      * igt@gem_eio@in-flight-contexts-1us:
> 
>           * shard-glk: TIMEOUT (i915#3063) -> PASS
>      * igt@gem_eio@kms:
> 
>           * {shard-tglu}: INCOMPLETE (i915#5182) -> PASS
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-iclb: SKIP (i915#4525) -> PASS
>      * igt@gem_exec_capture@pi@bcs0:
> 
>           * shard-tglb: INCOMPLETE (i915#3371) -> PASS
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-apl: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_flush@basic-batch-kernel-default-wb:
> 
>           * shard-snb: SKIP (fdo#109271) -> PASS +2 similar issues
>      * igt@gem_exec_schedule@wide@rcs0:
> 
>           * shard-apl: FAIL (i915#5965) -> PASS
>      * igt@gem_exec_whisper@basic-queues-priority-all:
> 
>           * shard-glk: DMESG-WARN (i915#118) -> PASS
>      * igt@gem_softpin@evict-single-offset:
> 
>           * {shard-tglu}: FAIL (i915#4171) -> PASS
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-iclb: SKIP (i915#4281) -> PASS
>      * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
> 
>           * shard-iclb: FAIL (i915#5072) -> PASS
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-kbl: DMESG-WARN (i915#180) -> PASS +1 similar issue
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>           * shard-glk: FAIL (i915#4911) -> PASS
>      * igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-c-edp-1-downscale-with-modifier:
> 
>           * shard-iclb: SKIP (i915#5176) -> PASS +2 similar issues
>      * igt@kms_psr@psr2_suspend:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS +2 similar issues
> 
>     Warnings
> 
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-iclb: DMESG-WARN (i915#5614) -> SKIP (i915#4525)
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-iclb: FAIL (i915#2852) -> FAIL (i915#2842)
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (fdo#111068 / i915#658)
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>           * shard-iclb: SKIP (fdo#111068 / i915#658) -> SKIP (i915#2920)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6481 -> IGTPW_7145
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_11677: e98617aab83890ce7097639943e65ce1420f8983 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_7145: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7145/index.html
>    IGT_6481: f2a9c2e6f6f7aa97e5d92274f20aa698087359c4 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
