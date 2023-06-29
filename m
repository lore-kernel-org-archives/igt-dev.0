Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCB010E002
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 06:33:21 +0000 (UTC)
Message-ID: <883f1db5-6ec0-d052-6706-aecc1b8e5bd6@intel.com>
Date: Thu, 29 Jun 2023 08:33:08 +0200
To: <igt-dev@lists.freedesktop.org>
References: <20230628081050.2002028-1-karolina.stolarek@intel.com>
 <168799888541.28964.9606805945106780510@emeril.freedesktop.org>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <168799888541.28964.9606805945106780510@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2lu?=
 =?utf-8?q?tel=5Fbatchbuffer=3A_Remove_unused_argument_in_exec=5Fblit?=
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


On 29.06.2023 02:34, Patchwork wrote:
> *Patch Details*
> *Series:*	lib/intel_batchbuffer: Remove unused argument in exec_blit
> *URL:*	https://patchwork.freedesktop.org/series/119961/ 
> <https://patchwork.freedesktop.org/series/119961/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_13329_full -> IGTPW_9287_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_9287_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_9287_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/index.html
> 
> 
>     Participating hosts (10 -> 9)
> 
> Missing (1): shard-rkl0
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_9287_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@i915_selftest@live@gt_pm:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-1/igt@i915_selftest@live@gt_pm.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-3/igt@i915_selftest@live@gt_pm.html>
>   *
> 
>     igt@kms_psr@psr2_sprite_blt:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-7/igt@kms_psr@psr2_sprite_blt.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-8/igt@kms_psr@psr2_sprite_blt.html>
> 

Both failures are not related to my changes.

All the best,
Karolina

