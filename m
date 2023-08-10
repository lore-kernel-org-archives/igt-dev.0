Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8269A10E5E2
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 19:14:42 +0000 (UTC)
Date: Thu, 10 Aug 2023 21:14:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230810191437.qjdypvdewpsd6gny@kamilkon-desk1>
References: <20230808113842.3213560-1-andrzej.hajda@intel.com>
 <169153312788.13859.17750370673249266208@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169153312788.13859.17750370673249266208@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogIGZhaWx1cmUgZm9yIGk5MTUv?=
 =?utf-8?q?gem=5Fexec=5Fawait=3A_Avoid_DG2_conflicts_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>,
 SanjuX Marikkar <sanjux.marikkar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

On 2023-08-08 at 22:18:47 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: i915/gem_exec_await: Avoid DG2 conflicts (rev3)
> URL   : https://patchwork.freedesktop.org/series/120309/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7422_full -> IGTPW_9538_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9538_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9538_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/index.html
> 
> Participating hosts (9 -> 10)
> ------------------------------
> 
>   Additional (1): shard-tglu0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9538_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@perf@gen12-oa-tlb-invalidate@1-vcs1:
>     - shard-mtlp:         NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-7/igt@perf@gen12-oa-tlb-invalidate@1-vcs1.html
> 

