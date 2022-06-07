Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5940A12B0FE
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jun 2022 08:34:37 +0000 (UTC)
Date: Tue, 7 Jun 2022 10:34:32 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yp8NmP/1adJqCAhS@zkempczy-mobl2>
References: <20220607052411.7357-1-zbigniew.kempczynski@intel.com>
 <165458652237.8644.3333651902022851@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165458652237.8644.3333651902022851@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGNy?=
 =?utf-8?q?c32_calculation_on_dg2_gpu_=28rev5=29?=
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

On Tue, Jun 07, 2022 at 07:22:02AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add crc32 calculation on dg2 gpu (rev5)                        
>    URL:     https://patchwork.freedesktop.org/series/104657/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7240/index.html 
> 
>          CI Bug Log - changes from CI_DRM_11729_full -> IGTPW_7240_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_7240_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_7240_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7240/index.html
> 
> Participating hosts (13 -> 10)
> 
>    Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_7240_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * {igt@api_intel_bb@crc32} (NEW):
> 
>           * shard-tglb: NOTRUN -> SKIP
> 
>           * shard-iclb: NOTRUN -> SKIP
> 
>           * {shard-rkl}: NOTRUN -> SKIP
> 
>           * {shard-dg1}: NOTRUN -> SKIP
> 
>           * {shard-tglu}: NOTRUN -> SKIP
> 
>      * igt@i915_pm_rpm@fences-dpms:
> 
>           * shard-iclb: PASS -> INCOMPLETE
> 
> New tests
> 
>    New tests have been introduced between CI_DRM_11729_full and
>    IGTPW_7240_full:
> 
>   New IGT tests (1)
> 
>      * igt@api_intel_bb@crc32:
>           * Statuses : 8 skip(s)
>           * Exec time: [0.0] s

