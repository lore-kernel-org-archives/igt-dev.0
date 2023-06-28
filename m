Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E1A10E02D
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 08:20:46 +0000 (UTC)
Message-ID: <1b5c903f-889f-52ba-f772-fee4098317ec@intel.com>
Date: Wed, 28 Jun 2023 13:49:40 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>, <saix.nandan.yedireswarapu@intel.com>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
 <168790077940.2456.11597219903174814506@emeril.freedesktop.org>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <168790077940.2456.11597219903174814506@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgWEUgdGVz?=
 =?utf-8?q?t_cleanup_to_handle_xe=5Fdevice_=28rev9=29?=
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

Hi Sai,

Can you please help to create a bug for below regression?

- Bhanu

On Wed-28-06-2023 02:49 am, Patchwork wrote:
> *Patch Details*
> *Series:*	XE test cleanup to handle xe_device (rev9)
> *URL:*	https://patchwork.freedesktop.org/series/117263/ 
> <https://patchwork.freedesktop.org/series/117263/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_13327_full -> IGTPW_9267_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_9267_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_9267_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/index.html
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
> IGTPW_9267_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@gem_madvise@dontneed-after-mmap:
> 
>       o shard-mtlp: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-6/igt@gem_madvise@dontneed-after-mmap.html>
>   *
> 
>     igt@gem_madvise@dontneed-before-mmap:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-4/igt@gem_madvise@dontneed-before-mmap.html> -> WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-6/igt@gem_madvise@dontneed-before-mmap.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_9267_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@api_intel_bb@blit-reloc-keep-cache:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-5/igt@api_intel_bb@blit-reloc-keep-cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/intel/issues/8411>)
>   *
> 
>     igt@debugfs_test@basic-hwmon:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-9/igt@debugfs_test@basic-hwmon.html> (i915#7456 <https://gitlab.freedesktop.org/drm/intel/issues/7456>)
>   *
> 
>     igt@drm_fdinfo@virtual-busy-all:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-7/igt@drm_fdinfo@virtual-busy-all.html> (i915#8414 <https://gitlab.freedesktop.org/drm/intel/issues/8414>)
>   *
> 
>     igt@feature_discovery@display-3x:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-9/igt@feature_discovery@display-3x.html> (i915#1839 <https://gitlab.freedesktop.org/drm/intel/issues/1839>)
>   *
> 
>     igt@gem_basic@multigpu-create-close:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-1/igt@gem_basic@multigpu-create-close.html> (i915#7697 <https://gitlab.freedesktop.org/drm/intel/issues/7697>)
>   *
> 
>     igt@gem_create@create-ext-set-pat:
> 
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-4/igt@gem_create@create-ext-set-pat.html> (i915#8621 <https://gitlab.freedesktop.org/drm/intel/issues/8621>)
>   *
> 
>     igt@gem_ctx_exec@basic-nohangcheck:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-1/igt@gem_ctx_exec@basic-nohangcheck.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-4/igt@gem_ctx_exec@basic-nohangcheck.html> (i915#6121 <https://gitlab.freedesktop.org/drm/intel/issues/6121> / i915#7916 <https://gitlab.freedesktop.org/drm/intel/issues/7916>)
>   *
> 
>     igt@gem_ctx_persistence@heartbeat-hostile:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-hostile.html> (i915#8555 <https://gitlab.freedesktop.org/drm/intel/issues/8555>)
>   *
> 
>     igt@gem_ctx_persistence@legacy-engines-hang@bsd1:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-3/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-2/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html> (i915#2410 <https://gitlab.freedesktop.org/drm/intel/issues/2410>)
>   *
> 
>     igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-3/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html> (i915#5882 <https://gitlab.freedesktop.org/drm/intel/issues/5882>) +8 similar issues
>   *
> 
>     igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-3/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs3.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5882 <https://gitlab.freedesktop.org/drm/intel/issues/5882>)
>   *
> 
>     igt@gem_ctx_persistence@saturated-hostile@vecs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-3/igt@gem_ctx_persistence@saturated-hostile@vecs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-7/igt@gem_ctx_persistence@saturated-hostile@vecs0.html> (i915#7816 <https://gitlab.freedesktop.org/drm/intel/issues/7816>) +2 similar issues
>   *
> 
>     igt@gem_eio@hibernate:
> 
>       o shard-dg2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-3/igt@gem_eio@hibernate.html> (i915#7975 <https://gitlab.freedesktop.org/drm/intel/issues/7975> / i915#8213 <https://gitlab.freedesktop.org/drm/intel/issues/8213>)
>   *
> 
>     igt@gem_exec_balancer@bonded-false-hang:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-1/igt@gem_exec_balancer@bonded-false-hang.html> (i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>)
>   *
> 
>     igt@gem_exec_balancer@bonded-pair:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-1/igt@gem_exec_balancer@bonded-pair.html> (i915#4771 <https://gitlab.freedesktop.org/drm/intel/issues/4771>)
>   *
> 
>     igt@gem_exec_endless@dispatch@bcs0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-8/igt@gem_exec_endless@dispatch@bcs0.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-8/igt@gem_exec_endless@dispatch@bcs0.html> (i915#3778 <https://gitlab.freedesktop.org/drm/intel/issues/3778> / i915#7016 <https://gitlab.freedesktop.org/drm/intel/issues/7016> / i915#7921 <https://gitlab.freedesktop.org/drm/intel/issues/7921>)
>   *
> 
>     igt@gem_exec_fair@basic-none@bcs0:
> 
>       o
> 
>         shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +1 similar issue
> 
>       o
> 
>         shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-4/igt@gem_exec_fair@basic-none@bcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +4 similar issues
> 
>   *
> 
>     igt@gem_exec_fair@basic-throttle:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-11/igt@gem_exec_fair@basic-throttle.html> (i915#3539 <https://gitlab.freedesktop.org/drm/intel/issues/3539>)
>   *
> 
>     igt@gem_exec_params@secure-non-master:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-7/igt@gem_exec_params@secure-non-master.html> (fdo#112283 <https://bugs.freedesktop.org/show_bug.cgi?id=112283>)
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-cpu-active:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-7/igt@gem_exec_reloc@basic-gtt-cpu-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +2 similar issues
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-wc-active:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-wc-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +2 similar issues
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +2 similar issues
> 
>   *
> 
>     igt@gem_exec_schedule@semaphore-power:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-5/igt@gem_exec_schedule@semaphore-power.html> (i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>) +1 similar issue
>   *
> 
>     igt@gem_exec_whisper@basic-fds-forked-all:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-2/igt@gem_exec_whisper@basic-fds-forked-all.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-8/igt@gem_exec_whisper@basic-fds-forked-all.html> (i915#6363 <https://gitlab.freedesktop.org/drm/intel/issues/6363>) +1 similar issue
>   *
> 
>     igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-12/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html> (i915#4860 <https://gitlab.freedesktop.org/drm/intel/issues/4860>)
>   *
> 
>     igt@gem_lmem_evict@dontneed-evict-race:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-3/igt@gem_lmem_evict@dontneed-evict-race.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613> / i915#7582 <https://gitlab.freedesktop.org/drm/intel/issues/7582>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-2/igt@gem_lmem_swapping@heavy-verify-multi.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-random:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-2/igt@gem_lmem_swapping@heavy-verify-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html> (i915#5493 <https://gitlab.freedesktop.org/drm/intel/issues/5493>)
>   *
> 
>     igt@gem_mmap_gtt@hang:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-2/igt@gem_mmap_gtt@hang.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 similar issue
>   *
> 
>     igt@gem_mmap_wc@bad-offset:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-7/igt@gem_mmap_wc@bad-offset.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>) +1 similar issue
>   *
> 
>     igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-10/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>) +1 similar issue
>   *
> 
>     igt@gem_pxp@reject-modify-context-protection-off-2:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-8/igt@gem_pxp@reject-modify-context-protection-off-2.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-off-2.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
> 
>   *
> 
>     igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-4/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>   *
> 
>     igt@gem_readwrite@write-bad-handle:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-2/igt@gem_readwrite@write-bad-handle.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>   *
> 
>     igt@gem_render_copy@y-tiled:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-2/igt@gem_render_copy@y-tiled.html> (i915#8428 <https://gitlab.freedesktop.org/drm/intel/issues/8428>) +1 similar issue
>   *
> 
>     igt@gem_softpin@evict-snoop:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-4/igt@gem_softpin@evict-snoop.html> (fdo#109312 <https://bugs.freedesktop.org/show_bug.cgi?id=109312>)
>   *
> 
>     igt@gem_userptr_blits@coherency-sync:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-3/igt@gem_userptr_blits@coherency-sync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>) +1 similar issue
>   *
> 
>     igt@gem_userptr_blits@coherency-unsync:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-2/igt@gem_userptr_blits@coherency-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@dmabuf-unsync:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-12/igt@gem_userptr_blits@dmabuf-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-2/igt@gem_userptr_blits@dmabuf-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
> 
>   *
> 
>     igt@gem_userptr_blits@vma-merge:
> 
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-7/igt@gem_userptr_blits@vma-merge.html> (i915#3318 <https://gitlab.freedesktop.org/drm/intel/issues/3318>)
>   *
> 
>     igt@gen7_exec_parse@bitmasks:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-8/igt@gen7_exec_parse@bitmasks.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +1 similar issue
>   *
> 
>     igt@gen9_exec_parse@allowed-single:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-glk5/igt@gen9_exec_parse@allowed-single.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-glk6/igt@gen9_exec_parse@allowed-single.html> (i915#5566 <https://gitlab.freedesktop.org/drm/intel/issues/5566>)
>   *
> 
>     igt@gen9_exec_parse@basic-rejected:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-2/igt@gen9_exec_parse@basic-rejected.html> (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>)
>   *
> 
>     igt@gen9_exec_parse@valid-registers:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-10/igt@gen9_exec_parse@valid-registers.html> (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +1 similar issue
>   *
> 
>     igt@i915_hangman@detector@vcs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-4/igt@i915_hangman@detector@vcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-1/igt@i915_hangman@detector@vcs0.html> (i915#8456 <https://gitlab.freedesktop.org/drm/intel/issues/8456>) +2 similar issues
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html> (i915#4528 <https://gitlab.freedesktop.org/drm/intel/issues/4528>)
>   *
> 
>     igt@i915_pipe_stress@stress-xrgb8888-untiled:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-3/igt@i915_pipe_stress@stress-xrgb8888-untiled.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-8/igt@i915_pipe_stress@stress-xrgb8888-untiled.html> (i915#8691 <https://gitlab.freedesktop.org/drm/intel/issues/8691>)
>   *
> 
>     igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-11/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html> (i915#1937 <https://gitlab.freedesktop.org/drm/intel/issues/1937> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-accuracy:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-3/igt@i915_pm_rc6_residency@rc6-accuracy.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289> / i915#8403 <https://gitlab.freedesktop.org/drm/intel/issues/8403>)
>   *
> 
>     igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-rkl-4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>   *
> 
>     igt@i915_pm_rpm@gem-evict-pwrite:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-11/igt@i915_pm_rpm@gem-evict-pwrite.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2 similar issues
>   *
> 
>     igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>   *
> 
>     igt@i915_pm_rpm@modeset-pc8-residency-stress:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-4/igt@i915_pm_rpm@modeset-pc8-residency-stress.html> (fdo#109506 <https://bugs.freedesktop.org/show_bug.cgi?id=109506>)
>   *
> 
>     igt@i915_pm_rps@min-max-config-idle:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-10/igt@i915_pm_rps@min-max-config-idle.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>   *
> 
>     igt@i915_pm_rps@min-max-config-loaded:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-4/igt@i915_pm_rps@min-max-config-loaded.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>   *
> 
>     igt@i915_selftest@live@requests:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-5/igt@i915_selftest@live@requests.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-2/igt@i915_selftest@live@requests.html> (i915#8497 <https://gitlab.freedesktop.org/drm/intel/issues/8497>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-8/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>)
>   *
> 
>     igt@kms_big_fb@4-tiled-16bpp-rotate-270:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +1 similar issue
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-180:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> / i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1 similar issue
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html> (i915#5138 <https://gitlab.freedesktop.org/drm/intel/issues/5138>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-1/igt@kms_big_fb@linear-64bpp-rotate-270.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +1 similar issue
>   *
> 
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614> / i915#3638 <https://gitlab.freedesktop.org/drm/intel/issues/3638>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (i915#3743 <https://gitlab.freedesktop.org/drm/intel/issues/3743>)
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +1 similar issue
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +3 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +3 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html> (i915#4538 <https://gitlab.freedesktop.org/drm/intel/issues/4538> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html> (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>)
> 
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>   *
> 
>     igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-6/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +5 similar issues
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-2/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html> (i915#3734 <https://gitlab.freedesktop.org/drm/intel/issues/3734> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +3 similar issues
> 
>   *
> 
>     igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-1/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs.html> (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +6 similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-2/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html> (i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +2 similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-6/igt@kms_ccs@pipe-a-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +4 similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-8/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +5 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-10/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>   *
> 
>     igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_mtl_mc_ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-8/igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_mtl_mc_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +14 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-7/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +10 similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-1/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +3 similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-4/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> / i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html> (i915#3742 <https://gitlab.freedesktop.org/drm/intel/issues/3742>)
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-c-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-c-hdmi-a-3.html> (i915#4087 <https://gitlab.freedesktop.org/drm/intel/issues/4087>) +6 similar issues
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html> (i915#4087 <https://gitlab.freedesktop.org/drm/intel/issues/4087> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +1 similar issue
>   *
> 
>     igt@kms_chamelium_audio@dp-audio:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-3/igt@kms_chamelium_audio@dp-audio.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +2 similar issues
>   *
> 
>     igt@kms_chamelium_color@ctm-green-to-red:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-7/igt@kms_chamelium_color@ctm-green-to-red.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1 similar issue
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-1/igt@kms_chamelium_color@ctm-green-to-red.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1 similar issue
> 
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-6/igt@kms_chamelium_hpd@hdmi-hpd.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +1 similar issue
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +1 similar issue
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +1 similar issue
> 
>   *
> 
>     igt@kms_color@deep-color:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-6/igt@kms_color@deep-color.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +2 similar issues
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-9/igt@kms_color@deep-color.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +2 similar issues
> 
>   *
> 
>     igt@kms_content_protection@lic@pipe-a-dp-4:
> 
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-11/igt@kms_content_protection@lic@pipe-a-dp-4.html> (i915#7173 <https://gitlab.freedesktop.org/drm/intel/issues/7173>) +1 similar issue
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-8/igt@kms_content_protection@srm.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x512.html> (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +1 similar issue
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html> (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html> (i915#8248 <https://gitlab.freedesktop.org/drm/intel/issues/8248>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html> (i915#3546 <https://gitlab.freedesktop.org/drm/intel/issues/3546>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>   *
> 
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>) +4 similar issues
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html> (i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html> (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-11/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +1 similar issue
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html> (fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +1 similar issue
> 
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +1 similar issue
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +1 similar issue
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +8 similar issues
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/intel/issues/5274>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html> (i915#6880 <https://gitlab.freedesktop.org/drm/intel/issues/6880>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +2 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-suspend.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-suspend.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>) +1 similar issue
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html> (i915#3023 <https://gitlab.freedesktop.org/drm/intel/issues/3023>) +5 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html> (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +14 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html> (fdo#110189 <https://bugs.freedesktop.org/show_bug.cgi?id=110189>) +10 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-12/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +4 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html> (i915#3458 <https://gitlab.freedesktop.org/drm/intel/issues/3458>) +3 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html> (i915#1825 <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +8 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html> (fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825> / i915#1825 <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +9 similar issues
>   *
> 
>     igt@kms_hdr@bpc-switch:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-6/igt@kms_hdr@bpc-switch.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +3 similar issues
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-5/igt@kms_hdr@invalid-hdr.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#6953 <https://gitlab.freedesktop.org/drm/intel/issues/6953> / i915#8228 <https://gitlab.freedesktop.org/drm/intel/issues/8228>)
>   *
> 
>     igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-1/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-6/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
> 
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-snb1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +16 similar issues
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-3.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>   *
> 
>     igt@kms_plane_lowres@tiling-yf:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-12/igt@kms_plane_lowres@tiling-yf.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-2/igt@kms_plane_lowres@tiling-yf.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
> 
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-12/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html> (i915#8292 <https://gitlab.freedesktop.org/drm/intel/issues/8292>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html> (i915#8292 <https://gitlab.freedesktop.org/drm/intel/issues/8292>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +2 similar issues
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-1.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-dp-4:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-dp-4.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +2 similar issues
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-dp-4:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-dp-4.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-hdmi-a-1:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-snb1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-hdmi-a-1.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +11 similar issues
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +2 similar issues
>   *
> 
>     igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +2 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-1.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +3 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +5 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +1 similar issue
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +1 similar issue
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +1 similar issue
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +11 similar issues
>   *
> 
>     igt@kms_prime@d3hot:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-12/igt@kms_prime@d3hot.html> (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524> / i915#6805 <https://gitlab.freedesktop.org/drm/intel/issues/6805>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-4/igt@kms_prime@d3hot.html> (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524>)
> 
>   *
> 
>     igt@kms_psr@psr2_sprite_plane_move:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-6/igt@kms_psr@psr2_sprite_plane_move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +1 similar issue
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-2/igt@kms_psr@psr2_sprite_plane_move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +1 similar issue
> 
>   *
> 
>     igt@kms_setmode@basic@pipe-a-hdmi-a-1:
> 
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html> (i915#5465 <https://gitlab.freedesktop.org/drm/intel/issues/5465>) +1 similar issue
>   *
> 
>     igt@kms_sysfs_edid_timing:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-11/igt@kms_sysfs_edid_timing.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-5/igt@kms_sysfs_edid_timing.html> (IGT#2 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2>)
>   *
> 
>     igt@kms_universal_plane@universal-plane-pipe-c-functional:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-7/igt@kms_universal_plane@universal-plane-pipe-c-functional.html> (i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> / i915#6768 <https://gitlab.freedesktop.org/drm/intel/issues/6768>)
>   *
> 
>     igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-6/igt@perf@gen8-unprivileged-single-ctx-counters.html> (i915#2436 <https://gitlab.freedesktop.org/drm/intel/issues/2436>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-1/igt@perf@gen8-unprivileged-single-ctx-counters.html> (i915#2436 <https://gitlab.freedesktop.org/drm/intel/issues/2436>)
> 
>   *
> 
>     igt@perf_pmu@busy-double-start@rcs0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-11/igt@perf_pmu@busy-double-start@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-5/igt@perf_pmu@busy-double-start@rcs0.html> (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>)
>   *
> 
>     igt@perf_pmu@rc6@other-idle-gt0:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-5/igt@perf_pmu@rc6@other-idle-gt0.html> (i915#8516 <https://gitlab.freedesktop.org/drm/intel/issues/8516>)
>   *
> 
>     igt@v3d/v3d_job_submission@array-job-submission:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-3/igt@v3d/v3d_job_submission@array-job-submission.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +2 similar issues
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-4/igt@v3d/v3d_job_submission@array-job-submission.html> (fdo#109315 <https://bugs.freedesktop.org/show_bug.cgi?id=109315>) +2 similar issues
> 
>   *
> 
>     igt@v3d/v3d_submit_cl@bad-multisync-pad:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-10/igt@v3d/v3d_submit_cl@bad-multisync-pad.html> (fdo#109315 <https://bugs.freedesktop.org/show_bug.cgi?id=109315> / i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +4 similar issues
>   *
> 
>     igt@v3d/v3d_submit_csd@bad-multisync-in-sync:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-3/igt@v3d/v3d_submit_csd@bad-multisync-in-sync.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +2 similar issues
>   *
> 
>     igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-1/igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +2 similar issues
>   *
> 
>     igt@vc4/vc4_tiling@get-after-free:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-7/igt@vc4/vc4_tiling@get-after-free.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +1 similar issue
>   *
> 
>     igt@vc4/vc4_tiling@get-bad-flags:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-4/igt@vc4/vc4_tiling@get-bad-flags.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>)
>   *
> 
>     igt@vc4/vc4_wait_bo@bad-pad:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-2/igt@vc4/vc4_wait_bo@bad-pad.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@drm_fdinfo@most-busy-check-all@rcs0:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html> (i915#7742 <https://gitlab.freedesktop.org/drm/intel/issues/7742>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html>
>   *
> 
>     igt@gem_ctx_exec@basic-nohangcheck:
> 
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html> (i915#6268 <https://gitlab.freedesktop.org/drm/intel/issues/6268>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-9/igt@gem_ctx_exec@basic-nohangcheck.html>
>   *
> 
>     igt@gem_ctx_persistence@engines-hostile@vcs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-7/igt@gem_ctx_persistence@engines-hostile@vcs0.html> (i915#2410 <https://gitlab.freedesktop.org/drm/intel/issues/2410>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-1/igt@gem_ctx_persistence@engines-hostile@vcs0.html> +2 similar issues
>   *
> 
>     igt@gem_eio@in-flight-10ms:
> 
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-8/igt@gem_eio@in-flight-10ms.html> (i915#8503 <https://gitlab.freedesktop.org/drm/intel/issues/8503>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-1/igt@gem_eio@in-flight-10ms.html>
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg1-16/igt@gem_eio@unwedge-stress.html> (i915#5784 <https://gitlab.freedesktop.org/drm/intel/issues/5784>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg1-19/igt@gem_eio@unwedge-stress.html>
>   *
> 
>     igt@gem_exec_balancer@full-pulse:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-3/igt@gem_exec_balancer@full-pulse.html> (i915#6032 <https://gitlab.freedesktop.org/drm/intel/issues/6032>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-10/igt@gem_exec_balancer@full-pulse.html>
>   *
> 
>     igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-none@vcs0:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-rkl-4/igt@gem_exec_fair@basic-none@vcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-4/igt@gem_exec_fair@basic-none@vcs0.html>
>   *
> 
>     igt@gem_exec_whisper@basic-contexts-forked-all:
> 
>       o shard-mtlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-forked-all.html> (i915#8628 <https://gitlab.freedesktop.org/drm/intel/issues/8628>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-1/igt@gem_exec_whisper@basic-contexts-forked-all.html>
>   *
> 
>     igt@gem_exec_whisper@basic-queues-priority-all:
> 
>       o {shard-dg1}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg1-13/igt@gem_exec_whisper@basic-queues-priority-all.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg1-13/igt@gem_exec_whisper@basic-queues-priority-all.html>
>   *
> 
>     igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>       o {shard-dg1}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html> (i915#5493 <https://gitlab.freedesktop.org/drm/intel/issues/5493>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>   *
> 
>     igt@i915_hangman@gt-engine-error@vcs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-6/igt@i915_hangman@gt-engine-error@vcs0.html> (i915#7069 <https://gitlab.freedesktop.org/drm/intel/issues/7069>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-6/igt@i915_hangman@gt-engine-error@vcs0.html>
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-dg2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html> (i915#7061 <https://gitlab.freedesktop.org/drm/intel/issues/7061>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html>
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o shard-apl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-apl6/igt@i915_pm_dc@dc9-dpms.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-apl3/igt@i915_pm_dc@dc9-dpms.html>
>   *
> 
>     igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-rkl-2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html> (i915#1937 <https://gitlab.freedesktop.org/drm/intel/issues/1937> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html>
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@bcs0:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html> (i915#3591 <https://gitlab.freedesktop.org/drm/intel/issues/3591>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html>
>   *
> 
>     igt@i915_pm_rpm@dpms-non-lpsp:
> 
>       o
> 
>         {shard-dg1}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg1-18/igt@i915_pm_rpm@dpms-non-lpsp.html> +1 similar issue
> 
>       o
> 
>         shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-10/igt@i915_pm_rpm@dpms-non-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-3/igt@i915_pm_rpm@dpms-non-lpsp.html>
> 
>   *
> 
>     igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html> +1 similar issue
>   *
> 
>     igt@i915_selftest@live@workarounds:
> 
>       o shard-mtlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-5/igt@i915_selftest@live@workarounds.html> (i915#6763 <https://gitlab.freedesktop.org/drm/intel/issues/6763>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-2/igt@i915_selftest@live@workarounds.html>
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html> (i915#5138 <https://gitlab.freedesktop.org/drm/intel/issues/5138>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>   *
> 
>     igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>       o {shard-dg1}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg1-17/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html> (i915#4391 <https://gitlab.freedesktop.org/drm/intel/issues/4391> / i915#4423 <https://gitlab.freedesktop.org/drm/intel/issues/4423>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg1-12/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html> +2 similar issues
>   *
> 
>     igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1:
> 
>       o shard-mtlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-6/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html> (i915#1982 <https://gitlab.freedesktop.org/drm/intel/issues/1982>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html> (i915#6880 <https://gitlab.freedesktop.org/drm/intel/issues/6880>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html> +1 similar issue
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
> 
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-tglu-9/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html> (i915#8292 <https://gitlab.freedesktop.org/drm/intel/issues/8292>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html>
>   *
> 
>     igt@kms_vblank@pipe-c-wait-busy-hang:
> 
>       o shard-mtlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-4/igt@kms_vblank@pipe-c-wait-busy-hang.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-5/igt@kms_vblank@pipe-c-wait-busy-hang.html>
>   *
> 
>     igt@perf@enable-disable@0-rcs0:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html> (i915#8724 <https://gitlab.freedesktop.org/drm/intel/issues/8724>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-8/igt@perf@enable-disable@0-rcs0.html>
>   *
> 
>     igt@perf_pmu@busy-double-start@ccs3:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-11/igt@perf_pmu@busy-double-start@ccs3.html> (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-5/igt@perf_pmu@busy-double-start@ccs3.html> +11 similar issues
>   *
> 
>     igt@perf_pmu@busy-double-start@vcs1:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html> (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html> +2 similar issues
>   *
> 
>     igt@perf_pmu@most-busy-idle-check-all@rcs0:
> 
>       o
> 
>         shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-12/igt@perf_pmu@most-busy-idle-check-all@rcs0.html> (i915#5234 <https://gitlab.freedesktop.org/drm/intel/issues/5234>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
> 
>       o
> 
>         {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg1-13/igt@perf_pmu@most-busy-idle-check-all@rcs0.html> (i915#5234 <https://gitlab.freedesktop.org/drm/intel/issues/5234>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg1-18/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
> 
>   *
> 
>     igt@perf_pmu@render-node-busy-idle@ccs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-7/igt@perf_pmu@render-node-busy-idle@ccs0.html> (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-2/igt@perf_pmu@render-node-busy-idle@ccs0.html> +5 similar issues
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_exec_whisper@basic-contexts-priority-all:
> 
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-8/igt@gem_exec_whisper@basic-contexts-priority-all.html> (i915#8131 <https://gitlab.freedesktop.org/drm/intel/issues/8131>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-1/igt@gem_exec_whisper@basic-contexts-priority-all.html> (i915#7392 <https://gitlab.freedesktop.org/drm/intel/issues/7392>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@vecs0:
> 
>       o shard-tglu: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html> (i915#2681 <https://gitlab.freedesktop.org/drm/intel/issues/2681>) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html> (i915#2681 <https://gitlab.freedesktop.org/drm/intel/issues/2681> / i915#3591 <https://gitlab.freedesktop.org/drm/intel/issues/3591>)
>   *
> 
>     igt@kms_async_flips@crc@pipe-a-edp-1:
> 
>       o shard-mtlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-mtlp-3/igt@kms_async_flips@crc@pipe-a-edp-1.html> (i915#1982 <https://gitlab.freedesktop.org/drm/intel/issues/1982> / i915#8561 <https://gitlab.freedesktop.org/drm/intel/issues/8561>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-mtlp-5/igt@kms_async_flips@crc@pipe-a-edp-1.html> (i915#8561 <https://gitlab.freedesktop.org/drm/intel/issues/8561>)
>   *
> 
>     igt@kms_content_protection@type1:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-11/igt@kms_content_protection@type1.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118> / i915#7162 <https://gitlab.freedesktop.org/drm/intel/issues/7162>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-3/igt@kms_content_protection@type1.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>) +1 similar issue
>   *
> 
>     igt@kms_fbcon_fbt@psr-suspend:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html> (i915#3955 <https://gitlab.freedesktop.org/drm/intel/issues/3955>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html> (fdo#110189 <https://bugs.freedesktop.org/show_bug.cgi?id=110189> / i915#3955 <https://gitlab.freedesktop.org/drm/intel/issues/3955>)
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-rkl-6/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-rkl-1/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285> / i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>   *
> 
>     igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
> 
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13327/shard-dg2-12/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html> (i915#5493 <https://gitlab.freedesktop.org/drm/intel/issues/5493>) -> CRASH <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html> (i915#7331 <https://gitlab.freedesktop.org/drm/intel/issues/7331>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7351 -> IGTPW_9267
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_13327: 954bc57e332bc11eb26322e2adb4d84431b25d45 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_9267: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9267/index.html
> IGT_7351: d8dc96b95c60e4737fdfa1664ce9b1dcebfdef60 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