Unrelated to change in i915/gem_exec_await

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9538_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][2] ([i915#8411])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-1/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@drm_fdinfo@all-busy-check-all:
>     - shard-mtlp:         NOTRUN -> [SKIP][3] ([i915#8414]) +6 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-4/igt@drm_fdinfo@all-busy-check-all.html
> 
>   * igt@drm_fdinfo@virtual-busy-hang-all:
>     - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#8414])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-2/igt@drm_fdinfo@virtual-busy-hang-all.html
> 
>   * igt@gem_basic@multigpu-create-close:
>     - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#7697])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-1/igt@gem_basic@multigpu-create-close.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-mtlp:         NOTRUN -> [SKIP][6] ([i915#5325])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-2/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#7697])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-17/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-mtlp:         NOTRUN -> [FAIL][8] ([i915#6121])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-5/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_persistence@engines-hostile@vcs0:
>     - shard-mtlp:         [PASS][9] -> [FAIL][10] ([i915#2410]) +2 similar issues
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-4/igt@gem_ctx_persistence@engines-hostile@vcs0.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-2/igt@gem_ctx_persistence@engines-hostile@vcs0.html
> 
>   * igt@gem_ctx_persistence@heartbeat-many:
>     - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#8555])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-8/igt@gem_ctx_persistence@heartbeat-many.html
> 
>   * igt@gem_ctx_persistence@processes:
>     - shard-snb:          NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#1099]) +2 similar issues
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-snb4/igt@gem_ctx_persistence@processes.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile@vecs0:
>     - shard-mtlp:         NOTRUN -> [FAIL][13] ([i915#7816]) +2 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-2/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
> 
>   * igt@gem_exec_balancer@bonded-dual:
>     - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#4771])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-2/igt@gem_exec_balancer@bonded-dual.html
> 
>   * igt@gem_exec_balancer@bonded-semaphore:
>     - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#4812])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@gem_exec_balancer@bonded-semaphore.html
> 
>   * igt@gem_exec_balancer@hog:
>     - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#4812])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-8/igt@gem_exec_balancer@hog.html
> 
>   * igt@gem_exec_endless@dispatch@bcs0:
>     - shard-dg1:          [PASS][17] -> [TIMEOUT][18] ([i915#3778])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg1-14/igt@gem_exec_endless@dispatch@bcs0.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-19/igt@gem_exec_endless@dispatch@bcs0.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#2846])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-glk2/igt@gem_exec_fair@basic-deadline.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-glk4/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none-rrul:
>     - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#3539] / [i915#4852])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-17/igt@gem_exec_fair@basic-none-rrul.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-rkl:          [PASS][22] -> [FAIL][23] ([i915#2842])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-rkl-7/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-2/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-apl:          [PASS][24] -> [FAIL][25] ([i915#2842])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_flush@basic-wb-pro-default:
>     - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#3539] / [i915#4852]) +1 similar issue
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-2/igt@gem_exec_flush@basic-wb-pro-default.html
> 
>   * igt@gem_exec_reloc@basic-cpu-wc-active:
>     - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#3281]) +6 similar issues
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-wc-active.html
> 
>   * igt@gem_exec_whisper@basic-fds-all:
>     - shard-snb:          [PASS][28] -> [ABORT][29] ([i915#8865])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-snb1/igt@gem_exec_whisper@basic-fds-all.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-snb7/igt@gem_exec_whisper@basic-fds-all.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#4860])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
> 
>   * igt@gem_fenced_exec_thrash@too-many-fences:
>     - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#4860])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@gem_fenced_exec_thrash@too-many-fences.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#4565])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-19/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html
> 
>   * igt@gem_media_fill@media-fill:
>     - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#8289])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-6/igt@gem_media_fill@media-fill.html
> 
>   * igt@gem_mmap@bad-offset:
>     - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#4083])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-17/igt@gem_mmap@bad-offset.html
> 
>   * igt@gem_mmap_gtt@basic-read-write-distinct:
>     - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#4077]) +1 similar issue
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-17/igt@gem_mmap_gtt@basic-read-write-distinct.html
> 
>   * igt@gem_mmap_gtt@basic-write-read:
>     - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#4077]) +7 similar issues
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-6/igt@gem_mmap_gtt@basic-write-read.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-odd:
>     - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4077]) +4 similar issues
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
> 
>   * igt@gem_mmap_wc@set-cache-level:
>     - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4083]) +3 similar issues
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-4/igt@gem_mmap_wc@set-cache-level.html
> 
>   * igt@gem_mmap_wc@write-read-distinct:
>     - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4083]) +1 similar issue
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-2/igt@gem_mmap_wc@write-read-distinct.html
> 
>   * igt@gem_partial_pwrite_pread@write:
>     - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#3282]) +1 similar issue
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-8/igt@gem_partial_pwrite_pread@write.html
>     - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#3282]) +1 similar issue
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-2/igt@gem_partial_pwrite_pread@write.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-1:
>     - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#4270])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-13/igt@gem_pxp@reject-modify-context-protection-off-1.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-3:
>     - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4270])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-5/igt@gem_pxp@reject-modify-context-protection-off-3.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-on:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4270])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-11/igt@gem_pxp@reject-modify-context-protection-on.html
> 
>   * igt@gem_readwrite@read-bad-handle:
>     - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#3282]) +3 similar issues
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-4/igt@gem_readwrite@read-bad-handle.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-x-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#8428]) +5 similar issues
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-7/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html
> 
>   * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#5190]) +6 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html
> 
>   * igt@gem_unfence_active_buffers:
>     - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#4879])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-3/igt@gem_unfence_active_buffers.html
> 
>   * igt@gem_userptr_blits@access-control:
>     - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#3297]) +2 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-4/igt@gem_userptr_blits@access-control.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate:
>     - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3297] / [i915#4880])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate.html
> 
>   * igt@gem_userptr_blits@relocations:
>     - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3281]) +6 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-6/igt@gem_userptr_blits@relocations.html
>     - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#3281]) +2 similar issues
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-2/igt@gem_userptr_blits@relocations.html
> 
>   * igt@gen7_exec_parse@basic-rejected:
>     - shard-dg2:          NOTRUN -> [SKIP][53] ([fdo#109289])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-8/igt@gen7_exec_parse@basic-rejected.html
>     - shard-rkl:          NOTRUN -> [SKIP][54] ([fdo#109289])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-7/igt@gen7_exec_parse@basic-rejected.html
> 
>   * igt@gen7_exec_parse@batch-without-end:
>     - shard-mtlp:         NOTRUN -> [SKIP][55] ([fdo#109289]) +1 similar issue
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-8/igt@gen7_exec_parse@batch-without-end.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-apl:          [PASS][56] -> [ABORT][57] ([i915#5566])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-apl7/igt@gen9_exec_parse@allowed-single.html
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-apl1/igt@gen9_exec_parse@allowed-single.html
>     - shard-glk:          [PASS][58] -> [ABORT][59] ([i915#5566])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-glk2/igt@gen9_exec_parse@allowed-single.html
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-glk9/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@batch-zero-length:
>     - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#2856]) +2 similar issues
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-1/igt@gen9_exec_parse@batch-zero-length.html
> 
>   * igt@i915_hangman@engine-engine-hang@vcs0:
>     - shard-mtlp:         [PASS][61] -> [FAIL][62] ([i915#7069])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-4/igt@i915_hangman@engine-engine-hang@vcs0.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-2/igt@i915_hangman@engine-engine-hang@vcs0.html
> 
>   * igt@i915_module_load@load:
>     - shard-snb:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#6227])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-snb1/igt@i915_module_load@load.html
> 
>   * igt@i915_pm_backlight@basic-brightness:
>     - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#5354] / [i915#7561])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-10/igt@i915_pm_backlight@basic-brightness.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#3361])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-6/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@i915_pm_freq_api@freq-basic-api@gt1:
>     - shard-mtlp:         [PASS][66] -> [FAIL][67] ([i915#8670])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-2/igt@i915_pm_freq_api@freq-basic-api@gt1.html
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-1/igt@i915_pm_freq_api@freq-basic-api@gt1.html
> 
>   * igt@i915_pm_rc6_residency@rc6-fence:
>     - shard-tglu:         [PASS][68] -> [WARN][69] ([i915#2681])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-fence.html
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html
> 
>   * igt@i915_pm_rpm@basic-pci-d3-state:
>     - shard-dg2:          [PASS][70] -> [FAIL][71] ([i915#7691])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg2-11/igt@i915_pm_rpm@basic-pci-d3-state.html
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@i915_pm_rpm@basic-pci-d3-state.html
> 
>   * igt@i915_pm_rpm@cursor-dpms:
>     - shard-tglu:         [PASS][72] -> [FAIL][73] ([i915#7940])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-tglu-5/igt@i915_pm_rpm@cursor-dpms.html
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-2/igt@i915_pm_rpm@cursor-dpms.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:
>     - shard-dg1:          [PASS][74] -> [FAIL][75] ([i915#7940]) +1 similar issue
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg1-18/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
> 
>   * igt@i915_pm_rpm@i2c:
>     - shard-dg2:          [PASS][76] -> [FAIL][77] ([i915#8717])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg2-8/igt@i915_pm_rpm@i2c.html
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-2/igt@i915_pm_rpm@i2c.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp-stress:
>     - shard-dg2:          [PASS][78] -> [SKIP][79] ([i915#1397]) +1 similar issue
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg2-10/igt@i915_pm_rpm@modeset-lpsp-stress.html
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-8/igt@i915_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp:
>     - shard-dg1:          [PASS][80] -> [SKIP][81] ([i915#1397])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg1-17/igt@i915_pm_rpm@modeset-non-lpsp.html
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress:
>     - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#1397])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
>     - shard-tglu:         NOTRUN -> [SKIP][83] ([fdo#111644] / [i915#1397])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@i915_pm_rpm@system-suspend-devices:
>     - shard-dg2:          [PASS][84] -> [FAIL][85] ([i915#6121])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg2-1/igt@i915_pm_rpm@system-suspend-devices.html
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@i915_pm_rpm@system-suspend-devices.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-snb:          [PASS][86] -> [INCOMPLETE][87] ([i915#7790])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-snb6/igt@i915_pm_rps@reset.html
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-snb4/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-mtlp:         NOTRUN -> [SKIP][88] ([fdo#109303])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-5/igt@i915_query@query-topology-known-pci-ids.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-rkl:          [PASS][89] -> [FAIL][90] ([fdo#103375]) +2 similar issues
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-rkl-2/igt@i915_suspend@basic-s3-without-i915.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-6/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@i915_suspend@fence-restore-tiled2untiled:
>     - shard-snb:          NOTRUN -> [DMESG-WARN][91] ([i915#8841]) +4 similar issues
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-snb4/igt@i915_suspend@fence-restore-tiled2untiled.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4215] / [i915#5190])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4212])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
> 
>   * igt@kms_addfb_basic@tile-pitch-mismatch:
>     - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#4212])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-4/igt@kms_addfb_basic@tile-pitch-mismatch.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#8502]) +7 similar issues
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-mtlp:         [PASS][96] -> [FAIL][97] ([i915#5138])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#5286])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-mtlp:         NOTRUN -> [FAIL][99] ([i915#3743]) +1 similar issue
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4538] / [i915#5286])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-mtlp:         [PASS][101] -> [FAIL][102] ([i915#3743])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][103] ([fdo#111614]) +2 similar issues
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][104] ([fdo#111614])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
>     - shard-rkl:          NOTRUN -> [SKIP][105] ([fdo#111614] / [i915#3638])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#6187]) +1 similar issue
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#4538]) +1 similar issue
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
>     - shard-mtlp:         NOTRUN -> [SKIP][108] ([fdo#111615]) +6 similar issues
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#4538] / [i915#5190]) +1 similar issue
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][110] ([fdo#110723]) +1 similar issue
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-tglu:         NOTRUN -> [SKIP][111] ([fdo#111615]) +1 similar issue
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#3689] / [i915#5354]) +3 similar issues
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-2/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#3886] / [i915#6095]) +6 similar issues
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-5/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-15/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#5354] / [i915#6095]) +2 similar issues
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-9/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#3689] / [i915#3886] / [i915#5354]) +7 similar issues
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-11/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
>     - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#5354] / [i915#6095]) +2 similar issues
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs_cc:
>     - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#5354] / [i915#6095]) +4 similar issues
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-16/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs_cc.html
> 
>   * igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][119] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-5/igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#5354]) +4 similar issues
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-2/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#6095]) +15 similar issues
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-8/igt@kms_ccs@pipe-d-bad-aux-stride-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#3689] / [i915#5354] / [i915#6095])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-7/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#3689] / [i915#5354] / [i915#6095]) +2 similar issues
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-17/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#7213] / [i915#9010])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-4/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#4087] / [i915#7213]) +3 similar issues
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#4087]) +3 similar issues
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#7828]) +3 similar issues
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-8/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#7828]) +2 similar issues
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
>     - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#7828])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#7828]) +5 similar issues
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-5/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#7828]) +1 similar issue
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-18/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#7116])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-18/igt@kms_content_protection@atomic.html
>     - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#6944]) +1 similar issue
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-1/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#3299]) +1 similar issue
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@lic@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][135] ([i915#7173])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-11/igt@kms_content_protection@lic@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-max-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#8814]) +1 similar issue
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-snb:          NOTRUN -> [SKIP][137] ([fdo#109271] / [fdo#111767]) +1 similar issue
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-snb4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#4103] / [i915#4213])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>     - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#4103])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([fdo#109274] / [i915#5354])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>     - shard-rkl:          NOTRUN -> [SKIP][141] ([fdo#111825]) +2 similar issues
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>     - shard-tglu:         NOTRUN -> [SKIP][142] ([fdo#109274])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-9/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>     - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#3546])
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@single-bo@all-pipes:
>     - shard-mtlp:         [PASS][144] -> [DMESG-WARN][145] ([i915#2017])
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-3/igt@kms_cursor_legacy@single-bo@all-pipes.html
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-4/igt@kms_cursor_legacy@single-bo@all-pipes.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#8588])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#8588])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-1/igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#8588])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-10/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#3840])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-6/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#3955])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
>     - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#3469])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-6/igt@kms_fbcon_fbt@psr-suspend.html
>     - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#3469])
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-11/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][153] ([fdo#109274] / [i915#3637])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-4/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-flip-vs-fences-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#8381])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][155] ([fdo#109274]) +1 similar issue
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@kms_flip@2x-flip-vs-panning-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][156] ([fdo#111767] / [i915#3637])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#3637]) +2 similar issues
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
>     - shard-glk:          [PASS][158] -> [FAIL][159] ([i915#79])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#8810])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#2672]) +1 similar issue
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
>     - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#2672])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#2587] / [i915#2672]) +1 similar issue
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#2672]) +2 similar issues
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - shard-mtlp:         NOTRUN -> [SKIP][165] ([fdo#109285])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#8708]) +10 similar issues
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2:          [PASS][167] -> [FAIL][168] ([i915#6880])
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][169] ([fdo#109280]) +1 similar issue
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>     - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#1825]) +22 similar issues
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][171] ([fdo#111825] / [i915#1825]) +2 similar issues
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
>     - shard-dg1:          NOTRUN -> [SKIP][172] ([fdo#111825]) +5 similar issues
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
>     - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#5354]) +14 similar issues
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#3458]) +8 similar issues
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
>     - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#3023]) +7 similar issues
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>     - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#3458]) +3 similar issues
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#8708]) +2 similar issues
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#8708]) +2 similar issues
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
>     - shard-tglu:         NOTRUN -> [SKIP][179] ([fdo#110189]) +3 similar issues
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#3555] / [i915#8228]) +1 similar issue
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@kms_hdr@bpc-switch-dpms.html
>     - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#3555] / [i915#8228])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
>     - shard-mtlp:         [PASS][182] -> [FAIL][183] ([i915#1623])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#8821])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-8/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#5176]) +7 similar issues
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#5176]) +1 similar issue
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#5176]) +7 similar issues
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-14/igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-d-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#5235]) +1 similar issue
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#5235]) +7 similar issues
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#5235]) +19 similar issues
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html
>     - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#5235]) +11 similar issues
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-dg1:          NOTRUN -> [SKIP][192] ([fdo#111068] / [i915#658])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-16/igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-rkl:          NOTRUN -> [SKIP][193] ([fdo#111068] / [i915#658])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>     - shard-tglu:         NOTRUN -> [SKIP][194] ([fdo#109642] / [fdo#111068] / [i915#658])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@sprite_mmap_cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#1072]) +1 similar issue
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-11/igt@kms_psr@sprite_mmap_cpu.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#4235]) +1 similar issue
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-8/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#4235])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none:
>     - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#3555]) +1 similar issue
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-13/igt@kms_scaling_modes@scaling-mode-none.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d:
>     - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#5030]) +3 similar issues
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-2/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d.html
> 
>   * igt@kms_selftest@drm_dp_mst:
>     - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#8661])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-8/igt@kms_selftest@drm_dp_mst.html
> 
>   * igt@kms_selftest@drm_format_helper:
>     - shard-snb:          NOTRUN -> [SKIP][201] ([fdo#109271] / [i915#8661])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-snb2/igt@kms_selftest@drm_format_helper.html
> 
>   * igt@kms_selftest@drm_plane:
>     - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#8661])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@kms_selftest@drm_plane.html
>     - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#8661])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-4/igt@kms_selftest@drm_plane.html
> 
>   * igt@kms_universal_plane@universal-plane-pipe-d-sanity:
>     - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#4070] / [i915#533] / [i915#6768])
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-7/igt@kms_universal_plane@universal-plane-pipe-d-sanity.html
> 
>   * igt@kms_vblank@pipe-b-ts-continuation-modeset-hang:
>     - shard-snb:          NOTRUN -> [ABORT][205] ([i915#8865])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-snb7/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html
> 
>   * igt@kms_vblank@pipe-c-query-busy-hang:
>     - shard-snb:          NOTRUN -> [SKIP][206] ([fdo#109271]) +245 similar issues
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-snb7/igt@kms_vblank@pipe-c-query-busy-hang.html
> 
>   * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
>     - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#4070] / [i915#6768])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
> 
>   * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
>     - shard-dg2:          [PASS][208] -> [FAIL][209] ([fdo#103375])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg2-6/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#3555]) +4 similar issues
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-2/igt@kms_vrr@negative-basic.html
>     - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#3555]) +1 similar issue
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-6/igt@kms_vrr@negative-basic.html
>     - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#3555]) +1 similar issue
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-8/igt@kms_vrr@negative-basic.html
> 
>   * igt@perf_pmu@busy-idle@bcs0:
>     - shard-mtlp:         [PASS][213] -> [FAIL][214] ([i915#4349]) +1 similar issue
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-5/igt@perf_pmu@busy-idle@bcs0.html
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-1/igt@perf_pmu@busy-idle@bcs0.html
> 
>   * igt@perf_pmu@busy-idle@ccs3:
>     - shard-dg2:          [PASS][215] -> [FAIL][216] ([i915#4349])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg2-10/igt@perf_pmu@busy-idle@ccs3.html
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-10/igt@perf_pmu@busy-idle@ccs3.html
> 
>   * igt@perf_pmu@busy-idle@vecs0:
>     - shard-dg1:          [PASS][217] -> [FAIL][218] ([i915#4349])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg1-19/igt@perf_pmu@busy-idle@vecs0.html
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-17/igt@perf_pmu@busy-idle@vecs0.html
> 
>   * igt@perf_pmu@frequency@gt0:
>     - shard-dg1:          NOTRUN -> [FAIL][219] ([i915#6806])
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-16/igt@perf_pmu@frequency@gt0.html
> 
>   * igt@perf_pmu@most-busy-check-all@rcs0:
>     - shard-rkl:          [PASS][220] -> [FAIL][221] ([i915#4349])
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-rkl-2/igt@perf_pmu@most-busy-check-all@rcs0.html
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-7/igt@perf_pmu@most-busy-check-all@rcs0.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#8516])
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-6/igt@perf_pmu@rc6@other-idle-gt0.html
>     - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#8516])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-2/igt@perf_pmu@rc6@other-idle-gt0.html
>     - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#8516])
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-8/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@sysfs_heartbeat_interval@nopreempt@bcs0:
>     - shard-mtlp:         [PASS][225] -> [FAIL][226] ([i915#6015]) +1 similar issue
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-6/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-6/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html
> 
>   * igt@v3d/v3d_mmap@mmap-bo:
>     - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#2575]) +6 similar issues
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-2/igt@v3d/v3d_mmap@mmap-bo.html
> 
>   * igt@v3d/v3d_submit_csd@multi-and-single-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#2575]) +3 similar issues
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-6/igt@v3d/v3d_submit_csd@multi-and-single-sync.html
>     - shard-rkl:          NOTRUN -> [SKIP][229] ([fdo#109315]) +1 similar issue
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-2/igt@v3d/v3d_submit_csd@multi-and-single-sync.html
>     - shard-tglu:         NOTRUN -> [SKIP][230] ([fdo#109315] / [i915#2575]) +1 similar issue
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-8/igt@v3d/v3d_submit_csd@multi-and-single-sync.html
> 
>   * igt@vc4/vc4_lookup_fail@bad-color-write:
>     - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#7711])
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-13/igt@vc4/vc4_lookup_fail@bad-color-write.html
> 
>   * igt@vc4/vc4_perfmon@create-perfmon-exceed:
>     - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#7711]) +3 similar issues
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-5/igt@vc4/vc4_perfmon@create-perfmon-exceed.html
> 
>   * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:
>     - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#7711])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-6/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html
> 
>   * igt@vc4/vc4_tiling@get-bad-handle:
>     - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#7711]) +2 similar issues
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@vc4/vc4_tiling@get-bad-handle.html
> 
>   * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
>     - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#2575])
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-2/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-tglu:         [FAIL][236] ([i915#6268]) -> [PASS][237]
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-10/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-hostile@vebox:
>     - shard-mtlp:         [FAIL][238] ([i915#2410]) -> [PASS][239] +2 similar issues
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-8/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-6/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
> 
>   * igt@gem_eio@hibernate:
>     - shard-dg2:          [ABORT][240] ([i915#7975] / [i915#8213]) -> [PASS][241]
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg2-1/igt@gem_eio@hibernate.html
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-11/igt@gem_eio@hibernate.html
> 
>   * igt@gem_eio@in-flight-contexts-immediate:
>     - shard-mtlp:         [ABORT][242] ([i915#8503]) -> [PASS][243]
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-4/igt@gem_eio@in-flight-contexts-immediate.html
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-2/igt@gem_eio@in-flight-contexts-immediate.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [FAIL][244] ([i915#5784]) -> [PASS][245]
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg1-18/igt@gem_eio@unwedge-stress.html
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-15/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_await@wide-contexts:
>     - shard-dg2:          [FAIL][246] ([i915#5892]) -> [PASS][247]
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg2-1/igt@gem_exec_await@wide-contexts.html
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-2/igt@gem_exec_await@wide-contexts.html
> 
>   * igt@gem_exec_capture@pi@vcs0:
>     - shard-mtlp:         [FAIL][248] ([i915#4475]) -> [PASS][249]
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-4/igt@gem_exec_capture@pi@vcs0.html
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-8/igt@gem_exec_capture@pi@vcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-rkl:          [FAIL][250] ([i915#2842]) -> [PASS][251]
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-rkl-6/igt@gem_exec_fair@basic-pace@rcs0.html
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices@smem:
>     - shard-tglu:         [ABORT][252] ([i915#7975] / [i915#8213]) -> [PASS][253]
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices@smem.html
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-6/igt@gem_exec_suspend@basic-s4-devices@smem.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg2:          [DMESG-WARN][254] ([i915#7061] / [i915#8617]) -> [PASS][255]
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-mtlp:         [ABORT][256] ([i915#8489] / [i915#8668]) -> [PASS][257]
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_dc@dc9-dpms:
>     - shard-apl:          [SKIP][258] ([fdo#109271]) -> [PASS][259]
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-apl6/igt@i915_pm_dc@dc9-dpms.html
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-apl6/igt@i915_pm_dc@dc9-dpms.html
> 
>   * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
>     - shard-dg1:          [SKIP][260] ([i915#1937]) -> [PASS][261]
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg1-16/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-19/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
>     - shard-dg1:          [FAIL][262] ([i915#3591]) -> [PASS][263]
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
> 
>   * igt@i915_pm_rpm@basic-pci-d3-state:
>     - shard-tglu:         [FAIL][264] ([i915#7940]) -> [PASS][265] +1 similar issue
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-tglu-3/igt@i915_pm_rpm@basic-pci-d3-state.html
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-tglu-9/igt@i915_pm_rpm@basic-pci-d3-state.html
> 
>   * igt@i915_pm_rpm@cursor:
>     - shard-dg1:          [FAIL][266] ([i915#7940]) -> [PASS][267] +2 similar issues
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg1-16/igt@i915_pm_rpm@cursor.html
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-17/igt@i915_pm_rpm@cursor.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-dg1:          [SKIP][268] ([i915#1397]) -> [PASS][269]
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg1-13/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-rkl:          [SKIP][270] ([i915#1397]) -> [PASS][271]
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         [FAIL][272] ([i915#5138]) -> [PASS][273] +1 similar issue
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-mtlp:         [FAIL][274] ([i915#3743]) -> [PASS][275]
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          [FAIL][276] ([i915#2346]) -> [PASS][277] +1 similar issue
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:
>     - shard-dg2:          [FAIL][278] ([fdo#103375]) -> [PASS][279] +1 similar issue
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg2-5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
>     - shard-dg2:          [FAIL][280] ([i915#6880]) -> [PASS][281] +1 similar issue
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
> 
>   * igt@kms_vblank@pipe-c-wait-forked-busy-hang:
>     - shard-mtlp:         [DMESG-WARN][282] ([i915#2017]) -> [PASS][283]
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-5/igt@kms_vblank@pipe-c-wait-forked-busy-hang.html
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-4/igt@kms_vblank@pipe-c-wait-forked-busy-hang.html
> 
>   * igt@perf@non-zero-reason@0-rcs0:
>     - shard-dg2:          [FAIL][284] ([i915#7484]) -> [PASS][285]
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg2-3/igt@perf@non-zero-reason@0-rcs0.html
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-1/igt@perf@non-zero-reason@0-rcs0.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          [FAIL][286] ([i915#4349]) -> [PASS][287] +7 similar issues
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg2-3/igt@perf_pmu@busy-double-start@vecs1.html
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@semaphore-busy@vecs0:
>     - shard-mtlp:         [FAIL][288] ([i915#4349]) -> [PASS][289]
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-5/igt@perf_pmu@semaphore-busy@vecs0.html
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-1/igt@perf_pmu@semaphore-busy@vecs0.html
> 
>   * igt@sysfs_heartbeat_interval@nopreempt@vcs0:
>     - shard-mtlp:         [FAIL][290] ([i915#6015]) -> [PASS][291]
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-6/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-6/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_whisper@basic-contexts-priority-all:
>     - shard-mtlp:         [ABORT][292] ([i915#7392] / [i915#8131]) -> [TIMEOUT][293] ([i915#7392])
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-mtlp-7/igt@gem_exec_whisper@basic-contexts-priority-all.html
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-mtlp-8/igt@gem_exec_whisper@basic-contexts-priority-all.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>     - shard-dg1:          [SKIP][294] ([i915#4423] / [i915#7828]) -> [SKIP][295] ([i915#7828])
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
> 
>   * igt@kms_content_protection@mei_interface:
>     - shard-dg1:          [SKIP][296] ([i915#7116]) -> [SKIP][297] ([fdo#109300])
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg1-17/igt@kms_content_protection@mei_interface.html
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-19/igt@kms_content_protection@mei_interface.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-rkl:          [SKIP][298] ([fdo#110189] / [i915#3955]) -> [SKIP][299] ([i915#3955])
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-rkl-1/igt@kms_fbcon_fbt@psr.html
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-7/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - shard-rkl:          [SKIP][300] ([fdo#109285]) -> [SKIP][301] ([fdo#109285] / [i915#4098])
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_psr@primary_mmap_gtt:
>     - shard-dg1:          [SKIP][302] ([i915#1072] / [i915#4078]) -> [SKIP][303] ([i915#1072])
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg1-13/igt@kms_psr@primary_mmap_gtt.html
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-15/igt@kms_psr@primary_mmap_gtt.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - shard-dg1:          [SKIP][304] ([i915#1072]) -> [SKIP][305] ([i915#1072] / [i915#4078]) +1 similar issue
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7422/shard-dg1-19/igt@kms_psr@sprite_plane_onoff.html
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/shard-dg1-13/igt@kms_psr@sprite_plane_onoff.html
> 
>   
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
>   [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1623]: https://gitlab.freedesktop.org/drm/intel/issues/1623
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
>   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
>   [i915#4475]: https://gitlab.freedesktop.org/drm/intel/issues/4475
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#5892]: https://gitlab.freedesktop.org/drm/intel/issues/5892
>   [i915#6015]: https://gitlab.freedesktop.org/drm/intel/issues/6015
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
>   [i915#6187]: https://gitlab.freedesktop.org/drm/intel/issues/6187
>   [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6806]: https://gitlab.freedesktop.org/drm/intel/issues/6806
>   [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
>   [i915#7061]: https://gitlab.freedesktop.org/drm/intel/issues/7061
>   [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
>   [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
>   [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
>   [i915#7484]: https://gitlab.freedesktop.org/drm/intel/issues/7484
>   [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
>   [i915#7691]: https://gitlab.freedesktop.org/drm/intel/issues/7691
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7790]: https://gitlab.freedesktop.org/drm/intel/issues/7790
>   [i915#7816]: https://gitlab.freedesktop.org/drm/intel/issues/7816
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
>   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>   [i915#8131]: https://gitlab.freedesktop.org/drm/intel/issues/8131
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8289]: https://gitlab.freedesktop.org/drm/intel/issues/8289
>   [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
>   [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8489]: https://gitlab.freedesktop.org/drm/intel/issues/8489
>   [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
>   [i915#8503]: https://gitlab.freedesktop.org/drm/intel/issues/8503
>   [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
>   [i915#8617]: https://gitlab.freedesktop.org/drm/intel/issues/8617
>   [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
>   [i915#8670]: https://gitlab.freedesktop.org/drm/intel/issues/8670
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8717]: https://gitlab.freedesktop.org/drm/intel/issues/8717
>   [i915#8810]: https://gitlab.freedesktop.org/drm/intel/issues/8810
>   [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
>   [i915#8821]: https://gitlab.freedesktop.org/drm/intel/issues/8821
>   [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
>   [i915#8865]: https://gitlab.freedesktop.org/drm/intel/issues/8865
>   [i915#9010]: https://gitlab.freedesktop.org/drm/intel/issues/9010
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7422 -> IGTPW_9538
> 
>   CI-20190529: 20190529
>   CI_DRM_13491: 91b8ce32dffefc8f644e9ef0838dc108a776002a @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9538: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/index.html
>   IGT_7422: a7b9e93b67f02d17b99f9331fdcda14e21172c8c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9538/index.html
