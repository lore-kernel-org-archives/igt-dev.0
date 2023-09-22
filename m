Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2189D10E64B
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 10:30:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------9upVitbkCCdBA4jKY3WQEvP0"
Message-ID: <6ce24dbb-6192-12f6-b37c-3d78f093d73c@linux.intel.com>
Date: Fri, 22 Sep 2023 12:29:19 +0200
MIME-Version: 1.0
To: igt-dev@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20230918164747.30171-1-nirmoy.das@intel.com>
 <169516905440.6466.6014862660630575358@emeril.freedesktop.org>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <169516905440.6466.6014862660630575358@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSWdub3Jl?=
 =?utf-8?q?_some_tests_on_MTL_which_=28rev4=29?=
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
--------------9upVitbkCCdBA4jKY3WQEvP0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/20/2023 2:17 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	Ignore some tests on MTL which (rev4)
> *URL:* 	https://patchwork.freedesktop.org/series/123602/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/index.html
>
>
>   CI Bug Log - changes from CI_DRM_13651_full -> IGTPW_9823_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_9823_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_9823_full, please notify your bug team 
> (lgci.bug.filing@intel.com) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/index.html
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
> IGTPW_9823_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_selftest@drm_dp_mst:
>
>      o
>
>         shard-mtlp: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_selftest@drm_dp_mst.html>
>         +2 other tests timeout
>
>      o
>
>         shard-rkl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@kms_selftest@drm_dp_mst.html>
>         +1 other test timeout
>
>  *
>
>     igt@kms_selftest@drm_format_helper:
>
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_selftest@drm_format_helper.html>
>         +2 other tests timeout
>  *
>
>     igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html>
>
Unrelated failure as those tests are not changed.


