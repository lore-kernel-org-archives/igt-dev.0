Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFB26EA8C
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Nov 2021 04:17:01 +0000 (UTC)
Date: Fri, 19 Nov 2021 05:16:57 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211119041657.GB3698@zkempczy-mobl2>
References: <20211118111652.10584-1-kamil.konieczny@linux.intel.com>
 <163726957729.10082.1698418680877344922@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163726957729.10082.1698418680877344922@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv4=2C1/1=5D_tests/gem=5Fblits=3A_Add_?=
 =?utf-8?q?no-reloc_capability?=
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

On Thu, Nov 18, 2021 at 09:06:17PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  series starting with [i-g-t,v4,1/1] tests/gem_blits: Add no-reloc 
>             capability                                                        
>    URL:     https://patchwork.freedesktop.org/series/97073/                   
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6414/index.html    
> 
>          CI Bug Log - changes from CI_DRM_10899_full -> IGTPW_6414_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6414_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6414_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6414/index.html
> 
> Participating hosts (11 -> 7)
> 
>    Missing (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6414_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_flip@flip-vs-suspend@c-dp1:
>           * shard-apl: PASS -> INCOMPLETE

Unrelated, change touches gem_blits only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_6414_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#180])
>      * igt@gem_ctx_persistence@process:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +1 similar
>             issue
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_exec_balancer@parallel-contexts:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4525])
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-kbl: PASS -> SKIP ([fdo#109271])
> 
>           * shard-tglb: PASS -> FAIL ([i915#2842]) +1 similar issue
> 
>      * igt@gem_exec_fair@basic-none@vcs1:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-glk: PASS -> FAIL ([i915#2842]) +4 similar issues
>      * igt@gem_exec_params@no-bsd:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109283])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109283])
> 
>      * igt@gem_exec_whisper@basic-contexts-priority-all:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118])
>      * igt@gem_lmem_swapping@parallel-random:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4555])
>      * igt@gem_media_vme:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#284])
>      * igt@gem_ppgtt@flink-and-close-vma-leak:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#644])
>      * igt@gem_pread@exhaustion:
> 
>           * shard-apl: NOTRUN -> WARN ([i915#2658])
> 
>           * shard-snb: NOTRUN -> WARN ([i915#2658])
> 
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-kbl: NOTRUN -> WARN ([i915#2658])
> 
>           * shard-tglb: NOTRUN -> WARN ([i915#2658])
> 
>      * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270])
>      * igt@gem_render_copy@linear-to-vebox-y-tiled:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +108 similar issues
>      * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768])
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297]) +2 similar issues
>      * igt@gen7_exec_parse@basic-allowed:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289]) +2 similar issues
>      * igt@gen9_exec_parse@bb-secure:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2856]) +3 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856])
> 
>      * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109506] / [i915#2411]) +1
>             similar issue
>      * igt@i915_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111644] / [i915#1397] /
>             [i915#2411])
>      * igt@kms_big_fb@linear-8bpp-rotate-90:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614]) +1 similar issue
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3777])
>      * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +2 similar
>             issues
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +2 similar
>             issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +2 similar issues
>      * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +7 similar
>             issues
>      * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +2 similar
>             issues
>      * igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689]) +2
>             similar issues
>      * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886])
> 
>      * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +2 similar
>             issues
>      * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +4 similar issues
>      * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +89 similar issues
>      * igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +1 similar issue
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3742])
>      * igt@kms_chamelium@dp-edid-change-during-suspend:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +8
>             similar issues
>      * igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +6
>             similar issues
>      * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +1
>             similar issue
>      * igt@kms_color_chamelium@pipe-b-ctm-0-5:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +7
>             similar issues
>      * igt@kms_color_chamelium@pipe-c-ctm-green-to-red:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +5
>             similar issues
>      * igt@kms_color_chamelium@pipe-d-degamma:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +2
>             similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827])
> 
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3116])
>      * igt@kms_content_protection@type1:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111828])
>      * igt@kms_content_protection@uevent:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#2105])
>      * igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359])
>      * igt@kms_cursor_crc@pipe-b-cursor-max-size-onscreen:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +12 similar issues
>      * igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319]) +2 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +2
>             similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-suspend:
> 
>           * shard-tglb: PASS -> INCOMPLETE ([i915#4211])
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4103])
>      * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118] / [i915#1888] /
>             [i915#533])
>      * igt@kms_dp_tiled_display@basic-test-pattern:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#426])
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-apl: PASS -> INCOMPLETE ([i915#180] / [i915#1982])
> 
>           * shard-tglb: PASS -> INCOMPLETE ([i915#2411] / [i915#456])
> 
>           * shard-kbl: PASS -> INCOMPLETE ([i915#180] / [i915#636])
> 
>      * igt@kms_flip@2x-flip-vs-panning:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +1 similar issue
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +4 similar issues
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:
> 
>           * shard-snb: PASS -> SKIP ([fdo#109271]) +2 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
> 
>           * shard-iclb: PASS -> SKIP ([i915#3701])
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
> 
>           * shard-glk: PASS -> FAIL ([i915#2546])
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111825]) +26 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +70 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +2 similar issues
>      * igt@kms_hdr@static-swap:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1187])
>      * igt@kms_invalid_mode@clock-too-high:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4278])
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
>      * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
>      * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +1 similar
>             issue
>      * igt@kms_plane_lowres@pipe-a-tiling-yf:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3536])
>      * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [fdo#112054]) +1
>             similar issue
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +3 similar
>             issues
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +3 similar
>             issues
> 
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2920]) +2 similar issues
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#658])
> 
>      * igt@kms_psr2_su@frontbuffer:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109642] / [fdo#111068] /
>             [i915#658])
>      * igt@kms_psr@psr2_cursor_mmap_gtt:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467])
>      * igt@kms_psr@psr2_dpms:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441]) +1 similar issue
>      * igt@kms_vblank@pipe-a-ts-continuation-suspend:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180] / [i915#295])
>      * igt@kms_vblank@pipe-b-ts-continuation-suspend:
> 
>           * shard-kbl: PASS -> INCOMPLETE ([i915#2828])
>      * igt@kms_vblank@pipe-c-ts-continuation-suspend:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180]) +2 similar issues
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109502])
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
>      * igt@nouveau_crc@pipe-c-source-outp-complete:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2530]) +1 similar issue
>      * igt@perf_pmu@rc6-suspend:
> 
>           * shard-tglb: PASS -> INCOMPLETE ([i915#456])
>      * igt@sysfs_clients@fair-0:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994])
>      * igt@sysfs_clients@sema-50:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2994])
> 
>     Possible fixes
> 
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-tglb: TIMEOUT ([i915#2369] / [i915#3063] / [i915#3648]) ->
>             PASS
> 
>           * shard-iclb: TIMEOUT ([i915#2369] / [i915#2481] / [i915#3070]) ->
>             PASS
> 
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-kbl: FAIL ([i915#2846]) -> PASS
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: FAIL ([i915#2842]) -> PASS
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-tglb: FAIL ([i915#2842]) -> PASS
>      * igt@gem_exec_fair@basic-pace@vcs0:
> 
>           * shard-kbl: SKIP ([fdo#109271]) -> PASS
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglb: SKIP ([i915#2190]) -> PASS
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-iclb: FAIL ([i915#454]) -> PASS
>      * igt@i915_pm_rpm@system-suspend:
> 
>           * shard-kbl: INCOMPLETE ([i915#151]) -> PASS
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
> 
>           * shard-glk: DMESG-WARN ([i915#118]) -> [PASS][138]
