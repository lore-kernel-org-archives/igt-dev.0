Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F8010E492
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 06:35:13 +0000 (UTC)
Message-ID: <28e23af8-3f79-e463-986a-2f112ff2416d@intel.com>
Date: Wed, 12 Jul 2023 08:34:14 +0200
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <20230711114518.93415-1-karolina.stolarek@intel.com>
 <168909708268.18664.8994858255431496331@emeril.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <168909708268.18664.8994858255431496331@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2lu?=
 =?utf-8?q?tel=5Fbatchbuffer=3A_Inform_about_unsupported_bpp?=
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

On 11.07.2023 19:38, Patchwork wrote:
> *Patch Details*
> *Series:*	lib/intel_batchbuffer: Inform about unsupported bpp
> *URL:*	https://patchwork.freedesktop.org/series/120544/ 
> <https://patchwork.freedesktop.org/series/120544/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_13371_full -> IGTPW_9384_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_9384_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_9384_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/index.html
> 
> 
>     Participating hosts (10 -> 10)
> 
> Additional (1): shard-rkl0
> Missing (1): pig-kbl-iris
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_9384_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@perf_pmu@frequency@gt0:
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-4/igt@perf_pmu@frequency@gt0.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-5/igt@perf_pmu@frequency@gt0.html>
> 
> 
>         Warnings
> 
>   * igt@perf_pmu@frequency@gt0:
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg2-7/igt@perf_pmu@frequency@gt0.html> (i915#6806 <https://gitlab.freedesktop.org/drm/intel/issues/6806>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-5/igt@perf_pmu@frequency@gt0.html>
> 
> 

Haven't modified that test, failures not related to my changes.

All the best,
Karolina

>     Known issues
> 
> Here are the changes found in IGTPW_9384_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@device_reset@unbind-cold-reset-rebind:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html> (i915#7701 <https://gitlab.freedesktop.org/drm/intel/issues/7701>)
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-2/igt@device_reset@unbind-cold-reset-rebind.html> (i915#7701 <https://gitlab.freedesktop.org/drm/intel/issues/7701>)
> 
>   *
> 
>     igt@drm_fdinfo@busy-hang@bcs0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-11/igt@drm_fdinfo@busy-hang@bcs0.html> (i915#8414 <https://gitlab.freedesktop.org/drm/intel/issues/8414>) +9 similar issues
>   *
> 
>     igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-2/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html> (i915#7742 <https://gitlab.freedesktop.org/drm/intel/issues/7742>)
>   *
> 
>     igt@drm_fdinfo@virtual-busy-all:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-3/igt@drm_fdinfo@virtual-busy-all.html> (i915#8414 <https://gitlab.freedesktop.org/drm/intel/issues/8414>)
>   *
> 
>     igt@gem_basic@multigpu-create-close:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-1/igt@gem_basic@multigpu-create-close.html> (i915#7697 <https://gitlab.freedesktop.org/drm/intel/issues/7697>) +1 similar issue
>   *
> 
>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html> (i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>) +1 similar issue
>   *
> 
>     igt@gem_close_race@multigpu-basic-process:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-7/igt@gem_close_race@multigpu-basic-process.html> (i915#7697 <https://gitlab.freedesktop.org/drm/intel/issues/7697>) +1 similar issue
>   *
> 
>     igt@gem_create@create-ext-cpu-access-big:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-4/igt@gem_create@create-ext-cpu-access-big.html> (i915#6335 <https://gitlab.freedesktop.org/drm/intel/issues/6335>)
>   *
> 
>     igt@gem_ctx_param@set-priority-not-supported:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-2/igt@gem_ctx_param@set-priority-not-supported.html> (fdo#109314 <https://bugs.freedesktop.org/show_bug.cgi?id=109314>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-1/igt@gem_ctx_param@set-priority-not-supported.html> (fdo#109314 <https://bugs.freedesktop.org/show_bug.cgi?id=109314>)
> 
>   *
> 
>     igt@gem_ctx_persistence@engines-hostile@vcs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-1/igt@gem_ctx_persistence@engines-hostile@vcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-4/igt@gem_ctx_persistence@engines-hostile@vcs0.html> (i915#2410 <https://gitlab.freedesktop.org/drm/intel/issues/2410>) +2 similar issues
>   *
> 
>     igt@gem_eio@in-flight-10ms:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-5/igt@gem_eio@in-flight-10ms.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-6/igt@gem_eio@in-flight-10ms.html> (i915#8503 <https://gitlab.freedesktop.org/drm/intel/issues/8503>)
>   *
> 
>     igt@gem_exec_balancer@bonded-true-hang:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-2/igt@gem_exec_balancer@bonded-true-hang.html> (i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>) +2 similar issues
>   *
> 
>     igt@gem_exec_balancer@full-late-pulse:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg2-1/igt@gem_exec_balancer@full-late-pulse.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-11/igt@gem_exec_balancer@full-late-pulse.html> (i915#6032 <https://gitlab.freedesktop.org/drm/intel/issues/6032>)
>   *
> 
>     igt@gem_exec_fair@basic-none:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-8/igt@gem_exec_fair@basic-none.html> (i915#4473 <https://gitlab.freedesktop.org/drm/intel/issues/4473> / i915#4771 <https://gitlab.freedesktop.org/drm/intel/issues/4771>)
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
> 
>       o
> 
>         shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-10/igt@gem_exec_fair@basic-pace-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
> 
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-cpu-active:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-3/igt@gem_exec_reloc@basic-gtt-cpu-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +1 similar issue
>   *
> 
>     igt@gem_exec_reloc@basic-write-gtt-active:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-11/igt@gem_exec_reloc@basic-write-gtt-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +1 similar issue
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-7/igt@gem_exec_reloc@basic-write-gtt-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +1 similar issue
> 
>   *
> 
>     igt@gem_exec_whisper@basic-forked:
> 
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-6/igt@gem_exec_whisper@basic-forked.html> (i915#6363 <https://gitlab.freedesktop.org/drm/intel/issues/6363>)
>   *
> 
>     igt@gem_exec_whisper@basic-queues:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-snb2/igt@gem_exec_whisper@basic-queues.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +163 similar issues
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-multi.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-9/igt@gem_lmem_swapping@heavy-verify-random-ccs.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@parallel-multi:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-glk8/igt@gem_lmem_swapping@parallel-multi.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html> (i915#5493 <https://gitlab.freedesktop.org/drm/intel/issues/5493>)
>   *
> 
>     igt@gem_media_vme:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-10/igt@gem_media_vme.html> (i915#284 <https://gitlab.freedesktop.org/drm/intel/issues/284>)
>   *
> 
>     igt@gem_mmap_wc@write:
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-4/igt@gem_mmap_wc@write.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>) +1 similar issue
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-12/igt@gem_mmap_wc@write.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>) +3 similar issues
> 
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +2 similar issues
>   *
> 
>     igt@gem_pxp@create-regular-buffer:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-2/igt@gem_pxp@create-regular-buffer.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>   *
> 
>     igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-11/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-7/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
> 
>   *
> 
>     igt@gem_readwrite@beyond-eob:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-5/igt@gem_readwrite@beyond-eob.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +3 similar issues
>   *
> 
>     igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html> (i915#8428 <https://gitlab.freedesktop.org/drm/intel/issues/8428>) +1 similar issue
>   *
> 
>     igt@gem_tiled_fence_blits@basic:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-5/igt@gem_tiled_fence_blits@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +3 similar issues
>   *
> 
>     igt@gem_tiled_pread_basic:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-6/igt@gem_tiled_pread_basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>)
>   *
> 
>     igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
> 
>   *
> 
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297> / i915#4880 <https://gitlab.freedesktop.org/drm/intel/issues/4880>)
>   *
> 
>     igt@gem_workarounds@suspend-resume-fd:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-apl3/igt@gem_workarounds@suspend-resume-fd.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-apl2/igt@gem_workarounds@suspend-resume-fd.html> (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>   *
> 
>     igt@gen3_render_linear_blits:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-3/igt@gen3_render_linear_blits.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>   *
> 
>     igt@gen7_exec_parse@basic-allowed:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-6/igt@gen7_exec_parse@basic-allowed.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>   *
> 
>     igt@gen9_exec_parse@bb-large:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-8/igt@gen9_exec_parse@bb-large.html> (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-1/igt@gen9_exec_parse@bb-large.html> (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>)
> 
>   *
> 
>     igt@gen9_exec_parse@bb-start-cmd:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-4/igt@gen9_exec_parse@bb-start-cmd.html> (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>   *
> 
>     igt@i915_hangman@gt-engine-error@vcs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-6/igt@i915_hangman@gt-engine-error@vcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-3/igt@i915_hangman@gt-engine-error@vcs0.html> (i915#7069 <https://gitlab.freedesktop.org/drm/intel/issues/7069>)
>   *
> 
>     igt@i915_module_load@load:
> 
>       o
> 
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-snb5/igt@i915_module_load@load.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#6227 <https://gitlab.freedesktop.org/drm/intel/issues/6227>)
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-7/igt@i915_module_load@load.html> (i915#6227 <https://gitlab.freedesktop.org/drm/intel/issues/6227>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-4/igt@i915_module_load@load.html> (i915#6227 <https://gitlab.freedesktop.org/drm/intel/issues/6227>)
> 
>   *
> 
>     igt@i915_module_load@resize-bar:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg2-8/igt@i915_module_load@resize-bar.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-11/igt@i915_module_load@resize-bar.html> (i915#8297 <https://gitlab.freedesktop.org/drm/intel/issues/8297>)
>   *
> 
>     igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-11/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html> (i915#1937 <https://gitlab.freedesktop.org/drm/intel/issues/1937>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-accuracy:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-3/igt@i915_pm_rc6_residency@rc6-accuracy.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-accuracy.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289> / i915#8403 <https://gitlab.freedesktop.org/drm/intel/issues/8403>)
>   *
> 
>     igt@i915_pm_rpm@basic-pci-d3-state:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-tglu-7/igt@i915_pm_rpm@basic-pci-d3-state.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-2/igt@i915_pm_rpm@basic-pci-d3-state.html> (i915#7940 <https://gitlab.freedesktop.org/drm/intel/issues/7940>) +2 similar issues
>   *
> 
>     igt@i915_pm_rpm@dpms-lpsp:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-rkl-7/igt@i915_pm_rpm@dpms-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-4/igt@i915_pm_rpm@dpms-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) +2 similar issues
>   *
> 
>     igt@i915_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg2-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp-stress.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) +1 similar issue
>   *
> 
>     igt@i915_selftest@live@gt_heartbeat:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-apl6/igt@i915_selftest@live@gt_heartbeat.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html> (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>)
>   *
> 
>     igt@i915_selftest@live@requests:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-8/igt@i915_selftest@live@requests.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-3/igt@i915_selftest@live@requests.html> (i915#7269 <https://gitlab.freedesktop.org/drm/intel/issues/7269>)
>   *
> 
>     igt@i915_suspend@basic-s2idle-without-i915:
> 
>       o shard-snb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-snb2/igt@i915_suspend@basic-s2idle-without-i915.html> (i915#8841 <https://gitlab.freedesktop.org/drm/intel/issues/8841>) +2 similar issues
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/intel/issues/4215> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-glk7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html> (i915#2521 <https://gitlab.freedesktop.org/drm/intel/issues/2521>)
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html> (i915#2521 <https://gitlab.freedesktop.org/drm/intel/issues/2521>)
>   *
> 
>     igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-7/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html> (i915#8247 <https://gitlab.freedesktop.org/drm/intel/issues/8247>) +3 similar issues
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-apl4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#1769 <https://gitlab.freedesktop.org/drm/intel/issues/1769>)
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-11/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +1 similar issue
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> / i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1 similar issue
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614> / i915#3638 <https://gitlab.freedesktop.org/drm/intel/issues/3638>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (i915#3743 <https://gitlab.freedesktop.org/drm/intel/issues/3743>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html> (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>) +2 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +4 similar issues
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> (i915#6187 <https://gitlab.freedesktop.org/drm/intel/issues/6187>)
> 
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +2 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (i915#4538 <https://gitlab.freedesktop.org/drm/intel/issues/4538> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +2 similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-2/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html> (i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +3 similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-7/igt@kms_ccs@pipe-a-ccs-on-another-bo-4_tiled_mtl_rc_ccs_cc.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +4 similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +9 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-1/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html> (i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>   *
> 
>     igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-3/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +1 similar issue
>   *
> 
>     igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-6/igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs.html> (i915#3734 <https://gitlab.freedesktop.org/drm/intel/issues/3734> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +1 similar issue
>   *
> 
>     igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> / i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>   *
> 
>     igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_ccs:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-4/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_ccs.html> (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +13 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-3/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +4 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-apl4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +2 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-4/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +4 similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-7/igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +7 similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-4/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +3 similar issues
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-c-dp-2:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-12/igt@kms_cdclk@plane-scaling@pipe-c-dp-2.html> (i915#4087 <https://gitlab.freedesktop.org/drm/intel/issues/4087>) +3 similar issues
>   *
> 
>     igt@kms_chamelium_audio@dp-audio:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-2/igt@kms_chamelium_audio@dp-audio.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +2 similar issues
>   *
> 
>     igt@kms_chamelium_color@ctm-0-50:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-5/igt@kms_chamelium_color@ctm-0-50.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-resolution-list:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-apl7/igt@kms_chamelium_edid@dp-edid-resolution-list.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +34 similar issues
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>)
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>)
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-storm:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-1/igt@kms_chamelium_hpd@dp-hpd-storm.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +1 similar issue
>   *
> 
>     igt@kms_color@deep-color:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-7/igt@kms_color@deep-color.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +1 similar issue
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-2/igt@kms_content_protection@atomic-dpms.html> (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>) +1 similar issue
>   *
> 
>     igt@kms_content_protection@lic@pipe-a-dp-2:
> 
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-12/igt@kms_content_protection@lic@pipe-a-dp-2.html> (i915#7173 <https://gitlab.freedesktop.org/drm/intel/issues/7173>)
>   *
> 
>     igt@kms_content_protection@mei_interface:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-6/igt@kms_content_protection@mei_interface.html> (i915#8063 <https://gitlab.freedesktop.org/drm/intel/issues/8063>)
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-6/igt@kms_content_protection@uevent.html> (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (fdo#109279 <https://bugs.freedesktop.org/show_bug.cgi?id=109279> / i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html> (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x512:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-512x512.html> (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x512.html> (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +2 similar issues
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html> (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +1 similar issue
> 
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html> (fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767> / i915#3546 <https://gitlab.freedesktop.org/drm/intel/issues/3546>)
>   *
> 
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html> (i915#72 <https://gitlab.freedesktop.org/drm/intel/issues/72>)
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-3/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-3/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html> (i915#8248 <https://gitlab.freedesktop.org/drm/intel/issues/8248>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-9/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +2 similar issues
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-12/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +1 similar issue
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +2 similar issues
> 
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html> (fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767> / fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
> 
>       o
> 
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-snb5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767>)
> 
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
> 
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-glk4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +15 similar issues
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html> (i915#3804 <https://gitlab.freedesktop.org/drm/intel/issues/3804>)
>   *
> 
>     igt@kms_dp_aux_dev:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-10/igt@kms_dp_aux_dev.html> (i915#1257 <https://gitlab.freedesktop.org/drm/intel/issues/1257>)
>   *
> 
>     igt@kms_dsc@dsc-with-output-formats:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-2/igt@kms_dsc@dsc-with-output-formats.html> (i915#3840 <https://gitlab.freedesktop.org/drm/intel/issues/3840>)
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-2/igt@kms_fbcon_fbt@psr.html> (i915#3469 <https://gitlab.freedesktop.org/drm/intel/issues/3469>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-6/igt@kms_fbcon_fbt@psr.html> (i915#3955 <https://gitlab.freedesktop.org/drm/intel/issues/3955>)
> 
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-12/igt@kms_flip@2x-nonexisting-fb.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-interruptible:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-3/igt@kms_flip@2x-plain-flip-interruptible.html> (i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend@a-dp1:
> 
>       o shard-apl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html> (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend@b-dp1:
> 
>       o shard-apl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-apl4/igt@kms_flip@flip-vs-suspend@b-dp1.html> (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/intel/issues/8708>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-suspend.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-suspend.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375> / i915#6121 <https://gitlab.freedesktop.org/drm/intel/issues/6121>) +6 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html> (i915#3023 <https://gitlab.freedesktop.org/drm/intel/issues/3023>) +4 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html> (i915#8708 <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +5 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +13 similar issues
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html> (fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825> / i915#1825 <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +7 similar issues
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite.html> (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +6 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html> (fdo#110189 <https://bugs.freedesktop.org/show_bug.cgi?id=110189>) +1 similar issue
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html> (i915#1825 <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +8 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html> (i915#3458 <https://gitlab.freedesktop.org/drm/intel/issues/3458>) +3 similar issues
>   *
> 
>     igt@kms_hdr@bpc-switch:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-6/igt@kms_hdr@bpc-switch.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/intel/issues/8228>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-7/igt@kms_hdr@bpc-switch.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/intel/issues/8228>)
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-2/igt@kms_hdr@bpc-switch.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/intel/issues/8228>)
> 
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-7/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +3 similar issues
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-dp-4:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-dp-4.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +11 similar issues
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +5 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-dp-4:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-dp-4.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +11 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +5 similar issues
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-glk4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@kms_psr2_sf@plane-move-sf-dmg-area:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-apl1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1 similar issue
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-10/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (fdo#109642 <https://bugs.freedesktop.org/show_bug.cgi?id=109642> / fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (i915#4348 <https://gitlab.freedesktop.org/drm/intel/issues/4348>)
> 
>   *
> 
>     igt@kms_psr@primary_mmap_cpu:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-7/igt@kms_psr@primary_mmap_cpu.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3 similar issues
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-4/igt@kms_psr@primary_mmap_cpu.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +2 similar issues
> 
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-12/igt@kms_rotation_crc@sprite-rotation-90.html> (i915#4235 <https://gitlab.freedesktop.org/drm/intel/issues/4235>)
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html> (i915#4235 <https://gitlab.freedesktop.org/drm/intel/issues/4235>)
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-full:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-2/igt@kms_scaling_modes@scaling-mode-full.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +1 similar issue
>   *
> 
>     igt@kms_setmode@basic@pipe-a-vga-1:
> 
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-snb6/igt@kms_setmode@basic@pipe-a-vga-1.html> (i915#5465 <https://gitlab.freedesktop.org/drm/intel/issues/5465>) +1 similar issue
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (i915#8623 <https://gitlab.freedesktop.org/drm/intel/issues/8623>)
>   *
> 
>     igt@kms_vblank@pipe-c-query-forked-busy:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-4/igt@kms_vblank@pipe-c-query-forked-busy.html> (i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> / i915#6768 <https://gitlab.freedesktop.org/drm/intel/issues/6768>)
>   *
> 
>     igt@kms_vblank@pipe-d-wait-idle:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-7/igt@kms_vblank@pipe-d-wait-idle.html> (i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> / i915#533 <https://gitlab.freedesktop.org/drm/intel/issues/533> / i915#6768 <https://gitlab.freedesktop.org/drm/intel/issues/6768>)
>   *
> 
>     igt@perf@non-zero-reason@0-rcs0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg2-3/igt@perf@non-zero-reason@0-rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-3/igt@perf@non-zero-reason@0-rcs0.html> (i915#7484 <https://gitlab.freedesktop.org/drm/intel/issues/7484>)
>   *
> 
>     igt@perf_pmu@busy-double-start@ccs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-6/igt@perf_pmu@busy-double-start@ccs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-4/igt@perf_pmu@busy-double-start@ccs0.html> (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>)
>   *
> 
>     igt@perf_pmu@event-wait@rcs0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-3/igt@perf_pmu@event-wait@rcs0.html> (i915#8807 <https://gitlab.freedesktop.org/drm/intel/issues/8807>)
>   *
> 
>     igt@perf_pmu@frequency@gt0:
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-apl3/igt@perf_pmu@frequency@gt0.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-apl7/igt@perf_pmu@frequency@gt0.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1 similar issue
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-glk4/igt@perf_pmu@frequency@gt0.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-glk2/igt@perf_pmu@frequency@gt0.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
> 
>       o
> 
>         shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-snb5/igt@perf_pmu@frequency@gt0.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-snb1/igt@perf_pmu@frequency@gt0.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
> 
>   *
> 
>     igt@perf_pmu@rc6@other-idle-gt0:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-10/igt@perf_pmu@rc6@other-idle-gt0.html> (i915#8516 <https://gitlab.freedesktop.org/drm/intel/issues/8516>)
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-7/igt@perf_pmu@rc6@other-idle-gt0.html> (i915#8516 <https://gitlab.freedesktop.org/drm/intel/issues/8516>)
> 
>   *
> 
>     igt@sysfs_heartbeat_interval@mixed@ccs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-5/igt@sysfs_heartbeat_interval@mixed@ccs0.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-4/igt@sysfs_heartbeat_interval@mixed@ccs0.html> (i915#8552 <https://gitlab.freedesktop.org/drm/intel/issues/8552>)
>   *
> 
>     igt@sysfs_heartbeat_interval@mixed@vecs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-5/igt@sysfs_heartbeat_interval@mixed@vecs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-4/igt@sysfs_heartbeat_interval@mixed@vecs0.html> (i915#1731 <https://gitlab.freedesktop.org/drm/intel/issues/1731>)
>   *
> 
>     igt@sysfs_heartbeat_interval@precise@vecs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-5/igt@sysfs_heartbeat_interval@precise@vecs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-2/igt@sysfs_heartbeat_interval@precise@vecs0.html> (i915#8332 <https://gitlab.freedesktop.org/drm/intel/issues/8332>)
>   *
> 
>     igt@sysfs_preempt_timeout@timeout@vecs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-6/igt@sysfs_preempt_timeout@timeout@vecs0.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-8/igt@sysfs_preempt_timeout@timeout@vecs0.html> (i915#8521 <https://gitlab.freedesktop.org/drm/intel/issues/8521>)
>   *
> 
>     igt@v3d/v3d_submit_cl@bad-multisync-pad:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-7/igt@v3d/v3d_submit_cl@bad-multisync-pad.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +3 similar issues
>   *
> 
>     igt@v3d/v3d_submit_cl@valid-submission:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-3/igt@v3d/v3d_submit_cl@valid-submission.html> (fdo#109315 <https://bugs.freedesktop.org/show_bug.cgi?id=109315> / i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +1 similar issue
>   *
> 
>     igt@v3d/v3d_submit_csd@bad-multisync-in-sync:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-6/igt@v3d/v3d_submit_csd@bad-multisync-in-sync.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +3 similar issues
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-7/igt@v3d/v3d_submit_csd@bad-multisync-in-sync.html> (fdo#109315 <https://bugs.freedesktop.org/show_bug.cgi?id=109315>) +2 similar issues
> 
>   *
> 
>     igt@vc4/vc4_mmap@mmap-bo:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-8/igt@vc4/vc4_mmap@mmap-bo.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +3 similar issues
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-1/igt@vc4/vc4_mmap@mmap-bo.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +2 similar issues
> 
>   *
> 
>     igt@vc4/vc4_perfmon@destroy-invalid-perfmon:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-3/igt@vc4/vc4_perfmon@destroy-invalid-perfmon.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +1 similar issue
>   *
> 
>     igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-5/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +1 similar issue
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@drm_fdinfo@most-busy-check-all@rcs0:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html> (i915#7742 <https://gitlab.freedesktop.org/drm/intel/issues/7742>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html>
>   *
> 
>     igt@gem_barrier_race@remote-request@rcs0:
> 
>       o
> 
>         shard-glk: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-glk2/igt@gem_barrier_race@remote-request@rcs0.html> (i915#7461 <https://gitlab.freedesktop.org/drm/intel/issues/7461> / i915#8211 <https://gitlab.freedesktop.org/drm/intel/issues/8211>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-glk1/igt@gem_barrier_race@remote-request@rcs0.html>
> 
>       o
> 
>         shard-tglu: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-tglu-9/igt@gem_barrier_race@remote-request@rcs0.html> (i915#8211 <https://gitlab.freedesktop.org/drm/intel/issues/8211> / i915#8234 <https://gitlab.freedesktop.org/drm/intel/issues/8234>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-6/igt@gem_barrier_race@remote-request@rcs0.html>
> 
>   *
> 
>     igt@gem_create@create-ext-cpu-access-big:
> 
>       o shard-dg2: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg2-12/igt@gem_create@create-ext-cpu-access-big.html> (i915#7461 <https://gitlab.freedesktop.org/drm/intel/issues/7461>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html>
>   *
> 
>     igt@gem_ctx_persistence@legacy-engines-hang@bsd1:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-2/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html> (i915#2410 <https://gitlab.freedesktop.org/drm/intel/issues/2410>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-3/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html>
>   *
> 
>     igt@gem_eio@hibernate:
> 
>       o {shard-dg1}: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg1-14/igt@gem_eio@hibernate.html> (i915#4391 <https://gitlab.freedesktop.org/drm/intel/issues/4391> / i915#7975 <https://gitlab.freedesktop.org/drm/intel/issues/7975> / i915#8213 <https://gitlab.freedesktop.org/drm/intel/issues/8213>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg1-18/igt@gem_eio@hibernate.html>
>   *
> 
>     igt@gem_exec_fair@basic-none@bcs0:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html> +2 similar issues
>   *
> 
>     igt@i915_hangman@gt-engine-hang@vcs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-8/igt@i915_hangman@gt-engine-hang@vcs0.html> (i915#7069 <https://gitlab.freedesktop.org/drm/intel/issues/7069>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-4/igt@i915_hangman@gt-engine-hang@vcs0.html> +1 similar issue
>   *
> 
>     igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-rkl-2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html> (i915#1937 <https://gitlab.freedesktop.org/drm/intel/issues/1937>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html>
>   *
> 
>     igt@i915_pm_rpm@cursor-dpms:
> 
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-tglu-9/igt@i915_pm_rpm@cursor-dpms.html> (i915#7940 <https://gitlab.freedesktop.org/drm/intel/issues/7940>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-9/igt@i915_pm_rpm@cursor-dpms.html>
>   *
> 
>     igt@i915_pm_rpm@dpms-lpsp:
> 
>       o {shard-dg1}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg1-14/igt@i915_pm_rpm@dpms-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html>
>   *
> 
>     igt@i915_pm_rpm@modeset-non-lpsp-stress:
> 
>       o
> 
>         shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress.html> +1 similar issue
> 
>       o
> 
>         {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg1-14/igt@i915_pm_rpm@modeset-non-lpsp-stress.html> (i915#7940 <https://gitlab.freedesktop.org/drm/intel/issues/7940>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg1-15/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
> 
>   *
> 
>     igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html> +1 similar issue
>   *
> 
>     igt@i915_selftest@live@slpc:
> 
>       o shard-mtlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-8/igt@i915_selftest@live@slpc.html> (i915#6367 <https://gitlab.freedesktop.org/drm/intel/issues/6367>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-3/igt@i915_selftest@live@slpc.html>
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (i915#3743 <https://gitlab.freedesktop.org/drm/intel/issues/3743>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> +2 similar issues
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (i915#5138 <https://gitlab.freedesktop.org/drm/intel/issues/5138>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>   *
> 
>     igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
> 
>       o shard-snb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-snb6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-snb1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html> +2 similar issues
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html> (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html>
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
> 
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html> (i915#8292 <https://gitlab.freedesktop.org/drm/intel/issues/8292>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-8/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html>
>   *
> 
>     igt@kms_sysfs_edid_timing:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg2-6/igt@kms_sysfs_edid_timing.html> (IGT#2 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-11/igt@kms_sysfs_edid_timing.html>
>   *
> 
>     igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg2-5/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375> / i915#6121 <https://gitlab.freedesktop.org/drm/intel/issues/6121>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-2/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html> +2 similar issues
>   *
> 
>     igt@perf_pmu@frequency@gt0:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg1-19/igt@perf_pmu@frequency@gt0.html> (i915#6806 <https://gitlab.freedesktop.org/drm/intel/issues/6806>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg1-18/igt@perf_pmu@frequency@gt0.html>
>   *
> 
>     igt@perf_pmu@most-busy-idle-check-all@rcs0:
> 
>       o
> 
>         shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg2-6/igt@perf_pmu@most-busy-idle-check-all@rcs0.html> (i915#5234 <https://gitlab.freedesktop.org/drm/intel/issues/5234>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
> 
>       o
> 
>         {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg1-16/igt@perf_pmu@most-busy-idle-check-all@rcs0.html> (i915#5234 <https://gitlab.freedesktop.org/drm/intel/issues/5234>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg1-19/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
> 
>       o
> 
>         shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html> (i915#5234 <https://gitlab.freedesktop.org/drm/intel/issues/5234>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
> 
>   *
> 
>     igt@sysfs_heartbeat_interval@nopreempt@rcs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-8/igt@sysfs_heartbeat_interval@nopreempt@rcs0.html> (i915#6015 <https://gitlab.freedesktop.org/drm/intel/issues/6015>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-3/igt@sysfs_heartbeat_interval@nopreempt@rcs0.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_exec_whisper@basic-contexts-priority-all:
> 
>       o shard-mtlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-5/igt@gem_exec_whisper@basic-contexts-priority-all.html> (i915#7392 <https://gitlab.freedesktop.org/drm/intel/issues/7392>) -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-priority-all.html> (i915#8131 <https://gitlab.freedesktop.org/drm/intel/issues/8131>)
>   *
> 
>     igt@i915_pm_rc6_residency@media-rc6-accuracy:
> 
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289> / i915#8403 <https://gitlab.freedesktop.org/drm/intel/issues/8403>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@vcs0:
> 
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html> (i915#2681 <https://gitlab.freedesktop.org/drm/intel/issues/2681> / i915#3591 <https://gitlab.freedesktop.org/drm/intel/issues/3591>) -> WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html> (i915#2681 <https://gitlab.freedesktop.org/drm/intel/issues/2681>)
>   *
> 
>     igt@kms_content_protection@mei_interface:
> 
>       o
> 
>         shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-rkl-6/igt@kms_content_protection@mei_interface.html> (fdo#109300 <https://bugs.freedesktop.org/show_bug.cgi?id=109300>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-1/igt@kms_content_protection@mei_interface.html> (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
> 
>       o
> 
>         shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-tglu-3/igt@kms_content_protection@mei_interface.html> (fdo#109300 <https://bugs.freedesktop.org/show_bug.cgi?id=109300>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-tglu-2/igt@kms_content_protection@mei_interface.html> (i915#6944 <https://gitlab.freedesktop.org/drm/intel/issues/6944> / i915#7116 <https://gitlab.freedesktop.org/drm/intel/issues/7116> / i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
> 
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-mtlp-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2017 <https://gitlab.freedesktop.org/drm/intel/issues/2017> / i915#5954 <https://gitlab.freedesktop.org/drm/intel/issues/5954>)
>   *
> 
>     igt@kms_fbcon_fbt@psr-suspend:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html> (fdo#110189 <https://bugs.freedesktop.org/show_bug.cgi?id=110189> / i915#3955 <https://gitlab.freedesktop.org/drm/intel/issues/3955>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html> (i915#3955 <https://gitlab.freedesktop.org/drm/intel/issues/3955>)
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-rkl-4/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285> / i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> / i915#4816 <https://gitlab.freedesktop.org/drm/intel/issues/4816>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (i915#4816 <https://gitlab.freedesktop.org/drm/intel/issues/4816>)
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:
> 
>       o shard-snb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-snb4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1.html> (i915#5090 <https://gitlab.freedesktop.org/drm/intel/issues/5090> / i915#8841 <https://gitlab.freedesktop.org/drm/intel/issues/8841>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-snb2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1.html> (i915#8841 <https://gitlab.freedesktop.org/drm/intel/issues/8841>)
>   *
> 
>     igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
> 
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13371/shard-dg2-3/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html> (i915#5493 <https://gitlab.freedesktop.org/drm/intel/issues/5493>) -> CRASH <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/shard-dg2-11/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html> (i915#7331 <https://gitlab.freedesktop.org/drm/intel/issues/7331>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7380 -> IGTPW_9384
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_13371: de8998eaee8a3a6a3682e025ec17409b8cba78f8 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_9384: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9384/index.html
> IGT_7380: 8e65f12de2fd52c05dc48fdbcb8cfe86f6de1a75 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
