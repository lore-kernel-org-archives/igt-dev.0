Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3437610E3F7
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 05:53:57 +0000 (UTC)
Message-ID: <1e15ec27-79f3-606b-9e0e-744441fddd44@intel.com>
Date: Thu, 17 Aug 2023 07:53:32 +0200
To: <igt-dev@lists.freedesktop.org>
References: <cover.1692189091.git.karolina.stolarek@intel.com>
 <169221200197.10287.17779763729141590236@emeril.freedesktop.org>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <169221200197.10287.17779763729141590236@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVXBkYXRl?=
 =?utf-8?q?_documentation_of_Xe_blitter_tests?=
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

On 16.08.2023 20:53, Patchwork wrote:
> *Patch Details*
> *Series:*	Update documentation of Xe blitter tests
> *URL:*	https://patchwork.freedesktop.org/series/122520/ 
> <https://patchwork.freedesktop.org/series/122520/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7438_full -> IGTPW_9599_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_9599_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_9599_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/index.html
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
> IGTPW_9599_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions

Not related to the series, the patches only update documentation and 
introduce no functional changes.

Many thanks,
Karolina

> 
>   *
> 
>     igt@core_setmaster@master-drop-set-user:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@core_setmaster@master-drop-set-user.html>
>   *
> 
>     igt@i915_suspend@basic-s2idle-without-i915:
> 
>       o shard-dg2: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@i915_suspend@basic-s2idle-without-i915.html>
>   *
> 
>     igt@i915_suspend@basic-s3-without-i915:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-12/igt@i915_suspend@basic-s3-without-i915.html> -> WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html>
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@kms_async_flips@alternate-sync-async-flip.html> +1 similar issue
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_9599_full that come from known issues:
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
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@api_intel_bb@blit-reloc-keep-cache.html> ([i915#8411])
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@api_intel_bb@blit-reloc-keep-cache.html> ([i915#8411])
> 
>   *
> 
>     igt@drm_fdinfo@busy-hang@bcs0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-14/igt@drm_fdinfo@busy-hang@bcs0.html> ([i915#8414]) +4 similar issues
>   *
> 
>     igt@drm_fdinfo@busy-hang@rcs0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-5/igt@drm_fdinfo@busy-hang@rcs0.html> ([i915#8414]) +6 similar issues
>   *
> 
>     igt@drm_fdinfo@busy-idle@bcs0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@drm_fdinfo@busy-idle@bcs0.html> ([i915#8414]) +9 similar issues
>   *
> 
>     igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html> ([i915#7742])
>   *
> 
>     igt@fbdev@nullptr:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@fbdev@nullptr.html> ([i915#2582])
>   *
> 
>     igt@fbdev@pan:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@fbdev@pan.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@fbdev@pan.html> ([i915#2582]) +1 similar issue
>   *
> 
>     igt@feature_discovery@display-2x:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-1/igt@feature_discovery@display-2x.html> ([i915#1839])
>   *
> 
>     igt@gem_bad_reloc@negative-reloc-lut:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-15/igt@gem_bad_reloc@negative-reloc-lut.html> ([i915#3281])
>   *
> 
>     igt@gem_ccs@suspend-resume:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-4/igt@gem_ccs@suspend-resume.html> ([i915#5325])
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-4/igt@gem_ccs@suspend-resume.html> ([i915#5325])
> 
>   *
> 
>     igt@gem_close_race@multigpu-basic-process:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-2/igt@gem_close_race@multigpu-basic-process.html> ([i915#7697])
>   *
> 
>     igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-8/igt@gem_create@create-ext-cpu-access-sanity-check.html> ([i915#6335])
>   *
> 
>     igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>       o shard-snb: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-snb4/igt@gem_ctx_isolation@preservation-s3@rcs0.html> ([i915#8841]) +4 similar issues
>   *
> 
>     igt@gem_ctx_persistence@hang:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-6/igt@gem_ctx_persistence@hang.html> ([i915#8555]) +1 similar issue
>   *
> 
>     igt@gem_ctx_persistence@hostile:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-snb6/igt@gem_ctx_persistence@hostile.html> ([fdo#109271] / [i915#1099]) +1 similar issue
>   *
> 
>     igt@gem_ctx_persistence@saturated-hostile-nopreempt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html> ([i915#2575]) +173 similar issues
>   *
> 
>     igt@gem_ctx_sseu@engines:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-16/igt@gem_ctx_sseu@engines.html> ([i915#280])
>   *
> 
>     igt@gem_ctx_sseu@mmap-args:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-3/igt@gem_ctx_sseu@mmap-args.html> ([i915#280]) +1 similar issue
>   *
> 
>     igt@gem_eio@in-flight-1us:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-8/igt@gem_eio@in-flight-1us.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-5/igt@gem_eio@in-flight-1us.html> ([i915#8503])
>   *
> 
>     igt@gem_exec_balancer@bonded-false-hang:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@gem_exec_balancer@bonded-false-hang.html> ([i915#4812]) +1 similar issue
>   *
> 
>     igt@gem_exec_balancer@bonded-pair:
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-8/igt@gem_exec_balancer@bonded-pair.html> ([i915#4771])
> 
>       o
> 
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-16/igt@gem_exec_balancer@bonded-pair.html> ([i915#4771])
> 
>   *
> 
>     igt@gem_exec_balancer@parallel:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-4/igt@gem_exec_balancer@parallel.html> ([i915#4525])
>   *
> 
>     igt@gem_exec_capture@capture-invisible@lmem0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-1/igt@gem_exec_capture@capture-invisible@lmem0.html> ([i915#6334]) +1 similar issue
>   *
> 
>     igt@gem_exec_capture@pi@bcs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-3/igt@gem_exec_capture@pi@bcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-7/igt@gem_exec_capture@pi@bcs0.html> ([i915#4475] / [i915#7765])
>   *
> 
>     igt@gem_exec_capture@pi@rcs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-3/igt@gem_exec_capture@pi@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-7/igt@gem_exec_capture@pi@rcs0.html> ([i915#4475])
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html> ([i915#2846])
>   *
> 
>     igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-1/igt@gem_exec_fair@basic-none-rrul@rcs0.html> ([i915#2842])
>   *
> 
>     igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html> ([i915#2842])
>   *
> 
>     igt@gem_exec_fair@basic-none@bcs0:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-2/igt@gem_exec_fair@basic-none@bcs0.html> ([i915#2842]) +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html> ([i915#2842])
> 
>       o
> 
>         shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-tglu-9/igt@gem_exec_fair@basic-pace-share@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-10/igt@gem_exec_fair@basic-pace-share@rcs0.html> ([i915#2842])
> 
>   *
> 
>     igt@gem_exec_fair@basic-sync:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-2/igt@gem_exec_fair@basic-sync.html> ([i915#4473] / [i915#4771]) +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-throttle:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@gem_exec_fair@basic-throttle.html> ([i915#3539])
>   *
> 
>     igt@gem_exec_flush@basic-uc-ro-default:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-2/igt@gem_exec_flush@basic-uc-ro-default.html> ([i915#3539] / [i915#4852]) +2 similar issues
>   *
> 
>     igt@gem_exec_gttfill@multigpu-basic:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@gem_exec_gttfill@multigpu-basic.html> ([i915#7697])
>   *
> 
>     igt@gem_exec_params@no-bsd:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-2/igt@gem_exec_params@no-bsd.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_exec_params@no-bsd.html> ([fdo#109283] / [i915#2575])
>   *
> 
>     igt@gem_exec_params@secure-non-root:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-4/igt@gem_exec_params@secure-non-root.html> ([fdo#112283])
>   *
> 
>     igt@gem_exec_reloc@basic-cpu-read:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@gem_exec_reloc@basic-cpu-read.html> ([i915#3281]) +1 similar issue
>   *
> 
>     igt@gem_exec_reloc@basic-cpu-wc-active:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-8/igt@gem_exec_reloc@basic-cpu-wc-active.html> ([i915#3281]) +7 similar issues
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-wc-active:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-active.html> ([i915#3281]) +2 similar issues
>   *
> 
>     igt@gem_exec_schedule@preempt-queue-contexts-chain:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@gem_exec_schedule@preempt-queue-contexts-chain.html> ([i915#4537] / [i915#4812])
>   *
> 
>     igt@gem_exec_schedule@semaphore-power:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-4/igt@gem_exec_schedule@semaphore-power.html> ([i915#4812]) +1 similar issue
>   *
> 
>     igt@gem_fenced_exec_thrash@too-many-fences:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-19/igt@gem_fenced_exec_thrash@too-many-fences.html> ([i915#4860])
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-7/igt@gem_huc_copy@huc-copy.html> ([i915#2190])
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-random:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-2/igt@gem_lmem_swapping@heavy-verify-random.html> ([i915#4613]) +2 similar issues
>   *
> 
>     igt@gem_lmem_swapping@verify-ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_lmem_swapping@verify-ccs.html> ([i915#5775]) +4 similar issues
>   *
> 
>     igt@gem_media_vme:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-2/igt@gem_media_vme.html> ([i915#284])
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-7/igt@gem_media_vme.html> ([i915#284])
> 
>   *
> 
>     igt@gem_mmap_gtt@ptrace:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-17/igt@gem_mmap_gtt@ptrace.html> ([i915#4077]) +2 similar issues
>   *
> 
>     igt@gem_mmap_wc@read:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-6/igt@gem_mmap_wc@read.html> ([i915#4083]) +2 similar issues
>   *
> 
>     igt@gem_mmap_wc@write-prefaulted:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-1/igt@gem_mmap_wc@write-prefaulted.html> ([i915#4083]) +1 similar issue
>   *
> 
>     igt@gem_pread@uncached:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-15/igt@gem_pread@uncached.html> ([i915#3282])
>   *
> 
>     igt@gem_pwrite@basic-random:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-2/igt@gem_pwrite@basic-random.html> ([i915#3282]) +2 similar issues
>   *
> 
>     igt@gem_pxp@create-regular-context-2:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-2/igt@gem_pxp@create-regular-context-2.html> ([i915#4270])
>   *
> 
>     igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-1/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html> ([i915#4270]) +1 similar issue
> 
>       o
> 
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-15/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html> ([i915#4270])
> 
>   *
> 
>     igt@gem_pxp@verify-pxp-stale-ctx-execution:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-ctx-execution.html> ([i915#4270])
>   *
> 
>     igt@gem_render_copy@linear-to-vebox-yf-tiled:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_render_copy@linear-to-vebox-yf-tiled.html> ([i915#2575] / [i915#5190])
>   *
> 
>     igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-7/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html> ([i915#8428]) +2 similar issues
>   *
> 
>     igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html> ([i915#3282]) +1 similar issue
>   *
> 
>     igt@gem_tiled_pread_basic:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-1/igt@gem_tiled_pread_basic.html> ([i915#4079])
>   *
> 
>     igt@gem_userptr_blits@forbidden-operations:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-1/igt@gem_userptr_blits@forbidden-operations.html> ([i915#3282]) +2 similar issues
>   *
> 
>     igt@gem_userptr_blits@sync-unmap:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@gem_userptr_blits@sync-unmap.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_userptr_blits@sync-unmap.html> ([i915#2575]) +196 similar issues
>   *
> 
>     igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-4/igt@gem_userptr_blits@unsync-unmap-after-close.html> ([i915#3297])
>   *
> 
>     igt@gen3_render_tiledy_blits:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-5/igt@gen3_render_tiledy_blits.html> ([fdo#109289]) +3 similar issues
>   *
> 
>     igt@gen7_exec_parse@basic-offset:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-2/igt@gen7_exec_parse@basic-offset.html> ([fdo#109289]) +1 similar issue
>   *
> 
>     igt@gen7_exec_parse@basic-rejected:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-14/igt@gen7_exec_parse@basic-rejected.html> ([fdo#109289])
>   *
> 
>     igt@gen9_exec_parse@batch-without-end:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-4/igt@gen9_exec_parse@batch-without-end.html> ([i915#2856])
>   *
> 
>     igt@gen9_exec_parse@bb-chained:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@gen9_exec_parse@bb-chained.html> ([i915#2527])
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-6/igt@gen9_exec_parse@bb-chained.html> ([i915#2527] / [i915#2856])
> 
>   *
> 
>     igt@i915_fb_tiling:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@i915_fb_tiling.html> ([i915#4881])
>   *
> 
>     igt@i915_hangman@gt-engine-error@vcs0:
> 
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-3/igt@i915_hangman@gt-engine-error@vcs0.html> ([i915#7069])
>   *
> 
>     igt@i915_hangman@gt-engine-hang@vcs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-7/igt@i915_hangman@gt-engine-hang@vcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-2/igt@i915_hangman@gt-engine-hang@vcs0.html> ([i915#7069])
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-mtlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html> ([i915#8489] / [i915#8668])
>   *
> 
>     igt@i915_module_load@resize-bar:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-2/igt@i915_module_load@resize-bar.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@i915_module_load@resize-bar.html> ([i915#5775])
>   *
> 
>     igt@i915_pm_backlight@basic-brightness:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-15/igt@i915_pm_backlight@basic-brightness.html> ([i915#7561])
>   *
> 
>     igt@i915_pm_dc@dc6-dpms:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-7/igt@i915_pm_dc@dc6-dpms.html> ([i915#3989] / [i915#454])
>   *
> 
>     igt@i915_pm_freq_mult@media-freq@gt0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-16/igt@i915_pm_freq_mult@media-freq@gt0.html> ([i915#6590])
>   *
> 
>     igt@i915_pm_freq_mult@media-freq@gt1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-2/igt@i915_pm_freq_mult@media-freq@gt1.html> ([i915#6590]) +1 similar issue
>   *
> 
>     igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg1-19/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-15/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html> ([i915#1937])
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-accuracy:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-5/igt@i915_pm_rc6_residency@rc6-accuracy.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-5/igt@i915_pm_rc6_residency@rc6-accuracy.html> ([i915#8403])
>   *
> 
>     igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o
> 
>         shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg1-18/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html> ([i915#1397]) +2 similar issues
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html> ([fdo#111644] / [i915#1397])
> 
>   *
> 
>     igt@i915_pm_rpm@gem-evict-pwrite:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@i915_pm_rpm@gem-evict-pwrite.html> ([i915#4077]) +3 similar issues
>   *
> 
>     igt@i915_pm_rpm@sysfs-read:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@i915_pm_rpm@sysfs-read.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@i915_pm_rpm@sysfs-read.html> ([i915#5174]) +5 similar issues
>   *
> 
>     igt@i915_pm_rpm@system-suspend:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@i915_pm_rpm@system-suspend.html> ([i915#5174])
>   *
> 
>     igt@i915_pm_rps@basic-api:
> 
>       o
> 
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-14/igt@i915_pm_rps@basic-api.html> ([i915#6621])
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-2/igt@i915_pm_rps@basic-api.html> ([i915#6621])
> 
>   *
> 
>     igt@i915_pm_rps@reset:
> 
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-6/igt@i915_pm_rps@reset.html> ([i915#8346])
>   *
> 
>     igt@i915_pm_rps@thresholds-park@gt0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@i915_pm_rps@thresholds-park@gt0.html> ([i915#8925]) +2 similar issues
>   *
> 
>     igt@i915_pm_sseu@full-enable:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-2/igt@i915_pm_sseu@full-enable.html> ([i915#8437])
>   *
> 
>     igt@i915_query@query-topology-known-pci-ids:
> 
>       o
> 
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-17/igt@i915_query@query-topology-known-pci-ids.html> ([fdo#109303])
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-6/igt@i915_query@query-topology-known-pci-ids.html> ([fdo#109303])
> 
>   *
> 
>     igt@i915_selftest@live@requests:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-8/igt@i915_selftest@live@requests.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-7/igt@i915_selftest@live@requests.html> ([i915#8497])
>   *
> 
>     igt@i915_selftest@live@slpc:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-8/igt@i915_selftest@live@slpc.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-7/igt@i915_selftest@live@slpc.html> ([i915#6367])
>   *
> 
>     igt@i915_selftest@live@workarounds:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-8/igt@i915_selftest@live@workarounds.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-7/igt@i915_selftest@live@workarounds.html> ([i915#6763])
>   *
> 
>     igt@i915_suspend@fence-restore-tiled2untiled:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-5/igt@i915_suspend@fence-restore-tiled2untiled.html> ([i915#4077]) +11 similar issues
>   *
> 
>     igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html> ([i915#2575] / [i915#5190])
>   *
> 
>     igt@kms_addfb_basic@bo-too-small-due-to-tiling:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-1/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html> ([i915#4212]) +1 similar issue
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-2:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-2.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-2.html> ([i915#2521])
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs.html> ([i915#8502] / [i915#8709]) +11 similar issues
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs.html> ([i915#8502]) +3 similar issues
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs.html> ([i915#8502]) +7 similar issues
>   *
> 
>     igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-2/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html> ([i915#8247]) +1 similar issue
>   *
> 
>     igt@kms_async_flips@test-cursor:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-8/igt@kms_async_flips@test-cursor.html> ([i915#6229])
>   *
> 
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html> ([i915#404])
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html> ([i915#404])
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-19/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html> ([i915#4538] / [i915#5286])
>   *
> 
>     igt@kms_big_fb@4-tiled-addfb-size-overflow:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb-size-overflow.html> ([i915#5286])
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-overflow.html> ([i915#5286])
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> ([i915#5138]) +1 similar issue
>   *
> 
>     igt@kms_big_fb@x-tiled-64bpp-rotate-180:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html> ([fdo#109315]) +21 similar issues
>   *
> 
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html> ([fdo#111614]) +3 similar issues
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-90:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-15/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html> ([i915#3638])
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> ([fdo#109315] / [i915#5190]) +3 similar issues
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> ([i915#5190]) +4 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html> ([fdo#110723]) +3 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html> ([fdo#111615]) +1 similar issue
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-8/igt@kms_big_fb@yf-tiled-addfb.html> ([i915#6187])
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html> ([i915#4538] / [i915#5190]) +4 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
> 
>       o
> 
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html> ([i915#4538]) +1 similar issue
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html> ([fdo#111615]) +9 similar issues
> 
>   *
> 
>     igt@kms_big_joiner@2x-modeset:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-1/igt@kms_big_joiner@2x-modeset.html> ([i915#2705])
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-8/igt@kms_big_joiner@2x-modeset.html> ([i915#2705])
> 
>   *
> 
>     igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-8/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html> ([i915#3886] / [i915#6095]) +7 similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-4/igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs.html> ([i915#3734] / [i915#5354] / [i915#6095]) +1 similar issue
>   *
> 
>     igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_mtl_rc_ccs_cc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_mtl_rc_ccs_cc.html> ([i915#5354] / [i915#6095]) +4 similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-1/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html> ([i915#3689] / [i915#3886] / [i915#5354]) +2 similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html> ([i915#3886] / [i915#5354] / [i915#6095])
>   *
> 
>     igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-15/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs.html> ([i915#3689] / [i915#5354] / [i915#6095]) +5 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs.html> ([i915#6095]) +29 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-2/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html> ([i915#3886] / [i915#5354] / [i915#6095])
>   *
> 
>     igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs.html> ([i915#3689] / [i915#5354]) +5 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-16/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html> ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
>   *
> 
>     igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_mtl_rc_ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_mtl_rc_ccs.html> ([i915#5354]) +19 similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-2/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html> ([i915#5354]) +14 similar issues
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-2/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html> ([i915#3689] / [i915#5354] / [i915#6095]) +3 similar issues
> 
>   *
> 
>     igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_mtl_mc_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-10/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_mtl_mc_ccs.html> ([i915#5354] / [i915#6095]) +5 similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-14/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html> ([i915#5354] / [i915#6095]) +4 similar issues
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html> ([i915#4087] / [i915#7213]) +2 similar issues
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html> ([i915#7213])
>   *
> 
>     igt@kms_chamelium_audio@hdmi-audio:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-8/igt@kms_chamelium_audio@hdmi-audio.html> ([i915#7828])
>   *
> 
>     igt@kms_chamelium_color@ctm-green-to-red:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-8/igt@kms_chamelium_color@ctm-green-to-red.html> ([fdo#111827])
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html> ([i915#7828]) +1 similar issue
>   *
> 
>     igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-17/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html> ([i915#7828]) +2 similar issues
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html> ([i915#7828]) +1 similar issue
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-5/igt@kms_chamelium_hpd@vga-hpd.html> ([i915#7828]) +4 similar issues
>   *
> 
>     igt@kms_color@deep-color:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@kms_color@deep-color.html> ([i915#3555])
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-3/igt@kms_color@deep-color.html> ([i915#3555])
> 
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1.html> ([i915#3116])
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-1/igt@kms_content_protection@uevent.html> ([i915#6944])
> 
>       o
> 
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-18/igt@kms_content_protection@uevent.html> ([i915#7116])
> 
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-32x10:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html> ([i915#8814]) +4 similar issues
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html> ([i915#3359])
> 
>       o
> 
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-512x170.html> ([i915#3359])
> 
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-16/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html> ([i915#3555]) +1 similar issue
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html> ([i915#3359])
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html> ([i915#3359])
> 
>   *
> 
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html> ([i915#3546])
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>       o
> 
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-19/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html> ([fdo#111767] / [fdo#111825])
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html> ([fdo#111767] / [i915#3546])
> 
>   *
> 
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html> ([fdo#109274] / [i915#5354]) +1 similar issue
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html> ([fdo#111825]) +1 similar issue
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> ([i915#4103])
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> ([i915#4103])
> 
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> 
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html> ([i915#8248])
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html> ([i915#2346])
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> ([i915#2346])
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-8bpc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html> ([i915#3555]) +3 similar issues
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-4/igt@kms_dsc@dsc-basic.html> ([i915#3555] / [i915#3840])
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-4/igt@kms_dsc@dsc-basic.html> ([i915#3555] / [i915#3840])
> 
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-8/igt@kms_dsc@dsc-with-bpc-formats.html> ([i915#3840])
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html> ([fdo#111767] / [i915#3637])
>   *
> 
>     igt@kms_flip@2x-flip-vs-panning-interruptible:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-2/igt@kms_flip@2x-flip-vs-panning-interruptible.html> ([fdo#109274]) +2 similar issues
>   *
> 
>     igt@kms_flip@2x-flip-vs-rmfb:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-4/igt@kms_flip@2x-flip-vs-rmfb.html> ([i915#3637]) +2 similar issues
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-snb4/igt@kms_flip@2x-nonexisting-fb.html> ([fdo#109271]) +200 similar issues
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-apl4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html> ([fdo#109271]) +20 similar issues
>   *
> 
>     igt@kms_flip@flip-vs-fences:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-4/igt@kms_flip@flip-vs-fences.html> ([i915#8381]) +1 similar issue
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html> ([fdo#109315]) +24 similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html> ([i915#2672]) +2 similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html> ([i915#2587] / [i915#2672])
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html> ([i915#2672])
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html> ([i915#2587] / [i915#2672])
> 
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html> ([i915#8810]) +1 similar issue
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html> ([i915#2672]) +3 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html> ([i915#8708]) +7 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html> ([i915#1825]) +21 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-badstride:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-badstride.html> ([i915#6880])
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-glk7/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-glk5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html> ([i915#9115])
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html> ([i915#8708]) +7 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html> ([fdo#111825] / [i915#1825]) +16 similar issues
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html> ([fdo#109280]) +8 similar issues
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html> ([i915#3458]) +6 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html> ([i915#8708])
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html> ([i915#3023]) +7 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html> ([fdo#111825]) +5 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html> ([i915#3458]) +6 similar issues
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-6/igt@kms_hdr@static-swap.html> ([i915#8228])
>   *
> 
>     igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-10/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html> ([fdo#109289])
>   *
> 
>     igt@kms_plane@pixel-format@pipe-b-planes:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-1/igt@kms_plane@pixel-format@pipe-b-planes.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-1/igt@kms_plane@pixel-format@pipe-b-planes.html> ([i915#1623])
>   *
> 
>     igt@kms_plane_lowres@tiling-4@pipe-c-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-4/igt@kms_plane_lowres@tiling-4@pipe-c-edp-1.html> ([i915#3582]) +3 similar issues
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-7/igt@kms_plane_scaling@intel-max-src-size.html> ([i915#6953])
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html> ([i915#8292])
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-2:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-2.html> ([i915#5176]) +3 similar issues
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-1.html> ([i915#5176]) +7 similar issues
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1.html> ([i915#5176]) +11 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-dp-2:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-dp-2.html> ([i915#5235]) +15 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html> ([i915#5235]) +5 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-15/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html> ([i915#5235]) +7 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1.html> ([i915#5235]) +7 similar issues
>   *
> 
>     igt@kms_prime@basic-modeset-hybrid:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-1/igt@kms_prime@basic-modeset-hybrid.html> ([i915#6524] / [i915#6805])
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-4/igt@kms_prime@basic-modeset-hybrid.html> ([i915#6524])
> 
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html> ([i915#658]) +1 similar issue
>   *
> 
>     igt@kms_psr@psr2_basic:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-9/igt@kms_psr@psr2_basic.html> ([fdo#110189]) +6 similar issues
>   *
> 
>     igt@kms_psr@psr2_cursor_plane_move:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@kms_psr@psr2_cursor_plane_move.html> ([i915#1072])
>   *
> 
>     igt@kms_psr@psr2_primary_blt:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-16/igt@kms_psr@psr2_primary_blt.html> ([i915#1072]) +2 similar issues
>   *
> 
>     igt@kms_psr@psr2_sprite_plane_move:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-4/igt@kms_psr@psr2_sprite_plane_move.html> ([i915#1072]) +1 similar issue
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-8/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d.html> ([i915#5030]) +3 similar issues
>   *
> 
>     igt@kms_selftest@drm_cmdline:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@kms_selftest@drm_cmdline.html> ([i915#8661])
> 
>       o
> 
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-snb1/igt@kms_selftest@drm_cmdline.html> ([fdo#109271] / [i915#8661])
> 
>   *
> 
>     igt@kms_sysfs_edid_timing:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@kms_sysfs_edid_timing.html> ([IGT#2])
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-2/igt@kms_tiled_display@basic-test-pattern.html> ([i915#8623])
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> ([i915#8623])
>   *
> 
>     igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-tglu-2/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-5/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html> ([i915#5122])
>   *
> 
>     igt@kms_vblank@pipe-d-query-forked-hang:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@kms_vblank@pipe-d-query-forked-hang.html> ([i915#4070] / [i915#533] / [i915#6768]) +1 similar issue
>   *
> 
>     igt@kms_writeback@writeback-invalid-parameters:
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-2/igt@kms_writeback@writeback-invalid-parameters.html> ([i915#2437])
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-2/igt@kms_writeback@writeback-invalid-parameters.html> ([i915#2437])
> 
>   *
> 
>     igt@perf@global-sseu-config-invalid:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-8/igt@perf@global-sseu-config-invalid.html> ([i915#7387])
>   *
> 
>     igt@perf@stress-open-close:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@perf@stress-open-close.html> ([i915#5608]) +15 similar issues
>   *
> 
>     igt@perf@whitelisted-registers-userspace-config:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@perf@whitelisted-registers-userspace-config.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@perf@whitelisted-registers-userspace-config.html> ([i915#5608]) +3 similar issues
>   *
> 
>     igt@perf_pmu@rc6-all-gts:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html> ([i915#8516])
>   *
> 
>     igt@perf_pmu@rc6@runtime-pm-long-gt1:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-1/igt@perf_pmu@rc6@runtime-pm-long-gt1.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-6/igt@perf_pmu@rc6@runtime-pm-long-gt1.html> ([i915#8537]) +2 similar issues
>   *
> 
>     igt@perf_pmu@render-node-busy-idle@ccs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-5/igt@perf_pmu@render-node-busy-idle@ccs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-4/igt@perf_pmu@render-node-busy-idle@ccs0.html> ([i915#4349]) +3 similar issues
>   *
> 
>     igt@perf_pmu@render-node-busy-idle@vcs1:
> 
>       o
> 
>         shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@perf_pmu@render-node-busy-idle@vcs1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@perf_pmu@render-node-busy-idle@vcs1.html> ([i915#4349]) +7 similar issues
> 
>       o
> 
>         shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg1-16/igt@perf_pmu@render-node-busy-idle@vcs1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-15/igt@perf_pmu@render-node-busy-idle@vcs1.html> ([i915#4349]) +2 similar issues
> 
>   *
> 
>     igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
> 
>       o shard-dg2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html> ([i915#5493])
>   *
> 
>     igt@prime_vgem@basic-write:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@prime_vgem@basic-write.html> ([i915#3291] / [i915#3708])
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@prime_vgem@basic-write.html> ([fdo#109295] / [i915#3291] / [i915#3708])
> 
>   *
> 
>     igt@prime_vgem@fence-read-hang:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-1/igt@prime_vgem@fence-read-hang.html> ([i915#3708]) +1 similar issue
>   *
> 
>     igt@sysfs_heartbeat_interval@precise@vecs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-8/igt@sysfs_heartbeat_interval@precise@vecs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-8/igt@sysfs_heartbeat_interval@precise@vecs0.html> ([i915#8332])
>   *
> 
>     igt@sysfs_preempt_timeout@timeout@vecs0:
> 
>       o shard-mtlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-3/igt@sysfs_preempt_timeout@timeout@vecs0.html> ([i915#8521] / [i915#8865])
>   *
> 
>     igt@tools_test@tools_test:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@tools_test@tools_test.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@tools_test@tools_test.html> ([i915#9030])
>   *
> 
>     igt@v3d/v3d_create_bo@create-bo-zeroed:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-16/igt@v3d/v3d_create_bo@create-bo-zeroed.html> ([i915#2575]) +2 similar issues
>   *
> 
>     igt@v3d/v3d_mmap@mmap-bad-flags:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-7/igt@v3d/v3d_mmap@mmap-bad-flags.html> ([fdo#109315] / [i915#2575]) +1 similar issue
>   *
> 
>     igt@v3d/v3d_submit_csd@bad-flag:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-4/igt@v3d/v3d_submit_csd@bad-flag.html> ([fdo#109315]) +4 similar issues
>   *
> 
>     igt@v3d/v3d_wait_bo@map-bo-0ns:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-3/igt@v3d/v3d_wait_bo@map-bo-0ns.html> ([i915#2575]) +9 similar issues
>   *
> 
>     igt@vc4/vc4_mmap@mmap-bad-handle:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-1/igt@vc4/vc4_mmap@mmap-bad-handle.html> ([i915#7711]) +2 similar issues
>   *
> 
>     igt@vc4/vc4_perfmon@create-perfmon-0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-15/igt@vc4/vc4_perfmon@create-perfmon-0.html> ([i915#7711]) +2 similar issues
>   *
> 
>     igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-2/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html> ([i915#7711]) +7 similar issues
>   *
> 
>     igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-4/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html> ([i915#2575])
>   *
> 
>     igt@vc4/vc4_tiling@get-bad-modifier:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-1/igt@vc4/vc4_tiling@get-bad-modifier.html> ([i915#7711]) +4 similar issues
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_setmaster@master-drop-set-root:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@core_setmaster@master-drop-set-root.html> ([i915#6121]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@core_setmaster@master-drop-set-root.html>
>   *
> 
>     igt@fbdev@read:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@fbdev@read.html> ([i915#2582]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@fbdev@read.html>
>   *
> 
>     igt@gem_ctx_exec@basic-nohangcheck:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html> ([i915#6268]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html>
>   *
> 
>     igt@gem_ctx_persistence@saturated-hostile@vecs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-6/igt@gem_ctx_persistence@saturated-hostile@vecs0.html> ([i915#7816]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-1/igt@gem_ctx_persistence@saturated-hostile@vecs0.html> +2 similar issues
>   *
> 
>     igt@gem_eio@in-flight-contexts-10ms:
> 
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-8/igt@gem_eio@in-flight-contexts-10ms.html> ([i915#7941]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-2/igt@gem_eio@in-flight-contexts-10ms.html>
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg1-15/igt@gem_eio@unwedge-stress.html> ([i915#5784]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-18/igt@gem_eio@unwedge-stress.html> +1 similar issue
>   *
> 
>     igt@gem_exec_endless@dispatch@rcs0:
> 
>       o shard-rkl: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-rkl-2/igt@gem_exec_endless@dispatch@rcs0.html> ([i915#3778]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-7/igt@gem_exec_endless@dispatch@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace@rcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-glk6/igt@gem_exec_fair@basic-pace@rcs0.html> ([i915#2842]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html> +1 similar issue
>   *
> 
>     igt@gem_exec_fence@parallel@vcs0:
> 
>       o shard-mtlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-4/igt@gem_exec_fence@parallel@vcs0.html> ([i915#9121]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-1/igt@gem_exec_fence@parallel@vcs0.html>
>   *
> 
>     igt@gem_exec_fence@parallel@vecs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-4/igt@gem_exec_fence@parallel@vecs0.html> ([i915#8957]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-1/igt@gem_exec_fence@parallel@vecs0.html> +2 similar issues
>   *
> 
>     igt@gem_exec_schedule@preempt-engines@ccs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@ccs0.html> ([i915#9119]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-2/igt@gem_exec_schedule@preempt-engines@ccs0.html> +4 similar issues
>   *
> 
>     igt@gem_softpin@invalid:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_softpin@invalid.html> ([i915#2575]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@gem_softpin@invalid.html> +197 similar issues
>   *
> 
>     igt@gem_spin_batch@user-each:
> 
>       o shard-mtlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-4/igt@gem_spin_batch@user-each.html> ([i915#8962] / [i915#9121]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-2/igt@gem_spin_batch@user-each.html> +3 similar issues
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-tglu-5/igt@i915_pm_dc@dc9-dpms.html> ([i915#4281]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-9/igt@i915_pm_dc@dc9-dpms.html>
>   *
> 
>     igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html> ([i915#1397]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html>
>   *
> 
>     igt@i915_pm_rpm@dpms-non-lpsp:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html> ([i915#1397]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-rkl-1/igt@i915_pm_rpm@dpms-non-lpsp.html> +2 similar issues
>   *
> 
>     igt@i915_pm_rpm@system-suspend-modeset:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@i915_pm_rpm@system-suspend-modeset.html> ([i915#5174]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@i915_pm_rpm@system-suspend-modeset.html> +2 similar issues
>   *
> 
>     igt@i915_selftest@perf@region:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@i915_selftest@perf@region.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@i915_selftest@perf@region.html> +3 similar issues
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-legacy:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html> ([i915#2575] / [i915#5190]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html>
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> ([i915#3743]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>   *
> 
>     igt@kms_cursor_legacy@single-move@all-pipes:
> 
>       o shard-mtlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html> ([i915#2017]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-5/igt@kms_cursor_legacy@single-move@all-pipes.html>
>   *
> 
>     igt@kms_flip@flip-vs-panning-vs-hang@c-dp1:
> 
>       o shard-apl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-apl3/igt@kms_flip@flip-vs-panning-vs-hang@c-dp1.html> ([fdo#109271]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-apl3/igt@kms_flip@flip-vs-panning-vs-hang@c-dp1.html> +1 similar issue
>   *
> 
>     igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1:
> 
>       o shard-glk: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-glk1/igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1.html> ([fdo#109271]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-glk2/igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1.html> +3 similar issues
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a4:
> 
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg1-14/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a4.html> ([fdo#103375]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg1-14/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a4.html> +3 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html> ([fdo#109315]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html> +27 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html> ([i915#6880]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html>
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
> 
>       o shard-apl: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html> ([i915#180]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html>
>   *
> 
>     igt@perf@blocking-parameterized:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@perf@blocking-parameterized.html> ([i915#5608]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@perf@blocking-parameterized.html> +5 similar issues
>   *
> 
>     igt@sysfs_heartbeat_interval@nopreempt@vcs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-mtlp-1/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html> ([i915#6015]) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html> +2 similar issues
> 
> 
>         Warnings
> 
>   *
> 
>     igt@api_intel_bb@render-ccs:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@api_intel_bb@render-ccs.html> ([i915#2575]) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@api_intel_bb@render-ccs.html> ([i915#6122])
>   *
> 
>     igt@device_reset@cold-reset-bound:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@device_reset@cold-reset-bound.html> ([i915#6121]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@device_reset@cold-reset-bound.html> ([i915#7701])
>   *
> 
>     igt@device_reset@unbind-reset-rebind:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html> ([i915#9027]) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html> ([i915#6121] / [i915#9027])
>   *
> 
>     igt@drm_fdinfo@virtual-busy:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@drm_fdinfo@virtual-busy.html> ([i915#5608]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@drm_fdinfo@virtual-busy.html> ([i915#8414])
>   *
> 
>     igt@feature_discovery@display-4x:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@feature_discovery@display-4x.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@feature_discovery@display-4x.html> ([i915#1839])
>   *
> 
>     igt@gem_create@create-ext-cpu-access-big:
> 
>       o shard-dg2: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html> ([i915#7461]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html> ([i915#2575])
>   *
> 
>     igt@gem_ctx_persistence@heartbeat-close:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-close.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-close.html> ([i915#8555]) +1 similar issue
>   *
> 
>     igt@gem_ctx_persistence@heartbeat-stop:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-stop.html> ([i915#8555]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html> ([i915#2575])
>   *
> 
>     igt@gem_eio@hibernate:
> 
>       o shard-dg2: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@gem_eio@hibernate.html> ([i915#7975] / [i915#8213]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_eio@hibernate.html> ([i915#2575])
>   *
> 
>     igt@gem_exec_balancer@bonded-dual:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_exec_balancer@bonded-dual.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@gem_exec_balancer@bonded-dual.html> ([i915#4771])
>   *
> 
>     igt@gem_exec_balancer@bonded-semaphore:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@gem_exec_balancer@bonded-semaphore.html> ([i915#4812]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_exec_balancer@bonded-semaphore.html> ([i915#2575])
>   *
> 
>     igt@gem_exec_balancer@sliced:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_exec_balancer@sliced.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@gem_exec_balancer@sliced.html> ([i915#4812])
>   *
> 
>     igt@gem_exec_fair@basic-pace:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_exec_fair@basic-pace.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@gem_exec_fair@basic-pace.html> ([i915#3539])
>   *
> 
>     igt@gem_exec_fair@basic-pace@vcs1:
> 
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-tglu-2/igt@gem_exec_fair@basic-pace@vcs1.html> ([i915#2842]) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-tglu-4/igt@gem_exec_fair@basic-pace@vcs1.html> ([i915#2876])
>   *
> 
>     igt@gem_exec_flush@basic-uc-pro-default:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@gem_exec_flush@basic-uc-pro-default.html> ([i915#3539] / [i915#4852]) +3 similar issues
>   *
> 
>     igt@gem_exec_flush@basic-uc-set-default:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@gem_exec_flush@basic-uc-set-default.html> ([i915#3539]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html> ([i915#2575])
>   *
> 
>     igt@gem_exec_flush@basic-wb-pro-default:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@gem_exec_flush@basic-wb-pro-default.html> ([i915#3539] / [i915#4852]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_exec_flush@basic-wb-pro-default.html> ([i915#2575]) +2 similar issues
>   *
> 
>     igt@gem_exec_gttfill@multigpu-basic:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_exec_gttfill@multigpu-basic.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@gem_exec_gttfill@multigpu-basic.html> ([i915#7697])
>   *
> 
>     igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html> ([i915#3281]) +6 similar issues
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-read:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-12/igt@gem_exec_reloc@basic-gtt-read.html> ([i915#3281]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html> ([i915#2575]) +9 similar issues
>   *
> 
>     igt@gem_exec_schedule@preempt-queue-contexts:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-contexts.html> ([i915#4537] / [i915#4812]) +1 similar issue
>   *
> 
>     igt@gem_fence_thrash@bo-write-verify-x:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-x.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-x.html> ([i915#4860]) +4 similar issues
>   *
> 
>     igt@gem_fence_thrash@bo-write-verify-y:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@gem_fence_thrash@bo-write-verify-y.html> ([i915#4860]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html> ([i915#2575]) +1 similar issue
>   *
> 
>     igt@gem_media_fill@media-fill:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_media_fill@media-fill.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-1/igt@gem_media_fill@media-fill.html> ([i915#8289])
>   *
> 
>     igt@gem_mmap@basic-small-bo:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_mmap@basic-small-bo.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@gem_mmap@basic-small-bo.html> ([i915#4083]) +3 similar issues
>   *
> 
>     igt@gem_mmap_gtt@cpuset-medium-copy-xy:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html> ([i915#4077]) +11 similar issues
>   *
> 
>     igt@gem_mmap_gtt@fault-concurrent-y:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@gem_mmap_gtt@fault-concurrent-y.html> ([i915#4077]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_mmap_gtt@fault-concurrent-y.html> ([i915#2575]) +6 similar issues
>   *
> 
>     igt@gem_mmap_wc@bad-object:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-2/igt@gem_mmap_wc@bad-object.html> ([i915#4083]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_mmap_wc@bad-object.html> ([i915#2575]) +4 similar issues
>   *
> 
>     igt@gem_partial_pwrite_pread@reads:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@gem_partial_pwrite_pread@reads.html> ([i915#3282]) +5 similar issues
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html> ([i915#3282]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html> ([i915#2575]) +3 similar issues
>   *
> 
>     igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_pxp@protected-raw-src-copy-not-readible.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-10/igt@gem_pxp@protected-raw-src-copy-not-readible.html> ([i915#4270]) +3 similar issues
>   *
> 
>     igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html> ([i915#4270]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html> ([i915#2575]) +4 similar issues
>   *
> 
>     igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html> ([i915#5190]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html> ([i915#2575] / [i915#5190]) +11 similar issues
>   *
> 
>     igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html> ([i915#4079])
>   *
> 
>     igt@gem_set_tiling_vs_blt@untiled-to-tiled:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html> ([i915#4079]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html> ([i915#2575])
>   *
> 
>     igt@gem_userptr_blits@access-control:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-2/igt@gem_userptr_blits@access-control.html> ([i915#3297]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_userptr_blits@access-control.html> ([i915#2575])
>   *
> 
>     igt@gem_userptr_blits@create-destroy-unsync:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_userptr_blits@create-destroy-unsync.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-1/igt@gem_userptr_blits@create-destroy-unsync.html> ([i915#3297]) +3 similar issues
>   *
> 
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html> ([i915#3297] / [i915#4880]) +1 similar issue
>   *
> 
>     igt@gem_userptr_blits@sd-probe:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@gem_userptr_blits@sd-probe.html> ([i915#3297] / [i915#4958]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gem_userptr_blits@sd-probe.html> ([i915#2575])
>   *
> 
>     igt@gen3_render_linear_blits:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@gen3_render_linear_blits.html> ([fdo#109289]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gen3_render_linear_blits.html> ([i915#2575]) +3 similar issues
>   *
> 
>     igt@gen7_exec_parse@basic-rejected:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gen7_exec_parse@basic-rejected.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-2/igt@gen7_exec_parse@basic-rejected.html> ([fdo#109289]) +5 similar issues
>   *
> 
>     igt@gen9_exec_parse@bb-secure:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@gen9_exec_parse@bb-secure.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@gen9_exec_parse@bb-secure.html> ([i915#2856]) +3 similar issues
>   *
> 
>     igt@gen9_exec_parse@shadow-peek:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-10/igt@gen9_exec_parse@shadow-peek.html> ([i915#2856]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@gen9_exec_parse@shadow-peek.html> ([i915#2575]) +3 similar issues
>   *
> 
>     igt@i915_pm_backlight@basic-brightness:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@i915_pm_backlight@basic-brightness.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@i915_pm_backlight@basic-brightness.html> ([i915#5354] / [i915#7561]) +2 similar issues
>   *
> 
>     igt@i915_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@i915_pm_dc@dc3co-vpb-simulation.html> ([i915#658]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@i915_pm_dc@dc3co-vpb-simulation.html> ([i915#2575])
>   *
> 
>     igt@i915_pm_dc@dc6-dpms:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-12/igt@i915_pm_dc@dc6-dpms.html> ([i915#5978]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@i915_pm_dc@dc6-dpms.html> ([i915#2575])
>   *
> 
>     igt@i915_pm_rpm@dpms-lpsp:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@i915_pm_rpm@dpms-lpsp.html> ([i915#1397]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@i915_pm_rpm@dpms-lpsp.html> ([i915#5174])
>   *
> 
>     igt@i915_pm_rpm@fences-dpms:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@i915_pm_rpm@fences-dpms.html> ([i915#5174]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-2/igt@i915_pm_rpm@fences-dpms.html> ([i915#4077]) +1 similar issue
>   *
> 
>     igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html> ([fdo#109506]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html> ([i915#5174])
>   *
> 
>     igt@i915_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@i915_pm_rpm@modeset-non-lpsp-stress.html> ([i915#5174]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp-stress.html> ([i915#1397])
>   *
> 
>     igt@i915_pm_rps@basic-api:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@i915_pm_rps@basic-api.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-2/igt@i915_pm_rps@basic-api.html> ([i915#6621])
>   *
> 
>     igt@i915_pm_rps@min-max-config-idle:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-12/igt@i915_pm_rps@min-max-config-idle.html> ([i915#6621]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html> ([i915#2575])
>   *
> 
>     igt@i915_query@query-topology-unsupported:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-1/igt@i915_query@query-topology-unsupported.html> ([fdo#109302]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@i915_query@query-topology-unsupported.html> ([i915#2575])
>   *
> 
>     igt@i915_suspend@basic-s3-without-i915:
> 
>       o shard-snb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-snb5/igt@i915_suspend@basic-s3-without-i915.html> ([i915#8841]) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-snb2/igt@i915_suspend@basic-s3-without-i915.html> ([i915#4528])
>   *
> 
>     igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-12/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html> ([i915#4212]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html> ([i915#2575])
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> ([i915#2575] / [i915#5190]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-12/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> ([i915#5190]) +8 similar issues
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html> ([i915#2575] / [i915#5190]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-1/igt@kms_addfb_basic@basic-y-tiled-legacy.html> ([i915#4215] / [i915#5190])
>   *
> 
>     igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html> ([i915#2575]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-1/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html> ([i915#4212]) +1 similar issue
>   *
> 
>     igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-11/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html> ([fdo#109315]) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9599/shard-dg2-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html> ([fdo#111614]) +2 similar issues
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7438/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html> ([fdo#111614]) -> SKIP <https://intel-gfx-ci.01> ([fdo#109315]) +3 similar issues
> 
