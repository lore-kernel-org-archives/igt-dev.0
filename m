Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7B08DBBD
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Jul 2022 11:37:09 +0000 (UTC)
Date: Mon, 11 Jul 2022 13:37:05 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YswLYe4dZkJQIzIO@zkempczy-mobl2>
References: <20220711070036.10453-1-zbigniew.kempczynski@intel.com>
 <165753253655.5766.7626764784439630605@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165753253655.5766.7626764784439630605@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fgt=3A_Remove_static_vcs2_engine?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jul 11, 2022 at 09:42:16AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/igt_gt: Remove static vcs2 engine                          
>    URL:     https://patchwork.freedesktop.org/series/106172/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/index.html 
> 
>          CI Bug Log - changes from CI_DRM_11862_full -> IGTPW_7495_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_7495_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_7495_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/index.html
> 
> Participating hosts (10 -> 9)
> 
>    Additional (2): shard-rkl shard-tglu
>    Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_7495_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
>           * shard-glk: PASS -> WARN

Unrelated to the change.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_11862_full and
>    IGTPW_7495_full:
> 
>   New IGT tests (1)
> 
>      * igt@kms_legacy_colorkey@basic:
>           * Statuses :
>           * Exec time: [None] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_7495_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_create@create-massive:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN (i915#4991)
> 
>           * shard-apl: NOTRUN -> DMESG-WARN (i915#4991)
> 
>      * igt@gem_ctx_persistence@engines-hostile-preempt:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / i915#1099) +2 similar
>             issues
>      * igt@gem_ctx_persistence@hostile:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#2410)
>      * igt@gem_exec_balancer@parallel-contexts:
> 
>           * shard-iclb: PASS -> SKIP (i915#4525)
>      * igt@gem_exec_balancer@parallel-ordering:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#6117)
>      * igt@gem_exec_fair@basic-none-share@rcs0:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#2842) +1 similar issue
>      * igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>           * shard-tglb: NOTRUN -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-none@vcs0:
> 
>           * shard-kbl: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-none@vcs1:
> 
>           * shard-iclb: NOTRUN -> FAIL (i915#2842) +1 similar issue
>      * igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>           * shard-glk: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#2842) +1 similar issue
>      * igt@gem_exec_fair@basic-pace@bcs0:
> 
>           * shard-iclb: PASS -> FAIL (i915#2842)
>      * igt@gem_exec_suspend@basic-s3@smem:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#180)
>      * igt@gem_lmem_swapping@verify-random:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#4613) +2 similar
>             issues
>      * igt@gem_pxp@create-regular-buffer:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#4270)
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#4270) +1 similar issue
> 
>      * igt@gem_softpin@evict-single-offset:
> 
>           * shard-kbl: NOTRUN -> FAIL (i915#4171)
>      * igt@gem_softpin@evict-snoop-interruptible:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109312)
>      * igt@gem_vm_create@invalid-create:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271) +53 similar issues
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#5566 / i915#716)
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#5566 / i915#716)
> 
>      * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
> 
>           * shard-tglb: NOTRUN -> WARN (i915#2681) +3 similar issues
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615)
>      * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278 / i915#3886)
>      * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689 / i915#3886)
>      * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#3689) +3 similar issues
>      * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#3886) +6 similar
>             issues
>      * igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf_tiled_ccs:
> 
>           * shard-iclb: PASS -> FAIL (i915#1888)
>      * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_ccs:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271) +213 similar issues
>      * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6095) +3 similar issues
>      * igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs:
> 
>           * shard-apl: NOTRUN -> SKIP (fdo#109271) +13 similar issues
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#111615 / i915#3689) +1 similar
>             issue
> 
>      * igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109278) +2 similar issues
>      * igt@kms_chamelium@dp-hpd-fast:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +3 similar
>             issues
>      * igt@kms_chamelium@hdmi-frame-dump:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +15 similar
>             issues
>      * igt@kms_color_chamelium@pipe-a-ctm-0-25:
> 
>           * shard-snb: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +2 similar
>             issues
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109284 / fdo#111827)
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109284 / fdo#111827)
> 
>      * igt@kms_content_protection@lic:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#1063)
>      * igt@kms_content_protection@srm:
> 
>           * shard-kbl: NOTRUN -> TIMEOUT (i915#1319) +1 similar issue
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825)
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#4767)
> 
>           * shard-kbl: NOTRUN -> INCOMPLETE (i915#180 / i915#4939)
> 
>      * igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109274 / fdo#111825 / i915#3637)
>      * igt@kms_flip@flip-vs-suspend@a-dp1:
> 
>           * shard-kbl: NOTRUN -> DMESG-WARN (i915#180) +3 similar issues
>      * igt@kms_flip@flip-vs-suspend@b-dp1:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#180) +5 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#2672) +4 similar issues
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2672)
>      * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109280)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109280 / fdo#111825) +4 similar
>             issues
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271) +24 similar issues
>      * igt@kms_hdmi_inject@inject-audio:
> 
>           * shard-tglb: PASS -> SKIP (i915#433)
>      * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#6403) +3 similar issues
>      * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109289) +2 similar issues
>      * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#658)
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
> 
>           * shard-tglb: NOTRUN -> SKIP (i915#2920)
> 
>           * shard-glk: NOTRUN -> SKIP (fdo#109271 / i915#658) +1 similar
>             issue
> 
>           * shard-iclb: NOTRUN -> SKIP (i915#658)
> 
>      * igt@kms_psr@psr2_no_drrs:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441)
>      * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
> 
>           * shard-glk: PASS -> FAIL (i915#1888 / i915#65)
>      * igt@kms_vblank@pipe-a-query-forked-busy:
> 
>           * shard-snb: PASS -> SKIP (fdo#109271) +4 similar issues
>      * igt@kms_vblank@pipe-b-ts-continuation-suspend:
> 
>           * shard-kbl: PASS -> INCOMPLETE (i915#3614 / i915#4939)
>      * igt@perf@polling-parameterized:
> 
>           * shard-apl: PASS -> FAIL (i915#5639)
>      * igt@perf@unprivileged-single-ctx-counters:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109289)
>      * igt@prime_nv_api@i915_nv_import_twice:
> 
>           * shard-tglb: NOTRUN -> SKIP (fdo#109291) +1 similar issue
>      * igt@prime_nv_api@i915_nv_import_vs_close:
> 
>           * shard-iclb: NOTRUN -> SKIP (fdo#109291)
>      * igt@sysfs_clients@sema-25:
> 
>           * shard-kbl: NOTRUN -> SKIP (fdo#109271 / i915#2994) +1 similar
>             issue
> 
>     Possible fixes
> 
>      * igt@gem_busy@close-race:
> 
>           * shard-snb: TIMEOUT (i915#5748) -> PASS
>      * igt@gem_ctx_isolation@preservation-s3@bcs0:
> 
>           * shard-kbl: DMESG-WARN (i915#180) -> PASS +5 similar issues
>      * igt@gem_eio@kms:
> 
>           * shard-tglb: FAIL (i915#5784) -> PASS
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-iclb: SKIP (i915#4525) -> PASS +2 similar issues
>      * igt@gem_exec_fair@basic-throttle@rcs0:
> 
>           * shard-iclb: FAIL (i915#2849) -> PASS
>      * igt@gem_exec_whisper@basic-contexts-forked-all:
> 
>           * shard-glk: DMESG-WARN (i915#118) -> PASS
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-tglb: TIMEOUT (i915#3953) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
> 
>           * shard-kbl: WARN -> PASS
>      * igt@i915_selftest@live@hangcheck:
> 
>           * shard-snb: INCOMPLETE (i915#3921) -> PASS
> 
>           * shard-tglb: DMESG-WARN (i915#5591) -> PASS
> 
>      * igt@i915_suspend@fence-restore-untiled:
> 
>           * shard-apl: DMESG-WARN (i915#180) -> PASS
>      * igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1:
> 
>           * shard-kbl: FAIL (i915#2122) -> PASS
>      * igt@kms_plane@plane-position-covered@pipe-b-planes:
> 
>           * shard-tglb: INCOMPLETE -> PASS
>      * igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:
> 
>           * shard-glk: DMESG-FAIL (i915#118 / i915#1888) -> PASS
>      * igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2:
> 
>           * shard-glk: FAIL (i915#1888) -> PASS
>      * igt@kms_psr@psr2_cursor_blt:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS +1 similar issue
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-tglb: SKIP (i915#5519) -> PASS
> 
>     Warnings
> 
>      * igt@gem_softpin@noreloc-s3:
> 
>           * shard-kbl: INCOMPLETE (i915#3614 / i915#4939 / i915#794) ->
>             DMESG-WARN (i915#180)
>      * igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>           * shard-iclb: SKIP (i915#658) -> SKIP (i915#588)
>      * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
> 
>           * shard-iclb: FAIL (i915#2684) -> WARN (i915#2684)
>      * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
> 
>           * shard-kbl: DMESG-FAIL (i915#180) -> FAIL (i915#1188)
>      * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (i915#658)
>      * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
> 
>           * shard-iclb: SKIP (i915#2920) -> SKIP (fdo#111068 / i915#658)
>      * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>           * shard-iclb: SKIP (fdo#111068 / i915#658) -> SKIP (i915#2920)
>      * igt@runner@aborted:
> 
>           * shard-apl: (FAIL, FAIL) (i915#180 / i915#3002 / i915#4312 /
>             i915#5257) -> (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL)
>             (fdo#109271 / i915#180 / i915#3002 / i915#4312 / i915#5257)
> 
>           * shard-kbl: (FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL)
>             (i915#180 / i915#3002 / i915#4312 / i915#5257) -> (FAIL, FAIL,
>             FAIL, FAIL, FAIL, FAIL, FAIL, FAIL, FAIL) (i915#180 / i915#3002 /
>             i915#4312 / i915#5257 / i915#92)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6563 -> IGTPW_7495
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_11862: ffee806d103b9604db7eb9cd689c098aca1ffa96 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_7495: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7495/index.html
>    IGT_6563: 7d43b49bf10788d4870668f93a800888fc8ab339 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
