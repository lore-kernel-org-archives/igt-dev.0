Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B229E10E506
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Dec 2023 12:15:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------CYRTUQ6UQ4229cDiNrQhBxIt"
Message-ID: <99e4d751-6806-4fe7-b04d-06e55c2141b6@linux.intel.com>
Date: Tue, 5 Dec 2023 13:15:30 +0100
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20231130180103.8449-1-nirmoy.das@intel.com>
 <170146425153.19689.10557738258242482688@emeril.freedesktop.org>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <170146425153.19689.10557738258242482688@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdC94?=
 =?utf-8?q?e=5Fspin=5Fbatch=3A_Add_spin-fixed-duration-with-preempter_=28r?=
 =?utf-8?q?ev3=29?=
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
--------------CYRTUQ6UQ4229cDiNrQhBxIt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/1/2023 9:57 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	test/xe_spin_batch: Add spin-fixed-duration-with-preempter 
> (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/126583/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/index.html
>
>
>   CI Bug Log - changes from CI_DRM_13955_full -> IGTPW_10311_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_10311_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_10311_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/index.html
>
>
>     Participating hosts (11 -> 12)
>
> Additional (1): shard-tglu0
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_10311_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a1:
>
>       o shard-rkl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a1.html>
>  *
>
>     igt@sysfs_heartbeat_interval@nopreempt@vcs0:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-mtlp-5/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-4/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html>
>
Unrelated failures. Merged this test.


Regards,

Nirmoy

>  *
>
>
>     Known issues
>
> Here are the changes found in IGTPW_10311_full that come from known 
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
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-8/igt@api_intel_bb@blit-reloc-keep-cache.html>
>         (i915#8411 <https://gitlab.freedesktop.org/drm/intel/issues/8411>)
>  *
>
>     igt@drm_fdinfo@most-busy-check-all@rcs0:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html>
>         (i915#7742 <https://gitlab.freedesktop.org/drm/intel/issues/7742>)
>  *
>
>     igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html>
>         (i915#8414
>         <https://gitlab.freedesktop.org/drm/intel/issues/8414>) +31
>         other tests skip
>  *
>
>     igt@drm_fdinfo@virtual-busy-all:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-12/igt@drm_fdinfo@virtual-busy-all.html>
>         (i915#8414 <https://gitlab.freedesktop.org/drm/intel/issues/8414>)
>  *
>
>     igt@gem_bad_reloc@negative-reloc-lut:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@gem_bad_reloc@negative-reloc-lut.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +6
>         other tests skip
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-16/igt@gem_bad_reloc@negative-reloc-lut.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +2
>         other tests skip
>
>  *
>
>     igt@gem_basic@multigpu-create-close:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-4/igt@gem_basic@multigpu-create-close.html>
>         (i915#7697 <https://gitlab.freedesktop.org/drm/intel/issues/7697>)
>  *
>
>     igt@gem_ccs@block-multicopy-compressed:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html>
>         (i915#9323 <https://gitlab.freedesktop.org/drm/intel/issues/9323>)
>  *
>
>     igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html>
>         (i915#7297 <https://gitlab.freedesktop.org/drm/intel/issues/7297>)
>  *
>
>     igt@gem_create@create-ext-cpu-access-sanity-check:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>         (i915#6335 <https://gitlab.freedesktop.org/drm/intel/issues/6335>)
>  *
>
>     igt@gem_create@create-ext-set-pat:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@gem_create@create-ext-set-pat.html>
>         (i915#8562 <https://gitlab.freedesktop.org/drm/intel/issues/8562>)
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@gem_create@create-ext-set-pat.html>
>         (i915#8562 <https://gitlab.freedesktop.org/drm/intel/issues/8562>)
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-15/igt@gem_create@create-ext-set-pat.html>
>         (i915#8562 <https://gitlab.freedesktop.org/drm/intel/issues/8562>)
>
>  *
>
>     igt@gem_ctx_exec@basic-nohangcheck:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html>
>         (i915#6268 <https://gitlab.freedesktop.org/drm/intel/issues/6268>)
>  *
>
>     igt@gem_ctx_persistence@heartbeat-close:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-close.html>
>         (i915#8555 <https://gitlab.freedesktop.org/drm/intel/issues/8555>)
>  *
>
>     igt@gem_ctx_persistence@heartbeat-hostile:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-hostile.html>
>         (i915#8555
>         <https://gitlab.freedesktop.org/drm/intel/issues/8555>) +2
>         other tests skip
>  *
>
>     igt@gem_ctx_sseu@engines:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-2/igt@gem_ctx_sseu@engines.html>
>         (i915#280 <https://gitlab.freedesktop.org/drm/intel/issues/280>)
>  *
>
>     igt@gem_eio@hibernate:
>
>       o shard-rkl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@gem_eio@hibernate.html>
>         (i915#7975
>         <https://gitlab.freedesktop.org/drm/intel/issues/7975> /
>         i915#8213 <https://gitlab.freedesktop.org/drm/intel/issues/8213>)
>  *
>
>     igt@gem_exec_balancer@bonded-dual:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-15/igt@gem_exec_balancer@bonded-dual.html>
>         (i915#4771 <https://gitlab.freedesktop.org/drm/intel/issues/4771>)
>  *
>
>     igt@gem_exec_balancer@bonded-pair:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@gem_exec_balancer@bonded-pair.html>
>         (i915#4771 <https://gitlab.freedesktop.org/drm/intel/issues/4771>)
>  *
>
>     igt@gem_exec_balancer@noheartbeat:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-6/igt@gem_exec_balancer@noheartbeat.html>
>         (i915#8555
>         <https://gitlab.freedesktop.org/drm/intel/issues/8555>) +1
>         other test skip
>  *
>
>     igt@gem_exec_balancer@parallel-bb-first:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html>
>         (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>  *
>
>     igt@gem_exec_capture@many-4k-incremental:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk8/igt@gem_exec_capture@many-4k-incremental.html>
>         (i915#9606 <https://gitlab.freedesktop.org/drm/intel/issues/9606>)
>  *
>
>     igt@gem_exec_fair@basic-deadline:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-18/igt@gem_exec_fair@basic-deadline.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/intel/issues/3539> /
>         i915#4852
>         <https://gitlab.freedesktop.org/drm/intel/issues/4852>) +1
>         other test skip
>  *
>
>     igt@gem_exec_fair@basic-none-share@rcs0:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-tglu-6/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-4/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +1
>         other test fail
>  *
>
>     igt@gem_exec_fair@basic-none-vip@rcs0:
>
>      o
>
>         shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>
>      o
>
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk7/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>
>  *
>
>     igt@gem_exec_fair@basic-none@rcs0:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@gem_exec_fair@basic-none@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@gem_exec_fair@basic-none@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +1
>         other test fail
>  *
>
>     igt@gem_exec_fair@basic-pace-share:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@gem_exec_fair@basic-pace-share.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/intel/issues/3539> /
>         i915#4852
>         <https://gitlab.freedesktop.org/drm/intel/issues/4852>) +3
>         other tests skip
>  *
>
>     igt@gem_exec_fair@basic-pace-solo:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@gem_exec_fair@basic-pace-solo.html>
>         (i915#3539 <https://gitlab.freedesktop.org/drm/intel/issues/3539>)
>  *
>
>     igt@gem_exec_fence@submit67:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@gem_exec_fence@submit67.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/intel/issues/4812>) +1
>         other test skip
>  *
>
>     igt@gem_exec_params@secure-non-master:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-7/igt@gem_exec_params@secure-non-master.html>
>         (fdo#112283
>         <https://bugs.freedesktop.org/show_bug.cgi?id=112283>) +1
>         other test skip
>  *
>
>     igt@gem_exec_reloc@basic-range-active:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@gem_exec_reloc@basic-range-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +4
>         other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-wc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-2/igt@gem_exec_reloc@basic-wc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +4
>         other tests skip
>  *
>
>     igt@gem_exec_schedule@preempt-queue:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@gem_exec_schedule@preempt-queue.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/intel/issues/4537> /
>         i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>)
>  *
>
>     igt@gem_exec_schedule@preempt-queue-contexts:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-13/igt@gem_exec_schedule@preempt-queue-contexts.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/intel/issues/4812>) +1
>         other test skip
>  *
>
>     igt@gem_fenced_exec_thrash@no-spare-fences-busy:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html>
>         (i915#4860 <https://gitlab.freedesktop.org/drm/intel/issues/4860>)
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-random-ccs:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-random-ccs.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>  *
>
>     igt@gem_lmem_swapping@smem-oom@lmem0:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>         (i915#5493 <https://gitlab.freedesktop.org/drm/intel/issues/5493>)
>  *
>
>     igt@gem_lmem_swapping@verify:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@gem_lmem_swapping@verify.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +2
>         other tests skip
>  *
>
>     igt@gem_media_fill@media-fill:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-7/igt@gem_media_fill@media-fill.html>
>         (i915#8289 <https://gitlab.freedesktop.org/drm/intel/issues/8289>)
>  *
>
>     igt@gem_mmap_gtt@bad-object:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-8/igt@gem_mmap_gtt@bad-object.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +4
>         other tests skip
>  *
>
>     igt@gem_mmap_gtt@basic-wc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-17/igt@gem_mmap_gtt@basic-wc.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2
>         other tests skip
>  *
>
>     igt@gem_mmap_gtt@medium-copy-xy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@gem_mmap_gtt@medium-copy-xy.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +11
>         other tests skip
>  *
>
>     igt@gem_mmap_wc@bad-object:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-3/igt@gem_mmap_wc@bad-object.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/intel/issues/4083>) +1
>         other test skip
>  *
>
>     igt@gem_mmap_wc@close:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-7/igt@gem_mmap_wc@close.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/intel/issues/4083>) +7
>         other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-19/igt@gem_partial_pwrite_pread@writes-after-reads.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +3
>         other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +2
>         other tests skip
>  *
>
>     igt@gem_pread@display:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@gem_pread@display.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +3
>         other tests skip
>  *
>
>     igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +2
>         other tests skip
>  *
>
>     igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html>
>         (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>  *
>
>     igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +1
>         other test skip
>  *
>
>     igt@gem_readwrite@read-write:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-7/igt@gem_readwrite@read-write.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +3
>         other tests skip
>  *
>
>     igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-2/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html>
>         (i915#8428
>         <https://gitlab.freedesktop.org/drm/intel/issues/8428>) +2
>         other tests skip
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html>
>         (i915#8411 <https://gitlab.freedesktop.org/drm/intel/issues/8411>)
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-18/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html>
>         (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>)
>
>  *
>
>     igt@gem_set_tiling_vs_gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-6/igt@gem_set_tiling_vs_gtt.html>
>         (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>)
>  *
>
>     igt@gem_softpin@evict-snoop-interruptible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@gem_softpin@evict-snoop-interruptible.html>
>         (i915#4885 <https://gitlab.freedesktop.org/drm/intel/issues/4885>)
>  *
>
>     igt@gem_spin_batch@spin-all-new:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html>
>         (i915#5889 <https://gitlab.freedesktop.org/drm/intel/issues/5889>)
>  *
>
>     igt@gem_userptr_blits@dmabuf-sync:
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3323 <https://gitlab.freedesktop.org/drm/intel/issues/3323>)
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@gem_userptr_blits@dmabuf-sync.html>
>         (i915#3323 <https://gitlab.freedesktop.org/drm/intel/issues/3323>)
>
>  *
>
>     igt@gem_userptr_blits@dmabuf-unsync:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@gem_userptr_blits@dmabuf-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/intel/issues/3297>) +1
>         other test skip
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-19/igt@gem_userptr_blits@dmabuf-unsync.html>
>         (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>
>  *
>
>     igt@gem_userptr_blits@map-fixed-invalidate-busy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/intel/issues/3297> /
>         i915#4880 <https://gitlab.freedesktop.org/drm/intel/issues/4880>)
>  *
>
>     igt@gem_userptr_blits@sd-probe:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@gem_userptr_blits@sd-probe.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/intel/issues/3297> /
>         i915#4958 <https://gitlab.freedesktop.org/drm/intel/issues/4958>)
>  *
>
>     igt@gen3_render_linear_blits:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@gen3_render_linear_blits.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +1
>         other test skip
>  *
>
>     igt@gen7_exec_parse@basic-allocation:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-6/igt@gen7_exec_parse@basic-allocation.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +4
>         other tests skip
>  *
>
>     igt@gen7_exec_parse@basic-rejected:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@gen7_exec_parse@basic-rejected.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +6
>         other tests skip
>  *
>
>     igt@gen9_exec_parse@allowed-all:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk4/igt@gen9_exec_parse@allowed-all.html>
>         (i915#5566 <https://gitlab.freedesktop.org/drm/intel/issues/5566>)
>  *
>
>     igt@gen9_exec_parse@batch-without-end:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-2/igt@gen9_exec_parse@batch-without-end.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +1
>         other test skip
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-18/igt@gen9_exec_parse@batch-without-end.html>
>         (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>)
>
>  *
>
>     igt@gen9_exec_parse@bb-oversize:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@gen9_exec_parse@bb-oversize.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/intel/issues/2527>) +3
>         other tests skip
>  *
>
>     igt@gen9_exec_parse@bb-start-out:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-8/igt@gen9_exec_parse@bb-start-out.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +1
>         other test skip
>  *
>
>     igt@i915_pipe_stress@stress-xrgb8888-ytiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html>
>         (i915#7091 <https://gitlab.freedesktop.org/drm/intel/issues/7091>)
>  *
>
>     igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html>
>         (fdo#109293
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109293> /
>         fdo#109506 <https://bugs.freedesktop.org/show_bug.cgi?id=109506>)
>  *
>
>     igt@i915_pm_rps@thresholds-idle@gt0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-19/igt@i915_pm_rps@thresholds-idle@gt0.html>
>         (i915#8925 <https://gitlab.freedesktop.org/drm/intel/issues/8925>)
>  *
>
>     igt@i915_pm_rps@thresholds-park@gt0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@i915_pm_rps@thresholds-park@gt0.html>
>         (i915#8925 <https://gitlab.freedesktop.org/drm/intel/issues/8925>)
>  *
>
>     igt@i915_query@query-topology-coherent-slice-mask:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@i915_query@query-topology-coherent-slice-mask.html>
>         (i915#6188 <https://gitlab.freedesktop.org/drm/intel/issues/6188>)
>  *
>
>     igt@i915_selftest@mock@memory_region:
>
>       o shard-dg2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@i915_selftest@mock@memory_region.html>
>         (i915#9311 <https://gitlab.freedesktop.org/drm/intel/issues/9311>)
>  *
>
>     igt@kms_addfb_basic@clobberred-modifier:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html>
>         (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>)
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-vga-1-linear:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-snb4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-vga-1-linear.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +8
>         other tests skip
>  *
>
>     igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html>
>         (i915#8247
>         <https://gitlab.freedesktop.org/drm/intel/issues/8247>) +3
>         other tests fail
>  *
>
>     igt@kms_async_flips@crc@pipe-b-hdmi-a-3:
>
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-12/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html>
>         (i915#8247
>         <https://gitlab.freedesktop.org/drm/intel/issues/8247>) +3
>         other tests fail
>  *
>
>     igt@kms_async_flips@test-cursor:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-2/igt@kms_async_flips@test-cursor.html>
>         (i915#6229 <https://gitlab.freedesktop.org/drm/intel/issues/6229>)
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +2
>         other tests skip
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-16/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/intel/issues/4538> /
>         i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1
>         other test skip
>
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (i915#5138
>         <https://gitlab.freedesktop.org/drm/intel/issues/5138>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-270:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-15/igt@kms_big_fb@linear-64bpp-rotate-270.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/intel/issues/3638>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-tglu-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         (i915#3743 <https://gitlab.freedesktop.org/drm/intel/issues/3743>)
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +16
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-13/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html>
>         (i915#4538 <https://gitlab.freedesktop.org/drm/intel/issues/4538>)
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html>
>         (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>)
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (i915#6187
>         <https://gitlab.freedesktop.org/drm/intel/issues/6187>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/intel/issues/4538> /
>         i915#5190
>         <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +6
>         other tests skip
>  *
>
>     igt@kms_big_joiner@invalid-modeset:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-5/igt@kms_big_joiner@invalid-modeset.html>
>         (i915#2705 <https://gitlab.freedesktop.org/drm/intel/issues/2705>)
>  *
>
>     igt@kms_chamelium_color@ctm-0-25:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@kms_chamelium_color@ctm-0-25.html>
>         (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>  *
>
>     igt@kms_chamelium_color@ctm-0-75:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_chamelium_color@ctm-0-75.html>
>         (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>  *
>
>     igt@kms_chamelium_color@ctm-blue-to-red:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-8/igt@kms_chamelium_color@ctm-blue-to-red.html>
>         (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-5/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +8
>         other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-multiple:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk8/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +46
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-9/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html>
>         (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>)
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +6
>         other tests skip
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-16/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +4
>         other tests skip
>
>  *
>
>     igt@kms_color@gamma@pipe-a:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-3/igt@kms_color@gamma@pipe-a.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_color@gamma@pipe-a.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +5
>         other tests skip
>  *
>
>     igt@kms_content_protection@atomic@pipe-a-dp-4:
>
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html>
>         (i915#7173 <https://gitlab.freedesktop.org/drm/intel/issues/7173>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (i915#3299 <https://gitlab.freedesktop.org/drm/intel/issues/3299>)
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-2/igt@kms_content_protection@legacy.html>
>         (i915#6944 <https://gitlab.freedesktop.org/drm/intel/issues/6944>)
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@kms_content_protection@srm.html>
>         (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>  *
>
>     igt@kms_content_protection@type1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_content_protection@type1.html>
>         (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>  *
>
>     igt@kms_content_protection@uevent@pipe-a-dp-4:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_content_protection@uevent@pipe-a-dp-4.html>
>         (i915#1339 <https://gitlab.freedesktop.org/drm/intel/issues/1339>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-128x42:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +27
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-32x32:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#8814
>         <https://gitlab.freedesktop.org/drm/intel/issues/8814>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (fdo#109279
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109279> /
>         i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-max-size:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +15
>         other tests skip
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-12/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +2
>         other tests skip
>
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x10:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +6
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +7
>         other tests skip
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         (i915#3546
>         <https://gitlab.freedesktop.org/drm/intel/issues/3546>) +1
>         other test skip
>
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/intel/issues/4103> /
>         i915#4213
>         <https://gitlab.freedesktop.org/drm/intel/issues/4213> /
>         i915#5608
>         <https://gitlab.freedesktop.org/drm/intel/issues/5608>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +6
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>  *
>
>     igt@kms_display_modes@mst-extended-mode-negative:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@kms_display_modes@mst-extended-mode-negative.html>
>         (i915#8588 <https://gitlab.freedesktop.org/drm/intel/issues/8588>)
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-19/igt@kms_display_modes@mst-extended-mode-negative.html>
>         (i915#8588 <https://gitlab.freedesktop.org/drm/intel/issues/8588>)
>
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html>
>         (i915#3804 <https://gitlab.freedesktop.org/drm/intel/issues/3804>)
>  *
>
>     igt@kms_draw_crc@draw-method-mmap-wc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html>
>         (i915#8812 <https://gitlab.freedesktop.org/drm/intel/issues/8812>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#3840
>         <https://gitlab.freedesktop.org/drm/intel/issues/3840> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-3/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#3840
>         <https://gitlab.freedesktop.org/drm/intel/issues/3840> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>
>  *
>
>     igt@kms_flip@2x-blocking-wf_vblank:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-3/igt@kms_flip@2x-blocking-wf_vblank.html>
>         (i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>  *
>
>     igt@kms_flip@2x-flip-vs-fences-interruptible:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>         (i915#8381
>         <https://gitlab.freedesktop.org/drm/intel/issues/8381>) +1
>         other test skip
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>         (i915#8381
>         <https://gitlab.freedesktop.org/drm/intel/issues/8381>) +1
>         other test skip
>
>  *
>
>     igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-snb5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767>)
>  *
>
>     igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +7
>         other tests skip
>  *
>
>     igt@kms_flip@basic-flip-vs-dpms:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_flip@basic-flip-vs-dpms.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/intel/issues/3637> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +10
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +2
>         other tests skip
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>         i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +2
>         other tests skip
>
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +3
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +15
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html>
>         (i915#6880 <https://gitlab.freedesktop.org/drm/intel/issues/6880>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +34
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +22
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +14
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         (i915#5460 <https://gitlab.freedesktop.org/drm/intel/issues/5460>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/intel/issues/3458>) +21
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/intel/issues/3458>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>         i915#1825
>         <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +17
>         other tests skip
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +12
>         other tests skip
>
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-rte:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-rte.html>
>         (i915#3023
>         <https://gitlab.freedesktop.org/drm/intel/issues/3023>) +13
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +11
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html>
>         (fdo#110189 <https://bugs.freedesktop.org/show_bug.cgi?id=110189>)
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#8228
>         <https://gitlab.freedesktop.org/drm/intel/issues/8228>) +2
>         other tests skip
>  *
>
>     igt@kms_invalid_mode@bad-htotal:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_invalid_mode@bad-htotal.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +3
>         other tests skip
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (i915#4816 <https://gitlab.freedesktop.org/drm/intel/issues/4816>)
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (i915#4816 <https://gitlab.freedesktop.org/drm/intel/issues/4816>)
>
>  *
>
>     igt@kms_panel_fitting@atomic-fastset:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@kms_panel_fitting@atomic-fastset.html>
>         (i915#6301 <https://gitlab.freedesktop.org/drm/intel/issues/6301>)
>  *
>
>     igt@kms_pipe_crc_basic@bad-source:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-4/igt@kms_pipe_crc_basic@bad-source.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_pipe_crc_basic@bad-source.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +20
>         other tests skip
>  *
>
>     igt@kms_plane@plane-position-hole-dpms:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_plane@plane-position-hole-dpms.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         i915#8825
>         <https://gitlab.freedesktop.org/drm/intel/issues/8825>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk3/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html>
>         (i915#4573
>         <https://gitlab.freedesktop.org/drm/intel/issues/4573>) +1
>         other test fail
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html>
>         (i915#8292 <https://gitlab.freedesktop.org/drm/intel/issues/8292>)
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html>
>         (i915#8292 <https://gitlab.freedesktop.org/drm/intel/issues/8292>)
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176> /
>         i915#9423
>         <https://gitlab.freedesktop.org/drm/intel/issues/9423>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +7
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +5
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html>
>         (i915#8152
>         <https://gitlab.freedesktop.org/drm/intel/issues/8152>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html>
>         (i915#6953
>         <https://gitlab.freedesktop.org/drm/intel/issues/6953> /
>         i915#8152 <https://gitlab.freedesktop.org/drm/intel/issues/8152>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         i915#6953
>         <https://gitlab.freedesktop.org/drm/intel/issues/6953> /
>         i915#8152 <https://gitlab.freedesktop.org/drm/intel/issues/8152>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +6
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-edp-1.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +19
>         other tests skip
>  *
>
>     igt@kms_prime@basic-crc-hybrid:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-6/igt@kms_prime@basic-crc-hybrid.html>
>         (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524>)
>  *
>
>     igt@kms_properties@crtc-properties-atomic:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-7/igt@kms_properties@crtc-properties-atomic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_properties@crtc-properties-atomic.html>
>         (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>)
>  *
>
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#9683 <https://gitlab.freedesktop.org/drm/intel/issues/9683>)
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-16/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#9683 <https://gitlab.freedesktop.org/drm/intel/issues/9683>)
>
>  *
>
>     igt@kms_psr2_sf@plane-move-sf-dmg-area:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_psr2_sf@plane-move-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>         i915#9683 <https://gitlab.freedesktop.org/drm/intel/issues/9683>)
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (fdo#109642
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>         fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>         i915#9683 <https://gitlab.freedesktop.org/drm/intel/issues/9683>)
>  *
>
>     igt@kms_psr2_su@page_flip-xrgb8888:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/intel/issues/9683>) +3
>         other tests skip
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-12/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>         i915#9683
>         <https://gitlab.freedesktop.org/drm/intel/issues/9683>) +1
>         other test skip
>
>  *
>
>     igt@kms_psr@psr2_primary_mmap_cpu:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-6/igt@kms_psr@psr2_primary_mmap_cpu.html>
>         (i915#9673 <https://gitlab.freedesktop.org/drm/intel/issues/9673>)
>  *
>
>     igt@kms_psr@psr2_sprite_plane_move:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-2/igt@kms_psr@psr2_sprite_plane_move.html>
>         (i915#9673
>         <https://gitlab.freedesktop.org/drm/intel/issues/9673> /
>         i915#9732
>         <https://gitlab.freedesktop.org/drm/intel/issues/9732>) +5
>         other tests skip
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (i915#9685 <https://gitlab.freedesktop.org/drm/intel/issues/9685>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (i915#4235
>         <https://gitlab.freedesktop.org/drm/intel/issues/4235>) +1
>         other test skip
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (i915#4235 <https://gitlab.freedesktop.org/drm/intel/issues/4235>)
>
>  *
>
>     igt@kms_setmode@basic-clone-single-crtc:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#8809 <https://gitlab.freedesktop.org/drm/intel/issues/8809>)
>
>  *
>
>     igt@kms_sysfs_edid_timing:
>
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-17/igt@kms_sysfs_edid_timing.html>
>         (IGT#2
>         <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2> /
>         i915#6493 <https://gitlab.freedesktop.org/drm/intel/issues/6493>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-3/igt@kms_tiled_display@basic-test-pattern.html>
>         (i915#8623 <https://gitlab.freedesktop.org/drm/intel/issues/8623>)
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern.html>
>         (i915#8623 <https://gitlab.freedesktop.org/drm/intel/issues/8623>)
>
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html>
>         (i915#9196 <https://gitlab.freedesktop.org/drm/intel/issues/9196>)
>  *
>
>     igt@kms_universal_plane@universal-plane-sanity:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_universal_plane@universal-plane-sanity.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +15
>         other tests skip
>  *
>
>     igt@kms_writeback@writeback-fb-id:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_writeback@writeback-fb-id.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/intel/issues/2437>) +1
>         other test skip
>  *
>
>     igt@kms_writeback@writeback-invalid-parameters:
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-5/igt@kms_writeback@writeback-invalid-parameters.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-2/igt@kms_writeback@writeback-invalid-parameters.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>
>  *
>
>     igt@perf@gen8-unprivileged-single-ctx-counters:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html>
>         (i915#2436 <https://gitlab.freedesktop.org/drm/intel/issues/2436>)
>  *
>
>     igt@perf@global-sseu-config-invalid:
>
>      o
>
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@perf@global-sseu-config-invalid.html>
>         (i915#7387 <https://gitlab.freedesktop.org/drm/intel/issues/7387>)
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@perf@global-sseu-config-invalid.html>
>         (i915#7387 <https://gitlab.freedesktop.org/drm/intel/issues/7387>)
>
>  *
>
>     igt@perf_pmu@busy-double-start@ccs0:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-mtlp-5/igt@perf_pmu@busy-double-start@ccs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-8/igt@perf_pmu@busy-double-start@ccs0.html>
>         (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>)
>  *
>
>     igt@perf_pmu@cpu-hotplug:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@perf_pmu@cpu-hotplug.html>
>         (i915#8850 <https://gitlab.freedesktop.org/drm/intel/issues/8850>)
>  *
>
>     igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>
>       o shard-dg2: NOTRUN -> CRASH
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html>
>         (i915#9351 <https://gitlab.freedesktop.org/drm/intel/issues/9351>)
>  *
>
>     igt@prime_udl:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-5/igt@prime_udl.html>
>         (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
>  *
>
>     igt@prime_vgem@coherency-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@prime_vgem@coherency-gtt.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>         i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1
>         other test skip
>  *
>
>     igt@prime_vgem@fence-read-hang:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@prime_vgem@fence-read-hang.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-19/igt@prime_vgem@fence-read-hang.html>
>         (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>
>  *
>
>     igt@v3d/v3d_perfmon@create-perfmon-0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-15/igt@v3d/v3d_perfmon@create-perfmon-0.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +3
>         other tests skip
>  *
>
>     igt@v3d/v3d_submit_cl@bad-multisync-out-sync:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@v3d/v3d_submit_cl@bad-multisync-out-sync.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +12
>         other tests skip
>  *
>
>     igt@v3d/v3d_submit_cl@simple-flush-cache:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@v3d/v3d_submit_cl@simple-flush-cache.html>
>         (fdo#109315
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109315>) +7
>         other tests skip
>  *
>
>     igt@v3d/v3d_submit_cl@valid-submission:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-4/igt@v3d/v3d_submit_cl@valid-submission.html>
>         (fdo#109315
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109315> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>)
>  *
>
>     igt@v3d/v3d_submit_csd@bad-bo:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-3/igt@v3d/v3d_submit_csd@bad-bo.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +4
>         other tests skip
>  *
>
>     igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice.html>
>         (i915#7711
>         <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +3
>         other tests skip
>  *
>
>     igt@vc4/vc4_tiling@set-get:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-2/igt@vc4/vc4_tiling@set-get.html>
>         (i915#7711
>         <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +8
>         other tests skip
>  *
>
>     igt@vc4/vc4_wait_seqno@bad-seqno-0ns:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-5/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html>
>         (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>)
>  *
>
>     igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html>
>         (i915#7711
>         <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +4
>         other tests skip
>
>      o
>
>         shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-18/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html>
>         (i915#7711
>         <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +2
>         other tests skip
>
>
>         Possible fixes
>
>  *
>
>     igt@fbdev@nullptr:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@fbdev@nullptr.html>
>         (i915#2582
>         <https://gitlab.freedesktop.org/drm/intel/issues/2582>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@fbdev@nullptr.html>
>         +1 other test pass
>  *
>
>     igt@gem_create@create-ext-cpu-access-big:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg2-10/igt@gem_create@create-ext-cpu-access-big.html>
>         (i915#9364
>         <https://gitlab.freedesktop.org/drm/intel/issues/9364>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@gem_create@create-ext-cpu-access-big.html>
>  *
>
>     igt@gem_eio@unwedge-stress:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg1-15/igt@gem_eio@unwedge-stress.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/intel/issues/5784>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-16/igt@gem_eio@unwedge-stress.html>
>  *
>
>     igt@gem_exec_fair@basic-pace-share@rcs0:
>
>      o
>
>         shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>
>      o
>
>         shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>
>  *
>
>     igt@gem_exec_fair@basic-pace@rcs0:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-tglu-9/igt@gem_exec_fair@basic-pace@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-5/igt@gem_exec_fair@basic-pace@rcs0.html>
>  *
>
>     {igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0}:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html>
>         (i915#3591
>         <https://gitlab.freedesktop.org/drm/intel/issues/3591>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html>
>  *
>
>     igt@i915_selftest@live@gem_contexts:
>
>       o shard-mtlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-mtlp-3/igt@i915_selftest@live@gem_contexts.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-6/igt@i915_selftest@live@gem_contexts.html>
>  *
>
>     igt@i915_suspend@basic-s3-without-i915:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html>
>         (fdo#103375
>         <https://bugs.freedesktop.org/show_bug.cgi?id=103375>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@i915_suspend@basic-s3-without-i915.html>
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-tglu-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         (i915#3743
>         <https://gitlab.freedesktop.org/drm/intel/issues/3743>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         +1 other test pass
>  *
>
>     igt@kms_color@degamma@pipe-a:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_color@degamma@pipe-a.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_color@degamma@pipe-a.html>
>         +11 other tests pass
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html>
>         +17 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html>
>         (i915#6880
>         <https://gitlab.freedesktop.org/drm/intel/issues/6880>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html>
>         +1 other test pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html>
>         +13 other tests pass
>  *
>
>     {igt@kms_pm_rpm@dpms-mode-unset-non-lpsp}:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/intel/issues/9519>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>  *
>
>     {igt@kms_pm_rpm@fences}:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_pm_rpm@fences.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_pm_rpm@fences.html>
>  *
>
>     igt@kms_properties@plane-properties-atomic:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_properties@plane-properties-atomic.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_properties@plane-properties-atomic.html>
>         +2 other tests pass
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-tglu-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html>
>         (i915#9196
>         <https://gitlab.freedesktop.org/drm/intel/issues/9196>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html>
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1:
>
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html>
>         (i915#9196
>         <https://gitlab.freedesktop.org/drm/intel/issues/9196>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-snb7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html>
>  *
>
>     igt@perf_pmu@multi-client@vcs0:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-mtlp-5/igt@perf_pmu@multi-client@vcs0.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/intel/issues/4349>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-2/igt@perf_pmu@multi-client@vcs0.html>
>  *
>
>     igt@perf_pmu@render-node-busy-idle@vcs1:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg1-19/igt@perf_pmu@render-node-busy-idle@vcs1.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/intel/issues/4349>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-12/igt@perf_pmu@render-node-busy-idle@vcs1.html>
>         +2 other tests pass
>  *
>
>     igt@prime_vgem@fence-wait@vcs1:
>
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-mtlp-8/igt@prime_vgem@fence-wait@vcs1.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@prime_vgem@fence-wait@vcs1.html>
>  *
>
>     igt@prime_vgem@fence-wait@vecs0:
>
>       o shard-mtlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-mtlp-8/igt@prime_vgem@fence-wait@vecs0.html>
>         (i915#8875
>         <https://gitlab.freedesktop.org/drm/intel/issues/8875>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@prime_vgem@fence-wait@vecs0.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_async_flips@crc@pipe-a-edp-1:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-mtlp-8/igt@kms_async_flips@crc@pipe-a-edp-1.html>
>         (i915#8247
>         <https://gitlab.freedesktop.org/drm/intel/issues/8247>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-4/igt@kms_async_flips@crc@pipe-a-edp-1.html>
>         (i915#8561 <https://gitlab.freedesktop.org/drm/intel/issues/8561>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/intel/issues/1769> /
>         i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +6
>         other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +5
>         other tests skip
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-270:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614> /
>         i915#3638
>         <https://gitlab.freedesktop.org/drm/intel/issues/3638>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +5
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614> /
>         i915#3638
>         <https://gitlab.freedesktop.org/drm/intel/issues/3638>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html>
>         (fdo#110723
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110723>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +7
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html>
>         (fdo#110723
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110723>) +7
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_big_fb@yf-tiled-addfb.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb.html>
>         (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (i915#3116
>         <https://gitlab.freedesktop.org/drm/intel/issues/3116>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_content_protection@type1:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg2-11/igt@kms_content_protection@type1.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/intel/issues/7118> /
>         i915#7162
>         <https://gitlab.freedesktop.org/drm/intel/issues/7162>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@kms_content_protection@type1.html>
>         (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x170:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (i915#3359
>         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x10:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +5
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html>
>         (fdo#111767
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111767> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/intel/issues/4103>) +1
>         other test skip
>  *
>
>     igt@kms_dsc@dsc-with-bpc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_dsc@dsc-with-bpc.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#3840
>         <https://gitlab.freedesktop.org/drm/intel/issues/3840>) +1
>         other test skip
>  *
>
>     igt@kms_force_connector_basic@force-load-detect:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html>
>         (fdo#109285
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109285> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html>
>         (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>         i915#1825
>         <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +27
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html>
>         (i915#3023
>         <https://gitlab.freedesktop.org/drm/intel/issues/3023>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +26
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>         i915#1825
>         <https://gitlab.freedesktop.org/drm/intel/issues/1825>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +33
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html>
>         (i915#3023
>         <https://gitlab.freedesktop.org/drm/intel/issues/3023>) +21
>         other tests skip
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_hdr@invalid-hdr.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_hdr@invalid-hdr.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#8228 <https://gitlab.freedesktop.org/drm/intel/issues/8228>)
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (i915#4816
>         <https://gitlab.freedesktop.org/drm/intel/issues/4816>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#4816 <https://gitlab.freedesktop.org/drm/intel/issues/4816>)
>  *
>
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>         i915#8152 <https://gitlab.freedesktop.org/drm/intel/issues/8152>)
>  *
>
>     igt@kms_psr@psr2_basic:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg2-3/igt@kms_psr@psr2_basic.html>
>         (i915#9673
>         <https://gitlab.freedesktop.org/drm/intel/issues/9673> /
>         i915#9732
>         <https://gitlab.freedesktop.org/drm/intel/issues/9732>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_psr@psr2_basic.html>
>         (i915#9673
>         <https://gitlab.freedesktop.org/drm/intel/issues/9673> /
>         i915#9736 <https://gitlab.freedesktop.org/drm/intel/issues/9736>)
>  *
>
>     igt@kms_psr@psr2_cursor_mmap_gtt:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg2-11/igt@kms_psr@psr2_cursor_mmap_gtt.html>
>         (i915#9673
>         <https://gitlab.freedesktop.org/drm/intel/issues/9673> /
>         i915#9736
>         <https://gitlab.freedesktop.org/drm/intel/issues/9736>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-5/igt@kms_psr@psr2_cursor_mmap_gtt.html>
>         (i915#9673
>         <https://gitlab.freedesktop.org/drm/intel/issues/9673> /
>         i915#9732
>         <https://gitlab.freedesktop.org/drm/intel/issues/9732>) +1
>         other test skip
>  *
>
>     igt@kms_psr@psr2_dpms:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-3/igt@kms_psr@psr2_dpms.html>
>         (i915#9673
>         <https://gitlab.freedesktop.org/drm/intel/issues/9673> /
>         i915#9732
>         <https://gitlab.freedesktop.org/drm/intel/issues/9732>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_psr@psr2_dpms.html>
>         (i915#9673
>         <https://gitlab.freedesktop.org/drm/intel/issues/9673>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@psr2_sprite_mmap_gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_psr@psr2_sprite_mmap_gtt.html>
>         (i915#9673
>         <https://gitlab.freedesktop.org/drm/intel/issues/9673>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_psr@psr2_sprite_mmap_gtt.html>
>         (i915#9673
>         <https://gitlab.freedesktop.org/drm/intel/issues/9673> /
>         i915#9732
>         <https://gitlab.freedesktop.org/drm/intel/issues/9732>) +4
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/intel/issues/5289>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>         i915#5289
>         <https://gitlab.freedesktop.org/drm/intel/issues/5289>) +1
>         other test skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>         i915#5289
>         <https://gitlab.freedesktop.org/drm/intel/issues/5289>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) +1
>         other test skip
>  *
>
>     igt@kms_vrr@negative-basic:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_vrr@negative-basic.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_vrr@negative-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +3
>         other tests skip
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7612 -> IGTPW_10311
>   * Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_13955: d835c627d25ba8775624ff3e854d034708044ac3 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_10311: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/index.html
> IGT_7612: b5c47966901ee1060bcb9d4bccdd3ccec9651ef4 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
>
--------------CYRTUQ6UQ4229cDiNrQhBxIt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/1/2023 9:57 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:170146425153.19689.10557738258242482688@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>test/xe_spin_batch: Add
              spin-fixed-duration-with-preempter (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/126583/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/126583/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_13955_full -&gt;
        IGTPW_10311_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_10311_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_10311_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/index.html</a></p>
      <h2>Participating hosts (11 -&gt; 12)</h2>
      <p>Additional (1): shard-tglu0 </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_10311_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a1.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@sysfs_heartbeat_interval@nopreempt@vcs0:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-mtlp-5/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-4/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>Unrelated failures. Merged this test. </p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite"
cite="mid:170146425153.19689.10557738258242482688@emeril.freedesktop.org">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_10311_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-8/igt@api_intel_bb@blit-reloc-keep-cache.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8411"
                moz-do-not-send="true">i915#8411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7742"
                moz-do-not-send="true">i915#7742</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8414"
                moz-do-not-send="true">i915#8414</a>) +31 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@virtual-busy-all:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-12/igt@drm_fdinfo@virtual-busy-all.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8414"
                moz-do-not-send="true">i915#8414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_bad_reloc@negative-reloc-lut:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@gem_bad_reloc@negative-reloc-lut.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3281"
                  moz-do-not-send="true">i915#3281</a>) +6 other tests
                skip</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-16/igt@gem_bad_reloc@negative-reloc-lut.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3281"
                  moz-do-not-send="true">i915#3281</a>) +2 other tests
                skip</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_basic@multigpu-create-close:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-4/igt@gem_basic@multigpu-create-close.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7697"
                moz-do-not-send="true">i915#7697</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-multicopy-compressed:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9323"
                moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7297"
                moz-do-not-send="true">i915#7297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@gem_create@create-ext-cpu-access-sanity-check.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/6335"
                moz-do-not-send="true">i915#6335</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-set-pat:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@gem_create@create-ext-set-pat.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8562"
                  moz-do-not-send="true">i915#8562</a>)</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@gem_create@create-ext-set-pat.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8562"
                  moz-do-not-send="true">i915#8562</a>)</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-15/igt@gem_create@create-ext-set-pat.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8562"
                  moz-do-not-send="true">i915#8562</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@basic-nohangcheck:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/6268"
                moz-do-not-send="true">i915#6268</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-close:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-close.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8555"
                moz-do-not-send="true">i915#8555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-hostile.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8555"
                moz-do-not-send="true">i915#8555</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@engines:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-2/igt@gem_ctx_sseu@engines.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/280"
                moz-do-not-send="true">i915#280</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@hibernate:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@gem_eio@hibernate.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7975"
                moz-do-not-send="true">i915#7975</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/8213"
                moz-do-not-send="true">i915#8213</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-dual:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-15/igt@gem_exec_balancer@bonded-dual.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4771"
                moz-do-not-send="true">i915#4771</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-pair:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@gem_exec_balancer@bonded-pair.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4771"
                moz-do-not-send="true">i915#4771</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@noheartbeat:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-6/igt@gem_exec_balancer@noheartbeat.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8555"
                moz-do-not-send="true">i915#8555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-bb-first:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4525"
                moz-do-not-send="true">i915#4525</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@many-4k-incremental:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk8/igt@gem_exec_capture@many-4k-incremental.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9606"
                moz-do-not-send="true">i915#9606</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-deadline:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-18/igt@gem_exec_fair@basic-deadline.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3539"
                moz-do-not-send="true">i915#3539</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4852"
                moz-do-not-send="true">i915#4852</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-tglu-6/igt@gem_exec_fair@basic-none-share@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-4/igt@gem_exec_fair@basic-none-share@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@gem_exec_fair@basic-none-vip@rcs0.html"
                  moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                  moz-do-not-send="true">i915#2842</a>)</p>
            </li>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk7/igt@gem_exec_fair@basic-none-vip@rcs0.html"
                  moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                  moz-do-not-send="true">i915#2842</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none@rcs0:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@gem_exec_fair@basic-none@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@gem_exec_fair@basic-none@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-share:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@gem_exec_fair@basic-pace-share.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3539"
                moz-do-not-send="true">i915#3539</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4852"
                moz-do-not-send="true">i915#4852</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-solo:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@gem_exec_fair@basic-pace-solo.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3539"
                moz-do-not-send="true">i915#3539</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fence@submit67:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@gem_exec_fence@submit67.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4812"
                moz-do-not-send="true">i915#4812</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_params@secure-non-master:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-7/igt@gem_exec_params@secure-non-master.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=112283"
                moz-do-not-send="true">fdo#112283</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-range-active:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@gem_exec_reloc@basic-range-active.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3281"
                moz-do-not-send="true">i915#3281</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-wc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-2/igt@gem_exec_reloc@basic-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3281"
                moz-do-not-send="true">i915#3281</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@preempt-queue:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@gem_exec_schedule@preempt-queue.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4537"
                moz-do-not-send="true">i915#4537</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4812"
                moz-do-not-send="true">i915#4812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-13/igt@gem_exec_schedule@preempt-queue-contexts.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4812"
                moz-do-not-send="true">i915#4812</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4860"
                moz-do-not-send="true">i915#4860</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-random-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4613"
                moz-do-not-send="true">i915#4613</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4613"
                moz-do-not-send="true">i915#4613</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5493"
                moz-do-not-send="true">i915#5493</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@gem_lmem_swapping@verify.html"
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
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-7/igt@gem_media_fill@media-fill.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8289"
                moz-do-not-send="true">i915#8289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@bad-object:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-8/igt@gem_mmap_gtt@bad-object.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@basic-wc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-17/igt@gem_mmap_gtt@basic-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@medium-copy-xy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@gem_mmap_gtt@medium-copy-xy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@bad-object:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-3/igt@gem_mmap_wc@bad-object.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4083"
                moz-do-not-send="true">i915#4083</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@close:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-7/igt@gem_mmap_wc@close.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4083"
                moz-do-not-send="true">i915#4083</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-19/igt@gem_partial_pwrite_pread@writes-after-reads.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3282"
                moz-do-not-send="true">i915#3282</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3282"
                moz-do-not-send="true">i915#3282</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pread@display:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@gem_pread@display.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3282"
                moz-do-not-send="true">i915#3282</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4270"
                moz-do-not-send="true">i915#4270</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4270"
                moz-do-not-send="true">i915#4270</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4270"
                moz-do-not-send="true">i915#4270</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_readwrite@read-write:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-7/igt@gem_readwrite@read-write.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3282"
                moz-do-not-send="true">i915#3282</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-2/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8428"
                moz-do-not-send="true">i915#8428</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8411"
                  moz-do-not-send="true">i915#8411</a>)</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-18/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4079"
                  moz-do-not-send="true">i915#4079</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_gtt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-6/igt@gem_set_tiling_vs_gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4079"
                moz-do-not-send="true">i915#4079</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@evict-snoop-interruptible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@gem_softpin@evict-snoop-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4885"
                moz-do-not-send="true">i915#4885</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_spin_batch@spin-all-new:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5889"
                moz-do-not-send="true">i915#5889</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@dmabuf-sync:</p>
          <ul>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3323"
                  moz-do-not-send="true">i915#3323</a>)</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@gem_userptr_blits@dmabuf-sync.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3323"
                  moz-do-not-send="true">i915#3323</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@dmabuf-unsync:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@gem_userptr_blits@dmabuf-unsync.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3297"
                  moz-do-not-send="true">i915#3297</a>) +1 other test
                skip</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-19/igt@gem_userptr_blits@dmabuf-unsync.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3297"
                  moz-do-not-send="true">i915#3297</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3297"
                moz-do-not-send="true">i915#3297</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4880"
                moz-do-not-send="true">i915#4880</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@sd-probe:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@gem_userptr_blits@sd-probe.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3297"
                moz-do-not-send="true">i915#3297</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4958"
                moz-do-not-send="true">i915#4958</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen3_render_linear_blits:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@gen3_render_linear_blits.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                moz-do-not-send="true">fdo#109289</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen7_exec_parse@basic-allocation:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-6/igt@gen7_exec_parse@basic-allocation.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                moz-do-not-send="true">fdo#109289</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen7_exec_parse@basic-rejected:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@gen7_exec_parse@basic-rejected.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                moz-do-not-send="true">fdo#109289</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-all:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk4/igt@gen9_exec_parse@allowed-all.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5566"
                moz-do-not-send="true">i915#5566</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@batch-without-end:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-2/igt@gen9_exec_parse@batch-without-end.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2856"
                  moz-do-not-send="true">i915#2856</a>) +1 other test
                skip</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-18/igt@gen9_exec_parse@batch-without-end.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2527"
                  moz-do-not-send="true">i915#2527</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-oversize:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@gen9_exec_parse@bb-oversize.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2527"
                moz-do-not-send="true">i915#2527</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-start-out:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-8/igt@gen9_exec_parse@bb-start-out.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2856"
                moz-do-not-send="true">i915#2856</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7091"
                moz-do-not-send="true">i915#7091</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109293"
                moz-do-not-send="true">fdo#109293</a> / <a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109506"
                moz-do-not-send="true">fdo#109506</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@thresholds-idle@gt0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-19/igt@i915_pm_rps@thresholds-idle@gt0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8925"
                moz-do-not-send="true">i915#8925</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@thresholds-park@gt0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@i915_pm_rps@thresholds-park@gt0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8925"
                moz-do-not-send="true">i915#8925</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@query-topology-coherent-slice-mask:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@i915_query@query-topology-coherent-slice-mask.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/6188"
                moz-do-not-send="true">i915#6188</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@mock@memory_region:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@i915_selftest@mock@memory_region.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9311"
                moz-do-not-send="true">i915#9311</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@clobberred-modifier:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4212"
                moz-do-not-send="true">i915#4212</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-vga-1-linear:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-snb4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-vga-1-linear.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8247"
                moz-do-not-send="true">i915#8247</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@crc@pipe-b-hdmi-a-3:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-12/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8247"
                moz-do-not-send="true">i915#8247</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@test-cursor:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-2/igt@kms_async_flips@test-cursor.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/6229"
                moz-do-not-send="true">i915#6229</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111614"
                moz-do-not-send="true">fdo#111614</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5286"
                  moz-do-not-send="true">i915#5286</a>) +2 other tests
                skip</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-16/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4538"
                  moz-do-not-send="true">i915#4538</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/5286"
                  moz-do-not-send="true">i915#5286</a>) +1 other test
                skip</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5138"
                moz-do-not-send="true">i915#5138</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-15/igt@kms_big_fb@linear-64bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3638"
                moz-do-not-send="true">i915#3638</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111614"
                moz-do-not-send="true">fdo#111614</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-tglu-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3743"
                moz-do-not-send="true">i915#3743</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5190"
                moz-do-not-send="true">i915#5190</a>) +16 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-13/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4538"
                moz-do-not-send="true">i915#4538</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=110723"
                moz-do-not-send="true">fdo#110723</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/6187"
                moz-do-not-send="true">i915#6187</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4538"
                moz-do-not-send="true">i915#4538</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/5190"
                moz-do-not-send="true">i915#5190</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_joiner@invalid-modeset:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-5/igt@kms_big_joiner@invalid-modeset.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2705"
                moz-do-not-send="true">i915#2705</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-25:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@kms_chamelium_color@ctm-0-25.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-75:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_chamelium_color@ctm-0-75.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-8/igt@kms_chamelium_color@ctm-blue-to-red.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-5/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7828"
                moz-do-not-send="true">i915#7828</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7828"
                moz-do-not-send="true">i915#7828</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk8/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +46 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-9/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7828"
                moz-do-not-send="true">i915#7828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7828"
                  moz-do-not-send="true">i915#7828</a>) +6 other tests
                skip</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-16/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7828"
                  moz-do-not-send="true">i915#7828</a>) +4 other tests
                skip</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@gamma@pipe-a:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-3/igt@kms_color@gamma@pipe-a.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_color@gamma@pipe-a.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7173"
                moz-do-not-send="true">i915#7173</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3299"
                moz-do-not-send="true">i915#3299</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-2/igt@kms_content_protection@legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/6944"
                moz-do-not-send="true">i915#6944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@kms_content_protection@srm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7118"
                moz-do-not-send="true">i915#7118</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_content_protection@type1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7118"
                moz-do-not-send="true">i915#7118</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_content_protection@uevent@pipe-a-dp-4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1339"
                moz-do-not-send="true">i915#1339</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +27 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/8814"
                moz-do-not-send="true">i915#8814</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109279"
                moz-do-not-send="true">fdo#109279</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                  moz-do-not-send="true">i915#3555</a>) +15 other tests
                skip</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-12/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                  moz-do-not-send="true">i915#3555</a>) +2 other tests
                skip</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                  moz-do-not-send="true">fdo#109274</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                  moz-do-not-send="true">i915#5354</a>) +7 other tests
                skip</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3546"
                  moz-do-not-send="true">i915#3546</a>) +1 other test
                skip</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4103"
                moz-do-not-send="true">i915#4103</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4213"
                moz-do-not-send="true">i915#4213</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/5608"
                moz-do-not-send="true">i915#5608</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2346"
                moz-do-not-send="true">i915#2346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@mst-extended-mode-negative:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@kms_display_modes@mst-extended-mode-negative.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8588"
                  moz-do-not-send="true">i915#8588</a>)</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-19/igt@kms_display_modes@mst-extended-mode-negative.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8588"
                  moz-do-not-send="true">i915#8588</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3804"
                moz-do-not-send="true">i915#3804</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8812"
                moz-do-not-send="true">i915#8812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc-formats:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_dsc@dsc-with-bpc-formats.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                  moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3840"
                  moz-do-not-send="true">i915#3840</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                  moz-do-not-send="true">i915#4098</a>)</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-3/igt@kms_dsc@dsc-with-bpc-formats.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                  moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3840"
                  moz-do-not-send="true">i915#3840</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                  moz-do-not-send="true">i915#4098</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-blocking-wf_vblank:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-3/igt@kms_flip@2x-blocking-wf_vblank.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3637"
                moz-do-not-send="true">i915#3637</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_flip@2x-flip-vs-fences-interruptible.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8381"
                  moz-do-not-send="true">i915#8381</a>) +1 other test
                skip</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@kms_flip@2x-flip-vs-fences-interruptible.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8381"
                  moz-do-not-send="true">i915#8381</a>) +1 other test
                skip</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-snb5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111767"
                moz-do-not-send="true">fdo#111767</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109274"
                moz-do-not-send="true">fdo#109274</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-flip-vs-dpms:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_flip@basic-flip-vs-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3637"
                moz-do-not-send="true">i915#3637</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                  moz-do-not-send="true">i915#2672</a>) +2 other tests
                skip</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2587"
                  moz-do-not-send="true">i915#2587</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                  moz-do-not-send="true">i915#2672</a>) +2 other tests
                skip</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/6880"
                moz-do-not-send="true">i915#6880</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) +34 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8708"
                moz-do-not-send="true">i915#8708</a>) +22 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1825"
                moz-do-not-send="true">i915#1825</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109280"
                moz-do-not-send="true">fdo#109280</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-tiling-y.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5460"
                moz-do-not-send="true">i915#5460</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8708"
                moz-do-not-send="true">i915#8708</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3458"
                moz-do-not-send="true">i915#3458</a>) +21 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3458"
                moz-do-not-send="true">i915#3458</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                  moz-do-not-send="true">fdo#111825</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/1825"
                  moz-do-not-send="true">i915#1825</a>) +17 other tests
                skip</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                  moz-do-not-send="true">fdo#111825</a>) +12 other tests
                skip</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-rte.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3023"
                moz-do-not-send="true">i915#3023</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8708"
                moz-do-not-send="true">i915#8708</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=110189"
                moz-do-not-send="true">fdo#110189</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-metadata-sizes:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/8228"
                moz-do-not-send="true">i915#8228</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@bad-htotal:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_invalid_mode@bad-htotal.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4816"
                  moz-do-not-send="true">i915#4816</a>)</p>
            </li>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4816"
                  moz-do-not-send="true">i915#4816</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@atomic-fastset:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@kms_panel_fitting@atomic-fastset.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/6301"
                moz-do-not-send="true">i915#6301</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@bad-source:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-4/igt@kms_pipe_crc_basic@bad-source.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_pipe_crc_basic@bad-source.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +20 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole-dpms:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_plane@plane-position-hole-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/8825"
                moz-do-not-send="true">i915#8825</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk3/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4573"
                moz-do-not-send="true">i915#4573</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8292"
                moz-do-not-send="true">i915#8292</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8292"
                moz-do-not-send="true">i915#8292</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5176"
                moz-do-not-send="true">i915#5176</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/9423"
                moz-do-not-send="true">i915#9423</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5235"
                moz-do-not-send="true">i915#5235</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5235"
                moz-do-not-send="true">i915#5235</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8152"
                moz-do-not-send="true">i915#8152</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/6953"
                moz-do-not-send="true">i915#6953</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/8152"
                moz-do-not-send="true">i915#8152</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/6953"
                moz-do-not-send="true">i915#6953</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/8152"
                moz-do-not-send="true">i915#8152</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5235"
                moz-do-not-send="true">i915#5235</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/5235"
                moz-do-not-send="true">i915#5235</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5235"
                moz-do-not-send="true">i915#5235</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-crc-hybrid:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-6/igt@kms_prime@basic-crc-hybrid.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/6524"
                moz-do-not-send="true">i915#6524</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_properties@crtc-properties-atomic:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-7/igt@kms_properties@crtc-properties-atomic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_properties@crtc-properties-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9683"
                  moz-do-not-send="true">i915#9683</a>)</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-16/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9683"
                  moz-do-not-send="true">i915#9683</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_psr2_sf@plane-move-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111068"
                moz-do-not-send="true">fdo#111068</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/9683"
                moz-do-not-send="true">i915#9683</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109642"
                moz-do-not-send="true">fdo#109642</a> / <a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111068"
                moz-do-not-send="true">fdo#111068</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/9683"
                moz-do-not-send="true">i915#9683</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_psr2_su@page_flip-xrgb8888.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9683"
                  moz-do-not-send="true">i915#9683</a>) +3 other tests
                skip</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-12/igt@kms_psr2_su@page_flip-xrgb8888.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111068"
                  moz-do-not-send="true">fdo#111068</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/9683"
                  moz-do-not-send="true">i915#9683</a>) +1 other test
                skip</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-6/igt@kms_psr@psr2_primary_mmap_cpu.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9673"
                moz-do-not-send="true">i915#9673</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_sprite_plane_move:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-2/igt@kms_psr@psr2_sprite_plane_move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9673"
                moz-do-not-send="true">i915#9673</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/9732"
                moz-do-not-send="true">i915#9732</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9685"
                moz-do-not-send="true">i915#9685</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4235"
                  moz-do-not-send="true">i915#4235</a>) +1 other test
                skip</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@kms_rotation_crc@sprite-rotation-90.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4235"
                  moz-do-not-send="true">i915#4235</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic-clone-single-crtc:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@kms_setmode@basic-clone-single-crtc.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                  moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                  moz-do-not-send="true">i915#4098</a>)</p>
            </li>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                  moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/8809"
                  moz-do-not-send="true">i915#8809</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sysfs_edid_timing:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-17/igt@kms_sysfs_edid_timing.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2"
                moz-do-not-send="true">IGT#2</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/6493"
                moz-do-not-send="true">i915#6493</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-3/igt@kms_tiled_display@basic-test-pattern.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8623"
                  moz-do-not-send="true">i915#8623</a>)</p>
            </li>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8623"
                  moz-do-not-send="true">i915#8623</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9196"
                moz-do-not-send="true">i915#9196</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@universal-plane-sanity:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_universal_plane@universal-plane-sanity.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_writeback@writeback-fb-id.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2437"
                moz-do-not-send="true">i915#2437</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-invalid-parameters:</p>
          <ul>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-5/igt@kms_writeback@writeback-invalid-parameters.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2437"
                  moz-do-not-send="true">i915#2437</a>)</p>
            </li>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-2/igt@kms_writeback@writeback-invalid-parameters.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2437"
                  moz-do-not-send="true">i915#2437</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2436"
                moz-do-not-send="true">i915#2436</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@global-sseu-config-invalid:</p>
          <ul>
            <li>
              <p>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@perf@global-sseu-config-invalid.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7387"
                  moz-do-not-send="true">i915#7387</a>)</p>
            </li>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@perf@global-sseu-config-invalid.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7387"
                  moz-do-not-send="true">i915#7387</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-double-start@ccs0:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-mtlp-5/igt@perf_pmu@busy-double-start@ccs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-8/igt@perf_pmu@busy-double-start@ccs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4349"
                moz-do-not-send="true">i915#4349</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@cpu-hotplug:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@perf_pmu@cpu-hotplug.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8850"
                moz-do-not-send="true">i915#8850</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-6/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html"
                moz-do-not-send="true">CRASH</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9351"
                moz-do-not-send="true">i915#9351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_udl:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-5/igt@prime_udl.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109291"
                moz-do-not-send="true">fdo#109291</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@coherency-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@prime_vgem@coherency-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                moz-do-not-send="true">i915#3708</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@fence-read-hang:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@prime_vgem@fence-read-hang.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109295"
                  moz-do-not-send="true">fdo#109295</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                  moz-do-not-send="true">i915#3708</a>)</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-19/igt@prime_vgem@fence-read-hang.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3708"
                  moz-do-not-send="true">i915#3708</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_perfmon@create-perfmon-0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-15/igt@v3d/v3d_perfmon@create-perfmon-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_submit_cl@bad-multisync-out-sync:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@v3d/v3d_submit_cl@bad-multisync-out-sync.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_submit_cl@simple-flush-cache:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@v3d/v3d_submit_cl@simple-flush-cache.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109315"
                moz-do-not-send="true">fdo#109315</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_submit_cl@valid-submission:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-4/igt@v3d/v3d_submit_cl@valid-submission.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109315"
                moz-do-not-send="true">fdo#109315</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_submit_csd@bad-bo:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-3/igt@v3d/v3d_submit_csd@bad-bo.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7711"
                moz-do-not-send="true">i915#7711</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_tiling@set-get:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-2/igt@vc4/vc4_tiling@set-get.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7711"
                moz-do-not-send="true">i915#7711</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_wait_seqno@bad-seqno-0ns:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-5/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_wait_seqno@bad-seqno-1ns:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7711"
                  moz-do-not-send="true">i915#7711</a>) +4 other tests
                skip</p>
            </li>
            <li>
              <p>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-18/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html"
                  moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7711"
                  moz-do-not-send="true">i915#7711</a>) +2 other tests
                skip</p>
            </li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@fbdev@nullptr:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@fbdev@nullptr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2582"
                moz-do-not-send="true">i915#2582</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@fbdev@nullptr.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-cpu-access-big:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg2-10/igt@gem_create@create-ext-cpu-access-big.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9364"
                moz-do-not-send="true">i915#9364</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-10/igt@gem_create@create-ext-cpu-access-big.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@unwedge-stress:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg1-15/igt@gem_eio@unwedge-stress.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5784"
                moz-do-not-send="true">i915#5784</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-16/igt@gem_eio@unwedge-stress.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
          <ul>
            <li>
              <p>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html"
                  moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                  moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html"
                  moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                  moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html"
                  moz-do-not-send="true">PASS</a></p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@rcs0:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-tglu-9/igt@gem_exec_fair@basic-pace@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-5/igt@gem_exec_fair@basic-pace@rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0}:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3591"
                moz-do-not-send="true">i915#3591</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@gem_contexts:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-mtlp-3/igt@i915_selftest@live@gem_contexts.html"
                moz-do-not-send="true">DMESG-FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-6/igt@i915_selftest@live@gem_contexts.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@basic-s3-without-i915:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=103375"
                moz-do-not-send="true">fdo#103375</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@i915_suspend@basic-s3-without-i915.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-tglu-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3743"
                moz-do-not-send="true">i915#3743</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@degamma@pipe-a:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_color@degamma@pipe-a.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_color@degamma@pipe-a.html"
                moz-do-not-send="true">PASS</a> +11 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html"
                moz-do-not-send="true">PASS</a> +17 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/6880"
                moz-do-not-send="true">i915#6880</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html"
                moz-do-not-send="true">PASS</a> +13 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_pm_rpm@dpms-mode-unset-non-lpsp}:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9519"
                moz-do-not-send="true">i915#9519</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_pm_rpm@fences}:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_pm_rpm@fences.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_pm_rpm@fences.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_properties@plane-properties-atomic:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_properties@plane-properties-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_properties@plane-properties-atomic.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-tglu-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9196"
                moz-do-not-send="true">i915#9196</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1:</p>
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9196"
                moz-do-not-send="true">i915#9196</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-snb7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@multi-client@vcs0:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-mtlp-5/igt@perf_pmu@multi-client@vcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4349"
                moz-do-not-send="true">i915#4349</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-2/igt@perf_pmu@multi-client@vcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@render-node-busy-idle@vcs1:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg1-19/igt@perf_pmu@render-node-busy-idle@vcs1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4349"
                moz-do-not-send="true">i915#4349</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg1-12/igt@perf_pmu@render-node-busy-idle@vcs1.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@fence-wait@vcs1:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-mtlp-8/igt@prime_vgem@fence-wait@vcs1.html"
                moz-do-not-send="true">ABORT</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@prime_vgem@fence-wait@vcs1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@fence-wait@vecs0:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-mtlp-8/igt@prime_vgem@fence-wait@vecs0.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8875"
                moz-do-not-send="true">i915#8875</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-7/igt@prime_vgem@fence-wait@vecs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@crc@pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-mtlp-8/igt@kms_async_flips@crc@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8247"
                moz-do-not-send="true">i915#8247</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-mtlp-4/igt@kms_async_flips@crc@pipe-a-edp-1.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/8561"
                moz-do-not-send="true">i915#8561</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1769"
                moz-do-not-send="true">i915#1769</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5286"
                moz-do-not-send="true">i915#5286</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5286"
                moz-do-not-send="true">i915#5286</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111614"
                moz-do-not-send="true">fdo#111614</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3638"
                moz-do-not-send="true">i915#3638</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_big_fb@linear-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111614"
                moz-do-not-send="true">fdo#111614</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3638"
                moz-do-not-send="true">i915#3638</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=110723"
                moz-do-not-send="true">fdo#110723</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=110723"
                moz-do-not-send="true">fdo#110723</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_big_fb@yf-tiled-addfb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3116"
                moz-do-not-send="true">i915#3116</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg2-11/igt@kms_content_protection@type1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7118"
                moz-do-not-send="true">i915#7118</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/7162"
                moz-do-not-send="true">i915#7162</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-1/igt@kms_content_protection@type1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/7118"
                moz-do-not-send="true">i915#7118</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x170:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3359"
                moz-do-not-send="true">i915#3359</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111767"
                moz-do-not-send="true">fdo#111767</a> / <a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4103"
                moz-do-not-send="true">i915#4103</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_dsc@dsc-with-bpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/3840"
                moz-do-not-send="true">i915#3840</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-load-detect:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109285"
                moz-do-not-send="true">fdo#109285</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=109285"
                moz-do-not-send="true">fdo#109285</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/1825"
                moz-do-not-send="true">i915#1825</a>) +27 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3023"
                moz-do-not-send="true">i915#3023</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) +26 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/1825"
                moz-do-not-send="true">i915#1825</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) +33 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1849"
                moz-do-not-send="true">i915#1849</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/5354"
                moz-do-not-send="true">i915#5354</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3023"
                moz-do-not-send="true">i915#3023</a>) +21 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_hdr@invalid-hdr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_hdr@invalid-hdr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/8228"
                moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4816"
                moz-do-not-send="true">i915#4816</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/4070"
                moz-do-not-send="true">i915#4070</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4816"
                moz-do-not-send="true">i915#4816</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/8152"
                moz-do-not-send="true">i915#8152</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_basic:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg2-3/igt@kms_psr@psr2_basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9673"
                moz-do-not-send="true">i915#9673</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/9732"
                moz-do-not-send="true">i915#9732</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-11/igt@kms_psr@psr2_basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9673"
                moz-do-not-send="true">i915#9673</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/9736"
                moz-do-not-send="true">i915#9736</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-dg2-11/igt@kms_psr@psr2_cursor_mmap_gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9673"
                moz-do-not-send="true">i915#9673</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/9736"
                moz-do-not-send="true">i915#9736</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-dg2-5/igt@kms_psr@psr2_cursor_mmap_gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9673"
                moz-do-not-send="true">i915#9673</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/9732"
                moz-do-not-send="true">i915#9732</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_dpms:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-3/igt@kms_psr@psr2_dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9673"
                moz-do-not-send="true">i915#9673</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/9732"
                moz-do-not-send="true">i915#9732</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_psr@psr2_dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9673"
                moz-do-not-send="true">i915#9673</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_psr@psr2_sprite_mmap_gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9673"
                moz-do-not-send="true">i915#9673</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-4/igt@kms_psr@psr2_sprite_mmap_gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/9673"
                moz-do-not-send="true">i915#9673</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/9732"
                moz-do-not-send="true">i915#9732</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/5289"
                moz-do-not-send="true">i915#5289</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/5289"
                moz-do-not-send="true">i915#5289</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://bugs.freedesktop.org/show_bug.cgi?id=111615"
                moz-do-not-send="true">fdo#111615</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/5289"
                moz-do-not-send="true">i915#5289</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@negative-basic:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13955/shard-rkl-1/igt@kms_vrr@negative-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/1845"
                moz-do-not-send="true">i915#1845</a> / <a
href="https://gitlab.freedesktop.org/drm/intel/issues/4098"
                moz-do-not-send="true">i915#4098</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/shard-rkl-6/igt@kms_vrr@negative-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/intel/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +3 other tests
              skip</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_7612 -&gt; IGTPW_10311</li>
        <li>Piglit: piglit_4509 -&gt; None</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_13955: d835c627d25ba8775624ff3e854d034708044ac3 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_10311:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10311/index.html</a><br>
        IGT_7612: b5c47966901ee1060bcb9d4bccdd3ccec9651ef4 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
        git://anongit.freedesktop.org/piglit</p>
    </blockquote>
  </body>
</html>

--------------CYRTUQ6UQ4229cDiNrQhBxIt--
