Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E914810E002
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 06:35:15 +0000 (UTC)
Message-ID: <9ac8ab20-df83-a9f5-f61c-1f9f6df9984c@intel.com>
Date: Thu, 29 Jun 2023 08:34:45 +0200
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <cover.1687862551.git.karolina.stolarek@intel.com>
 <168798870032.32037.11600086110540368651@emeril.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <168798870032.32037.11600086110540368651@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVXNlIGlu?=
 =?utf-8?q?tel=5Fcmds=5Finfo_in_i915=5Fpm=5Frpm_=28rev3=29?=
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

On 28.06.2023 23:45, Patchwork wrote:
> *Patch Details*
> *Series:*	Use intel_cmds_info in i915_pm_rpm (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/118102/ 
> <https://patchwork.freedesktop.org/series/118102/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7352_full -> IGTPW_9286_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_9286_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_9286_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/index.html
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
> IGTPW_9286_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@gem_create@busy-create@lmem0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-dg2-7/igt@gem_create@busy-create@lmem0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-8/igt@gem_create@busy-create@lmem0.html>
>   *
> 
>     igt@kms_flip@flip-vs-panning-interruptible@b-edp1:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-2/igt@kms_flip@flip-vs-panning-interruptible@b-edp1.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-5/igt@kms_flip@flip-vs-panning-interruptible@b-edp1.html>
> 

Not related to my changes.

All the best,
Karolina

> 
>     New tests
> 
> New tests have been introduced between IGT_7352_full and IGTPW_9286_full:
> 
> 
>       New IGT tests (3)
> 
>   *
> 
>     igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-hdmi-a-3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_9286_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@api_intel_bb@object-reloc-purge-cache:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-5/igt@api_intel_bb@object-reloc-purge-cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/intel/issues/8411>) +1 similar issue
>   *
> 
>     igt@device_reset@cold-reset-bound:
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-9/igt@device_reset@cold-reset-bound.html> (i915#7701 <https://gitlab.freedesktop.org/drm/intel/issues/7701>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-2/igt@device_reset@cold-reset-bound.html> (i915#7701 <https://gitlab.freedesktop.org/drm/intel/issues/7701>)
> 
>   *
> 
>     igt@drm_fdinfo@busy-idle@bcs0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-5/igt@drm_fdinfo@busy-idle@bcs0.html> (i915#8414 <https://gitlab.freedesktop.org/drm/intel/issues/8414>) +4 similar issues
>   *
> 
>     igt@drm_fdinfo@busy-idle@ccs0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-5/igt@drm_fdinfo@busy-idle@ccs0.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#8414 <https://gitlab.freedesktop.org/drm/intel/issues/8414>)
>   *
> 
>     igt@feature_discovery@chamelium:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-1/igt@feature_discovery@chamelium.html> (i915#4854 <https://gitlab.freedesktop.org/drm/intel/issues/4854>)
>   *
> 
>     igt@feature_discovery@display-3x:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-2/igt@feature_discovery@display-3x.html> (i915#1839 <https://gitlab.freedesktop.org/drm/intel/issues/1839>)
>   *
> 
>     igt@gem_basic@multigpu-create-close:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-6/igt@gem_basic@multigpu-create-close.html> (i915#7697 <https://gitlab.freedesktop.org/drm/intel/issues/7697>)
>   *
> 
>     igt@gem_caching@writes:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-2/igt@gem_caching@writes.html> (i915#4873 <https://gitlab.freedesktop.org/drm/intel/issues/4873>) +1 similar issue
>   *
> 
>     igt@gem_create@create-ext-cpu-access-big:
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-2/igt@gem_create@create-ext-cpu-access-big.html> (i915#6335 <https://gitlab.freedesktop.org/drm/intel/issues/6335>)
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-7/igt@gem_create@create-ext-cpu-access-big.html> (i915#6335 <https://gitlab.freedesktop.org/drm/intel/issues/6335>)
> 
>   *
> 
>     igt@gem_ctx_param@set-priority-not-supported:
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-2/igt@gem_ctx_param@set-priority-not-supported.html> (fdo#109314 <https://bugs.freedesktop.org/show_bug.cgi?id=109314>)
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-3/igt@gem_ctx_param@set-priority-not-supported.html> (fdo#109314 <https://bugs.freedesktop.org/show_bug.cgi?id=109314>)
> 
>   *
> 
>     igt@gem_eio@hibernate:
> 
>       o shard-dg2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-1/igt@gem_eio@hibernate.html> (i915#7975 <https://gitlab.freedesktop.org/drm/intel/issues/7975> / i915#8213 <https://gitlab.freedesktop.org/drm/intel/issues/8213>)
>   *
> 
>     igt@gem_exec_balancer@bonded-dual:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-7/igt@gem_exec_balancer@bonded-dual.html> (i915#4771 <https://gitlab.freedesktop.org/drm/intel/issues/4771>) +1 similar issue
>   *
> 
>     igt@gem_exec_balancer@parallel-bb-first:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-4/igt@gem_exec_balancer@parallel-bb-first.html> (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>   *
> 
>     igt@gem_exec_fair@basic-none-share@rcs0:
> 
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-10/igt@gem_exec_fair@basic-none-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-tglu-6/igt@gem_exec_fair@basic-pace-share@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-7/igt@gem_exec_fair@basic-pace-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-rkl-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-1/igt@gem_exec_fair@basic-pace-solo@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +2 similar issues
>   *
> 
>     igt@gem_exec_fair@basic-sync:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-5/igt@gem_exec_fair@basic-sync.html> (i915#4473 <https://gitlab.freedesktop.org/drm/intel/issues/4473> / i915#4771 <https://gitlab.freedesktop.org/drm/intel/issues/4771>) +1 similar issue
>   *
> 
>     igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html> (fdo#109313 <https://bugs.freedesktop.org/show_bug.cgi?id=109313>)
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-9/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html> (fdo#109313 <https://bugs.freedesktop.org/show_bug.cgi?id=109313>)
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html> (i915#3711 <https://gitlab.freedesktop.org/drm/intel/issues/3711>)
> 
>   *
> 
>     igt@gem_exec_gttfill@multigpu-basic:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-6/igt@gem_exec_gttfill@multigpu-basic.html> (i915#7697 <https://gitlab.freedesktop.org/drm/intel/issues/7697>)
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +3 similar issues
>   *
> 
>     igt@gem_exec_reloc@basic-write-cpu-active:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-5/igt@gem_exec_reloc@basic-write-cpu-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +3 similar issues
>   *
> 
>     igt@gem_exec_reloc@basic-write-read:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-11/igt@gem_exec_reloc@basic-write-read.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>)
>   *
> 
>     igt@gem_exec_schedule@preempt-queue-chain:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-6/igt@gem_exec_schedule@preempt-queue-chain.html> (i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>)
>   *
> 
>     igt@gem_exec_whisper@basic-normal:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-4/igt@gem_exec_whisper@basic-normal.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-5/igt@gem_exec_whisper@basic-normal.html> (i915#6363 <https://gitlab.freedesktop.org/drm/intel/issues/6363>)
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-2/igt@gem_huc_copy@huc-copy.html> (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-9/igt@gem_huc_copy@huc-copy.html> (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
> 
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-verify:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-2/igt@gem_lmem_swapping@parallel-random-verify.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1 similar issue
>   *
> 
>     igt@gem_lmem_swapping@smem-oom:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-3/igt@gem_lmem_swapping@smem-oom.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1 similar issue
>   *
> 
>     igt@gem_mmap_gtt@hang-user:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-2/igt@gem_mmap_gtt@hang-user.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +8 similar issues
>   *
> 
>     igt@gem_mmap_wc@set-cache-level:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-5/igt@gem_mmap_wc@set-cache-level.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>) +4 similar issues
>   *
> 
>     igt@gem_pwrite@basic-self:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-5/igt@gem_pwrite@basic-self.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>   *
> 
>     igt@gem_pxp@create-regular-buffer:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-3/igt@gem_pxp@create-regular-buffer.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>   *
> 
>     igt@gem_pxp@regular-baseline-src-copy-readible:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-9/igt@gem_pxp@regular-baseline-src-copy-readible.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>   *
> 
>     igt@gem_pxp@reject-modify-context-protection-off-2:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-8/igt@gem_pxp@reject-modify-context-protection-off-2.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>   *
> 
>     igt@gem_readwrite@new-obj:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-2/igt@gem_readwrite@new-obj.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +2 similar issues
>   *
> 
>     igt@gem_render_copy@y-tiled-to-vebox-linear:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-2/igt@gem_render_copy@y-tiled-to-vebox-linear.html> (i915#8428 <https://gitlab.freedesktop.org/drm/intel/issues/8428>) +3 similar issues
>   *
> 
>     igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html> (i915#8411 <https://gitlab.freedesktop.org/drm/intel/issues/8411>) +1 similar issue
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1 similar issue
> 
>   *
> 
>     igt@gem_softpin@evict-snoop:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-3/igt@gem_softpin@evict-snoop.html> (fdo#109312 <https://bugs.freedesktop.org/show_bug.cgi?id=109312>)
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-2/igt@gem_softpin@evict-snoop.html> (fdo#109312 <https://bugs.freedesktop.org/show_bug.cgi?id=109312>)
> 
>   *
> 
>     igt@gem_tiled_blits@basic:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-5/igt@gem_tiled_blits@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 similar issue
>   *
> 
>     igt@gem_userptr_blits@access-control:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-6/igt@gem_userptr_blits@access-control.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@coherency-sync:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-10/igt@gem_userptr_blits@coherency-sync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@readonly-unsync:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-1/igt@gem_userptr_blits@readonly-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>   *
> 
>     igt@gen7_exec_parse@basic-allocation:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-1/igt@gen7_exec_parse@basic-allocation.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>   *
> 
>     igt@gen9_exec_parse@basic-rejected:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-2/igt@gen9_exec_parse@basic-rejected.html> (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +1 similar issue
>   *
> 
>     igt@gen9_exec_parse@bb-start-far:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-9/igt@gen9_exec_parse@bb-start-far.html> (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527> / i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>   *
> 
>     igt@i915_pm_backlight@fade-with-dpms:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-7/igt@i915_pm_backlight@fade-with-dpms.html> (i915#7561 <https://gitlab.freedesktop.org/drm/intel/issues/7561>)
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-2/igt@i915_pm_backlight@fade-with-dpms.html> (i915#7561 <https://gitlab.freedesktop.org/drm/intel/issues/7561>)
> 
>   *
> 
>     igt@i915_pm_dc@dc6-dpms:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-tglu-10/igt@i915_pm_dc@dc6-dpms.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-3/igt@i915_pm_dc@dc6-dpms.html> (i915#3989 <https://gitlab.freedesktop.org/drm/intel/issues/3989> / i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>   *
> 
>     igt@i915_pm_dc@dc6-psr:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-3/igt@i915_pm_dc@dc6-psr.html> (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-tglu-2/igt@i915_pm_dc@dc9-dpms.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-6/igt@i915_pm_dc@dc9-dpms.html> (i915#4281 <https://gitlab.freedesktop.org/drm/intel/issues/4281>)
>   *
> 
>     igt@i915_pm_freq_api@freq-reset:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-7/igt@i915_pm_freq_api@freq-reset.html> (i915#8399 <https://gitlab.freedesktop.org/drm/intel/issues/8399>)
>   *
> 
>     igt@i915_pm_rpm@dpms-mode-unset-lpsp:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-1/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) +1 similar issue
>   *
> 
>     igt@i915_pm_rpm@modeset-lpsp-stress:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-2/igt@i915_pm_rpm@modeset-lpsp-stress.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>   *
> 
>     igt@i915_selftest@live@gt_heartbeat:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-apl3/igt@i915_selftest@live@gt_heartbeat.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html> (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-3/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs-cc:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs-cc.html> (i915#8502 <https://gitlab.freedesktop.org/drm/intel/issues/8502>) +7 similar issues
>   *
> 
>     igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-6/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html> (i915#8247 <https://gitlab.freedesktop.org/drm/intel/issues/8247>) +3 similar issues
>   *
> 
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html> (i915#404 <https://gitlab.freedesktop.org/drm/intel/issues/404>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html> (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +2 similar issues
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-10/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> / i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +2 similar issues
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (i915#5138 <https://gitlab.freedesktop.org/drm/intel/issues/5138>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (i915#3743 <https://gitlab.freedesktop.org/drm/intel/issues/3743>) +2 similar issues
>   *
> 
>     igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-3/igt@kms_big_fb@linear-16bpp-rotate-90.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +1 similar issue
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-90:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614> / i915#3638 <https://gitlab.freedesktop.org/drm/intel/issues/3638>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +2 similar issues
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +6 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html> (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>) +1 similar issue
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
> 
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> (i915#4538 <https://gitlab.freedesktop.org/drm/intel/issues/4538> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +1 similar issue
>   *
> 
>     igt@kms_big_joiner@2x-modeset:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-3/igt@kms_big_joiner@2x-modeset.html> (i915#2705 <https://gitlab.freedesktop.org/drm/intel/issues/2705>)
>   *
> 
>     igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-3/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs.html> (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +10 similar issues
>   *
> 
>     igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-6/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs.html> (i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>   *
> 
>     igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-1/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +2 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-3/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>)
>   *
> 
>     igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_mc_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +2 similar issues
>   *
> 
>     igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +1 similar issue
>   *
> 
>     igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-6/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +9 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_mtl_rc_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-5/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_mtl_rc_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +5 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +10 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-5/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html> (i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +6 similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-7/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +3 similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-5/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> / i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>   *
> 
>     igt@kms_cdclk@mode-transition:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-8/igt@kms_cdclk@mode-transition.html> (i915#3742 <https://gitlab.freedesktop.org/drm/intel/issues/3742>)
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-b-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-5/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html> (i915#7213 <https://gitlab.freedesktop.org/drm/intel/issues/7213>) +2 similar issues
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-c-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-c-hdmi-a-3.html> (i915#4087 <https://gitlab.freedesktop.org/drm/intel/issues/4087>) +5 similar issues
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-5/igt@kms_cdclk@mode-transition@pipe-d-edp-1.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#7213 <https://gitlab.freedesktop.org/drm/intel/issues/7213>)
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html> (i915#4087 <https://gitlab.freedesktop.org/drm/intel/issues/4087> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +1 similar issue
>   *
> 
>     igt@kms_chamelium_color@ctm-0-75:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-1/igt@kms_chamelium_color@ctm-0-75.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>   *
> 
>     igt@kms_chamelium_color@ctm-negative:
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-5/igt@kms_chamelium_color@ctm-negative.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-6/igt@kms_chamelium_color@ctm-negative.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>   *
> 
>     igt@kms_chamelium_frames@dp-frame-dump:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-6/igt@kms_chamelium_frames@dp-frame-dump.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +2 similar issues
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +2 similar issues
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-storm-disable:
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-9/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +2 similar issues
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-7/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +3 similar issues
> 
>   *
> 
>     igt@kms_content_protection@lic@pipe-a-dp-4:
> 
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-11/igt@kms_content_protection@lic@pipe-a-dp-4.html> (i915#7173 <https://gitlab.freedesktop.org/drm/intel/issues/7173>) +1 similar issue
>   *
> 
>     igt@kms_content_protection@mei_interface:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-1/igt@kms_content_protection@mei_interface.html> (i915#8063 <https://gitlab.freedesktop.org/drm/intel/issues/8063>)
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o
> 
>         shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-5/igt@kms_content_protection@srm.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-4/igt@kms_content_protection@srm.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#6944 <https://gitlab.freedesktop.org/drm/intel/issues/6944> / i915#7116 <https://gitlab.freedesktop.org/drm/intel/issues/7116> / i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>) +1 similar issue
> 
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html> (fdo#109279 <https://bugs.freedesktop.org/show_bug.cgi?id=109279> / i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-32x32:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-7/igt@kms_cursor_crc@cursor-random-32x32.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +1 similar issue
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x512:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-10/igt@kms_cursor_crc@cursor-random-512x512.html> (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>       o
> 
>         shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +5 similar issues
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +2 similar issues
> 
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html> (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-dg2-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>) +2 similar issues
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1 similar issue
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-3/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html> (i915#8248 <https://gitlab.freedesktop.org/drm/intel/issues/8248>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html> (i915#3546 <https://gitlab.freedesktop.org/drm/intel/issues/3546>) +3 similar issues
> 
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>   *
> 
>     igt@kms_display_modes@extended-mode-basic:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-6/igt@kms_display_modes@extended-mode-basic.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
>   *
> 
>     igt@kms_draw_crc@draw-method-mmap-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-gtt.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-10/igt@kms_dsc@dsc-with-bpc-formats.html> (i915#3840 <https://gitlab.freedesktop.org/drm/intel/issues/3840> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
>   *
> 
>     igt@kms_dsc@dsc-with-output-formats:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
>   *
> 
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>) +4 similar issues
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html> (i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>) +5 similar issues
> 
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-11/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-panning-vs-hang:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html> (fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +3 similar issues
>   *
> 
>     igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-snb7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +1 similar issue
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +7 similar issues
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-3/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/intel/issues/5274>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +2 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html> (i915#6880 <https://gitlab.freedesktop.org/drm/intel/issues/6880>) +1 similar issue
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render.html> (i915#3458 <https://gitlab.freedesktop.org/drm/intel/issues/3458>) +4 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +2 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html> (i915#1825 <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +15 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html> (fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825> / i915#1825 <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +10 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html> (fdo#110189 <https://bugs.freedesktop.org/show_bug.cgi?id=110189>) +10 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html> (i915#3023 <https://gitlab.freedesktop.org/drm/intel/issues/3023>) +6 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html> (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +13 similar issues
>   *
> 
>     igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-4/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-b.html> (i915#6403 <https://gitlab.freedesktop.org/drm/intel/issues/6403>) +2 similar issues
>   *
> 
>     igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-4/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#6403 <https://gitlab.freedesktop.org/drm/intel/issues/6403>)
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-3.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-hdmi-a-3.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +1 similar issue
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +5 similar issues
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-2.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-b-hdmi-a-2.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>   *
> 
>     igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-9/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +2 similar issues
>   *
> 
>     igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-9/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +2 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-2.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +3 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-hdmi-a-1:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-snb1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-hdmi-a-1.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +39 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-dp-4:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-dp-4.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +8 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-1:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-snb1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-1.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>) +15 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +3 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-dp-4:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-dp-4.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +2 similar issues
>   *
> 
>     igt@kms_prime@basic-modeset-hybrid:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html> (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524> / i915#6805 <https://gitlab.freedesktop.org/drm/intel/issues/6805>)
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-2/igt@kms_psr2_sf@cursor-plane-update-sf.html> (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html> (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1 similar issue
>   *
> 
>     igt@kms_psr@cursor_mmap_gtt:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-7/igt@kms_psr@cursor_mmap_gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>)
>   *
> 
>     igt@kms_psr@sprite_render:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-3/igt@kms_psr@sprite_render.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +1 similar issue
>   *
> 
>     igt@kms_setmode@basic@pipe-a-vga-1:
> 
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-snb7/igt@kms_setmode@basic@pipe-a-vga-1.html> (i915#5465 <https://gitlab.freedesktop.org/drm/intel/issues/5465>) +1 similar issue
>   *
> 
>     igt@kms_tv_load_detect@load-detect:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-4/igt@kms_tv_load_detect@load-detect.html> (fdo#109309 <https://bugs.freedesktop.org/show_bug.cgi?id=109309>)
>   *
> 
>     igt@kms_vblank@pipe-c-wait-busy:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-6/igt@kms_vblank@pipe-c-wait-busy.html> (i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> / i915#6768 <https://gitlab.freedesktop.org/drm/intel/issues/6768>) +1 similar issue
>   *
> 
>     igt@kms_vblank@pipe-d-query-forked-busy:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-6/igt@kms_vblank@pipe-d-query-forked-busy.html> (i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> / i915#533 <https://gitlab.freedesktop.org/drm/intel/issues/533> / i915#6768 <https://gitlab.freedesktop.org/drm/intel/issues/6768>) +2 similar issues
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-6/igt@kms_writeback@writeback-check-output.html> (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id:
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-2/igt@kms_writeback@writeback-fb-id.html> (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-7/igt@kms_writeback@writeback-fb-id.html> (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
> 
>   *
> 
>     igt@perf@unprivileged-single-ctx-counters:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-4/igt@perf@unprivileged-single-ctx-counters.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>   *
> 
>     igt@perf_pmu@busy-double-start@vecs1:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-1/igt@perf_pmu@busy-double-start@vecs1.html> (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>) +3 similar issues
>   *
> 
>     igt@prime_vgem@fence-read-hang:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-7/igt@prime_vgem@fence-read-hang.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +1 similar issue
>   *
> 
>     igt@sysfs_heartbeat_interval@precise@vecs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-4/igt@sysfs_heartbeat_interval@precise@vecs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-8/igt@sysfs_heartbeat_interval@precise@vecs0.html> (i915#8332 <https://gitlab.freedesktop.org/drm/intel/issues/8332>)
>   *
> 
>     igt@v3d/v3d_mmap@mmap-bo:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-8/igt@v3d/v3d_mmap@mmap-bo.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +7 similar issues
>   *
> 
>     igt@v3d/v3d_perfmon@get-values-invalid-perfmon:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-3/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html> (fdo#109315 <https://bugs.freedesktop.org/show_bug.cgi?id=109315> / i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +4 similar issues
>   *
> 
>     igt@v3d/v3d_submit_cl@multisync-out-syncs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-6/igt@v3d/v3d_submit_cl@multisync-out-syncs.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +2 similar issues
>   *
> 
>     igt@v3d/v3d_submit_cl@simple-flush-cache:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-6/igt@v3d/v3d_submit_cl@simple-flush-cache.html> (fdo#109315 <https://bugs.freedesktop.org/show_bug.cgi?id=109315>) +1 similar issue
>   *
> 
>     igt@vc4/vc4_create_bo@create-bo-0:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-4/igt@vc4/vc4_create_bo@create-bo-0.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +3 similar issues
>   *
> 
>     igt@vc4/vc4_perfmon@create-single-perfmon:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-6/igt@vc4/vc4_perfmon@create-single-perfmon.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>)
>   *
> 
>     igt@vc4/vc4_wait_bo@used-bo-0ns:
> 
>       o
> 
>         shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-6/igt@vc4/vc4_wait_bo@used-bo-0ns.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +3 similar issues
> 
>       o
> 
>         shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-6/igt@vc4/vc4_wait_bo@used-bo-0ns.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +3 similar issues
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_barrier_race@remote-request@rcs0:
> 
>       o shard-rkl: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-rkl-1/igt@gem_barrier_race@remote-request@rcs0.html> (i915#8178 <https://gitlab.freedesktop.org/drm/intel/issues/8178>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-3/igt@gem_barrier_race@remote-request@rcs0.html>
>   *
> 
>     igt@gem_ctx_exec@basic-nohangcheck:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html> (i915#6268 <https://gitlab.freedesktop.org/drm/intel/issues/6268>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-3/igt@gem_ctx_exec@basic-nohangcheck.html>
>   *
> 
>     igt@gem_ctx_persistence@engines-hostile@vcs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-7/igt@gem_ctx_persistence@engines-hostile@vcs0.html> (i915#2410 <https://gitlab.freedesktop.org/drm/intel/issues/2410>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-8/igt@gem_ctx_persistence@engines-hostile@vcs0.html> +3 similar issues
>   *
> 
>     igt@gem_eio@context-create:
> 
>       o {shard-dg1}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-dg1-17/igt@gem_eio@context-create.html> (i915#4423 <https://gitlab.freedesktop.org/drm/intel/issues/4423>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg1-19/igt@gem_eio@context-create.html>
>   *
> 
>     igt@gem_eio@in-flight-contexts-10ms:
> 
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-4/igt@gem_eio@in-flight-contexts-10ms.html> (i915#7941 <https://gitlab.freedesktop.org/drm/intel/issues/7941>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-8/igt@gem_eio@in-flight-contexts-10ms.html>
>   *
> 
>     igt@gem_eio@in-flight-contexts-immediate:
> 
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-2/igt@gem_eio@in-flight-contexts-immediate.html> (i915#8503 <https://gitlab.freedesktop.org/drm/intel/issues/8503>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-2/igt@gem_eio@in-flight-contexts-immediate.html>
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-dg1-16/igt@gem_eio@unwedge-stress.html> (i915#5784 <https://gitlab.freedesktop.org/drm/intel/issues/5784>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg1-14/igt@gem_eio@unwedge-stress.html>
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-glk7/igt@gem_exec_fair@basic-deadline.html> (i915#2846 <https://gitlab.freedesktop.org/drm/intel/issues/2846>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-glk6/igt@gem_exec_fair@basic-deadline.html>
>   *
> 
>     igt@gem_exec_schedule@deep@vecs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-1/igt@gem_exec_schedule@deep@vecs0.html> (i915#8545 <https://gitlab.freedesktop.org/drm/intel/issues/8545>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-4/igt@gem_exec_schedule@deep@vecs0.html>
>   *
> 
>     igt@gem_exec_suspend@basic-s0@smem:
> 
>       o shard-tglu: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-tglu-5/igt@gem_exec_suspend@basic-s0@smem.html> (i915#5122 <https://gitlab.freedesktop.org/drm/intel/issues/5122> / i915#5251 <https://gitlab.freedesktop.org/drm/intel/issues/5251>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-8/igt@gem_exec_suspend@basic-s0@smem.html>
>   *
> 
>     igt@gem_exec_whisper@basic-queues-all:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-1/igt@gem_exec_whisper@basic-queues-all.html> (i915#6363 <https://gitlab.freedesktop.org/drm/intel/issues/6363>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-3/igt@gem_exec_whisper@basic-queues-all.html>
>   *
> 
>     igt@gem_mmap_gtt@fault-concurrent-y:
> 
>       o shard-snb: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-snb6/igt@gem_mmap_gtt@fault-concurrent-y.html> (i915#5161 <https://gitlab.freedesktop.org/drm/intel/issues/5161>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-snb5/igt@gem_mmap_gtt@fault-concurrent-y.html>
>   *
> 
>     igt@gem_workarounds@suspend-resume-context:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-dg2-5/igt@gem_workarounds@suspend-resume-context.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-11/igt@gem_workarounds@suspend-resume-context.html> +4 similar issues
>   *
> 
>     igt@i915_hangman@gt-engine-error@vcs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-4/igt@i915_hangman@gt-engine-error@vcs0.html> (i915#7069 <https://gitlab.freedesktop.org/drm/intel/issues/7069>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-2/igt@i915_hangman@gt-engine-error@vcs0.html>
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html> (i915#8489 <https://gitlab.freedesktop.org/drm/intel/issues/8489>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html>
>   *
> 
>     igt@i915_pm_rpm@gem-execbuf@smem0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-2/igt@i915_pm_rpm@gem-execbuf@smem0.html> (i915#8457 <https://gitlab.freedesktop.org/drm/intel/issues/8457>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-3/igt@i915_pm_rpm@gem-execbuf@smem0.html>
>   *
> 
>     igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>       o {shard-dg1}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg1-15/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html> +1 similar issue
>   *
> 
>     igt@i915_selftest@live@requests:
> 
>       o shard-mtlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-2/igt@i915_selftest@live@requests.html> (i915#8497 <https://gitlab.freedesktop.org/drm/intel/issues/8497>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-1/igt@i915_selftest@live@requests.html>
>   *
> 
>     igt@i915_selftest@live@workarounds:
> 
>       o shard-mtlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-2/igt@i915_selftest@live@workarounds.html> (i915#6763 <https://gitlab.freedesktop.org/drm/intel/issues/6763>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-1/igt@i915_selftest@live@workarounds.html>
>   *
> 
>     igt@i915_selftest@perf@request:
> 
>       o shard-mtlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-7/igt@i915_selftest@perf@request.html> (i915#8573 <https://gitlab.freedesktop.org/drm/intel/issues/8573>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-3/igt@i915_selftest@perf@request.html>
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html> (i915#5138 <https://gitlab.freedesktop.org/drm/intel/issues/5138>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-random-256x85@pipe-d-edp-1:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-1/igt@kms_cursor_crc@cursor-random-256x85@pipe-d-edp-1.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-256x85@pipe-d-edp-1.html> +1 similar issue
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html> (i915#6880 <https://gitlab.freedesktop.org/drm/intel/issues/6880>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html> +3 similar issues
>   *
> 
>     igt@perf_pmu@busy-double-start@ccs0:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-4/igt@perf_pmu@busy-double-start@ccs0.html> (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-8/igt@perf_pmu@busy-double-start@ccs0.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>       o shard-dg2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html> (i915#5493 <https://gitlab.freedesktop.org/drm/intel/issues/5493>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-3/igt@gem_lmem_swapping@smem-oom@lmem0.html> (i915#4936 <https://gitlab.freedesktop.org/drm/intel/issues/4936> / i915#5493 <https://gitlab.freedesktop.org/drm/intel/issues/5493>)
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-dg2: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-dg2-12/igt@i915_module_load@reload-with-fault-injection.html> (i915#6596 <https://gitlab.freedesktop.org/drm/intel/issues/6596> / i915#7356 <https://gitlab.freedesktop.org/drm/intel/issues/7356>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html> (i915#7061 <https://gitlab.freedesktop.org/drm/intel/issues/7061>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@bcs0:
> 
>       o shard-tglu: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html> (i915#2681 <https://gitlab.freedesktop.org/drm/intel/issues/2681>) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html> (i915#2681 <https://gitlab.freedesktop.org/drm/intel/issues/2681> / i915#3591 <https://gitlab.freedesktop.org/drm/intel/issues/3591>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@rcs0:
> 
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html> (i915#2681 <https://gitlab.freedesktop.org/drm/intel/issues/2681> / i915#3591 <https://gitlab.freedesktop.org/drm/intel/issues/3591>) -> WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html> (i915#2681 <https://gitlab.freedesktop.org/drm/intel/issues/2681>)
>   *
> 
>     igt@kms_async_flips@crc@pipe-b-edp-1:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-2/igt@kms_async_flips@crc@pipe-b-edp-1.html> (i915#8247 <https://gitlab.freedesktop.org/drm/intel/issues/8247>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-7/igt@kms_async_flips@crc@pipe-b-edp-1.html> (i915#8561 <https://gitlab.freedesktop.org/drm/intel/issues/8561>) +1 similar issue
>   *
> 
>     igt@kms_content_protection@mei_interface:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-dg2-6/igt@kms_content_protection@mei_interface.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-dg2-11/igt@kms_content_protection@mei_interface.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118> / i915#7162 <https://gitlab.freedesktop.org/drm/intel/issues/7162>)
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-mtlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2017 <https://gitlab.freedesktop.org/drm/intel/issues/2017> / i915#5954 <https://gitlab.freedesktop.org/drm/intel/issues/5954>) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-mtlp-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7352/shard-rkl-6/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285> / i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7352 -> IGTPW_9286
> 
> CI-20190529: 20190529
> CI_DRM_13328: 12cd6b2d321d9c034f3d4ba14788d68cb8da4eac @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_9286: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9286/index.html
> IGT_7352: 471bfababd070e1dac0ebb87470ac4f2ae85e663 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
