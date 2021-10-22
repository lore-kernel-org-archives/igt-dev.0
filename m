Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978806E536
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Oct 2021 04:08:34 +0000 (UTC)
Date: Fri, 22 Oct 2021 06:08:03 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211022040803.GA5806@zkempczy-mobl2>
References: <20211021114400.28238-1-zbigniew.kempczynski@intel.com>
 <163482842836.20173.14431409367389194616@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163482842836.20173.14431409367389194616@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Fawait=3A_Adopt_to_no-reloc_mode?=
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

On Thu, Oct 21, 2021 at 03:00:28PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/gem_exec_await: Adopt to no-reloc mode                   
>    URL:     https://patchwork.freedesktop.org/series/96118/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6342/index.html 
> 
>          CI Bug Log - changes from CI_DRM_10769_full -> IGTPW_6342_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6342_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6342_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6342/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6342_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_ctx_shared@q-smoketest-all:
> 
>           * shard-tglb: PASS -> INCOMPLETE
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
> 
>           * shard-kbl: PASS -> INCOMPLETE

Change is in gem_exec_await so there's unrelated to above.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_6342_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_create@create-massive:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#3002])
>      * igt@gem_ctx_isolation@preservation-s3@vecs0:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@gem_ctx_persistence@legacy-engines-mixed:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +6 similar
>             issues
>      * igt@gem_ctx_persistence@many-contexts:
> 
>           * shard-tglb: PASS -> FAIL ([i915#2410])
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: PASS -> TIMEOUT ([i915#2369] / [i915#3063] /
>             [i915#3648])
> 
>           * shard-snb: NOTRUN -> FAIL ([i915#3354])
> 
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace@bcs0:
> 
>           * shard-tglb: PASS -> FAIL ([i915#2842]) +2 similar issues
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2842])
> 
>           * shard-iclb: PASS -> FAIL ([i915#2849])
> 
>      * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109313])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109313])
> 
>      * igt@gem_exec_params@no-bsd:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109283]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109283])
> 
>      * igt@gem_exec_suspend@basic-s3:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +2 similar issues
>      * igt@gem_pxp@create-protected-buffer:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270])
>      * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270]) +2 similar issues
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3323])
>      * igt@gem_userptr_blits@dmabuf-unsync:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297]) +3 similar issues
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#3318])
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#3318])
> 
>      * igt@gen7_exec_parse@basic-offset:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +241 similar issues
>      * igt@gen7_exec_parse@oacontrol-tracking:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289]) +1 similar issue
>      * igt@gen9_exec_parse@bb-start-cmd:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2856]) +3 similar issues
>      * igt@gen9_exec_parse@shadow-peek:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856])
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-apl: PASS -> SKIP ([fdo#109271])
>      * igt@i915_pm_rpm@dpms-non-lpsp:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111644] / [i915#1397] /
>             [i915#2411]) +1 similar issue
>      * igt@i915_query@query-topology-known-pci-ids:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109303])
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#404])
>      * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118]) +1 similar issue
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614]) +2 similar issues
> 
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +2 similar
>             issues
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777])
> 
>      * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +3 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +1
>             similar issue
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886])
> 
>      * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +2 similar issues
>      * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +8 similar
>             issues
>      * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +9 similar
>             issues
>      * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +12 similar issues
>      * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +145 similar issues
>      * igt@kms_chamelium@hdmi-edid-change-during-suspend:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +19
>             similar issues
>      * igt@kms_chamelium@hdmi-mode-timings:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +18
>             similar issues
>      * igt@kms_chamelium@vga-hpd-after-suspend:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827])
>      * igt@kms_color_chamelium@pipe-b-ctm-0-75:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +11
>             similar issues
>      * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +7
>             similar issues
>      * igt@kms_content_protection@legacy:
> 
>           * shard-apl: NOTRUN -> TIMEOUT ([i915#1319])
>      * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319]) +3 similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-suspend:
> 
>           * shard-tglb: PASS -> INCOMPLETE ([i915#456])
>      * igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +4 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +2
>             similar issues
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278])
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +456 similar issues
> 
>           * shard-iclb: PASS -> SKIP ([i915#3701])
> 
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +7 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111825]) +43 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
> 
>           * shard-tglb: PASS -> INCOMPLETE ([i915#2411] / [i915#456])
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +32 similar issues
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1839])
>      * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
> 
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#180])
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +3 similar
>             issues
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#265])
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#265])
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +2 similar
>             issues
>      * igt@kms_plane_lowres@pipe-a-tiling-y:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3536])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536])
> 
>      * igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#112054])
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +2 similar
>             issues
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +4 similar
>             issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2920])
> 
>      * igt@kms_psr@psr2_dpms:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467]) +1 similar
>             issue
>      * igt@kms_psr@psr2_primary_mmap_cpu:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441]) +3 similar issues
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +6 similar issues
>      * igt@nouveau_crc@pipe-b-source-outp-complete:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2530]) +2 similar issues
>      * igt@prime_nv_api@nv_i915_import_twice_check_flink_name:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109291]) +3 similar issues
>      * igt@prime_nv_test@i915_import_cpu_mmap:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109291])
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109295])
>      * igt@sysfs_clients@create:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2994])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +4 similar
>             issues
> 
>      * igt@sysfs_clients@pidname:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +1 similar
>             issue
> 
>     Possible fixes
> 
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-kbl: FAIL ([i915#2846]) -> PASS
>      * igt@gem_exec_fair@basic-none@rcs0:
> 
>           * shard-iclb: FAIL ([i915#2842]) -> PASS
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-tglb: FAIL ([i915#2842]) -> PASS
>      * igt@gem_exec_fair@basic-pace@vcs0:
> 
>           * shard-kbl: FAIL ([i915#2842]) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-glk: FAIL ([i915#2842]) -> PASS +2 similar issues
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-iclb: FAIL ([i915#454]) -> PASS
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
> 
>           * shard-tglb: INCOMPLETE ([i915#456]) -> PASS +1 similar issue
>      * igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>           * shard-apl: DMESG-WARN ([i915#180]) -> PASS
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
> 
>           * shard-iclb: SKIP ([i915#3701]) -> PASS
>      * igt@kms_frontbuffer_tracking@psr-suspend:
> 
>           * shard-tglb: INCOMPLETE ([i915#2411] / [i915#456]) -> PASS
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-kbl: DMESG-WARN ([i915#180]) -> PASS +2 similar issues
> 
>           * shard-tglb: INCOMPLETE ([i915#1373] / [i915#2828]) -> PASS
> 
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
> 
>           * shard-tglb: INCOMPLETE ([i915#2828] / [i915#456]) -> PASS
>      * igt@kms_psr@psr2_cursor_mmap_cpu:
> 
>           * shard-iclb: SKIP ([fdo#109441]) -> PASS +2 similar issues
> 
>     Warnings
> 
>      * igt@i915_pm_rc6_residency@rc6-fence:
> 
>           * shard-iclb: WARN ([i915#2684]) -> WARN ([i915#1804] /
>             [i915#2684])
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
> 
>           * shard-iclb: SKIP ([i915#2920]) -> SKIP ([i915#658]) +2 similar
>             issues
>      * igt@runner@aborted:
> 
>           * shard-kbl: (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL)
>             ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002] /
>             [i915#3363] / [i915#4312]) -> (FAIL, [FAIL][141], [FAIL][142],
>             [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147])
>             ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002] /
>             [i915#3363] / [i915#4312] / [i915#602])
