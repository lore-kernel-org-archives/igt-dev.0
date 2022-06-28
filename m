Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7BA10E3FB
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 14:41:14 +0000 (UTC)
Message-ID: <d3331846-2a2b-0575-9081-178054ffe5dd@intel.com>
Date: Tue, 28 Jun 2022 15:41:06 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: igt-dev@lists.freedesktop.org,
 "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
References: <20220627161004.70153-1-matthew.auld@intel.com>
 <165639157887.14502.11344194182770079652@emeril.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <165639157887.14502.11344194182770079652@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_tests/i915/gem=5Feio=3A_fix_ua?=
 =?utf-8?q?f?=
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

On 28/06/2022 05:46, Patchwork wrote:
> *Patch Details*
> *Series:*	series starting with [i-g-t,1/3] tests/i915/gem_eio: fix uaf
> *URL:*	https://patchwork.freedesktop.org/series/105676/ 
> <https://patchwork.freedesktop.org/series/105676/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11813_full -> IGTPW_7398_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7398_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7398_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/index.html
> 
> 
>     Participating hosts (13 -> 10)
> 
> Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_7398_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x512:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb3/igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x512.html>
>         +5 similar issues
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor@toggle:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html>
>         +2 similar issues
> 
> 

Unrelated to the series it seems.


