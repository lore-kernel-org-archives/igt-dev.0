Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A7010E37A
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Mar 2023 07:53:30 +0000 (UTC)
Message-ID: <dc1be3d3-33ba-33df-71e4-225e3e6ef78a@intel.com>
Date: Tue, 7 Mar 2023 08:53:29 +0100
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <20230303092428.1175360-1-karolina.stolarek@intel.com>
 <167812806327.4155.3847050002657892390@emeril.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <167812806327.4155.3847050002657892390@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fccs=3A_Remove_block-copy-inplace_subtest?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Yedireswarapu, SaiX Nandan" <saix.nandan.yedireswarapu@intel.com>, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 6.03.2023 19:41, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/gem_ccs: Remove block-copy-inplace subtest
> *URL:*	https://patchwork.freedesktop.org/series/114604/ 
> <https://patchwork.freedesktop.org/series/114604/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7180_full -> IGTPW_8557_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_8557_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8557_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/index.html
> 
> 
>     Participating hosts (9 -> 9)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_8557_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html>

Not related to my changes.

Thanks,
Karolina

> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * {igt@kms_plane_scaling@i915-max-source-size}:
>       o {shard-dg1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-dg1-17/igt@kms_plane_scaling@i915-max-source-size.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_8557_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@core_hotunplug@unbind-rebind:
> 
>       o shard-snb: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-snb6/igt@core_hotunplug@unbind-rebind.html> (i915#4528 <https://gitlab.freedesktop.org/drm/intel/issues/4528>)
>   *
> 
>     igt@gem_ctx_persistence@engines-hostile-preempt:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-snb1/igt@gem_ctx_persistence@engines-hostile-preempt.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>) +3 similar issues
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-snb4/igt@gem_eio@unwedge-stress.html> (i915#3354 <https://gitlab.freedesktop.org/drm/intel/issues/3354>)
>   *
> 
>     igt@gem_exec_capture@capture-invisible@smem0:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-glk3/igt@gem_exec_capture@capture-invisible@smem0.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#6334 <https://gitlab.freedesktop.org/drm/intel/issues/6334>)
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-apl2/igt@gem_exec_fair@basic-deadline.html> (i915#2846 <https://gitlab.freedesktop.org/drm/intel/issues/2846>)
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +2 similar issues
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-apl3/igt@gem_huc_copy@huc-copy.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@random:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-glk4/igt@gem_lmem_swapping@random.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +6 similar issues
>   *
> 
>     igt@gem_lmem_swapping@verify-random-ccs:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-apl2/igt@gem_lmem_swapping@verify-random-ccs.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +4 similar issues
>   *
> 
>     igt@gem_pread@exhaustion:
> 
>       o
> 
>         shard-apl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-apl1/igt@gem_pread@exhaustion.html> (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
> 
>       o
> 
>         shard-snb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-snb6/igt@gem_pread@exhaustion.html> (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>) +1 similar issue
> 
>       o
> 
>         shard-glk: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-glk4/igt@gem_pread@exhaustion.html> (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
> 
>   *
> 
>     igt@gem_userptr_blits@vma-merge:
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-apl2/igt@gem_userptr_blits@vma-merge.html> (i915#3318 <https://gitlab.freedesktop.org/drm/intel/issues/3318>)
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-glk8/igt@gem_userptr_blits@vma-merge.html> (i915#3318 <https://gitlab.freedesktop.org/drm/intel/issues/3318>)
> 
>   *
> 
>     igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-glk2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#1937 <https://gitlab.freedesktop.org/drm/intel/issues/1937>)
>   *
> 
>     igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-apl3/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +12 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-glk7/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +8 similar issues
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-storm:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-apl1/igt@kms_chamelium_hpd@hdmi-hpd-storm.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +310 similar issues
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
> 
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-glk7/igt@kms_fbcon_fbt@fbc-suspend.html> (i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +250 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +459 similar issues
>   *
> 
>     igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-glk5/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html> (i915#7862 <https://gitlab.freedesktop.org/drm/intel/issues/7862>) +1 similar issue
>   *
> 
>     igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1:
> 
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-apl3/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1.html> (i915#4573 <https://gitlab.freedesktop.org/drm/intel/issues/4573>) +1 similar issue
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-glk5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +4 similar issues
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-apl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +4 similar issues
>   *
> 
>     igt@kms_vblank@pipe-d-wait-idle:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-apl1/igt@kms_vblank@pipe-d-wait-idle.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#533 <https://gitlab.freedesktop.org/drm/intel/issues/533>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-glk2/igt@kms_vblank@pipe-d-wait-idle.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#533 <https://gitlab.freedesktop.org/drm/intel/issues/533>)
> 
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-apl3/igt@kms_writeback@writeback-check-output.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7180/shard-apl1/igt@gem_exec_fair@basic-pace-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-apl1/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>   *
> 
>     igt@gem_pwrite_snooped:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7180/shard-rkl-4/igt@gem_pwrite_snooped.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-rkl-5/igt@gem_pwrite_snooped.html> +1 similar issue
>   *
> 
>     igt@gen9_exec_parse@basic-rejected:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7180/shard-rkl-4/igt@gen9_exec_parse@basic-rejected.html> (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-rkl-5/igt@gen9_exec_parse@basic-rejected.html>
>   *
> 
>     igt@i915_pipe_stress@stress-xrgb8888-untiled:
> 
>       o {shard-tglu}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7180/shard-tglu-6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-tglu-5/igt@i915_pipe_stress@stress-xrgb8888-untiled.html>
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@vcs0:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7180/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html> (i915#3591 <https://gitlab.freedesktop.org/drm/intel/issues/3591>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>   *
> 
>     igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
> 
>       o {shard-tglu}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7180/shard-tglu-6/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> / i915#7651 <https://gitlab.freedesktop.org/drm/intel/issues/7651>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-tglu-3/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html> +3 similar issues
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7180/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>   *
> 
>     igt@kms_fence_pin_leak:
> 
>       o {shard-tglu}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7180/shard-tglu-6/igt@kms_fence_pin_leak.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-tglu-5/igt@kms_fence_pin_leak.html>
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7180/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html> (i915#2122 <https://gitlab.freedesktop.org/drm/intel/issues/2122>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html>
>   *
> 
>     igt@kms_properties@plane-properties-atomic:
> 
>       o {shard-tglu}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7180/shard-tglu-6/igt@kms_properties@plane-properties-atomic.html> (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-tglu-2/igt@kms_properties@plane-properties-atomic.html>
>   *
> 
>     igt@perf_pmu@most-busy-idle-check-all@rcs0:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7180/shard-dg1-16/igt@perf_pmu@most-busy-idle-check-all@rcs0.html> (i915#5234 <https://gitlab.freedesktop.org/drm/intel/issues/5234>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/shard-dg1-17/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7180 -> IGTPW_8557
> 
> CI-20190529: 20190529
> CI_DRM_12805: c1dbd5b5c8fdb5efd37a5a5234469b293c89a358 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8557: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8557/index.html
> IGT_7180: b6b1ceb4fc4d8f83a9540e4628a6c2648514bb19 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
