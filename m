Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AB26E9CF
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jun 2021 10:01:41 +0000 (UTC)
Date: Fri, 18 Jun 2021 12:01:36 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210618100136.GA14602@zkempczy-mobl2>
References: <20210617071643.5802-1-andrzej.turko@linux.intel.com>
 <162392307529.3752.14013672115777814163@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <162392307529.3752.14013672115777814163@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRml4IHRo?=
 =?utf-8?q?e_multiprocess_mode_of_intel_allocator?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 17, 2021 at 09:44:35AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Fix the multiprocess mode of intel allocator                   
>    URL:     https://patchwork.freedesktop.org/series/91615/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5934/index.html 
> 
>            CI Bug Log - changes from IGT_6112_full -> IGTPW_5934_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_5934_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_5934_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5934/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_5934_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_exec_balancer@bonded-true-hang:
>           * shard-tglb: PASS -> FAIL

Unrelated, changes don't touch above test in any form.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between IGT_6112_full and IGTPW_5934_full:
> 
>   New IGT tests (2)
> 
>      * igt@api_intel_allocator@random-allocator@fork-reopen-allocator:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.01, 0.04] s
>      * igt@api_intel_allocator@simple-allocator@fork-reopen-allocator:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.01, 0.04] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_5934_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@feature_discovery@display-3x:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1839])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1839])
> 
>      * igt@gem_create@create-clear:
> 
>           * shard-glk: PASS -> FAIL ([i915#1888] / [i915#3160])
>      * igt@gem_create@create-massive:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#3002])
>      * igt@gem_ctx_persistence@clone:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / [i915#1099]) +5 similar
>             issues
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#2846])
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#2846])
> 
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-glk: PASS -> FAIL ([i915#2842]) +3 similar issues
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace@vcs1:
> 
>           * shard-tglb: PASS -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_params@no-vebox:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109283])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109283])
> 
>      * igt@gem_mmap_offset@clear:
> 
>           * shard-iclb: PASS -> FAIL ([i915#3160])
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-apl: NOTRUN -> WARN ([i915#2658])
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768]) +2 similar issues
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3297])
> 
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#3318])
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#3318])
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#3318])
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#3318])
> 
>      * igt@gen9_exec_parse@unaligned-jump:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#112306]) +1 similar issue
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#112306]) +1 similar issue
> 
>      * igt@i915_pm_backlight@bad-brightness:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +78 similar issues
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#454])
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#454])
> 
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / [i915#1937])
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / [i915#1937])
> 
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / [i915#1937])
>      * igt@i915_pm_rc6_residency@media-rc6-accuracy:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289] / [fdo#111719])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289])
> 
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1769])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1769])
> 
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +2 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723])
> 
>      * igt@kms_big_joiner@invalid-modeset:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2705])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2705])
> 
>      * igt@kms_chamelium@dp-hpd-storm-disable:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / [fdo#111827]) +8 similar
>             issues
>      * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / [fdo#111827]) +17 similar
>             issues
>      * igt@kms_color@pipe-d-ctm-max:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / [i915#1149])
>      * igt@kms_color_chamelium@pipe-a-ctm-0-5:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / [fdo#111827]) +20 similar
>             issues
>      * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / [fdo#111827]) +13 similar
>             issues
>      * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +2
>             similar issues
>      * igt@kms_color_chamelium@pipe-b-ctm-0-5:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +3
>             similar issues
>      * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / [fdo#109284] /
>             [fdo#111827])
>      * igt@kms_content_protection@lic:
> 
>           * shard-apl: NOTRUN -> TIMEOUT ([i915#1319]) +2 similar issues
>      * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +1 similar issue
>      * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
> 
>           * shard-glk: PASS -> FAIL ([i915#3444])
>      * igt@kms_cursor_crc@pipe-a-cursor-suspend:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180])
>      * igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271) +176 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-32x32-random:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319])
>      * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274 / fdo#109278) +1 similar
>             issue
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111825]) +20 similar issues
>      * igt@kms_flip@2x-nonexisting-fb:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +3 similar issues
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL ([i915#79])
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180])
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180]) +2 similar issues
> 
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / [i915#2672])
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / [i915#2642])
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / [i915#2642])
> 
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +362 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +242 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +14 similar issues
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / [i915#533]) +4 similar
>             issues
>      * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +13 similar issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / [i915#533])
> 
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / [i915#533]) +1 similar
>             issue
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#265])
>      * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
> 
>           * shard-glk: NOTRUN -> FAIL (fdo#108145 / [i915#265])
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
> 
>           * shard-apl: NOTRUN -> FAIL (fdo#108145 / [i915#265])
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
> 
>           * shard-kbl: NOTRUN -> FAIL (fdo#108145 / [i915#265]) +2 similar
>             issues
>      * igt@kms_plane_lowres@pipe-c-tiling-yf:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3536]) +1 similar issue
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2920])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#658])
> 
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / [i915#658]) +4 similar
>             issues
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / [i915#658]) +2 similar
>             issues
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / [i915#658]) +4 similar
>             issues
>      * igt@kms_psr@psr2_cursor_blt:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441]) +1 similar issue
>      * igt@kms_psr@psr2_dpms:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467]) +2 similar
>             issues
>      * igt@kms_psr@psr2_primary_mmap_cpu:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109441]) +2 similar issues
>      * igt@kms_setmode@basic:
> 
>           * shard-snb: NOTRUN -> FAIL ([i915#31])
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / [i915#2437])
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / [i915#2437]) +1 similar
>             issue
>      * igt@prime_nv_pcopy@test3_2:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109291])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109291])
> 
>      * igt@prime_vgem@basic-userptr:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3301])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3301])
> 
>      * igt@sysfs_clients@fair-1:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / [i915#2994]) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2994])
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / [i915#2994]) +4 similar
>             issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2994])
> 
>      * igt@sysfs_clients@sema-10:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / [i915#2994]) +1 similar
>             issue
> 
>     Possible fixes
> 
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-iclb: FAIL ([i915#2842]) -> PASS
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-glk: FAIL ([i915#2842]) -> PASS
>      * igt@kms_big_fb@linear-32bpp-rotate-180:
> 
>           * shard-glk: DMESG-WARN ([i915#118] / [i915#95]) -> PASS +2 similar
>             issues
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
> 
>           * shard-glk: FAIL -> PASS
>      * igt@kms_flip@flip-vs-suspend@a-dp1:
> 
>           * shard-apl: DMESG-WARN ([i915#180]) -> PASS +2 similar issues
>      * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
> 
>           * shard-kbl: DMESG-WARN ([i915#180]) -> PASS +1 similar issue
>      * igt@kms_psr@psr2_no_drrs:
> 
>           * shard-iclb: SKIP ([fdo#109441]) -> PASS +1 similar issue
>      * igt@kms_vblank@pipe-c-ts-continuation-suspend:
> 
>           * shard-kbl: INCOMPLETE ([i915#155] / [i915#2828] / [i915#794]) ->
>             PASS
> 
>     Warnings
> 
>      * igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-iclb: SKIP ([i915#658]) -> SKIP ([i915#588])
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-iclb: WARN ([i915#2684]) -> WARN ([i915#1804] /
>             [i915#2684])
>      * igt@kms_dp_dsc@basic-dsc-enable-edp:
> 
>           * shard-iclb: SKIP ([fdo#109349]) -> DMESG-WARN ([i915#1226])
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
> 
>           * shard-iclb: SKIP ([i915#2920]) -> SKIP ([i915#658]) +4 similar
>             issues
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
> 
>           * shard-iclb: SKIP ([i915#658]) -> SKIP ([i915#2920]) +2 similar
>             issues
>      * igt@runner@aborted:
> 
>           * shard-apl: (FAIL, FAIL, FAIL, FAIL, FAIL) (fdo#109271 /
>             [i915#180] / [i915#3002] / [i915#3363]) -> (FAIL, FAIL, FAIL,
>             FAIL) ([i915#180] / [i915#3002] / [i915#3363])

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
