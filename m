Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A401710E8AA
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Feb 2022 17:15:28 +0000 (UTC)
Date: Thu, 10 Feb 2022 18:15:21 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YgVIKbsdfQ01bXdC@zkempczy-mobl2>
References: <20220210113832.17590-1-zbigniew.kempczynski@intel.com>
 <164450452483.24640.3061695839535287589@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164450452483.24640.3061695839535287589@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGk5?=
 =?utf-8?q?15_blt_library_+_gem=5Fccs_test_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 02:48:44PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add i915 blt library + gem_ccs test (rev3)                     
>    URL:     https://patchwork.freedesktop.org/series/99925/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6611/index.html 
> 
>          CI Bug Log - changes from CI_DRM_11211_full -> IGTPW_6611_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6611_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6611_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6611/index.html
> 
> Participating hosts (13 -> 8)
> 
>    Missing (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6611_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * {igt@gem_ccs@block-copy-inplace} (NEW):
> 
>           * {shard-tglu}: NOTRUN -> SKIP
> 
>           * shard-tglb: NOTRUN -> SKIP +1 similar issue
> 
>      * {igt@gem_ccs@block-copy-uncompressed} (NEW):
>
>           * shard-iclb: NOTRUN -> SKIP +2 similar issues

For gen12 test should be executed but:

1. for TGL, DG1 only block-copy-uncompressed should be executed

2. for DG2+ (not available yet) all of 4 subtests should be executed.

I see no TGL on which block-copy-uncompressed was started. What's the reason?

>      * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
> 
>           * shard-kbl: PASS -> INCOMPLETE
>      * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b:
> 
>           * shard-tglb: PASS -> INCOMPLETE

Unrelated to the change.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_11211_full and
>    IGTPW_6611_full:
> 
>   New IGT tests (4)
> 
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * Statuses : 3 skip(s)
>           * Exec time: [0.0] s
>      * igt@gem_ccs@block-copy-inplace:
> 
>           * Statuses : 7 skip(s)
>           * Exec time: [0.0] s
>      * igt@gem_ccs@block-copy-uncompressed:
> 
>           * Statuses : 4 skip(s)
>           * Exec time: [0.0] s
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * Statuses : 6 skip(s)
>           * Exec time: [0.0] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_6611_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@feature_discovery@psr2:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#658]) +1 similar issue
>      * igt@gem_ctx_persistence@legacy-engines-mixed:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +1 similar
>             issue
>      * igt@gem_ctx_shared@q-in-order:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +147 similar issues
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4525]) +1 similar issue
> 
>           * shard-tglb: NOTRUN -> DMESG-WARN ([i915#5076])
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#5076])
> 
>      * igt@gem_exec_capture@pi@bcs0:
> 
>           * shard-iclb: PASS -> INCOMPLETE ([i915#3371])
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-tglb: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842]) +1 similar issue
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#2842])
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2842]) +1 similar issue
> 
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-apl: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842]) +1 similar issue
> 
>           * shard-glk: PASS -> FAIL ([i915#2842]) +2 similar issues
> 
>      * igt@gem_lmem_swapping@parallel-multi:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +3 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +2 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4613]) +3 similar issues
> 
>      * igt@gem_lmem_swapping@parallel-random:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +2 similar
>             issues
>      * igt@gem_lmem_swapping@verify-random:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4613]) +3 similar issues
>      * igt@gem_pread@exhaustion:
> 
>           * shard-tglb: NOTRUN -> WARN ([i915#2658])
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270]) +2 similar issues
>      * igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270]) +3 similar issues
>      * igt@gem_render_copy@linear-to-vebox-yf-tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768]) +2 similar issues
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +78 similar issues
>      * igt@gem_spin_batch@legacy@vebox:
> 
>           * shard-apl: PASS -> FAIL ([i915#2898])
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3297])
>      * igt@gem_userptr_blits@unsync-unmap-cycles:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297]) +1 similar issue
>      * igt@gen7_exec_parse@oacontrol-tracking:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289]) +3 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289]) +3 similar issues
> 
>      * igt@gen9_exec_parse@cmd-crossing-page:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2527] / [i915#2856])
>      * igt@gen9_exec_parse@unaligned-access:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856]) +1 similar issue
>      * igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1904])
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-apl: PASS -> SKIP ([fdo#109271])
>      * igt@i915_pm_lpsp@screens-disabled:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1902])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1902])
> 
>      * igt@i915_pm_rpm@dpms-non-lpsp:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111644] / [i915#1397] /
>             [i915#2411])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110892])
> 
>      * igt@i915_suspend@forcewake:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180]) +2 similar issues
>      * igt@kms_atomic@atomic_plane_damage:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4765])
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1769])
>      * igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614]) +4 similar issues
>      * igt@kms_big_fb@linear-32bpp-rotate-180:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118]) +2 similar issues
>      * igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614]) +2
>             similar issues
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777])
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +1 similar
>             issue
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +1 similar
>             issue
> 
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723]) +2 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +7 similar issues
>      * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +6 similar
>             issues
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +6 similar issues
>      * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +9 similar
>             issues
>      * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +5
>             similar issues
>      * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +5 similar
>             issues
>      * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +6 similar
>             issues
>      * igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689]) +2
>             similar issues
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3742])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3742])
> 
>      * igt@kms_chamelium@dp-frame-dump:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +3
>             similar issues
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +2
>             similar issues
> 
>      * igt@kms_color@pipe-d-ctm-max:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#1149]) +2
>             similar issues
>      * igt@kms_color_chamelium@pipe-a-ctm-0-75:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +10
>             similar issues
>      * igt@kms_color_chamelium@pipe-b-gamma:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +5
>             similar issues
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +2
>             similar issues
> 
>      * igt@kms_color_chamelium@pipe-d-ctm-0-75:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827])
>      * igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +9
>             similar issues
>      * igt@kms_content_protection@content_type_change:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1063])
>      * igt@kms_content_protection@uevent:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#2105])
>      * igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279]) +2
>             similar issues
>      * igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +6
>             similar issues
>      * igt@kms_cursor_crc@pipe-c-cursor-32x32-random:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319]) +2 similar issues
>      * igt@kms_cursor_crc@pipe-c-cursor-max-size-random:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +1 similar issue
>      * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278]) +1
>             similar issue
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109274] / [fdo#111825]) +8
>             similar issues
>      * igt@kms_cursor_legacy@pipe-d-torture-bo:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
>      * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3788])
>      * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3528])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3528])
> 
>      * igt@kms_dsc@basic-dsc-enable:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3840])
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-apl: PASS -> INCOMPLETE ([i915#180])
> 
>           * shard-kbl: PASS -> INCOMPLETE ([i915#180] / [i915#636])
> 
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +4 similar issues
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL ([i915#79])
>      * igt@kms_flip@flip-vs-suspend@b-dp1:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180])
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2587])
>      * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +25 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109280] / [fdo#111825]) +30
>             similar issues
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +192 similar issues
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1187]) +2 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1187])
> 
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1839])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1839])
> 
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
> 
>           * shard-glk: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
> 
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#265])
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#265])
> 
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +3 similar
>             issues
>      * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +32 similar issues
>      * igt@kms_plane_lowres@pipe-a-tiling-x:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3536]) +2 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536])
> 
>      * igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2920])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#111068] / [i915#658])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>      * igt@kms_psr@psr2_dpms:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467]) +1 similar
>             issue
>      * igt@kms_psr@psr2_sprite_mmap_gtt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109441]) +1 similar issue
>      * igt@kms_setmode@basic:
> 
>           * shard-glk: PASS -> FAIL ([i915#31])
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109502])
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437]) +1 similar
>             issue
