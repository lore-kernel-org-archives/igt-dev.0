Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4956B6E057
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Nov 2021 11:56:08 +0000 (UTC)
Date: Tue, 23 Nov 2021 12:56:04 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211123115604.GA3625@zkempczy-mobl2>
References: <20211123091203.6076-1-zbigniew.kempczynski@intel.com>
 <163766617823.2117.17474732279513534707@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163766617823.2117.17474732279513534707@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?api=5Fintel=5Fbb=3A_Use_alignment_only_when_kernel_support_it?=
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

On Tue, Nov 23, 2021 at 11:16:18AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/api_intel_bb: Use alignment only when kernel support it  
>    URL:     https://patchwork.freedesktop.org/series/97197/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/index.html 
> 
>          CI Bug Log - changes from CI_DRM_10917_full -> IGTPW_6424_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6424_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6424_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6424/index.html
> 
> Participating hosts (10 -> 7)
> 
>    Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6424_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge:
>           * shard-kbl: PASS -> INCOMPLETE

Unrelated, patch touches api_intel_bb test only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_6424_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ctx_persistence@process:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +1 similar
>             issue
>      * igt@gem_ctx_shared@q-in-order:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +109 similar issues
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4525])
>      * igt@gem_exec_fair@basic-none@rcs0:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842]) +2 similar issues
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-tglb: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2849])
>      * igt@gem_exec_params@no-vebox:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109283])
>      * igt@gem_lmem_swapping@random:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4555] / [i915#4565]) +1 similar
>             issue
>      * igt@gem_lmem_swapping@smem-oom:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4555]) +1 similar issue
>      * igt@gem_pread@exhaustion:
> 
>           * shard-apl: NOTRUN -> WARN ([i915#2658])
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-kbl: NOTRUN -> WARN ([i915#2658])
>      * igt@gem_pxp@display-protected-crc:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270]) +2 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270])
> 
>      * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768]) +1 similar issue
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-apl: PASS -> SKIP ([fdo#109271])
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#4275])
> 
>      * igt@i915_pm_rpm@dpms-non-lpsp:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111644] / [i915#1397] /
>             [i915#2411])
>      * igt@i915_pm_rpm@pc8-residency:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109506] / [i915#2411])
>      * igt@i915_suspend@forcewake:
> 
>           * shard-tglb: PASS -> INCOMPLETE ([i915#2411] / [i915#456])
>      * igt@i915_suspend@sysfs-reader:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#404])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#404])
> 
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614])
> 
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +1 similar
>             issue
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777])
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> 
>           * shard-glk: PASS -> DMESG-WARN ([i915#118])
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +4 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723]) +2 similar issues
>      * igt@kms_ccs@pipe-a-bad-rotation-90-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689])
>      * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +4 similar
>             issues
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +2 similar
>             issues
> 
>      * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +10
>             similar issues
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +2 similar
>             issues
> 
>      * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +7 similar issues
>      * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +3
>             similar issues
>      * igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +23 similar issues
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +96 similar issues
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3742])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3742])
> 
>      * igt@kms_chamelium@dp-hpd-with-enabled-mode:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +4
>             similar issues
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +5
>             similar issues
> 
>      * igt@kms_chamelium@hdmi-hpd-storm:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +10
>             similar issues
>      * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +4
>             similar issues
>      * igt@kms_color_chamelium@pipe-c-ctm-green-to-red:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +4
>             similar issues
>      * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +6
>             similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827])
> 
>      * igt@kms_content_protection@legacy:
> 
>           * shard-kbl: NOTRUN -> TIMEOUT ([i915#1319])
>      * igt@kms_content_protection@uevent:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#2105])
>      * igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +2
>             similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279]) +3
>             similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-suspend:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180])
>      * igt@kms_cursor_crc@pipe-c-cursor-max-size-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +7 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-suspend:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +185 similar issues
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278]) +2
>             similar issues
>      * igt@kms_flip@2x-absolute-wf_vblank:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111825] / [i915#3966])
>      * igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +1 similar issue
>      * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
> 
>           * shard-glk: PASS -> FAIL ([i915#79])
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
> 
>           * shard-iclb: PASS -> SKIP ([i915#3701]) +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111825]) +25 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>           * shard-tglb: PASS -> INCOMPLETE ([i915#2828] / [i915#456])
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +12 similar issues
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +58 similar issues
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1187])
>      * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289])
> 
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#533])
> 
>      * igt@kms_pipe_crc_basic@read-crc-pipe-d:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +1 similar
>             issue
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +5 similar issues
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>           * shard-apl: NOTRUN -> FAIL ([i915#265])
>      * igt@kms_plane_cursor@pipe-b-viewport-size-256:
> 
>           * shard-kbl: PASS -> INCOMPLETE ([i915#794])
>      * igt@kms_plane_lowres@pipe-c-tiling-none:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536])
>      * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [fdo#112054])
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +2 similar
>             issues
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#658])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2920])
> 
>      * igt@kms_psr2_su@frontbuffer:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1911])
>      * igt@kms_psr@psr2_cursor_blt:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441])
>      * igt@kms_psr@psr2_no_drrs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109441]) +3 similar issues
>      * igt@kms_psr@psr2_primary_render:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467]) +2 similar
>             issues
>      * igt@kms_psr@suspend:
> 
>           * shard-tglb: PASS -> INCOMPLETE ([i915#456])
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2437])
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2437]) +1 similar issue
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2437])
> 
>      * igt@nouveau_crc@pipe-b-ctx-flip-detection:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2530]) +1 similar issue
>      * igt@nouveau_crc@pipe-b-source-rg:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2530]) +1 similar issue
>      * igt@perf@polling-parameterized:
> 
>           * shard-glk: PASS -> FAIL ([i915#1542])
>      * igt@prime_nv_pcopy@test1_micro:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109291])
>      * igt@prime_nv_pcopy@test3_2:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109291]) +2 similar issues
>      * igt@sysfs_clients@recycle:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2994])
>      * igt@sysfs_clients@sema-10:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +3 similar
>             issues
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2994])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2994])
> 
>     Possible fixes
> 
>      * igt@feature_discovery@psr2:
> 
>           * shard-iclb: SKIP ([i915#658]) -> PASS
>      * igt@gem_exec_capture@pi@vcs0:
> 
>           * shard-iclb: INCOMPLETE ([i915#2369] / [i915#3371]) -> PASS
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-iclb: FAIL ([i915#2842]) -> PASS +1 similar issue
> 
>           * shard-tglb: FAIL ([i915#2842]) -> PASS
> 
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-tglb: FAIL ([i915#2851]) -> PASS
>      * igt@gem_exec_suspend@basic-s3:
> 
>           * shard-tglb: INCOMPLETE ([i915#456]) -> PASS
>      * igt@i915_module_load@reload-no-display:
> 
>           * shard-tglb: DMESG-WARN ([i915#2867]) -> PASS
>      * igt@i915_suspend@fence-restore-tiled2untiled:
> 
>           * shard-apl: DMESG-WARN ([i915#180]) -> PASS
>      * igt@kms_big_fb@linear-32bpp-rotate-180:
> 
>           * shard-glk: DMESG-WARN ([i915#118]) -> PASS +3 similar issues
