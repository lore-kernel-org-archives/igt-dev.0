Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223AE6E8BC
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 08:35:49 +0000 (UTC)
Date: Thu, 19 Aug 2021 10:35:43 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210819083543.GB3207@zkempczy-mobl2>
References: <20210819044941.7699-1-zbigniew.kempczynski@intel.com>
 <162936075417.11704.4685175468303311216@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162936075417.11704.4685175468303311216@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRvcHQg?=
 =?utf-8?q?to_use_allocator_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 19, 2021 at 08:12:34AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Adopt to use allocator (rev5)                                  
>    URL:     https://patchwork.freedesktop.org/series/93661/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6136/index.html 
> 
>          CI Bug Log - changes from CI_DRM_10498_full -> IGTPW_6136_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6136_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6136_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6136/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6136_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_userptr_blits@huge-split:
> 
>           * shard-iclb: PASS -> FAIL
>      * igt@kms_cursor_crc@pipe-b-cursor-128x42-random:
> 
>           * shard-tglb: PASS -> INCOMPLETE

Series I've sent is unrelated, it touches gem_ctx_shared and gem_shrink.

Please do not re-run, most important for me is trybot series which relies
on this igt code.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_6136_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@feature_discovery@display-4x:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1839])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1839])
> 
>      * igt@gem_create@create-massive:
> 
>           * shard-snb: NOTRUN -> DMESG-WARN ([i915#3002])
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#3002])
> 
>      * igt@gem_ctx_persistence@legacy-engines-queued:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +3 similar
>             issues
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#2846])
>      * igt@gem_exec_fair@basic-pace@bcs0:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842])
> 
>           * shard-tglb: PASS -> FAIL ([i915#2842]) +1 similar issue
> 
>      * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109313])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109313])
> 
>      * igt@gem_exec_schedule@submit-early-slice@vecs0:
> 
>           * shard-tglb: PASS -> INCOMPLETE ([i915#3797])
>      * igt@gem_exec_whisper@basic-queues-priority-all:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118] / [i915#95])
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglb: PASS -> SKIP ([i915#2190])
>      * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768]) +1 similar issue
>      * igt@gem_userptr_blits@mmap-offset-banned@fixed:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3922])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3922])
> 
>      * igt@gem_userptr_blits@readonly-pwrite-unsync:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3297]) +1 similar issue
>      * igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297]) +1 similar issue
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#3318])
>      * igt@gen3_render_tiledx_blits:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289]) +1 similar issue
>      * igt@gen3_render_tiledy_blits:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289]) +2 similar issues
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#1436] / [i915#716])
>      * igt@gen9_exec_parse@secure-batches:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856])
>      * igt@gen9_exec_parse@valid-registers:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2856]) +1 similar issue
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-iclb: PASS -> FAIL ([i915#454])
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#1937])
>      * igt@i915_selftest@live@gt_lrc:
> 
>           * shard-tglb: NOTRUN -> DMESG-FAIL ([i915#2373])
>      * igt@i915_selftest@live@gt_pm:
> 
>           * shard-tglb: NOTRUN -> DMESG-FAIL ([i915#1759] / [i915#2291])
>      * igt@i915_suspend@forcewake:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +3 similar
>             issues
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777])
> 
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>           * shard-glk: PASS -> FAIL ([i915#1888] / [i915#3653])
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723])
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +2 similar issues
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +19
>             similar issues
>      * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +373 similar issues
>      * igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +1 similar issue
>      * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +4 similar
>             issues
>      * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +3
>             similar issues
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +1 similar
>             issue
> 
>      * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886])
>      * igt@kms_chamelium@hdmi-frame-dump:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +2
>             similar issues
>      * igt@kms_chamelium@hdmi-hpd-fast:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +19
>             similar issues
>      * igt@kms_chamelium@hdmi-hpd-storm:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +3
>             similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +2
>             similar issues
> 
>      * igt@kms_color@pipe-d-ctm-max:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#1149]) +1
>             similar issue
>      * igt@kms_color_chamelium@pipe-a-ctm-negative:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +4
>             similar issues
>      * igt@kms_color_chamelium@pipe-c-ctm-0-25:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +20
>             similar issues
>      * igt@kms_content_protection@lic:
> 
>           * shard-apl: NOTRUN -> TIMEOUT ([i915#1319]) +3 similar issues
>      * igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279]) +5
>             similar issues
>      * igt@kms_cursor_crc@pipe-a-cursor-max-size-offscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +11 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +2 similar issues
> 
>      * igt@kms_cursor_crc@pipe-c-cursor-suspend:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180])
>      * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +6
>             similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-suspend:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +84 similar issues
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278]) +1
>             similar issue
>      * igt@kms_dp_tiled_display@basic-test-pattern:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#426])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#426])
> 
>      * igt@kms_dsc@basic-dsc-enable@edp-1-pipe-c:
> 
>           * shard-iclb: NOTRUN -> DMESG-WARN ([i915#1226]) +2 similar issues
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-kbl: PASS -> INCOMPLETE ([i915#155] / [i915#180] /
>             [i915#636])
>      * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +1 similar issue
>      * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2672])
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111825]) +19 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +11 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +48 similar issues
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +1 similar
>             issue
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
> 
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#265])
>      * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#112054])
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#658]) +2 similar issues
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +2 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +1 similar
>             issue
> 
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2920]) +2 similar issues
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +4 similar
>             issues
>      * igt@kms_psr@psr2_cursor_mmap_gtt:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467]) +1 similar
>             issue
>      * igt@kms_psr@psr2_cursor_plane_move:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441]) +2 similar issues
>      * igt@kms_psr@psr2_primary_page_flip:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109441]) +1 similar issue
>      * igt@kms_setmode@basic:
> 
>           * shard-snb: NOTRUN -> FAIL ([i915#31])
>      * igt@kms_sysfs_edid_timing:
> 
>           * shard-apl: NOTRUN -> FAIL ([IGT#2])
>      * igt@kms_vblank@pipe-a-ts-continuation-suspend:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180] / [i915#295])
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109502])
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437]) +1 similar
>             issue
>      * igt@nouveau_crc@pipe-c-source-outp-complete:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2530])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2530])
> 
>      * igt@perf@polling-parameterized:
> 
>           * shard-glk: PASS -> FAIL ([i915#1542])
>      * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +281 similar issues
>      * igt@prime_nv_pcopy@test_semaphore:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109291]) +1 similar issue
>      * igt@prime_nv_test@nv_write_i915_gtt_mmap_read:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109291]) +1 similar issue
>      * igt@sysfs_clients@fair-7:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +2 similar
>             issues
>      * igt@sysfs_clients@sema-25:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2994])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2994])
> 
>     Possible fixes
> 
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: TIMEOUT ([i915#2369] / [i915#3063] / [i915#3648]) ->
>             PASS
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-kbl: FAIL ([i915#2842]) -> PASS +1 similar issue
>      * igt@i915_pm_rc6_residency@rc6-fence:
> 
>           * shard-tglb: WARN ([i915#2681]) -> PASS
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
> 
>           * shard-glk: DMESG-WARN ([i915#118] / [i915#95]) -> PASS
>      * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
> 
>           * shard-iclb: SKIP ([i915#3788]) -> PASS
>      * igt@kms_flip@flip-vs-suspend@a-dp1:
> 
>           * shard-apl: DMESG-WARN ([i915#180]) -> PASS +3 similar issues
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-tglb: SKIP ([i915#433]) -> PASS
>      * igt@kms_psr2_su@page_flip:
> 
>           * shard-iclb: SKIP ([fdo#109642] / [fdo#111068] / [i915#658]) ->
>             PASS
>      * igt@kms_psr@psr2_no_drrs:
> 
>           * shard-iclb: SKIP ([fdo#109441]) -> PASS +1 similar issue
> 
>     Warnings
> 
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-iclb: FAIL ([i915#2849]) -> FAIL ([i915#2842])
>      * igt@gem_softpin@noreloc-s3:
> 
>           * shard-kbl: DMESG-WARN ([i915#180]) -> INCOMPLETE ([i915#2405])
>      * igt@i915_pm_rc6_residency@rc6-fence:
> 
>           * shard-iclb: WARN ([i915#2684]) -> WARN ([i915#1804] /
>             [i915#2684])
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:
> 
>           * shard-iclb: SKIP ([i915#2920]) -> [SKIP][138] ([i915#658])