Test is correct for dg2, so skips for other gens are expected.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_7240_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5327)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5325)
> 
>      * igt@gem_ctx_isolation@preservation-s3@vecs0:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN (i915#180) +5 similar issues
>      * igt@gem_ctx_persistence@engines-hang:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099)
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-snb: NOTRUN -> FAIL (i915#3354)
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#5784)
> 
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-iclb: PASS -> SKIP (i915#4525)
>      * igt@gem_exec_fair@basic-flow@rcs0:
> 
>           * shard-tglb: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-iclb: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842) +1 similar issue
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-apl: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_flush@basic-wb-rw-before-default:
> 
>           * shard-snb: PASS -> SKIP (fdo#109271)
>      * igt@gem_lmem_swapping@basic:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#4613)
>      * igt@gem_lmem_swapping@heavy-verify-random:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +2 similar
>             issues
>      * igt@gem_lmem_swapping@verify-random:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4613)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#4613)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4613)
> 
>      * igt@gem_userptr_blits@vma-merge:
> 
>           * shard-apl: NOTRUN -> FAIL (i915#3318)
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#3318)
> 
>      * igt@gen3_render_mixed_blits:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109289)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109289)
> 
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#5566 / i915#716)
>      * igt@i915_pm_dc@dc9-dpms:
> 
>           * shard-iclb: PASS -> SKIP (i915#4281)
>      * igt@i915_pm_rpm@dpms-lpsp:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271) +218 similar issues
>      * igt@i915_suspend@fence-restore-untiled:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#180) +3 similar issues
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5286) +1 similar issue
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5286) +1 similar issue
> 
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111614)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110725 / fdo#111614)
> 
>      * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#110723)
>      * igt@kms_big_joiner@basic:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2705)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2705)
> 
>      * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6095) +2 similar issues
>      * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#3886) +2 similar
>             issues
>      * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886) +2 similar
>             issues
>      * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +9 similar
>             issues
>      * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +4 similar
>             issues
>      * igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689) +1 similar issue
>      * igt@kms_chamelium@dp-mode-timings:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +2 similar
>             issues
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar
>             issues
> 
>      * igt@kms_color_chamelium@pipe-a-degamma:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +9 similar
>             issues
>      * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +6 similar
>             issues
>      * igt@kms_color_chamelium@pipe-c-degamma:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827) +2 similar
>             issues
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar
>             issues
> 
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3116)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3116 / i915#3299)
> 
>      * igt@kms_content_protection@legacy:
> 
>           * shard-kbl: NOTRUN -> TIMEOUT (i915#1319)
>      * igt@kms_cursor_crc@pipe-d-cursor-32x10-rapid-movement:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3359) +3 similar issues
>      * igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +106 similar issues
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825) +3 similar
>             issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274 / fdo#109278) +1 similar
>             issue
> 
>      * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5287)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#5287)
> 
>      * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109274) +1 similar issue
>      * igt@kms_flip@flip-vs-expired-vblank@c-dp1:
> 
>           * shard-apl: PASS -> FAIL (i915#79)
>      * igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:
> 
>           * shard-glk: PASS -> FAIL (i915#2122)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280) +7 similar issues
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +7 similar
>             issues
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1839)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#1839)
> 
>      * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#533) +1 similar
>             issue
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#533)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#533)
> 
>      * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180) +2 similar issues
>      * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#265)
>      * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
> 
>           * shard-glk: NOTRUN -> FAIL (fdo#108145 / i915#265)
>      * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
> 
>           * shard-kbl: NOTRUN -> FAIL (fdo#108145 / i915#265)
>      * igt@kms_plane_lowres@pipe-b-tiling-none:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3536)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3536)
> 
>      * igt@kms_plane_multiple@atomic-pipe-b-tiling-4:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +44 similar issues
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +14 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5288)
> 
>      * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615) +1 similar issue
>      * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +90 similar issues
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2920)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#658)
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#658)
> 
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#658) +1 similar
>             issue
>      * igt@kms_psr@psr2_primary_mmap_gtt:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +2 similar issues
>      * igt@kms_psr@psr2_sprite_mmap_gtt:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109441)
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#132 / i915#3467)
> 
>      * igt@kms_setmode@invalid-clone-single-crtc:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#3555)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3555)
> 
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2437)
>      * igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2530)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2530)
> 
>      * igt@prime_nv_api@nv_self_import_to_different_fd:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109291) +1 similar issue
>      * igt@prime_nv_test@i915_blt_fill_nv_read:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109291) +1 similar issue
>      * igt@sysfs_clients@busy:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +2 similar
>             issues
>      * igt@sysfs_clients@sema-10:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#2994)
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2994)
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +4 similar
>             issues
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2994)
> 
>     Possible fixes
> 
>      * igt@gem_ctx_isolation@preservation-s3@vecs0:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS +2 similar issues
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-tglb: FAIL (i915#2842) -> PASS
>      * igt@gem_exec_flush@basic-wb-pro-default:
> 
>           * shard-snb: SKIP (fdo#109271) -> PASS +1 similar issue
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglb: SKIP (i915#2190) -> PASS
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-kbl: DMESG-WARN (i915#5566 / i915#716) -> PASS
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-iclb: FAIL (i915#454) -> PASS
>      * igt@i915_pm_rpm@dpms-lpsp:
> 
>           * {shard-dg1}: SKIP (i915#1397) -> PASS
>      * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * {shard-rkl}: SKIP (i915#1397) -> PASS
>      * igt@i915_pm_rps@min-max-config-idle:
> 
>           * {shard-rkl}: FAIL (i915#4016) -> PASS
>      * igt@i915_suspend@debugfs-reader:
> 
>           * shard-kbl: DMESG-WARN (i915#180) -> PASS +1 similar issue
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>           * {shard-rkl}: SKIP (i915#1845 / i915#4098) -> PASS +9 similar
>             issues
>      * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
> 
>           * {shard-rkl}: SKIP (fdo#112022 / i915#4070) -> PASS +1 similar
>             issue
>      * igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#4070 / i915#4098) -> PASS +1
>             similar issue
>      * igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge:
> 
>           * shard-glk: DMESG-WARN (i915#118 / i915#1888) -> PASS
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: FAIL (i915#2346 / i915#533) -> PASS
>      * igt@kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic:
> 
>           * {shard-rkl}: SKIP (fdo#111825 / i915#4070) -> PASS
>      * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled:
> 
>           * shard-glk: FAIL (i915#1888 / i915#5160) -> PASS
>      * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
> 
>           * {shard-rkl}: SKIP (fdo#111314 / i915#4098 / i915#4369) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
> 
>           * shard-glk: FAIL (i915#2546) -> PASS
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
> 
>           * {shard-rkl}: SKIP (i915#1849 / i915#4098) -> PASS +6 similar
>             issues
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
> 
>           * shard-glk: FAIL (i915#1888) -> PASS
>      * igt@kms_psr@cursor_mmap_gtt:
> 
>           * {shard-rkl}: SKIP (i915#1072) -> PASS
>      * igt@kms_psr@psr2_no_drrs:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS +1 similar issue
>      * igt@kms_universal_plane@disable-primary-vs-flip-pipe-a:
> 
>           * {shard-rkl}: SKIP (i915#1845 / i915#4070 / i915#4098) -> PASS
>      * igt@kms_vblank@pipe-b-wait-idle:
> 
>           * {shard-dg1}: SKIP (i915#2575) -> PASS +35 similar issues
> 
>     Warnings
> 
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-iclb: SKIP (i915#4525) -> FAIL (i915#6117)
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (fdo#111068 / i915#658)
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
> 
>           * shard-iclb: SKIP (i915#658) -> SKIP (i915#2920)
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-iclb: SKIP (fdo#109642 / fdo#111068 / i915#658) -> FAIL
>             (i915#5939)
>      * igt@runner@aborted:
> 
>           * shard-apl: (FAIL, FAIL, FAIL, FAIL) (i915#180 / i915#3002 /
>             i915#4312 / i915#5257) -> (FAIL, FAIL, FAIL, FAIL, FAIL)
>             (fdo#109271 / i915#180 / i915#3002 / i915#4312 / i915#5257)
> 
>           * shard-kbl: (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL,
>             FAIL) (fdo#109271 / i915#180 / i915#3002 / i915#4312 / i915#5257
>             / i915#716) -> (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL,
>             FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL) (i915#180 / i915#3002 /
>             i915#4312 / i915#5257)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6509 -> IGTPW_7240
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_11729: fb41937d097981b11a2856d507c2f1b9064bef76 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_7240: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7240/index.html
>    IGT_6509: 24bad3ce51c57c907307f84aa9202d04b80ad2a3 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
