Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F023310E0A8
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 10:47:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------8jA88Hv846ikwQf2xQXuTaHS"
Message-ID: <594baea5-24ce-68d7-4c5a-c74a813303eb@intel.com>
Date: Tue, 8 Aug 2023 12:46:45 +0200
To: <igt-dev@lists.freedesktop.org>, "Yedireswarapu, SaiX Nandan"
 <saix.nandan.yedireswarapu@intel.com>, "Veesam, RavitejaX"
 <ravitejax.veesam@intel.com>, "Marikkar, SanjuX" <sanjux.marikkar@intel.com>
References: <20230807092446.7805-1-lukasz.laguna@intel.com>
 <169141916792.13177.8949736778062550975@emeril.freedesktop.org>
Content-Language: pl
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <169141916792.13177.8949736778062550975@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL3hl?=
 =?utf-8?q?=5Fquery=3A_add_helper_getting_available_VRAM_=28rev4=29?=
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

--------------8jA88Hv846ikwQf2xQXuTaHS
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 8/7/2023 16:39, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	lib/xe_query: add helper getting available VRAM (rev4)
> *URL:* 	https://patchwork.freedesktop.org/series/121704/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/index.html
>
>
>   CI Bug Log - changes from IGT_7418_full -> IGTPW_9526_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_9526_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_9526_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/index.html
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
> IGTPW_9526_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_psr@psr2_primary_mmap_cpu:
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-8/igt@kms_psr@psr2_primary_mmap_cpu.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-4/igt@kms_psr@psr2_primary_mmap_cpu.html>
>
Hello,

Above fail is not related to introduced change.

Regards,
Lukasz

