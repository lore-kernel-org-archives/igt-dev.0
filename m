Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87316E1BA
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Oct 2021 05:10:19 +0000 (UTC)
Date: Wed, 20 Oct 2021 07:10:14 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211020051014.GA3479@zkempczy-mobl2>
References: <20211019122042.1699646-1-apoorva1.singh@intel.com>
 <163466153977.5185.5394956197958378442@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163466153977.5185.5394956197958378442@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fcreate=3A_Add_support_for_local_memory_=28rev2=29?=
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
Cc: apoorva1.singh@intel.com, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 19, 2021 at 04:38:59PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  i915/gem_exec_create: Add support for local memory (rev2)      
>    URL:     https://patchwork.freedesktop.org/series/95411/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/index.html 
> 
>          CI Bug Log - changes from CI_DRM_10759_full -> IGTPW_6332_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6332_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6332_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6332/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6332_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_vblank@pipe-b-wait-forked:
>           * shard-iclb: PASS -> INCOMPLETE

Unrelated, change touches gem_exec_create only.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_10759_full and
>    IGTPW_6332_full:
> 
>   New IGT tests (4)
> 
>      * igt@gem_exec_create@basic@smem:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [2.04, 2.07] s
>      * igt@gem_exec_create@forked@smem:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [20.07, 20.08] s
>      * igt@gem_exec_create@legacy@smem:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [2.04, 2.06] s
>      * igt@gem_exec_create@madvise@smem:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [20.17, 20.51] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_6332_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ctx_isolation@preservation-s3@vcs1:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180])
>      * igt@gem_ctx_persistence@legacy-engines-mixed-process:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +4 similar
>             issues
>      * igt@gem_ctx_persistence@many-contexts:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2410])
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: PASS -> TIMEOUT ([i915#2369] / [i915#3063] /
>             [i915#3648])
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-none@rcs0:
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-none@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: PASS -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_suspend@basic-s3:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#180])
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2190])
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-snb: NOTRUN -> WARN ([i915#2658])
>      * igt@gem_pxp@reject-modify-context-protection-off-3:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270])
> 
>      * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768])
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297])
>      * igt@gen3_mixed_blits:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289])
> 
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2856]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856]) +1 similar issue
> 
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4281])
>      * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110892])
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109288])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109288])
> 
>      * igt@i915_selftest@live@hangcheck:
> 
>           * shard-snb: PASS -> INCOMPLETE ([i915#3921])
>      * igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614]) +1
>             similar issue
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614])
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118]) +1 similar issue
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +3 similar
>             issues
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +4 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777])
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +244 similar issues
>      * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
> 
>           * shard-apl: NOTRUN -> DMESG-FAIL ([i915#4298]) +1 similar issue
>      * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> 
>           * shard-iclb: NOTRUN -> DMESG-FAIL ([i915#4298])
> 
>           * shard-kbl: NOTRUN -> DMESG-FAIL ([i915#4298])
> 
>      * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>           * shard-snb: NOTRUN -> FAIL ([i915#4299])
>      * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#1385]) +1 similar issue
>      * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +8 similar
>             issues
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +10
>             similar issues
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +1 similar
>             issue
>      * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +6
>             similar issues
>      * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +6 similar
>             issues
>      * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +7 similar issues
>      * igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +18 similar issues
>      * igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +50 similar issues
>      * igt@kms_chamelium@vga-hpd-after-suspend:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +4
>             similar issues
>      * igt@kms_chamelium@vga-hpd-for-each-pipe:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +8
>             similar issues
>      * igt@kms_color@pipe-d-ctm-0-25:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#1149])
>      * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +19
>             similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +5
>             similar issues
> 
>      * igt@kms_color_chamelium@pipe-d-ctm-0-5:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827])
>      * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +10
>             similar issues
>      * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +23
>             similar issues
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3116])
>      * igt@kms_content_protection@srm:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111828])
>      * igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279]) +4
>             similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319]) +1 similar issue
>      * igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +4 similar issues
>      * igt@kms_cursor_crc@pipe-c-cursor-suspend:
> 
>           * shard-tglb: PASS -> INCOMPLETE ([i915#2411] / [i915#456])
>      * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +4
>             similar issues
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278])
>      * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3788])
>      * igt@kms_dsc@basic-dsc-enable:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3840])
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +7 similar issues
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
> 
>           * shard-iclb: PASS -> SKIP ([i915#3701])
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +409 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111825]) +32 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +19 similar issues
>      * igt@kms_frontbuffer_tracking@psr-suspend:
> 
>           * shard-tglb: NOTRUN -> INCOMPLETE ([i915#2411] / [i915#456])
>      * igt@kms_invalid_mode@clock-too-high:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4278])
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
> 
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
> 
>           * shard-tglb: PASS -> INCOMPLETE ([i915#2828] / [i915#456])
>      * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
> 
>           * shard-glk: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
> 
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +2 similar
>             issues
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#265])
>      * igt@kms_plane_lowres@pipe-a-tiling-none:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3536]) +1 similar issue
>      * igt@kms_plane_lowres@pipe-a-tiling-y:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536])
>      * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#112054])
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +1 similar issue
>      * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2733])
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +2 similar
>             issues
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#658]) +1 similar issue
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2920]) +1 similar issue
> 
>      * igt@kms_psr2_su@frontbuffer:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +3 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109642] / [fdo#111068] /
>             [i915#658])
> 
>      * igt@kms_psr2_su@page_flip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +2 similar
>             issues
>      * igt@kms_psr@psr2_cursor_render:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109441])
>      * igt@kms_psr@psr2_primary_mmap_gtt:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467]) +1 similar
>             issue
>      * igt@kms_psr@psr2_sprite_plane_move:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441]) +4 similar issues
>      * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +121 similar issues
>      * igt@kms_vblank@pipe-b-ts-continuation-suspend:
> 
>           * shard-tglb: PASS -> INCOMPLETE ([i915#2828])
>      * igt@kms_vblank@pipe-d-wait-idle:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109502])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109502])
> 
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
>      * igt@nouveau_crc@pipe-a-source-rg:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2530]) +2 similar issues
>      * igt@nouveau_crc@pipe-b-ctx-flip-detection:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2530]) +2 similar issues
>      * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109291]) +4 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109291])
> 
>      * igt@sysfs_clients@fair-7:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2994]) +1 similar issue
>      * igt@sysfs_clients@recycle:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +2 similar
>             issues
>      * igt@sysfs_clients@recycle-many:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +2 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2994])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +1 similar
>             issue
> 
>     Possible fixes
> 
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-iclb: TIMEOUT ([i915#2369] / [i915#2481] / [i915#3070]) ->
>             PASS
>      * igt@gem_exec_fair@basic-none@vcs1:
> 
>           * shard-kbl: FAIL ([i915#2842]) -> PASS
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-tglb: FAIL ([i915#2842]) -> PASS
>      * igt@gem_exec_fair@basic-pace@vcs1:
> 
>           * shard-kbl: [SKIP][127] ([fdo#109271]) -> [PASS][128] +1
