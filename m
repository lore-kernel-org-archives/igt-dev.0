Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AC110E510
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 07:26:21 +0000 (UTC)
Date: Fri, 25 Feb 2022 08:26:17 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YhiEmU4/d17FFsqU@zkempczy-mobl2>
References: <20220224075415.18663-1-zbigniew.kempczynski@intel.com>
 <164573761339.24969.16437382652443304363@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164573761339.24969.16437382652443304363@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVXNlIHNh?=
 =?utf-8?q?fe_alignment_as_a_default_=28rev2=29?=
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

On Thu, Feb 24, 2022 at 09:20:13PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Use safe alignment as a default (rev2)                         
>    URL:     https://patchwork.freedesktop.org/series/100627/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6696/index.html 
> 
>          CI Bug Log - changes from CI_DRM_11277_full -> IGTPW_6696_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6696_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6696_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6696/index.html
> 
> Participating hosts (11 -> 8)
> 
>    Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6696_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_plane_cursor@pipe-c-primary-size-256:
> 
>           * shard-iclb: PASS -> FAIL
> 
>           * shard-glk: PASS -> FAIL

Test doesn't have influence on above. Previous series completed properly
and v2 only does subtest rename.

--
Zbigniew
> 
> New tests
> 
>    New tests have been introduced between CI_DRM_11277_full and
>    IGTPW_6696_full:
> 
>   New IGT tests (1)
> 
>      * igt@api_intel_allocator@default-alignment:
>           * Statuses : 6 pass(s)
>           * Exec time: [0.0] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_6696_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_create@create-massive:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#4991])
>      * igt@gem_ctx_isolation@preservation-s3@vcs0:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@gem_ctx_persistence@file:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099])
>      * igt@gem_exec_balancer@parallel:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#5076])
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-glk: PASS -> FAIL ([i915#2846])
>      * igt@gem_exec_fair@basic-none-vip@rcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842]) +2 similar issues
>      * igt@gem_exec_fair@basic-none@vecs0:
> 
>           * shard-apl: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2849])
>      * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +106 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109313])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109313])
> 
>      * igt@gem_exec_params@no-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109283])
>      * igt@gem_exec_params@secure-non-root:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#112283]) +1 similar issue
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2190])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2190])
> 
>      * igt@gem_lmem_swapping@heavy-random:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613])
>      * igt@gem_lmem_swapping@parallel-random:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4613])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +1 similar
>             issue
> 
>      * igt@gem_lmem_swapping@parallel-random-verify:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4613]) +1 similar issue
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#4613])
> 
>      * igt@gem_pread@exhaustion:
> 
>           * shard-tglb: NOTRUN -> WARN ([i915#2658])
> 
>           * shard-iclb: NOTRUN -> WARN ([i915#2658])
> 
>           * shard-kbl: NOTRUN -> WARN ([i915#2658])
> 
>      * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270]) +4 similar issues
>      * igt@gem_pxp@verify-pxp-stale-ctx-execution:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270]) +2 similar issues
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768]) +2 similar issues
>      * igt@gen7_exec_parse@oacontrol-tracking:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289]) +1 similar issue
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289]) +2 similar issues
> 
>      * igt@gen9_exec_parse@basic-rejected:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856]) +1 similar issue
>      * igt@gen9_exec_parse@basic-rejected-ctx-param:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2527] / [i915#2856]) +1 similar
>             issue
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#454])
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#454])
> 
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-tglb: NOTRUN -> WARN ([i915#2681] / [i915#2684])
>      * igt@i915_pm_rpm@dpms-non-lpsp:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111644] / [i915#1397] /
>             [i915#2411])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110892])
> 
>      * igt@i915_query@query-topology-known-pci-ids:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109303])
>      * igt@kms_atomic@atomic_plane_damage:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4765])
>      * igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614]) +3 similar issues
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614]) +2
>             similar issues
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +7 similar
>             issues
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3777])
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777])
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +3 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +148 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723])
>      * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +5 similar issues
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +8 similar
>             issues
>      * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +16
>             similar issues
>      * igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689]) +7
>             similar issues
>      * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +5 similar
>             issues
>      * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +5
>             similar issues
>      * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +4 similar
>             issues
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3742])
>      * igt@kms_chamelium@hdmi-aspect-ratio:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +7
>             similar issues
>      * igt@kms_color@pipe-d-degamma:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#1149])
>      * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +27
>             similar issues
>      * igt@kms_color_chamelium@pipe-a-ctm-negative:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +5
>             similar issues
>      * igt@kms_color_chamelium@pipe-b-ctm-0-75:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +15
>             similar issues
>      * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +10
>             similar issues
>      * igt@kms_color_chamelium@pipe-c-ctm-0-25:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +10
>             similar issues
>      * igt@kms_color_chamelium@pipe-d-ctm-max:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827]) +1 similar issue
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3116] / [i915#3299])
>      * igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279]) +1
>             similar issue
>      * igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319]) +5 similar issues
>      * igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +2
>             similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +312 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +8 similar issues
>      * igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +33 similar issues
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4103]) +1 similar issue
>      * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#5072])
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278]) +1
>             similar issue
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109274] / [fdo#111825]) +14
>             similar issues
>      * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3788])
>      * igt@kms_dp_tiled_display@basic-test-pattern:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#426])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#426])
> 
>      * igt@kms_dsc@xrgb8888-dsc-compression:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3828])
>      * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL ([i915#79])
>      * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +6 similar issues
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180]) +4 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2587])
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-glk: PASS -> FAIL ([i915#2546])
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109280] / [fdo#111825]) +56
>             similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +30 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +72 similar issues
>      * igt@kms_hdr@static-swap:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1187])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1187])
> 
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1839])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1839])
> 
>      * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +1 similar
>             issue
> 
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#265])
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#265])
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +2 similar
>             issues
>      * igt@kms_plane_lowres@pipe-a-tiling-x:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536])
>      * igt@kms_plane_lowres@pipe-d-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [fdo#112054])
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +1 similar
>             issue
>      * igt@kms_psr@psr2_cursor_render:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441]) +2 similar issues
>      * igt@kms_psr@psr2_no_drrs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109441]) +2 similar issues
>      * igt@kms_psr@psr2_sprite_render:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467]) +3 similar
>             issues
>      * igt@kms_vblank@pipe-a-ts-continuation-suspend:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180] / [i915#295])
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109502])
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437]) +1 similar
>             issue
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2437]) +1 similar issue
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2437])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>      * igt@nouveau_crc@pipe-c-source-outp-complete:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2530]) +6 similar issues
>      * igt@nouveau_crc@pipe-c-source-rg:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2530]) +3 similar issues
>      * igt@perf_pmu@event-wait@rcs0:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#112283]) +1 similar issue
>      * igt@prime_nv_pcopy@test3_2:
> 
>           * shard-tglb: NOTRUN -> [SKIP][125] ([fdo#109291]) +4 similar
>             issues