>  *
>
>
>     Known issues
>
> Here are the changes found in IGTPW_9823_full that come from known issues:
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
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@api_intel_bb@blit-reloc-keep-cache.html>
>         (i915#8411 <https://gitlab.freedesktop.org/drm/intel/issues/8411>)
>  *
>
>     igt@api_intel_bb@object-reloc-keep-cache:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@api_intel_bb@object-reloc-keep-cache.html>
>         (i915#8411 <https://gitlab.freedesktop.org/drm/intel/issues/8411>)
>  *
>
>     igt@device_reset@unbind-cold-reset-rebind:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@device_reset@unbind-cold-reset-rebind.html>
>         (i915#7701 <https://gitlab.freedesktop.org/drm/intel/issues/7701>)
>  *
>
>     igt@drm_fdinfo@all-busy-check-all:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@drm_fdinfo@all-busy-check-all.html>
>         (i915#8414
>         <https://gitlab.freedesktop.org/drm/intel/issues/8414>) +20
>         other tests skip
>  *
>
>     igt@drm_fdinfo@busy-hang@bcs0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-3/igt@drm_fdinfo@busy-hang@bcs0.html>
>         (i915#8414
>         <https://gitlab.freedesktop.org/drm/intel/issues/8414>) +11
>         other tests skip
>  *
>
>     igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-rkl-6/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html>
>         (i915#7742 <https://gitlab.freedesktop.org/drm/intel/issues/7742>)
>  *
>
>     igt@drm_fdinfo@virtual-busy-hang-all:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-19/igt@drm_fdinfo@virtual-busy-hang-all.html>
>         (i915#8414 <https://gitlab.freedesktop.org/drm/intel/issues/8414>)
>  *
>
>     igt@gem_caching@reads:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-1/igt@gem_caching@reads.html>
>         (i915#4873 <https://gitlab.freedesktop.org/drm/intel/issues/4873>)
>  *
>
>     igt@gem_ccs@ctrl-surf-copy:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@gem_ccs@ctrl-surf-copy.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +1
>         other test skip
>  *
>
>     igt@gem_ccs@suspend-resume:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@gem_ccs@suspend-resume.html>
>         (i915#9323
>         <https://gitlab.freedesktop.org/drm/intel/issues/9323>) +1
>         other test skip
>  *
>
>     igt@gem_create@create-ext-cpu-access-big:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@gem_create@create-ext-cpu-access-big.html>
>         (i915#6335 <https://gitlab.freedesktop.org/drm/intel/issues/6335>)
>  *
>
>     igt@gem_ctx_persistence@engines-hostile@vcs0:
>
>       o shard-mtlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-1/igt@gem_ctx_persistence@engines-hostile@vcs0.html>
>         (i915#9262
>         <https://gitlab.freedesktop.org/drm/intel/issues/9262>) +9
>         other tests abort
>  *
>
>     igt@gem_ctx_persistence@hang:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@gem_ctx_persistence@hang.html>
>         (i915#8555 <https://gitlab.freedesktop.org/drm/intel/issues/8555>)
>  *
>
>     igt@gem_ctx_persistence@heartbeat-stop:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html>
>         (i915#8555
>         <https://gitlab.freedesktop.org/drm/intel/issues/8555>) +1
>         other test skip
>  *
>
>     igt@gem_ctx_persistence@legacy-engines-mixed:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb4/igt@gem_ctx_persistence@legacy-engines-mixed.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099
>         <https://gitlab.freedesktop.org/drm/intel/issues/1099>) +1
>         other test skip
>  *
>
>     igt@gem_eio@hibernate:
>
>       o shard-dg2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@gem_eio@hibernate.html>
>         (i915#7975
>         <https://gitlab.freedesktop.org/drm/intel/issues/7975> /
>         i915#8213 <https://gitlab.freedesktop.org/drm/intel/issues/8213>)
>  *
>
>     igt@gem_eio@unwedge-stress:
>
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb4/igt@gem_eio@unwedge-stress.html>
>         (i915#8898 <https://gitlab.freedesktop.org/drm/intel/issues/8898>)
>  *
>
>     igt@gem_exec_balancer@bonded-semaphore:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@gem_exec_balancer@bonded-semaphore.html>
>         (i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>)
>  *
>
>     igt@gem_exec_balancer@bonded-sync:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@gem_exec_balancer@bonded-sync.html>
>         (i915#4771 <https://gitlab.freedesktop.org/drm/intel/issues/4771>)
>  *
>
>     igt@gem_exec_fair@basic-none-vip:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@gem_exec_fair@basic-none-vip.html>
>         (i915#4473
>         <https://gitlab.freedesktop.org/drm/intel/issues/4473> /
>         i915#4771
>         <https://gitlab.freedesktop.org/drm/intel/issues/4771>) +3
>         other tests skip
>  *
>
>     igt@gem_exec_fair@basic-pace-share@rcs0:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-tglu-9/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-9/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>  *
>
>     igt@gem_exec_fence@submit67:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@gem_exec_fence@submit67.html>
>         (i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>)
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-18/igt@gem_exec_fence@submit67.html>
>         (i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>)
>
>  *
>
>     igt@gem_exec_flush@basic-uc-set-default:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-6/igt@gem_exec_flush@basic-uc-set-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/intel/issues/3539>) +1
>         other test skip
>  *
>
>     igt@gem_exec_flush@basic-wb-rw-before-default:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@gem_exec_flush@basic-wb-rw-before-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/intel/issues/3539> /
>         i915#4852
>         <https://gitlab.freedesktop.org/drm/intel/issues/4852>) +3
>         other tests skip
>  *
>
>     igt@gem_exec_gttfill@multigpu-basic:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@gem_exec_gttfill@multigpu-basic.html>
>         (i915#7697 <https://gitlab.freedesktop.org/drm/intel/issues/7697>)
>  *
>
>     igt@gem_exec_params@rsvd2-dirt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@gem_exec_params@rsvd2-dirt.html>
>         (i915#5107 <https://gitlab.freedesktop.org/drm/intel/issues/5107>)
>  *
>
>     igt@gem_exec_reloc@basic-cpu-noreloc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-noreloc.html>
>         (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>)
>  *
>
>     igt@gem_exec_reloc@basic-cpu-read-noreloc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@gem_exec_reloc@basic-cpu-read-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +17
>         other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-cpu-active:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@gem_exec_reloc@basic-gtt-cpu-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +5
>         other tests skip
>  *
>
>     igt@gem_exec_schedule@deep@rcs0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@gem_exec_schedule@deep@rcs0.html>
>         (i915#4537 <https://gitlab.freedesktop.org/drm/intel/issues/4537>)
>  *
>
>     igt@gem_exec_schedule@preempt-queue-chain:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-chain.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/intel/issues/4537> /
>         i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>)
>  *
>
>     igt@gem_exec_suspend@basic-s3@smem:
>
>       o shard-snb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb2/igt@gem_exec_suspend@basic-s3@smem.html>
>         (i915#8841
>         <https://gitlab.freedesktop.org/drm/intel/issues/8841>) +8
>         other tests dmesg-warn
>  *
>
>     igt@gem_exec_suspend@basic-s4-devices@lmem0:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices@lmem0.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-3/igt@gem_exec_suspend@basic-s4-devices@lmem0.html>
>         (i915#7975
>         <https://gitlab.freedesktop.org/drm/intel/issues/7975> /
>         i915#8213 <https://gitlab.freedesktop.org/drm/intel/issues/8213>)
>  *
>
>     igt@gem_fence_thrash@bo-copy:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@gem_fence_thrash@bo-copy.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/intel/issues/4860>) +2
>         other tests skip
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-multi:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@gem_lmem_swapping@heavy-verify-multi.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +7
>         other tests skip
>  *
>
>     igt@gem_mmap@bad-size:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@gem_mmap@bad-size.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/intel/issues/4083>) +7
>         other tests skip
>  *
>
>     igt@gem_mmap_gtt@close-race:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-14/igt@gem_mmap_gtt@close-race.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2
>         other tests skip
>  *
>
>     igt@gem_mmap_gtt@cpuset-medium-copy:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@gem_mmap_gtt@cpuset-medium-copy.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +15
>         other tests skip
>  *
>
>     igt@gem_mmap_gtt@cpuset-medium-copy-xy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +12
>         other tests skip
>  *
>
>     igt@gem_mmap_wc@copy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@gem_mmap_wc@copy.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/intel/issues/4083>) +3
>         other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +7
>         other tests skip
>  *
>
>     igt@gem_pread@snoop:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-15/igt@gem_pread@snoop.html>
>         (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>  *
>
>     igt@gem_pxp@display-protected-crc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@gem_pxp@display-protected-crc.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +5
>         other tests skip
>  *
>
>     igt@gem_pxp@protected-raw-src-copy-not-readible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@gem_pxp@protected-raw-src-copy-not-readible.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +3
>         other tests skip
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-off-1:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-19/igt@gem_pxp@reject-modify-context-protection-off-1.html>
>         (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>  *
>
>     igt@gem_readwrite@beyond-eob:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-10/igt@gem_readwrite@beyond-eob.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +3
>         other tests skip
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html>
>         (i915#8428
>         <https://gitlab.freedesktop.org/drm/intel/issues/8428>) +8
>         other tests skip
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +2
>         other tests skip
>  *
>
>     igt@gem_set_tiling_vs_gtt:
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-17/igt@gem_set_tiling_vs_gtt.html>
>         (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>)
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-1/igt@gem_set_tiling_vs_gtt.html>
>         (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>)
>
>  *
>
>     igt@gem_softpin@evict-snoop-interruptible:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@gem_softpin@evict-snoop-interruptible.html>
>         (i915#4885 <https://gitlab.freedesktop.org/drm/intel/issues/4885>)
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@gem_softpin@evict-snoop-interruptible.html>
>         (i915#4885 <https://gitlab.freedesktop.org/drm/intel/issues/4885>)
>
>  *
>
>     igt@gem_unfence_active_buffers:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@gem_unfence_active_buffers.html>
>         (i915#4879 <https://gitlab.freedesktop.org/drm/intel/issues/4879>)
>  *
>
>     igt@gem_userptr_blits@access-control:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@gem_userptr_blits@access-control.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/intel/issues/3297>) +4
>         other tests skip
>  *
>
>     igt@gem_userptr_blits@create-destroy-unsync:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@gem_userptr_blits@create-destroy-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/intel/issues/3297>) +3
>         other tests skip
>  *
>
>     igt@gem_userptr_blits@map-fixed-invalidate-busy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate-busy.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/intel/issues/3297> /
>         i915#4880
>         <https://gitlab.freedesktop.org/drm/intel/issues/4880>) +1
>         other test skip
>  *
>
>     igt@gem_userptr_blits@unsync-overlap:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-2/igt@gem_userptr_blits@unsync-overlap.html>
>         (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>  *
>
>     igt@gem_userptr_blits@vma-merge:
>
>      o
>
>         shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@gem_userptr_blits@vma-merge.html>
>         (i915#3318 <https://gitlab.freedesktop.org/drm/intel/issues/3318>)
>
>      o
>
>         shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb2/igt@gem_userptr_blits@vma-merge.html>
>         (i915#2724 <https://gitlab.freedesktop.org/drm/intel/issues/2724>)
>
>  *
>
>     igt@gen3_render_tiledy_blits:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@gen3_render_tiledy_blits.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +9
>         other tests skip
>  *
>
>     igt@gen7_exec_parse@basic-allocation:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-4/igt@gen7_exec_parse@basic-allocation.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>  *
>
>     igt@gen7_exec_parse@basic-offset:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@gen7_exec_parse@basic-offset.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +7
>         other tests skip
>  *
>
>     igt@gen9_exec_parse@allowed-all:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@gen9_exec_parse@allowed-all.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +3
>         other tests skip
>  *
>
>     igt@gen9_exec_parse@bb-large:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-3/igt@gen9_exec_parse@bb-large.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +1
>         other test skip
>  *
>
>     igt@gen9_exec_parse@bb-start-param:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html>
>         (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>)
>  *
>
>     igt@i915_fb_tiling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@i915_fb_tiling.html>
>         (i915#4881 <https://gitlab.freedesktop.org/drm/intel/issues/4881>)
>  *
>
>     igt@i915_hangman@gt-engine-error@vcs0:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-mtlp-7/igt@i915_hangman@gt-engine-error@vcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@i915_hangman@gt-engine-error@vcs0.html>
>         (i915#7069 <https://gitlab.freedesktop.org/drm/intel/issues/7069>)
>  *
>
>     igt@i915_hwmon@hwmon-read:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@i915_hwmon@hwmon-read.html>
>         (i915#7707 <https://gitlab.freedesktop.org/drm/intel/issues/7707>)
>  *
>
>     igt@i915_module_load@load:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@i915_module_load@load.html>
>         (i915#6227 <https://gitlab.freedesktop.org/drm/intel/issues/6227>)
>  *
>
>     igt@i915_module_load@reload-with-fault-injection:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html>
>         (i915#9200 <https://gitlab.freedesktop.org/drm/intel/issues/9200>)
>  *
>
>     igt@i915_pm_freq_mult@media-freq@gt1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@i915_pm_freq_mult@media-freq@gt1.html>
>         (i915#6590
>         <https://gitlab.freedesktop.org/drm/intel/issues/6590>) +1
>         other test skip
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>         (i915#3591
>         <https://gitlab.freedesktop.org/drm/intel/issues/3591>) +1
>         other test fail
>  *
>
>     igt@i915_pm_rpm@dpms-lpsp:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-rkl-7/igt@i915_pm_rpm@dpms-lpsp.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@i915_pm_rpm@dpms-lpsp.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) +2
>         other tests skip
>  *
>
>     igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) +1
>         other test skip
>  *
>
>     igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html>
>         (i915#8431 <https://gitlab.freedesktop.org/drm/intel/issues/8431>)
>  *
>
>     igt@i915_pm_rpm@modeset-lpsp-stress:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@i915_pm_rpm@modeset-lpsp-stress.html>
>         (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>  *
>
>     igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-18/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>  *
>
>     igt@i915_pm_rps@basic-api:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@i915_pm_rps@basic-api.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>  *
>
>     igt@i915_pm_rps@thresholds-idle-park@gt0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@i915_pm_rps@thresholds-idle-park@gt0.html>
>         (i915#8925 <https://gitlab.freedesktop.org/drm/intel/issues/8925>)
>  *
>
>     igt@i915_pm_rps@waitboost:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@i915_pm_rps@waitboost.html>
>         (i915#8346 <https://gitlab.freedesktop.org/drm/intel/issues/8346>)
>  *
>
>     igt@i915_query@query-topology-unsupported:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@i915_query@query-topology-unsupported.html>
>         (fdo#109302 <https://bugs.freedesktop.org/show_bug.cgi?id=109302>)
>  *
>
>     igt@i915_selftest@mock@memory_region:
>
>       o shard-mtlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@i915_selftest@mock@memory_region.html>
>         (i915#9311
>         <https://gitlab.freedesktop.org/drm/intel/issues/9311> /
>         i915#9312 <https://gitlab.freedesktop.org/drm/intel/issues/9312>)
>  *
>
>     igt@i915_suspend@basic-s3-without-i915:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-rkl-2/igt@i915_suspend@basic-s3-without-i915.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-6/igt@i915_suspend@basic-s3-without-i915.html>
>         (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>  *
>
>     igt@i915_suspend@sysfs-reader:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-16/igt@i915_suspend@sysfs-reader.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-19/igt@i915_suspend@sysfs-reader.html>
>         (fdo#103375
>         <https://bugs.freedesktop.org/show_bug.cgi?id=103375>) +2
>         other tests fail
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
>  *
>
>     igt@kms_addfb_basic@basic-x-tiled-legacy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +1
>         other test skip
>  *
>
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html>
>         (i915#4215
>         <https://gitlab.freedesktop.org/drm/intel/issues/4215> /
>         i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
>  *
>
>     igt@kms_addfb_basic@bo-too-small-due-to-tiling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html>
>         (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>)
>  *
>
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>         (i915#3826 <https://gitlab.freedesktop.org/drm/intel/issues/3826>)
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc.html>
>         (i915#8709
>         <https://gitlab.freedesktop.org/drm/intel/issues/8709>) +11
>         other tests skip
>  *
>
>     igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html>
>         (i915#8247
>         <https://gitlab.freedesktop.org/drm/intel/issues/8247>) +3
>         other tests fail
>  *
>
>     igt@kms_async_flips@invalid-async-flip:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@kms_async_flips@invalid-async-flip.html>
>         (i915#6228 <https://gitlab.freedesktop.org/drm/intel/issues/6228>)
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +4
>         other tests skip
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-17/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/intel/issues/4538> /
>         i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614> /
>         i915#3638 <https://gitlab.freedesktop.org/drm/intel/issues/3638>)
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (i915#6187
>         <https://gitlab.freedesktop.org/drm/intel/issues/6187>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (i915#3743
>         <https://gitlab.freedesktop.org/drm/intel/issues/3743>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +9
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +10
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-15/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html>
>         (i915#4538 <https://gitlab.freedesktop.org/drm/intel/issues/4538>)
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>         (fdo#110723
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110723>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-17/igt@kms_big_fb@yf-tiled-addfb.html>
>         (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/intel/issues/4538> /
>         i915#5190
>         <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +5
>         other tests skip
>  *
>
>     igt@kms_big_joiner@invalid-modeset:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-4/igt@kms_big_joiner@invalid-modeset.html>
>         (i915#2705 <https://gitlab.freedesktop.org/drm/intel/issues/2705>)
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@kms_big_joiner@invalid-modeset.html>
>         (i915#2705 <https://gitlab.freedesktop.org/drm/intel/issues/2705>)
>
>  *
>
>     igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html>
>         (i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886> /
>         i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +13
>         other tests skip
>  *
>
>     igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>  *
>
>     igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +50
>         other tests skip
>  *
>
>     igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-6/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>  *
>
>     igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-glk3/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-apl2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>  *
>
>     igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-13/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>  *
>
>     igt@kms_ccs@pipe-c-ccs-on-another-bo-4_tiled_mtl_rc_ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-7/igt@kms_ccs@pipe-c-ccs-on-another-bo-4_tiled_mtl_rc_ccs.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +14
>         other tests skip
>  *
>
>     igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>  *
>
>     igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-glk6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +29
>         other tests skip
>  *
>
>     igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +22
>         other tests skip
>  *
>
>     igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_mc_ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-17/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_mc_ccs.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354> /
>         i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-15/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354> /
>         i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +2
>         other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (i915#4087
>         <https://gitlab.freedesktop.org/drm/intel/issues/4087> /
>         i915#7213 <https://gitlab.freedesktop.org/drm/intel/issues/7213>)
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-1/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html>
>         (i915#4087
>         <https://gitlab.freedesktop.org/drm/intel/issues/4087>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-50:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@kms_chamelium_color@ctm-0-50.html>
>         (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@kms_chamelium_color@ctm-0-50.html>
>         (fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         other test skip
>
>  *
>
>     igt@kms_chamelium_edid@dp-edid-resolution-list:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_chamelium_edid@dp-edid-resolution-list.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +9
>         other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-13/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html>
>         (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>)
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-1/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +14
>         other tests skip
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@kms_content_protection@atomic-dpms.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/intel/issues/6944>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (i915#3299 <https://gitlab.freedesktop.org/drm/intel/issues/3299>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-1.html>
>         (i915#3299
>         <https://gitlab.freedesktop.org/drm/intel/issues/3299>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-19/igt@kms_content_protection@legacy.html>
>         (i915#7116 <https://gitlab.freedesktop.org/drm/intel/issues/7116>)
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@kms_content_protection@srm.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/intel/issues/7118>) +3
>         other tests skip
>  *
>
>     igt@kms_content_protection@uevent@pipe-a-dp-4:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_content_protection@uevent@pipe-a-dp-4.html>
>         (i915#1339 <https://gitlab.freedesktop.org/drm/intel/issues/1339>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (i915#3359
>         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x170:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x10:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +6
>         other tests skip
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-15/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +1
>         other test skip
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#8814
>         <https://gitlab.freedesktop.org/drm/intel/issues/8814>) +4
>         other tests skip
>
>  *
>
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg2-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html>
>         (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111767
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111767> /
>         i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>)
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +7
>         other tests skip
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html>
>         (i915#3546
>         <https://gitlab.freedesktop.org/drm/intel/issues/3546>) +3
>         other tests skip
>
>  *
>
>     igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2.html>
>         (i915#9226
>         <https://gitlab.freedesktop.org/drm/intel/issues/9226> /
>         i915#9261
>         <https://gitlab.freedesktop.org/drm/intel/issues/9261>) +1
>         other test skip
>  *
>
>     igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2.html>
>         (i915#9227 <https://gitlab.freedesktop.org/drm/intel/issues/9227>)
>  *
>
>     igt@kms_display_modes@extended-mode-basic:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@kms_display_modes@extended-mode-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#8827 <https://gitlab.freedesktop.org/drm/intel/issues/8827>)
>  *
>
>     igt@kms_display_modes@mst-extended-mode-negative:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-1/igt@kms_display_modes@mst-extended-mode-negative.html>
>         (i915#8588 <https://gitlab.freedesktop.org/drm/intel/issues/8588>)
>  *
>
>     igt@kms_draw_crc@draw-method-mmap-gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@kms_draw_crc@draw-method-mmap-gtt.html>
>         (i915#8812 <https://gitlab.freedesktop.org/drm/intel/issues/8812>)
>  *
>
>     igt@kms_draw_crc@draw-method-mmap-wc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html>
>         (i915#8812
>         <https://gitlab.freedesktop.org/drm/intel/issues/8812>) +1
>         other test skip
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@kms_dsc@dsc-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#3840
>         <https://gitlab.freedesktop.org/drm/intel/issues/3840> /
>         i915#9159 <https://gitlab.freedesktop.org/drm/intel/issues/9159>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-10/igt@kms_dsc@dsc-with-bpc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#3840 <https://gitlab.freedesktop.org/drm/intel/issues/3840>)
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>  *
>
>     igt@kms_flip@2x-absolute-wf_vblank:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_flip@2x-absolute-wf_vblank.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +5
>         other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-fences:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@kms_flip@2x-flip-vs-fences.html>
>         (i915#8381 <https://gitlab.freedesktop.org/drm/intel/issues/8381>)
>  *
>
>     igt@kms_flip@2x-flip-vs-fences-interruptible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>         (i915#8381 <https://gitlab.freedesktop.org/drm/intel/issues/8381>)
>  *
>
>     igt@kms_flip@2x-flip-vs-panning:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@kms_flip@2x-flip-vs-panning.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +1
>         other test skip
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/intel/issues/3637>) +9
>         other tests skip
>  *
>
>     igt@kms_flip@flip-vs-rmfb@b-vga1:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-snb6/igt@kms_flip@flip-vs-rmfb@b-vga1.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb7/igt@kms_flip@flip-vs-rmfb@b-vga1.html>
>         (i915#8865 <https://gitlab.freedesktop.org/drm/intel/issues/8865>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>         i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +4
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html>
>         (i915#8810 <https://gitlab.freedesktop.org/drm/intel/issues/8810>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672> /
>         i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +1
>         other test skip
>  *
>
>     igt@kms_force_connector_basic@force-load-detect:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@kms_force_connector_basic@force-load-detect.html>
>         (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +17
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +14
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>         i915#1825
>         <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/intel/issues/3458>) +13
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +47
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +47
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html>
>         (fdo#110189
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110189>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/intel/issues/3458>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html>
>         (i915#3023
>         <https://gitlab.freedesktop.org/drm/intel/issues/3023>) +3
>         other tests skip
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#8228
>         <https://gitlab.freedesktop.org/drm/intel/issues/8228>) +1
>         other test skip
>  *
>
>     igt@kms_hdr@static-swap:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@kms_hdr@static-swap.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#8228 <https://gitlab.freedesktop.org/drm/intel/issues/8228>)
>  *
>
>     igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html>
>         (i915#6403
>         <https://gitlab.freedesktop.org/drm/intel/issues/6403>) +3
>         other tests skip
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-mtlp-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html>
>         (i915#9262 <https://gitlab.freedesktop.org/drm/intel/issues/9262>)
>  *
>
>     igt@kms_plane_multiple@tiling-y:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@kms_plane_multiple@tiling-y.html>
>         (i915#8806 <https://gitlab.freedesktop.org/drm/intel/issues/8806>)
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-1/igt@kms_plane_multiple@tiling-yf.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#8806 <https://gitlab.freedesktop.org/drm/intel/issues/8806>)
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html>
>         (i915#8292 <https://gitlab.freedesktop.org/drm/intel/issues/8292>)
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html>
>         (i915#8292 <https://gitlab.freedesktop.org/drm/intel/issues/8292>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +3
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +5
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-c-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-c-edp-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +9
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +11
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +209
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +7
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-dp-1:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-apl2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-dp-1.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +43
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +11
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +15
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +19
>         other tests skip
>  *
>
>     igt@kms_prime@basic-modeset-hybrid:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_prime@basic-modeset-hybrid.html>
>         (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524>)
>  *
>
>     igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-glk8/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>
>  *
>
>     igt@kms_psr@psr2_cursor_mmap_cpu:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-5/igt@kms_psr@psr2_cursor_mmap_cpu.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@bad-pixel-format:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-1/igt@kms_rotation_crc@bad-pixel-format.html>
>         (i915#4235
>         <https://gitlab.freedesktop.org/drm/intel/issues/4235>) +3
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-rkl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>         (i915#8875 <https://gitlab.freedesktop.org/drm/intel/issues/8875>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>         (i915#4235
>         <https://gitlab.freedesktop.org/drm/intel/issues/4235> /
>         i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>         i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>
>  *
>
>     igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d.html>
>         (i915#5030
>         <https://gitlab.freedesktop.org/drm/intel/issues/5030>) +3
>         other tests skip
>  *
>
>     igt@kms_setmode@basic@pipe-a-hdmi-a-1:
>
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html>
>         (i915#5465
>         <https://gitlab.freedesktop.org/drm/intel/issues/5465>) +1
>         other test fail
>  *
>
>     igt@kms_setmode@invalid-clone-exclusive-crtc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#8823 <https://gitlab.freedesktop.org/drm/intel/issues/8823>)
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak-pipe-a:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html>
>         (i915#9196 <https://gitlab.freedesktop.org/drm/intel/issues/9196>)
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak-pipe-b:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-18/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-19/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html>
>         (i915#9196 <https://gitlab.freedesktop.org/drm/intel/issues/9196>)
>  *
>
>     igt@kms_vblank@pipe-c-wait-forked-busy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@kms_vblank@pipe-c-wait-forked-busy.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#6768
>         <https://gitlab.freedesktop.org/drm/intel/issues/6768>) +1
>         other test skip
>  *
>
>     igt@kms_vblank@pipe-d-query-forked-busy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-1/igt@kms_vblank@pipe-d-query-forked-busy.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#533 <https://gitlab.freedesktop.org/drm/intel/issues/533>
>         / i915#6768
>         <https://gitlab.freedesktop.org/drm/intel/issues/6768>) +2
>         other tests skip
>  *
>
>     igt@kms_writeback@writeback-invalid-parameters:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@kms_writeback@writeback-invalid-parameters.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>  *
>
>     igt@perf@buffer-fill@0-rcs0:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-3/igt@perf@buffer-fill@0-rcs0.html>
>         (i915#7823
>         <https://gitlab.freedesktop.org/drm/intel/issues/7823> /
>         i915#9265 <https://gitlab.freedesktop.org/drm/intel/issues/9265>)
>  *
>
>     igt@perf@gen12-group-concurrent-oa-buffer-read:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@perf@gen12-group-concurrent-oa-buffer-read.html>
>         (i915#9259 <https://gitlab.freedesktop.org/drm/intel/issues/9259>)
>  *
>
>     igt@perf@polling-small-buf:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@perf@polling-small-buf.html>
>         (i915#1722 <https://gitlab.freedesktop.org/drm/intel/issues/1722>)
>  *
>
>     igt@perf_pmu@cpu-hotplug:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@perf_pmu@cpu-hotplug.html>
>         (i915#8850 <https://gitlab.freedesktop.org/drm/intel/issues/8850>)
>  *
>
>     igt@perf_pmu@event-wait@rcs0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@perf_pmu@event-wait@rcs0.html>
>         (fdo#112283 <https://bugs.freedesktop.org/show_bug.cgi?id=112283>)
>  *
>
>     igt@perf_pmu@frequency@gt0:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@perf_pmu@frequency@gt0.html>
>         (i915#6806 <https://gitlab.freedesktop.org/drm/intel/issues/6806>)
>  *
>
>     igt@perf_pmu@module-unload:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-6/igt@perf_pmu@module-unload.html>
>         (i915#5793
>         <https://gitlab.freedesktop.org/drm/intel/issues/5793> /
>         i915#6121 <https://gitlab.freedesktop.org/drm/intel/issues/6121>)
>  *
>
>     igt@perf_pmu@rc6-suspend:
>
>       o shard-mtlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@perf_pmu@rc6-suspend.html>
>         (i915#9262
>         <https://gitlab.freedesktop.org/drm/intel/issues/9262> /
>         i915#9268 <https://gitlab.freedesktop.org/drm/intel/issues/9268>)
>  *
>
>     igt@prime_vgem@basic-blt:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@prime_vgem@basic-blt.html>
>         (i915#8445
>         <https://gitlab.freedesktop.org/drm/intel/issues/8445>) +1
>         other test fail
>  *
>
>     igt@prime_vgem@basic-read:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@prime_vgem@basic-read.html>
>         (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>  *
>
>     igt@prime_vgem@basic-write:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-3/igt@prime_vgem@basic-write.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/intel/issues/3291> /
>         i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>  *
>
>     igt@prime_vgem@fence-flip-hang:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@prime_vgem@fence-flip-hang.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +1
>         other test skip
>  *
>
>     igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-19/igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +2
>         other tests skip
>  *
>
>     igt@v3d/v3d_perfmon@create-perfmon-0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-7/igt@v3d/v3d_perfmon@create-perfmon-0.html>
>         (fdo#109315
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109315>) +1
>         other test skip
>  *
>
>     igt@v3d/v3d_submit_cl@bad-multisync-out-sync:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-6/igt@v3d/v3d_submit_cl@bad-multisync-out-sync.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +12
>         other tests skip
>  *
>
>     igt@v3d/v3d_submit_csd@bad-bo:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@v3d/v3d_submit_csd@bad-bo.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +15
>         other tests skip
>  *
>
>     igt@vc4/vc4_mmap@mmap-bo:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-5/igt@vc4/vc4_mmap@mmap-bo.html>
>         (i915#7711
>         <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +7
>         other tests skip
>  *
>
>     igt@vc4/vc4_perfmon@destroy-valid-perfmon:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-14/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html>
>         (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>)
>  *
>
>     igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html>
>         (i915#7711
>         <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +10
>         other tests skip
>  *
>
>     igt@vc4/vc4_tiling@set-bad-modifier:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@vc4/vc4_tiling@set-bad-modifier.html>
>         (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>)
>
>
>         Possible fixes
>
>  *
>
>     igt@core_hotunplug@unbind-rebind:
>
>       o shard-snb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-snb1/igt@core_hotunplug@unbind-rebind.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb7/igt@core_hotunplug@unbind-rebind.html>
>  *
>
>     igt@gem_ctx_exec@basic-nohangcheck:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-tglu-10/igt@gem_ctx_exec@basic-nohangcheck.html>
>         (i915#6268
>         <https://gitlab.freedesktop.org/drm/intel/issues/6268>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-5/igt@gem_ctx_exec@basic-nohangcheck.html>
>  *
>
>     igt@gem_eio@reset-stress:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-14/igt@gem_eio@reset-stress.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/intel/issues/5784>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-17/igt@gem_eio@reset-stress.html>
>  *
>
>     igt@gem_exec_endless@dispatch@vecs0:
>
>       o shard-dg1: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-16/igt@gem_exec_endless@dispatch@vecs0.html>
>         (i915#3778
>         <https://gitlab.freedesktop.org/drm/intel/issues/3778>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-15/igt@gem_exec_endless@dispatch@vecs0.html>
>  *
>
>     igt@gem_exec_fair@basic-flow@rcs0:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-tglu-6/igt@gem_exec_fair@basic-flow@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-5/igt@gem_exec_fair@basic-flow@rcs0.html>
>  *
>
>     igt@gem_lmem_swapping@smem-oom@lmem0:
>
>       o shard-dg1: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>         (i915#5493
>         <https://gitlab.freedesktop.org/drm/intel/issues/5493>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>  *
>
>     igt@gen9_exec_parse@allowed-single:
>
>       o shard-apl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-apl4/igt@gen9_exec_parse@allowed-single.html>
>         (i915#5566
>         <https://gitlab.freedesktop.org/drm/intel/issues/5566>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-apl2/igt@gen9_exec_parse@allowed-single.html>
>  *
>
>     igt@i915_pm_rpm@dpms-non-lpsp:
>
>      o
>
>         shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-1/igt@i915_pm_rpm@dpms-non-lpsp.html>
>
>      o
>
>         shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-15/igt@i915_pm_rpm@dpms-non-lpsp.html>
>         +1 other test pass
>
>  *
>
>     igt@i915_pm_rpm@modeset-non-lpsp:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@i915_pm_rpm@modeset-non-lpsp.html>
>  *
>
>     igt@i915_selftest@live@gt_heartbeat:
>
>       o shard-glk: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-glk2/igt@i915_selftest@live@gt_heartbeat.html>
>         (i915#5334
>         <https://gitlab.freedesktop.org/drm/intel/issues/5334>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-glk7/igt@i915_selftest@live@gt_heartbeat.html>
>  *
>
>     igt@i915_suspend@basic-s3-without-i915:
>
>       o shard-dg1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-17/igt@i915_suspend@basic-s3-without-i915.html>
>         (i915#4391
>         <https://gitlab.freedesktop.org/drm/intel/issues/4391> /
>         i915#4423
>         <https://gitlab.freedesktop.org/drm/intel/issues/4423>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-15/igt@i915_suspend@basic-s3-without-i915.html>
>  *
>
>     igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs:
>
>       o shard-dg1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-17/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/intel/issues/4423>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-16/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs.html>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/intel/issues/2346>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/intel/issues/2346>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>  *
>
>     igt@kms_flip@flip-vs-suspend@b-edp1:
>
>       o shard-mtlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-mtlp-4/igt@kms_flip@flip-vs-suspend@b-edp1.html>
>         (i915#9262
>         <https://gitlab.freedesktop.org/drm/intel/issues/9262>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@kms_flip@flip-vs-suspend@b-edp1.html>
>         +2 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html>
>         (i915#6880
>         <https://gitlab.freedesktop.org/drm/intel/issues/6880>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html>
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
>
>       o shard-apl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html>
>  *
>
>     igt@kms_plane@pixel-format@pipe-a-planes:
>
>       o shard-glk: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-glk2/igt@kms_plane@pixel-format@pipe-a-planes.html>
>         (i915#118
>         <https://gitlab.freedesktop.org/drm/intel/issues/118>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-glk6/igt@kms_plane@pixel-format@pipe-a-planes.html>
>  *
>
>     {igt@kms_pm_dc@dc6-dpms}:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html>
>         (i915#9295
>         <https://gitlab.freedesktop.org/drm/intel/issues/9295>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html>
>  *
>
>     igt@kms_vblank@pipe-b-ts-continuation-suspend:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg2-5/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>         (fdo#103375
>         <https://bugs.freedesktop.org/show_bug.cgi?id=103375>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-5/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>         +1 other test pass
>  *
>
>     igt@perf_pmu@busy-double-start@vecs1:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/intel/issues/4349>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html>
>         +3 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@device_reset@unbind-reset-rebind:
>
>       o shard-dg1: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html>
>         (i915#4983
>         <https://gitlab.freedesktop.org/drm/intel/issues/4983> /
>         i915#7461
>         <https://gitlab.freedesktop.org/drm/intel/issues/7461>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-14/igt@device_reset@unbind-reset-rebind.html>
>         (i915#4983 <https://gitlab.freedesktop.org/drm/intel/issues/4983>)
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle@bcs0:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html>
>         (i915#2681
>         <https://gitlab.freedesktop.org/drm/intel/issues/2681> /
>         i915#3591
>         <https://gitlab.freedesktop.org/drm/intel/issues/3591>) ->
>         WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html>
>         (i915#2681 <https://gitlab.freedesktop.org/drm/intel/issues/2681>)
>  *
>
>     igt@kms_async_flips@crc@pipe-d-edp-1:
>
>       o shard-mtlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-mtlp-4/igt@kms_async_flips@crc@pipe-d-edp-1.html>
>         (i915#8561
>         <https://gitlab.freedesktop.org/drm/intel/issues/8561>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_async_flips@crc@pipe-d-edp-1.html>
>         (i915#8247
>         <https://gitlab.freedesktop.org/drm/intel/issues/8247>) +2
>         other tests fail
>  *
>
>     igt@kms_psr@cursor_plane_move:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-15/igt@kms_psr@cursor_plane_move.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-16/igt@kms_psr@cursor_plane_move.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072> /
>         i915#4078
>         <https://gitlab.freedesktop.org/drm/intel/issues/4078>) +1
>         other test skip
>  *
>
>     igt@perf_pmu@rc6@other-idle-gt1:
>
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-mtlp-2/igt@perf_pmu@rc6@other-idle-gt1.html>
>         (i915#8537
>         <https://gitlab.freedesktop.org/drm/intel/issues/8537>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@perf_pmu@rc6@other-idle-gt1.html>
>         (i915#9268 <https://gitlab.freedesktop.org/drm/intel/issues/9268>)
>  *
>
>     igt@perf_pmu@rc6@runtime-pm-long-gt1:
>
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-mtlp-2/igt@perf_pmu@rc6@runtime-pm-long-gt1.html>
>         (i915#8537
>         <https://gitlab.freedesktop.org/drm/intel/issues/8537>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@perf_pmu@rc6@runtime-pm-long-gt1.html>
>         (i915#9335
>         <https://gitlab.freedesktop.org/drm/intel/issues/9335>) +1
>         other test dmesg-warn
>  *
>
>     igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html>
>         (i915#5493
>         <https://gitlab.freedesktop.org/drm/intel/issues/5493>) ->
>         CRASH
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html>
>         (i915#9351 <https://gitlab.freedesktop.org/drm/intel/issues/9351>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7493 -> IGTPW_9823
>   * Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_13651: 61b71c3f061a44a6ab1dcf756918886aa03a5480 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_9823: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/index.html
> IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
>
--------------9upVitbkCCdBA4jKY3WQEvP0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/20/2023 2:17 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:169516905440.6466.6014862660630575358@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>Ignore some tests on MTL which (rev4)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/123602/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/123602/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
                href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_13651_full -&gt;
        IGTPW_9823_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_9823_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_9823_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:lgci.bug.filing@intel.com">lgci.bug.filing@intel.com</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/index.html</a></p>
      <h2>Participating hosts (9 -&gt; 9)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_9823_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_selftest@drm_dp_mst:</p>
          <ul>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_selftest@drm_dp_mst.html"
                  moz-do-not-send="true">TIMEOUT</a> +2 other tests
                timeout</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@kms_selftest@drm_dp_mst.html"
                  moz-do-not-send="true">TIMEOUT</a> +1 other test
                timeout</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_selftest@drm_format_helper:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_selftest@drm_format_helper.html"
                moz-do-not-send="true">TIMEOUT</a> +2 other tests
              timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>Unrelated failure as those tests are not changed.</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:169516905440.6466.6014862660630575358@emeril.freedesktop.org">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_9823_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@api_intel_bb@blit-reloc-keep-cache.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8411"
                moz-do-not-send="true">i915#8411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@api_intel_bb@object-reloc-keep-cache:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@api_intel_bb@object-reloc-keep-cache.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8411"
                moz-do-not-send="true">i915#8411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@unbind-cold-reset-rebind:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@device_reset@unbind-cold-reset-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7701"
                moz-do-not-send="true">i915#7701</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@all-busy-check-all:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@drm_fdinfo@all-busy-check-all.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8414"
                moz-do-not-send="true">i915#8414</a>) +20 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@busy-hang@bcs0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-3/igt@drm_fdinfo@busy-hang@bcs0.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8414"
                moz-do-not-send="true">i915#8414</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-rkl-6/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7742"
                moz-do-not-send="true">i915#7742</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@virtual-busy-hang-all:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-19/igt@drm_fdinfo@virtual-busy-hang-all.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8414"
                moz-do-not-send="true">i915#8414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_caching@reads:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-1/igt@gem_caching@reads.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4873"
                moz-do-not-send="true">i915#4873</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@gem_ccs@ctrl-surf-copy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@gem_ccs@suspend-resume.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9323"
                moz-do-not-send="true">i915#9323</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-cpu-access-big:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@gem_create@create-ext-cpu-access-big.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6335"
                moz-do-not-send="true">i915#6335</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@engines-hostile@vcs0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-1/igt@gem_ctx_persistence@engines-hostile@vcs0.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9262"
                moz-do-not-send="true">i915#9262</a>) +9 other tests
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@hang:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@gem_ctx_persistence@hang.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8555"
                moz-do-not-send="true">i915#8555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-stop:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8555"
                moz-do-not-send="true">i915#8555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb4/igt@gem_ctx_persistence@legacy-engines-mixed.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1099"
                moz-do-not-send="true">i915#1099</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@hibernate:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@gem_eio@hibernate.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7975"
                moz-do-not-send="true">i915#7975</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8213"
                moz-do-not-send="true">i915#8213</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@unwedge-stress:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb4/igt@gem_eio@unwedge-stress.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8898"
                moz-do-not-send="true">i915#8898</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-semaphore:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@gem_exec_balancer@bonded-semaphore.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4812"
                moz-do-not-send="true">i915#4812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-sync:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@gem_exec_balancer@bonded-sync.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4771"
                moz-do-not-send="true">i915#4771</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-vip:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@gem_exec_fair@basic-none-vip.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4473"
                moz-do-not-send="true">i915#4473</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4771"
                moz-do-not-send="true">i915#4771</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-tglu-9/igt@gem_exec_fair@basic-pace-share@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-9/igt@gem_exec_fair@basic-pace-share@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fence@submit67:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@gem_exec_fence@submit67.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4812"
                  moz-do-not-send="true">i915#4812</a>)</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-18/igt@gem_exec_fence@submit67.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4812"
                  moz-do-not-send="true">i915#4812</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-uc-set-default:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-6/igt@gem_exec_flush@basic-uc-set-default.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3539"
                moz-do-not-send="true">i915#3539</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@gem_exec_flush@basic-wb-rw-before-default.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3539"
                moz-do-not-send="true">i915#3539</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4852"
                moz-do-not-send="true">i915#4852</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_gttfill@multigpu-basic:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@gem_exec_gttfill@multigpu-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7697"
                moz-do-not-send="true">i915#7697</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_params@rsvd2-dirt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@gem_exec_params@rsvd2-dirt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5107"
                moz-do-not-send="true">i915#5107</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-noreloc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3281"
                moz-do-not-send="true">i915#3281</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-cpu-read-noreloc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@gem_exec_reloc@basic-cpu-read-noreloc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3281"
                moz-do-not-send="true">i915#3281</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@gem_exec_reloc@basic-gtt-cpu-active.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3281"
                moz-do-not-send="true">i915#3281</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@deep@rcs0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@gem_exec_schedule@deep@rcs0.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4537"
                moz-do-not-send="true">i915#4537</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@preempt-queue-chain:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-chain.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4537"
                moz-do-not-send="true">i915#4537</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4812"
                moz-do-not-send="true">i915#4812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_suspend@basic-s3@smem:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb2/igt@gem_exec_suspend@basic-s3@smem.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8841"
                moz-do-not-send="true">i915#8841</a>) +8 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices@lmem0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-3/igt@gem_exec_suspend@basic-s4-devices@lmem0.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7975"
                moz-do-not-send="true">i915#7975</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8213"
                moz-do-not-send="true">i915#8213</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fence_thrash@bo-copy:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@gem_fence_thrash@bo-copy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4860"
                moz-do-not-send="true">i915#4860</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@gem_lmem_swapping@heavy-verify-multi.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4613"
                moz-do-not-send="true">i915#4613</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap@bad-size:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@gem_mmap@bad-size.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4083"
                moz-do-not-send="true">i915#4083</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@close-race:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-14/igt@gem_mmap_gtt@close-race.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@gem_mmap_gtt@cpuset-medium-copy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@copy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@gem_mmap_wc@copy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4083"
                moz-do-not-send="true">i915#4083</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3282"
                moz-do-not-send="true">i915#3282</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pread@snoop:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-15/igt@gem_pread@snoop.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3282"
                moz-do-not-send="true">i915#3282</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@display-protected-crc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@gem_pxp@display-protected-crc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4270"
                moz-do-not-send="true">i915#4270</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@gem_pxp@protected-raw-src-copy-not-readible.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4270"
                moz-do-not-send="true">i915#4270</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-19/igt@gem_pxp@reject-modify-context-protection-off-1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4270"
                moz-do-not-send="true">i915#4270</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_readwrite@beyond-eob:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-10/igt@gem_readwrite@beyond-eob.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3282"
                moz-do-not-send="true">i915#3282</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8428"
                moz-do-not-send="true">i915#8428</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4079"
                moz-do-not-send="true">i915#4079</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_gtt:</p>
          <ul>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-17/igt@gem_set_tiling_vs_gtt.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4079"
                  moz-do-not-send="true">i915#4079</a>)</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-1/igt@gem_set_tiling_vs_gtt.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4079"
                  moz-do-not-send="true">i915#4079</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@evict-snoop-interruptible:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@gem_softpin@evict-snoop-interruptible.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4885"
                  moz-do-not-send="true">i915#4885</a>)</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@gem_softpin@evict-snoop-interruptible.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4885"
                  moz-do-not-send="true">i915#4885</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_unfence_active_buffers:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@gem_unfence_active_buffers.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4879"
                moz-do-not-send="true">i915#4879</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@access-control:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@gem_userptr_blits@access-control.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3297"
                moz-do-not-send="true">i915#3297</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@create-destroy-unsync:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@gem_userptr_blits@create-destroy-unsync.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3297"
                moz-do-not-send="true">i915#3297</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate-busy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3297"
                moz-do-not-send="true">i915#3297</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4880"
                moz-do-not-send="true">i915#4880</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-overlap:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-2/igt@gem_userptr_blits@unsync-overlap.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3297"
                moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@vma-merge:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@gem_userptr_blits@vma-merge.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3318"
                  moz-do-not-send="true">i915#3318</a>)</p>
            </li>
            <li>
              <p>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb2/igt@gem_userptr_blits@vma-merge.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2724"
                  moz-do-not-send="true">i915#2724</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gen3_render_tiledy_blits:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@gen3_render_tiledy_blits.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                moz-do-not-send="true">fdo#109289</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen7_exec_parse@basic-allocation:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-4/igt@gen7_exec_parse@basic-allocation.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                moz-do-not-send="true">fdo#109289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen7_exec_parse@basic-offset:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@gen7_exec_parse@basic-offset.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                moz-do-not-send="true">fdo#109289</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-all:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@gen9_exec_parse@allowed-all.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2856"
                moz-do-not-send="true">i915#2856</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-large:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-3/igt@gen9_exec_parse@bb-large.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2856"
                moz-do-not-send="true">i915#2856</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-start-param:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2527"
                moz-do-not-send="true">i915#2527</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_fb_tiling:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@i915_fb_tiling.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4881"
                moz-do-not-send="true">i915#4881</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_hangman@gt-engine-error@vcs0:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-mtlp-7/igt@i915_hangman@gt-engine-error@vcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@i915_hangman@gt-engine-error@vcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7069"
                moz-do-not-send="true">i915#7069</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_hwmon@hwmon-read:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@i915_hwmon@hwmon-read.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7707"
                moz-do-not-send="true">i915#7707</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@load:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@i915_module_load@load.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6227"
                moz-do-not-send="true">i915#6227</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-with-fault-injection:</p>
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9200"
                moz-do-not-send="true">i915#9200</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_mult@media-freq@gt1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@i915_pm_freq_mult@media-freq@gt1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6590"
                moz-do-not-send="true">i915#6590</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3591"
                moz-do-not-send="true">i915#3591</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@dpms-lpsp:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-rkl-7/igt@i915_pm_rpm@dpms-lpsp.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@i915_pm_rpm@dpms-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1397"
                moz-do-not-send="true">i915#1397</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1397"
                moz-do-not-send="true">i915#1397</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8431"
                moz-do-not-send="true">i915#8431</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@i915_pm_rpm@modeset-lpsp-stress.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1397"
                moz-do-not-send="true">i915#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-18/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1397"
                moz-do-not-send="true">i915#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@basic-api:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@i915_pm_rps@basic-api.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6621"
                moz-do-not-send="true">i915#6621</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@thresholds-idle-park@gt0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@i915_pm_rps@thresholds-idle-park@gt0.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8925"
                moz-do-not-send="true">i915#8925</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@waitboost:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@i915_pm_rps@waitboost.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8346"
                moz-do-not-send="true">i915#8346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@query-topology-unsupported:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@i915_query@query-topology-unsupported.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109302"
                moz-do-not-send="true">fdo#109302</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@mock@memory_region:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@i915_selftest@mock@memory_region.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9311"
                moz-do-not-send="true">i915#9311</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9312"
                moz-do-not-send="true">i915#9312</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@basic-s3-without-i915:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-rkl-2/igt@i915_suspend@basic-s3-without-i915.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-6/igt@i915_suspend@basic-s3-without-i915.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=103375"
                moz-do-not-send="true">fdo#103375</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@sysfs-reader:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-16/igt@i915_suspend@sysfs-reader.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-19/igt@i915_suspend@sysfs-reader.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=103375"
                moz-do-not-send="true">fdo#103375</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5190"
                moz-do-not-send="true">i915#5190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4212"
                moz-do-not-send="true">i915#4212</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4215"
                moz-do-not-send="true">i915#4215</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5190"
                moz-do-not-send="true">i915#5190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4212"
                moz-do-not-send="true">i915#4212</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3826"
                moz-do-not-send="true">i915#3826</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-4-rc_ccs-cc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8709"
                moz-do-not-send="true">i915#8709</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8247"
                moz-do-not-send="true">i915#8247</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@kms_async_flips@invalid-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6228"
                moz-do-not-send="true">i915#6228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111614"
                  moz-do-not-send="true">fdo#111614</a>) +4 other tests
                skip</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-17/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4538"
                  moz-do-not-send="true">i915#4538</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/5286"
                  moz-do-not-send="true">i915#5286</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5286"
                moz-do-not-send="true">i915#5286</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111614"
                moz-do-not-send="true">fdo#111614</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111614"
                moz-do-not-send="true">fdo#111614</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3638"
                moz-do-not-send="true">i915#3638</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6187"
                moz-do-not-send="true">i915#6187</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3743"
                moz-do-not-send="true">i915#3743</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5190"
                moz-do-not-send="true">i915#5190</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-15/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4538"
                moz-do-not-send="true">i915#4538</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=110723"
                moz-do-not-send="true">fdo#110723</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-17/igt@kms_big_fb@yf-tiled-addfb.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4538"
                moz-do-not-send="true">i915#4538</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5190"
                moz-do-not-send="true">i915#5190</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_joiner@invalid-modeset:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-4/igt@kms_big_joiner@invalid-modeset.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2705"
                  moz-do-not-send="true">i915#2705</a>)</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@kms_big_joiner@invalid-modeset.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/2705"
                  moz-do-not-send="true">i915#2705</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                moz-do-not-send="true">i915#3886</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                moz-do-not-send="true">i915#6095</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +50 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-6/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                moz-do-not-send="true">i915#6095</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-glk3/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                moz-do-not-send="true">i915#3886</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-apl2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                moz-do-not-send="true">i915#3886</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-13/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3689"
                moz-do-not-send="true">i915#3689</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                moz-do-not-send="true">i915#3886</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                moz-do-not-send="true">i915#6095</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-ccs-on-another-bo-4_tiled_mtl_rc_ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-7/igt@kms_ccs@pipe-c-ccs-on-another-bo-4_tiled_mtl_rc_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3689"
                moz-do-not-send="true">i915#3689</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                moz-do-not-send="true">i915#3886</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                moz-do-not-send="true">i915#6095</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-glk6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +29 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3689"
                moz-do-not-send="true">i915#3689</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) +22 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_mc_ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-17/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-15/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3689"
                moz-do-not-send="true">i915#3689</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4087"
                moz-do-not-send="true">i915#4087</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7213"
                moz-do-not-send="true">i915#7213</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-c-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-1/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4087"
                moz-do-not-send="true">i915#4087</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-50:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@kms_chamelium_color@ctm-0-50.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                  moz-do-not-send="true">fdo#111827</a>)</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@kms_chamelium_color@ctm-0-50.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                  moz-do-not-send="true">fdo#111827</a>) +1 other test
                skip</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_chamelium_edid@dp-edid-resolution-list.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7828"
                moz-do-not-send="true">i915#7828</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-13/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7828"
                moz-do-not-send="true">i915#7828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-1/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7828"
                moz-do-not-send="true">i915#7828</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@kms_content_protection@atomic-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6944"
                moz-do-not-send="true">i915#6944</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-0.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3299"
                moz-do-not-send="true">i915#3299</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3299"
                moz-do-not-send="true">i915#3299</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-19/igt@kms_content_protection@legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7116"
                moz-do-not-send="true">i915#7116</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@kms_content_protection@srm.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7118"
                moz-do-not-send="true">i915#7118</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_content_protection@uevent@pipe-a-dp-4.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1339"
                moz-do-not-send="true">i915#1339</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x170:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-32x10.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                  moz-do-not-send="true">i915#3555</a>) +6 other tests
                skip</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-15/igt@kms_cursor_crc@cursor-sliding-32x10.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                  moz-do-not-send="true">i915#3555</a>) +1 other test
                skip</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-32x10.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                  moz-do-not-send="true">i915#3555</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/8814"
                  moz-do-not-send="true">i915#8814</a>) +4 other tests
                skip</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg2-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=103375"
                moz-do-not-send="true">fdo#103375</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                moz-do-not-send="true">fdo#109274</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111767"
                moz-do-not-send="true">fdo#111767</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4213"
                moz-do-not-send="true">i915#4213</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111767"
                moz-do-not-send="true">fdo#111767</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                  moz-do-not-send="true">fdo#109274</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                  moz-do-not-send="true">i915#5354</a>) +7 other tests
                skip</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3546"
                  moz-do-not-send="true">i915#3546</a>) +3 other tests
                skip</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9226"
                moz-do-not-send="true">i915#9226</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9261"
                moz-do-not-send="true">i915#9261</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9227"
                moz-do-not-send="true">i915#9227</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@extended-mode-basic:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@kms_display_modes@extended-mode-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8827"
                moz-do-not-send="true">i915#8827</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@mst-extended-mode-negative:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-1/igt@kms_display_modes@mst-extended-mode-negative.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8588"
                moz-do-not-send="true">i915#8588</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@kms_draw_crc@draw-method-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8812"
                moz-do-not-send="true">i915#8812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8812"
                moz-do-not-send="true">i915#8812</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@kms_dsc@dsc-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3840"
                moz-do-not-send="true">i915#3840</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9159"
                moz-do-not-send="true">i915#9159</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-10/igt@kms_dsc@dsc-with-bpc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3840"
                moz-do-not-send="true">i915#3840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc-suspend:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=103375"
                moz-do-not-send="true">fdo#103375</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-absolute-wf_vblank:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@kms_flip@2x-absolute-wf_vblank.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                moz-do-not-send="true">fdo#109274</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-fences:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@kms_flip@2x-flip-vs-fences.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8381"
                moz-do-not-send="true">i915#8381</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@kms_flip@2x-flip-vs-fences-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8381"
                moz-do-not-send="true">i915#8381</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@kms_flip@2x-flip-vs-panning.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3637"
                moz-do-not-send="true">i915#3637</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-rmfb@b-vga1:</p>
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-snb6/igt@kms_flip@flip-vs-rmfb@b-vga1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb7/igt@kms_flip@flip-vs-rmfb@b-vga1.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8865"
                moz-do-not-send="true">i915#8865</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2587"
                moz-do-not-send="true">i915#2587</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8810"
                moz-do-not-send="true">i915#8810</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-load-detect:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@kms_force_connector_basic@force-load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109285"
                moz-do-not-send="true">fdo#109285</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8708"
                moz-do-not-send="true">i915#8708</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8708"
                moz-do-not-send="true">i915#8708</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1825"
                moz-do-not-send="true">i915#1825</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3458"
                moz-do-not-send="true">i915#3458</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8708"
                moz-do-not-send="true">i915#8708</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1825"
                moz-do-not-send="true">i915#1825</a>) +47 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) +47 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=110189"
                moz-do-not-send="true">fdo#110189</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3458"
                moz-do-not-send="true">i915#3458</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109280"
                moz-do-not-send="true">fdo#109280</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3023"
                moz-do-not-send="true">i915#3023</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-metadata-sizes:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8228"
                moz-do-not-send="true">i915#8228</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-swap:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@kms_hdr@static-swap.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8228"
                moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6403"
                moz-do-not-send="true">i915#6403</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-mtlp-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9262"
                moz-do-not-send="true">i915#9262</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-y:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@kms_plane_multiple@tiling-y.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8806"
                moz-do-not-send="true">i915#8806</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-1/igt@kms_plane_multiple@tiling-yf.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8806"
                moz-do-not-send="true">i915#8806</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8292"
                moz-do-not-send="true">i915#8292</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8292"
                moz-do-not-send="true">i915#8292</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5176"
                moz-do-not-send="true">i915#5176</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5176"
                moz-do-not-send="true">i915#5176</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-c-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-c-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5176"
                moz-do-not-send="true">i915#5176</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5176"
                moz-do-not-send="true">i915#5176</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +209 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5235"
                moz-do-not-send="true">i915#5235</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-dp-1:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-apl2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-dp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +43 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5235"
                moz-do-not-send="true">i915#5235</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5235"
                moz-do-not-send="true">i915#5235</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5235"
                moz-do-not-send="true">i915#5235</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-modeset-hybrid:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_prime@basic-modeset-hybrid.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6524"
                moz-do-not-send="true">i915#6524</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-glk8/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                  moz-do-not-send="true">i915#658</a>)</p>
            </li>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                  moz-do-not-send="true">i915#658</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-5/igt@kms_psr@psr2_cursor_mmap_cpu.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1072"
                moz-do-not-send="true">i915#1072</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-pixel-format:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-1/igt@kms_rotation_crc@bad-pixel-format.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4235"
                moz-do-not-send="true">i915#4235</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5289"
                moz-do-not-send="true">i915#5289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-rkl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8875"
                moz-do-not-send="true">i915#8875</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4235"
                  moz-do-not-send="true">i915#4235</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/5190"
                  moz-do-not-send="true">i915#5190</a>)</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                  moz-do-not-send="true">fdo#111615</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/5289"
                  moz-do-not-send="true">i915#5289</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5030"
                moz-do-not-send="true">i915#5030</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5465"
                moz-do-not-send="true">i915#5465</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8823"
                moz-do-not-send="true">i915#8823</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak-pipe-a:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9196"
                moz-do-not-send="true">i915#9196</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak-pipe-b:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-18/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-19/igt@kms_universal_plane@cursor-fb-leak-pipe-b.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9196"
                moz-do-not-send="true">i915#9196</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-c-wait-forked-busy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@kms_vblank@pipe-c-wait-forked-busy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4070"
                moz-do-not-send="true">i915#4070</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6768"
                moz-do-not-send="true">i915#6768</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-d-query-forked-busy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-1/igt@kms_vblank@pipe-d-query-forked-busy.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4070"
                moz-do-not-send="true">i915#4070</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/533"
                moz-do-not-send="true">i915#533</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6768"
                moz-do-not-send="true">i915#6768</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-invalid-parameters:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@kms_writeback@writeback-invalid-parameters.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2437"
                moz-do-not-send="true">i915#2437</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@buffer-fill@0-rcs0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-3/igt@perf@buffer-fill@0-rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7823"
                moz-do-not-send="true">i915#7823</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9265"
                moz-do-not-send="true">i915#9265</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@gen12-group-concurrent-oa-buffer-read:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@perf@gen12-group-concurrent-oa-buffer-read.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9259"
                moz-do-not-send="true">i915#9259</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@polling-small-buf:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@perf@polling-small-buf.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1722"
                moz-do-not-send="true">i915#1722</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@cpu-hotplug:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-2/igt@perf_pmu@cpu-hotplug.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8850"
                moz-do-not-send="true">i915#8850</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@event-wait@rcs0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@perf_pmu@event-wait@rcs0.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=112283"
                moz-do-not-send="true">fdo#112283</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@frequency@gt0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@perf_pmu@frequency@gt0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6806"
                moz-do-not-send="true">i915#6806</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@module-unload:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-6/igt@perf_pmu@module-unload.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5793"
                moz-do-not-send="true">i915#5793</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6121"
                moz-do-not-send="true">i915#6121</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@rc6-suspend:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@perf_pmu@rc6-suspend.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9262"
                moz-do-not-send="true">i915#9262</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9268"
                moz-do-not-send="true">i915#9268</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-blt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-8/igt@prime_vgem@basic-blt.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8445"
                moz-do-not-send="true">i915#8445</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-read:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@prime_vgem@basic-read.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-write:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-3/igt@prime_vgem@basic-write.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3291"
                moz-do-not-send="true">i915#3291</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@fence-flip-hang:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-1/igt@prime_vgem@fence-flip-hang.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                moz-do-not-send="true">i915#3708</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-19/igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_perfmon@create-perfmon-0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-7/igt@v3d/v3d_perfmon@create-perfmon-0.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109315"
                moz-do-not-send="true">fdo#109315</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_submit_cl@bad-multisync-out-sync:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-6/igt@v3d/v3d_submit_cl@bad-multisync-out-sync.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_submit_csd@bad-bo:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-7/igt@v3d/v3d_submit_csd@bad-bo.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_mmap@mmap-bo:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-5/igt@vc4/vc4_mmap@mmap-bo.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7711"
                moz-do-not-send="true">i915#7711</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_perfmon@destroy-valid-perfmon:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-14/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7711"
                moz-do-not-send="true">i915#7711</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7711"
                moz-do-not-send="true">i915#7711</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_tiling@set-bad-modifier:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-2/igt@vc4/vc4_tiling@set-bad-modifier.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7711"
                moz-do-not-send="true">i915#7711</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@unbind-rebind:</p>
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-snb1/igt@core_hotunplug@unbind-rebind.html"
                moz-do-not-send="true">INCOMPLETE</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-snb7/igt@core_hotunplug@unbind-rebind.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@basic-nohangcheck:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-tglu-10/igt@gem_ctx_exec@basic-nohangcheck.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6268"
                moz-do-not-send="true">i915#6268</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-5/igt@gem_ctx_exec@basic-nohangcheck.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@reset-stress:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-14/igt@gem_eio@reset-stress.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5784"
                moz-do-not-send="true">i915#5784</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-17/igt@gem_eio@reset-stress.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_endless@dispatch@vecs0:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-16/igt@gem_exec_endless@dispatch@vecs0.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3778"
                moz-do-not-send="true">i915#3778</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-15/igt@gem_exec_endless@dispatch@vecs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-flow@rcs0:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-tglu-6/igt@gem_exec_fair@basic-flow@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-5/igt@gem_exec_fair@basic-flow@rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5493"
                moz-do-not-send="true">i915#5493</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-single:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-apl4/igt@gen9_exec_parse@allowed-single.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5566"
                moz-do-not-send="true">i915#5566</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-apl2/igt@gen9_exec_parse@allowed-single.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
          <ul>
            <li>
              <p>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1397"
                  moz-do-not-send="true">i915#1397</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-rkl-1/igt@i915_pm_rpm@dpms-non-lpsp.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/1397"
                  moz-do-not-send="true">i915#1397</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-15/igt@i915_pm_rpm@dpms-non-lpsp.html"
                  moz-do-not-send="true">PASS</a> +1 other test pass</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1397"
                moz-do-not-send="true">i915#1397</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@i915_pm_rpm@modeset-non-lpsp.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@gt_heartbeat:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-glk2/igt@i915_selftest@live@gt_heartbeat.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5334"
                moz-do-not-send="true">i915#5334</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-glk7/igt@i915_selftest@live@gt_heartbeat.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@basic-s3-without-i915:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-17/igt@i915_suspend@basic-s3-without-i915.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4391"
                moz-do-not-send="true">i915#4391</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4423"
                moz-do-not-send="true">i915#4423</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-15/igt@i915_suspend@basic-s3-without-i915.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-17/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4423"
                moz-do-not-send="true">i915#4423</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-16/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2346"
                moz-do-not-send="true">i915#2346</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2346"
                moz-do-not-send="true">i915#2346</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@b-edp1:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-mtlp-4/igt@kms_flip@flip-vs-suspend@b-edp1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9262"
                moz-do-not-send="true">i915#9262</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-6/igt@kms_flip@flip-vs-suspend@b-edp1.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6880"
                moz-do-not-send="true">i915#6880</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format@pipe-a-planes:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-glk2/igt@kms_plane@pixel-format@pipe-a-planes.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/118"
                moz-do-not-send="true">i915#118</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-glk6/igt@kms_plane@pixel-format@pipe-a-planes.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_pm_dc@dc6-dpms}:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9295"
                moz-do-not-send="true">i915#9295</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg2-5/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=103375"
                moz-do-not-send="true">fdo#103375</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-5/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-double-start@vecs1:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4349"
                moz-do-not-send="true">i915#4349</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@device_reset@unbind-reset-rebind:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html"
                moz-do-not-send="true">ABORT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4983"
                moz-do-not-send="true">i915#4983</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/7461"
                moz-do-not-send="true">i915#7461</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-14/igt@device_reset@unbind-reset-rebind.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4983"
                moz-do-not-send="true">i915#4983</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle@bcs0:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2681"
                moz-do-not-send="true">i915#2681</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3591"
                moz-do-not-send="true">i915#3591</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html"
                moz-do-not-send="true">WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2681"
                moz-do-not-send="true">i915#2681</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@crc@pipe-d-edp-1:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-mtlp-4/igt@kms_async_flips@crc@pipe-d-edp-1.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8561"
                moz-do-not-send="true">i915#8561</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-5/igt@kms_async_flips@crc@pipe-d-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8247"
                moz-do-not-send="true">i915#8247</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@cursor_plane_move:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg1-15/igt@kms_psr@cursor_plane_move.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1072"
                moz-do-not-send="true">i915#1072</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg1-16/igt@kms_psr@cursor_plane_move.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1072"
                moz-do-not-send="true">i915#1072</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4078"
                moz-do-not-send="true">i915#4078</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@rc6@other-idle-gt1:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-mtlp-2/igt@perf_pmu@rc6@other-idle-gt1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8537"
                moz-do-not-send="true">i915#8537</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@perf_pmu@rc6@other-idle-gt1.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9268"
                moz-do-not-send="true">i915#9268</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@rc6@runtime-pm-long-gt1:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-mtlp-2/igt@perf_pmu@rc6@runtime-pm-long-gt1.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/8537"
                moz-do-not-send="true">i915#8537</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-mtlp-4/igt@perf_pmu@rc6@runtime-pm-long-gt1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9335"
                moz-do-not-send="true">i915#9335</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5493"
                moz-do-not-send="true">i915#5493</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/shard-dg2-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html"
                moz-do-not-send="true">CRASH</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/9351"
                moz-do-not-send="true">i915#9351</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_7493 -&gt; IGTPW_9823</li>
        <li>Piglit: piglit_4509 -&gt; None</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_13651: 61b71c3f061a44a6ab1dcf756918886aa03a5480 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_9823:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9823/index.html</a><br>
        IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
        git://anongit.freedesktop.org/piglit</p>
    </blockquote>
  </body>
</html>

--------------9upVitbkCCdBA4jKY3WQEvP0--
