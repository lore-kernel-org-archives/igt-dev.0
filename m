Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3029D10E0C8
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 06:43:32 +0000 (UTC)
Message-ID: <65f18ec5-b5f9-0452-6ab9-681271bcdb6a@linux.intel.com>
Date: Wed, 6 Sep 2023 08:43:27 +0200
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20230905150225.2029554-1-marcin.bernatowicz@linux.intel.com>
 <169394891495.19169.14702649077482278396@emeril.freedesktop.org>
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <169394891495.19169.14702649077482278396@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL3hl?=
 =?utf-8?q?=5Fspin=3A_introduced_fixed_duration_xe=5Fspin_=28rev2=29?=
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



On 9/5/2023 11:21 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	lib/xe_spin: introduced fixed duration xe_spin (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/122624/ 
> <https://patchwork.freedesktop.org/series/122624/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_13599_full -> IGTPW_9723_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_9723_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_9723_full, please notify your bug team 
> (lgci.bug.filing@intel.com) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/index.html
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
> IGTPW_9723_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_prime@basic-crc-vgem@second-to-first:
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-6/igt@kms_prime@basic-crc-vgem@second-to-first.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-8/igt@kms_prime@basic-crc-vgem@second-to-first.html> +1 other test fail
> 

Unrelated to the change.

--
Marcin
> 
>     New tests
> 
> New tests have been introduced between CI_DRM_13599_full and 
> IGTPW_9723_full:
> 
> 
>       New IGT tests (1)
> 
>   * igt@gen9_exec_parse:
>       o Statuses :
>       o Exec time: [None] s
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_9723_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@drm_fdinfo@virtual-busy-all:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-5/igt@drm_fdinfo@virtual-busy-all.html> (i915#8414 <https://gitlab.freedesktop.org/drm/intel/issues/8414>) +1 other test skip
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-8/igt@drm_fdinfo@virtual-busy-all.html> (i915#8414 <https://gitlab.freedesktop.org/drm/intel/issues/8414>)
> 
>   *
> 
>     igt@feature_discovery@psr1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-5/igt@feature_discovery@psr1.html> (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +2 other tests skip
>   *
> 
>     igt@feature_discovery@psr2:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-3/igt@feature_discovery@psr2.html> (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@gem_basic@multigpu-create-close:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-7/igt@gem_basic@multigpu-create-close.html> (i915#7697 <https://gitlab.freedesktop.org/drm/intel/issues/7697>) +1 other test skip
>   *
> 
>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html> (i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098> / i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>)
>   *
> 
>     igt@gem_close_race@multigpu-basic-threads:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-1/igt@gem_close_race@multigpu-basic-threads.html> (i915#7697 <https://gitlab.freedesktop.org/drm/intel/issues/7697>) +1 other test skip
>   *
> 
>     igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>       o shard-snb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-snb1/igt@gem_ctx_isolation@preservation-s3@rcs0.html> (i915#8841 <https://gitlab.freedesktop.org/drm/intel/issues/8841>) +7 other tests dmesg-warn
>   *
> 
>     igt@gem_ctx_persistence@engines-hang@vcs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-1/igt@gem_ctx_persistence@engines-hang@vcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-3/igt@gem_ctx_persistence@engines-hang@vcs0.html> (i915#2410 <https://gitlab.freedesktop.org/drm/intel/issues/2410>)
>   *
> 
>     igt@gem_ctx_persistence@engines-mixed:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-snb4/igt@gem_ctx_persistence@engines-mixed.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>   *
> 
>     igt@gem_ctx_persistence@heartbeat-hostile:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-2/igt@gem_ctx_persistence@heartbeat-hostile.html> (i915#8555 <https://gitlab.freedesktop.org/drm/intel/issues/8555>) +1 other test skip
>   *
> 
>     igt@gem_ctx_sseu@invalid-sseu:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@gem_ctx_sseu@invalid-sseu.html> (i915#280 <https://gitlab.freedesktop.org/drm/intel/issues/280>) +1 other test skip
>   *
> 
>     igt@gem_eio@hibernate:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg2-11/igt@gem_eio@hibernate.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-6/igt@gem_eio@hibernate.html> (i915#7975 <https://gitlab.freedesktop.org/drm/intel/issues/7975> / i915#8213 <https://gitlab.freedesktop.org/drm/intel/issues/8213>)
>   *
> 
>     igt@gem_eio@in-flight-contexts-1us:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-2/igt@gem_eio@in-flight-contexts-1us.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-7/igt@gem_eio@in-flight-contexts-1us.html> (i915#8503 <https://gitlab.freedesktop.org/drm/intel/issues/8503>)
>   *
> 
>     igt@gem_eio@reset-stress:
> 
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-snb5/igt@gem_eio@reset-stress.html> (i915#8898 <https://gitlab.freedesktop.org/drm/intel/issues/8898>)
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg1-14/igt@gem_eio@unwedge-stress.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-15/igt@gem_eio@unwedge-stress.html> (i915#5784 <https://gitlab.freedesktop.org/drm/intel/issues/5784>) +1 other test fail
>   *
> 
>     igt@gem_exec_balancer@parallel-contexts:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-7/igt@gem_exec_balancer@parallel-contexts.html> (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>   *
> 
>     igt@gem_exec_capture@capture-invisible@lmem0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@gem_exec_capture@capture-invisible@lmem0.html> (i915#6334 <https://gitlab.freedesktop.org/drm/intel/issues/6334>) +1 other test skip
>   *
> 
>     igt@gem_exec_capture@pi@vcs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-1/igt@gem_exec_capture@pi@vcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-6/igt@gem_exec_capture@pi@vcs0.html> (i915#4475 <https://gitlab.freedesktop.org/drm/intel/issues/4475>)
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html> (i915#2846 <https://gitlab.freedesktop.org/drm/intel/issues/2846>)
>   *
> 
>     igt@gem_exec_fair@basic-pace:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@gem_exec_fair@basic-pace.html> (i915#3539 <https://gitlab.freedesktop.org/drm/intel/issues/3539>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@rcs0:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-snb6/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +261 other tests skip
>   *
> 
>     igt@gem_exec_flush@basic-batch-kernel-default-wb:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-2/igt@gem_exec_flush@basic-batch-kernel-default-wb.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-4/igt@gem_exec_flush@basic-batch-kernel-default-wb.html> (i915#9121 <https://gitlab.freedesktop.org/drm/intel/issues/9121>)
>   *
> 
>     igt@gem_exec_flush@basic-wb-prw-default:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@gem_exec_flush@basic-wb-prw-default.html> (i915#3539 <https://gitlab.freedesktop.org/drm/intel/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/intel/issues/4852>) +3 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-read:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-read.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>)
>   *
> 
>     igt@gem_exec_reloc@basic-write-cpu-noreloc:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-3/igt@gem_exec_reloc@basic-write-cpu-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +1 other test skip
>   *
> 
>     igt@gem_exec_reloc@basic-write-read-active:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@gem_exec_reloc@basic-write-read-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +13 other tests skip
>   *
> 
>     igt@gem_exec_schedule@preempt-queue:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-1/igt@gem_exec_schedule@preempt-queue.html> (i915#4537 <https://gitlab.freedesktop.org/drm/intel/issues/4537> / i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>)
>   *
> 
>     igt@gem_exec_suspend@basic-s4-devices@lmem0:
> 
>       o shard-dg2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-5/igt@gem_exec_suspend@basic-s4-devices@lmem0.html> (i915#7975 <https://gitlab.freedesktop.org/drm/intel/issues/7975> / i915#8213 <https://gitlab.freedesktop.org/drm/intel/issues/8213>)
>   *
> 
>     igt@gem_exec_suspend@basic-s4-devices@smem:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-tglu-8/igt@gem_exec_suspend@basic-s4-devices@smem.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices@smem.html> (i915#7975 <https://gitlab.freedesktop.org/drm/intel/issues/7975> / i915#8213 <https://gitlab.freedesktop.org/drm/intel/issues/8213>)
>   *
> 
>     igt@gem_fence_thrash@bo-write-verify-threaded-none:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-2/igt@gem_fence_thrash@bo-write-verify-threaded-none.html> (i915#4860 <https://gitlab.freedesktop.org/drm/intel/issues/4860>)
>   *
> 
>     igt@gem_fenced_exec_thrash@too-many-fences:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-6/igt@gem_fenced_exec_thrash@too-many-fences.html> (i915#4860 <https://gitlab.freedesktop.org/drm/intel/issues/4860>) +2 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-6/igt@gem_lmem_swapping@heavy-verify-multi.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@parallel-random:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-2/igt@gem_lmem_swapping@parallel-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1 other test skip
>   *
> 
>     igt@gem_lmem_swapping@smem-oom:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-4/igt@gem_lmem_swapping@smem-oom.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1 other test skip
>   *
> 
>     igt@gem_mmap_gtt@cpuset-big-copy:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-7/igt@gem_mmap_gtt@cpuset-big-copy.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 other test skip
>   *
> 
>     igt@gem_mmap_gtt@zero-extend:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-2/igt@gem_mmap_gtt@zero-extend.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +10 other tests skip
>   *
> 
>     igt@gem_mmap_wc@bad-object:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-2/igt@gem_mmap_wc@bad-object.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>) +2 other tests skip
>   *
> 
>     igt@gem_mmap_wc@close:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-6/igt@gem_mmap_wc@close.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
>   *
> 
>     igt@gem_pxp@display-protected-crc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@gem_pxp@display-protected-crc.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +3 other tests skip
>   *
> 
>     igt@gem_pxp@reject-modify-context-protection-on:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-4/igt@gem_pxp@reject-modify-context-protection-on.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>   *
> 
>     igt@gem_pxp@verify-pxp-stale-buf-execution:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-7/igt@gem_pxp@verify-pxp-stale-buf-execution.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +1 other test skip
>   *
> 
>     igt@gem_readwrite@beyond-eob:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-1/igt@gem_readwrite@beyond-eob.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +3 other tests skip
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-6/igt@gem_readwrite@beyond-eob.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +1 other test skip
> 
>   *
> 
>     igt@gem_set_tiling_vs_pwrite:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-1/igt@gem_set_tiling_vs_pwrite.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>)
>   *
> 
>     igt@gem_softpin@noreloc-s3:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-1/igt@gem_softpin@noreloc-s3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-6/igt@gem_softpin@noreloc-s3.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>   *
> 
>     igt@gem_userptr_blits@create-destroy-unsync:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-11/igt@gem_userptr_blits@create-destroy-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>) +2 other tests skip
>   *
> 
>     igt@gem_userptr_blits@nohangcheck:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-8/igt@gem_userptr_blits@nohangcheck.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-4/igt@gem_userptr_blits@nohangcheck.html> (i915#6268 <https://gitlab.freedesktop.org/drm/intel/issues/6268>)
>   *
> 
>     igt@gen7_exec_parse@cmd-crossing-page:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-8/igt@gen7_exec_parse@cmd-crossing-page.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>   *
> 
>     igt@gen7_exec_parse@load-register-reg:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-1/igt@gen7_exec_parse@load-register-reg.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>   *
> 
>     igt@gen9_exec_parse@cmd-crossing-page:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@gen9_exec_parse@cmd-crossing-page.html> (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>   *
> 
>     igt@gen9_exec_parse@unaligned-access:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-4/igt@gen9_exec_parse@unaligned-access.html> (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>   *
> 
>     igt@i915_module_load@load:
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-3/igt@i915_module_load@load.html> (i915#6227 <https://gitlab.freedesktop.org/drm/intel/issues/6227>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-2/igt@i915_module_load@load.html> (i915#6227 <https://gitlab.freedesktop.org/drm/intel/issues/6227>)
> 
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-dg2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html> (i915#7061 <https://gitlab.freedesktop.org/drm/intel/issues/7061> / i915#8617 <https://gitlab.freedesktop.org/drm/intel/issues/8617>)
>   *
> 
>     igt@i915_pm_dc@dc6-dpms:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-3/igt@i915_pm_dc@dc6-dpms.html> (i915#3989 <https://gitlab.freedesktop.org/drm/intel/issues/3989> / i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>   *
> 
>     igt@i915_pm_rpm@dpms-lpsp:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-18/igt@i915_pm_rpm@dpms-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) +2 other tests skip
>   *
> 
>     igt@i915_pm_rpm@dpms-mode-unset-lpsp:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-1/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>   *
> 
>     igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o
> 
>         shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg2-11/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html> (fdo#111644 <https://bugs.freedesktop.org/show_bug.cgi?id=111644> / i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
> 
>   *
> 
>     igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-rkl-6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>   *
> 
>     igt@i915_pm_rps@min-max-config-idle:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@i915_pm_rps@min-max-config-idle.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>   *
> 
>     igt@i915_pm_rps@thresholds-park@gt0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@i915_pm_rps@thresholds-park@gt0.html> (i915#8925 <https://gitlab.freedesktop.org/drm/intel/issues/8925>)
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html> (i915#2521 <https://gitlab.freedesktop.org/drm/intel/issues/2521>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-16/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs.html> (i915#8502 <https://gitlab.freedesktop.org/drm/intel/issues/8502>) +7 other tests skip
>   *
> 
>     igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html> (i915#8247 <https://gitlab.freedesktop.org/drm/intel/issues/8247>) +3 other tests fail
>   *
> 
>     igt@kms_async_flips@crc@pipe-b-hdmi-a-3:
> 
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-12/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html> (i915#8247 <https://gitlab.freedesktop.org/drm/intel/issues/8247>) +3 other tests fail
>   *
> 
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html> (i915#404 <https://gitlab.freedesktop.org/drm/intel/issues/404>)
> 
>       o
> 
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-17/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html> (i915#404 <https://gitlab.freedesktop.org/drm/intel/issues/404>)
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +5 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-0:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html> (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (i915#3743 <https://gitlab.freedesktop.org/drm/intel/issues/3743>) +2 other tests fail
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-270:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-1/igt@kms_big_fb@linear-32bpp-rotate-270.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>   *
> 
>     igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0.html> (i915#1982 <https://gitlab.freedesktop.org/drm/intel/issues/1982>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (i915#3743 <https://gitlab.freedesktop.org/drm/intel/issues/3743>)
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-90:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-16/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html> (i915#3638 <https://gitlab.freedesktop.org/drm/intel/issues/3638>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +11 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html> (i915#4538 <https://gitlab.freedesktop.org/drm/intel/issues/4538> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html> (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>)
> 
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +3 other tests skip
>   *
> 
>     igt@kms_big_joiner@invalid-modeset:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-2/igt@kms_big_joiner@invalid-modeset.html> (i915#2705 <https://gitlab.freedesktop.org/drm/intel/issues/2705>)
>   *
> 
>     igt@kms_ccs@pipe-a-bad-aux-stride-yf_tiled_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-5/igt@kms_ccs@pipe-a-bad-aux-stride-yf_tiled_ccs.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> / i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +2 other tests skip
>   *
> 
>     igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-1/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +7 other tests skip
>   *
> 
>     igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs.html> (i915#3734 <https://gitlab.freedesktop.org/drm/intel/issues/3734> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>   *
> 
>     igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-11/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +14 other tests skip
>   *
> 
>     igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-1/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs.html> (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +12 other tests skip
>   *
> 
>     igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-4/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +5 other tests skip
>   *
> 
>     igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>       o
> 
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-16/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-5/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html> (i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
> 
>   *
> 
>     igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-2/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +6 other tests skip
>   *
> 
>     igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-19/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>   *
> 
>     igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-2/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>   *
> 
>     igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_mc_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-8/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_mc_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +3 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html> (i915#4087 <https://gitlab.freedesktop.org/drm/intel/issues/4087> / i915#7213 <https://gitlab.freedesktop.org/drm/intel/issues/7213>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-0-75:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-5/igt@kms_chamelium_color@ctm-0-75.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>   *
> 
>     igt@kms_chamelium_color@ctm-green-to-red:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@kms_chamelium_color@ctm-green-to-red.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-7/igt@kms_chamelium_color@ctm-green-to-red.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>   *
> 
>     igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-2/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +10 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-10/igt@kms_chamelium_hpd@hdmi-hpd.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>)
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +4 other tests skip
>   *
> 
>     igt@kms_color@deep-color:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-2/igt@kms_color@deep-color.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +2 other tests skip
>   *
> 
>     igt@kms_content_protection@dp-mst-type-0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-11/igt@kms_content_protection@dp-mst-type-0.html> (i915#3299 <https://gitlab.freedesktop.org/drm/intel/issues/3299>)
>   *
> 
>     igt@kms_content_protection@lic:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-7/igt@kms_content_protection@lic.html> (i915#6944 <https://gitlab.freedesktop.org/drm/intel/issues/6944>)
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-6/igt@kms_content_protection@srm.html> (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>) +2 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-edp-1:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-edp-1.html> (i915#8787 <https://gitlab.freedesktop.org/drm/intel/issues/8787>) +1 other test fail
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html> (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-max-size.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +3 other tests skip
>   *
> 
>     igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-1:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-glk8/igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-1.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-glk8/igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-1.html> (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>)
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>)
>   *
> 
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html> (i915#3546 <https://gitlab.freedesktop.org/drm/intel/issues/3546>)
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>)
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +3 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html> (fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>) +1 other test fail
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>       o
> 
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-12/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>)
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html> (i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>)
> 
>   *
> 
>     igt@kms_cursor_legacy@single-bo@all-pipes:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-3/igt@kms_cursor_legacy@single-bo@all-pipes.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-4/igt@kms_cursor_legacy@single-bo@all-pipes.html> (i915#2017 <https://gitlab.freedesktop.org/drm/intel/issues/2017>)
>   *
> 
>     igt@kms_draw_crc@draw-method-mmap-wc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-wc.html> (i915#8812 <https://gitlab.freedesktop.org/drm/intel/issues/8812>)
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-1/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/intel/issues/3840>)
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-2/igt@kms_fbcon_fbt@psr.html> (i915#3469 <https://gitlab.freedesktop.org/drm/intel/issues/3469>)
>   *
> 
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-7/igt@kms_flip@2x-blocking-absolute-wf_vblank.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html> (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-snb5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +3 other tests skip
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@c-dp1:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html> (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>   *
> 
>     igt@kms_flip@flip-vs-fences-interruptible:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-5/igt@kms_flip@flip-vs-fences-interruptible.html> (i915#8381 <https://gitlab.freedesktop.org/drm/intel/issues/8381>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8810 <https://gitlab.freedesktop.org/drm/intel/issues/8810>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +22 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html> (i915#8708 <https://gitlab.freedesktop.org/drm/intel/issues/8708>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +36 other tests skip
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html> (fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825> / i915#1825 <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +4 other tests skip
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html> (i915#1825 <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html> (fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html> (i915#3458 <https://gitlab.freedesktop.org/drm/intel/issues/3458>) +14 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html> (i915#3023 <https://gitlab.freedesktop.org/drm/intel/issues/3023>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html> (fdo#110189 <https://bugs.freedesktop.org/show_bug.cgi?id=110189>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/intel/issues/8708>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html> (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +4 other tests skip
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend:
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-2/igt@kms_hdr@bpc-switch-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/intel/issues/8228>)
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@kms_hdr@bpc-switch-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/intel/issues/8228>)
> 
>   *
> 
>     igt@kms_hdr@invalid-metadata-sizes:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-2/igt@kms_hdr@invalid-metadata-sizes.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/intel/issues/8228>) +2 other tests skip
>   *
> 
>     igt@kms_hdr@static-toggle:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-2/igt@kms_hdr@static-toggle.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/intel/issues/8228>)
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (i915#4816 <https://gitlab.freedesktop.org/drm/intel/issues/4816>)
>   *
> 
>     igt@kms_plane_lowres@tiling-yf:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-4/igt@kms_plane_lowres@tiling-yf.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8821 <https://gitlab.freedesktop.org/drm/intel/issues/8821>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html> (i915#8292 <https://gitlab.freedesktop.org/drm/intel/issues/8292>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-17/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html> (i915#8292 <https://gitlab.freedesktop.org/drm/intel/issues/8292>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-17/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-4.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-dp-4:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-dp-4.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +5 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-c-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-4/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-c-edp-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +23 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +1 other test skip
>   *
> 
>     igt@kms_prime@basic-crc-hybrid:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-2/igt@kms_prime@basic-crc-hybrid.html> (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524> / i915#6805 <https://gitlab.freedesktop.org/drm/intel/issues/6805>) +1 other test skip
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-1/igt@kms_prime@basic-crc-hybrid.html> (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524>)
> 
>   *
> 
>     igt@kms_psr@psr2_sprite_plane_move:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-1/igt@kms_psr@psr2_sprite_plane_move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +5 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-90:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-90.html> (i915#4235 <https://gitlab.freedesktop.org/drm/intel/issues/4235>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> (i915#4235 <https://gitlab.freedesktop.org/drm/intel/issues/4235>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html> (i915#4235 <https://gitlab.freedesktop.org/drm/intel/issues/4235> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> / i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
> 
>   *
> 
>     igt@kms_selftest@drm_format:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-3/igt@kms_selftest@drm_format.html> (i915#8661 <https://gitlab.freedesktop.org/drm/intel/issues/8661>)
>   *
> 
>     igt@kms_selftest@drm_plane:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@kms_selftest@drm_plane.html> (i915#8661 <https://gitlab.freedesktop.org/drm/intel/issues/8661>) +2 other tests skip
> 
>       o
> 
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-snb6/igt@kms_selftest@drm_plane.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#8661 <https://gitlab.freedesktop.org/drm/intel/issues/8661>)
> 
>   *
> 
>     igt@kms_setmode@basic@pipe-a-vga-1:
> 
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-snb5/igt@kms_setmode@basic@pipe-a-vga-1.html> (i915#5465 <https://gitlab.freedesktop.org/drm/intel/issues/5465>) +1 other test fail
>   *
> 
>     igt@kms_sysfs_edid_timing:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg2-11/igt@kms_sysfs_edid_timing.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@kms_sysfs_edid_timing.html> (IGT#2 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (i915#8623 <https://gitlab.freedesktop.org/drm/intel/issues/8623>)
>   *
> 
>     igt@kms_tv_load_detect@load-detect:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-2/igt@kms_tv_load_detect@load-detect.html> (fdo#109309 <https://bugs.freedesktop.org/show_bug.cgi?id=109309>)
>   *
> 
>     igt@kms_vblank@pipe-d-ts-continuation-suspend:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-4/igt@kms_vblank@pipe-d-ts-continuation-suspend.html> (i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> / i915#533 <https://gitlab.freedesktop.org/drm/intel/issues/533> / i915#6768 <https://gitlab.freedesktop.org/drm/intel/issues/6768>)
>   *
> 
>     igt@kms_vrr@flip-basic:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-4/igt@kms_vrr@flip-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +1 other test skip
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-2/igt@kms_writeback@writeback-check-output.html> (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@kms_writeback@writeback-fb-id.html> (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>   *
> 
>     igt@perf@per-context-mode-unprivileged:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-2/igt@perf@per-context-mode-unprivileged.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +3 other tests skip
>   *
> 
>     igt@perf_pmu@busy-double-start@vecs1:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html> (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>) +3 other tests fail
>   *
> 
>     igt@perf_pmu@cpu-hotplug:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@perf_pmu@cpu-hotplug.html> (i915#8850 <https://gitlab.freedesktop.org/drm/intel/issues/8850>)
>   *
> 
>     igt@prime_vgem@basic-fence-mmap:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-4/igt@prime_vgem@basic-fence-mmap.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 other test skip
>   *
> 
>     igt@prime_vgem@basic-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-1/igt@prime_vgem@basic-gtt.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 other test skip
>   *
> 
>     igt@prime_vgem@fence-read-hang:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-11/igt@prime_vgem@fence-read-hang.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>   *
> 
>     igt@sysfs_heartbeat_interval@precise@vecs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-7/igt@sysfs_heartbeat_interval@precise@vecs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-7/igt@sysfs_heartbeat_interval@precise@vecs0.html> (i915#8332 <https://gitlab.freedesktop.org/drm/intel/issues/8332>)
>   *
> 
>     igt@v3d/v3d_submit_cl@simple-flush-cache:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-2/igt@v3d/v3d_submit_cl@simple-flush-cache.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +10 other tests skip
>   *
> 
>     igt@v3d/v3d_submit_csd@bad-pad:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-4/igt@v3d/v3d_submit_csd@bad-pad.html> (fdo#109315 <https://bugs.freedesktop.org/show_bug.cgi?id=109315>) +1 other test skip
>   *
> 
>     igt@v3d/v3d_submit_csd@multiple-job-submission:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-2/igt@v3d/v3d_submit_csd@multiple-job-submission.html> (fdo#109315 <https://bugs.freedesktop.org/show_bug.cgi?id=109315> / i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +1 other test skip
>   *
> 
>     igt@v3d/v3d_wait_bo@map-bo-0ns:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-4/igt@v3d/v3d_wait_bo@map-bo-0ns.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +1 other test skip
>   *
> 
>     igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-1/igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +2 other tests skip
>   *
> 
>     igt@vc4/vc4_perfmon@get-values-valid-perfmon:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-3/igt@vc4/vc4_perfmon@get-values-valid-perfmon.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>)
>   *
> 
>     igt@vc4/vc4_tiling@set-get:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-1/igt@vc4/vc4_tiling@set-get.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +7 other tests skip
>   *
> 
>     igt@vc4/vc4_wait_bo@unused-bo-0ns:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-tglu-7/igt@vc4/vc4_wait_bo@unused-bo-0ns.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html> (i915#7742 <https://gitlab.freedesktop.org/drm/intel/issues/7742>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html>
>   *
> 
>     igt@gem_ctx_exec@basic-nohangcheck:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html> (i915#6268 <https://gitlab.freedesktop.org/drm/intel/issues/6268>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html>
>   *
> 
>     igt@gem_ctx_param@invalid-size-get:
> 
>       o shard-mtlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-1/igt@gem_ctx_param@invalid-size-get.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-1/igt@gem_ctx_param@invalid-size-get.html>
>   *
> 
>     igt@gem_ctx_persistence@legacy-engines-hostile@vebox:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-3/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html> (i915#2410 <https://gitlab.freedesktop.org/drm/intel/issues/2410>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-6/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html> +2 other tests pass
>   *
> 
>     igt@gem_ctx_persistence@saturated-hostile@vecs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile@vecs0.html> (i915#7816 <https://gitlab.freedesktop.org/drm/intel/issues/7816>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-7/igt@gem_ctx_persistence@saturated-hostile@vecs0.html> +2 other tests pass
>   *
> 
>     igt@gem_eio@in-flight-suspend:
> 
>       o
> 
>         shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-rkl-6/igt@gem_eio@in-flight-suspend.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-1/igt@gem_eio@in-flight-suspend.html>
> 
>       o
> 
>         shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg2-11/igt@gem_eio@in-flight-suspend.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-5/igt@gem_eio@in-flight-suspend.html>
> 
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-glk6/igt@gem_exec_fair@basic-deadline.html> (i915#2846 <https://gitlab.freedesktop.org/drm/intel/issues/2846>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-glk2/igt@gem_exec_fair@basic-deadline.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace@bcs0:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-rkl-7/igt@gem_exec_fair@basic-pace@bcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-4/igt@gem_exec_fair@basic-pace@bcs0.html> +1 other test pass
>   *
> 
>     igt@gem_exec_fair@basic-pace@rcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-glk6/igt@gem_exec_fair@basic-pace@rcs0.html> +1 other test pass
>   *
> 
>     igt@gem_exec_schedule@preemptive-hang@vcs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-1/igt@gem_exec_schedule@preemptive-hang@vcs0.html> (i915#9051 <https://gitlab.freedesktop.org/drm/intel/issues/9051>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-4/igt@gem_exec_schedule@preemptive-hang@vcs0.html>
>   *
> 
>     igt@gem_exec_suspend@basic-s0@smem:
> 
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html> (i915#6311 <https://gitlab.freedesktop.org/drm/intel/issues/6311>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@gem_exec_suspend@basic-s0@smem.html>
>   *
> 
>     igt@gem_exec_suspend@basic-s3@smem:
> 
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg2-5/igt@gem_exec_suspend@basic-s3@smem.html> (i915#7793 <https://gitlab.freedesktop.org/drm/intel/issues/7793>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-5/igt@gem_exec_suspend@basic-s3@smem.html>
>   *
> 
>     igt@i915_hangman@gt-engine-error@vcs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-3/igt@i915_hangman@gt-engine-error@vcs0.html> (i915#7069 <https://gitlab.freedesktop.org/drm/intel/issues/7069>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-7/igt@i915_hangman@gt-engine-error@vcs0.html>
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o shard-apl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-apl7/igt@i915_pm_dc@dc9-dpms.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-apl4/igt@i915_pm_dc@dc9-dpms.html>
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@rcs0:
> 
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html> (i915#3591 <https://gitlab.freedesktop.org/drm/intel/issues/3591>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html> +1 other test pass
>   *
> 
>     igt@i915_pm_rpm@dpms-non-lpsp:
> 
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-18/igt@i915_pm_rpm@dpms-non-lpsp.html> +1 other test pass
>   *
> 
>     igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg2-2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-10/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html>
>   *
> 
>     igt@i915_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (i915#5138 <https://gitlab.freedesktop.org/drm/intel/issues/5138>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (i915#3743 <https://gitlab.freedesktop.org/drm/intel/issues/3743>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html>
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html> (i915#6880 <https://gitlab.freedesktop.org/drm/intel/issues/6880>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html> +2 other tests pass
>   *
> 
>     igt@perf_pmu@busy-double-start@vcs1:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-3/igt@perf_pmu@busy-double-start@vcs1.html> (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-7/igt@perf_pmu@busy-double-start@vcs1.html> +2 other tests pass
>   *
> 
>     igt@perf_pmu@most-busy-idle-check-all@rcs0:
> 
>       o
> 
>         shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg2-1/igt@perf_pmu@most-busy-idle-check-all@rcs0.html> (i915#5234 <https://gitlab.freedesktop.org/drm/intel/issues/5234>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-1/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
> 
>       o
> 
>         shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg1-19/igt@perf_pmu@most-busy-idle-check-all@rcs0.html> (i915#5234 <https://gitlab.freedesktop.org/drm/intel/issues/5234>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-17/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
> 
>       o
> 
>         shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-1/igt@perf_pmu@most-busy-idle-check-all@rcs0.html> (i915#5234 <https://gitlab.freedesktop.org/drm/intel/issues/5234>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-6/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
> 
>   *
> 
>     igt@syncobj_wait@invalid-wait-illegal-handle:
> 
>       o shard-mtlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-1/igt@syncobj_wait@invalid-wait-illegal-handle.html> (i915#2017 <https://gitlab.freedesktop.org/drm/intel/issues/2017>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-8/igt@syncobj_wait@invalid-wait-illegal-handle.html>
>   *
> 
>     igt@sysfs_heartbeat_interval@nopreempt@vecs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-5/igt@sysfs_heartbeat_interval@nopreempt@vecs0.html> (i915#6015 <https://gitlab.freedesktop.org/drm/intel/issues/6015>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt@vecs0.html>
>   *
> 
>     igt@sysfs_timeslice_duration@timeout@vecs0:
> 
>       o shard-mtlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-6/igt@sysfs_timeslice_duration@timeout@vecs0.html> (i915#6950 <https://gitlab.freedesktop.org/drm/intel/issues/6950>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-8/igt@sysfs_timeslice_duration@timeout@vecs0.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@i915_pm_rc6_residency@media-rc6-accuracy:
> 
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html> (i915#8403 <https://gitlab.freedesktop.org/drm/intel/issues/8403>)
>   *
> 
>     igt@i915_suspend@basic-s3-without-i915:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-rkl-6/igt@i915_suspend@basic-s3-without-i915.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-7/igt@i915_suspend@basic-s3-without-i915.html> (i915#4817 <https://gitlab.freedesktop.org/drm/intel/issues/4817>)
>   *
> 
>     igt@kms_color@degamma@pipe-a:
> 
>       o shard-mtlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-mtlp-1/igt@kms_color@degamma@pipe-a.html> (i915#2017 <https://gitlab.freedesktop.org/drm/intel/issues/2017>) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-mtlp-4/igt@kms_color@degamma@pipe-a.html> (i915#9257 <https://gitlab.freedesktop.org/drm/intel/issues/9257>)
>   *
> 
>     igt@kms_content_protection@mei_interface:
> 
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg1-14/igt@kms_content_protection@mei_interface.html> (i915#7116 <https://gitlab.freedesktop.org/drm/intel/issues/7116>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-12/igt@kms_content_protection@mei_interface.html> (fdo#109300 <https://bugs.freedesktop.org/show_bug.cgi?id=109300>)
>   *
> 
>     igt@kms_content_protection@type1:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg2-1/igt@kms_content_protection@type1.html> (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-11/igt@kms_content_protection@type1.html> (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118> / i915#7162 <https://gitlab.freedesktop.org/drm/intel/issues/7162>)
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-rkl-7/igt@kms_fbcon_fbt@psr.html> (i915#3955 <https://gitlab.freedesktop.org/drm/intel/issues/3955>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-1/igt@kms_fbcon_fbt@psr.html> (fdo#110189 <https://bugs.freedesktop.org/show_bug.cgi?id=110189> / i915#3955 <https://gitlab.freedesktop.org/drm/intel/issues/3955>)
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-rkl-6/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-1/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285> / i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (i915#4816 <https://gitlab.freedesktop.org/drm/intel/issues/4816>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> / i915#4816 <https://gitlab.freedesktop.org/drm/intel/issues/4816>)
>   *
> 
>     igt@kms_psr@cursor_plane_move:
> 
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg1-14/igt@kms_psr@cursor_plane_move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-16/igt@kms_psr@cursor_plane_move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072> / i915#4078 <https://gitlab.freedesktop.org/drm/intel/issues/4078>)
>   *
> 
>     igt@kms_psr@primary_page_flip:
> 
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg1-18/igt@kms_psr@primary_page_flip.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072> / i915#4078 <https://gitlab.freedesktop.org/drm/intel/issues/4078>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg1-15/igt@kms_psr@primary_page_flip.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +1 other test skip
>   *
> 
>     igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
> 
>       o shard-dg2: CRASH
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/shard-dg2-6/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html> (i915#7331 <https://gitlab.freedesktop.org/drm/intel/issues/7331>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/shard-dg2-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html> (i915#5493 <https://gitlab.freedesktop.org/drm/intel/issues/5493>)
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7468 -> IGTPW_9723
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_13599: 58fe10f34e80d0eeb5609128faa135260623a715 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_9723: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9723/index.html
> IGT_7468: 7468
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
