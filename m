Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3201C10E495
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Dec 2021 13:28:48 +0000 (UTC)
Date: Thu, 30 Dec 2021 14:28:43 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <Yc20C/CpHVGcz+m4@zkempczy-mobl2>
References: <20211230081422.11703-1-zbigniew.kempczynski@intel.com>
 <164085954982.9665.2833697284535640590@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164085954982.9665.2833697284535640590@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHN0?=
 =?utf-8?q?art_offset_and_alignment_detection_=28rev3=29?=
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
Cc: yedireswarapux.sai.nandan@intel.com, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Dec 30, 2021 at 10:19:09AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add start offset and alignment detection (rev3)                
>    URL:     https://patchwork.freedesktop.org/series/98402/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/index.html 
> 
>          CI Bug Log - changes from CI_DRM_11040_full -> IGTPW_6525_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6525_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6525_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/index.html
> 
> Participating hosts (19 -> 7)
> 
>    ERROR: It appears as if the changes made in IGTPW_6525_full prevented too
>    many machines from booting.
> 
>    Missing (12): shard-tglu-7 shard-tglu-6 shard-tglu-8 shard-tglu-1
>    pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 shard-tglu-3
>    shard-tglu-4 shard-tglu-2
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6525_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_eio@kms:
> 
>           * shard-tglb: PASS -> FAIL
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>           * shard-glk: PASS -> FAIL +1 similar issue

Change is unrelated to tests above.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_11040_full and
>    IGTPW_6525_full:
> 
>   New IGT tests (1)
> 
>      * igt@gem_softpin@safe-alignment:
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00, 0.01] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_6525_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ctx_persistence@legacy-engines-mixed-process:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +1 similar
>             issue
>      * igt@gem_exec_balancer@parallel-contexts:
> 
>           * shard-iclb: PASS -> SKIP ([i915#4525]) +1 similar issue
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2846])
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-none@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-tglb: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2851])
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-glk: PASS -> FAIL ([i915#2842]) +1 similar issue
>      * igt@gem_lmem_swapping@basic:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613])
>      * igt@gem_lmem_swapping@verify-random:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613])
>      * igt@gem_pxp@create-regular-context-2:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270])
> 
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3297])
> 
>      * igt@gen9_exec_parse@allowed-all:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#1436] / [i915#716])
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#404])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#404])
> 
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723])
> 
>      * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +1 similar
>             issue
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886])
> 
>      * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +2 similar
>             issues
>      * igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689])
>      * igt@kms_chamelium@dp-frame-dump:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +5
>             similar issues
>      * igt@kms_chamelium@hdmi-hpd-after-suspend:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827])
> 
>      * igt@kms_color_chamelium@pipe-d-ctm-0-5:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +1
>             similar issue
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +1
>             similar issue
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +1
>             similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827])
> 
>      * igt@kms_content_protection@legacy:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109300] / [fdo#111066])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +34 similar issues
> 
>           * shard-kbl: NOTRUN -> TIMEOUT ([i915#1319]) +1 similar issue
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111828])
> 
>      * igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +2
>             similar issues
>      * igt@kms_cursor_crc@pipe-c-cursor-512x512-offscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279]) +2
>             similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-max-size-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +1 similar issue
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278])
>      * igt@kms_cursor_legacy@pipe-d-single-move:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +6 similar issues
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-kbl: PASS -> INCOMPLETE ([i915#180] / [i915#636])
>      * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL ([i915#79])
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111825]) +12 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +2 similar issues
> 
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +7 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +66 similar issues
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +125 similar issues
>      * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +36 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289])
> 
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
>      * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180]) +2 similar issues
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#265])
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +1 similar
>             issue
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +1 similar
>             issue
> 
>      * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
> 
>           * shard-glk: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
>      * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2733])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2733])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2733])
> 
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#111068] / [i915#658])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +1 similar
>             issue
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2920])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>      * igt@kms_psr@psr2_cursor_mmap_cpu:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441]) +3 similar issues
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
>      * igt@nouveau_crc@pipe-d-source-outp-complete:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#2530])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2530])
> 
>      * igt@prime_nv_pcopy@test2:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109291])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109291])
> 
>      * igt@sysfs_clients@busy:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2994]) +1 similar issue
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +1 similar
>             issue
> 
>      * igt@sysfs_clients@fair-0:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2994])
> 
>      * igt@sysfs_clients@pidname:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +1 similar
>             issue
> 
>     Possible fixes
> 
>      * igt@gem_ctx_persistence@smoketest:
> 
>           * shard-kbl: FAIL ([i915#2896]) -> PASS
>      * igt@gem_eio@in-flight-suspend:
> 
>           * shard-kbl: DMESG-WARN ([i915#180]) -> PASS +2 similar issues
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-iclb: SKIP ([i915#4525]) -> PASS
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-glk: FAIL ([i915#2842]) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-none@vecs0:
> 
>           * shard-kbl: FAIL ([i915#2842]) -> PASS +1 similar issue
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-iclb: SKIP ([i915#4281]) -> PASS
>      * igt@i915_selftest@live@requests:
> 
>           * shard-tglb: DMESG-FAIL -> PASS
>      * igt@kms_big_fb@linear-32bpp-rotate-180:
> 
>           * shard-glk: DMESG-WARN ([i915#118]) -> PASS +2 similar issues
>      * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> 
>           * shard-glk: FAIL ([i915#72]) -> PASS
>      * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: FAIL ([i915#2122]) -> PASS
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
> 
>           * shard-iclb: SKIP ([i915#3701]) -> PASS +2 similar issues
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>           * shard-glk: FAIL ([i915#1888]) -> PASS
>      * igt@kms_psr@psr2_primary_mmap_cpu:
> 
>           * shard-iclb: SKIP ([fdo#109441]) -> PASS +1 similar issue
> 
>     Warnings
> 
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: TIMEOUT ([i915#3063] / [i915#3648]) -> FAIL
>             ([i915#232])
>      * igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-iclb: SKIP ([i915#658]) -> SKIP ([i915#588])
>      * igt@i915_pm_rc6_residency@rc6-fence:
> 
>           * shard-iclb: WARN ([i915#1804] / [i915#2684]) -> WARN
>             ([i915#2684])
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-iclb: SKIP ([fdo#111068] / [i915#658]) -> FAIL
>             ([i915#4148])
>      * igt@runner@aborted:
> 
>           * shard-kbl: (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL) ([i915#1436] /
>             [i915#180] / [i915#1814] / [i915#3002] / [i915#4312] /
>             [i915#602]) -> (FAIL, FAIL, FAIL, FAIL) ([i915#180] / [i915#3002]
>             / [i915#4312] / [i915#92])
> 
>           * shard-apl: (FAIL, FAIL, FAIL) ([fdo#109271] / [i915#1814] /
>             [i915#3002] / [i915#4312]) -> (FAIL, FAIL, FAIL, FAIL, FAIL,
>             FAIL, FAIL) ([fdo#109271] / [i915#180] / [i915#1814] /
>             [i915#3002] / [i915#4312])
