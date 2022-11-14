Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D4610E265
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Nov 2022 06:16:19 +0000 (UTC)
Message-ID: <622803e1-9770-4ff2-4faf-edceadfaca8b@intel.com>
Date: Mon, 14 Nov 2022 07:16:00 +0100
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <20221110151052.40009-1-karolina.stolarek@intel.com>
 <166810597016.16952.258466092432559576@emeril.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <166810597016.16952.258466092432559576@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?api=5Fintel=5Fbb=3A_Run_misplaced-blitter_only_with_supported_e?=
 =?utf-8?q?ngines?=
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

On 10.11.2022 19:46, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/api_intel_bb: Run misplaced-blitter only with supported 
> engines
> *URL:*	https://patchwork.freedesktop.org/series/110765/ 
> <https://patchwork.freedesktop.org/series/110765/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_12365_full -> IGTPW_8082_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_8082_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8082_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/index.html
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
> IGTPW_8082_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1:
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-glk5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html>

The failure is not related to my changes.

Thanks,
Karolina

> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@kms_invalid_mode@int-max-clock:
>       o {shard-rkl}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-rkl-5/igt@kms_invalid_mode@int-max-clock.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_8082_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_create@create-massive:
> 
>       o shard-snb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-snb6/igt@gem_create@create-massive.html>
>         (i915#4991 <https://gitlab.freedesktop.org/drm/intel/issues/4991>)
>   *
> 
>     igt@gem_ctx_sseu@invalid-args:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb7/igt@gem_ctx_sseu@invalid-args.html>
>         (i915#280 <https://gitlab.freedesktop.org/drm/intel/issues/280>)
>   *
> 
>     igt@gem_exec_balancer@parallel-contexts:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb3/igt@gem_exec_balancer@parallel-contexts.html>
>         (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb8/igt@gem_exec_balancer@parallel-keep-in-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) +1
>         similar issue
>   *
> 
>     igt@gem_exec_fair@basic-none@vecs0:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk8/igt@gem_exec_fair@basic-none@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-glk6/igt@gem_exec_fair@basic-none@vecs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_schedule@preempt-user:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-snb2/igt@gem_exec_schedule@preempt-user.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +22
>         similar issues
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-tglb2/igt@gem_huc_copy@huc-copy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb7/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-random:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-apl8/igt@gem_lmem_swapping@heavy-verify-random.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>   *
> 
>     igt@gem_userptr_blits@readonly-unsync:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb6/igt@gem_userptr_blits@readonly-unsync.html>
>         (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb7/igt@gem_userptr_blits@readonly-unsync.html>
>         (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
> 
>   *
> 
>     igt@i915_module_load@resize-bar:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb2/igt@i915_module_load@resize-bar.html>
>         (i915#6412 <https://gitlab.freedesktop.org/drm/intel/issues/6412>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb6/igt@i915_module_load@resize-bar.html>
>         (i915#6412 <https://gitlab.freedesktop.org/drm/intel/issues/6412>)
> 
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb8/igt@i915_pm_dc@dc9-dpms.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html>
>         (i915#7475 <https://gitlab.freedesktop.org/drm/intel/issues/7475>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-apl1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +29
>         similar issues
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html>
>         (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html>
>         (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
> 
>   *
> 
>     igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-apl2/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +4
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +2
>         similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
> 
>   *
> 
>     igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb6/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb8/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
> 
>   *
> 
>     igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb7/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs.html>
>         (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>   *
> 
>     igt@kms_chamelium@dp-hpd-fast:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb2/igt@kms_chamelium@dp-hpd-fast.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-glk3/igt@kms_chamelium@dp-hpd-fast.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_chamelium@dp-hpd-with-enabled-mode:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-apl3/igt@kms_chamelium@dp-hpd-with-enabled-mode.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +2
>         similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb3/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
> 
>       o
> 
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-snb2/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
> 
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html>
>         (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +6
>         similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>         i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +2
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html>
>         (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>         fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-glk7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +9
>         similar issues
>   *
> 
>     igt@kms_plane_lowres@tiling-yf:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb5/igt@kms_plane_lowres@tiling-yf.html>
>         (fdo#112054
>         <https://bugs.freedesktop.org/show_bug.cgi?id=112054> /
>         i915#5288 <https://gitlab.freedesktop.org/drm/intel/issues/5288>)
>   *
> 
>     igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb7/igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1.html>
>         (i915#3536
>         <https://gitlab.freedesktop.org/drm/intel/issues/3536>) +2
>         similar issues
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb6/igt@kms_psr2_su@page_flip-nv12.html>
>         (i915#7037 <https://gitlab.freedesktop.org/drm/intel/issues/7037>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-glk9/igt@kms_psr2_su@page_flip-nv12.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb6/igt@kms_psr2_su@page_flip-nv12.html>
>         (fdo#109642
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>         fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068>
>         / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-apl6/igt@kms_psr2_su@page_flip-nv12.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
>   *
> 
>     igt@kms_psr@psr2_sprite_plane_move:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +1
>         similar issue
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>   *
> 
>     igt@perf@stress-open-close:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk5/igt@perf@stress-open-close.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-glk6/igt@perf@stress-open-close.html>
>         (i915#5213 <https://gitlab.freedesktop.org/drm/intel/issues/5213>)
>   *
> 
>     igt@sysfs_clients@fair-1:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-apl8/igt@sysfs_clients@fair-1.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@fbdev@unaligned-read:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-1/igt@fbdev@unaligned-read.html>
>         (i915#2582
>         <https://gitlab.freedesktop.org/drm/intel/issues/2582>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-rkl-6/igt@fbdev@unaligned-read.html>
>   *
> 
>     igt@gem_ctx_exec@basic-nohangcheck:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html>
>         (i915#6268
>         <https://gitlab.freedesktop.org/drm/intel/issues/6268>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html>
>   *
> 
>     igt@gem_ctx_persistence@legacy-engines-hang@blt:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html>
>         (i915#6252
>         <https://gitlab.freedesktop.org/drm/intel/issues/6252>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-rkl-6/igt@gem_ctx_persistence@legacy-engines-hang@blt.html>
>   *
> 
>     igt@gem_ctx_persistence@smoketest:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb2/igt@gem_ctx_persistence@smoketest.html>
>         (i915#5099
>         <https://gitlab.freedesktop.org/drm/intel/issues/5099>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb3/igt@gem_ctx_persistence@smoketest.html>
>   *
> 
>     igt@gem_exec_balancer@parallel:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb5/igt@gem_exec_balancer@parallel.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb2/igt@gem_exec_balancer@parallel.html>
>         +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk5/igt@gem_exec_fair@basic-deadline.html>
>         (i915#2846
>         <https://gitlab.freedesktop.org/drm/intel/issues/2846>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-glk3/igt@gem_exec_fair@basic-deadline.html>
>   *
> 
>     igt@gem_exec_fair@basic-flow@rcs0:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html>
>         +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-none-share@rcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>   *
> 
>     igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html>
>         +2 similar issues
>   *
> 
>     igt@gem_set_tiling_vs_pwrite:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html>
>         +2 similar issues
>   *
> 
>     igt@gen9_exec_parse@unaligned-access:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-1/igt@gen9_exec_parse@unaligned-access.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-rkl-5/igt@gen9_exec_parse@unaligned-access.html>
>         +1 similar issue
>   *
> 
>     igt@i915_hangman@engine-engine-error@bcs0:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html>
>         (i915#6258
>         <https://gitlab.freedesktop.org/drm/intel/issues/6258>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-rkl-3/igt@i915_hangman@engine-engine-error@bcs0.html>
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o shard-apl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl2/igt@i915_pm_dc@dc9-dpms.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-apl7/igt@i915_pm_dc@dc9-dpms.html>
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@vcs0:
> 
>       o {shard-rkl}: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>         (i915#2681
>         <https://gitlab.freedesktop.org/drm/intel/issues/2681>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>   *
> 
>     igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html>
>   *
> 
>     igt@i915_selftest@perf@engine_cs:
> 
>       o shard-snb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-snb2/igt@i915_selftest@perf@engine_cs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-snb7/igt@i915_selftest@perf@engine_cs.html>
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1.html>
>         (i915#2521
>         <https://gitlab.freedesktop.org/drm/intel/issues/2521>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-apl1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1.html>
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html>
>         (i915#2521
>         <https://gitlab.freedesktop.org/drm/intel/issues/2521>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html>
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-0:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html>
>         +9 similar issues
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
> 
>       o shard-glk: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html>
>         (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>
>         / i915#5138
>         <https://gitlab.freedesktop.org/drm/intel/issues/5138>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-glk5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html>
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html>
>         +7 similar issues
>   *
> 
>     igt@kms_psr@cursor_render:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-2/igt@kms_psr@cursor_render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-rkl-6/igt@kms_psr@cursor_render.html>
>   *
> 
>     igt@kms_psr@psr2_sprite_blt:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html>
>         +1 similar issue
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (i915#5461
>         <https://gitlab.freedesktop.org/drm/intel/issues/5461>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>   *
> 
>     igt@perf@gen12-mi-rpc:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-5/igt@perf@gen12-mi-rpc.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-rkl-3/igt@perf@gen12-mi-rpc.html>
>   *
> 
>     igt@perf_pmu@all-busy-idle-check-all:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-dg1-15/igt@perf_pmu@all-busy-idle-check-all.html>
>         (i915#5234
>         <https://gitlab.freedesktop.org/drm/intel/issues/5234>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-dg1-18/igt@perf_pmu@all-busy-idle-check-all.html>
>   *
> 
>     igt@prime_vgem@basic-read:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-1/igt@prime_vgem@basic-read.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-rkl-5/igt@prime_vgem@basic-read.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_exec_balancer@parallel-ordering:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html>
>         (i915#6117
>         <https://gitlab.freedesktop.org/drm/intel/issues/6117>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html>
>         (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>   *
> 
>     igt@gem_pread@exhaustion:
> 
>       o shard-tglb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-tglb1/igt@gem_pread@exhaustion.html>
>         (i915#7248
>         <https://gitlab.freedesktop.org/drm/intel/issues/7248>) -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-tglb3/igt@gem_pread@exhaustion.html>
>         (i915#2658
>         <https://gitlab.freedesktop.org/drm/intel/issues/2658>) +1
>         similar issue
>   *
> 
>     igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>         (i915#588 <https://gitlab.freedesktop.org/drm/intel/issues/588>)
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@runner@aborted:
> 
>       o shard-apl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl3/igt@runner@aborted.html>)
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3002 <https://gitlab.freedesktop.org/drm/intel/issues/3002>
>         / i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312>) -> (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-apl2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/shard-apl7/igt@runner@aborted.html>)
>         (i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7050 -> IGTPW_8082
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_12365: 1bda5b0abc8a0d9d53d9fec1a390dc93e2b0ba57 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8082: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8082/index.html
> IGT_7050: 42839a7c2bab78bc6cda8c949d8545606f377735 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
