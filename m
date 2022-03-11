Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1730210E256
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 07:23:21 +0000 (UTC)
Date: Fri, 11 Mar 2022 08:23:17 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yir45VzC2bag4U6+@zkempczy-mobl2>
References: <20220310071529.61930-1-zbigniew.kempczynski@intel.com>
 <164691568512.17008.570255207252363006@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164691568512.17008.570255207252363006@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGk5?=
 =?utf-8?q?15_blt_library_+_gem=5Fccs_test_=28rev7=29?=
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

On Thu, Mar 10, 2022 at 12:34:45PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add i915 blt library + gem_ccs test (rev7)                     
>    URL:     https://patchwork.freedesktop.org/series/99925/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6769/index.html 
> 
>          CI Bug Log - changes from CI_DRM_11347_full -> IGTPW_6769_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6769_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6769_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6769/index.html
> 
> Participating hosts (13 -> 7)
> 
>    Missing (6): pig-kbl-iris shard-tglu pig-glk-j5005 pig-skl-6260u shard-rkl
>    shard-dg1
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6769_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@api_intel_allocator@fork-simple-stress:
> 
>           * shard-tglb: NOTRUN -> INCOMPLETE

This is strange, igt@api_intel_allocator@fork-simple-stress-signal is executing
whereas above not:

https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6769/shards-all.html?testfilter=api_intel_allocator@fork-simple

Anyway series haven't touch above test so it is unrelated to above incompletion.

>      * {igt@gem_ccs@block-copy-compressed} (NEW):
> 
>           * shard-tglb: NOTRUN -> SKIP +1 similar issue
>      * {igt@gem_ccs@block-copy-uncompressed} (NEW):
> 
>           * shard-iclb: NOTRUN -> SKIP +2 similar issues

For those generations skip is expected.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * {igt@kms_setmode@basic@pipe-b-vga-1}:
>           * shard-snb: FAIL ([i915#31]) -> FAIL
> 
> New tests
> 
>    New tests have been introduced between CI_DRM_11347_full and
>    IGTPW_6769_full:
> 
>   New IGT tests (5)
> 
>      * igt@api_intel_allocator@gem-pool:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00, 0.02] s
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * Statuses : 6 skip(s)
>           * Exec time: [0.0] s
>      * igt@gem_ccs@block-copy-inplace:
> 
>           * Statuses : 3 skip(s)
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
>    Here are the changes found in IGTPW_6769_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@feature_discovery@display-4x:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +209 similar issues
>      * igt@gem_ctx_persistence@legacy-engines-mixed-process:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099])
>      * igt@gem_ctx_sseu@invalid-args:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_eio@kms:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#232])
>      * igt@gem_exec_balancer@parallel:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4525])
>      * igt@gem_exec_balancer@parallel-contexts:
> 
>           * shard-tglb: NOTRUN -> DMESG-WARN ([i915#5076])
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#5076])
> 
>           * shard-iclb: NOTRUN -> DMESG-WARN ([i915#5076])
> 
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#2842]) +2 similar issues
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#2842])
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842])
> 
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2842]) +5 similar issues
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: PASS -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_params@no-vebox:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109283] / [i915#4877])
>      * igt@gem_lmem_swapping@heavy-verify-multi:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +2 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#4613])
> 
>      * igt@gem_lmem_swapping@random:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +2 similar
>             issues
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4613]) +2 similar issues
>      * igt@gem_pxp@reject-modify-context-protection-on:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270]) +2 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270]) +1 similar issue
> 
>      * igt@gem_softpin@noreloc-s3:
> 
>           * shard-snb: PASS -> INCOMPLETE ([i915#5230])
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297])
>      * igt@gen3_render_tiledy_blits:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289]) +5 similar issues
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#1436] / [i915#716])
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2527] / [i915#2856]) +3 similar
>             issues
>      * igt@gen9_exec_parse@bb-start-far:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856]) +2 similar issues
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#454])
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#454])
> 
>      * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111644] / [i915#1397] /
>             [i915#2411])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110892])
> 
>      * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +119 similar issues
>      * igt@i915_pm_rpm@pc8-residency:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109293] / [fdo#109506])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109506] / [i915#2411])
> 
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4387])
>      * igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1769])
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#5286]) +1 similar issue
>      * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#5286]) +6 similar issues
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614])
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614]) +1 similar issue
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +1 similar
>             issue
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +3 similar
>             issues
>      * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118])
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3777])
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +3 similar issues
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723]) +1 similar issue
>      * igt@kms_big_joiner@invalid-modeset:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2705])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2705])
> 
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +9 similar
>             issues
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +10
>             similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +3 similar
>             issues
> 
>      * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +7 similar issues
>      * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689]) +3
>             similar issues
>      * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +6 similar
>             issues
>      * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +8
>             similar issues
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3742])
>      * igt@kms_chamelium@dp-mode-timings:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +14
>             similar issues
>      * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +3
>             similar issues
>      * igt@kms_chamelium@vga-hpd-without-ddc:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +3
>             similar issues
>      * igt@kms_color@pipe-d-gamma:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#1149])
>      * igt@kms_color_chamelium@pipe-a-degamma:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +12
>             similar issues
>      * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +5
>             similar issues
>      * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827])
>      * igt@kms_color_chamelium@pipe-d-ctm-max:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +10
>             similar issues
>      * igt@kms_content_protection@content_type_change:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109300] / [fdo#111066]) +1
>             similar issue
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3116])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3116] / [i915#3299])
> 
>      * igt@kms_content_protection@srm:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1063]) +1 similar issue
> 
>           * shard-kbl: NOTRUN -> TIMEOUT ([i915#1319])
> 
>           * shard-apl: NOTRUN -> TIMEOUT ([i915#1319])
> 
>      * igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279]) +1
>             similar issue
>      * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +3
>             similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +6 similar issues
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109274] / [fdo#111825]) +12
>             similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278]) +1
>             similar issue
> 
>      * igt@kms_cursor_legacy@pipe-d-single-move:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +18 similar issues
>      * igt@kms_display_modes@extended-mode-basic:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +1 similar issue
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109274])
> 
>      * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#5287]) +2 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#5287])
> 
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL ([i915#79]) +1 similar issue
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2587])
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
> 
>           * shard-iclb: PASS -> SKIP ([i915#3701])
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2587])
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +17 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109280] / [fdo#111825]) +37
>             similar issues
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +66 similar issues
>      * igt@kms_hdr@static-toggle-dpms:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3555])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3555])
> 
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1839])
>      * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289]) +1 similar issue
>      * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +1 similar
>             issue
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#265])
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#265])
> 
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +1 similar
>             issue
>      * igt@kms_plane_lowres@pipe-c-tiling-4:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#5288]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#5288])
> 
>      * igt@kms_plane_lowres@pipe-d-tiling-none:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536])
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +1 similar
>             issue
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +2 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#111068] / [i915#658]) +1 similar
>             issue
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2920]) +1 similar issue
> 
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1911])
>      * igt@kms_psr@psr2_dpms:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467]) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109441])
> 
>      * igt@kms_psr@psr2_primary_blt:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441]) +1 similar issue
>      * igt@kms_scaling_modes@scaling-mode-full-aspect:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +158 similar issues
>      * igt@kms_vblank@pipe-d-wait-idle:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
