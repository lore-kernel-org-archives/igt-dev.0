Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D8873CD9
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Dec 2021 10:07:47 +0000 (UTC)
Date: Fri, 3 Dec 2021 11:07:42 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211203100742.GA22589@zkempczy-mobl2>
References: <20211203064049.9953-1-zbigniew.kempczynski@intel.com>
 <163852587855.5407.13088685470415686225@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163852587855.5407.13088685470415686225@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSXNvbGF0?=
 =?utf-8?q?e_wait_bb_within_gem=5Fexec=5Ffence_=28rev2=29?=
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

On Fri, Dec 03, 2021 at 10:04:38AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Isolate wait bb within gem_exec_fence (rev2)                   
>    URL:     https://patchwork.freedesktop.org/series/97521/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6463/index.html 
> 
>          CI Bug Log - changes from CI_DRM_10958_full -> IGTPW_6463_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6463_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6463_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6463/index.html
> 
> Participating hosts (10 -> 7)
> 
>    Missing (3): pig-skl-6260u pig-glk-j5005 shard-rkl
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6463_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_frontbuffer_tracking@fbc-suspend:
>           * shard-snb: PASS -> INCOMPLETE

Change was in gem_exec_fence so this incomplete is unrelated.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_6463_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ctx_param@set-priority-not-supported:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109314])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109314])
> 
>      * igt@gem_ctx_persistence@engines-mixed-process:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099])
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +50 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4525])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4525])
> 
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2842])
> 
>           * shard-apl: PASS -> SKIP ([fdo#109271])
> 
>      * igt@gem_exec_fair@basic-none-vip@rcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2842])
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842])
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#2842])
> 
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-pace@rcs0:
> 
>           * shard-kbl: PASS -> FAIL ([i915#2842])
> 
>           * shard-tglb: PASS -> FAIL ([i915#2842])
> 
>      * igt@gem_exec_fair@basic-pace@vecs0:
> 
>           * shard-kbl: PASS -> SKIP ([fdo#109271])
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-iclb: PASS -> FAIL ([i915#2849])
>      * igt@gem_exec_params@secure-non-master:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#112283])
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#112283])
> 
>      * igt@gem_exec_schedule@u-semaphore-user:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +148 similar issues
>      * igt@gem_lmem_swapping@heavy-multi:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +1 similar
>             issue
>      * igt@gem_lmem_swapping@heavy-random:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4613])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4613])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +1 similar
>             issue
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#4613])
> 
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4270])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270])
> 
>      * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#768]) +1 similar issue
>      * igt@gem_softpin@evict-snoop:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109312])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109312])
> 
>      * igt@gem_userptr_blits@input-checking:
> 
>           * shard-tglb: NOTRUN -> DMESG-WARN ([i915#3002])
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#3002])
> 
>           * shard-iclb: NOTRUN -> DMESG-WARN ([i915#3002])
> 
>      * igt@gen9_exec_parse@bb-large:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2856])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856])
> 
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-iclb: PASS -> FAIL ([i915#454])
>      * igt@i915_pm_lpsp@screens-disabled:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1902])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1902])
> 
>      * igt@i915_pm_rc6_residency@media-rc6-accuracy:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289] / [fdo#111719])
>      * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109293] / [fdo#109506])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109506] / [i915#2411])
> 
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777])
>      * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +2 similar
>             issues
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723]) +1 similar issue
>      * igt@kms_big_fb@yf-tiled-addfb:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +5 similar issues
>      * igt@kms_big_joiner@invalid-modeset:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2705])
>      * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689]) +1
>             similar issue
>      * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +7 similar
>             issues
>      * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +1
>             similar issue
>      * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +4 similar
>             issues
>      * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886])
> 
>      * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +5 similar issues
>      * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +116 similar issues
>      * igt@kms_chamelium@dp-frame-dump:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +5
>             similar issues
>      * igt@kms_chamelium@hdmi-mode-timings:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +7
>             similar issues
>      * igt@kms_color_chamelium@pipe-a-ctm-0-5:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +13
>             similar issues
>      * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +7
>             similar issues
>      * igt@kms_color_chamelium@pipe-d-degamma:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +4
>             similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +7
>             similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109284] /
>             [fdo#111827])
> 
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3116])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3116])
> 
>      * igt@kms_content_protection@srm:
> 
>           * shard-apl: NOTRUN -> TIMEOUT ([i915#1319])
>      * igt@kms_content_protection@type1:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109300] / [fdo#111066])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111828])
> 
>      * igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359])
> 
>      * igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +2 similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319]) +2 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +15 similar issues
>      * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278]) +1
>             similar issue
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +1 similar issue
>      * igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111825]) +19 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +9 similar issues
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#180]) +4 similar issues
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1839])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#1839])
> 
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#180])
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +2 similar
>             issues
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
> 
>           * shard-glk: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
> 
>      * igt@kms_plane_lowres@pipe-b-tiling-y:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3536])
> 
>      * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2733])
>      * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +3 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +1 similar
>             issue
> 
>      * igt@kms_psr2_sf@plane-move-sf-dmg-area-1:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2920]) +3 similar issues
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#658]) +3 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#658]) +2 similar issues
> 
>      * igt@kms_psr@psr2_cursor_blt:
> 
>           * shard-iclb: PASS -> SKIP ([fdo#109441]) +2 similar issues
>      * igt@kms_psr@psr2_sprite_plane_onoff:
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#132] / [i915#3467]) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109441])
> 
>      * igt@kms_setmode@basic:
> 
>           * shard-glk: PASS -> FAIL ([i915#31])
>      * igt@kms_vblank@pipe-d-wait-forked-hang:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +146 similar issues
>      * igt@kms_vblank@pipe-d-wait-idle:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +1 similar
>             issue
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109502])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109502])
> 
>      * igt@nouveau_crc@pipe-b-source-outp-inactive:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2530])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2530])
> 
>      * igt@perf@gen12-oa-tlb-invalidate:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289]) +1 similar issue
>      * igt@prime_nv_test@nv_write_i915_cpu_mmap_read:
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
>      * igt@sysfs_clients@busy:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +1 similar
>             issue
>      * igt@sysfs_clients@fair-3:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2994]) +1 similar
>             issue
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2994])
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2994])
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#2994])
> 
>     Possible fixes
> 
>      * igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>           * shard-kbl: INCOMPLETE ([i915#794]) -> PASS
>      * igt@gem_eio@in-flight-contexts-10ms:
> 
>           * shard-snb: FAIL ([i915#4409]) -> PASS
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-tglb: FAIL ([i915#2842]) -> PASS +1 similar issue
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-glk: FAIL ([i915#2842]) -> PASS +1 similar issue
>      * igt@gem_workarounds@suspend-resume-context:
> 
>           * shard-apl: DMESG-WARN ([i915#180]) -> PASS +1 similar issue
>      * igt@i915_selftest@live@hangcheck:
> 
>           * shard-snb: INCOMPLETE ([i915#3921]) -> PASS
>      * igt@kms_big_fb@linear-32bpp-rotate-180:
> 
>           * shard-glk: DMESG-WARN ([i915#118]) -> [PASS][138] +2 similar
>             issues
