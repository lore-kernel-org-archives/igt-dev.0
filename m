Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A0510FA1C
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jan 2022 07:11:02 +0000 (UTC)
Date: Mon, 10 Jan 2022 08:10:57 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YdvcAVAObOCmslKZ@zkempczy-mobl2>
References: <20220106100043.14843-1-zbigniew.kempczynski@intel.com>
 <164156194958.24389.11003785887882704793@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164156194958.24389.11003785887882704793@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHN0?=
 =?utf-8?q?art_offset_and_alignment_detection_=28rev7=29?=
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

On Fri, Jan 07, 2022 at 01:25:49PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add start offset and alignment detection (rev7)                
>    URL:     https://patchwork.freedesktop.org/series/98402/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/index.html 
> 
>          CI Bug Log - changes from CI_DRM_11052_full -> IGTPW_6540_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6540_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6540_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6540/index.html
> 
> Participating hosts (13 -> 8)
> 
>    Missing (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6540_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@sysfs_heartbeat_interval@nopreempt@vcs1:
>           * shard-tglb: PASS -> FAIL

Unrelated, apart of some library part I've touched gem_softpin test only.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@gem_create@busy-create:
> 
>           * {shard-tglu}: PASS -> FAIL
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * {shard-tglu}: NOTRUN -> SKIP
>      * igt@runner@aborted:
> 
>           * {shard-tglu}: (FAIL, FAIL, FAIL, FAIL) ([i915#3002] / [i915#3690]
>             / [i915#4312]) -> (FAIL, FAIL, FAIL) ([i915#3002] / [i915#4312])
> 
> New tests
> 
>    New tests have been introduced between CI_DRM_11052_full and
>    IGTPW_6540_full:
> 
>   New IGT tests (1)
> 
>      * igt@gem_softpin@safe-alignment:
>           * Statuses : 6 pass(s)
>           * Exec time: [0.01, 0.03] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_6540_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ctx_persistence@engines-persistence:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099])
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#280]) +1 similar issue
>      * igt@gem_exec_balancer@parallel:
> 
>           * shard-iclb: PASS -> SKIP ([i915#4525]) +1 similar issue
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-tglb: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-none-vip@rcs0:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_fair@basic-none@vecs0:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-glk: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace@vcs0:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_exec_fair@basic-pace@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2849])
>      * igt@gem_exec_params@no-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109283])
>      * igt@gem_exec_params@secure-non-root:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#112283])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#112283])
> 
>      * igt@gem_exec_whisper@basic-queues-forked:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118]) +3 similar issues
>      * igt@gem_lmem_swapping@heavy-multi:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613])
>      * igt@gem_lmem_swapping@parallel-multi:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4613])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4613])
> 
>      * igt@gem_mmap_gtt@coherency:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111656])
>      * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270])
> 
>      * igt@gem_workarounds@suspend-resume-fd:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +3 similar issues
>      * igt@gen9_exec_parse@bb-start-far:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2527] / [i915#2856])
> 
>      * igt@i915_pm_dc@dc6-dpms:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#454])
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#454]) +1 similar issue
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#1937])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#1937])
> 
>      * igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614])
> 
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-iclb: PASS -> FAIL ([i915#1888])
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777])
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +102 similar issues
>      * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +2 similar
>             issues
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +4 similar
>             issues
> 
>      * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886])
>      * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +1
>             similar issue
>      * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886])
>      * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +2 similar issues
>      * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +163 similar issues
>      * igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +13 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689]) +3
>             similar issues
> 
>      * igt@kms_chamelium@dp-frame-dump:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +4
>             similar issues
>      * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +12
>             similar issues
>      * igt@kms_chamelium@vga-hpd:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +8
>             similar issues
>      * igt@kms_color@pipe-d-ctm-blue-to-red:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#1149])
>      * igt@kms_color_chamelium@pipe-d-degamma:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +2
>             similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +5
>             similar issues
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +2
>             similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827])
> 
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-apl: NOTRUN -> TIMEOUT ([i915#1319])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1063]) +1 similar issue
> 
>           * shard-kbl: NOTRUN -> TIMEOUT ([i915#1319])
> 
>      * igt@kms_content_protection@mei_interface:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109300] / [fdo#111066]) +1
>             similar issue
>      * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +3
>             similar issues
>      * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
> 
>           * shard-snb: PASS -> SKIP ([fdo#109271])
>      * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279]) +2
>             similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding:
> 
>           * shard-kbl: PASS -> INCOMPLETE ([i915#794])
>      * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +1 similar issue
>      * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +48 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278])
> 
>      * igt@kms_cursor_legacy@pipe-d-forked-move:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +21 similar issues
>      * igt@kms_cursor_legacy@pipe-d-single-bo:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +2 similar
>             issues
>      * igt@kms_dsc@basic-dsc-enable:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3840])
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-apl: NOTRUN -> INCOMPLETE ([i915#180])
> 
>           * shard-kbl: NOTRUN -> INCOMPLETE ([i915#180] / [i915#636])
> 
>      * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109274] / [fdo#111825]) +4
>             similar issues
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +2 similar issues
>      * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL ([i915#2122])
>      * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
> 
>           * shard-tglb: PASS -> FAIL ([i915#79])
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>           * shard-iclb: PASS -> SKIP ([i915#3701]) +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109280] / [fdo#111825]) +13
>             similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +10 similar issues
>      * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180]) +4 similar issues
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +2 similar
>             issues
> 
>           * shard-glk: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
> 
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +2 similar
>             issues
>      * igt@kms_plane_lowres@pipe-b-tiling-x:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3536]) +1 similar issue
>      * igt@kms_plane_lowres@pipe-d-tiling-y:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536]) +1 similar issue
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>      * igt@kms_psr@psr2_no_drrs:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441]) +1 similar issue
>      * igt@kms_psr@psr2_sprite_mmap_cpu:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467]) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109441])
> 
>      * igt@kms_rotation_crc@primary-rotation-90:
> 
>           * shard-glk: PASS -> FAIL ([i915#1888] / [i915#65])
>      * igt@kms_rotation_crc@sprite-rotation-180:
> 
>           * shard-iclb: PASS -> FAIL ([i915#1888] / [i915#65])
>      * igt@kms_sysfs_edid_timing:
> 
>           * shard-apl: NOTRUN -> FAIL ([IGT#2])
> 
>           * shard-kbl: NOTRUN -> FAIL ([IGT#2])
> 
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>      * igt@nouveau_crc@pipe-b-source-rg:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2530])
>      * igt@nouveau_crc@pipe-c-source-outp-complete:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2530]) +1 similar issue
>      * igt@perf@polling-parameterized:
> 
>           * shard-glk: PASS -> FAIL ([i915#1542])
>      * igt@prime_nv_api@i915_nv_import_twice:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109291])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109291])
> 
>     Possible fixes
> 
>      * igt@gem_ctx_persistence@many-contexts:
> 
>           * {shard-tglu}: INCOMPLETE -> PASS
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: FAIL ([i915#232]) -> PASS +1 similar issue
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-iclb: SKIP ([i915#4525]) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-iclb: FAIL ([i915#2846]) -> PASS
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-glk: FAIL ([i915#2842]) -> PASS
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-iclb: FAIL ([i915#454]) -> PASS
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-apl: FAIL ([i915#4275]) -> PASS
>      * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
> 
>           * {shard-tglu}: FAIL ([i915#3825]) -> [PASS][141]
