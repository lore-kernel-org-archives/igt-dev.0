Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B29B10E237
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 08:25:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------M89tBG0wPpzWDhQ3LAATuAzy"
Message-ID: <9c97e707-dfb5-483b-b723-a59684475b28@intel.com>
Date: Mon, 30 Oct 2023 09:25:23 +0100
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20231026-gtt_size_fix-v1-0-882d0e0022ec@intel.com>
 <169846329098.21164.2407494635189926115@emeril.freedesktop.org>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <169846329098.21164.2407494635189926115@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2lu?=
 =?utf-8?q?tel=5Fbatchbuffer=3A_allow_GTT_size_be_not_power_of_2?=
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

This is a multi-part message in MIME format.
--------------M89tBG0wPpzWDhQ3LAATuAzy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28.10.2023 05:21, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	lib/intel_batchbuffer: allow GTT size be not power of 2
> *URL:* 	https://patchwork.freedesktop.org/series/125640/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/index.html
>
>
>   CI Bug Log - changes from CI_DRM_13792_full -> IGTPW_10075_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_10075_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_10075_full, please notify your bug team 
> (lgci.bug.filing@intel.com) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/index.html
>
>
>     Participating hosts (12 -> 12)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_10075_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-snb6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-snb6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html>
>         +1 other test abort
>

Not related to i915.

>  *
>
>
>         Warnings
>
>   * igt@gem_exec_fair@basic-pace@bcs0:
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@gem_exec_fair@basic-pace@bcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html>
>

Not related recurring bug [1][2][3].

[1]: https://gitlab.freedesktop.org/drm/intel/-/issues/6247
[2]: 
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13788/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html
[3]: 
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7560/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html