>  *
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>   * {igt@kms_dsc@dsc-with-output-formats-with-bpc}:
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>
>
>     Known issues
>
> Here are the changes found in IGTPW_9526_full that come from known issues:
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
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@api_intel_bb@blit-reloc-keep-cache.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/intel/issues/8411>) +1
>         similar issue
>  *
>
>     igt@api_intel_bb@blit-reloc-purge-cache:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@api_intel_bb@blit-reloc-purge-cache.html>
>         (i915#8411 <https://gitlab.freedesktop.org/drm/intel/issues/8411>)
>  *
>
>     igt@api_intel_bb@crc32:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-4/igt@api_intel_bb@crc32.html>
>         (i915#6230 <https://gitlab.freedesktop.org/drm/intel/issues/6230>)
>  *
>
>     igt@debugfs_test@basic-hwmon:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@debugfs_test@basic-hwmon.html>
>         (i915#7456 <https://gitlab.freedesktop.org/drm/intel/issues/7456>)
>  *
>
>     igt@drm_buddy@drm_buddy_test:
>
>      o
>
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb5/igt@drm_buddy@drm_buddy_test.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#8661 <https://gitlab.freedesktop.org/drm/intel/issues/8661>)
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-6/igt@drm_buddy@drm_buddy_test.html>
>         (i915#8661
>         <https://gitlab.freedesktop.org/drm/intel/issues/8661>) +1
>         similar issue
>
>  *
>
>     igt@drm_fdinfo@most-busy-check-all@bcs0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@drm_fdinfo@most-busy-check-all@bcs0.html>
>         (i915#8414
>         <https://gitlab.freedesktop.org/drm/intel/issues/8414>) +9
>         similar issues
>  *
>
>     igt@drm_fdinfo@most-busy-idle-check-all@ccs0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-2/igt@drm_fdinfo@most-busy-idle-check-all@ccs0.html>
>         (i915#8414
>         <https://gitlab.freedesktop.org/drm/intel/issues/8414>) +11
>         similar issues
>  *
>
>     igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-2/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html>
>         (i915#7742 <https://gitlab.freedesktop.org/drm/intel/issues/7742>)
>  *
>
>     igt@drm_mm@drm_mm_test:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-6/igt@drm_mm@drm_mm_test.html>
>         (i915#8661 <https://gitlab.freedesktop.org/drm/intel/issues/8661>)
>  *
>
>     igt@feature_discovery@display-3x:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@feature_discovery@display-3x.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/intel/issues/1839>) +1
>         similar issue
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-4/igt@feature_discovery@display-3x.html>
>         (i915#1839 <https://gitlab.freedesktop.org/drm/intel/issues/1839>)
>
>  *
>
>     igt@gem_bad_reloc@negative-reloc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@gem_bad_reloc@negative-reloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +1
>         similar issue
>  *
>
>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>)
>  *
>
>     igt@gem_ccs@suspend-resume:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@gem_ccs@suspend-resume.html>
>         (i915#5325
>         <https://gitlab.freedesktop.org/drm/intel/issues/5325>) +1
>         similar issue
>  *
>
>     igt@gem_ctx_exec@basic-nohangcheck:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-tglu-5/igt@gem_ctx_exec@basic-nohangcheck.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-8/igt@gem_ctx_exec@basic-nohangcheck.html>
>         (i915#6268 <https://gitlab.freedesktop.org/drm/intel/issues/6268>)
>  *
>
>     igt@gem_ctx_persistence@engines-hang@vcs0:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-6/igt@gem_ctx_persistence@engines-hang@vcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@gem_ctx_persistence@engines-hang@vcs0.html>
>         (i915#2410 <https://gitlab.freedesktop.org/drm/intel/issues/2410>)
>  *
>
>     igt@gem_ctx_persistence@hostile:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb2/igt@gem_ctx_persistence@hostile.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>  *
>
>     igt@gem_eio@kms:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-11/igt@gem_eio@kms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@gem_eio@kms.html>
>         (i915#5784 <https://gitlab.freedesktop.org/drm/intel/issues/5784>)
>  *
>
>     igt@gem_eio@reset-stress:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-16/igt@gem_eio@reset-stress.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-15/igt@gem_eio@reset-stress.html>
>         (i915#5784 <https://gitlab.freedesktop.org/drm/intel/issues/5784>)
>  *
>
>     igt@gem_exec_fair@basic-none:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@gem_exec_fair@basic-none.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/intel/issues/3539> /
>         i915#4852
>         <https://gitlab.freedesktop.org/drm/intel/issues/4852>) +1
>         similar issue
>  *
>
>     igt@gem_exec_fair@basic-pace-share@rcs0:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-tglu-5/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>  *
>
>     igt@gem_exec_fair@basic-sync:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@gem_exec_fair@basic-sync.html>
>         (i915#4473
>         <https://gitlab.freedesktop.org/drm/intel/issues/4473> /
>         i915#4771 <https://gitlab.freedesktop.org/drm/intel/issues/4771>)
>  *
>
>     igt@gem_exec_flush@basic-uc-pro-default:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-17/igt@gem_exec_flush@basic-uc-pro-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/intel/issues/3539> /
>         i915#4852 <https://gitlab.freedesktop.org/drm/intel/issues/4852>)
>  *
>
>     igt@gem_exec_params@rsvd2-dirt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html>
>         (fdo#109283
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109283> /
>         i915#5107 <https://gitlab.freedesktop.org/drm/intel/issues/5107>)
>  *
>
>     igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +4
>         similar issues
>  *
>
>     igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +5
>         similar issues
>  *
>
>     igt@gem_exec_reloc@basic-write-read-active:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@gem_exec_reloc@basic-write-read-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +6
>         similar issues
>  *
>
>     igt@gem_exec_schedule@semaphore-power:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@gem_exec_schedule@semaphore-power.html>
>         (i915#7276 <https://gitlab.freedesktop.org/drm/intel/issues/7276>)
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@gem_exec_schedule@semaphore-power.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/intel/issues/4537> /
>         i915#4812
>         <https://gitlab.freedesktop.org/drm/intel/issues/4812>) +1
>         similar issue
>
>  *
>
>     igt@gem_exec_whisper@basic-contexts-forked-all:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-5/igt@gem_exec_whisper@basic-contexts-forked-all.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@gem_exec_whisper@basic-contexts-forked-all.html>
>         (i915#7392
>         <https://gitlab.freedesktop.org/drm/intel/issues/7392> /
>         i915#8628 <https://gitlab.freedesktop.org/drm/intel/issues/8628>)
>  *
>
>     igt@gem_exec_whisper@basic-fds-priority-all:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-tglu-2/igt@gem_exec_whisper@basic-fds-priority-all.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-4/igt@gem_exec_whisper@basic-fds-priority-all.html>
>         (i915#6755
>         <https://gitlab.freedesktop.org/drm/intel/issues/6755> /
>         i915#7392 <https://gitlab.freedesktop.org/drm/intel/issues/7392>)
>  *
>
>     igt@gem_fence_thrash@bo-copy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@gem_fence_thrash@bo-copy.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/intel/issues/4860>) +1
>         similar issue
>  *
>
>     igt@gem_fence_thrash@bo-write-verify-none:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@gem_fence_thrash@bo-write-verify-none.html>
>         (i915#4860 <https://gitlab.freedesktop.org/drm/intel/issues/4860>)
>  *
>
>     igt@gem_lmem_swapping@basic:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-6/igt@gem_lmem_swapping@basic.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +2
>         similar issues
>  *
>
>     igt@gem_lmem_swapping@verify-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@gem_lmem_swapping@verify-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1
>         similar issue
>  *
>
>     igt@gem_mmap@bad-offset:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-5/igt@gem_mmap@bad-offset.html>
>         (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
>  *
>
>     igt@gem_mmap_gtt@basic-read-write-distinct:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@gem_mmap_gtt@basic-read-write-distinct.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +3
>         similar issues
>  *
>
>     igt@gem_mmap_gtt@hang-user:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@gem_mmap_gtt@hang-user.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1
>         similar issue
>  *
>
>     igt@gem_mmap_wc@bad-object:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@gem_mmap_wc@bad-object.html>
>         (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
>  *
>
>     igt@gem_mmap_wc@set-cache-level:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@gem_mmap_wc@set-cache-level.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/intel/issues/4083>) +1
>         similar issue
>  *
>
>     igt@gem_partial_pwrite_pread@write-uncached:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-17/igt@gem_partial_pwrite_pread@write-uncached.html>
>         (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html>
>         (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +1
>         similar issue
>
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-off-3:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-3/igt@gem_pxp@reject-modify-context-protection-off-3.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +1
>         similar issue
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-off-3.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +1
>         similar issue
>
>  *
>
>     igt@gem_pxp@verify-pxp-stale-buf-execution:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@gem_pxp@verify-pxp-stale-buf-execution.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +2
>         similar issues
>  *
>
>     igt@gem_readwrite@write-bad-handle:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-6/igt@gem_readwrite@write-bad-handle.html>
>         (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>  *
>
>     igt@gem_render_copy@linear-to-vebox-y-tiled:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-2/igt@gem_render_copy@linear-to-vebox-y-tiled.html>
>         (i915#8428
>         <https://gitlab.freedesktop.org/drm/intel/issues/8428>) +3
>         similar issues
>  *
>
>     igt@gem_render_copy@y-tiled-to-vebox-linear:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@gem_render_copy@y-tiled-to-vebox-linear.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +3
>         similar issues
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html>
>         (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>)
>  *
>
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/intel/issues/3297> /
>         i915#4880 <https://gitlab.freedesktop.org/drm/intel/issues/4880>)
>  *
>
>     igt@gem_userptr_blits@nohangcheck:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-6/igt@gem_userptr_blits@nohangcheck.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-4/igt@gem_userptr_blits@nohangcheck.html>
>         (i915#6268 <https://gitlab.freedesktop.org/drm/intel/issues/6268>)
>  *
>
>     igt@gem_userptr_blits@readonly-pwrite-unsync:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html>
>         (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>  *
>
>     igt@gen7_exec_parse@basic-allocation:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@gen7_exec_parse@basic-allocation.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>  *
>
>     igt@gen9_exec_parse@bb-start-cmd:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-12/igt@gen9_exec_parse@bb-start-cmd.html>
>         (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>)
>  *
>
>     igt@gen9_exec_parse@secure-batches:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@gen9_exec_parse@secure-batches.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +1
>         similar issue
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-4/igt@gen9_exec_parse@secure-batches.html>
>         (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>)
>
>  *
>
>     igt@gen9_exec_parse@valid-registers:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@gen9_exec_parse@valid-registers.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +1
>         similar issue
>  *
>
>     igt@i915_module_load@reload-with-fault-injection:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html>
>         (i915#7061
>         <https://gitlab.freedesktop.org/drm/intel/issues/7061> /
>         i915#8617 <https://gitlab.freedesktop.org/drm/intel/issues/8617>)
>  *
>
>     igt@i915_module_load@resize-bar:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@i915_module_load@resize-bar.html>
>         (i915#6412 <https://gitlab.freedesktop.org/drm/intel/issues/6412>)
>  *
>
>     igt@i915_pipe_stress@stress-xrgb8888-untiled:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-8/igt@i915_pipe_stress@stress-xrgb8888-untiled.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@i915_pipe_stress@stress-xrgb8888-untiled.html>
>         (i915#8691 <https://gitlab.freedesktop.org/drm/intel/issues/8691>)
>  *
>
>     igt@i915_pm_dc@dc6-dpms:
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@i915_pm_dc@dc6-dpms.html>
>         (i915#3361 <https://gitlab.freedesktop.org/drm/intel/issues/3361>)
>
>      o
>
>         shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-tglu-9/igt@i915_pm_dc@dc6-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-10/igt@i915_pm_dc@dc6-dpms.html>
>         (i915#3989
>         <https://gitlab.freedesktop.org/drm/intel/issues/3989> /
>         i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>
>  *
>
>     igt@i915_pm_dc@dc6-psr:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-18/igt@i915_pm_dc@dc6-psr.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>  *
>
>     igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html>
>         (i915#1937 <https://gitlab.freedesktop.org/drm/intel/issues/1937>)
>  *
>
>     igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html>
>         (fdo#109506 <https://bugs.freedesktop.org/show_bug.cgi?id=109506>)
>  *
>
>     igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>  *
>
>     igt@i915_pm_rpm@modeset-non-lpsp:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp.html>
>         (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>  *
>
>     igt@i915_pm_rpm@modeset-non-lpsp-stress:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
>         (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>  *
>
>     igt@i915_pm_rps@min-max-config-loaded:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@i915_pm_rps@min-max-config-loaded.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>  *
>
>     igt@i915_selftest@live@sanitycheck:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-snb5/igt@i915_selftest@live@sanitycheck.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb2/igt@i915_selftest@live@sanitycheck.html>
>         (i915#4528 <https://gitlab.freedesktop.org/drm/intel/issues/4528>)
>  *
>
>     igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +1
>         similar issue
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs.html>
>         (i915#8502
>         <https://gitlab.freedesktop.org/drm/intel/issues/8502> /
>         i915#8709
>         <https://gitlab.freedesktop.org/drm/intel/issues/8709>) +11
>         similar issues
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs.html>
>         (i915#8502
>         <https://gitlab.freedesktop.org/drm/intel/issues/8502>) +3
>         similar issues
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs.html>
>         (i915#8502
>         <https://gitlab.freedesktop.org/drm/intel/issues/8502>) +7
>         similar issues
>  *
>
>     igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html>
>         (i915#8247
>         <https://gitlab.freedesktop.org/drm/intel/issues/8247>) +1
>         similar issue
>  *
>
>     igt@kms_async_flips@crc@pipe-c-hdmi-a-1:
>
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@kms_async_flips@crc@pipe-c-hdmi-a-1.html>
>         (i915#8247
>         <https://gitlab.freedesktop.org/drm/intel/issues/8247>) +3
>         similar issues
>  *
>
>     igt@kms_async_flips@invalid-async-flip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-3/igt@kms_async_flips@invalid-async-flip.html>
>         (i915#6228 <https://gitlab.freedesktop.org/drm/intel/issues/6228>)
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (i915#404 <https://gitlab.freedesktop.org/drm/intel/issues/404>)
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (i915#404 <https://gitlab.freedesktop.org/drm/intel/issues/404>)
>
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition.html>
>         (i915#1769 <https://gitlab.freedesktop.org/drm/intel/issues/1769>)
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html>
>         (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-0:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-8/igt@kms_big_fb@linear-8bpp-rotate-0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@kms_big_fb@linear-8bpp-rotate-0.html>
>         (i915#5138 <https://gitlab.freedesktop.org/drm/intel/issues/5138>)
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html>
>         (fdo#111614
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +2
>         similar issues
>  *
>
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +4
>         similar issues
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/intel/issues/4538> /
>         i915#5190
>         <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +1
>         similar issue
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>)
>
>  *
>
>     igt@kms_big_joiner@invalid-modeset:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@kms_big_joiner@invalid-modeset.html>
>         (i915#2705 <https://gitlab.freedesktop.org/drm/intel/issues/2705>)
>  *
>
>     igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html>
>         (i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886> /
>         i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +2
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354> /
>         i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +5
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_rc_ccs_cc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_rc_ccs_cc.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354> /
>         i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +1
>         similar issue
>  *
>
>     igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>  *
>
>     igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html>
>         (i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354> /
>         i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +1
>         similar issue
>  *
>
>     igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +2
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-6/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +4
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +11
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +16
>         similar issues
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (i915#3742 <https://gitlab.freedesktop.org/drm/intel/issues/3742>)
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html>
>         (i915#4087
>         <https://gitlab.freedesktop.org/drm/intel/issues/4087> /
>         i915#7213
>         <https://gitlab.freedesktop.org/drm/intel/issues/7213>) +3
>         similar issues
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html>
>         (i915#4087
>         <https://gitlab.freedesktop.org/drm/intel/issues/4087>) +3
>         similar issues
>  *
>
>     igt@kms_chamelium_color@ctm-0-75:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@kms_chamelium_color@ctm-0-75.html>
>         (fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
>  *
>
>     igt@kms_chamelium_color@ctm-blue-to-red:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@kms_chamelium_color@ctm-blue-to-red.html>
>         (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>  *
>
>     igt@kms_chamelium_color@ctm-green-to-red:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-6/igt@kms_chamelium_color@ctm-green-to-red.html>
>         (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>  *
>
>     igt@kms_chamelium_frames@dp-crc-fast:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@kms_chamelium_frames@dp-crc-fast.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +2
>         similar issues
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html>
>         (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>)
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-storm:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@kms_chamelium_hpd@dp-hpd-storm.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +2
>         similar issues
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html>
>         (i915#7828
>         <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +1
>         similar issue
>  *
>
>     igt@kms_color@deep-color:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@kms_color@deep-color.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +2
>         similar issues
>  *
>
>     igt@kms_content_protection@atomic@pipe-a-dp-4:
>
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html>
>         (i915#7173 <https://gitlab.freedesktop.org/drm/intel/issues/7173>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (i915#3299 <https://gitlab.freedesktop.org/drm/intel/issues/3299>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1.html>
>         (i915#3116 <https://gitlab.freedesktop.org/drm/intel/issues/3116>)
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@kms_content_protection@uevent.html>
>         (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x170:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x32:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-12/igt@kms_cursor_crc@cursor-sliding-32x32.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-max-size:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (i915#8814 <https://gitlab.freedesktop.org/drm/intel/issues/8814>)
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>)
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>  *
>
>     igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html>
>         (i915#8248 <https://gitlab.freedesktop.org/drm/intel/issues/8248>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html>
>         (i915#3546
>         <https://gitlab.freedesktop.org/drm/intel/issues/3546>) +1
>         similar issue
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html>
>         (fdo#111767
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111767> /
>         fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111767
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111767>) +2
>         similar issues
>  *
>
>     igt@kms_draw_crc@draw-method-mmap-wc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_draw_crc@draw-method-mmap-wc.html>
>         (i915#8812 <https://gitlab.freedesktop.org/drm/intel/issues/8812>)
>  *
>
>     igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html>
>         (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>  *
>
>     igt@kms_flip@2x-flip-vs-fences:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@kms_flip@2x-flip-vs-fences.html>
>         (i915#8381 <https://gitlab.freedesktop.org/drm/intel/issues/8381>)
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-6/igt@kms_flip@2x-flip-vs-suspend.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/intel/issues/3637>) +5
>         similar issues
>  *
>
>     igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +1
>         similar issue
>  *
>
>     igt@kms_flip@wf_vblank-ts-check@a-edp1:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html>
>         (i915#1982 <https://gitlab.freedesktop.org/drm/intel/issues/1982>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html>
>         (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +1
>         similar issue
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html>
>         (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +1
>         similar issue
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html>
>         (i915#6880 <https://gitlab.freedesktop.org/drm/intel/issues/6880>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +3
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +4
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +18
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html>
>         (i915#6880
>         <https://gitlab.freedesktop.org/drm/intel/issues/6880>) +1
>         similar issue
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         (i915#5460 <https://gitlab.freedesktop.org/drm/intel/issues/5460>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html>
>         (i915#3023
>         <https://gitlab.freedesktop.org/drm/intel/issues/3023>) +6
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html>
>         (fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +24
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/intel/issues/3458>) +6
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +121
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>         i915#1825
>         <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +13
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html>
>         (i915#3458 <https://gitlab.freedesktop.org/drm/intel/issues/3458>)
>  *
>
>     igt@kms_hdr@bpc-switch-suspend:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_hdr@bpc-switch-suspend.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#8228 <https://gitlab.freedesktop.org/drm/intel/issues/8228>)
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_hdr@invalid-hdr.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#8228 <https://gitlab.freedesktop.org/drm/intel/issues/8228>)
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-2/igt@kms_hdr@invalid-metadata-sizes.html>
>         (i915#8228 <https://gitlab.freedesktop.org/drm/intel/issues/8228>)
>  *
>
>     igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-4/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +2
>         similar issues
>  *
>
>     igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html>
>         (i915#1623 <https://gitlab.freedesktop.org/drm/intel/issues/1623>)
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@kms_plane_scaling@intel-max-src-size.html>
>         (i915#6953 <https://gitlab.freedesktop.org/drm/intel/issues/6953>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +11
>         similar issues
>  *
>
>     igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +3
>         similar issues
>  *
>
>     igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-a-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-a-hdmi-a-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +3
>         similar issues
>  *
>
>     igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1.html>
>         (i915#5176
>         <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +11
>         similar issues
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +1
>         similar issue
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +7
>         similar issues
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +3
>         similar issues
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html>
>         (i915#5235
>         <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +11
>         similar issues
>  *
>
>     igt@kms_prime@basic-crc-vgem:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@kms_prime@basic-crc-vgem.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/intel/issues/6524> /
>         i915#6805 <https://gitlab.freedesktop.org/drm/intel/issues/6805>)
>  *
>
>     igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-6/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>         i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>  *
>
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>  *
>
>     igt@kms_psr@cursor_blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_psr@cursor_blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +1
>         similar issue
>  *
>
>     igt@kms_psr@psr2_cursor_mmap_cpu:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-5/igt@kms_psr@psr2_cursor_mmap_cpu.html>
>         (fdo#110189
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110189>) +2
>         similar issues
>  *
>
>     igt@kms_psr@psr2_sprite_blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@kms_psr@psr2_sprite_blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3
>         similar issues
>  *
>
>     igt@kms_rotation_crc@bad-pixel-format:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@kms_rotation_crc@bad-pixel-format.html>
>         (i915#4235
>         <https://gitlab.freedesktop.org/drm/intel/issues/4235>) +5
>         similar issues
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html>
>         (i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (fdo#111615
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>         i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>  *
>
>     igt@kms_setmode@invalid-clone-single-crtc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_setmode@invalid-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@kms_tv_load_detect@load-detect.html>
>         (fdo#109309 <https://bugs.freedesktop.org/show_bug.cgi?id=109309>)
>  *
>
>     igt@kms_universal_plane@universal-plane-pipe-c-functional:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-4/igt@kms_universal_plane@universal-plane-pipe-c-functional.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#6768
>         <https://gitlab.freedesktop.org/drm/intel/issues/6768>) +2
>         similar issues
>  *
>
>     igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html>
>         (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>  *
>
>     igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html>
>         (fdo#103375
>         <https://bugs.freedesktop.org/show_bug.cgi?id=103375>) +3
>         similar issues
>  *
>
>     igt@kms_vblank@pipe-d-accuracy-idle:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@kms_vblank@pipe-d-accuracy-idle.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#533 <https://gitlab.freedesktop.org/drm/intel/issues/533>
>         / i915#6768
>         <https://gitlab.freedesktop.org/drm/intel/issues/6768>) +1
>         similar issue
>  *
>
>     igt@kms_vrr@flip-suspend:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-6/igt@kms_vrr@flip-suspend.html>
>         (i915#8808 <https://gitlab.freedesktop.org/drm/intel/issues/8808>)
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@kms_vrr@flipline.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>  *
>
>     igt@kms_writeback@writeback-invalid-parameters:
>
>      o
>
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_writeback@writeback-invalid-parameters.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>
>      o
>
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-6/igt@kms_writeback@writeback-invalid-parameters.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>
>  *
>
>     igt@perf@gen8-unprivileged-single-ctx-counters:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@perf@gen8-unprivileged-single-ctx-counters.html>
>         (i915#2436 <https://gitlab.freedesktop.org/drm/intel/issues/2436>)
>  *
>
>     igt@perf@global-sseu-config-invalid:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@perf@global-sseu-config-invalid.html>
>         (i915#7387 <https://gitlab.freedesktop.org/drm/intel/issues/7387>)
>  *
>
>     igt@prime_udl:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@prime_udl.html>
>         (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
>  *
>
>     igt@prime_vgem@basic-fence-mmap:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-6/igt@prime_vgem@basic-fence-mmap.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>         i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>)
>  *
>
>     igt@prime_vgem@fence-write-hang:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-6/igt@prime_vgem@fence-write-hang.html>
>         (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>  *
>
>     igt@runner@aborted:
>
>       o shard-snb: NOTRUN -> (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb7/igt@runner@aborted.html>)
>         (i915#7812
>         <https://gitlab.freedesktop.org/drm/intel/issues/7812> /
>         i915#8848 <https://gitlab.freedesktop.org/drm/intel/issues/8848>)
>  *
>
>     igt@sysfs_heartbeat_interval@nopreempt@vcs0:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html>
>         (i915#6015
>         <https://gitlab.freedesktop.org/drm/intel/issues/6015>) +5
>         similar issues
>  *
>
>     igt@v3d/v3d_submit_cl@bad-multisync-out-sync:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@v3d/v3d_submit_cl@bad-multisync-out-sync.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +5
>         similar issues
>  *
>
>     igt@v3d/v3d_submit_cl@bad-multisync-pad:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@v3d/v3d_submit_cl@bad-multisync-pad.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +4
>         similar issues
>  *
>
>     igt@v3d/v3d_submit_csd@valid-multisync-submission:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@v3d/v3d_submit_csd@valid-multisync-submission.html>
>         (fdo#109315
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109315>) +3
>         similar issues
>  *
>
>     igt@v3d/v3d_wait_bo@bad-pad:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-8/igt@v3d/v3d_wait_bo@bad-pad.html>
>         (fdo#109315
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109315> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +1
>         similar issue
>  *
>
>     igt@vc4/vc4_label_bo@set-bad-name:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@vc4/vc4_label_bo@set-bad-name.html>
>         (i915#7711
>         <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +2
>         similar issues
>  *
>
>     igt@vc4/vc4_tiling@get-bad-flags:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@vc4/vc4_tiling@get-bad-flags.html>
>         (i915#7711
>         <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +1
>         similar issue
>  *
>
>     igt@vc4/vc4_wait_bo@unused-bo-1ns:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@vc4/vc4_wait_bo@unused-bo-1ns.html>
>         (i915#7711
>         <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +3
>         similar issues
>
>
>         Possible fixes
>
>  *
>
>     igt@gem_ctx_exec@basic-nohangcheck:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html>
>         (i915#6268
>         <https://gitlab.freedesktop.org/drm/intel/issues/6268>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html>
>  *
>
>     igt@gem_ctx_persistence@saturated-hostile@vecs0:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-1/igt@gem_ctx_persistence@saturated-hostile@vecs0.html>
>         (i915#7816
>         <https://gitlab.freedesktop.org/drm/intel/issues/7816>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-7/igt@gem_ctx_persistence@saturated-hostile@vecs0.html>
>         +2 similar issues
>  *
>
>     igt@gem_eio@in-flight-10ms:
>
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-2/igt@gem_eio@in-flight-10ms.html>
>         (i915#8503
>         <https://gitlab.freedesktop.org/drm/intel/issues/8503>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@gem_eio@in-flight-10ms.html>
>  *
>
>     igt@gem_eio@unwedge-stress:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-19/igt@gem_eio@unwedge-stress.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/intel/issues/5784>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-17/igt@gem_eio@unwedge-stress.html>
>  *
>
>     igt@gem_exec_fair@basic-none-solo@rcs0:
>
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         +1 similar issue
>  *
>
>     igt@gem_exec_fair@basic-pace-share@rcs0:
>
>      o
>
>         shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>
>      o
>
>         shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>
>  *
>
>     igt@gem_exec_flush@basic-wb-ro-default:
>
>       o shard-snb: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-snb7/igt@gem_exec_flush@basic-wb-ro-default.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb4/igt@gem_exec_flush@basic-wb-ro-default.html>
>         +1 similar issue
>  *
>
>     igt@gem_mmap_offset@clear@smem0:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-14/igt@gem_mmap_offset@clear@smem0.html>
>         (i915#7962
>         <https://gitlab.freedesktop.org/drm/intel/issues/7962>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@gem_mmap_offset@clear@smem0.html>
>  *
>
>     igt@gem_ppgtt@blt-vs-render-ctxn:
>
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-snb6/igt@gem_ppgtt@blt-vs-render-ctxn.html>
>         (i915#8295
>         <https://gitlab.freedesktop.org/drm/intel/issues/8295>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb5/igt@gem_ppgtt@blt-vs-render-ctxn.html>
>  *
>
>     igt@gem_softpin@allocator-evict@vecs0:
>
>       o shard-dg1: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-13/igt@gem_softpin@allocator-evict@vecs0.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-14/igt@gem_softpin@allocator-evict@vecs0.html>
>  *
>
>     igt@i915_pm_rc6_residency@rc6-accuracy:
>
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-1/igt@i915_pm_rc6_residency@rc6-accuracy.html>
>         (fdo#109289
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109289> /
>         i915#8403
>         <https://gitlab.freedesktop.org/drm/intel/issues/8403>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@i915_pm_rc6_residency@rc6-accuracy.html>
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>
>       o shard-tglu: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>         (i915#2681
>         <https://gitlab.freedesktop.org/drm/intel/issues/2681>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>  *
>
>     igt@i915_pm_rpm@basic-pci-d3-state:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-13/igt@i915_pm_rpm@basic-pci-d3-state.html>
>         (i915#7691
>         <https://gitlab.freedesktop.org/drm/intel/issues/7691>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@i915_pm_rpm@basic-pci-d3-state.html>
>  *
>
>     igt@i915_pm_rpm@cursor:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-14/igt@i915_pm_rpm@cursor.html>
>         (i915#7940
>         <https://gitlab.freedesktop.org/drm/intel/issues/7940>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-12/igt@i915_pm_rpm@cursor.html>
>         +2 similar issues
>  *
>
>     igt@i915_pm_rpm@dpms-lpsp:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-13/igt@i915_pm_rpm@dpms-lpsp.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html>
>         +1 similar issue
>  *
>
>     igt@i915_pm_rpm@i2c:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-2/igt@i915_pm_rpm@i2c.html>
>         (i915#8717
>         <https://gitlab.freedesktop.org/drm/intel/issues/8717>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@i915_pm_rpm@i2c.html>
>  *
>
>     igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (i915#1397
>         <https://gitlab.freedesktop.org/drm/intel/issues/1397>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>  *
>
>     igt@i915_pm_rps@reset:
>
>      o
>
>         shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-11/igt@i915_pm_rps@reset.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@i915_pm_rps@reset.html>
>
>      o
>
>         shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-19/igt@i915_pm_rps@reset.html>
>         (i915#8229
>         <https://gitlab.freedesktop.org/drm/intel/issues/8229>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-14/igt@i915_pm_rps@reset.html>
>
>  *
>
>     igt@i915_selftest@live@gt_mocs:
>
>       o shard-mtlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-7/igt@i915_selftest@live@gt_mocs.html>
>         (i915#7059
>         <https://gitlab.freedesktop.org/drm/intel/issues/7059>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-4/igt@i915_selftest@live@gt_mocs.html>
>  *
>
>     igt@i915_selftest@live@workarounds:
>
>       o shard-mtlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-7/igt@i915_selftest@live@workarounds.html>
>         (i915#6763
>         <https://gitlab.freedesktop.org/drm/intel/issues/6763>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-4/igt@i915_selftest@live@workarounds.html>
>  *
>
>     igt@i915_suspend@basic-s3-without-i915:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html>
>         (fdo#103375
>         <https://bugs.freedesktop.org/show_bug.cgi?id=103375>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-3/igt@i915_suspend@basic-s3-without-i915.html>
>         +2 similar issues
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-glk5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html>
>         (i915#2521
>         <https://gitlab.freedesktop.org/drm/intel/issues/2521>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html>
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (i915#3743
>         <https://gitlab.freedesktop.org/drm/intel/issues/3743>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         +2 similar issues
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/intel/issues/2346>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html>
>         (i915#2122
>         <https://gitlab.freedesktop.org/drm/intel/issues/2122>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html>
>  *
>
>     igt@kms_plane@pixel-format@pipe-b-planes:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-7/igt@kms_plane@pixel-format@pipe-b-planes.html>
>         (i915#1623
>         <https://gitlab.freedesktop.org/drm/intel/issues/1623>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@kms_plane@pixel-format@pipe-b-planes.html>
>  *
>
>     igt@kms_psr@psr2_sprite_plane_move:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-6/igt@kms_psr@psr2_sprite_plane_move.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-2/igt@kms_psr@psr2_sprite_plane_move.html>
>  *
>
>     igt@perf_pmu@all-busy-idle-check-all:
>
>      o
>
>         shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-10/igt@perf_pmu@all-busy-idle-check-all.html>
>         (i915#5234
>         <https://gitlab.freedesktop.org/drm/intel/issues/5234>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-6/igt@perf_pmu@all-busy-idle-check-all.html>
>
>      o
>
>         shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-15/igt@perf_pmu@all-busy-idle-check-all.html>
>         (i915#5234
>         <https://gitlab.freedesktop.org/drm/intel/issues/5234>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-18/igt@perf_pmu@all-busy-idle-check-all.html>
>
>      o
>
>         shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html>
>         (i915#5234
>         <https://gitlab.freedesktop.org/drm/intel/issues/5234>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@perf_pmu@all-busy-idle-check-all.html>
>
>  *
>
>     igt@perf_pmu@busy-double-start@ccs1:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-5/igt@perf_pmu@busy-double-start@ccs1.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/intel/issues/4349>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@perf_pmu@busy-double-start@ccs1.html>
>         +9 similar issues
>  *
>
>     igt@perf_pmu@busy-double-start@vcs1:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-19/igt@perf_pmu@busy-double-start@vcs1.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/intel/issues/4349>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-12/igt@perf_pmu@busy-double-start@vcs1.html>
>         +3 similar issues
>  *
>
>     igt@perf_pmu@busy@rcs0:
>
>       o shard-rkl: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-1/igt@perf_pmu@busy@rcs0.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-6/igt@perf_pmu@busy@rcs0.html>
>  *
>
>     igt@perf_pmu@render-node-busy-idle@ccs0:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-8/igt@perf_pmu@render-node-busy-idle@ccs0.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/intel/issues/4349>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle@ccs0.html>
>         +3 similar issues
>  *
>
>     igt@sysfs_timeslice_duration@timeout@vecs0:
>
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-3/igt@sysfs_timeslice_duration@timeout@vecs0.html>
>         (i915#8521
>         <https://gitlab.freedesktop.org/drm/intel/issues/8521>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@sysfs_timeslice_duration@timeout@vecs0.html>
>
>
>         Warnings
>
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle@vecs0:
>
>       o shard-tglu: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html>
>         (i915#2681
>         <https://gitlab.freedesktop.org/drm/intel/issues/2681>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html>
>         (i915#2681
>         <https://gitlab.freedesktop.org/drm/intel/issues/2681> /
>         i915#3591 <https://gitlab.freedesktop.org/drm/intel/issues/3591>)
>  *
>
>     igt@kms_content_protection@mei_interface:
>
>      o
>
>         shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-3/igt@kms_content_protection@mei_interface.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/intel/issues/7118>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_content_protection@mei_interface.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/intel/issues/7118> /
>         i915#7162 <https://gitlab.freedesktop.org/drm/intel/issues/7162>)
>
>      o
>
>         shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-15/igt@kms_content_protection@mei_interface.html>
>         (fdo#109300
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109300>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@kms_content_protection@mei_interface.html>
>         (i915#7116 <https://gitlab.freedesktop.org/drm/intel/issues/7116>)
>
>  *
>
>     igt@kms_fbcon_fbt@psr:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-1/igt@kms_fbcon_fbt@psr.html>
>         (fdo#110189
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110189> /
>         i915#3955
>         <https://gitlab.freedesktop.org/drm/intel/issues/3955>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_fbcon_fbt@psr.html>
>         (i915#3955 <https://gitlab.freedesktop.org/drm/intel/issues/3955>)
>  *
>
>     igt@kms_force_connector_basic@force-load-detect:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html>
>         (fdo#109285
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109285>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html>
>         (fdo#109285
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109285> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#4816
>         <https://gitlab.freedesktop.org/drm/intel/issues/4816>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (i915#4816 <https://gitlab.freedesktop.org/drm/intel/issues/4816>)
>  *
>
>     igt@kms_psr@cursor_plane_move:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-18/igt@kms_psr@cursor_plane_move.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072> /
>         i915#4078
>         <https://gitlab.freedesktop.org/drm/intel/issues/4078>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-15/igt@kms_psr@cursor_plane_move.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +2
>         similar issues
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7418 -> IGTPW_9526
>
> CI-20190529: 20190529
> CI_DRM_13484: 987af50ac0ac94da778b87e53821b17ab6bf92f7 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_9526: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/index.html
> IGT_7418: 6fda79854b205a8110157b6915090680538a7249 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
--------------8jA88Hv846ikwQf2xQXuTaHS
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/7/2023 16:39, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:169141916792.13177.8949736778062550975@emeril.freedesktop.org">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>lib/xe_query: add helper getting available VRAM (rev4)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/121704/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/121704/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from IGT_7418_full -&gt; IGTPW_9526_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_9526_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_9526_full, please notify your bug team to
        allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/index.html</a></p>
      <h2>Participating hosts (9 -&gt; 9)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_9526_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_psr@psr2_primary_mmap_cpu:
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-8/igt@kms_psr@psr2_primary_mmap_cpu.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-4/igt@kms_psr@psr2_primary_mmap_cpu.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>Hello,<br>
      <br>
      Above fail is not related to introduced change.<br>
      <br>
      Regards,<br>
      Lukasz<br>
    </p>
    <blockquote type="cite" cite="mid:169141916792.13177.8949736778062550975@emeril.freedesktop.org">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>{igt@kms_dsc@dsc-with-output-formats-with-bpc}:
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_9526_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@api_intel_bb@blit-reloc-keep-cache.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411" moz-do-not-send="true">i915#8411</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@api_intel_bb@blit-reloc-purge-cache.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411" moz-do-not-send="true">i915#8411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@api_intel_bb@crc32:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-4/igt@api_intel_bb@crc32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6230" moz-do-not-send="true">i915#6230</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@debugfs_test@basic-hwmon:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@debugfs_test@basic-hwmon.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456" moz-do-not-send="true">i915#7456</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_buddy@drm_buddy_test:</p>
          <ul>
            <li>
              <p>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb5/igt@drm_buddy@drm_buddy_test.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8661" moz-do-not-send="true">i915#8661</a>)</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-6/igt@drm_buddy@drm_buddy_test.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8661" moz-do-not-send="true">i915#8661</a>) +1 similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@drm_fdinfo@most-busy-check-all@bcs0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414" moz-do-not-send="true">i915#8414</a>) +9 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@most-busy-idle-check-all@ccs0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-2/igt@drm_fdinfo@most-busy-idle-check-all@ccs0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414" moz-do-not-send="true">i915#8414</a>) +11 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-2/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742" moz-do-not-send="true">i915#7742</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_mm@drm_mm_test:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-6/igt@drm_mm@drm_mm_test.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8661" moz-do-not-send="true">i915#8661</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@feature_discovery@display-3x:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@feature_discovery@display-3x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839" moz-do-not-send="true">i915#1839</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-4/igt@feature_discovery@display-3x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839" moz-do-not-send="true">i915#1839</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_bad_reloc@negative-reloc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@gem_bad_reloc@negative-reloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281" moz-do-not-send="true">i915#3281</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098" moz-do-not-send="true">i915#4098</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325" moz-do-not-send="true">i915#5325</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@gem_ccs@suspend-resume.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5325" moz-do-not-send="true">i915#5325</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_exec@basic-nohangcheck:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-tglu-5/igt@gem_ctx_exec@basic-nohangcheck.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-8/igt@gem_ctx_exec@basic-nohangcheck.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268" moz-do-not-send="true">i915#6268</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@engines-hang@vcs0:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-6/igt@gem_ctx_persistence@engines-hang@vcs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@gem_ctx_persistence@engines-hang@vcs0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410" moz-do-not-send="true">i915#2410</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@hostile:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb2/igt@gem_ctx_persistence@hostile.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099" moz-do-not-send="true">i915#1099</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@kms:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-11/igt@gem_eio@kms.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@gem_eio@kms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784" moz-do-not-send="true">i915#5784</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@reset-stress:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-16/igt@gem_eio@reset-stress.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-15/igt@gem_eio@reset-stress.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784" moz-do-not-send="true">i915#5784</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@gem_exec_fair@basic-none.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539" moz-do-not-send="true">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852" moz-do-not-send="true">i915#4852</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-tglu-5/igt@gem_exec_fair@basic-pace-share@rcs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842" moz-do-not-send="true">i915#2842</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-sync:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@gem_exec_fair@basic-sync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473" moz-do-not-send="true">i915#4473</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4771" moz-do-not-send="true">i915#4771</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-uc-pro-default:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-17/igt@gem_exec_flush@basic-uc-pro-default.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539" moz-do-not-send="true">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852" moz-do-not-send="true">i915#4852</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_params@rsvd2-dirt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283" moz-do-not-send="true">fdo#109283</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5107" moz-do-not-send="true">i915#5107</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281" moz-do-not-send="true">i915#3281</a>) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281" moz-do-not-send="true">i915#3281</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-read-active:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@gem_exec_reloc@basic-write-read-active.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281" moz-do-not-send="true">i915#3281</a>) +6 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@semaphore-power:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@gem_exec_schedule@semaphore-power.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7276" moz-do-not-send="true">i915#7276</a>)</p>
            </li>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@gem_exec_schedule@semaphore-power.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537" moz-do-not-send="true">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812" moz-do-not-send="true">i915#4812</a>) +1 similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-5/igt@gem_exec_whisper@basic-contexts-forked-all.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@gem_exec_whisper@basic-contexts-forked-all.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7392" moz-do-not-send="true">i915#7392</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8628" moz-do-not-send="true">i915#8628</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-tglu-2/igt@gem_exec_whisper@basic-fds-priority-all.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-4/igt@gem_exec_whisper@basic-fds-priority-all.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6755" moz-do-not-send="true">i915#6755</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7392" moz-do-not-send="true">i915#7392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fence_thrash@bo-copy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@gem_fence_thrash@bo-copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860" moz-do-not-send="true">i915#4860</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fence_thrash@bo-write-verify-none:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@gem_fence_thrash@bo-write-verify-none.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860" moz-do-not-send="true">i915#4860</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@basic:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-6/igt@gem_lmem_swapping@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613" moz-do-not-send="true">i915#4613</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613" moz-do-not-send="true">i915#4613</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@gem_lmem_swapping@verify-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613" moz-do-not-send="true">i915#4613</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap@bad-offset:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-5/igt@gem_mmap@bad-offset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083" moz-do-not-send="true">i915#4083</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@basic-read-write-distinct:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@gem_mmap_gtt@basic-read-write-distinct.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077" moz-do-not-send="true">i915#4077</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@hang-user:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@gem_mmap_gtt@hang-user.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077" moz-do-not-send="true">i915#4077</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@bad-object:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@gem_mmap_wc@bad-object.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083" moz-do-not-send="true">i915#4083</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@set-cache-level:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@gem_mmap_wc@set-cache-level.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083" moz-do-not-send="true">i915#4083</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@write-uncached:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-17/igt@gem_partial_pwrite_pread@write-uncached.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282" moz-do-not-send="true">i915#3282</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282" moz-do-not-send="true">i915#3282</a>)</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282" moz-do-not-send="true">i915#3282</a>) +1 similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-3/igt@gem_pxp@reject-modify-context-protection-off-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270" moz-do-not-send="true">i915#4270</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-off-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270" moz-do-not-send="true">i915#4270</a>) +1 similar issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@gem_pxp@verify-pxp-stale-buf-execution.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270" moz-do-not-send="true">i915#4270</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_readwrite@write-bad-handle:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-6/igt@gem_readwrite@write-bad-handle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282" moz-do-not-send="true">i915#3282</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-2/igt@gem_render_copy@linear-to-vebox-y-tiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8428" moz-do-not-send="true">i915#8428</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@gem_render_copy@y-tiled-to-vebox-linear.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190" moz-do-not-send="true">i915#5190</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079" moz-do-not-send="true">i915#4079</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297" moz-do-not-send="true">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4880" moz-do-not-send="true">i915#4880</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@nohangcheck:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-6/igt@gem_userptr_blits@nohangcheck.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-4/igt@gem_userptr_blits@nohangcheck.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268" moz-do-not-send="true">i915#6268</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297" moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen7_exec_parse@basic-allocation:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@gen7_exec_parse@basic-allocation.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289" moz-do-not-send="true">fdo#109289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-start-cmd:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-12/igt@gen9_exec_parse@bb-start-cmd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527" moz-do-not-send="true">i915#2527</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@secure-batches:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@gen9_exec_parse@secure-batches.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856" moz-do-not-send="true">i915#2856</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-4/igt@gen9_exec_parse@secure-batches.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527" moz-do-not-send="true">i915#2527</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@valid-registers:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@gen9_exec_parse@valid-registers.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856" moz-do-not-send="true">i915#2856</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-with-fault-injection:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7061" moz-do-not-send="true">i915#7061</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8617" moz-do-not-send="true">i915#8617</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@resize-bar:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@i915_module_load@resize-bar.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6412" moz-do-not-send="true">i915#6412</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pipe_stress@stress-xrgb8888-untiled:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-8/igt@i915_pipe_stress@stress-xrgb8888-untiled.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@i915_pipe_stress@stress-xrgb8888-untiled.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8691" moz-do-not-send="true">i915#8691</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_dc@dc6-dpms:</p>
          <ul>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@i915_pm_dc@dc6-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3361" moz-do-not-send="true">i915#3361</a>)</p>
            </li>
            <li>
              <p>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-tglu-9/igt@i915_pm_dc@dc6-dpms.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-10/igt@i915_pm_dc@dc6-dpms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3989" moz-do-not-send="true">i915#3989</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/454" moz-do-not-send="true">i915#454</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-18/igt@i915_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658" moz-do-not-send="true">i915#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937" moz-do-not-send="true">i915#1937</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506" moz-do-not-send="true">fdo#109506</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397" moz-do-not-send="true">i915#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397" moz-do-not-send="true">i915#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397" moz-do-not-send="true">i915#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@min-max-config-loaded:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@i915_pm_rps@min-max-config-loaded.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621" moz-do-not-send="true">i915#6621</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@sanitycheck:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-snb5/igt@i915_selftest@live@sanitycheck.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb2/igt@i915_selftest@live@sanitycheck.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528" moz-do-not-send="true">i915#4528</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212" moz-do-not-send="true">i915#4212</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190" moz-do-not-send="true">i915#5190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8502" moz-do-not-send="true">i915#8502</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8709" moz-do-not-send="true">i915#8709</a>) +11 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8502" moz-do-not-send="true">i915#8502</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8502" moz-do-not-send="true">i915#8502</a>) +7 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@crc@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247" moz-do-not-send="true">i915#8247</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@crc@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@kms_async_flips@crc@pipe-c-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247" moz-do-not-send="true">i915#8247</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-3/igt@kms_async_flips@invalid-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6228" moz-do-not-send="true">i915#6228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/404" moz-do-not-send="true">i915#404</a>)</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/404" moz-do-not-send="true">i915#404</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769" moz-do-not-send="true">i915#1769</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286" moz-do-not-send="true">i915#5286</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-8/igt@kms_big_fb@linear-8bpp-rotate-0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@kms_big_fb@linear-8bpp-rotate-0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138" moz-do-not-send="true">i915#5138</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614" moz-do-not-send="true">fdo#111614</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615" moz-do-not-send="true">fdo#111615</a>) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538" moz-do-not-send="true">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190" moz-do-not-send="true">i915#5190</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723" moz-do-not-send="true">fdo#110723</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_joiner@invalid-modeset:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@kms_big_joiner@invalid-modeset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705" moz-do-not-send="true">i915#2705</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886" moz-do-not-send="true">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095" moz-do-not-send="true">i915#6095</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354" moz-do-not-send="true">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095" moz-do-not-send="true">i915#6095</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_rc_ccs_cc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_rc_ccs_cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354" moz-do-not-send="true">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095" moz-do-not-send="true">i915#6095</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354" moz-do-not-send="true">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095" moz-do-not-send="true">i915#6095</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886" moz-do-not-send="true">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354" moz-do-not-send="true">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095" moz-do-not-send="true">i915#6095</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689" moz-do-not-send="true">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886" moz-do-not-send="true">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354" moz-do-not-send="true">i915#5354</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-6/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689" moz-do-not-send="true">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354" moz-do-not-send="true">i915#5354</a>) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354" moz-do-not-send="true">i915#5354</a>) +11 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095" moz-do-not-send="true">i915#6095</a>) +16 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3742" moz-do-not-send="true">i915#3742</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087" moz-do-not-send="true">i915#4087</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7213" moz-do-not-send="true">i915#7213</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087" moz-do-not-send="true">i915#4087</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-75:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@kms_chamelium_color@ctm-0-75.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827" moz-do-not-send="true">fdo#111827</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@kms_chamelium_color@ctm-blue-to-red.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827" moz-do-not-send="true">fdo#111827</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-green-to-red:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-6/igt@kms_chamelium_color@ctm-green-to-red.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827" moz-do-not-send="true">fdo#111827</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-crc-fast:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@kms_chamelium_frames@dp-crc-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828" moz-do-not-send="true">i915#7828</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828" moz-do-not-send="true">i915#7828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@kms_chamelium_hpd@dp-hpd-storm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828" moz-do-not-send="true">i915#7828</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828" moz-do-not-send="true">i915#7828</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@deep-color:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@kms_color@deep-color.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555" moz-do-not-send="true">i915#3555</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173" moz-do-not-send="true">i915#7173</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299" moz-do-not-send="true">i915#3299</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116" moz-do-not-send="true">i915#3116</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@kms_content_protection@uevent.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118" moz-do-not-send="true">i915#7118</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359" moz-do-not-send="true">i915#3359</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x170:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359" moz-do-not-send="true">i915#3359</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-12/igt@kms_cursor_crc@cursor-sliding-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-max-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8814" moz-do-not-send="true">i915#8814</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274" moz-do-not-send="true">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103" moz-do-not-send="true">i915#4103</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8248" moz-do-not-send="true">i915#8248</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546" moz-do-not-send="true">i915#3546</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767" moz-do-not-send="true">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825" moz-do-not-send="true">fdo#111825</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767" moz-do-not-send="true">fdo#111767</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_draw_crc@draw-method-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8812" moz-do-not-send="true">i915#8812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274" moz-do-not-send="true">fdo#109274</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274" moz-do-not-send="true">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767" moz-do-not-send="true">fdo#111767</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79" moz-do-not-send="true">i915#79</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-fences:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@kms_flip@2x-flip-vs-fences.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381" moz-do-not-send="true">i915#8381</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-6/igt@kms_flip@2x-flip-vs-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637" moz-do-not-send="true">i915#3637</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825" moz-do-not-send="true">fdo#111825</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982" moz-do-not-send="true">i915#1982</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672" moz-do-not-send="true">i915#2672</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672" moz-do-not-send="true">i915#2672</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672" moz-do-not-send="true">i915#2672</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708" moz-do-not-send="true">i915#8708</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880" moz-do-not-send="true">i915#6880</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708" moz-do-not-send="true">i915#8708</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280" moz-do-not-send="true">fdo#109280</a>) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825" moz-do-not-send="true">i915#1825</a>) +18 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880" moz-do-not-send="true">i915#6880</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5460" moz-do-not-send="true">i915#5460</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023" moz-do-not-send="true">i915#3023</a>) +6 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825" moz-do-not-send="true">fdo#111825</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354" moz-do-not-send="true">i915#5354</a>) +24 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458" moz-do-not-send="true">i915#3458</a>) +6 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271" moz-do-not-send="true">fdo#109271</a>) +121 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825" moz-do-not-send="true">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825" moz-do-not-send="true">i915#1825</a>) +13 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458" moz-do-not-send="true">i915#3458</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-suspend:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_hdr@bpc-switch-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228" moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_hdr@invalid-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228" moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-metadata-sizes:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-2/igt@kms_hdr@invalid-metadata-sizes.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8228" moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-4/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289" moz-do-not-send="true">fdo#109289</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1623" moz-do-not-send="true">i915#1623</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953" moz-do-not-send="true">i915#6953</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176" moz-do-not-send="true">i915#5176</a>) +11 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176" moz-do-not-send="true">i915#5176</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-a-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176" moz-do-not-send="true">i915#5176</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-a-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176" moz-do-not-send="true">i915#5176</a>) +11 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235" moz-do-not-send="true">i915#5235</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235" moz-do-not-send="true">i915#5235</a>) +7 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235" moz-do-not-send="true">i915#5235</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235" moz-do-not-send="true">i915#5235</a>) +11 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-crc-vgem:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@kms_prime@basic-crc-vgem.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524" moz-do-not-send="true">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6805" moz-do-not-send="true">i915#6805</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-6/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068" moz-do-not-send="true">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658" moz-do-not-send="true">i915#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658" moz-do-not-send="true">i915#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@cursor_blt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_psr@cursor_blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072" moz-do-not-send="true">i915#1072</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-5/igt@kms_psr@psr2_cursor_mmap_cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189" moz-do-not-send="true">fdo#110189</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_sprite_blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@kms_psr@psr2_sprite_blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072" moz-do-not-send="true">i915#1072</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-pixel-format:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@kms_rotation_crc@bad-pixel-format.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235" moz-do-not-send="true">i915#4235</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289" moz-do-not-send="true">i915#5289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615" moz-do-not-send="true">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289" moz-do-not-send="true">i915#5289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-single-crtc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_setmode@invalid-clone-single-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098" moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@kms_tv_load_detect@load-detect.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309" moz-do-not-send="true">fdo#109309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@universal-plane-pipe-c-functional:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-4/igt@kms_universal_plane@universal-plane-pipe-c-functional.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070" moz-do-not-send="true">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768" moz-do-not-send="true">i915#6768</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html" moz-do-not-send="true">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375" moz-do-not-send="true">fdo#103375</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html" moz-do-not-send="true">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375" moz-do-not-send="true">fdo#103375</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-d-accuracy-idle:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@kms_vblank@pipe-d-accuracy-idle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070" moz-do-not-send="true">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533" moz-do-not-send="true">i915#533</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768" moz-do-not-send="true">i915#6768</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-suspend:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-6/igt@kms_vrr@flip-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8808" moz-do-not-send="true">i915#8808</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flipline:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@kms_vrr@flipline.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-invalid-parameters:</p>
          <ul>
            <li>
              <p>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_writeback@writeback-invalid-parameters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437" moz-do-not-send="true">i915#2437</a>)</p>
            </li>
            <li>
              <p>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-6/igt@kms_writeback@writeback-invalid-parameters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437" moz-do-not-send="true">i915#2437</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@perf@gen8-unprivileged-single-ctx-counters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2436" moz-do-not-send="true">i915#2436</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@global-sseu-config-invalid:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-8/igt@perf@global-sseu-config-invalid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7387" moz-do-not-send="true">i915#7387</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_udl:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-1/igt@prime_udl.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291" moz-do-not-send="true">fdo#109291</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-mmap:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-6/igt@prime_vgem@basic-fence-mmap.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708" moz-do-not-send="true">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077" moz-do-not-send="true">i915#4077</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@fence-write-hang:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-6/igt@prime_vgem@fence-write-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@runner@aborted:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb7/igt@runner@aborted.html" moz-do-not-send="true">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb7/igt@runner@aborted.html" moz-do-not-send="true">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb7/igt@runner@aborted.html" moz-do-not-send="true">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7812" moz-do-not-send="true">i915#7812</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8848" moz-do-not-send="true">i915#8848</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sysfs_heartbeat_interval@nopreempt@vcs0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6015" moz-do-not-send="true">i915#6015</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_submit_cl@bad-multisync-out-sync:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-2/igt@v3d/v3d_submit_cl@bad-multisync-out-sync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575" moz-do-not-send="true">i915#2575</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_submit_cl@bad-multisync-pad:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@v3d/v3d_submit_cl@bad-multisync-pad.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575" moz-do-not-send="true">i915#2575</a>) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_submit_csd@valid-multisync-submission:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@v3d/v3d_submit_csd@valid-multisync-submission.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315" moz-do-not-send="true">fdo#109315</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@v3d/v3d_wait_bo@bad-pad:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-8/igt@v3d/v3d_wait_bo@bad-pad.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315" moz-do-not-send="true">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575" moz-do-not-send="true">i915#2575</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_label_bo@set-bad-name:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@vc4/vc4_label_bo@set-bad-name.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711" moz-do-not-send="true">i915#7711</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_tiling@get-bad-flags:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@vc4/vc4_tiling@get-bad-flags.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711" moz-do-not-send="true">i915#7711</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@vc4/vc4_wait_bo@unused-bo-1ns:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@vc4/vc4_wait_bo@unused-bo-1ns.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711" moz-do-not-send="true">i915#7711</a>) +3 similar issues</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@gem_ctx_exec@basic-nohangcheck:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268" moz-do-not-send="true">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@saturated-hostile@vecs0:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-1/igt@gem_ctx_persistence@saturated-hostile@vecs0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7816" moz-do-not-send="true">i915#7816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-7/igt@gem_ctx_persistence@saturated-hostile@vecs0.html" moz-do-not-send="true">PASS</a> +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@in-flight-10ms:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-2/igt@gem_eio@in-flight-10ms.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8503" moz-do-not-send="true">i915#8503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-1/igt@gem_eio@in-flight-10ms.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@unwedge-stress:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-19/igt@gem_eio@unwedge-stress.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784" moz-do-not-send="true">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-17/igt@gem_eio@unwedge-stress.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
          <ul>
            <li>shard-apl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842" moz-do-not-send="true">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html" moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
          <ul>
            <li>
              <p>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842" moz-do-not-send="true">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html" moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842" moz-do-not-send="true">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html" moz-do-not-send="true">PASS</a></p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-wb-ro-default:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-snb7/igt@gem_exec_flush@basic-wb-ro-default.html" moz-do-not-send="true">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb4/igt@gem_exec_flush@basic-wb-ro-default.html" moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_offset@clear@smem0:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-14/igt@gem_mmap_offset@clear@smem0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7962" moz-do-not-send="true">i915#7962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@gem_mmap_offset@clear@smem0.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ppgtt@blt-vs-render-ctxn:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-snb6/igt@gem_ppgtt@blt-vs-render-ctxn.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8295" moz-do-not-send="true">i915#8295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-snb5/igt@gem_ppgtt@blt-vs-render-ctxn.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@allocator-evict@vecs0:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-13/igt@gem_softpin@allocator-evict@vecs0.html" moz-do-not-send="true">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-14/igt@gem_softpin@allocator-evict@vecs0.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-1/igt@i915_pm_rc6_residency@rc6-accuracy.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289" moz-do-not-send="true">fdo#109289</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8403" moz-do-not-send="true">i915#8403</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@i915_pm_rc6_residency@rc6-accuracy.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html" moz-do-not-send="true">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681" moz-do-not-send="true">i915#2681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-13/igt@i915_pm_rpm@basic-pci-d3-state.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7691" moz-do-not-send="true">i915#7691</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@i915_pm_rpm@basic-pci-d3-state.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@cursor:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-14/igt@i915_pm_rpm@cursor.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940" moz-do-not-send="true">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-12/igt@i915_pm_rpm@cursor.html" moz-do-not-send="true">PASS</a> +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@dpms-lpsp:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-13/igt@i915_pm_rpm@dpms-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397" moz-do-not-send="true">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html" moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@i2c:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-2/igt@i915_pm_rpm@i2c.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8717" moz-do-not-send="true">i915#8717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@i915_pm_rpm@i2c.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397" moz-do-not-send="true">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@reset:</p>
          <ul>
            <li>
              <p>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-11/igt@i915_pm_rps@reset.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-8/igt@i915_pm_rps@reset.html" moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-19/igt@i915_pm_rps@reset.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8229" moz-do-not-send="true">i915#8229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-14/igt@i915_pm_rps@reset.html" moz-do-not-send="true">PASS</a></p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@gt_mocs:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-7/igt@i915_selftest@live@gt_mocs.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059" moz-do-not-send="true">i915#7059</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-4/igt@i915_selftest@live@gt_mocs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@workarounds:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-7/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6763" moz-do-not-send="true">i915#6763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-4/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@basic-s3-without-i915:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html" moz-do-not-send="true">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375" moz-do-not-send="true">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-3/igt@i915_suspend@basic-s3-without-i915.html" moz-do-not-send="true">PASS</a> +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-glk5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521" moz-do-not-send="true">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743" moz-do-not-send="true">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">PASS</a> +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-apl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346" moz-do-not-send="true">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122" moz-do-not-send="true">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format@pipe-b-planes:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-7/igt@kms_plane@pixel-format@pipe-b-planes.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1623" moz-do-not-send="true">i915#1623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@kms_plane@pixel-format@pipe-b-planes.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_sprite_plane_move:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-6/igt@kms_psr@psr2_sprite_plane_move.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-2/igt@kms_psr@psr2_sprite_plane_move.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@all-busy-idle-check-all:</p>
          <ul>
            <li>
              <p>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-10/igt@perf_pmu@all-busy-idle-check-all.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5234" moz-do-not-send="true">i915#5234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-6/igt@perf_pmu@all-busy-idle-check-all.html" moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-15/igt@perf_pmu@all-busy-idle-check-all.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5234" moz-do-not-send="true">i915#5234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-18/igt@perf_pmu@all-busy-idle-check-all.html" moz-do-not-send="true">PASS</a></p>
            </li>
            <li>
              <p>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5234" moz-do-not-send="true">i915#5234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@perf_pmu@all-busy-idle-check-all.html" moz-do-not-send="true">PASS</a></p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-double-start@ccs1:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-5/igt@perf_pmu@busy-double-start@ccs1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349" moz-do-not-send="true">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-1/igt@perf_pmu@busy-double-start@ccs1.html" moz-do-not-send="true">PASS</a> +9 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-double-start@vcs1:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-19/igt@perf_pmu@busy-double-start@vcs1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349" moz-do-not-send="true">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-12/igt@perf_pmu@busy-double-start@vcs1.html" moz-do-not-send="true">PASS</a> +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy@rcs0:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-1/igt@perf_pmu@busy@rcs0.html" moz-do-not-send="true">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-6/igt@perf_pmu@busy@rcs0.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@render-node-busy-idle@ccs0:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-8/igt@perf_pmu@render-node-busy-idle@ccs0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349" moz-do-not-send="true">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle@ccs0.html" moz-do-not-send="true">PASS</a> +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-mtlp-3/igt@sysfs_timeslice_duration@timeout@vecs0.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8521" moz-do-not-send="true">i915#8521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-mtlp-5/igt@sysfs_timeslice_duration@timeout@vecs0.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html" moz-do-not-send="true">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681" moz-do-not-send="true">i915#2681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681" moz-do-not-send="true">i915#2681</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3591" moz-do-not-send="true">i915#3591</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei_interface:</p>
          <ul>
            <li>
              <p>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg2-3/igt@kms_content_protection@mei_interface.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118" moz-do-not-send="true">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg2-11/igt@kms_content_protection@mei_interface.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7162" moz-do-not-send="true">i915#7162</a>)</p>
            </li>
            <li>
              <p>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-15/igt@kms_content_protection@mei_interface.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109300" moz-do-not-send="true">fdo#109300</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-19/igt@kms_content_protection@mei_interface.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7116" moz-do-not-send="true">i915#7116</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-1/igt@kms_fbcon_fbt@psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189" moz-do-not-send="true">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955" moz-do-not-send="true">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_fbcon_fbt@psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955" moz-do-not-send="true">i915#3955</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-load-detect:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285" moz-do-not-send="true">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html" moz-do-not-send="true">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285" moz-do-not-send="true">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098" moz-do-not-send="true">i915#4098</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070" moz-do-not-send="true">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4816" moz-do-not-send="true">i915#4816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4816" moz-do-not-send="true">i915#4816</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@cursor_plane_move:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7418/shard-dg1-18/igt@kms_psr@cursor_plane_move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078" moz-do-not-send="true">i915#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/shard-dg1-15/igt@kms_psr@cursor_plane_move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072" moz-do-not-send="true">i915#1072</a>) +2 similar issues</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_7418 -&gt; IGTPW_9526</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_13484: 987af50ac0ac94da778b87e53821b17ab6bf92f7 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_9526:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9526/index.html</a><br>
        IGT_7418: 6fda79854b205a8110157b6915090680538a7249 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a></p>
    </blockquote>
  </body>
</html>

--------------8jA88Hv846ikwQf2xQXuTaHS--
