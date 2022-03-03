Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB4A10EAA4
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Mar 2022 09:57:56 +0000 (UTC)
Date: Thu, 3 Mar 2022 10:57:52 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YiCRIHDRFBX3hbGh@zkempczy-mobl2>
References: <20220302080629.11562-1-zbigniew.kempczynski@intel.com>
 <164623233776.11317.16103371987620816@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164623233776.11317.16103371987620816@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVXNlIHN1?=
 =?utf-8?q?pported_dma-buf_regions_in_prime=5Fmmap*_=28rev3=29?=
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

On Wed, Mar 02, 2022 at 02:45:37PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Use supported dma-buf regions in prime_mmap* (rev3)            
>    URL:     https://patchwork.freedesktop.org/series/100819/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6728/index.html 
> 
>          CI Bug Log - changes from CI_DRM_11308_full -> IGTPW_6728_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6728_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6728_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6728/index.html
> 
> Participating hosts (13 -> 8)
> 
>    Missing (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6728_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_mmap_gtt@fault-concurrent-y:
> 
>           * shard-snb: PASS -> INCOMPLETE
>      * {igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1-downscale-with-rotation}
>        (NEW):
> 
>           * {shard-tglu}: NOTRUN -> SKIP +1 similar issue

Change touches prime_mmap* tests + adds library helper which is not
used on above tests.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * {igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-edp-1-downscale-with-pixel-format}:
> 
>           * shard-iclb: PASS -> INCOMPLETE
>      * {igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1-downscale-with-rotation}:
> 
>           * {shard-tglu}: NOTRUN -> SKIP +1 similar issue
> 
> New tests
> 
>    New tests have been introduced between CI_DRM_11308_full and
>    IGTPW_6728_full:
> 
>   New IGT tests (29)
> 
>      * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-hdmi-a-1-downscale-with-pixel-format:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [22.84] s
>      * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-d-hdmi-a-1-downscale-with-pixel-format:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.27] s
>      * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1-downscale-with-rotation:
> 
>           * Statuses : 1 skip(s)
>           * Exec time: [0.02] s
>      * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1-downscale-with-rotation:
> 
>           * Statuses : 1 skip(s)
>           * Exec time: [0.02] s
>      * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-edp-1-invalid-num-scalers:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.02] s
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-hdmi-a-1-planes-downscale:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.14] s
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1-planes-downscale:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.28] s
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-hdmi-a-1-planes-downscale:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.12] s
>      * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-b-hdmi-a-1-planes-unity-scaling:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.15] s
>      * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-d-edp-1-planes-unity-scaling:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.28] s
>      * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-d-hdmi-a-1-planes-unity-scaling:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.11] s
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d-edp-1-planes-upscale-downscale:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.22] s
>      * igt@kms_plane_scaling@planes-upscale-20x20@pipe-b-hdmi-a-1-planes-upscale:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.10] s
>      * igt@kms_plane_scaling@planes-upscale-20x20@pipe-d-edp-1-planes-upscale:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.20] s
>      * igt@kms_plane_scaling@planes-upscale-20x20@pipe-d-hdmi-a-1-planes-upscale:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.10] s
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1-planes-upscale-downscale:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.15, 0.18] s
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-hdmi-a-1-planes-upscale-downscale:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.09, 0.50] s
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-vga-1-planes-upscale-downscale:
> 
>           * Statuses : 1 skip(s)
>           * Exec time: [0.21] s
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-edp-1-planes-upscale-downscale:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [1.27, 1.32] s
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-hdmi-a-1-planes-upscale-downscale:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.11] s
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-hdmi-a-2-planes-upscale-downscale:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.40] s
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-vga-1-planes-upscale-downscale:
> 
>           * Statuses : 1 skip(s)
>           * Exec time: [0.03] s
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1-planes-upscale-downscale:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [1.27, 1.28] s
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-hdmi-a-1-planes-upscale-downscale:
> 
>           * Statuses : 1 pass(s) 1 skip(s)
>           * Exec time: [0.11, 0.14] s
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d-edp-1-planes-upscale-downscale:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.22] s
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d-hdmi-a-1-planes-upscale-downscale:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.11] s
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d-edp-1-planes-upscale:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.22] s
>      * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-1-scaler-with-clipping-clamping:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [22.73] s
>      * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-hdmi-a-1-scaler-with-clipping-clamping:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.29] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_6728_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@feature_discovery@display-2x:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1839])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1839])
> 
>      * igt@gem_ctx_param@set-priority-not-supported:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109314])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109314])
> 
>      * igt@gem_ctx_persistence@process:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +1 similar
>             issue
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#5076])
>      * igt@gem_exec_capture@pi@vcs0:
> 
>           * shard-iclb: PASS -> INCOMPLETE ([i915#3371])
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2842]) +5 similar issues
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-none-vip@rcs0:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#2842]) +3 similar issues
>      * igt@gem_exec_fair@basic-none@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842]) +4 similar issues
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-apl: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace@vcs0:
> 
>           * shard-glk: PASS -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_params@secure-non-root:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#112283])
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2190])
>      * igt@gem_lmem_swapping@heavy-random:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4613]) +2 similar issues
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +1 similar
>             issue
> 
>      * igt@gem_lmem_swapping@heavy-verify-random:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +2 similar
>             issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4613]) +2 similar issues
> 
>      * igt@gem_pxp@create-protected-buffer:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +133 similar issues
>      * igt@gem_pxp@create-regular-buffer:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270]) +7 similar issues
>      * igt@gem_pxp@create-regular-context-1:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270]) +4 similar issues
>      * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768]) +2 similar issues
>      * igt@gem_userptr_blits@input-checking:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#4991])
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#4991])
> 
>      * igt@gem_userptr_blits@unsync-unmap-cycles:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3297]) +1 similar issue
> 
>      * igt@gen3_render_tiledy_blits:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289]) +5 similar issues
>      * igt@gen7_exec_parse@batch-without-end:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289]) +4 similar issues
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#1436] / [i915#716])
>      * igt@gen9_exec_parse@shadow-peek:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2527] / [i915#2856]) +3 similar
>             issues
>      * igt@gen9_exec_parse@unaligned-access:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856]) +2 similar issues
>      * igt@i915_pm_rc6_residency@media-rc6-accuracy:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289] / [fdo#111719])
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-tglb: NOTRUN -> WARN ([i915#2681] / [i915#2684])
>      * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109293] / [fdo#109506])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109506] / [i915#2411])
> 
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4387])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4387])
> 
>      * igt@i915_selftest@live@hangcheck:
> 
>           * shard-snb: PASS -> INCOMPLETE ([i915#3921])
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#404])
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1769])
>      * igt@kms_big_fb@linear-64bpp-rotate-180:
> 
>           * shard-glk: PASS -> FAIL ([i915#1888])
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614]) +4 similar issues
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614]) +1
>             similar issue
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +2 similar
>             issues
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +3 similar
>             issues
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +11 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +178 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723]) +3 similar issues
> 
>      * igt@kms_big_joiner@basic:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2705])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2705])
> 
>      * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +6 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +8
>             similar issues
> 
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +5 similar
>             issues
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +12
>             similar issues
>      * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +10 similar issues
>      * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +14
>             similar issues
>      * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +45 similar issues
>      * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689]) +10
>             similar issues
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3742])
>      * igt@kms_chamelium@dp-mode-timings:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +19
>             similar issues
>      * igt@kms_chamelium@hdmi-hpd:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +12
>             similar issues
>      * igt@kms_chamelium@vga-hpd-for-each-pipe:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +19
>             similar issues
>      * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +17
>             similar issues
>      * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +22
>             similar issues
>      * igt@kms_color_chamelium@pipe-c-ctm-green-to-red:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +11
>             similar issues
>      * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827])
>      * igt@kms_content_protection@atomic:
> 
>           * shard-apl: NOTRUN -> TIMEOUT ([i915#1319])
>      * igt@kms_content_protection@type1:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109300] / [fdo#111066])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1063])
> 
>      * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +9 similar issues
>      * igt@kms_cursor_crc@pipe-a-cursor-suspend:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319]) +3 similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279]) +3
>             similar issues
>      * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +6
>             similar issues
>      * igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +206 similar issues
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4103]) +2 similar issues
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109274] / [fdo#111825]) +12
>             similar issues
>      * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278]) +3
>             similar issues
>      * igt@kms_flip@2x-absolute-wf_vblank:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109274] / [fdo#111825] /
>             [i915#3966])
>      * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +6 similar issues
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +2 similar issues
>      * igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>           * shard-kbl: PASS -> INCOMPLETE ([i915#636])
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180]) +1 similar issue
> 
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2587])
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2587])
