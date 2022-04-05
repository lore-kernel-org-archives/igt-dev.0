Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51FA10EE2B
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Apr 2022 07:14:16 +0000 (UTC)
Date: Tue, 5 Apr 2022 09:13:12 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YkvsCGMb2gkFN/iF@zkempczy-mobl2>
References: <20220404171534.355029-1-zbigniew.kempczynski@intel.com>
 <164911285594.4271.10870622589221017925@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164911285594.4271.10870622589221017925@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fsoftpin=3A_Use_valid_context_when_iterating_over_eng?=
 =?utf-8?q?ines?=
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

On Mon, Apr 04, 2022 at 10:54:15PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/i915/gem_softpin: Use valid context when iterating over     
>             engines                                                           
>    URL:     https://patchwork.freedesktop.org/series/102153/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6870/index.html    
> 
>          CI Bug Log - changes from CI_DRM_11449_full -> IGTPW_6870_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6870_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6870_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6870/index.html
> 
> Participating hosts (13 -> 9)
> 
>    Missing (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6870_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_exec_gttfill@engines@vcs0:
> 
>           * shard-kbl: PASS -> INCOMPLETE +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
> 
>           * shard-iclb: NOTRUN -> DMESG-WARN

Unrelated. Fix is targetting gem_softpin.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@gem_exec_flush@basic-batch-kernel-default-uc:
>           * {shard-rkl}: PASS -> INCOMPLETE +1 similar issue
> 
> Known issues
> 
>    Here are the changes found in IGTPW_6870_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ccs@block-copy-inplace:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#5327])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3555] / [i915#5325])
> 
>      * igt@gem_create@create-massive:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#4991]) +1 similar issue
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#4991])
> 
>      * igt@gem_ctx_persistence@engines-mixed-process:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +1 similar
>             issue
>      * igt@gem_eio@in-flight-contexts-immediate:
> 
>           * shard-tglb: PASS -> TIMEOUT ([i915#3063])
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4525])
> 
>           * shard-tglb: NOTRUN -> DMESG-WARN ([i915#5076])
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#5076])
> 
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-glk: PASS -> FAIL ([i915#2846])
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-glk: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace@bcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2842]) +4 similar issues
>      * igt@gem_exec_fair@basic-pace@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_params@no-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109283])
>      * igt@gem_exec_params@secure-non-master:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#112283])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#112283])
> 
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2190])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2190])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2190])
> 
>      * igt@gem_lmem_swapping@heavy-random:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4613]) +1 similar issue
>      * igt@gem_lmem_swapping@heavy-verify-multi:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613])
>      * igt@gem_lmem_swapping@heavy-verify-random:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4613]) +1 similar issue
>      * igt@gem_lmem_swapping@parallel-random-verify:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +3 similar
>             issues
>      * igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270]) +3 similar issues
>      * igt@gem_pxp@verify-pxp-stale-ctx-execution:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270]) +1 similar issue
>      * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +270 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768]) +1 similar issue
> 
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3297]) +1 similar issue
> 
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3323])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3323])
> 
>      * igt@gem_userptr_blits@input-checking:
> 
>           * shard-tglb: NOTRUN -> DMESG-WARN ([i915#4991])
> 
>           * shard-iclb: NOTRUN -> DMESG-WARN ([i915#4991])
> 
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2527] / [i915#2856]) +3 similar
>             issues
>      * igt@gen9_exec_parse@unaligned-access:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856]) +2 similar issues
>      * igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1904])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#588])
> 
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4281])
> 
>           * shard-apl: PASS -> SKIP ([fdo#109271])
> 
>      * igt@i915_query@query-topology-known-pci-ids:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109303])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109303])
> 
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#5286]) +3 similar issues
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#5286]) +3 similar issues
>      * igt@kms_big_fb@linear-32bpp-rotate-180:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118]) +3 similar issues
>      * igt@kms_big_fb@linear-8bpp-rotate-90:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614])
> 
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +4 similar
>             issues
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +1 similar
>             issue
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +3 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723]) +1 similar issue
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +3 similar
>             issues
>      * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +4
>             similar issues
>      * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +2 similar
>             issues
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +6 similar
>             issues
> 
>      * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +11
>             similar issues
>      * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689]) +5
>             similar issues
>      * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +6 similar issues
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3742])
>      * igt@kms_chamelium@dp-edid-read:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +6
>             similar issues
>      * igt@kms_chamelium@hdmi-audio:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +6
>             similar issues
>      * igt@kms_chamelium@hdmi-edid-read:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +11
>             similar issues
>      * igt@kms_chamelium@hdmi-hpd:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +4
>             similar issues
>      * igt@kms_chamelium@vga-hpd:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +11
>             similar issues
>      * igt@kms_chamelium@vga-hpd-for-each-pipe:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +19
>             similar issues
>      * igt@kms_color@pipe-d-ctm-red-to-blue:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#1149])
>      * igt@kms_color_chamelium@pipe-d-gamma:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827])
>      * igt@kms_content_protection@atomic:
> 
>           * shard-kbl: NOTRUN -> TIMEOUT ([i915#1319])
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3116] / [i915#3299])
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3116])
>      * igt@kms_content_protection@lic:
> 
>           * shard-apl: NOTRUN -> TIMEOUT ([i915#1319]) +1 similar issue
>      * igt@kms_content_protection@mei_interface:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109300] / [fdo#111066])
>      * igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279]) +1
>             similar issue
>      * igt@kms_cursor_crc@pipe-a-cursor-suspend:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180]) +3 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +22 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319]) +1 similar issue
> 
>      * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +3 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +1
>             similar issue
>      * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +176 similar issues
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278]) +4
>             similar issues
>      * igt@kms_cursor_legacy@pipe-d-single-bo:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4103])
>      * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#5287]) +1 similar issue
>      * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#5287]) +3 similar issues
>      * igt@kms_dsc@xrgb8888-dsc-compression:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3828])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3828])
> 
>      * igt@kms_flip@2x-plain-flip-ts-check:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109274] / [fdo#111825]) +8
>             similar issues
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL ([i915#79])
>      * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180]) +5 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>           * shard-glk: PASS -> FAIL ([i915#4911])
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
> 
>           * shard-iclb: PASS -> SKIP ([i915#3701])
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109285])
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
> 
>           * shard-glk: PASS -> FAIL ([i915#2546])
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109280] / [fdo#111825]) +30
>             similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +18 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +151 similar issues
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3555]) +2 similar issues
>      * igt@kms_invalid_mode@clock-too-high:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4278])
>      * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289])
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +1 similar
>             issue
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#265]) +1 similar issue
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#265]) +1 similar issue
> 
>      * igt@kms_plane_lowres@pipe-a-tiling-4:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#5288]) +1 similar issue
>      * igt@kms_plane_lowres@pipe-c-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [fdo#112054])
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +4 similar issues
>      * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-5@pipe-c-edp-1-downscale-with-pixel-format:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#5176]) +2 similar issues
>      * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-edp-1-downscale-with-pixel-format:
> 
>           * shard-iclb: [PASS][126]
