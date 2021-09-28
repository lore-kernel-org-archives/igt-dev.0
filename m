Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D636E8A4
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Sep 2021 13:09:25 +0000 (UTC)
Date: Tue, 28 Sep 2021 15:09:20 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210928130920.GA23910@zkempczy-mobl2>
References: <20210927112100.87984-1-zbigniew.kempczynski@intel.com>
 <163275840380.14086.7395766049750023797@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163275840380.14086.7395766049750023797@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2lu?=
 =?utf-8?q?tel=5Fbatchbuffer=3A_Remove_duplicated_assignment_=28rev2=29?=
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
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 27, 2021 at 04:00:03PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/intel_batchbuffer: Remove duplicated assignment (rev2)     
>    URL:     https://patchwork.freedesktop.org/series/95088/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6264/index.html 
> 
>          CI Bug Log - changes from CI_DRM_10647_full -> IGTPW_6264_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6264_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6264_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6264/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6264_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_exec_suspend@basic-s3:
> 
>           * shard-kbl: PASS -> INCOMPLETE
>      * igt@gem_flink_race@flink_close:
> 
>           * shard-tglb: PASS -> FAIL
> 

Changes in the patch doesn't introduce above incomplete/fail regression IMO.

--
Zbigniew


> Known issues
> 
>    Here are the changes found in IGTPW_6264_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ctx_persistence@engines-hostile-preempt:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +4 similar
>             issues
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-snb: NOTRUN -> FAIL ([i915#3354])
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842]) +5 similar issues
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#2842]) +2 similar issues
> 
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2842]) +5 similar issues
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: PASS -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_fair@basic-pace@vcs0:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_params@no-bsd:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109283])
>      * igt@gem_exec_whisper@basic-contexts-all:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118] / [i915#95])
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-apl: NOTRUN -> WARN ([i915#2658])
>      * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +61 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768]) +1 similar issue
> 
>      * igt@gem_softpin@noreloc-s3:
> 
>           * shard-tglb: PASS -> INCOMPLETE ([i915#1373] / [i915#456])
>      * igt@gem_userptr_blits@coherency-unsync:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297]) +1 similar issue
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3323])
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#3318])
>      * igt@gen9_exec_parse@batch-invalid-length:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +470 similar issues
>      * igt@gen9_exec_parse@batch-zero-length:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856]) +2 similar issues
>      * igt@gen9_exec_parse@shadow-peek:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2856]) +2 similar issues
>      * igt@i915_pm_rpm@dpms-non-lpsp:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111644] / [i915#1397] /
>             [i915#2411])
>      * igt@i915_pm_rpm@modeset-pc8-residency-stress:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +297 similar issues
>      * igt@i915_suspend@fence-restore-tiled2untiled:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#404])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#404])
> 
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614]) +1 similar issue
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +5 similar issues
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723])
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +3 similar
>             issues
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +3 similar
>             issues
>      * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +3 similar
>             issues
>      * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +2
>             similar issues
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +5 similar
>             issues
> 
>      * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +20
>             similar issues
>      * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +5 similar issues
>      * igt@kms_chamelium@dp-hpd-storm:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +6
>             similar issues
>      * igt@kms_chamelium@dp-mode-timings:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +23
>             similar issues
>      * igt@kms_chamelium@hdmi-hpd-fast:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +23
>             similar issues
>      * igt@kms_color@pipe-d-ctm-negative:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#1149])
>      * igt@kms_color_chamelium@pipe-a-ctm-0-75:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +16
>             similar issues
>      * igt@kms_color_chamelium@pipe-b-ctm-0-75:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +10
>             similar issues
>      * igt@kms_color_chamelium@pipe-c-ctm-0-5:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +7
>             similar issues
>      * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827])
>      * igt@kms_content_protection@atomic:
> 
>           * shard-apl: NOTRUN -> TIMEOUT ([i915#1319]) +1 similar issue
>      * igt@kms_content_protection@legacy:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111828])
>      * igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279])
>      * igt@kms_cursor_crc@pipe-b-cursor-suspend:
> 
>           * shard-tglb: PASS -> INCOMPLETE ([i915#456])
>      * igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +4 similar issues
>      * igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319]) +1 similar issue
>      * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +5
>             similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-suspend:
> 
>           * shard-tglb: PASS -> INCOMPLETE ([i915#2411] / [i915#4211])
>      * igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +15 similar issues
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-kbl: PASS -> INCOMPLETE ([i915#155] / [i915#180] /
>             [i915#636])
>      * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL ([i915#79])
>      * igt@kms_flip@2x-flip-vs-rmfb:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +1 similar issue
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#180]) +2 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2587])
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +142 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +14 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111825]) +31 similar issues
>      * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289]) +1 similar issue
> 
>      * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
>      * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
>      * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +2 similar
>             issues
>      * igt@kms_plane_lowres@pipe-a-tiling-none:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3536])
> 
>      * igt@kms_plane_lowres@pipe-d-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#112054])
>      * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2733])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2733])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2733])
> 
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +3 similar
>             issues
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +3 similar
>             issues
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2920]) +1 similar issue
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#658])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>      * igt@kms_psr@psr2_cursor_plane_move:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441])
>      * igt@kms_psr@psr2_primary_mmap_cpu:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467]) +1 similar
>             issue
>      * igt@kms_setmode@basic:
> 
>           * shard-snb: NOTRUN -> FAIL ([i915#31])
>      * igt@kms_vblank@pipe-a-ts-continuation-suspend:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#180] / [i915#295])
>      * igt@kms_vrr@flipline:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109502])
>      * igt@nouveau_crc@pipe-b-ctx-flip-detection:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2530])
>      * igt@nouveau_crc@pipe-d-source-rg:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#2530])
>      * igt@prime_nv_api@i915_nv_import_vs_close:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109291]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109291])
> 
>      * igt@sysfs_clients@recycle-many:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +1 similar
>             issue
>      * igt@sysfs_clients@split-10:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2994])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +1 similar
>             issue
> 
>     Possible fixes
> 
>      * igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>           * shard-apl: DMESG-WARN ([i915#180]) -> PASS +2 similar issues
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: TIMEOUT ([i915#2369] / [i915#3063] / [i915#3648]) ->
>             PASS
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-kbl: FAIL ([i915#2846]) -> PASS
> 
>           * shard-glk: FAIL ([i915#2846]) -> PASS
> 
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-tglb: FAIL ([i915#2842]) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-pace@vcs0:
> 
>           * shard-iclb: FAIL ([i915#2842]) -> PASS
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-kbl: SKIP ([fdo#109271]) -> PASS +2 similar issues
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-tglb: INCOMPLETE ([i915#456]) -> PASS
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
> 
>           * shard-iclb: SKIP ([i915#3701]) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-kbl: DMESG-WARN ([i915#180]) -> PASS +7 similar issues
> 
>           * shard-tglb: INCOMPLETE ([i915#2411] / [i915#456]) -> PASS +1
>             similar issue
> 
>      * igt@kms_psr2_su@frontbuffer:
> 
>           * shard-iclb: SKIP ([fdo#109642] / [fdo#111068] / [i915#658]) ->
>             PASS
>      * igt@kms_psr@psr2_sprite_mmap_gtt:
> 
>           * shard-iclb: SKIP ([fdo#109441]) -> PASS +1 similar issue
>      * igt@perf@polling-parameterized:
> 
>           * shard-glk: FAIL ([i915#1542]) -> PASS
> 
>     Warnings
> 
>      * igt@i915_pm_rc6_residency@rc6-fence:
>           * shard-iclb: WARN ([i915#2684]) -> [WARN][136] ([i915#1804] /
>             [i915#2684]) +1 similar issue
