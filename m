Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F8110F777
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Apr 2022 05:36:18 +0000 (UTC)
Date: Mon, 4 Apr 2022 07:36:12 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YkqDzJfRIW5nNZox@zkempczy-mobl2>
References: <20220403090708.24030-1-zbigniew.kempczynski@intel.com>
 <164898440548.31853.2354794124247924647@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164898440548.31853.2354794124247924647@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fgttfill=3A__Reenable_test_for_discrete_=28rev?=
 =?utf-8?q?2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Sun, Apr 03, 2022 at 11:13:25AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/i915/gem_exec_gttfill: Reenable test for discrete (rev2) 
>    URL:     https://patchwork.freedesktop.org/series/102066/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6864/index.html 
> 
>          CI Bug Log - changes from CI_DRM_11441_full -> IGTPW_6864_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6864_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6864_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6864/index.html
> 
> Participating hosts (11 -> 9)
> 
>    Additional (2): shard-rkl shard-dg1
>    Missing (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_6864_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@fbdev@unaligned-read:
> 
>           * shard-apl: PASS -> FAIL
>      * igt@gem_create@busy-create:
> 
>           * shard-kbl: PASS -> INCOMPLETE
>      * igt@gem_linear_blits@normal:
> 
>           * shard-tglb: PASS -> INCOMPLETE
>      * igt@kms_flip@flip-vs-suspend@a-vga1:
> 
>           * shard-snb: NOTRUN -> DMESG-WARN

Unreleted, change was only in gem_exec_gttfill test.

--
Zbigniew


> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@gem_exec_schedule@smoketest@vecs0:
> 
>           * {shard-rkl}: NOTRUN -> DMESG-WARN
>      * igt@gem_linear_blits@normal:
> 
>           * {shard-dg1}: NOTRUN -> TIMEOUT
> 
> Known issues
> 
>    Here are the changes found in IGTPW_6864_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@feature_discovery@display-2x:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1839])
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#5325])
>      * igt@gem_ctx_persistence@legacy-engines-mixed:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [i915#1099]) +1 similar
>             issue
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#280]) +2 similar issues
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-iclb: PASS -> SKIP ([i915#4525])
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#5076])
>      * igt@gem_exec_fair@basic-deadline:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#2846])
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-tglb: PASS -> FAIL ([i915#2842])
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#2842])
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#2842])
> 
>           * shard-iclb: NOTRUN -> FAIL ([i915#2842])
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#2842])
> 
>      * igt@gem_exec_params@secure-non-master:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#112283])
>      * igt@gem_exec_suspend@basic-s3@smem:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#180]) +1 similar issue
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#2190])
>      * igt@gem_lmem_swapping@heavy-verify-random:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +1 similar
>             issue
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4613]) +1 similar issue
> 
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#4613]) +1 similar
>             issue
>      * igt@gem_media_vme:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#284])
>      * igt@gem_mmap_gtt@coherency:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111656])
>      * igt@gem_pread@exhaustion:
> 
>           * shard-tglb: NOTRUN -> WARN ([i915#2658])
> 
>           * shard-kbl: NOTRUN -> WARN ([i915#2658])
> 
>      * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4270]) +4 similar issues
>      * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271]) +357 similar issues
>      * igt@gem_softpin@noreloc-s3:
> 
>           * shard-apl: NOTRUN -> DMESG-WARN ([i915#180])
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3297]) +2 similar issues
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3323])
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3323])
> 
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#3318])
> 
>           * shard-tglb: NOTRUN -> FAIL ([i915#3318])
> 
>      * igt@gen3_mixed_blits:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109289]) +1 similar issue
>      * igt@gen7_exec_parse@basic-allowed:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109289]) +6 similar issues
>      * igt@gen9_exec_parse@valid-registers:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2856]) +3 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2527] / [i915#2856]) +3 similar
>             issues
> 
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4281])
> 
>           * shard-apl: PASS -> SKIP ([fdo#109271])
> 
>      * igt@i915_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110892])
>      * igt@i915_pm_rpm@modeset-pc8-residency-stress:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109506] / [i915#2411])
>      * igt@i915_query@query-topology-known-pci-ids:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109303])
>      * igt@i915_query@query-topology-unsupported:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109302])
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109302])
> 
>      * igt@i915_selftest@live@gt_lrc:
> 
>           * shard-tglb: NOTRUN -> DMESG-FAIL ([i915#2373])
>      * igt@i915_selftest@live@gt_pm:
> 
>           * shard-tglb: NOTRUN -> DMESG-FAIL ([i915#1759])
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3826])
>      * igt@kms_async_flips@alternate-sync-async-flip:
> 
>           * shard-glk: PASS -> FAIL ([i915#2521])
>      * igt@kms_atomic@atomic_plane_damage:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#4765])
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#5286]) +7 similar issues
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#5286]) +5 similar issues
>      * igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271]) +207 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110725] / [fdo#111614]) +2
>             similar issues
> 
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111614]) +3 similar issues
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +8 similar
>             issues
>      * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +6 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3777]) +2 similar
>             issues
> 
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615]) +11 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#110723]) +3 similar issues
>      * igt@kms_big_joiner@2x-modeset:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#2705])
>      * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689]) +9 similar issues
>      * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +5 similar
>             issues
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +12
>             similar issues
>      * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#3886]) +20
>             similar issues
>      * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3689] / [i915#3886]) +8 similar
>             issues
>      * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#3886]) +7
>             similar issues
>      * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [i915#3689]) +9
>             similar issues
>      * igt@kms_chamelium@hdmi-hpd-storm:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +31
>             similar issues
>      * igt@kms_chamelium@hdmi-mode-timings:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +2
>             similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +9
>             similar issues
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +4
>             similar issues
> 
>      * igt@kms_color@pipe-d-ctm-max:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [i915#1149])
>      * igt@kms_color_chamelium@pipe-b-ctm-0-75:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109284] / [fdo#111827]) +22
>             similar issues
>      * igt@kms_color_chamelium@pipe-b-gamma:
> 
>           * shard-apl: NOTRUN -> SKIP ([fdo#109271] / [fdo#111827]) +14
>             similar issues
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-kbl: NOTRUN -> TIMEOUT ([i915#1319])
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3116] / [i915#3299])
>      * igt@kms_content_protection@uevent:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#2105])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#1063]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109300] / [fdo#111066])
> 
>      * igt@kms_cursor_crc@pipe-a-cursor-suspend:
> 
>           * shard-glk: PASS -> SKIP ([fdo#109271])
>      * igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3319]) +4 similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-32x32-random:
> 
>           * shard-glk: NOTRUN -> SKIP ([fdo#109271]) +66 similar issues
>      * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278] / [fdo#109279]) +2
>             similar issues
>      * igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3359]) +8 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109279] / [i915#3359]) +3
>             similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-64x64-random:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109278]) +24 similar issues
>      * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109274] / [fdo#111825]) +16
>             similar issues
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#4103]) +1 similar issue
>      * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274] / [fdo#109278]) +2
>             similar issues
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-glk: PASS -> FAIL ([i915#2346])
>      * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3528])
>      * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#5287]) +4 similar issues
>      * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#5287]) +2 similar issues
>      * igt@kms_flip@2x-nonexisting-fb-interruptible:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109274]) +2 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#2587]) +1 similar issue
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
> 
>           * shard-snb: NOTRUN -> SKIP ([fdo#109271]) +139 similar issues
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-iclb: NOTRUN -> SKIP ([fdo#109280]) +23 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#109280] / [fdo#111825]) +50
>             similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#5439])
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3555]) +1 similar issue
>      * igt@kms_pipe_crc_basic@read-crc-pipe-d:
> 
>           * shard-kbl: NOTRUN -> SKIP ([fdo#109271] / [i915#533]) +1 similar
>             issue
>      * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN ([i915#180])
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
> 
>           * shard-apl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +1 similar
>             issue
> 
>           * shard-glk: NOTRUN -> FAIL ([fdo#108145] / [i915#265])
> 
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
> 
>           * shard-kbl: NOTRUN -> FAIL ([fdo#108145] / [i915#265]) +1 similar
>             issue
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
> 
>           * shard-kbl: NOTRUN -> FAIL ([i915#265])
>      * igt@kms_plane_lowres@pipe-a-tiling-y:
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#3536])
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#3536])
> 
>      * igt@kms_plane_lowres@pipe-b-tiling-4:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#5288]) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP ([i915#5288])
> 
>      * igt@kms_plane_lowres@pipe-b-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP ([fdo#111615] / [fdo#112054]) +1
>             similar issue
>      * igt@kms_plane_scaling@downscale-with-rotation-factor-0-75@pipe-b-edp-1-downscale-with-rotation:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#5176]) +3 similar issues
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale:
> 
>           * shard-tglb: NOTRUN -> SKIP ([i915#5235]) +3 similar issues
>      * igt@kms_pri
