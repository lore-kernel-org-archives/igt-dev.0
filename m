Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4713E10E289
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Dec 2021 09:10:49 +0000 (UTC)
Date: Fri, 10 Dec 2021 10:10:44 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211210091044.GA10929@zkempczy-mobl2>
References: <20211209200453.15885-1-zbigniew.kempczynski@intel.com>
 <163912574584.3443.6242832375119580224@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163912574584.3443.6242832375119580224@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgU3RvcCBm?=
 =?utf-8?q?ailing_on_system_region_on_stable_kernels?=
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

On Fri, Dec 10, 2021 at 08:42:25AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Stop failing on system region on stable kernels                
>    URL:     https://patchwork.freedesktop.org/series/97830/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6486/index.html 
> 
>          CI Bug Log - changes from CI_DRM_10984_full -> IGTPW_6486_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6486_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6486_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6486/index.html
> 
> Participating hosts (10 -> 7)
> 
>    Missing (3): pig-skl-6260u pig-glk-j5005 shard-rkl
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6486_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_fenced_exec_thrash@no-spare-fences:
> 
>           * shard-snb: PASS -> INCOMPLETE
>      * igt@kms_plane@plane-position-covered@pipe-b-planes:
> 
>           * shard-iclb: PASS -> FAIL +1 similar issue
> 
>     Warnings
> 
>      * igt@gem_exec_suspend@basic-s3:
>           * shard-kbl: DMESG-WARN ([i915#180]) -> INCOMPLETE

Change was in memory regions so it's unrelated to above fails/warnings.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_6486_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_create@create-massive:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#3002])
>      * igt@gem_ctx_persistence@hang:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099])
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-iclb: PASS -> TIMEOUT ([i915#2481] / [i915#3070])
>      * igt@gem_exec_balancer@parallel-bb-first:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4525]) +1 similar issue
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4525]) +1 similar issue
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-glk: PASS -> FAIL ([i915#2846])
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-tglb: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-none@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842]) +4 similar issues
>      * igt@gem_exec_fair@basic-pace@vcs1:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-glk: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_whisper@basic-contexts-all:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118])
>      * igt@gem_lmem_swapping@parallel-multi:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +1 similar
>             issue
>      * igt@gem_lmem_swapping@parallel-random-verify:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613])
>      * igt@gem_mmap_gtt@coherency:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111656])
>      * igt@gem_render_copy@y-tiled-to-vebox-linear:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768])
>      * igt@gem_softpin@evict-snoop:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109312])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109312])
> 
>      * igt@gem_userptr_blits@input-checking:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#3002])
>      * igt@gem_userptr_blits@readonly-unsync:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3297])
> 
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#3318])
>      * igt@gen9_exec_parse@bb-large:
> 
>           * shard-apl: PASS -> TIMEOUT ([i915#4639])
>      * igt@gen9_exec_parse@cmd-crossing-page:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2856]) +1 similar issue
>      * igt@gen9_exec_parse@unaligned-access:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856]) +1 similar issue
>      * igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +2 similar
>             issues
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-apl: PASS -> SKIP ([fdo#109271])
>      * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109506] / [i915#2411])
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1769])
>      * igt@kms_big_fb@linear-32bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614])
> 
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
> 
>           * shard-glk: PASS -> FAIL ([i915#3653])
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +4 similar
>             issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777])
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +9 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +3 similar
>             issues
> 
>      * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +1 similar issue
>      * igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689]) +5
>             similar issues
>      * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +21 similar issues
>      * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +4
>             similar issues
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +10
>             similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +2 similar
>             issues
> 
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +155 similar issues
>      * igt@kms_chamelium@hdmi-edid-change-during-suspend:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +11
>             similar issues
>      * igt@kms_chamelium@hdmi-hpd-storm:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +12
>             similar issues
>      * igt@kms_chamelium@vga-edid-read:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +7
>             similar issues
>      * igt@kms_color_chamelium@pipe-a-ctm-0-75:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +7
>             similar issues
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +3
>             similar issues
> 
>      * igt@kms_color_chamelium@pipe-c-ctm-0-75:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +3
>             similar issues
>      * igt@kms_content_protection@lic:
> 
>           * shard-apl: NOTRUN -> TIMEOUT ([i915#1319])
>      * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279])
>      * igt@kms_cursor_crc@pipe-c-cursor-32x32-random:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319])
>      * igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +5 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359])
>      * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> 
>           * shard-glk: PASS -> FAIL ([i915#72])
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4103])
>      * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278]) +1
>             similar issue
>      * igt@kms_dsc@basic-dsc-enable:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3840])
>      * igt@kms_flip@2x-nonexisting-fb:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +6 similar issues
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +6 similar issues
>      * igt@kms_flip@flip-vs-suspend@b-dp1:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180])
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
> 
>           * shard-iclb: PASS -> SKIP ([i915#3701])
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +11 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +176 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2546])
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111825]) +16 similar issues
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180] / [i915#1982])
>      * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#265])
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#265])
> 
>      * igt@kms_plane_cursor@pipe-d-viewport-size-256:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +34 similar issues
>      * igt@kms_plane_lowres@pipe-c-tiling-none:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3536])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536])
> 
>      * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [fdo#112054])
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2920])
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +3 similar
>             issues
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1911])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#658])
> 
>      * igt@kms_psr@psr2_cursor_render:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441]) +1 similar issue
>      * igt@kms_psr@psr2_sprite_blt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109441])
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-iclb: PASS -> DMESG-FAIL ([i915#1226] / [i915#65])
>      * igt@kms_vblank@pipe-d-wait-idle:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +1 similar
>             issue
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +1 similar
>             issue
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +1 similar
>             issue
> 
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
>      * igt@nouveau_crc@pipe-c-ctx-flip-detection:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2530])
>      * igt@perf@gen12-oa-tlb-invalidate:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289]) +1 similar issue
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109295])
>      * igt@sysfs_clients@sema-50:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2994])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +1 similar
>             issue
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2994])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2994])
> 
>      * igt@sysfs_heartbeat_interval@precise@rcs0:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +78 similar issues
> 
>     Possible fixes
> 
>      * igt@gem_eio@in-flight-contexts-10ms:
> 
>           * shard-tglb: TIMEOUT ([i915#3063]) -> PASS
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-glk: FAIL ([i915#2842]) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-iclb: FAIL ([i915#2842]) -> PASS
>      * igt@gem_workarounds@suspend-resume-context:
> 
>           * shard-apl: DMESG-WARN ([i915#180]) -> PASS +3 similar issues
>      * igt@kms_big_fb@linear-32bpp-rotate-0:
> 
>           * shard-glk: DMESG-WARN ([i915#118]) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-iclb: FAIL ([i915#2346]) -> PASS
>      * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: FAIL ([i915#79]) -> PASS
>      * igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>           * shard-kbl: DMESG-WARN ([i915#180]) -> PASS +4 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
> 
>           * shard-iclb: SKIP ([i915#3701]) -> [PASS][137]
