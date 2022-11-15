Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DE289830
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 09:34:55 +0000 (UTC)
Message-ID: <f2f6bd8f-ceaf-13f8-abe3-303e542845f6@intel.com>
Date: Tue, 15 Nov 2022 10:34:45 +0100
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <20221115062305.87160-1-karolina.stolarek@intel.com>
 <166850436965.16896.13874360500427946714@emeril.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <166850436965.16896.13874360500427946714@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?api=5Fintel=5Fbb=3A_Run_misplaced-blitter_only_with_supported_e?=
 =?utf-8?q?ngines_=28rev2=29?=
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

On 15.11.2022 10:26, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/api_intel_bb: Run misplaced-blitter only with supported 
> engines (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/110765/ 
> <https://patchwork.freedesktop.org/series/110765/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_12379_full -> IGTPW_8101_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_8101_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8101_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/index.html
> 
> 
>     Participating hosts (11 -> 8)
> 
> Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_8101_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-snb4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-snb6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html>

This regression is not related to my changes.

Thanks,
Karolina

> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@gem_ppgtt@blt-vs-render-ctx0:
>       o {shard-rkl}: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-rkl-5/igt@gem_ppgtt@blt-vs-render-ctx0.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_8101_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@feature_discovery@psr2:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-iclb2/igt@feature_discovery@psr2.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb8/igt@feature_discovery@psr2.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@gem_ctx_persistence@engines-cleanup:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-snb4/igt@gem_ctx_persistence@engines-cleanup.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>   *
> 
>     igt@gem_exec_params@secure-non-master:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb5/igt@gem_exec_params@secure-non-master.html>
>         (fdo#112283 <https://bugs.freedesktop.org/show_bug.cgi?id=112283>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb3/igt@gem_exec_params@secure-non-master.html>
>         (fdo#112283 <https://bugs.freedesktop.org/show_bug.cgi?id=112283>)
> 
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-apl6/igt@gem_huc_copy@huc-copy.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb7/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-glk3/igt@gem_huc_copy@huc-copy.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb8/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
> 
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb3/igt@gem_lmem_swapping@heavy-verify-multi.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-apl1/igt@gem_lmem_swapping@heavy-verify-multi.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1
>         similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb6/igt@gem_lmem_swapping@heavy-verify-multi.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-glk8/igt@gem_lmem_swapping@heavy-verify-multi.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
> 
>   *
> 
>     igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html>
>         (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html>
>         (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
> 
>   *
> 
>     igt@gem_vm_create@invalid-create:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-snb5/igt@gem_vm_create@invalid-create.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +32
>         similar issues
>   *
> 
>     igt@i915_pm_dc@dc6-dpms:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html>
>         (i915#3989
>         <https://gitlab.freedesktop.org/drm/intel/issues/3989> /
>         i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-tglb3/igt@i915_selftest@live@hangcheck.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb3/igt@i915_selftest@live@hangcheck.html>
>         (i915#5591 <https://gitlab.freedesktop.org/drm/intel/issues/5591>)
>   *
> 
>     igt@i915_suspend@basic-s2idle-without-i915:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-snb5/igt@i915_suspend@basic-s2idle-without-i915.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-snb2/igt@i915_suspend@basic-s2idle-without-i915.html>
>         (i915#4528 <https://gitlab.freedesktop.org/drm/intel/issues/4528>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2.html>
>         (i915#5584 <https://gitlab.freedesktop.org/drm/intel/issues/5584>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
> 
>   *
> 
>     igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb7/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs.html>
>         (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>   *
> 
>     igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_rc_ccs:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-apl8/igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_rc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +43
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-apl7/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-glk2/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb7/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
> 
>   *
> 
>     igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>         i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>   *
> 
>     igt@kms_chamelium@hdmi-edid-change-during-suspend:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +2
>         similar issues
>   *
> 
>     igt@kms_chamelium@vga-hpd-for-each-pipe:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb8/igt@kms_chamelium@vga-hpd-for-each-pipe.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
>   *
> 
>     igt@kms_color_chamelium@ctm-blue-to-red:
> 
>       o
> 
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-snb4/igt@kms_color_chamelium@ctm-blue-to-red.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb1/igt@kms_color_chamelium@ctm-blue-to-red.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-glk3/igt@kms_color_chamelium@ctm-blue-to-red.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb1/igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +5
>         similar issues
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa@legacy:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa@legacy.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +5
>         similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672> /
>         i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +2
>         similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +1
>         similar issue
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>         i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>         i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +3
>         similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +2
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html>
>         (i915#6497 <https://gitlab.freedesktop.org/drm/intel/issues/6497>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +4
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-glk1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +13
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +4
>         similar issues
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-apl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-apl3/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>   *
> 
>     igt@kms_plane_lowres@tiling-yf:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb6/igt@kms_plane_lowres@tiling-yf.html>
>         (fdo#112054
>         <https://bugs.freedesktop.org/show_bug.cgi?id=112054> /
>         i915#5288 <https://gitlab.freedesktop.org/drm/intel/issues/5288>)
>   *
> 
>     igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb5/igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1.html>
>         (i915#3536
>         <https://gitlab.freedesktop.org/drm/intel/issues/3536>) +2
>         similar issues
>   *
> 
>     igt@kms_psr@psr2_cursor_blt:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb5/igt@kms_psr@psr2_cursor_blt.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +3
>         similar issues
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o
> 
>         shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-tglb6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
> 
>       o
> 
>         shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-iclb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
> 
>   *
> 
>     igt@kms_vblank@pipe-d-wait-busy:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb2/igt@kms_vblank@pipe-d-wait-busy.html>
>         (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_balancer@parallel:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-iclb5/igt@gem_exec_balancer@parallel.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb1/igt@gem_exec_balancer@parallel.html>
>   *
> 
>     igt@gem_exec_fair@basic-flow@rcs0:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace@vcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-glk6/igt@gem_exec_fair@basic-pace@vcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-glk6/igt@gem_exec_fair@basic-pace@vcs0.html>
>         +4 similar issues
>   *
> 
>     igt@gem_exec_reloc@basic-write-read-noreloc:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-rkl-1/igt@gem_exec_reloc@basic-write-read-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html>
>         +3 similar issues
>   *
> 
>     igt@gem_readwrite@beyond-eob:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-rkl-2/igt@gem_readwrite@beyond-eob.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-rkl-5/igt@gem_readwrite@beyond-eob.html>
>         +2 similar issues
>   *
> 
>     igt@gen9_exec_parse@bb-start-out:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-rkl-1/igt@gen9_exec_parse@bb-start-out.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-rkl-5/igt@gen9_exec_parse@bb-start-out.html>
>         +1 similar issue
>   *
> 
>     igt@i915_pm_backlight@basic-brightness:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-rkl-5/igt@i915_pm_backlight@basic-brightness.html>
>         (i915#3012
>         <https://gitlab.freedesktop.org/drm/intel/issues/3012>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-rkl-6/igt@i915_pm_backlight@basic-brightness.html>
>   *
> 
>     igt@i915_pm_dc@dc5-psr:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-iclb8/igt@i915_pm_dc@dc5-psr.html>
>         (i915#3989
>         <https://gitlab.freedesktop.org/drm/intel/issues/3989>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb8/igt@i915_pm_dc@dc5-psr.html>
>   *
> 
>     igt@i915_pm_dc@dc6-psr:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-iclb7/igt@i915_pm_dc@dc6-psr.html>
>         (i915#3989
>         <https://gitlab.freedesktop.org/drm/intel/issues/3989> /
>         i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb5/igt@i915_pm_dc@dc6-psr.html>
>   *
> 
>     igt@i915_pm_rpm@modeset-lpsp:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-rkl-5/igt@i915_pm_rpm@modeset-lpsp.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp.html>
>   *
> 
>     igt@i915_pm_rps@min-max-config-idle:
> 
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-rkl-6/igt@i915_pm_rps@min-max-config-idle.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-rkl-1/igt@i915_pm_rps@min-max-config-idle.html>
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1:
> 
>       o shard-glk: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-glk7/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1.html>
>         (i915#5584
>         <https://gitlab.freedesktop.org/drm/intel/issues/5584>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1.html>
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-rkl-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         +16 similar issues
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor@atomic:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor@atomic.html>
>         (i915#7405
>         <https://gitlab.freedesktop.org/drm/intel/issues/7405>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor@atomic.html>
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/intel/issues/2346>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html>
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor@toggle:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/intel/issues/2346>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html>
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html>
>         +1 similar issue
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html>
>         (i915#2546
>         <https://gitlab.freedesktop.org/drm/intel/issues/2546>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html>
>         +16 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html>
>         +8 similar issues
>   *
> 
>     igt@kms_psr@psr2_no_drrs:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-iclb8/igt@kms_psr@psr2_no_drrs.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb2/igt@kms_psr@psr2_no_drrs.html>
>         +1 similar issue
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak-pipe-b:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-rkl-1/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070>
>         / i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html>
>   *
> 
>     igt@kms_vblank@pipe-a-query-idle-hang:
> 
>       o
> 
>         shard-apl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-apl3/igt@kms_vblank@pipe-a-query-idle-hang.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-apl6/igt@kms_vblank@pipe-a-query-idle-hang.html>
> 
>       o
> 
>         shard-glk: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-glk7/igt@kms_vblank@pipe-a-query-idle-hang.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-glk2/igt@kms_vblank@pipe-a-query-idle-hang.html>
> 
>   *
> 
>     igt@kms_vblank@pipe-a-wait-busy-hang:
> 
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-glk2/igt@kms_vblank@pipe-a-wait-busy-hang.html>
>         (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-glk2/igt@kms_vblank@pipe-a-wait-busy-hang.html>
>   *
> 
>     igt@perf_pmu@busy-idle-check-all@vecs0:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-dg1-12/igt@perf_pmu@busy-idle-check-all@vecs0.html>
>         (i915#4521
>         <https://gitlab.freedesktop.org/drm/intel/issues/4521>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-dg1-19/igt@perf_pmu@busy-idle-check-all@vecs0.html>
>         +2 similar issues
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-rkl-2/igt@prime_vgem@basic-fence-read.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-rkl-5/igt@prime_vgem@basic-fence-read.html>
>   *
> 
>     igt@testdisplay:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-rkl-2/igt@testdisplay.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-rkl-6/igt@testdisplay.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_exec_balancer@parallel-ordering:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html>
>         (i915#6117 <https://gitlab.freedesktop.org/drm/intel/issues/6117>)
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb7/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-iclb3/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-iclb7/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12379/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7056 -> IGTPW_8101
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_12379: fbd41f5bba3fa2af510a37dadb4ef872e2c54701 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8101: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8101/index.html
> IGT_7056: 05096a6754048f4b5a2de798ab4bea32012b556a @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