Regards
Andrzej
>
>  *
>
>
>     Known issues
>
> Here are the changes found in IGTPW_10075_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@api_intel_bb@blit-reloc-keep-cache:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@api_intel_bb@blit-reloc-keep-cache.html>
>         ([i915#8411]) +2 other tests skip
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@api_intel_bb@blit-reloc-keep-cache.html>
>         ([i915#8411])
>
>  *
>
>     igt@debugfs_test@basic-hwmon:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@debugfs_test@basic-hwmon.html>
>         ([i915#9318])
>  *
>
>     igt@device_reset@cold-reset-bound:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@device_reset@cold-reset-bound.html>
>         ([i915#7701]) +1 other test skip
>  *
>
>     igt@drm_fdinfo@all-busy-check-all:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@drm_fdinfo@all-busy-check-all.html>
>         ([i915#8414]) +1 other test skip
>  *
>
>     igt@drm_fdinfo@busy-idle-check-all@vcs1:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-18/igt@drm_fdinfo@busy-idle-check-all@vcs1.html>
>         ([i915#8414]) +4 other tests skip
>  *
>
>     igt@drm_fdinfo@busy-idle@bcs0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@drm_fdinfo@busy-idle@bcs0.html>
>         ([i915#8414]) +20 other tests skip
>  *
>
>     igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html>
>         ([i915#7742])
>  *
>
>     igt@drm_fdinfo@virtual-idle:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html>
>         ([i915#7742])
>  *
>
>     igt@fbdev@pan:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@fbdev@pan.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@fbdev@pan.html>
>         (i915#2582
>         <https://gitlab.freedesktop.org/drm/intel/issues/2582>) +1
>         other test skip
>  *
>
>     igt@gem_basic@multigpu-create-close:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@gem_basic@multigpu-create-close.html>
>         ([i915#7697])
>  *
>
>     igt@gem_ccs@ctrl-surf-copy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html>
>         ([i915#7957])
>  *
>
>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         [i915#9323])
>  *
>
>     igt@gem_ccs@suspend-resume:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@gem_ccs@suspend-resume.html>
>         ([i915#9323])
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@gem_ccs@suspend-resume.html>
>         ([i915#9323])
>
>  *
>
>     igt@gem_create@create-ext-cpu-access-big:
>
>       o shard-dg2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html>
>         ([i915#9364])
>  *
>
>     igt@gem_create@create-ext-set-pat:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-6/igt@gem_create@create-ext-set-pat.html>
>         ([i915#8562])
>  *
>
>     igt@gem_ctx_param@set-priority-not-supported:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gem_ctx_param@set-priority-not-supported.html>
>         (fdo#109314 <https://bugs.freedesktop.org/show_bug.cgi?id=109314>)
>  *
>
>     igt@gem_ctx_persistence@engines-hostile@vcs0:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-4/igt@gem_ctx_persistence@engines-hostile@vcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gem_ctx_persistence@engines-hostile@vcs0.html>
>         (i915#2410
>         <https://gitlab.freedesktop.org/drm/intel/issues/2410>) +2
>         other tests fail
>  *
>
>     igt@gem_ctx_persistence@hang:
>
>      o
>
>         shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-4/igt@gem_ctx_persistence@hang.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_ctx_persistence@hang.html>
>         ([i915#6252])
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-19/igt@gem_ctx_persistence@hang.html>
>         ([i915#8555])
>
>  *
>
>     igt@gem_ctx_persistence@heartbeat-many:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-many.html>
>         ([i915#8555])
>  *
>
>     igt@gem_ctx_persistence@legacy-engines-hostile@vebox:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-5/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html>
>         (i915#2410
>         <https://gitlab.freedesktop.org/drm/intel/issues/2410>) +2
>         other tests fail
>  *
>
>     igt@gem_ctx_persistence@legacy-engines-mixed-process:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-snb4/igt@gem_ctx_persistence@legacy-engines-mixed-process.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>  *
>
>     igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html>
>         ([i915#5882]) +9 other tests skip
>  *
>
>     igt@gem_eio@reset-stress:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-dg1-17/igt@gem_eio@reset-stress.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-13/igt@gem_eio@reset-stress.html>
>         ([i915#5784])
>  *
>
>     igt@gem_eio@wait-immediate:
>
>       o shard-mtlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gem_eio@wait-immediate.html>
>         ([i915#9414])
>  *
>
>     igt@gem_exec_balancer@bonded-sync:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-2/igt@gem_exec_balancer@bonded-sync.html>
>         (i915#4771 <https://gitlab.freedesktop.org/drm/intel/issues/4771>)
>  *
>
>     igt@gem_exec_balancer@bonded-true-hang:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html>
>         (i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>)
>  *
>
>     igt@gem_exec_balancer@hog:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@gem_exec_balancer@hog.html>
>         (i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>)
>  *
>
>     igt@gem_exec_balancer@noheartbeat:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@gem_exec_balancer@noheartbeat.html>
>         ([i915#8555]) +2 other tests skip
>  *
>
>     igt@gem_exec_balancer@parallel:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@gem_exec_balancer@parallel.html>
>         (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>  *
>
>     igt@gem_exec_fair@basic-none:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gem_exec_fair@basic-none.html>
>         (i915#4473
>         <https://gitlab.freedesktop.org/drm/intel/issues/4473> /
>         i915#4771 <https://gitlab.freedesktop.org/drm/intel/issues/4771>)
>  *
>
>     igt@gem_exec_fair@basic-none@bcs0:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +3
>         other tests fail
>  *
>
>     igt@gem_exec_fair@basic-pace-share@rcs0:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>  *
>
>     igt@gem_exec_fair@basic-throttle:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@gem_exec_fair@basic-throttle.html>
>         (i915#3539 <https://gitlab.freedesktop.org/drm/intel/issues/3539>)
>  *
>
>     igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/intel/issues/3539> /
>         i915#4852
>         <https://gitlab.freedesktop.org/drm/intel/issues/4852>) +3
>         other tests skip
>  *
>
>     igt@gem_exec_params@rsvd2-dirt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-2/igt@gem_exec_params@rsvd2-dirt.html>
>         (i915#5107 <https://gitlab.freede>)
>  *
>
>     igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +17
>         other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-cpu-noreloc:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-noreloc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +3
>         other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-18/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html>
>         (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>)
>  *
>
>     igt@gem_exec_reloc@basic-write-read-active:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +12
>         other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-write-wc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gem_exec_reloc@basic-write-wc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +6
>         other tests skip
>  *
>
>     igt@gem_exec_schedule@preempt-queue:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@gem_exec_schedule@preempt-queue.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/intel/issues/4537> /
>         i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>)
>  *
>
>     igt@gem_exec_suspend@basic-s4-devices@smem:
>
>       o shard-rkl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@gem_exec_suspend@basic-s4-devices@smem.html>
>         ([i915#7975] / [i915#8213]) +1 other test abort
>  *
>
>     igt@gem_fence_thrash@bo-write-verify-threaded-none:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-threaded-none.html>
>         (i915#4860 <https://gitlab.freedesktop.org/drm/intel/issues/4860>)
>  *
>
>     igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/intel/issues/4860>) +1
>         other test skip
>  *
>
>     igt@gem_fenced_exec_thrash@too-many-fences:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@gem_fenced_exec_thrash@too-many-fences.html>
>         (i915#4860 <https://gitlab.freedesktop.org/drm/intel/issues/4860>)
>  *
>
>     igt@gem_lmem_evict@dontneed-evict-race:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@gem_lmem_evict@dontneed-evict-race.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613> /
>         [i915#7582])
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gem_lmem_evict@dontneed-evict-race.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-2/igt@gem_lmem_swapping@parallel-random-verify.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +2
>         other tests skip
>  *
>
>     igt@gem_media_fill@media-fill:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@gem_media_fill@media-fill.html>
>         ([i915#8289])
>  *
>
>     igt@gem_mmap_gtt@cpuset-big-copy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@gem_mmap_gtt@cpuset-big-copy.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +9
>         other tests skip
>  *
>
>     igt@gem_mmap_gtt@cpuset-medium-copy-odd:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +9
>         other tests skip
>  *
>
>     igt@gem_mmap_wc@set-cache-level:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@gem_mmap_wc@set-cache-level.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_mmap_wc@set-cache-level.html>
>         (i915#1850 <https://gitlab.freedesktop.org/drm/intel/issues/1850>)
>  *
>
>     igt@gem_mmap_wc@write:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@gem_mmap_wc@write.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/intel/issues/4083>) +2
>         other tests skip
>  *
>
>     igt@gem_mmap_wc@write-read-distinct:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@gem_mmap_wc@write-read-distinct.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/intel/issues/4083>) +6
>         other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@reads-uncached:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@gem_partial_pwrite_pread@reads-uncached.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +2
>         other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads-display:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +1
>         other test skip
>  *
>
>     igt@gem_pread@snoop:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gem_pread@snoop.html>
>         (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>  *
>
>     igt@gem_pwrite@basic-random:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@gem_pwrite@basic-random.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +6
>         other tests skip
>  *
>
>     igt@gem_pxp@display-protected-crc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@gem_pxp@display-protected-crc.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +4
>         other tests skip
>  *
>
>     igt@gem_pxp@fail-invalid-protected-context:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@gem_pxp@fail-invalid-protected-context.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +1
>         other test skip
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-off-2:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-8/igt@gem_pxp@reject-modify-context-protection-off-2.html>
>         (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>  *
>
>     igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +1
>         other test skip
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html>
>         ([i915#8428]) +4 other tests skip
>  *
>
>     igt@gem_render_copy@y-tiled-to-vebox-linear:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_render_copy@y-tiled-to-vebox-linear.html>
>         ([i915#768]) +1 other test skip
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1
>         other test skip
>  *
>
>     igt@gem_tiled_pread_basic:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-2/igt@gem_tiled_pread_basic.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1
>         other test skip
>  *
>
>     igt@gem_unfence_active_buffers:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-5/igt@gem_unfence_active_buffers.html>
>         (i915#4879 <https://gitlab.freedesktop.org/drm/intel/issues/4879>)
>  *
>
>     igt@gem_userptr_blits@dmabuf-sync:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-glk4/igt@gem_userptr_blits@dmabuf-sync.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3323 <https://gitlab.freedesktop.org/drm/intel/issues/3323>)
>  *
>
>     igt@gem_userptr_blits@dmabuf-unsync:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-3/igt@gem_userptr_blits@dmabuf-unsync.html>
>         (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>  *
>
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/intel/issues/3297> /
>         i915#4880 <https://gitlab.freedesktop.org/drm/intel/issues/4880>)
>  *
>
>     igt@gem_userptr_blits@mmap-offset-banned@gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@gem_userptr_blits@mmap-offset-banned@gtt.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/intel/issues/3297>) +3
>         other tests skip
>  *
>
>     igt@gem_userptr_blits@unsync-unmap:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap.html>
>         (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>  *
>
>     igt@gem_userptr_blits@unsync-unmap-after-close:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-6/igt@gem_userptr_blits@unsync-unmap-after-close.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/intel/issues/3297>) +1
>         other test skip
>  *
>
>     igt@gen7_exec_parse@basic-rejected:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@gen7_exec_parse@basic-rejected.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +2
>         other tests skip
>  *
>
>     igt@gen7_exec_parse@cmd-crossing-page:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-7/igt@gen7_exec_parse@cmd-crossing-page.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>  *
>
>     igt@gen9_exec_parse@allowed-single:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@gen9_exec_parse@allowed-single.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@gen9_exec_parse@allowed-single.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527>) +1
>         other test skip
>  *
>
>     igt@gen9_exec_parse@basic-rejected-ctx-param:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gen9_exec_parse@basic-rejected-ctx-param.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +2
>         other tests skip
>  *
>
>     igt@gen9_exec_parse@secure-batches:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527>) +3
>         other tests skip
>  *
>
>     igt@gen9_exec_parse@valid-registers:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@gen9_exec_parse@valid-registers.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +1
>         other test skip
>  *
>
>     igt@i915_hangman@detector@vcs0:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-5/igt@i915_hangman@detector@vcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@i915_hangman@detector@vcs0.html>
>         ([i915#8456]) +2 other tests fail
>  *
>
>     igt@i915_hangman@engine-engine-hang@vcs0:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-2/igt@i915_hangman@engine-engine-hang@vcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@i915_hangman@engine-engine-hang@vcs0.html>
>         ([i915#7069]) +1 other test fail
>  *
>
>     igt@i915_hangman@gt-error-state-capture@ccs0:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-5/igt@i915_hangman@gt-error-state-capture@ccs0.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@i915_hangman@gt-error-state-capture@ccs0.html>
>         ([i915#9414])
>  *
>
>     igt@i915_module_load@load:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@i915_module_load@load.html>
>         ([i915#6227])
>  *
>
>     igt@i915_module_load@reload-with-fault-injection:
>
>      o
>
>         shard-dg2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#9559])
>
>      o
>
>         shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#8489] / [i915#8668])
>
>  *
>
>     igt@i915_pipe_stress@stress-xrgb8888-ytiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html>
>         ([i915#7091])
>  *
>
>     igt@i915_pm_freq_api@freq-suspend:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@i915_pm_freq_api@freq-suspend.html>
>         ([i915#8399]) +1 other test skip
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>         (i915#3591
>         <https://gitlab.freedesktop.org/drm/intel/issues/3591>) +1
>         other test fail
>  *
>
>     igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html>
>         (fdo#109293
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109293> /
>         fdo#109506 <https://bugs.freedesktop.org/show_bug.cgi?id=109506>)
>
>      o
>
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html>
>         (fdo#109293
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109293> /
>         fdo#109506 <https://bugs.freedesktop.org/show_bug.cgi?id=109506>)
>
>  *
>
>     igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-5/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html>
>         ([i915#8431])
>  *
>
>     igt@i915_pm_rps@min-max-config-idle:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html>
>         ([i915#6621])
>  *
>
>     igt@i915_pm_rps@thresholds-idle@gt0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@i915_pm_rps@thresholds-idle@gt0.html>
>         ([i915#8925]) +1 other test skip
>  *
>
>     igt@i915_pm_rps@thresholds-park@gt0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@i915_pm_rps@thresholds-park@gt0.html>
>         ([i915#8925])
>  *
>
>     igt@i915_pm_rps@thresholds-park@gt1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@i915_pm_rps@thresholds-park@gt1.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         [i915#8925])
>  *
>
>     igt@i915_pm_sseu@full-enable:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@i915_pm_sseu@full-enable.html>
>         (i915#4387 <https://gitlab.freedesktop.org/drm/intel/issues/4387>)
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@i915_pm_sseu@full-enable.html>
>         ([i915#8437])
>
>  *
>
>     igt@i915_power@sanity:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-3/igt@i915_power@sanity.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@i915_power@sanity.html>
>         ([i915#7984])
>  *
>
>     igt@i915_query@hwconfig_table:
>
>      o
>
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-9/igt@i915_query@hwconfig_table.html>
>         ([i915#6245])
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@i915_query@hwconfig_table.html>
>         ([i915#6245])
>
>  *
>
>     igt@i915_query@query-topology-coherent-slice-mask:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@i915_query@query-topology-coherent-slice-mask.html>
>         ([i915#6188])
>  *
>
>     igt@i915_query@query-topology-unsupported:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@i915_query@query-topology-unsupported.html>
>         (fdo#109302 <https://bugs.freedesktop.org/show_bug.cgi?id=109302>)
>  *
>
>     igt@i915_selftest@mock@memory_region:
>
>       o shard-dg2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@i915_selftest@mock@memory_region.html>
>         ([i915#9311])
>  *
>
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html>
>         (i915#4215
>         <https://gitlab.freedesktop.org/drm/intel/issues/4215> /
>         [i915#5190])
>  *
>
>     igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-6/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html>
>         ([i915#8247]) +3 other tests fail
>  *
>
>     igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-16/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html>
>         ([i915#8247]) +3 other tests fail
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         ([i915#9531])
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/intel/issues/1769> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html>
>         ([i915#5286]) +7 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>         ([i915#5138])
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-0:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-5/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>         [i915#5286])
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         ([i915#5138])
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-90:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-15/igt@kms_big_fb@linear-64bpp-rotate-90.html>
>         (i915#3638 <https://gitlab.freedesktop.org/drm/intel/issues/3638>)
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +20
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         ([i915#5190]) +14 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (i915#3743
>         <https://gitlab.freedesktop.org/drm/intel/issues/3743>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +5
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/intel/issues/4538> /
>         [i915#5190]) +6 other tests skip
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-12/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/intel/issues/4538>) +1
>         other test skip
>
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
>         (fdo#110723
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110723>) +6
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         ([i915#6187])
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>  *
>
>     igt@kms_big_joiner@2x-modeset:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@kms_big_joiner@2x-modeset.html>
>         (i915#2705 <https://gitlab.freedesktop.org/drm/intel/issues/2705>)
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@kms_cdclk@mode-transition.html>
>         (i915#3742 <https://gitlab.freedesktop.org/drm/intel/issues/3742>)
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html>
>         (i915#4087
>         <https://gitlab.freedesktop.org/drm/intel/issues/4087>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-50:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_chamelium_color@ctm-0-50.html>
>         (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>  *
>
>     igt@kms_chamelium_color@ctm-max:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@kms_chamelium_color@ctm-max.html>
>         (fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_color@ctm-red-to-blue:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-fast:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_chamelium_frames@hdmi-crc-fast.html>
>         ([i915#7828]) +12 other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-7/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html>
>         ([i915#7828]) +2 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd.html>
>         ([i915#7828]) +5 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html>
>         ([i915#7828]) +8 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-18/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html>
>         ([i915#7828]) +1 other test skip
>  *
>
>     igt@kms_color@ctm-0-50@pipe-b:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-6/igt@kms_color@ctm-0-50@pipe-b.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_color@ctm-0-50@pipe-b.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +3
>         other tests skip
>  *
>
>     igt@kms_color@ctm-0-50@pipe-c:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_color@ctm-0-50@pipe-c.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +19
>         other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-2/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (i915#3299 <https://gitlab.freedesktop.org/drm/intel/issues/3299>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (i915#3299 <https://gitlab.freedesktop.org/drm/intel/issues/3299>)
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-13/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (i915#3299 <https://gitlab.freedesktop.org/drm/intel/issues/3299>)
>
>  *
>
>     igt@kms_content_protection@legacy:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@kms_content_protection@legacy.html>
>         ([i915#7118]) +1 other test skip
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-3/igt@kms_content_protection@legacy.html>
>         ([i915#6944])
>
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-32x10:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-32x32:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-32x32.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         [i915#8814])
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x512:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-3/igt@kms_cursor_crc@cursor-random-512x512.html>
>         (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (i915#3359
>         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x10:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +5
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-4:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-4.html>
>         (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>  *
>
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>
>       o shard-snb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-snb1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html>
>         ([i915#8841]) +3 other tests dmesg-warn
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (i915#4213
>         <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +6
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +14
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         [i915#5354]) +3 other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html>
>         (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html>
>         (fdo#111767
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111767> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>  *
>
>     igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-16/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4.html>
>         ([i915#9227])
>  *
>
>     igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-16/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4.html>
>         ([i915#9226] / [i915#9261]) +1 other test skip
>  *
>
>     igt@kms_dp_aux_dev:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@kms_dp_aux_dev.html>
>         (i915#1257 <https://gitlab.freedesktop.org/drm/intel/issues/1257>)
>
>      o
>
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-10/igt@kms_dp_aux_dev.html>
>         (i915#1257 <https://gitlab.freedesktop.org/drm/intel/issues/1257>)
>
>  *
>
>     igt@kms_draw_crc@draw-method-mmap-wc:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-6/igt@kms_draw_crc@draw-method-mmap-wc.html>
>         ([i915#8812])
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-15/igt@kms_draw_crc@draw-method-mmap-wc.html>
>         ([i915#8812])
>
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@kms_dsc@dsc-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#3840
>         <https://gitlab.freedesktop.org/drm/intel/issues/3840>) +1
>         other test skip
>  *
>
>     igt@kms_dsc@dsc-with-bpc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#3840 <https://gitlab.freedesktop.org/drm/intel/issues/3840>)
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html>
>         (fdo#110189
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110189> /
>         i915#3955 <https://gitlab.freedesktop.org/drm/intel/issues/3955>)
>
>      o
>
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-6/igt@kms_fbcon_fbt@psr-suspend.html>
>         (i915#3469 <https://gitlab.freedesktop.org/drm/intel/issues/3469>)
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_fbcon_fbt@psr-suspend.html>
>         (i915#3469 <https://gitlab.freedesktop.org/drm/intel/issues/3469>)
>
>  *
>
>     igt@kms_fence_pin_leak:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-16/igt@kms_fence_pin_leak.html>
>         (i915#4881 <https://gitlab.freedesktop.org/drm/intel/issues/4881>)
>  *
>
>     igt@kms_flip@2x-blocking-wf_vblank:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_flip@2x-blocking-wf_vblank.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +9
>         other tests skip
>  *
>
>     igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/intel/issues/3637>) +3
>         other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-snb6/igt@kms_flip@2x-flip-vs-dpms.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +14
>         other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-fences-interruptible:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-15/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>         ([i915#8381])
>  *
>
>     igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767>)
>  *
>
>     igt@kms_flip@2x-nonexisting-fb:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-3/igt@kms_flip@2x-nonexisting-fb.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         i915#3637
>         <https://gitlab.freedesktop.org/drm/intel/issues/3637>) +2
>         other tests skip
>  *
>
>     igt@kms_flip@dpms-off-confusion-interruptible:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_flip@dpms-off-confusion-interruptible.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/intel/issues/3637> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +5
>         other tests skip
>  *
>
>     igt@kms_flip@flip-vs-fences-interruptible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@kms_flip@flip-vs-fences-interruptible.html>
>         ([i915#8381]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +5
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +6
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>         i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>         i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>  *
>
>     igt@kms_force_connector_basic@force-load-detect:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_force_connector_basic@force-load-detect.html>
>         (fdo#109285
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109285> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         ([i915#8708]) +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         ([i915#8708]) +22 other tests skip
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         ([i915#8708]) +1 other test skip
>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html>
>         ([i915#5354]) +28 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +29
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +10
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html>
>         (i915#3023
>         <https://gitlab.freedesktop.org/drm/intel/issues/3023>) +18
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +10
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/intel/issues/3458>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>         i915#1825
>         <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +39
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-rte:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-rte.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/intel/issues/3458>) +23
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-glk2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +24
>         other tests skip
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         [i915#8228]) +1 other test skip
>  *
>
>     igt@kms_hdr@static-toggle:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-6/igt@kms_hdr@static-toggle.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         [i915#8228])
>  *
>
>     igt@kms_hdr@static-toggle-dpms:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@kms_hdr@static-toggle-dpms.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         [i915#8228])
>  *
>
>     igt@kms_hdr@static-toggle-suspend:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_hdr@static-toggle-suspend.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         [i915#8228]) +1 other test skip
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#4816 <https://gitlab.freedesktop.org/drm/intel/issues/4816>)
>  *
>
>     igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-3/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>  *
>
>     igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +3
>         other tests skip
>  *
>
>     igt@kms_plane_lowres@tiling-yf:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_plane_lowres@tiling-yf.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         [i915#8821])
>  *
>
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         (i915#3546
>         <https://gitlab.freedesktop.org/drm/intel/issues/3546>) +3
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-size.html>
>         ([i915#6953])
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html>
>         ([i915#8292])
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
>
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html>
>         ([i915#8292])
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3.html>
>         ([i915#5176] / [i915#9423]) +3 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1.html>
>         ([i915#5176] / [i915#9423]) +3 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-16/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4.html>
>         ([i915#5235]) +7 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html>
>         ([i915#5235]) +2 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         [i915#5235])
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4.html>
>         ([i915#5235]) +11 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         [i915#6953] / [i915#8152])
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         [i915#6953] / [i915#8152]) +2 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html>
>         ([i915#5235]) +7 other tests skip
>  *
>
>     igt@kms_properties@plane-properties-atomic:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-6/igt@kms_properties@plane-properties-atomic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_properties@plane-properties-atomic.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@cursor-plane-update-sf:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-6/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>         [i915#658])
>  *
>
>     igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-glk4/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         [i915#658])
>  *
>
>     igt@kms_psr2_sf@plane-move-sf-dmg-area:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>         [i915#658])
>  *
>
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>         ([i915#658]) +2 other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_psr2_su@page_flip-nv12.html>
>         ([i915#658]) +2 other tests skip
>  *
>
>     igt@kms_psr@cursor_mmap_cpu:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_psr@cursor_mmap_cpu.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +5
>         other tests skip
>  *
>
>     igt@kms_psr@psr2_primary_page_flip:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-6/igt@kms_psr@psr2_primary_page_flip.html>
>         (fdo#110189
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110189>) +9
>         other tests skip
>  *
>
>     igt@kms_psr@psr2_sprite_plane_move:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@kms_psr@psr2_sprite_plane_move.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +9
>         other tests skip
>  *
>
>     igt@kms_psr@sprite_blt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-15/igt@kms_psr@sprite_blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072> /
>         i915#4078
>         <https://gitlab.freedesktop.org/drm/intel/issues/4078>) +1
>         other test skip
>  *
>
>     igt@kms_rotation_crc@bad-pixel-format:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-5/igt@kms_rotation_crc@bad-pixel-format.html>
>         (i915#4235 <https://gitlab.freedesktop.org/drm/intel/issues/4235>)
>  *
>
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html>
>         ([i915#5289])
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>         [i915#5289])
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (i915#4235
>         <https://gitlab.freedesktop.org/drm/intel/issues/4235> /
>         [i915#5190]) +1 other test skip
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (i915#4235
>         <https://gitlab.freedesktop.org/drm/intel/issues/4235>) +2
>         other tests skip
>  *
>
>     igt@kms_setmode@basic@pipe-a-vga-1:
>
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-snb5/igt@kms_setmode@basic@pipe-a-vga-1.html>
>         ([i915#5465]) +1 other test fail
>  *
>
>     igt@kms_setmode@clone-exclusive-crtc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_setmode@clone-exclusive-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_setmode@invalid-clone-exclusive-crtc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern.html>
>         ([i915#8623])
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         ([i915#8623])
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@kms_tv_load_detect@load-detect.html>
>         (fdo#109309 <https://bugs.freedesktop.org/show_bug.cgi?id=109309>)
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html>
>         ([i915#9196])
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-18/igt@kms_vrr@flip-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +1
>         other test skip
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-2/igt@kms_vrr@flipline.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         [i915#8808])
>  *
>
>     igt@kms_writeback@writeback-check-output:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@kms_writeback@writeback-check-output.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_writeback@writeback-check-output.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>
>  *
>
>     igt@kms_writeback@writeback-fb-id:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-6/igt@kms_writeback@writeback-fb-id.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>  *
>
>     igt@perf@mi-rpc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@perf@mi-rpc.html>
>         (i915#2434 <https://gitlab.freedesktop.org/drm/intel/issues/2434>)
>  *
>
>     igt@perf_pmu@busy-double-start@vcs1:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-6/igt@perf_pmu@busy-double-start@vcs1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@perf_pmu@busy-double-start@vcs1.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/intel/issues/4349>) +2
>         other tests fail
>  *
>
>     igt@perf_pmu@cpu-hotplug:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@perf_pmu@cpu-hotplug.html>
>         ([i915#8850])
>  *
>
>     igt@perf_pmu@module-unload:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@perf_pmu@module-unload.html>
>         ([i915#5793])
>  *
>
>     igt@perf_pmu@rc6@other-idle-gt0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@perf_pmu@rc6@other-idle-gt0.html>
>         ([i915#8516])
>  *
>
>     igt@prime_vgem@basic-fence-flip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@prime_vgem@basic-fence-flip.html>
>         (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>  *
>
>     igt@prime_vgem@basic-fence-read:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@prime_vgem@basic-fence-read.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/intel/issues/3291> /
>         i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +1
>         other test skip
>  *
>
>     igt@prime_vgem@basic-write:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-13/igt@prime_vgem@basic-write.html>
>         (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>  *
>
>     igt@prime_vgem@coherency-gtt:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@prime_vgem@coherency-gtt.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>         i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>)
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-16/igt@prime_vgem@coherency-gtt.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>         i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>)
>
>  *
>
>     igt@sysfs_preempt_timeout@timeout@vecs0:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-5/igt@sysfs_preempt_timeout@timeout@vecs0.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-3/igt@sysfs_preempt_timeout@timeout@vecs0.html>
>         ([i915#8521])
>  *
>
>     igt@v3d/v3d_get_bo_offset@get-bad-handle:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-15/igt@v3d/v3d_get_bo_offset@get-bad-handle.html>
>         (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>)
>  *
>
>     igt@v3d/v3d_perfmon@get-values-invalid-pointer:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-3/igt@v3d/v3d_perfmon@get-values-invalid-pointer.html>
>         (fdo#109315
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109315> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +4
>         other tests skip
>  *
>
>     igt@v3d/v3d_submit_cl@bad-perfmon:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@v3d/v3d_submit_cl@bad-perfmon.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +13
>         other tests skip
>  *
>
>     igt@v3d/v3d_submit_cl@single-out-sync:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-5/igt@v3d/v3d_submit_cl@single-out-sync.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +9
>         other tests skip
>  *
>
>     igt@v3d/v3d_wait_bo@bad-bo:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@v3d/v3d_wait_bo@bad-bo.html>
>         (fdo#109315
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109315>) +10
>         other tests skip
>  *
>
>     igt@vc4/vc4_mmap@mmap-bo:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@vc4/vc4_mmap@mmap-bo.html>
>         ([i915#7711]) +8 other tests skip
>  *
>
>     igt@vc4/vc4_tiling@get-bad-handle:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@vc4/vc4_tiling@get-bad-handle.html>
>         ([i915#7711]) +13 other tests skip
>  *
>
>     igt@vc4/vc4_wait_bo@used-bo:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@vc4/vc4_wait_bo@used-bo.html>
>         ([i915#7711]) +5 other tests skip
>  *
>
>     igt@vc4/vc4_wait_bo@used-bo-0ns:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-7/igt@vc4/vc4_wait_bo@used-bo-0ns.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +2
>         other tests skip
>
>
>         Possible fixes
>
>  *
>
>     igt@gem_ctx_exec@basic-nohangcheck:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html>
>         ([i915#6268]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html>
>  *
>
>     igt@gem_ctx_persistence@legacy-engines-hang@blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html>
>         ([i915#6252]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@gem_ctx_persistence@legacy-engines-hang@blt.html>
>         +1 other test pass
>  *
>
>     igt@gem_eio@hibernate:
>
>      o
>
>         shard-tglu: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-tglu-10/igt@gem_eio@hibernate.html>
>         ([i915#7975] / [i915#8213] / [i915#8398]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-7/igt@gem_eio@hibernate.html>
>
>      o
>
>         shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-4/igt@gem_eio@hibernate.html>
>         ([i915#7975] / [i915#8213] / [i915#9414]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-2/igt@gem_eio@hibernate.html>
>
>      o
>
>         shard-dg2: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-dg2-3/igt@gem_eio@hibernate.html>
>         ([i915#7975] / [i915#8213]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@gem_eio@hibernate.html>
>
>  *
>
>     igt@gem_eio@in-flight-suspend:
>
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-4/igt@gem_eio@in-flight-suspend.html>
>         ([i915#7892] / [i915#9414]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gem_eio@in-flight-suspend.html>
>  *
>
>     igt@gem_exec_fair@basic-pace@vecs0:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@gem_exec_fair@basic-pace@vecs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_exec_fair@basic-pace@vecs0.html>
>         +2 other tests pass
>  *
>
>     igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html>
>         (fdo#109313
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109313>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html>
>  *
>
>     igt@gem_exec_reloc@basic-wc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@gem_exec_reloc@basic-wc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_exec_reloc@basic-wc.html>
>         +1 other test pass
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html>
>         +3 other tests pass
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html>
>         ([i915#8411]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html>
>  *
>
>     igt@gen9_exec_parse@batch-without-end:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@gen9_exec_parse@batch-without-end.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gen9_exec_parse@batch-without-end.html>
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         ([i915#5138]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         +1 other test pass
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-0:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html>
>         +16 other tests pass
>  *
>
>     {igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc}:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html>
>         +9 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html>
>         +4 other tests pass
>  *
>
>     {igt@kms_plane@planar-pixel-format-settings}:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_plane@planar-pixel-format-settings.html>
>         ([i915#9581]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_plane@planar-pixel-format-settings.html>
>  *
>
>     {igt@kms_pm_dc@dc5-dpms-negative}:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_pm_dc@dc5-dpms-negative.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_pm_dc@dc5-dpms-negative.html>
>         +2 other tests pass
>  *
>
>     {igt@kms_pm_rpm@dpms-non-lpsp}:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-dg2-10/igt@kms_pm_rpm@dpms-non-lpsp.html>
>         ([i915#9519]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_pm_rpm@dpms-non-lpsp.html>
>  *
>
>     {igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait}:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         ([i915#9519]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         +1 other test pass
>  *
>
>     igt@kms_rotation_crc@primary-rotation-270:
>
>       o shard-rkl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-4/igt@kms_rotation_crc@primary-rotation-270.html>
>         ([i915#8875]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_rotation_crc@primary-rotation-270.html>
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html>
>         ([i915#9196]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html>
>  *
>
>     igt@perf@whitelisted-registers-userspace-config:
>
>       o shard-mtlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-3/igt@perf@whitelisted-registers-userspace-config.html>
>         (i915#2017
>         <https://gitlab.freedesktop.org/drm/intel/issues/2017>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@perf@whitelisted-registers-userspace-config.html>
>  *
>
>     igt@perf_pmu@busy-double-start@ccs0:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-6/igt@perf_pmu@busy-double-start@ccs0.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/intel/issues/4349>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@perf_pmu@busy-double-start@ccs0.html>
>  *
>
>     igt@perf_pmu@busy-idle-check-all@vecs0:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-dg1-13/igt@perf_pmu@busy-idle-check-all@vecs0.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/intel/issues/4349>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-19/igt@perf_pmu@busy-idle-check-all@vecs0.html>
>         +2 other tests pass
>  *
>
>     igt@perf_pmu@most-busy-idle-check-all@rcs0:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/intel/issues/4349>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
>
>
>         Warnings
>
>  *
>
>     igt@gem_ccs@block-copy-compressed:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html>
>         ([i915#7957])
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle@vcs0:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>         (i915#2681
>         <https://gitlab.freedesktop.org/drm/intel/issues/2681> /
>         i915#3591
>         <https://gitlab.freedesktop.org/drm/intel/issues/3591>) ->
>         WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>         (i915#2681 <https://gitlab.freedesktop.org/drm/intel/issues/2681>)
>  *
>
>     igt@kms_async_flips@crc@pipe-b-edp-1:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-3/igt@kms_async_flips@crc@pipe-b-edp-1.html>
>         ([i915#8247]) -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_async_flips@crc@pipe-b-edp-1.html>
>         ([i915#8561]) +1 other test dmesg-fail
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         ([i915#9531]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/intel/issues/1769> /
>         i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html>
>         ([i915#5286]) +3 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         ([i915#5286]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-90:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_big_fb@linear-32bpp-rotate-90.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614> /
>         i915#3638
>         <https://gitlab.freedesktop.org/drm/intel/issues/3638>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-270:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614> /
>         i915#3638
>         <https://gitlab.freedesktop.org/drm/intel/issues/3638>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html>
>         (fdo#110723
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110723>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html>
>         (fdo#110723
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110723>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_big_fb@yf-tiled-addfb.html>
>         (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (i915#3116
>         <https://gitlab.freedesktop.org/drm/intel/issues/3116>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html>
>         (i915#3116 <https://gitlab.freedesktop.org/drm/intel/issues/3116>)
>  *
>
>     igt@kms_content_protection@type1:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-dg2-1/igt@kms_content_protection@type1.html>
>         ([i915#7118]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_content_protection@type1.html>
>         ([i915#7118] / [i915#7162])
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-32x10:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-max-size:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_cursor_crc@cursor-random-max-size.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_cursor_crc@cursor-random-max-size.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x170:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html>
>         (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (i915#3359
>         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +1
>         other test skip
>  *
>
>     igt@kms_dsc@dsc-with-formats:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@kms_dsc@dsc-with-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#3840
>         <https://gitlab.freedesktop.org/drm/intel/issues/3840>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html>
>         (i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>         i915#1825
>         <https://gitlab.freedesktop.org/drm/intel/issues/1825>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +15
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html>
>         (i915#3023
>         <https://gitlab.freedesktop.org/drm/intel/issues/3023>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +12
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
>         ([i915#5439]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>         i915#1825
>         <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +23
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html>
>         (i915#3023
>         <https://gitlab.freedesktop.org/drm/intel/issues/3023>) +18
>         other tests skip
>  *
>
>     igt@kms_hdr@static-toggle:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@kms_hdr@static-toggle.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         [i915#8228]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_hdr@static-toggle.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +1
>         other test skip
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@kms_panel_fitting@legacy.html>
>         ([i915#6301]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_panel_fitting@legacy.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>         [i915#5289]) +1 other test skip
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>

--------------M89tBG0wPpzWDhQ3LAATuAzy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 28.10.2023 05:21, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:169846329098.21164.2407494635189926115@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>lib/intel_batchbuffer: allow GTT size be not power of 2</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/125640/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/125640/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_13792_full -&gt;
        IGTPW_10075_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_10075_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_10075_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:lgci.bug.filing@intel.com">lgci.bug.filing@intel.com</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/index.html</a></p>
      <h2>Participating hosts (12 -&gt; 12)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_10075_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_cursor_legacy@cursor-vs-flip-toggle:
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-snb6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-snb6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html"
                moz-do-not-send="true">ABORT</a> +1 other test abort</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <br>
    Not related to i915.<br>
    <br>
    <blockquote type="cite"
cite="mid:169846329098.21164.2407494635189926115@emeril.freedesktop.org">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@gem_exec_fair@basic-pace@bcs0:
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@gem_exec_fair@basic-pace@bcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <br>
    Not related recurring bug [1][2][3].<br>
    <br>
    [1]: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/intel/-/issues/6247">https://gitlab.freedesktop.org/drm/intel/-/issues/6247</a><br>
    [2]:
<a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13788/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html">https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13788/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html</a><br>
    [3]:
<a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7560/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7560/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html</a><br>
    <br>
    Regards<br>
    Andrzej<br>
    <blockquote type="cite"
cite="mid:169846329098.21164.2407494635189926115@emeril.freedesktop.org">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_10075_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@api_intel_bb@blit-reloc-keep-cache.html"
                  moz-do-not-send="true">SKIP</a> ([i915#8411]) +2 other
                tests skip</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@api_intel_bb@blit-reloc-keep-cache.html"
                  moz-do-not-send="true">SKIP</a> ([i915#8411])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@debugfs_test@basic-hwmon:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@debugfs_test@basic-hwmon.html"
                moz-do-not-send="true">SKIP</a> ([i915#9318])</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@cold-reset-bound:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@device_reset@cold-reset-bound.html"
                moz-do-not-send="true">SKIP</a> ([i915#7701]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@all-busy-check-all:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@drm_fdinfo@all-busy-check-all.html"
                moz-do-not-send="true">SKIP</a> ([i915#8414]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@busy-idle-check-all@vcs1:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-18/igt@drm_fdinfo@busy-idle-check-all@vcs1.html"
                moz-do-not-send="true">SKIP</a> ([i915#8414]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@busy-idle@bcs0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@drm_fdinfo@busy-idle@bcs0.html"
                moz-do-not-send="true">SKIP</a> ([i915#8414]) +20 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#7742])</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@virtual-idle:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html"
                moz-do-not-send="true">FAIL</a> ([i915#7742])</li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@pan:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@fbdev@pan.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@fbdev@pan.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2582"
                moz-do-not-send="true">i915#2582</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_basic@multigpu-create-close:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@gem_basic@multigpu-create-close.html"
                moz-do-not-send="true">SKIP</a> ([i915#7697])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html"
                moz-do-not-send="true">SKIP</a> ([i915#7957])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a> / [i915#9323])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@gem_ccs@suspend-resume.html"
                  moz-do-not-send="true">SKIP</a> ([i915#9323])</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@gem_ccs@suspend-resume.html"
                  moz-do-not-send="true">SKIP</a> ([i915#9323])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-cpu-access-big:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html"
                moz-do-not-send="true">INCOMPLETE</a> ([i915#9364])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-set-pat:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-6/igt@gem_create@create-ext-set-pat.html"
                moz-do-not-send="true">SKIP</a> ([i915#8562])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_param@set-priority-not-supported:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gem_ctx_param@set-priority-not-supported.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109314"
                moz-do-not-send="true">fdo#109314</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@engines-hostile@vcs0:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-4/igt@gem_ctx_persistence@engines-hostile@vcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gem_ctx_persistence@engines-hostile@vcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2410"
                moz-do-not-send="true">i915#2410</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@hang:</p>
          <ul>
            <li>
              <p>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-4/igt@gem_ctx_persistence@hang.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_ctx_persistence@hang.html"
                  moz-do-not-send="true">SKIP</a> ([i915#6252])</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-19/igt@gem_ctx_persistence@hang.html"
                  moz-do-not-send="true">SKIP</a> ([i915#8555])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-many:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-many.html"
                moz-do-not-send="true">SKIP</a> ([i915#8555])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@legacy-engines-hostile@vebox:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-5/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2410"
                moz-do-not-send="true">i915#2410</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-snb4/igt@gem_ctx_persistence@legacy-engines-mixed-process.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/1099"
                moz-do-not-send="true">i915#1099</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html"
                moz-do-not-send="true">SKIP</a> ([i915#5882]) +9 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@reset-stress:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-dg1-17/igt@gem_eio@reset-stress.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-13/igt@gem_eio@reset-stress.html"
                moz-do-not-send="true">FAIL</a> ([i915#5784])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@wait-immediate:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gem_eio@wait-immediate.html"
                moz-do-not-send="true">ABORT</a> ([i915#9414])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-sync:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-2/igt@gem_exec_balancer@bonded-sync.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4771"
                moz-do-not-send="true">i915#4771</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-true-hang:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4812"
                moz-do-not-send="true">i915#4812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@hog:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@gem_exec_balancer@hog.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4812"
                moz-do-not-send="true">i915#4812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@noheartbeat:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@gem_exec_balancer@noheartbeat.html"
                moz-do-not-send="true">SKIP</a> ([i915#8555]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@gem_exec_balancer@parallel.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4525"
                moz-do-not-send="true">i915#4525</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gem_exec_fair@basic-none.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4473"
                moz-do-not-send="true">i915#4473</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4771"
                moz-do-not-send="true">i915#4771</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none@bcs0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@gem_exec_fair@basic-pace-share@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-throttle:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@gem_exec_fair@basic-throttle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3539"
                moz-do-not-send="true">i915#3539</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3539"
                moz-do-not-send="true">i915#3539</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4852"
                moz-do-not-send="true">i915#4852</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_params@rsvd2-dirt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-2/igt@gem_exec_params@rsvd2-dirt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freede" moz-do-not-send="true">i915#5107</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3281"
                moz-do-not-send="true">i915#3281</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-noreloc.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-noreloc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3281"
                moz-do-not-send="true">i915#3281</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-18/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3281"
                moz-do-not-send="true">i915#3281</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-read-active:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3281"
                moz-do-not-send="true">i915#3281</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-wc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gem_exec_reloc@basic-write-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3281"
                moz-do-not-send="true">i915#3281</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@preempt-queue:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@gem_exec_schedule@preempt-queue.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4537"
                moz-do-not-send="true">i915#4537</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4812"
                moz-do-not-send="true">i915#4812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@gem_exec_suspend@basic-s4-devices@smem.html"
                moz-do-not-send="true">ABORT</a> ([i915#7975] /
              [i915#8213]) +1 other test abort</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-threaded-none.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4860"
                moz-do-not-send="true">i915#4860</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4860"
                moz-do-not-send="true">i915#4860</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@gem_fenced_exec_thrash@too-many-fences.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4860"
                moz-do-not-send="true">i915#4860</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_evict@dontneed-evict-race:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@gem_lmem_evict@dontneed-evict-race.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4613"
                  moz-do-not-send="true">i915#4613</a> / [i915#7582])</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gem_lmem_evict@dontneed-evict-race.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4613"
                  moz-do-not-send="true">i915#4613</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-verify:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-2/igt@gem_lmem_swapping@parallel-random-verify.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4613"
                moz-do-not-send="true">i915#4613</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4613"
                moz-do-not-send="true">i915#4613</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_media_fill@media-fill:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@gem_media_fill@media-fill.html"
                moz-do-not-send="true">SKIP</a> ([i915#8289])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@gem_mmap_gtt@cpuset-big-copy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@set-cache-level:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@gem_mmap_wc@set-cache-level.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_mmap_wc@set-cache-level.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1850"
                moz-do-not-send="true">i915#1850</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@write:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@gem_mmap_wc@write.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4083"
                moz-do-not-send="true">i915#4083</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@write-read-distinct:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@gem_mmap_wc@write-read-distinct.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4083"
                moz-do-not-send="true">i915#4083</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@gem_partial_pwrite_pread@reads-uncached.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3282"
                moz-do-not-send="true">i915#3282</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3282"
                moz-do-not-send="true">i915#3282</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pread@snoop:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gem_pread@snoop.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3282"
                moz-do-not-send="true">i915#3282</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pwrite@basic-random:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@gem_pwrite@basic-random.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3282"
                moz-do-not-send="true">i915#3282</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@display-protected-crc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@gem_pxp@display-protected-crc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4270"
                moz-do-not-send="true">i915#4270</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@fail-invalid-protected-context:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@gem_pxp@fail-invalid-protected-context.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4270"
                moz-do-not-send="true">i915#4270</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-8/igt@gem_pxp@reject-modify-context-protection-off-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4270"
                moz-do-not-send="true">i915#4270</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4270"
                moz-do-not-send="true">i915#4270</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html"
                moz-do-not-send="true">SKIP</a> ([i915#8428]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_render_copy@y-tiled-to-vebox-linear.html"
                moz-do-not-send="true">SKIP</a> ([i915#768]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4079"
                moz-do-not-send="true">i915#4079</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_pread_basic:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-2/igt@gem_tiled_pread_basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4079"
                moz-do-not-send="true">i915#4079</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_unfence_active_buffers:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-5/igt@gem_unfence_active_buffers.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4879"
                moz-do-not-send="true">i915#4879</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@dmabuf-sync:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-glk4/igt@gem_userptr_blits@dmabuf-sync.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3323"
                moz-do-not-send="true">i915#3323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@dmabuf-unsync:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-3/igt@gem_userptr_blits@dmabuf-unsync.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3297"
                moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3297"
                moz-do-not-send="true">i915#3297</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4880"
                moz-do-not-send="true">i915#4880</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@mmap-offset-banned@gtt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@gem_userptr_blits@mmap-offset-banned@gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3297"
                moz-do-not-send="true">i915#3297</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-unmap:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3297"
                moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-6/igt@gem_userptr_blits@unsync-unmap-after-close.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3297"
                moz-do-not-send="true">i915#3297</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen7_exec_parse@basic-rejected:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@gen7_exec_parse@basic-rejected.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                moz-do-not-send="true">fdo#109289</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen7_exec_parse@cmd-crossing-page:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-7/igt@gen7_exec_parse@cmd-crossing-page.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                moz-do-not-send="true">fdo#109289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-single:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@gen9_exec_parse@allowed-single.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@gen9_exec_parse@allowed-single.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2527"
                moz-do-not-send="true">i915#2527</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gen9_exec_parse@basic-rejected-ctx-param.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2856"
                moz-do-not-send="true">i915#2856</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@secure-batches:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2527"
                moz-do-not-send="true">i915#2527</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@valid-registers:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@gen9_exec_parse@valid-registers.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2856"
                moz-do-not-send="true">i915#2856</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_hangman@detector@vcs0:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-5/igt@i915_hangman@detector@vcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@i915_hangman@detector@vcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#8456]) +2 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_hangman@engine-engine-hang@vcs0:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-2/igt@i915_hangman@engine-engine-hang@vcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@i915_hangman@engine-engine-hang@vcs0.html"
                moz-do-not-send="true">FAIL</a> ([i915#7069]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_hangman@gt-error-state-capture@ccs0:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-5/igt@i915_hangman@gt-error-state-capture@ccs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@i915_hangman@gt-error-state-capture@ccs0.html"
                moz-do-not-send="true">ABORT</a> ([i915#9414])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@load:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@i915_module_load@load.html"
                moz-do-not-send="true">SKIP</a> ([i915#6227])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-with-fault-injection:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html"
                  moz-do-not-send="true">DMESG-WARN</a> ([i915#9559])</p>
            </li>
            <li>
              <p>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html"
                  moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html"
                  moz-do-not-send="true">ABORT</a> ([i915#8489] /
                [i915#8668])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html"
                moz-do-not-send="true">SKIP</a> ([i915#7091])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-suspend:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@i915_pm_freq_api@freq-suspend.html"
                moz-do-not-send="true">SKIP</a> ([i915#8399]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3591"
                moz-do-not-send="true">i915#3591</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109293"
                  moz-do-not-send="true">fdo#109293</a> / <a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109506"
                  moz-do-not-send="true">fdo#109506</a>)</p>
            </li>
            <li>
              <p>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109293"
                  moz-do-not-send="true">fdo#109293</a> / <a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109506"
                  moz-do-not-send="true">fdo#109506</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-5/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html"
                moz-do-not-send="true">SKIP</a> ([i915#8431])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@min-max-config-idle:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html"
                moz-do-not-send="true">SKIP</a> ([i915#6621])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@thresholds-idle@gt0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@i915_pm_rps@thresholds-idle@gt0.html"
                moz-do-not-send="true">SKIP</a> ([i915#8925]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@thresholds-park@gt0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@i915_pm_rps@thresholds-park@gt0.html"
                moz-do-not-send="true">SKIP</a> ([i915#8925])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@thresholds-park@gt1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@i915_pm_rps@thresholds-park@gt1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / [i915#8925])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_sseu@full-enable:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@i915_pm_sseu@full-enable.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4387"
                  moz-do-not-send="true">i915#4387</a>)</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@i915_pm_sseu@full-enable.html"
                  moz-do-not-send="true">SKIP</a> ([i915#8437])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_power@sanity:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-3/igt@i915_power@sanity.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@i915_power@sanity.html"
                moz-do-not-send="true">SKIP</a> ([i915#7984])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@hwconfig_table:</p>
          <ul>
            <li>
              <p>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-9/igt@i915_query@hwconfig_table.html"
                  moz-do-not-send="true">SKIP</a> ([i915#6245])</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@i915_query@hwconfig_table.html"
                  moz-do-not-send="true">SKIP</a> ([i915#6245])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@query-topology-coherent-slice-mask:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@i915_query@query-topology-coherent-slice-mask.html"
                moz-do-not-send="true">SKIP</a> ([i915#6188])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@query-topology-unsupported:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@i915_query@query-topology-unsupported.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109302"
                moz-do-not-send="true">fdo#109302</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@mock@memory_region:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@i915_selftest@mock@memory_region.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#9311])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4215"
                moz-do-not-send="true">i915#4215</a> / [i915#5190])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-6/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html"
                moz-do-not-send="true">FAIL</a> ([i915#8247]) +3 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@crc@pipe-d-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-16/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html"
                moz-do-not-send="true">FAIL</a> ([i915#8247]) +3 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html"
                moz-do-not-send="true">SKIP</a> ([i915#9531])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1769"
                moz-do-not-send="true">i915#1769</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111614"
                moz-do-not-send="true">fdo#111614</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> ([i915#5286]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">FAIL</a> ([i915#5138])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-5/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a> / [i915#5286])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html"
                moz-do-not-send="true">FAIL</a> ([i915#5138])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-15/igt@kms_big_fb@linear-64bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3638"
                moz-do-not-send="true">i915#3638</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111614"
                moz-do-not-send="true">fdo#111614</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +20 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">SKIP</a> ([i915#5190]) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3743"
                moz-do-not-send="true">i915#3743</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4538"
                  moz-do-not-send="true">i915#4538</a> / [i915#5190]) +6
                other tests skip</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-12/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4538"
                  moz-do-not-send="true">i915#4538</a>) +1 other test
                skip</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=110723"
                moz-do-not-send="true">fdo#110723</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> ([i915#6187])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_joiner@2x-modeset:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@kms_big_joiner@2x-modeset.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2705"
                moz-do-not-send="true">i915#2705</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@kms_cdclk@mode-transition.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3742"
                moz-do-not-send="true">i915#3742</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4087"
                moz-do-not-send="true">i915#4087</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-50:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_chamelium_color@ctm-0-50.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-max:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@kms_chamelium_color@ctm-max.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@kms_chamelium_color@ctm-red-to-blue.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_chamelium_frames@hdmi-crc-fast.html"
                moz-do-not-send="true">SKIP</a> ([i915#7828]) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-7/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html"
                moz-do-not-send="true">SKIP</a> ([i915#7828]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd.html"
                moz-do-not-send="true">SKIP</a> ([i915#7828]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html"
                moz-do-not-send="true">SKIP</a> ([i915#7828]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-18/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html"
                moz-do-not-send="true">SKIP</a> ([i915#7828]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-0-50@pipe-b:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-6/igt@kms_color@ctm-0-50@pipe-b.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_color@ctm-0-50@pipe-b.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-0-50@pipe-c:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_color@ctm-0-50@pipe-c.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-2/igt@kms_content_protection@dp-mst-lic-type-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3299"
                moz-do-not-send="true">i915#3299</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-1.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3299"
                  moz-do-not-send="true">i915#3299</a>)</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-13/igt@kms_content_protection@dp-mst-lic-type-1.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3299"
                  moz-do-not-send="true">i915#3299</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@kms_content_protection@legacy.html"
                  moz-do-not-send="true">SKIP</a> ([i915#7118]) +1 other
                test skip</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-3/igt@kms_content_protection@legacy.html"
                  moz-do-not-send="true">SKIP</a> ([i915#6944])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-32x32.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / [i915#8814])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x512:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-3/igt@kms_cursor_crc@cursor-random-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=103375"
                moz-do-not-send="true">fdo#103375</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-snb1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">DMESG-WARN</a> ([i915#8841]) +3
              other tests dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4213"
                moz-do-not-send="true">i915#4213</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                moz-do-not-send="true">fdo#109274</a> / [i915#5354]) +3
              other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                moz-do-not-send="true">fdo#109274</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111767"
                moz-do-not-send="true">fdo#111767</a> / <a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4103"
                moz-do-not-send="true">i915#4103</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-16/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4.html"
                moz-do-not-send="true">SKIP</a> ([i915#9227])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-16/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4.html"
                moz-do-not-send="true">SKIP</a> ([i915#9226] /
              [i915#9261]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_aux_dev:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@kms_dp_aux_dev.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1257"
                  moz-do-not-send="true">i915#1257</a>)</p>
            </li>
            <li>
              <p>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-10/igt@kms_dp_aux_dev.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1257"
                  moz-do-not-send="true">i915#1257</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-6/igt@kms_draw_crc@draw-method-mmap-wc.html"
                  moz-do-not-send="true">SKIP</a> ([i915#8812])</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-15/igt@kms_draw_crc@draw-method-mmap-wc.html"
                  moz-do-not-send="true">SKIP</a> ([i915#8812])</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@kms_dsc@dsc-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3840"
                moz-do-not-send="true">i915#3840</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3840"
                moz-do-not-send="true">i915#3840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=110189"
                  moz-do-not-send="true">fdo#110189</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3955"
                  moz-do-not-send="true">i915#3955</a>)</p>
            </li>
            <li>
              <p>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-6/igt@kms_fbcon_fbt@psr-suspend.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3469"
                  moz-do-not-send="true">i915#3469</a>)</p>
            </li>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_fbcon_fbt@psr-suspend.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3469"
                  moz-do-not-send="true">i915#3469</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fence_pin_leak:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-16/igt@kms_fence_pin_leak.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4881"
                moz-do-not-send="true">i915#4881</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-blocking-wf_vblank:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_flip@2x-blocking-wf_vblank.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                moz-do-not-send="true">fdo#109274</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3637"
                moz-do-not-send="true">i915#3637</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-snb6/igt@kms_flip@2x-flip-vs-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-15/igt@kms_flip@2x-flip-vs-fences-interruptible.html"
                moz-do-not-send="true">SKIP</a> ([i915#8381])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                moz-do-not-send="true">fdo#109274</a> / <a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111767"
                moz-do-not-send="true">fdo#111767</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-3/igt@kms_flip@2x-nonexisting-fb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                moz-do-not-send="true">fdo#109274</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3637"
                moz-do-not-send="true">i915#3637</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_flip@dpms-off-confusion-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3637"
                moz-do-not-send="true">i915#3637</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-fences-interruptible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@kms_flip@flip-vs-fences-interruptible.html"
                moz-do-not-send="true">SKIP</a> ([i915#8381]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2587"
                moz-do-not-send="true">i915#2587</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2587"
                moz-do-not-send="true">i915#2587</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-load-detect:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_force_connector_basic@force-load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109285"
                moz-do-not-send="true">fdo#109285</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> ([i915#8708]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html"
                  moz-do-not-send="true">SKIP</a> ([i915#8708]) +22
                other tests skip</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html"
                  moz-do-not-send="true">SKIP</a> ([i915#8708]) +1 other
                test skip</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> ([i915#5354]) +28 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1825"
                moz-do-not-send="true">i915#1825</a>) +29 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109280"
                moz-do-not-send="true">fdo#109280</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3023"
                moz-do-not-send="true">i915#3023</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3458"
                moz-do-not-send="true">i915#3458</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/1825"
                moz-do-not-send="true">i915#1825</a>) +39 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-rte.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3458"
                moz-do-not-send="true">i915#3458</a>) +23 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-glk2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +24 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-metadata-sizes:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / [i915#8228]) +1
              other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-6/igt@kms_hdr@static-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / [i915#8228])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-dpms:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@kms_hdr@static-toggle-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / [i915#8228])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_hdr@static-toggle-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / [i915#8228]) +1
              other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4070"
                moz-do-not-send="true">i915#4070</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4816"
                moz-do-not-send="true">i915#4816</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-3/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                moz-do-not-send="true">fdo#109289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                moz-do-not-send="true">fdo#109289</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-yf:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_plane_lowres@tiling-yf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / [i915#8821])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3546"
                moz-do-not-send="true">i915#3546</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-size.html"
                moz-do-not-send="true">SKIP</a> ([i915#6953])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html"
                moz-do-not-send="true">FAIL</a> ([i915#8292])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html"
                moz-do-not-send="true">FAIL</a> ([i915#8292])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3.html"
                moz-do-not-send="true">SKIP</a> ([i915#5176] /
              [i915#9423]) +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> ([i915#5176] /
              [i915#9423]) +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-16/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4.html"
                moz-do-not-send="true">SKIP</a> ([i915#5235]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html"
                moz-do-not-send="true">SKIP</a> ([i915#5235]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / [i915#5235])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4.html"
                moz-do-not-send="true">SKIP</a> ([i915#5235]) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a> / [i915#6953] /
              [i915#8152])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a> / [i915#6953] /
              [i915#8152]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> ([i915#5235]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_properties@plane-properties-atomic:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-6/igt@kms_properties@plane-properties-atomic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_properties@plane-properties-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-6/igt@kms_psr2_sf@cursor-plane-update-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111068"
                moz-do-not-send="true">fdo#111068</a> / [i915#658])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-glk4/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / [i915#658])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111068"
                moz-do-not-send="true">fdo#111068</a> / [i915#658])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html"
                moz-do-not-send="true">SKIP</a> ([i915#658]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_psr2_su@page_flip-nv12.html"
                moz-do-not-send="true">SKIP</a> ([i915#658]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@cursor_mmap_cpu:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_psr@cursor_mmap_cpu.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1072"
                moz-do-not-send="true">i915#1072</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_primary_page_flip:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-6/igt@kms_psr@psr2_primary_page_flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=110189"
                moz-do-not-send="true">fdo#110189</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_sprite_plane_move:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@kms_psr@psr2_sprite_plane_move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1072"
                moz-do-not-send="true">i915#1072</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@sprite_blt:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-15/igt@kms_psr@sprite_blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1072"
                moz-do-not-send="true">i915#1072</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4078"
                moz-do-not-send="true">i915#4078</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-pixel-format:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-5/igt@kms_rotation_crc@bad-pixel-format.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4235"
                moz-do-not-send="true">i915#4235</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> ([i915#5289])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a> / [i915#5289])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4235"
                moz-do-not-send="true">i915#4235</a> / [i915#5190]) +1
              other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4235"
                moz-do-not-send="true">i915#4235</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic@pipe-a-vga-1:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-snb5/igt@kms_setmode@basic@pipe-a-vga-1.html"
                moz-do-not-send="true">FAIL</a> ([i915#5465]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@clone-exclusive-crtc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_setmode@clone-exclusive-crtc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern.html"
                moz-do-not-send="true">SKIP</a> ([i915#8623])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> ([i915#8623])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@kms_tv_load_detect@load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109309"
                moz-do-not-send="true">fdo#109309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html"
                moz-do-not-send="true">FAIL</a> ([i915#9196])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-18/igt@kms_vrr@flip-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flipline:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-2/igt@kms_vrr@flipline.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / [i915#8808])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@kms_writeback@writeback-check-output.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2437"
                  moz-do-not-send="true">i915#2437</a>)</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_writeback@writeback-check-output.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2437"
                  moz-do-not-send="true">i915#2437</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-6/igt@kms_writeback@writeback-fb-id.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2437"
                moz-do-not-send="true">i915#2437</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@mi-rpc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@perf@mi-rpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2434"
                moz-do-not-send="true">i915#2434</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-double-start@vcs1:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-6/igt@perf_pmu@busy-double-start@vcs1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@perf_pmu@busy-double-start@vcs1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4349"
                moz-do-not-send="true">i915#4349</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@cpu-hotplug:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@perf_pmu@cpu-hotplug.html"
                moz-do-not-send="true">SKIP</a> ([i915#8850])</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@module-unload:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@perf_pmu@module-unload.html"
                moz-do-not-send="true">FAIL</a> ([i915#5793])</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@rc6@other-idle-gt0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-10/igt@perf_pmu@rc6@other-idle-gt0.html"
                moz-do-not-send="true">SKIP</a> ([i915#8516])</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-flip:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-2/igt@prime_vgem@basic-fence-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-read:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@prime_vgem@basic-fence-read.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3291"
                moz-do-not-send="true">i915#3291</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                moz-do-not-send="true">i915#3708</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-write:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-13/igt@prime_vgem@basic-write.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@coherency-gtt:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@prime_vgem@coherency-gtt.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                  moz-do-not-send="true">i915#3708</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4077"
                  moz-do-not-send="true">i915#4077</a>)</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-16/igt@prime_vgem@coherency-gtt.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                  moz-do-not-send="true">i915#3708</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4077"
                  moz-do-not-send="true">i915#4077</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@sysfs_preempt_timeout@timeout@vecs0:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-5/igt@sysfs_preempt_timeout@timeout@vecs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-3/igt@sysfs_preempt_timeout@timeout@vecs0.html"
                moz-do-not-send="true">TIMEOUT</a> ([i915#8521])</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_get_bo_offset@get-bad-handle:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-15/igt@v3d/v3d_get_bo_offset@get-bad-handle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_perfmon@get-values-invalid-pointer:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-3/igt@v3d/v3d_perfmon@get-values-invalid-pointer.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109315"
                moz-do-not-send="true">fdo#109315</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_submit_cl@bad-perfmon:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@v3d/v3d_submit_cl@bad-perfmon.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_submit_cl@single-out-sync:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-5/igt@v3d/v3d_submit_cl@single-out-sync.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_wait_bo@bad-bo:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@v3d/v3d_wait_bo@bad-bo.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109315"
                moz-do-not-send="true">fdo#109315</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_mmap@mmap-bo:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@vc4/vc4_mmap@mmap-bo.html"
                moz-do-not-send="true">SKIP</a> ([i915#7711]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_tiling@get-bad-handle:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@vc4/vc4_tiling@get-bad-handle.html"
                moz-do-not-send="true">SKIP</a> ([i915#7711]) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_wait_bo@used-bo:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-8/igt@vc4/vc4_wait_bo@used-bo.html"
                moz-do-not-send="true">SKIP</a> ([i915#7711]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_wait_bo@used-bo-0ns:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-7/igt@vc4/vc4_wait_bo@used-bo-0ns.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +2 other tests
              skip</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@gem_ctx_exec@basic-nohangcheck:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html"
                moz-do-not-send="true">FAIL</a> ([i915#6268]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@legacy-engines-hang@blt:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html"
                moz-do-not-send="true">SKIP</a> ([i915#6252]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@gem_ctx_persistence@legacy-engines-hang@blt.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@hibernate:</p>
          <ul>
            <li>
              <p>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-tglu-10/igt@gem_eio@hibernate.html"
                  moz-do-not-send="true">ABORT</a> ([i915#7975] /
                [i915#8213] / [i915#8398]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-7/igt@gem_eio@hibernate.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-4/igt@gem_eio@hibernate.html"
                  moz-do-not-send="true">ABORT</a> ([i915#7975] /
                [i915#8213] / [i915#9414]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-2/igt@gem_eio@hibernate.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-dg2-3/igt@gem_eio@hibernate.html"
                  moz-do-not-send="true">ABORT</a> ([i915#7975] /
                [i915#8213]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@gem_eio@hibernate.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@in-flight-suspend:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-4/igt@gem_eio@in-flight-suspend.html"
                moz-do-not-send="true">ABORT</a> ([i915#7892] /
              [i915#9414]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@gem_eio@in-flight-suspend.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@vecs0:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@gem_exec_fair@basic-pace@vecs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_exec_fair@basic-pace@vecs0.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109313"
                moz-do-not-send="true">fdo#109313</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-wc:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@gem_exec_reloc@basic-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3281"
                moz-do-not-send="true">i915#3281</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_exec_reloc@basic-wc.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3282"
                moz-do-not-send="true">i915#3282</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html"
                moz-do-not-send="true">SKIP</a> ([i915#8411]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@batch-without-end:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@gen9_exec_parse@batch-without-end.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2527"
                moz-do-not-send="true">i915#2527</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gen9_exec_parse@batch-without-end.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">FAIL</a> ([i915#5138]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html"
                moz-do-not-send="true">PASS</a> +16 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc}:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html"
                moz-do-not-send="true">PASS</a> +9 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_plane@planar-pixel-format-settings}:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_plane@planar-pixel-format-settings.html"
                moz-do-not-send="true">SKIP</a> ([i915#9581]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_plane@planar-pixel-format-settings.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_pm_dc@dc5-dpms-negative}:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_pm_dc@dc5-dpms-negative.html"
                moz-do-not-send="true">SKIP</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_pm_dc@dc5-dpms-negative.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_pm_rpm@dpms-non-lpsp}:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-dg2-10/igt@kms_pm_rpm@dpms-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> ([i915#9519]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-1/igt@kms_pm_rpm@dpms-non-lpsp.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait}:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html"
                moz-do-not-send="true">SKIP</a> ([i915#9519]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-270:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-4/igt@kms_rotation_crc@primary-rotation-270.html"
                moz-do-not-send="true">INCOMPLETE</a> ([i915#8875])
              -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_rotation_crc@primary-rotation-270.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html"
                moz-do-not-send="true">FAIL</a> ([i915#9196]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@perf@whitelisted-registers-userspace-config:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-3/igt@perf@whitelisted-registers-userspace-config.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2017"
                moz-do-not-send="true">i915#2017</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@perf@whitelisted-registers-userspace-config.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-double-start@ccs0:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-6/igt@perf_pmu@busy-double-start@ccs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4349"
                moz-do-not-send="true">i915#4349</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-4/igt@perf_pmu@busy-double-start@ccs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-idle-check-all@vecs0:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-dg1-13/igt@perf_pmu@busy-idle-check-all@vecs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4349"
                moz-do-not-send="true">i915#4349</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg1-19/igt@perf_pmu@busy-idle-check-all@vecs0.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@perf_pmu@most-busy-idle-check-all@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4349"
                moz-do-not-send="true">i915#4349</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@perf_pmu@most-busy-idle-check-all@rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@gem_ccs@block-copy-compressed:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html"
                moz-do-not-send="true">SKIP</a> ([i915#7957])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2681"
                moz-do-not-send="true">i915#2681</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3591"
                moz-do-not-send="true">i915#3591</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html"
                moz-do-not-send="true">WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2681"
                moz-do-not-send="true">i915#2681</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@crc@pipe-b-edp-1:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-mtlp-3/igt@kms_async_flips@crc@pipe-b-edp-1.html"
                moz-do-not-send="true">FAIL</a> ([i915#8247]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-mtlp-7/igt@kms_async_flips@crc@pipe-b-edp-1.html"
                moz-do-not-send="true">DMESG-FAIL</a> ([i915#8561]) +1
              other test dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html"
                moz-do-not-send="true">SKIP</a> ([i915#9531]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1769"
                moz-do-not-send="true">i915#1769</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> ([i915#5286]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> ([i915#5286]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_big_fb@linear-32bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111614"
                moz-do-not-send="true">fdo#111614</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3638"
                moz-do-not-send="true">i915#3638</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111614"
                moz-do-not-send="true">fdo#111614</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3638"
                moz-do-not-send="true">i915#3638</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=110723"
                moz-do-not-send="true">fdo#110723</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=110723"
                moz-do-not-send="true">fdo#110723</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-1/igt@kms_big_fb@yf-tiled-addfb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3116"
                moz-do-not-send="true">i915#3116</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3116"
                moz-do-not-send="true">i915#3116</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-dg2-1/igt@kms_content_protection@type1.html"
                moz-do-not-send="true">SKIP</a> ([i915#7118]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-dg2-11/igt@kms_content_protection@type1.html"
                moz-do-not-send="true">SKIP</a> ([i915#7118] /
              [i915#7162])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-max-size:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_cursor_crc@cursor-random-max-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_cursor_crc@cursor-random-max-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-formats:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@kms_dsc@dsc-with-formats.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3840"
                moz-do-not-send="true">i915#3840</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/1825"
                moz-do-not-send="true">i915#1825</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3023"
                moz-do-not-send="true">i915#3023</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html"
                moz-do-not-send="true">SKIP</a> ([i915#5439]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/1825"
                moz-do-not-send="true">i915#1825</a>) +23 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3023"
                moz-do-not-send="true">i915#3023</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@kms_hdr@static-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / [i915#8228])
              -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_hdr@static-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-7/igt@kms_panel_fitting@legacy.html"
                moz-do-not-send="true">SKIP</a> ([i915#6301]) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-5/igt@kms_panel_fitting@legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13792/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10075/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a> / [i915#5289]) +1
              other test skip</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
    </blockquote>
    <br>
  </body>
</html>

--------------M89tBG0wPpzWDhQ3LAATuAzy--
