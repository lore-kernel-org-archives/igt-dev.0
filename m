Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A2F11BCA5
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jul 2022 08:22:07 +0000 (UTC)
Message-ID: <91b340ad-0359-cd8e-8596-f7885e62e881@intel.com>
Date: Thu, 7 Jul 2022 09:22:03 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: igt-dev@lists.freedesktop.org,
 "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
References: <20220706093802.203189-1-matthew.auld@intel.com>
 <165712136721.1546.5644526018138914212@emeril.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <165712136721.1546.5644526018138914212@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=5Fquery=3A_tweak_the_unallocated_tracking_test_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 06/07/2022 16:29, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/i915_query: tweak the unallocated tracking test (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/105926/ 
> <https://patchwork.freedesktop.org/series/105926/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/index.html>
> 
> 
>   CI Bug Log - changes from IGT_6557_full -> IGTPW_7469_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7469_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7469_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/index.html
> 
> 
>     Participating hosts (10 -> 10)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_7469_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html>
> 

Looks to be unrelated.

> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs:
> 
>       o {shard-dg1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-dg1-19/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs.html>
>         +4 similar issues
>   *
> 
>     igt@kms_flip@bo-too-big-interruptible@a-hdmi-a1:
> 
>       o {shard-dg1}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-dg1-16/igt@kms_flip@bo-too-big-interruptible@a-hdmi-a1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-dg1-19/igt@kms_flip@bo-too-big-interruptible@a-hdmi-a1.html>
>         +5 similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
> 
>       o {shard-rkl}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html>
>         +2 similar issues
>   *
> 
>     igt@kms_invalid_mode@bad-hsync-end:
> 
>       o {shard-dg1}: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-dg1-19/igt@kms_invalid_mode@bad-hsync-end.html>
>   *
> 
>     igt@kms_properties@crtc-properties-atomic:
> 
>       o {shard-dg1}: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-dg1-19/igt@kms_properties@crtc-properties-atomic.html>
>         +5 similar issues
>   *
> 
>     igt@kms_setmode@clone-exclusive-crtc:
> 
>       o {shard-dg1}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-dg1-13/igt@kms_setmode@clone-exclusive-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-dg1-19/igt@kms_setmode@clone-exclusive-crtc.html>
> 
> 
>     New tests
> 
> New tests have been introduced between IGT_6557_full and IGTPW_7469_full:
> 
> 
>       New IGT tests (2)
> 
>   *
> 
>     igt@kms_atomic_transition@plane-all-transition-nonblocking@hdmi-a-2-pipe-a:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [4.22] s
>   *
> 
>     igt@kms_atomic_transition@plane-all-transition-nonblocking@hdmi-a-2-pipe-b:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [4.18] s
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_7469_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-apl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>   *
> 
>     igt@gem_ctx_persistence@process:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-snb6/igt@gem_ctx_persistence@process.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>   *
> 
>     igt@gem_eio@in-flight-contexts-immediate:
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-glk2/igt@gem_eio@in-flight-contexts-immediate.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-glk7/igt@gem_eio@in-flight-contexts-immediate.html>
>         (i915#3063 <https://gitlab.freedesktop.org/drm/intel/issues/3063>)
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-apl4/igt@gem_eio@in-flight-contexts-immediate.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-apl6/igt@gem_eio@in-flight-contexts-immediate.html>
>         (i915#3063 <https://gitlab.freedesktop.org/drm/intel/issues/3063>)
> 
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb3/igt@gem_exec_balancer@parallel-keep-in-fence.html>
>         (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb8/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>         (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>   *
> 
>     igt@gem_exec_fair@basic-none-share@rcs0:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-none-vip@rcs0:
> 
>       o
> 
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-glk5/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb2/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-kbl1/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
> 
>   *
> 
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@vcs1:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +1
>         similar issue
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-tglb3/igt@gem_huc_copy@huc-copy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb7/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-multi:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-glk9/igt@gem_lmem_swapping@heavy-multi.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1
>         similar issue
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-kbl7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3
>         similar issues
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-engines:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-apl8/igt@gem_lmem_swapping@parallel-random-engines.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1
>         similar issue
>   *
> 
>     igt@gem_lmem_swapping@verify-random-ccs:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb3/igt@gem_lmem_swapping@verify-random-ccs.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb7/igt@gem_lmem_swapping@verify-random-ccs.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
> 
>   *
> 
>     igt@gem_pxp@fail-invalid-protected-context:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb5/igt@gem_pxp@fail-invalid-protected-context.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb2/igt@gem_pxp@fail-invalid-protected-context.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +1
>         similar issue
> 
>   *
> 
>     igt@gem_softpin@evict-snoop:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb2/igt@gem_softpin@evict-snoop.html>
>         (fdo#109312 <https://bugs.freedesktop.org/show_bug.cgi?id=109312>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb8/igt@gem_softpin@evict-snoop.html>
>         (fdo#109312 <https://bugs.freedesktop.org/show_bug.cgi?id=109312>)
> 
>   *
> 
>     igt@gem_userptr_blits@input-checking:
> 
>       o shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-glk2/igt@gem_userptr_blits@input-checking.html>
>         (i915#4991 <https://gitlab.freedesktop.org/drm/intel/issues/4991>)
>   *
> 
>     igt@gem_workarounds@suspend-resume-fd:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         +3 similar issues
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-snb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html>
>         (i915#6201 <https://gitlab.freedesktop.org/drm/intel/issues/6201>)
>   *
> 
>     igt@i915_pm_rpm@dpms-lpsp:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-kbl1/igt@i915_pm_rpm@dpms-lpsp.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +196
>         similar issues
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-180:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-glk1/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-glk2/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html>
>         (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>
>         / i915#1888 <https://gitlab.freedesktop.org/drm/intel/issues/1888>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +1
>         similar issue
>   *
> 
>     igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +5
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-glk1/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +4
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb2/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +3
>         similar issues
> 
>   *
> 
>     igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-kbl1/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +10
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-apl8/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +7
>         similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +2
>         similar issues
> 
>   *
> 
>     igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb1/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +1
>         similar issue
>   *
> 
>     igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb5/igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>         i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +1
>         similar issue
>   *
> 
>     igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb3/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +1
>         similar issue
>   *
> 
>     igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb8/igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +1
>         similar issue
>   *
> 
>     igt@kms_cdclk@plane-scaling:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb1/igt@kms_cdclk@plane-scaling.html>
>         (i915#3742 <https://gitlab.freedesktop.org/drm/intel/issues/3742>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb2/igt@kms_cdclk@plane-scaling.html>
>         (i915#3742 <https://gitlab.freedesktop.org/drm/intel/issues/3742>)
> 
>   *
> 
>     igt@kms_chamelium@dp-hpd-storm:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-kbl1/igt@kms_chamelium@dp-hpd-storm.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +17
>         similar issues
>   *
> 
>     igt@kms_chamelium@dp-hpd-storm-disable:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-snb5/igt@kms_chamelium@dp-hpd-storm-disable.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +3
>         similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-aspect-ratio:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-apl4/igt@kms_chamelium@hdmi-aspect-ratio.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
>   *
> 
>     igt@kms_chamelium@vga-hpd-for-each-pipe:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb7/igt@kms_chamelium@vga-hpd-for-each-pipe.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +2
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb4/igt@kms_chamelium@vga-hpd-for-each-pipe.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +3
>         similar issues
> 
>   *
> 
>     igt@kms_color_chamelium@pipe-b-ctm-max:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-glk5/igt@kms_color_chamelium@pipe-b-ctm-max.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +5
>         similar issues
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o
> 
>         shard-apl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-apl1/igt@kms_content_protection@atomic.html>
>         (i915#1319 <https://gitlab.freedesktop.org/drm/intel/issues/1319>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb4/igt@kms_content_protection@atomic.html>
>         (fdo#109300
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109300> /
>         fdo#111066 <https://bugs.freedesktop.org/show_bug.cgi?id=111066>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-kbl7/igt@kms_content_protection@atomic.html>
>         (i915#1319 <https://gitlab.freedesktop.org/drm/intel/issues/1319>)
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html>
>         (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html>
>         (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
> 
>   *
> 
>     igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb4/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled.html>
>         (i915#5287
>         <https://gitlab.freedesktop.org/drm/intel/issues/5287>) +1
>         similar issue
>   *
> 
>     igt@kms_draw_crc@draw-method-rgb565-render-4tiled:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb5/igt@kms_draw_crc@draw-method-rgb565-render-4tiled.html>
>         (i915#5287
>         <https://gitlab.freedesktop.org/drm/intel/issues/5287>) +1
>         similar issue
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank-interruptible:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +2
>         similar issues
>   *
> 
>     igt@kms_flip@2x-flip-vs-modeset-vs-hang:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>
>         / i915#3637
>         <https://gitlab.freedesktop.org/drm/intel/issues/3637>) +1
>         similar issue
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend@a-dp1:
> 
>       o shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         +5 similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +1
>         similar issue
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +2
>         similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-glk5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +61
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +4
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +4
>         similar issues
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html>
>         (i915#433 <https://gitlab.freedesktop.org/drm/intel/issues/433>)
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
> 
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> / i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>) +2
>         similar issues
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> / i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>) +1
>         similar issue
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-glk8/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> / i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_plane_cursor@pipe-d-overlay-size-64:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-apl8/igt@kms_plane_cursor@pipe-d-overlay-size-64.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +105
>         similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-iclb8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +2
>         similar issues
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb3/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-glk7/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb7/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-kbl1/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-apl8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1
>         similar issue
>   *
> 
>     igt@kms_psr@psr2_dpms:
> 
>       o
> 
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb8/igt@kms_psr@psr2_dpms.html>
>         (i915#132 <https://gitlab.freedesktop.org/drm/intel/issues/132>
>         / i915#3467 <https://gitlab.freedesktop.org/drm/intel/issues/3467>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb6/igt@kms_psr@psr2_dpms.html>
>         (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
> 
>   *
> 
>     igt@kms_psr@psr2_primary_blt:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-iclb2/igt@kms_psr@psr2_primary_blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb3/igt@kms_psr@psr2_primary_blt.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +1
>         similar issue
>   *
> 
>     igt@kms_vblank@pipe-a-ts-continuation-suspend:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-snb4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-snb6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>   *
> 
>     igt@kms_vblank@pipe-d-wait-idle:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-kbl7/igt@kms_vblank@pipe-d-wait-idle.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#533
>         <https://gitlab.freedesktop.org/drm/intel/issues/533>)
>   *
> 
>     igt@nouveau_crc@pipe-c-source-outp-complete:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb8/igt@nouveau_crc@pipe-c-source-outp-complete.html>
>         (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb6/igt@nouveau_crc@pipe-c-source-outp-complete.html>
>         (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
> 
>   *
> 
>     igt@perf@mi-rpc:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb1/igt@perf@mi-rpc.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>   *
> 
>     igt@sysfs_clients@sema-25:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-apl2/igt@sysfs_clients@sema-25.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb2/igt@sysfs_clients@sema-25.html>
>         (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-glk7/igt@sysfs_clients@sema-25.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +3
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb3/igt@sysfs_clients@sema-25.html>
>         (i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-kbl4/igt@sysfs_clients@sema-25.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
> 
>   *
> 
>     igt@sysfs_clients@sema-50:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-snb4/igt@sysfs_clients@sema-50.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +69
>         similar issues
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@device_reset@unbind-reset-rebind:
> 
>       o
> 
>         {shard-rkl}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-5/igt@device_reset@unbind-reset-rebind.html>
>         (i915#5507
>         <https://gitlab.freedesktop.org/drm/intel/issues/5507>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html>
> 
>       o
> 
>         {shard-tglu}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-tglu-3/igt@device_reset@unbind-reset-rebind.html>
>         (i915#5507
>         <https://gitlab.freedesktop.org/drm/intel/issues/5507>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglu-5/igt@device_reset@unbind-reset-rebind.html>
> 
>       o
> 
>         shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-apl1/igt@device_reset@unbind-reset-rebind.html>
>         (i915#5507
>         <https://gitlab.freedesktop.org/drm/intel/issues/5507>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-apl3/igt@device_reset@unbind-reset-rebind.html>
> 
>       o
> 
>         shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-glk9/igt@device_reset@unbind-reset-rebind.html>
>         (i915#5507
>         <https://gitlab.freedesktop.org/drm/intel/issues/5507>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-glk9/igt@device_reset@unbind-reset-rebind.html>
> 
>       o
> 
>         shard-iclb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-iclb5/igt@device_reset@unbind-reset-rebind.html>
>         (i915#5507
>         <https://gitlab.freedesktop.org/drm/intel/issues/5507>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb8/igt@device_reset@unbind-reset-rebind.html>
> 
>   *
> 
>     igt@gem_ctx_exec@basic-nohangcheck:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html>
>         (i915#6268
>         <https://gitlab.freedesktop.org/drm/intel/issues/6268>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html>
>   *
> 
>     igt@gem_ctx_persistence@legacy-engines-hang@bsd1:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-dg1-16/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html>
>         (i915#4883
>         <https://gitlab.freedesktop.org/drm/intel/issues/4883>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-dg1-12/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html>
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-tglb8/igt@gem_eio@unwedge-stress.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/intel/issues/5784>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb7/igt@gem_eio@unwedge-stress.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace@rcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html>
>         +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-pace@vecs0:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html>
>   *
> 
>     igt@gem_exec_reloc@basic-write-read-active:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-active.html>
>         +5 similar issues
>   *
> 
>     igt@gem_mmap_wc@set-cache-level:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-5/igt@gem_mmap_wc@set-cache-level.html>
>         (i915#1850
>         <https://gitlab.freedesktop.org/drm/intel/issues/1850>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-6/igt@gem_mmap_wc@set-cache-level.html>
>   *
> 
>     igt@gem_partial_pwrite_pread@reads:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-5/igt@gem_partial_pwrite_pread@reads.html>
>         +2 similar issues
>   *
> 
>     igt@gem_softpin@evict-single-offset:
> 
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-5/igt@gem_softpin@evict-single-offset.html>
>         (i915#4171
>         <https://gitlab.freedesktop.org/drm/intel/issues/4171>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-2/igt@gem_softpin@evict-single-offset.html>
>   *
> 
>     igt@gem_spin_batch@spin-each:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-apl2/igt@gem_spin_batch@spin-each.html>
>         (i915#2898
>         <https://gitlab.freedesktop.org/drm/intel/issues/2898>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-apl3/igt@gem_spin_batch@spin-each.html>
>   *
> 
>     igt@gem_workarounds@suspend-resume-context:
> 
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-kbl7/igt@gem_workarounds@suspend-resume-context.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-kbl1/igt@gem_workarounds@suspend-resume-context.html>
>         +1 similar issue
>   *
> 
>     igt@gen9_exec_parse@allowed-all:
> 
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-glk5/igt@gen9_exec_parse@allowed-all.html>
>         (i915#5566
>         <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>         i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-glk5/igt@gen9_exec_parse@allowed-all.html>
>   *
> 
>     igt@gen9_exec_parse@bb-start-cmd:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-2/igt@gen9_exec_parse@bb-start-cmd.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-5/igt@gen9_exec_parse@bb-start-cmd.html>
>   *
> 
>     igt@i915_module_load@reload:
> 
>       o shard-snb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-snb5/igt@i915_module_load@reload.html>
>         (i915#4528
>         <https://gitlab.freedesktop.org/drm/intel/issues/4528>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-snb7/igt@i915_module_load@reload.html>
>   *
> 
>     igt@i915_pm_backlight@fade_with_suspend:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-5/igt@i915_pm_backlight@fade_with_suspend.html>
>         (i915#3012
>         <https://gitlab.freedesktop.org/drm/intel/issues/3012>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-6/igt@i915_pm_backlight@fade_with_suspend.html>
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@rcs0:
> 
>       o {shard-tglu}: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>         (i915#2681
>         <https://gitlab.freedesktop.org/drm/intel/issues/2681>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>   *
> 
>     igt@i915_pm_rpm@modeset-lpsp:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp.html>
>   *
> 
>     igt@i915_selftest@live@gt_pm:
> 
>       o {shard-tglu}: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-tglu-1/igt@i915_selftest@live@gt_pm.html>
>         (i915#3987
>         <https://gitlab.freedesktop.org/drm/intel/issues/3987>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglu-4/igt@i915_selftest@live@gt_pm.html>
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o shard-snb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-snb4/igt@i915_selftest@live@hangcheck.html>
>         (i915#3921
>         <https://gitlab.freedesktop.org/drm/intel/issues/3921>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-snb4/igt@i915_selftest@live@hangcheck.html>
>   *
> 
>     igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-2/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-6/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html>
>         +19 similar issues
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
> 
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-apl6/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-apl2/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html>
>         +2 similar issues
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/intel/issues/2346>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html>
>         +1 similar issue
>   *
> 
>     igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-4/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         i915#4369
>         <https://gitlab.freedesktop.org/drm/intel/issues/4369>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html>
>   *
> 
>     igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html>
>         (fdo#111314
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111314> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>
>         / i915#4369
>         <https://gitlab.freedesktop.org/drm/intel/issues/4369>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html>
>         +5 similar issues
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
> 
>       o shard-iclb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-iclb1/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html>
>         (i915#2867
>         <https://gitlab.freedesktop.org/drm/intel/issues/2867>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb3/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html>
>   *
> 
>     {igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode}:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         +17 similar issues
>   *
> 
>     igt@kms_invalid_mode@bad-hsync-end:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-1/igt@kms_invalid_mode@bad-hsync-end.html>
>         (i915#4278
>         <https://gitlab.freedesktop.org/drm/intel/issues/4278>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-end.html>
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070>
>         / i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
>   *
> 
>     igt@kms_plane_multiple@atomic-pipe-b-tiling-y:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-2/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#3558 <https://gitlab.freedesktop.org/drm/intel/issues/3558>
>         / i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.html>
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html>
>         +2 similar issues
>   *
> 
>     igt@kms_properties@plane-properties-atomic:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-4/igt@kms_properties@plane-properties-atomic.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-6/igt@kms_properties@plane-properties-atomic.html>
>         +1 similar issue
>   *
> 
>     igt@kms_psr@cursor_blt:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-1/igt@kms_psr@cursor_blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-6/igt@kms_psr@cursor_blt.html>
>         +2 similar issues
>   *
> 
>     igt@kms_psr@psr2_primary_render:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-iclb5/igt@kms_psr@psr2_primary_render.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb2/igt@kms_psr@psr2_primary_render.html>
>         +2 similar issues
>   *
> 
>     igt@perf_pmu@most-busy-idle-check-all@rcs0:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-dg1-19/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
>         (i915#5234
>         <https://gitlab.freedesktop.org/drm/intel/issues/5234>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-dg1-16/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
>   *
> 
>     igt@prime_vgem@basic-write:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-rkl-1/igt@prime_vgem@basic-write.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-rkl-5/igt@prime_vgem@basic-write.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_exec_balancer@parallel-ordering:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html>
>         (i915#6117 <https://gitlab.freedesktop.org/drm/intel/issues/6117>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@rcs0:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html>
>         (i915#2851
>         <https://gitlab.freedesktop.org/drm/intel/issues/2851>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@kms_content_protection@mei_interface:
> 
>       o
> 
>         shard-tglb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-tglb2/igt@kms_content_protection@mei_interface.html>
>         (fdo#109300
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109300>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-tglb2/igt@kms_content_protection@mei_interface.html>
>         (i915#1063 <https://gitlab.freedesktop.org/drm/intel/issues/1063>)
> 
>       o
> 
>         shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-iclb6/igt@kms_content_protection@mei_interface.html>
>         (fdo#109300
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109300>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb2/igt@kms_content_protection@mei_interface.html>
>         (fdo#109300
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109300> /
>         fdo#111066 <https://bugs.freedesktop.org/show_bug.cgi?id=111066>)
> 
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) +2
>         similar issues
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/shard-iclb5/igt@kms_psr2_su@page_flip-nv12.html>
>         (fdo#109642
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>         fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068>
>         / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html>
>         (i915#5939 <https://gitlab.freedesktop.org/drm/intel/issues/5939>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6557 -> IGTPW_7469
> 
> CI-20190529: 20190529
> CI_DRM_11850: 295e0e9b3a5d5ef71096cfac07684be807f5a8c0 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7469: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7469/index.html
> IGT_6557: ac3cdf3a3791fc3521517df2f088bcb8b9560802 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