>     Known issues
> 
> Here are the changes found in IGTPW_9287_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@api_intel_bb@crc32:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-1/igt@api_intel_bb@crc32.html> (i915#6230 <https://gitlab.freedesktop.org/drm/intel/issues/6230>)
>   *
> 
>     igt@drm_fdinfo@busy@ccs0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-8/igt@drm_fdinfo@busy@ccs0.html> (i915#8414 <https://gitlab.freedesktop.org/drm/intel/issues/8414>) +9 similar issues
>   *
> 
>     igt@drm_fdinfo@busy@ccs3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-8/igt@drm_fdinfo@busy@ccs3.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#8414 <https://gitlab.freedesktop.org/drm/intel/issues/8414>)
>   *
> 
>     igt@drm_fdinfo@virtual-busy-hang-all:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-1/igt@drm_fdinfo@virtual-busy-hang-all.html> (i915#8414 <https://gitlab.freedesktop.org/drm/intel/issues/8414>)
>   *
> 
>     igt@feature_discovery@psr1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-1/igt@feature_discovery@psr1.html> (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +2 similar issues
>   *
> 
>     igt@gem_bad_reloc@negative-reloc-lut:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +4 similar issues
>   *
> 
>     igt@gem_busy@semaphore:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-3/igt@gem_busy@semaphore.html> (i915#3936 <https://gitlab.freedesktop.org/drm/intel/issues/3936>)
>   *
> 
>     igt@gem_close_race@multigpu-basic-threads:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-3/igt@gem_close_race@multigpu-basic-threads.html> (i915#7697 <https://gitlab.freedesktop.org/drm/intel/issues/7697>)
>   *
> 
>     igt@gem_create@create-ext-set-pat:
> 
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-9/igt@gem_create@create-ext-set-pat.html> (i915#8621 <https://gitlab.freedesktop.org/drm/intel/issues/8621>)
>   *
> 
>     igt@gem_ctx_param@set-priority-not-supported:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-3/igt@gem_ctx_param@set-priority-not-supported.html> (fdo#109314 <https://bugs.freedesktop.org/show_bug.cgi?id=109314>)
>   *
> 
>     igt@gem_ctx_sseu@engines:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-7/igt@gem_ctx_sseu@engines.html> (i915#280 <https://gitlab.freedesktop.org/drm/intel/issues/280>)
>   *
> 
>     igt@gem_eio@hibernate:
> 
>       o shard-rkl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-7/igt@gem_eio@hibernate.html> (i915#7975 <https://gitlab.freedesktop.org/drm/intel/issues/7975> / i915#8213 <https://gitlab.freedesktop.org/drm/intel/issues/8213>)
>   *
> 
>     igt@gem_exec_await@wide-contexts:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-10/igt@gem_exec_await@wide-contexts.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-8/igt@gem_exec_await@wide-contexts.html> (i915#5892 <https://gitlab.freedesktop.org/drm/intel/issues/5892>)
>   *
> 
>     igt@gem_exec_balancer@bonded-true-hang:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-1/igt@gem_exec_balancer@bonded-true-hang.html> (i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>) +1 similar issue
>   *
> 
>     igt@gem_exec_balancer@full-pulse:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-10/igt@gem_exec_balancer@full-pulse.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-3/igt@gem_exec_balancer@full-pulse.html> (i915#6032 <https://gitlab.freedesktop.org/drm/intel/issues/6032>)
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-7/igt@gem_exec_balancer@parallel-keep-in-fence.html> (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>   *
> 
>     igt@gem_exec_capture@capture-invisible@smem0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-6/igt@gem_exec_capture@capture-invisible@smem0.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#6334 <https://gitlab.freedesktop.org/drm/intel/issues/6334>)
>   *
> 
>     igt@gem_exec_fair@basic-flow:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-8/igt@gem_exec_fair@basic-flow.html> (i915#3539 <https://gitlab.freedesktop.org/drm/intel/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/intel/issues/4852>)
>   *
> 
>     igt@gem_exec_fair@basic-none-share@rcs0:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-7/igt@gem_exec_fair@basic-none-share@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-4/igt@gem_exec_fair@basic-none-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-none-vip:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-4/igt@gem_exec_fair@basic-none-vip.html> (i915#4473 <https://gitlab.freedesktop.org/drm/intel/issues/4473> / i915#4771 <https://gitlab.freedesktop.org/drm/intel/issues/4771>)
>   *
> 
>     igt@gem_exec_fair@basic-sync:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@gem_exec_fair@basic-sync.html> (i915#3539 <https://gitlab.freedesktop.org/drm/intel/issues/3539>)
>   *
> 
>     igt@gem_exec_fence@submit3:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-2/igt@gem_exec_fence@submit3.html> (i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>)
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-read:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-10/igt@gem_exec_reloc@basic-gtt-read.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +6 similar issues
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +10 similar issues
>   *
> 
>     igt@gem_exec_schedule@deep@vcs1:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-2/igt@gem_exec_schedule@deep@vcs1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-2/igt@gem_exec_schedule@deep@vcs1.html> (i915#8606 <https://gitlab.freedesktop.org/drm/intel/issues/8606>)
>   *
> 
>     igt@gem_exec_schedule@preemptive-hang@vcs0:
> 
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-3/igt@gem_exec_schedule@preemptive-hang@vcs0.html> (i915#7327 <https://gitlab.freedesktop.org/drm/intel/issues/7327>)
>   *
> 
>     igt@gem_exec_whisper@basic-queues-all:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-7/igt@gem_exec_whisper@basic-queues-all.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-2/igt@gem_exec_whisper@basic-queues-all.html> (i915#6363 <https://gitlab.freedesktop.org/drm/intel/issues/6363>) +2 similar issues
>   *
> 
>     igt@gem_fence_thrash@bo-write-verify-threaded-none:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-6/igt@gem_fence_thrash@bo-write-verify-threaded-none.html> (i915#4860 <https://gitlab.freedesktop.org/drm/intel/issues/4860>)
>   *
> 
>     igt@gem_fenced_exec_thrash@no-spare-fences-busy:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html> (i915#4860 <https://gitlab.freedesktop.org/drm/intel/issues/4860>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-multi:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-apl6/igt@gem_lmem_swapping@heavy-multi.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@parallel-multi:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1 similar issue
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-verify:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-1/igt@gem_lmem_swapping@parallel-random-verify.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +2 similar issues
>   *
> 
>     igt@gem_madvise@dontneed-after-mmap:
> 
>       o shard-mtlp: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-6/igt@gem_madvise@dontneed-after-mmap.html> (i915#8747 <https://gitlab.freedesktop.org/drm/intel/issues/8747>)
>   *
> 
>     igt@gem_mmap_gtt@cpuset-big-copy-odd:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +8 similar issues
>   *
> 
>     igt@gem_mmap_gtt@cpuset-medium-copy-xy:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +6 similar issues
>   *
> 
>     igt@gem_mmap_wc@bad-offset:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-8/igt@gem_mmap_wc@bad-offset.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>) +2 similar issues
>   *
> 
>     igt@gem_mmap_wc@read:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-8/igt@gem_mmap_wc@read.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-10/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +3 similar issues
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +2 similar issues
>   *
> 
>     igt@gem_pwrite@basic-random:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-7/igt@gem_pwrite@basic-random.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>   *
> 
>     igt@gem_pxp@fail-invalid-protected-context:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-3/igt@gem_pxp@fail-invalid-protected-context.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +2 similar issues
>   *
> 
>     igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-10/igt@gem_pxp@protected-raw-src-copy-not-readible.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-2/igt@gem_pxp@protected-raw-src-copy-not-readible.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
> 
>   *
> 
>     igt@gem_pxp@regular-baseline-src-copy-readible:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-7/igt@gem_pxp@regular-baseline-src-copy-readible.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>   *
> 
>     igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html> (i915#8428 <https://gitlab.freedesktop.org/drm/intel/issues/8428>) +2 similar issues
>   *
> 
>     igt@gem_set_tiling_vs_blt@untiled-to-tiled:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-1/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>)
>   *
> 
>     igt@gem_set_tiling_vs_gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-7/igt@gem_set_tiling_vs_gtt.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +2 similar issues
>   *
> 
>     igt@gem_userptr_blits@coherency-unsync:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-10/igt@gem_userptr_blits@coherency-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>) +1 similar issue
>   *
> 
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297> / i915#4880 <https://gitlab.freedesktop.org/drm/intel/issues/4880>) +1 similar issue
>   *
> 
>     igt@gem_userptr_blits@readonly-pwrite-unsync:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-4/igt@gem_userptr_blits@readonly-pwrite-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@set-cache-level:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-3/igt@gem_userptr_blits@set-cache-level.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>   *
> 
>     igt@gen7_exec_parse@batch-without-end:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-1/igt@gen7_exec_parse@batch-without-end.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +2 similar issues
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-2/igt@gen7_exec_parse@batch-without-end.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +1 similar issue
> 
>   *
> 
>     igt@gen7_exec_parse@chained-batch:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-5/igt@gen7_exec_parse@chained-batch.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>   *
> 
>     igt@gen9_exec_parse@allowed-single:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl3/igt@gen9_exec_parse@allowed-single.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-apl6/igt@gen9_exec_parse@allowed-single.html> (i915#5566 <https://gitlab.freedesktop.org/drm/intel/issues/5566>)
>   *
> 
>     igt@gen9_exec_parse@batch-without-end:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-8/igt@gen9_exec_parse@batch-without-end.html> (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +2 similar issues
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-1/igt@gen9_exec_parse@batch-without-end.html> (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>) +1 similar issue
> 
>   *
> 
>     igt@gen9_exec_parse@bb-start-far:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-8/igt@gen9_exec_parse@bb-start-far.html> (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>   *
> 
>     igt@gen9_exec_parse@bb-start-param:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-3/igt@gen9_exec_parse@bb-start-param.html> (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527> / i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>   *
> 
>     igt@i915_fb_tiling:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-1/igt@i915_fb_tiling.html> (i915#4881 <https://gitlab.freedesktop.org/drm/intel/issues/4881>)
>   *
> 
>     igt@i915_hangman@engine-engine-hang@vcs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@i915_hangman@engine-engine-hang@vcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-8/igt@i915_hangman@engine-engine-hang@vcs0.html> (i915#7069 <https://gitlab.freedesktop.org/drm/intel/issues/7069>) +1 similar issue
>   *
> 
>     igt@i915_module_load@resize-bar:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-2/igt@i915_module_load@resize-bar.html> (i915#6412 <https://gitlab.freedesktop.org/drm/intel/issues/6412>)
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-2/igt@i915_pm_dc@dc9-dpms.html> (i915#3361 <https://gitlab.freedesktop.org/drm/intel/issues/3361>)
>   *
> 
>     igt@i915_pm_freq_api@freq-basic-api:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-apl2/igt@i915_pm_freq_api@freq-basic-api.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +49 similar issues
>   *
> 
>     igt@i915_pm_rc6_residency@media-rc6-accuracy:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289> / i915#8403 <https://gitlab.freedesktop.org/drm/intel/issues/8403>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-accuracy:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-3/igt@i915_pm_rc6_residency@rc6-accuracy.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@i915_pm_rc6_residency@rc6-accuracy.html> (i915#8230 <https://gitlab.freedesktop.org/drm/intel/issues/8230>)
>   *
> 
>     igt@i915_pm_rpm@dpms-mode-unset-lpsp:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>   *
> 
>     igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-1/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html> (i915#8431 <https://gitlab.freedesktop.org/drm/intel/issues/8431>)
>   *
> 
>     igt@i915_pm_rpm@modeset-lpsp:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-10/igt@i915_pm_rpm@modeset-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@i915_pm_rpm@modeset-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) +1 similar issue
>   *
> 
>     igt@i915_pm_rps@engine-order:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl2/igt@i915_pm_rps@engine-order.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-apl4/igt@i915_pm_rps@engine-order.html> (i915#6537 <https://gitlab.freedesktop.org/drm/intel/issues/6537>)
>   *
> 
>     igt@i915_pm_rps@min-max-config-loaded:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-6/igt@i915_pm_rps@min-max-config-loaded.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>   *
> 
>     igt@i915_pm_rps@waitboost:
> 
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-1/igt@i915_pm_rps@waitboost.html> (i915#8346 <https://gitlab.freedesktop.org/drm/intel/issues/8346>)
>   *
> 
>     igt@i915_selftest@live@dmabuf:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl2/igt@i915_selftest@live@dmabuf.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-apl4/igt@i915_selftest@live@dmabuf.html> (i915#7562 <https://gitlab.freedesktop.org/drm/intel/issues/7562>)
>   *
> 
>     igt@i915_selftest@live@gt_heartbeat:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-1/igt@i915_selftest@live@gt_heartbeat.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-6/igt@i915_selftest@live@gt_heartbeat.html> (i915#7872 <https://gitlab.freedesktop.org/drm/intel/issues/7872>)
>   *
> 
>     igt@i915_selftest@live@gt_mocs:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-1/igt@i915_selftest@live@gt_mocs.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-3/igt@i915_selftest@live@gt_mocs.html> (i915#7059 <https://gitlab.freedesktop.org/drm/intel/issues/7059>)
>   *
> 
>     igt@i915_suspend@basic-s3-without-i915:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-7/igt@i915_suspend@basic-s3-without-i915.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-6/igt@i915_suspend@basic-s3-without-i915.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>   *
> 
>     igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-6/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +1 similar issue
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs.html> (i915#8502 <https://gitlab.freedesktop.org/drm/intel/issues/8502>) +3 similar issues
>   *
> 
>     igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-8/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html> (i915#8247 <https://gitlab.freedesktop.org/drm/intel/issues/8247>) +3 similar issues
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html> (i915#1769 <https://gitlab.freedesktop.org/drm/intel/issues/1769> / i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html> (i915#1769 <https://gitlab.freedesktop.org/drm/intel/issues/1769> / i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-8/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> / i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>   *
> 
>     igt@kms_big_fb@4-tiled-addfb-size-overflow:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html> (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +2 similar issues
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (i915#5138 <https://gitlab.freedesktop.org/drm/intel/issues/5138>) +1 similar issue
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (i915#3743 <https://gitlab.freedesktop.org/drm/intel/issues/3743>) +1 similar issue
>   *
> 
>     igt@kms_big_fb@linear-16bpp-rotate-0:
> 
>       o shard-mtlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-8/igt@kms_big_fb@linear-16bpp-rotate-0.html> (i915#1982 <https://gitlab.freedesktop.org/drm/intel/issues/1982>)
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +2 similar issues
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +1 similar issue
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614> / i915#3638 <https://gitlab.freedesktop.org/drm/intel/issues/3638>)
> 
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html> (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +6 similar issues
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +8 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html> (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>)
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html> (i915#4538 <https://gitlab.freedesktop.org/drm/intel/issues/4538> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
> 
>   *
> 
>     igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-apl1/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>   *
> 
>     igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-2/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html> (i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +3 similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-9/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +4 similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-4/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html> (i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>   *
> 
>     igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs_cc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-1/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +4 similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-5/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs.html> (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +22 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-1/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +3 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-2/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +1 similar issue
>   *
> 
>     igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_mtl_mc_ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_mtl_mc_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +16 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-9/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>   *
> 
>     igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-7/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +10 similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-5/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +6 similar issues
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html> (i915#4087 <https://gitlab.freedesktop.org/drm/intel/issues/4087>) +2 similar issues
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
>   *
> 
>     igt@kms_chamelium_color@ctm-red-to-blue:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-6/igt@kms_chamelium_color@ctm-red-to-blue.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1 similar issue
>   *
> 
>     igt@kms_chamelium_color@gamma:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-5/igt@kms_chamelium_color@gamma.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-7/igt@kms_chamelium_color@gamma.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-fast:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-7/igt@kms_chamelium_hpd@hdmi-hpd-fast.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>)
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +2 similar issues
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-5/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +5 similar issues
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-10/igt@kms_content_protection@atomic-dpms.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>) +2 similar issues
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
> 
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-7/igt@kms_content_protection@dp-mst-lic-type-0.html> (i915#3299 <https://gitlab.freedesktop.org/drm/intel/issues/3299>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html> (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +1 similar issue
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-32x32:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-4/igt@kms_cursor_crc@cursor-sliding-32x32.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +9 similar issues
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-4:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-4.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +1 similar issue
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-10/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html> (fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767> / i915#3546 <https://gitlab.freedesktop.org/drm/intel/issues/3546>) +1 similar issue
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>)
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +2 similar issues
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html> (i915#3804 <https://gitlab.freedesktop.org/drm/intel/issues/3804> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-8/igt@kms_dsc@dsc-with-bpc.html> (i915#3840 <https://gitlab.freedesktop.org/drm/intel/issues/3840> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
>   *
> 
>     igt@kms_fence_pin_leak:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-1/igt@kms_fence_pin_leak.html> (i915#4881 <https://gitlab.freedesktop.org/drm/intel/issues/4881>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +3 similar issues
>   *
> 
>     igt@kms_flip@2x-flip-vs-rmfb:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-3/igt@kms_flip@2x-flip-vs-rmfb.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-snb2/igt@kms_flip@2x-nonexisting-fb.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +13 similar issues
>   *
> 
>     igt@kms_flip@flip-vs-fences:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-7/igt@kms_flip@flip-vs-fences.html> (i915#8381 <https://gitlab.freedesktop.org/drm/intel/issues/8381>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/intel/issues/5274>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +3 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html> (i915#6880 <https://gitlab.freedesktop.org/drm/intel/issues/6880>) +1 similar issue
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html> (i915#6880 <https://gitlab.freedesktop.org/drm/intel/issues/6880>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html> (i915#8708 <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +13 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt.html> (i915#3023 <https://gitlab.freedesktop.org/drm/intel/issues/3023>) +5 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html> (i915#1825 <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +20 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html> (fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +2 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html> (i915#3458 <https://gitlab.freedesktop.org/drm/intel/issues/3458>) +6 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html> (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +5 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html> (fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825> / i915#1825 <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +6 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html> (fdo#110189 <https://bugs.freedesktop.org/show_bug.cgi?id=110189>) +5 similar issues
>   *
> 
>     igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1:
> 
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-apl6/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-dp-1.html> (i915#4573 <https://gitlab.freedesktop.org/drm/intel/issues/4573>) +1 similar issue
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-2.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +1 similar issue
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-2.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +1 similar issue
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-edp-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +4 similar issues
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +8 similar issues
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-c-dp-1:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-apl4/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-c-dp-1.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +5 similar issues
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-hdmi-a-3.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +2 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-3.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +2 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-2.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +2 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +2 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +2 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-hdmi-a-1:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-snb1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-hdmi-a-1.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +9 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +2 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-dp-4.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +8 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-apl1/igt@kms_psr2_su@page_flip-p010.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-4/igt@kms_psr2_su@page_flip-p010.html> (i915#4348 <https://gitlab.freedesktop.org/drm/intel/issues/4348>)
> 
>   *
> 
>     igt@kms_psr@cursor_render:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-2/igt@kms_psr@cursor_render.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +2 similar issues
>   *
> 
>     igt@kms_psr@psr2_sprite_mmap_gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@kms_psr@psr2_sprite_mmap_gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3 similar issues
>   *
> 
>     igt@kms_rotation_crc@bad-tiling:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-5/igt@kms_rotation_crc@bad-tiling.html> (i915#4235 <https://gitlab.freedesktop.org/drm/intel/issues/4235>)
>   *
> 
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html> (i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-270:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-1/igt@kms_rotation_crc@primary-rotation-270.html> (i915#4235 <https://gitlab.freedesktop.org/drm/intel/issues/4235>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html> (i915#4235 <https://gitlab.freedesktop.org/drm/intel/issues/4235> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> / i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
> 
>   *
> 
>     igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-10/igt@kms_setmode@invalid-clone-exclusive-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
>   *
> 
>     igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-5/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>   *
> 
>     igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html> (i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> / i915#6768 <https://gitlab.freedesktop.org/drm/intel/issues/6768>) +1 similar issue
>   *
> 
>     igt@kms_vblank@pipe-d-accuracy-idle:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-6/igt@kms_vblank@pipe-d-accuracy-idle.html> (i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> / i915#533 <https://gitlab.freedesktop.org/drm/intel/issues/533> / i915#6768 <https://gitlab.freedesktop.org/drm/intel/issues/6768>)
>   *
> 
>     igt@kms_vrr@flipline:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-4/igt@kms_vrr@flipline.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-6/igt@kms_writeback@writeback-check-output.html> (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>   *
> 
>     igt@perf@global-sseu-config-invalid:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-6/igt@perf@global-sseu-config-invalid.html> (i915#7387 <https://gitlab.freedesktop.org/drm/intel/issues/7387>)
>   *
> 
>     igt@perf_pmu@busy-idle-check-all@ccs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@perf_pmu@busy-idle-check-all@ccs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-4/igt@perf_pmu@busy-idle-check-all@ccs0.html> (i915#4521 <https://gitlab.freedesktop.org/drm/intel/issues/4521>) +3 similar issues
>   *
> 
>     igt@perf_pmu@busy-idle-check-all@vcs0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-3/igt@perf_pmu@busy-idle-check-all@vcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-8/igt@perf_pmu@busy-idle-check-all@vcs0.html> (i915#4521 <https://gitlab.freedesktop.org/drm/intel/issues/4521>) +6 similar issues
>   *
> 
>     igt@perf_pmu@faulting-read@gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-1/igt@perf_pmu@faulting-read@gtt.html> (i915#8440 <https://gitlab.freedesktop.org/drm/intel/issues/8440>)
>   *
> 
>     igt@perf_pmu@render-node-busy-idle@ccs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-4/igt@perf_pmu@render-node-busy-idle@ccs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-2/igt@perf_pmu@render-node-busy-idle@ccs0.html> (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>) +3 similar issues
>   *
> 
>     igt@prime_vgem@basic-blt:
> 
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-2/igt@prime_vgem@basic-blt.html> (i915#8445 <https://gitlab.freedesktop.org/drm/intel/issues/8445>) +1 similar issue
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-10/igt@prime_vgem@basic-fence-read.html> (i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +1 similar issue
>   *
> 
>     igt@prime_vgem@basic-read:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-1/igt@prime_vgem@basic-read.html> (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> / i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>   *
> 
>     igt@prime_vgem@fence-flip-hang:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@prime_vgem@fence-flip-hang.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>   *
> 
>     igt@prime_vgem@fence-write-hang:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-10/igt@prime_vgem@fence-write-hang.html> (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295>)
>   *
> 
>     igt@sysfs_heartbeat_interval@precise@vecs0:
> 
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-6/igt@sysfs_heartbeat_interval@precise@vecs0.html> (i915#8332 <https://gitlab.freedesktop.org/drm/intel/issues/8332>)
>   *
> 
>     igt@tools_test@sysfs_l3_parity:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-3/igt@tools_test@sysfs_l3_parity.html> (i915#4818 <https://gitlab.freedesktop.org/drm/intel/issues/4818>)
>   *
> 
>     igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-8/igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +4 similar issues
>   *
> 
>     igt@v3d/v3d_submit_cl@bad-multisync-in-sync:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-10/igt@v3d/v3d_submit_cl@bad-multisync-in-sync.html> (fdo#109315 <https://bugs.freedesktop.org/show_bug.cgi?id=109315> / i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>)
>   *
> 
>     igt@v3d/v3d_submit_cl@simple-flush-cache:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-1/igt@v3d/v3d_submit_cl@simple-flush-cache.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +5 similar issues
>   *
> 
>     igt@v3d/v3d_submit_csd@bad-multisync-out-sync:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-2/igt@v3d/v3d_submit_csd@bad-multisync-out-sync.html> (fdo#109315 <https://bugs.freedesktop.org/show_bug.cgi?id=109315>) +1 similar issue
>   *
> 
>     igt@vc4/vc4_mmap@mmap-bad-handle:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-10/igt@vc4/vc4_mmap@mmap-bad-handle.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +3 similar issues
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-2/igt@vc4/vc4_mmap@mmap-bad-handle.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +2 similar issues
> 
>   *
> 
>     igt@vc4/vc4_purgeable_bo@free-purged-bo:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-3/igt@vc4/vc4_purgeable_bo@free-purged-bo.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +5 similar issues
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_create@hog-create@smem0:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-8/igt@gem_create@hog-create@smem0.html> (i915#5892 <https://gitlab.freedesktop.org/drm/intel/issues/5892> / i915#7679 <https://gitlab.freedesktop.org/drm/intel/issues/7679>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@gem_create@hog-create@smem0.html>
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg1-12/igt@gem_eio@unwedge-stress.html> (i915#5784 <https://gitlab.freedesktop.org/drm/intel/issues/5784>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg1-18/igt@gem_eio@unwedge-stress.html>
>   *
> 
>     igt@gem_exec_capture@pi@vcs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-8/igt@gem_exec_capture@pi@vcs0.html> (i915#4475 <https://gitlab.freedesktop.org/drm/intel/issues/4475>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-1/igt@gem_exec_capture@pi@vcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-none@bcs0:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-2/igt@gem_exec_fair@basic-none@bcs0.html> +3 similar issues
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o
> 
>         shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html>
> 
>       o
> 
>         shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html>
> 
>   *
> 
>     igt@gem_exec_whisper@basic-contexts-forked-all:
> 
>       o shard-mtlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-2/igt@gem_exec_whisper@basic-contexts-forked-all.html> (i915#8628 <https://gitlab.freedesktop.org/drm/intel/issues/8628>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-7/igt@gem_exec_whisper@basic-contexts-forked-all.html>
>   *
> 
>     igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>       o shard-dg2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html> (i915#4936 <https://gitlab.freedesktop.org/drm/intel/issues/4936> / i915#5493 <https://gitlab.freedesktop.org/drm/intel/issues/5493>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html> (i915#8489 <https://gitlab.freedesktop.org/drm/intel/issues/8489>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html>
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o shard-apl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl1/igt@i915_pm_dc@dc9-dpms.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-apl2/igt@i915_pm_dc@dc9-dpms.html>
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@vecs0:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html> (i915#3591 <https://gitlab.freedesktop.org/drm/intel/issues/3591>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html>
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html> (i915#8248 <https://gitlab.freedesktop.org/drm/intel/issues/8248>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html>
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>       o shard-apl: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html> (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html> (i915#6880 <https://gitlab.freedesktop.org/drm/intel/issues/6880>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html> +1 similar issue
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html> (i915#433 <https://gitlab.freedesktop.org/drm/intel/issues/433>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html>
>   *
> 
>     igt@kms_vblank@pipe-b-ts-continuation-suspend:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-5/igt@kms_vblank@pipe-b-ts-continuation-suspend.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html> +1 similar issue
>   *
> 
>     igt@perf@non-zero-reason@0-rcs0:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-8/igt@perf@non-zero-reason@0-rcs0.html> (i915#7484 <https://gitlab.freedesktop.org/drm/intel/issues/7484>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-5/igt@perf@non-zero-reason@0-rcs0.html>
>   *
> 
>     igt@perf_pmu@busy-double-start@rcs0:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-dg2-1/igt@perf_pmu@busy-double-start@rcs0.html> (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-dg2-3/igt@perf_pmu@busy-double-start@rcs0.html>
>   *
> 
>     igt@perf_pmu@busy-double-start@vcs1:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-7/igt@perf_pmu@busy-double-start@vcs1.html> (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-2/igt@perf_pmu@busy-double-start@vcs1.html> +2 similar issues
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_exec_whisper@basic-contexts-priority-all:
> 
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-priority-all.html> (i915#8131 <https://gitlab.freedesktop.org/drm/intel/issues/8131>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-2/igt@gem_exec_whisper@basic-contexts-priority-all.html> (i915#7392 <https://gitlab.freedesktop.org/drm/intel/issues/7392>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@vcs0:
> 
>       o shard-tglu: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html> (i915#2681 <https://gitlab.freedesktop.org/drm/intel/issues/2681>) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html> (i915#2681 <https://gitlab.freedesktop.org/drm/intel/issues/2681> / i915#3591 <https://gitlab.freedesktop.org/drm/intel/issues/3591>)
>   *
> 
>     igt@kms_async_flips@crc@pipe-b-edp-1:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-5/igt@kms_async_flips@crc@pipe-b-edp-1.html> (i915#8247 <https://gitlab.freedesktop.org/drm/intel/issues/8247>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-4/igt@kms_async_flips@crc@pipe-b-edp-1.html> (i915#8561 <https://gitlab.freedesktop.org/drm/intel/issues/8561>)
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-rkl-1/igt@kms_fbcon_fbt@psr.html> (fdo#110189 <https://bugs.freedesktop.org/show_bug.cgi?id=110189> / i915#3955 <https://gitlab.freedesktop.org/drm/intel/issues/3955>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-rkl-4/igt@kms_fbcon_fbt@psr.html> (i915#3955 <https://gitlab.freedesktop.org/drm/intel/issues/3955>)
>   *
> 
>     igt@sysfs_preempt_timeout@timeout@vecs0:
> 
>       o shard-mtlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/shard-mtlp-4/igt@sysfs_preempt_timeout@timeout@vecs0.html> (i915#7947 <https://gitlab.freedesktop.org/drm/intel/issues/7947>) -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/shard-mtlp-6/igt@sysfs_preempt_timeout@timeout@vecs0.html> (i915#8521 <https://gitlab.freedesktop.org/drm/intel/issues/8521>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7353 -> IGTPW_9287
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_13329: bd707928a4b45e1044e797ee6515e5a4a5c41ef7 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_9287: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9287/index.html
> IGT_7353: cacdae5ad7cb92bdc26a79802fcdd244dadccd42 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