>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     igt@kms_atomic@plane-invalid-params-fence:
> 
>       o {shard-dg1}: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-dg1-16/igt@kms_atomic@plane-invalid-params-fence.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x170:
> 
>       o {shard-dg1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-dg1-12/igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x170.html>
>         +15 similar issues
>   *
> 
>     igt@kms_sequence@get-busy@hdmi-a-1-pipe-b:
> 
>       o {shard-dg1}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-dg1-13/igt@kms_sequence@get-busy@hdmi-a-1-pipe-b.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-dg1-16/igt@kms_sequence@get-busy@hdmi-a-1-pipe-b.html>
>         +3 similar issues
>   *
> 
>     igt@perf_pmu@module-unload:
> 
>       o {shard-tglu}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-tglu-5/igt@perf_pmu@module-unload.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglu-4/igt@perf_pmu@module-unload.html>
> 
> 
>     New tests
> 
> New tests have been introduced between CI_DRM_11813_full and 
> IGTPW_7398_full:
> 
> 
>       New IGT tests (4)
> 
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.54] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.45] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.44] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-d-hdmi-a-3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.47] s
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_7398_full that come from known issues:
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
>       o shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl4/igt@gem_create@create-massive.html>
>         (i915#4991 <https://gitlab.freedesktop.org/drm/intel/issues/4991>)
>   *
> 
>     igt@gem_ctx_exec@basic-nohangcheck:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html>
>         (i915#6268 <https://gitlab.freedesktop.org/drm/intel/issues/6268>)
>   *
> 
>     igt@gem_ctx_isolation@preservation-s3@vcs0:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         +2 similar issues
>   *
> 
>     igt@gem_exec_balancer@parallel:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb1/igt@gem_exec_balancer@parallel.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb3/igt@gem_exec_balancer@parallel.html>
>         (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl7/igt@gem_exec_fair@basic-deadline.html>
>         (i915#6141 <https://gitlab.freedesktop.org/drm/intel/issues/6141>)
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl2/igt@gem_exec_fair@basic-deadline.html>
>         (i915#6141 <https://gitlab.freedesktop.org/drm/intel/issues/6141>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb3/igt@gem_exec_fair@basic-deadline.html>
>         (i915#6141 <https://gitlab.freedesktop.org/drm/intel/issues/6141>)
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk2/igt@gem_exec_fair@basic-deadline.html>
>         (i915#6141 <https://gitlab.freedesktop.org/drm/intel/issues/6141>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb3/igt@gem_exec_fair@basic-deadline.html>
>         (i915#6141 <https://gitlab.freedesktop.org/drm/intel/issues/6141>)
> 
>   *
> 
>     igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-none@vecs0:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +1
>         similar issue
>   *
> 
>     igt@gem_exec_fair@basic-pace@bcs0:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb3/igt@gem_exec_fair@basic-pace@bcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb7/igt@gem_exec_fair@basic-pace@bcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@vcs0:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-verify:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl4/igt@gem_lmem_swapping@parallel-random-verify.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3
>         similar issues
>   *
> 
>     igt@gem_lmem_swapping@random-engines:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl3/igt@gem_lmem_swapping@random-engines.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>   *
> 
>     igt@gem_pread@exhaustion:
> 
>       o shard-apl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl3/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>   *
> 
>     igt@gem_pxp@reject-modify-context-protection-on:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb1/igt@gem_pxp@reject-modify-context-protection-on.html>
>         (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>   *
> 
>     igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb3/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html>
>         (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>)
>         +1 similar issue
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html>
>         (i915#4281 <https://gitlab.freedesktop.org/drm/intel/issues/4281>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb6/igt@i915_pm_dc@dc9-dpms.html>
>         (i915#4281 <https://gitlab.freedesktop.org/drm/intel/issues/4281>)
> 
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-tglb5/igt@i915_pm_rc6_residency@rc6-idle.html>
>         -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle.html>
>         (i915#2681 <https://gitlab.freedesktop.org/drm/intel/issues/2681>)
>   *
> 
>     igt@i915_pm_rpm@pm-caching:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-snb6/igt@i915_pm_rpm@pm-caching.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +64
>         similar issues
>   *
> 
>     igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html>
>         (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb5/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-addfb-size-overflow:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk7/igt@kms_big_fb@4-tiled-addfb-size-overflow.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +66
>         similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-glk7/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk9/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>         (i915#1888
>         <https://gitlab.freedesktop.org/drm/intel/issues/1888> /
>         i915#5138 <https://gitlab.freedesktop.org/drm/intel/issues/5138>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb3/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>         (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>         (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>)
> 
>   *
> 
>     igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk5/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +3
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +3
>         similar issues
> 
>   *
> 
>     igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb7/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
>   *
> 
>     igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb7/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +1
>         similar issue
>   *
> 
>     igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl1/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +3
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb7/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +8
>         similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb1/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs.html>
>         (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
> 
>   *
> 
>     igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +5
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb1/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +2
>         similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-edid-read:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-snb7/igt@kms_chamelium@hdmi-edid-read.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +3
>         similar issues
>   *
> 
>     igt@kms_chamelium@vga-hpd-without-ddc:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl1/igt@kms_chamelium@vga-hpd-without-ddc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +3
>         similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb7/igt@kms_chamelium@vga-hpd-without-ddc.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +3
>         similar issues
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk9/igt@kms_chamelium@vga-hpd-without-ddc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +4
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb7/igt@kms_chamelium@vga-hpd-without-ddc.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +3
>         similar issues
> 
>   *
> 
>     igt@kms_color@pipe-d-ctm-green-to-red:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb6/igt@kms_color@pipe-d-ctm-green-to-red.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         i915#1149 <https://gitlab.freedesktop.org/drm/intel/issues/1149>)
>   *
> 
>     igt@kms_color_chamelium@pipe-a-degamma:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl6/igt@kms_color_chamelium@pipe-a-degamma.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +9
>         similar issues
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb2/igt@kms_content_protection@atomic-dpms.html>
>         (i915#1063 <https://gitlab.freedesktop.org/drm/intel/issues/1063>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb7/igt@kms_content_protection@atomic-dpms.html>
>         (fdo#109300
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109300> /
>         fdo#111066 <https://bugs.freedesktop.org/show_bug.cgi?id=111066>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl4/igt@kms_content_protection@atomic-dpms.html>
>         (i915#1319
>         <https://gitlab.freedesktop.org/drm/intel/issues/1319>) +1
>         similar issue
> 
>       o
> 
>         shard-apl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl7/igt@kms_content_protection@atomic-dpms.html>
>         (i915#1319 <https://gitlab.freedesktop.org/drm/intel/issues/1319>)
> 
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x512:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb6/igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x512.html>
>         (i915#3359
>         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +7
>         similar issues
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb6/igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10.html>
>         (i915#4462
>         <https://gitlab.freedesktop.org/drm/intel/issues/4462>) +7
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb3/igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10.html>
>         (i915#4462
>         <https://gitlab.freedesktop.org/drm/intel/issues/4462>) +5
>         similar issues
> 
>   *
> 
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>         (i915#72 <https://gitlab.freedesktop.org/drm/intel/issues/72>)
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html>
>         (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank-interruptible:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb5/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +2
>         similar issues
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb5/igt@kms_flip@2x-flip-vs-expired-vblank.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +1
>         similar issue
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
> 
>       o shard-apl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         +1 similar issue
>   *
> 
>     igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-apl3/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         +2 similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html>
>         (i915#4911 <https://gitlab.freedesktop.org/drm/intel/issues/4911>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (i915#1888
>         <https://gitlab.freedesktop.org/drm/intel/issues/1888> /
>         i915#2546
>         <https://gitlab.freedesktop.org/drm/intel/issues/2546>) +1
>         similar issue
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +3
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html>
>         (i915#1888
>         <https://gitlab.freedesktop.org/drm/intel/issues/1888> /
>         i915#2546 <https://gitlab.freedesktop.org/drm/intel/issues/2546>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +5
>         similar issues
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html>
>         (i915#433 <https://gitlab.freedesktop.org/drm/intel/issues/433>)
>   *
> 
>     igt@kms_hdr@bpc-switch@pipe-a-dp-1:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-kbl1/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl6/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html>
>         (i915#1188 <https://gitlab.freedesktop.org/drm/intel/issues/1188>)
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
> 
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> / i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> / i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>   *
> 
>     igt@kms_plane_cursor@pipe-d-overlay-size-64:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl7/igt@kms_plane_cursor@pipe-d-overlay-size-64.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +54
>         similar issues
>   *
> 
>     igt@kms_plane_multiple@atomic-pipe-c-tiling-4:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-c-tiling-4.html>
>         (i915#5288 <https://gitlab.freedesktop.org/drm/intel/issues/5288>)
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +2
>         similar issues
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1
>         similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +2
>         similar issues
> 
>   *
> 
>     igt@kms_psr@cursor_render:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl4/igt@kms_psr@cursor_render.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +129
>         similar issues
>   *
> 
>     igt@kms_psr@psr2_primary_page_flip:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +1
>         similar issue
>   *
> 
>     igt@kms_vblank@pipe-a-accuracy-idle:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk9/igt@kms_vblank@pipe-a-accuracy-idle.html>
>         (i915#43 <https://gitlab.freedesktop.org/drm/intel/issues/43>)
>   *
> 
>     igt@kms_writeback@writeback-invalid-parameters:
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk8/igt@kms_writeback@writeback-invalid-parameters.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb8/igt@kms_writeback@writeback-invalid-parameters.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
> 
>   *
> 
>     igt@nouveau_crc@pipe-c-source-outp-inactive:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb2/igt@nouveau_crc@pipe-c-source-outp-inactive.html>
>         (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb8/igt@nouveau_crc@pipe-c-source-outp-inactive.html>
>         (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
> 
>   *
> 
>     igt@prime_nv_pcopy@test1_macro:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb6/igt@prime_nv_pcopy@test1_macro.html>
>         (fdo#109291
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109291>) +1
>         similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb5/igt@prime_nv_pcopy@test1_macro.html>
>         (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
> 
>   *
> 
>     igt@sysfs_clients@recycle:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl7/igt@sysfs_clients@recycle.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
>   *
> 
>     igt@sysfs_clients@split-50:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb6/igt@sysfs_clients@split-50.html>
>         (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk9/igt@sysfs_clients@split-50.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb2/igt@sysfs_clients@split-50.html>
>         (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl3/igt@sysfs_clients@split-50.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@fbdev@pan:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-1/igt@fbdev@pan.html>
>         (i915#2582
>         <https://gitlab.freedesktop.org/drm/intel/issues/2582>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-1/igt@fbdev@pan.html>
>         +1 similar issue
>   *
> 
>     igt@gem_ctx_persistence@legacy-engines-hang@vebox:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-dg1-15/igt@gem_ctx_persistence@legacy-engines-hang@vebox.html>
>         (i915#4883
>         <https://gitlab.freedesktop.org/drm/intel/issues/4883>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-dg1-18/igt@gem_ctx_persistence@legacy-engines-hang@vebox.html>
>   *
> 
>     igt@gem_eio@in-flight-contexts-immediate:
> 
>       o {shard-rkl}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-1/igt@gem_eio@in-flight-contexts-immediate.html>
>         (i915#3063
>         <https://gitlab.freedesktop.org/drm/intel/issues/3063>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-2/igt@gem_eio@in-flight-contexts-immediate.html>
>         +1 similar issue
>   *
> 
>     igt@gem_eio@in-flight-immediate:
> 
>       o shard-tglb: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-tglb5/igt@gem_eio@in-flight-immediate.html>
>         (i915#3063
>         <https://gitlab.freedesktop.org/drm/intel/issues/3063>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb5/igt@gem_eio@in-flight-immediate.html>
>   *
> 
>     igt@gem_eio@kms:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-tglb1/igt@gem_eio@kms.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/intel/issues/5784>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb7/igt@gem_eio@kms.html>
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o
> 
>         shard-iclb: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb2/igt@gem_eio@unwedge-stress.html>
>         (i915#3070
>         <https://gitlab.freedesktop.org/drm/intel/issues/3070>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb5/igt@gem_eio@unwedge-stress.html>
> 
>       o
> 
>         {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-dg1-17/igt@gem_eio@unwedge-stress.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/intel/issues/5784>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-dg1-16/igt@gem_eio@unwedge-stress.html>
> 
>       o
> 
>         {shard-tglu}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-tglu-3/igt@gem_eio@unwedge-stress.html>
>         (i915#3063
>         <https://gitlab.freedesktop.org/drm/intel/issues/3063>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglu-6/igt@gem_eio@unwedge-stress.html>
> 
>   *
> 
>     igt@gem_exec_balancer@fairslice:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-5/igt@gem_exec_balancer@fairslice.html>
>         (i915#6259
>         <https://gitlab.freedesktop.org/drm/intel/issues/6259>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-6/igt@gem_exec_balancer@fairslice.html>
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb2/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>   *
> 
>     igt@gem_exec_fair@basic-none-share@rcs0:
> 
>       o
> 
>         {shard-tglu}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-tglu-3/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglu-3/igt@gem_exec_fair@basic-none-share@rcs0.html>
> 
>       o
> 
>         shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html>
> 
>   *
> 
>     igt@gem_exec_fair@basic-none@rcs0:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-kbl7/igt@gem_exec_fair@basic-none@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html>
>         +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-none@vcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk1/igt@gem_exec_fair@basic-none@vcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>       o {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-1/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-5/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace@vcs1:
> 
>       o shard-kbl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html>
>   *
> 
>     igt@gem_exec_reloc@basic-range-active:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-2/igt@gem_exec_reloc@basic-range-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-5/igt@gem_exec_reloc@basic-range-active.html>
>         +4 similar issues
>   *
> 
>     igt@gem_exec_whisper@basic-queues-forked-all:
> 
>       o shard-iclb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb2/igt@gem_exec_whisper@basic-queues-forked-all.html>
>         (i915#5304
>         <https://gitlab.freedesktop.org/drm/intel/issues/5304> /
>         i915#5498
>         <https://gitlab.freedesktop.org/drm/intel/issues/5498>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb7/igt@gem_exec_whisper@basic-queues-forked-all.html>
>   *
> 
>     igt@gem_readwrite@write-bad-handle:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-2/igt@gem_readwrite@write-bad-handle.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-5/igt@gem_readwrite@write-bad-handle.html>
>   *
> 
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled@lmem0:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-dg1-19/igt@gem_render_copy@y-tiled-ccs-to-y-tiled@lmem0.html>
>         (i915#4842
>         <https://gitlab.freedesktop.org/drm/intel/issues/4842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-dg1-15/igt@gem_render_copy@y-tiled-ccs-to-y-tiled@lmem0.html>
>         +13 similar issues
>   *
> 
>     igt@gen9_exec_parse@allowed-all:
> 
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-glk6/igt@gen9_exec_parse@allowed-all.html>
>         (i915#5566
>         <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>         i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk3/igt@gen9_exec_parse@allowed-all.html>
>         +1 similar issue
>   *
> 
>     igt@gen9_exec_parse@batch-invalid-length:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-1/igt@gen9_exec_parse@batch-invalid-length.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html>
>         +1 similar issue
>   *
> 
>     igt@i915_pm_dc@dc5-psr:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-5/igt@i915_pm_dc@dc5-psr.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-6/igt@i915_pm_dc@dc5-psr.html>
>         +1 similar issue
>   *
> 
>     igt@i915_pm_rpm@cursor-dpms:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-5/igt@i915_pm_rpm@cursor-dpms.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-6/igt@i915_pm_rpm@cursor-dpms.html>
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o shard-tglb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-tglb5/igt@i915_selftest@live@hangcheck.html>
>         (i915#5591
>         <https://gitlab.freedesktop.org/drm/intel/issues/5591>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-tglb7/igt@i915_selftest@live@hangcheck.html>
>   *
> 
>     igt@kms_color@pipe-a-ctm-0-75:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-1/igt@kms_color@pipe-a-ctm-0-75.html>
>         (i915#1149
>         <https://gitlab.freedesktop.org/drm/intel/issues/1149> /
>         i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>
>         / i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-6/igt@kms_color@pipe-a-ctm-0-75.html>
>         +1 similar issue
>   *
> 
>     igt@kms_color@pipe-c-invalid-ctm-matrix-sizes:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-1/igt@kms_color@pipe-c-invalid-ctm-matrix-sizes.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-5/igt@kms_color@pipe-c-invalid-ctm-matrix-sizes.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
> 
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-kbl7/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl6/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html>
>         +4 similar issues
>   *
> 
>     igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html>
>         (fdo#111314
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111314> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>
>         / i915#4369
>         <https://gitlab.freedesktop.org/drm/intel/issues/4369>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html>
>         +3 similar issues
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html>
>         +1 similar issue
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (i915#3701
>         <https://gitlab.freedesktop.org/drm/intel/issues/3701>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html>
>         +26 similar issues
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-kbl3/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html>
>         (i915#1188
>         <https://gitlab.freedesktop.org/drm/intel/issues/1188>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-kbl3/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html>
>   *
> 
>     igt@kms_invalid_mode@zero-clock:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-5/igt@kms_invalid_mode@zero-clock.html>
>         (i915#4278
>         <https://gitlab.freedesktop.org/drm/intel/issues/4278>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-6/igt@kms_invalid_mode@zero-clock.html>
>         +1 similar issue
>   *
> 
>     igt@kms_mmap_write_crc@main:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-dg1-18/igt@kms_mmap_write_crc@main.html>
>         (i915#5303
>         <https://gitlab.freedesktop.org/drm/intel/issues/5303>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-dg1-15/igt@kms_mmap_write_crc@main.html>
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-b-constant-alpha-min:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-min.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070>
>         / i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-min.html>
>   *
> 
>     igt@kms_psr@cursor_mmap_cpu:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-5/igt@kms_psr@cursor_mmap_cpu.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-6/igt@kms_psr@cursor_mmap_cpu.html>
>         +2 similar issues
>   *
> 
>     igt@kms_psr@psr2_sprite_mmap_gtt:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html>
>         +3 similar issues
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#5461
>         <https://gitlab.freedesktop.org/drm/intel/issues/5461>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak-pipe-b:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-2/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070>
>         / i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html>
>   *
> 
>     igt@kms_vblank@pipe-a-wait-forked-busy-hang:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-5/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-6/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html>
>         +25 similar issues
>   *
> 
>     igt@kms_vblank@pipe-b-ts-continuation-suspend:
> 
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-apl8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>   *
> 
>     igt@perf@gen12-mi-rpc:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-5/igt@perf@gen12-mi-rpc.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-2/igt@perf@gen12-mi-rpc.html>
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-rkl-1/igt@prime_vgem@basic-fence-read.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-rkl-5/igt@prime_vgem@basic-fence-read.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_exec_balancer@parallel-ordering:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html>
>         (i915#6117 <https://gitlab.freedesktop.org/drm/intel/issues/6117>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html>
>         (i915#2680
>         <https://gitlab.freedesktop.org/drm/intel/issues/2680> /
>         i915#2684
>         <https://gitlab.freedesktop.org/drm/intel/issues/2684>) -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html>
>         (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-iclb8/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@runner@aborted:
> 
>       o shard-apl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-apl4/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-apl8/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11813/shard-apl4/igt@runner@aborted.html>)
>         (i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>
>         / i915#5257
>         <https://gitlab.freedesktop.org/drm/intel/issues/5257>) -> (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl8/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl8/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/shard-apl8/igt@runner@aborted.html>)
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>
>         / i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>
>         / i915#5257 <https://gitlab.freedesktop.org/drm/intel/issues/5257>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6542 -> IGTPW_7398
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_11813: 650ceff1f00b3be875397326625c0a90fa8ee42b @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7398: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7398/index.html
> IGT_6542: d38a476ee4b9f9a95d8f452de0d66cc52f7f079b @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
