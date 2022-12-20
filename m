Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD4310E09C
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Dec 2022 08:11:46 +0000 (UTC)
Message-ID: <7268fc05-1c96-6586-4e07-7a45daad178c@intel.com>
Date: Tue, 20 Dec 2022 09:11:10 +0100
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <cover.1671446367.git.karolina.stolarek@intel.com>
 <167150593455.18783.5181854986113853762@emeril.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <167150593455.18783.5181854986113853762@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_blt=5Fcmd=5Finfo_struct?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Yedireswarapu, SaiX Nandan" <saix.nandan.yedireswarapu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 20.12.2022 04:12, Patchwork wrote:
> *Patch Details*
> *Series:*	Introduce blt_cmd_info struct
> *URL:*	https://patchwork.freedesktop.org/series/112055/ 
> <https://patchwork.freedesktop.org/series/112055/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7099_full -> IGTPW_8246_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_8246_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8246_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/index.html
> 
> 
>     Participating hosts (11 -> 10)
> 
> Missing (1): shard-dg10
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_8246_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk9/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-glk7/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
> 

Not related to my changes.

Thanks,
Karolina

>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     {igt@gem_ccs@block-multicopy-compressed}:
> 
>       o {shard-tglu}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-tglu-7/igt@gem_ccs@block-multicopy-compressed.html>
>   *
> 
>     igt@i915_selftest@live@gem_contexts:
> 
>       o {shard-rkl}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@i915_selftest@live@gem_contexts.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-rkl-3/igt@i915_selftest@live@gem_contexts.html>
>   *
> 
>     igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
> 
>       o {shard-tglu-10}: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-tglu-10/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html>
>   *
> 
>     igt@perf_pmu@most-busy-idle-check-all@rcs0:
> 
>       o {shard-dg1}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-dg1-13/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-dg1-13/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
>   *
> 
>     {igt@vc4/vc4_tiling@get-bad-flags}:
> 
>       o {shard-rkl}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-rkl-5/igt@vc4/vc4_tiling@get-bad-flags.html>
>         +5 similar issues
>   *
> 
>     {igt@vc4/vc4_tiling@set-bad-handle}:
> 
>       o {shard-dg1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-dg1-13/igt@vc4/vc4_tiling@set-bad-handle.html>
>         +5 similar issues
> 
> 
>     New tests
> 
> New tests have been introduced between IGT_7099_full and IGTPW_8246_full:
> 
> 
>       New IGT tests (18)
> 
>   *
> 
>     igt@gem_exercise_blt@fast-copy:
> 
>       o Statuses : 1 skip(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@linear-lmem0-lmem0:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@linear-lmem0-smem:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@linear-smem-lmem0:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@linear-smem-smem:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@tile4-lmem0-lmem0:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@tile4-lmem0-smem:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@tile4-smem-lmem0:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@tile4-smem-smem:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@tile64-lmem0-lmem0:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@tile64-lmem0-smem:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@tile64-smem-lmem0:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@tile64-smem-smem:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@yfmajor-smem-smem:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@ymajor-lmem0-lmem0:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@ymajor-lmem0-smem:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@ymajor-smem-lmem0:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@gem_exercise_blt@fast-copy@ymajor-smem-smem:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.0] s
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_8246_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_caching@read-writes:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl1/igt@gem_caching@read-writes.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl2/igt@gem_caching@read-writes.html>
>         (i915#7708 <https://gitlab.freedesktop.org/drm/intel/issues/7708>)
>   *
> 
>     igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099
>         <https://gitlab.freedesktop.org/drm/intel/issues/1099>) +1
>         similar issue
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-glk5/igt@gem_lmem_swapping@heavy-verify-random-ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
> 
>   *
> 
>     igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl2/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +117
>         similar issues
>   *
> 
>     igt@gem_userptr_blits@dmabuf-sync:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3323 <https://gitlab.freedesktop.org/drm/intel/issues/3323>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3323 <https://gitlab.freedesktop.org/drm/intel/issues/3323>)
> 
>   *
> 
>     igt@gem_userptr_blits@input-checking:
> 
>       o shard-apl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl2/igt@gem_userptr_blits@input-checking.html>
>         (i915#4991 <https://gitlab.freedesktop.org/drm/intel/issues/4991>)
>   *
> 
>     igt@i915_pm_rps@engine-order:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl3/igt@i915_pm_rps@engine-order.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl8/igt@i915_pm_rps@engine-order.html>
>         (i915#6537 <https://gitlab.freedesktop.org/drm/intel/issues/6537>)
>   *
> 
>     igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-glk9/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +2
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl3/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +3
>         similar issues
>   *
> 
>     igt@kms_chamelium@dp-crc-single:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl7/igt@kms_chamelium@dp-crc-single.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-cmp-planar-formats:
> 
>       o
> 
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-snb5/igt@kms_chamelium@hdmi-cmp-planar-formats.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-glk3/igt@kms_chamelium@hdmi-cmp-planar-formats.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_content_protection@atomic@pipe-a-dp-1:
> 
>       o shard-apl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl2/igt@kms_content_protection@atomic@pipe-a-dp-1.html>
>         (i915#7173 <https://gitlab.freedesktop.org/drm/intel/issues/7173>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl1/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#7205 <https://gitlab.freedesktop.org/drm/intel/issues/7205>)
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
>   *
> 
>     igt@kms_flip@2x-blocking-wf_vblank@bc-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk8/igt@kms_flip@2x-blocking-wf_vblank@bc-hdmi-a1-hdmi-a2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-glk4/igt@kms_flip@2x-blocking-wf_vblank@bc-hdmi-a1-hdmi-a2.html>
>         (i915#2122 <https://gitlab.freedesktop.org/drm/intel/issues/2122>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-snb4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +86
>         similar issues
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-glk4/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl8/igt@kms_psr2_sf@plane-move-sf-dmg-area.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +2
>         similar issues
>   *
> 
>     igt@kms_vrr@negative-basic:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-glk2/igt@kms_vrr@negative-basic.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +38
>         similar issues
>   *
> 
>     igt@sysfs_clients@fair-1:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl2/igt@sysfs_clients@fair-1.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +2
>         similar issues
>   *
> 
>     igt@sysfs_clients@split-10:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-glk9/igt@sysfs_clients@split-10.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_hotunplug@unbind-rebind:
> 
>       o shard-snb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-snb2/igt@core_hotunplug@unbind-rebind.html>
>         (i915#4528
>         <https://gitlab.freedesktop.org/drm/intel/issues/4528>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-snb2/igt@core_hotunplug@unbind-rebind.html>
>   *
> 
>     igt@fbdev@read:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-4/igt@fbdev@read.html>
>         (i915#2582
>         <https://gitlab.freedesktop.org/drm/intel/issues/2582>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-rkl-6/igt@fbdev@read.html>
>   *
> 
>     igt@gem_ctx_exec@basic-nohangcheck:
> 
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html>
>         (i915#6268
>         <https://gitlab.freedesktop.org/drm/intel/issues/6268>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html>
>   *
> 
>     igt@gem_ctx_isolation@preservation-s3@bcs0:
> 
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3@bcs0.html>
>         (i915#7673
>         <https://gitlab.freedesktop.org/drm/intel/issues/7673>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-rkl-5/igt@gem_ctx_isolation@preservation-s3@bcs0.html>
>         +3 similar issues
>   *
> 
>     igt@gem_ctx_persistence@engines-hang@bcs0:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-5/igt@gem_ctx_persistence@engines-hang@bcs0.html>
>         (i915#6252
>         <https://gitlab.freedesktop.org/drm/intel/issues/6252>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-rkl-3/igt@gem_ctx_persistence@engines-hang@bcs0.html>
>   *
> 
>     igt@gem_eio@in-flight-suspend:
> 
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-5/igt@gem_eio@in-flight-suspend.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-rkl-1/igt@gem_eio@in-flight-suspend.html>
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html>
>         (i915#2846
>         <https://gitlab.freedesktop.org/drm/intel/issues/2846>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o
> 
>         shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         +4 similar issues
> 
>       o
> 
>         shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl2/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl8/igt@gem_exec_fair@basic-pace-share@rcs0.html>
> 
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html>
>         +6 similar issues
>   *
> 
>     igt@gem_mmap_gtt@coherency:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@gem_mmap_gtt@coherency.html>
>         (fdo#111656
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111656>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-rkl-5/igt@gem_mmap_gtt@coherency.html>
>   *
> 
>     igt@gem_mmap_gtt@hang-user:
> 
>       o
> 
>         shard-glk: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk1/igt@gem_mmap_gtt@hang-user.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-glk3/igt@gem_mmap_gtt@hang-user.html>
> 
>       o
> 
>         shard-apl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl6/igt@gem_mmap_gtt@hang-user.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl1/igt@gem_mmap_gtt@hang-user.html>
> 
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads:
> 
>       o shard-apl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl2/igt@gem_partial_pwrite_pread@writes-after-reads.html>
>         (i915#7708
>         <https://gitlab.freedesktop.org/drm/intel/issues/7708>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl6/igt@gem_partial_pwrite_pread@writes-after-reads.html>
>         +1 similar issue
>   *
> 
>     igt@gem_pread@snoop:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@gem_pread@snoop.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-rkl-5/igt@gem_pread@snoop.html>
>         +2 similar issues
>   *
> 
>     igt@gem_softpin@noreloc-s3:
> 
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-5/igt@gem_softpin@noreloc-s3.html>
>         (fdo#103375
>         <https://bugs.freedesktop.org/show_bug.cgi?id=103375>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-rkl-2/igt@gem_softpin@noreloc-s3.html>
>   *
> 
>     igt@gen9_exec_parse@valid-registers:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-1/igt@gen9_exec_parse@valid-registers.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html>
>         +2 similar issues
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@vcs0:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>         (i915#3591
>         <https://gitlab.freedesktop.org/drm/intel/issues/3591>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>         +1 similar issue
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         +2 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-dg1-12/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-dg1-16/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html>
>   *
> 
>     igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs:
> 
>       o {shard-tglu}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-tglu-6/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-tglu-1/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html>
>         +7 similar issues
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/intel/issues/2346>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
> 
>       o {shard-tglu}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-tglu-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html>
>         +1 similar issue
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html>
>         +3 similar issues
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
> 
>       o shard-snb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-snb2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html>
>   *
> 
>     igt@kms_plane@pixel-format@pipe-b-planes:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-rkl-5/igt@kms_plane@pixel-format@pipe-b-planes.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#3558
>         <https://gitlab.freedesktop.org/drm/intel/issues/3558>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-rkl-6/igt@kms_plane@pixel-format@pipe-b-planes.html>
>         +1 similar issue
>   *
> 
>     igt@perf_pmu@busy-idle@vcs0:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-dg1-17/igt@perf_pmu@busy-idle@vcs0.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/intel/issues/4349>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-dg1-15/igt@perf_pmu@busy-idle@vcs0.html>
>         +2 similar issues
>   *
> 
>     igt@sysfs_timeslice_duration@timeout@vecs0:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-dg1-12/igt@sysfs_timeslice_duration@timeout@vecs0.html>
>         (i915#1755
>         <https://gitlab.freedesktop.org/drm/intel/issues/1755>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-dg1-18/igt@sysfs_timeslice_duration@timeout@vecs0.html>
> 
> 
>         Warnings
> 
>   * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
>       o shard-apl: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7099/shard-apl2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>
>         (IGT#6
>         <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/shard-apl1/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>
>         (i915#4573
>         <https://gitlab.freedesktop.org/drm/intel/issues/4573>) +1
>         similar issue
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7099 -> IGTPW_8246
> 
> CI-20190529: 20190529
> CI_DRM_12515: 25905f33e9cb1630d94ce04688d5a6c756f96e9d @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8246: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8246/index.html
> IGT_7099: 62e8be3ca2935a079de4fabd4923df58278a9ed0 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
