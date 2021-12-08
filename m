Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3252E6EC1F
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Dec 2021 07:48:33 +0000 (UTC)
Date: Wed, 8 Dec 2021 08:48:28 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211208074828.GC3623@zkempczy-mobl2>
References: <20211207131013.27252-1-zbigniew.kempczynski@intel.com>
 <163889642286.10819.404628352171233075@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163889642286.10819.404628352171233075@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Ffence=3A_Adopt_to_use_no-reloc_in_three_syncobj_su?=
 =?utf-8?q?btests?=
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

On Tue, Dec 07, 2021 at 05:00:22PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/gem_exec_fence: Adopt to use no-reloc in three syncobj      
>             subtests                                                          
>    URL:     https://patchwork.freedesktop.org/series/97655/                   
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/index.html    
> 
>          CI Bug Log - changes from CI_DRM_10968_full -> IGTPW_6474_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6474_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6474_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/index.html
> 
> Participating hosts (10 -> 7)
> 
>    Missing (3): pig-skl-6260u pig-glk-j5005 shard-rkl
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6474_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@sysfs_heartbeat_interval@precise@vecs0:
> 
>           * shard-kbl: PASS -> FAIL
> 
>           * shard-tglb: PASS -> FAIL
> 
>      * igt@testdisplay:
> 
>           * shard-apl: PASS -> TIMEOUT
> 
>           * shard-kbl: PASS -> TIMEOUT

Unrelated, change touched gem_exec_fence test only.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_10968_full and
>    IGTPW_6474_full:
> 
>   New IGT tests (5)
> 
>      * igt@gem_ctx_exec@basic-close-race:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [5.43, 5.50] s
>      * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-scaler-with-clipping-clamping:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 9.54] s
>      * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-scaler-with-clipping-clamping:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 11.21] s
>      * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
> 
>           * Statuses : 2 pass(s) 3 skip(s)
>           * Exec time: [0.0, 2.00] s
>      * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-scaler-with-clipping-clamping:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [1.99] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_6474_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@feature_discovery@display-2x:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1839]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1839])
> 
>      * igt@feature_discovery@display-3x:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +108 similar issues
>      * igt@gem_ctx_persistence@smoketest:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +3 similar
>             issues
>      * igt@gem_eio@in-flight-contexts-10ms:
> 
>           * shard-tglb: PASS -> TIMEOUT ([i915#3063])
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: PASS -> TIMEOUT ([i915#3063] / [i915#3648])
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4525])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4525])
> 
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2846])
> 
>           * shard-glk: PASS -> FAIL ([i915#2846])
> 
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-glk: PASS -> FAIL ([i915#2842]) +3 similar issues
>      * igt@gem_exec_fair@basic-none-vip@rcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2842])
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842])
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#2842])
> 
>      * igt@gem_exec_fair@basic-none@rcs0:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-tglb: PASS -> FAIL ([i915#2842]) +2 similar issues
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_params@no-bsd:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109283])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109283])
> 
>      * igt@gem_exec_schedule@semaphore-codependency:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +141 similar issues
>      * igt@gem_exec_whisper@basic-fds-priority-all:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118])
>      * igt@gem_lmem_swapping@parallel-multi:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +2 similar
>             issues
>      * igt@gem_lmem_swapping@verify-random:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4613])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4613])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +1 similar
>             issue
> 
>      * igt@gem_pxp@create-regular-buffer:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270]) +1 similar issue
> 
>      * igt@gem_softpin@evict-snoop:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109312])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109312])
> 
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3323])
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297]) +1 similar issue
>      * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3297]) +1 similar issue
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#3318])
>      * igt@gen7_exec_parse@cmd-crossing-page:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289]) +1 similar issue
>      * igt@gen7_exec_parse@oacontrol-tracking:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289])
>      * igt@gen9_exec_parse@cmd-crossing-page:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2856])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856])
> 
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#454])
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#454])
> 
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-tglb: NOTRUN -> WARN ([i915#2681] / [i915#2684])
> 
>           * shard-iclb: NOTRUN -> WARN ([i915#1804] / [i915#2684])
> 
>      * igt@i915_pm_rpm@modeset-pc8-residency-stress:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +176 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109506] / [i915#2411])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109293] / [fdo#109506])
> 
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3826])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3826])
> 
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3777])
> 
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614])
> 
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +3 similar
>             issues
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +2 similar issues
>      * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +6 similar issues
>      * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +5 similar
>             issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +2 similar
>             issues
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +8 similar
>             issues
> 
>      * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +2 similar
>             issues
>      * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689]) +1
>             similar issue
>      * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +3
>             similar issues
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3742])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3742]) +1 similar issue
> 
>      * igt@kms_chamelium@dp-hpd-fast:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +7
>             similar issues
>      * igt@kms_chamelium@hdmi-edid-change-during-suspend:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +12
>             similar issues
>      * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +4
>             similar issues
>      * igt@kms_chamelium@hdmi-hpd-storm:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +8
>             similar issues
>      * igt@kms_color_chamelium@pipe-b-ctm-0-75:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +8
>             similar issues
>      * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827]) +2 similar issues
>      * igt@kms_color_chamelium@pipe-d-degamma:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +9
>             similar issues
>      * igt@kms_content_protection@lic:
> 
>           * shard-apl: NOTRUN -> TIMEOUT ([i915#1319])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109300] / [fdo#111066])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111828])
> 
>           * shard-kbl: NOTRUN -> TIMEOUT ([i915#1319])
> 
>      * igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +3 similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319])
>      * igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279])
>      * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +2
>             similar issues
>      * igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +21 similar issues
>      * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278])
>      * igt@kms_cursor_legacy@pipe-d-torture-bo:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +1 similar
>             issue
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +1 similar
>             issue
> 
>      * igt@kms_dp_tiled_display@basic-test-pattern:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#426])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#426])
> 
>      * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#1888])
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-kbl: PASS -> INCOMPLETE ([i915#180] / [i915#636])
>      * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +3 similar issues
>      * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
> 
>           * shard-apl: PASS -> FAIL ([i915#79])
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +3 similar issues
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2672])
>      * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-yf-ccs:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#1226])
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#1226])
> 
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109285])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109285])
> 
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +23 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180]) +2 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111825]) +31 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +107 similar issues
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +2 similar
>             issues
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180]) +2 similar issues
>      * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
> 
>           * shard-glk: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#265])
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
>      * igt@kms_plane_lowres@pipe-d-tiling-y:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536])
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2920]) +2 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#658]) +2 similar issues
> 
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +3 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +3 similar
>             issues
> 
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +3 similar
>             issues
>      * igt@kms_psr@psr2_sprite_plane_move:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109441])
> 
>           * shard-tglb: NOTRUN -> [FAIL][131] ([i915#132] /
