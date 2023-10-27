Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E31610E9E7
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Oct 2023 15:21:53 +0000 (UTC)
Date: Fri, 27 Oct 2023 17:21:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231027152143.4hul3ax7zi5jwx6c@kamilkon-desk.igk.intel.com>
References: <20231026100909.13317-1-kamil.konieczny@linux.intel.com>
 <169840486962.19709.1802112727438190307@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169840486962.19709.1802112727438190307@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgZHJtLXVh?=
 =?utf-8?q?pi=3A_sync_with_drm-next_52920704df87_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 lgci.bug.filing@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

below changes are unrelated to drm-uapi headers sync.

Regards,
Kamil

On 2023-10-27 at 11:07:49 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm-uapi: sync with drm-next 52920704df87 (rev2)
> URL   : https://patchwork.freedesktop.org/series/125459/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13789_full -> IGTPW_10073_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10073_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10073_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/index.html
> 
> Participating hosts (0 -> 12)
> ------------------------------
> 
>   Additional (12): shard-mtlp0 shard-skl shard-tglu shard-rkl0 shard-dg2 shard-apl shard-glk shard-mtlp shard-snb shard-rkl shard-dg1 shard-dg20 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10073_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_busy@semaphore:
>     - shard-dg2:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@gem_busy@semaphore.html
>     - shard-dg1:          NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-18/igt@gem_busy@semaphore.html
>     - shard-mtlp:         NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-7/igt@gem_busy@semaphore.html
> 
>   * igt@gem_ctx_shared@q-smoketest@bcs0:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-6/igt@gem_ctx_shared@q-smoketest@bcs0.html
> 
>   * igt@gem_exec_endless@dispatch@bcs0:
>     - shard-rkl:          NOTRUN -> [SKIP][5] +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html
> 
>   * igt@perf_pmu@all-busy-idle-check-all:
>     - shard-dg1:          NOTRUN -> [FAIL][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-19/igt@perf_pmu@all-busy-idle-check-all.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@gem_compute@compute-square}:
>     - shard-rkl:          NOTRUN -> [SKIP][8]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-5/igt@gem_compute@compute-square.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10073_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#8411]) +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-16/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#6230])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@api_intel_bb@crc32.html
>     - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#6230])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-18/igt@api_intel_bb@crc32.html
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#8411]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#8411]) +3 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@api_intel_bb@object-reloc-purge-cache.html
>     - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8411]) +3 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-3/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>   * igt@api_intel_bb@render-ccs:
>     - shard-dg2:          NOTRUN -> [FAIL][15] ([i915#6122])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-5/igt@api_intel_bb@render-ccs.html
> 
>   * igt@debugfs_test@basic-hwmon:
>     - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#9318])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@debugfs_test@basic-hwmon.html
>     - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#9318])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@debugfs_test@basic-hwmon.html
>     - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#9318])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-8/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#7701]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-16/igt@device_reset@cold-reset-bound.html
>     - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#7701]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-2/igt@device_reset@cold-reset-bound.html
>     - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#7701]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-2/igt@device_reset@cold-reset-bound.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#7701]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@device_reset@unbind-cold-reset-rebind.html
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][23] ([i915#9408])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-19/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@drm_fdinfo@busy-hang@rcs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#8414]) +53 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-2/igt@drm_fdinfo@busy-hang@rcs0.html
> 
>   * igt@drm_fdinfo@busy-idle-check-all@ccs3:
>     - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#8414]) +46 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-2/igt@drm_fdinfo@busy-idle-check-all@ccs3.html
> 
>   * igt@drm_fdinfo@isolation@vecs0:
>     - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#8414]) +47 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-17/igt@drm_fdinfo@isolation@vecs0.html
> 
>   * igt@drm_fdinfo@virtual-idle:
>     - shard-rkl:          NOTRUN -> [FAIL][27] ([i915#7742]) +2 other tests fail
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-2/igt@drm_fdinfo@virtual-idle.html
> 
>   * igt@fbdev@unaligned-read:
>     - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#2582])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-5/igt@fbdev@unaligned-read.html
> 
>   * igt@gem_basic@multigpu-create-close:
>     - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#7697]) +3 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-12/igt@gem_basic@multigpu-create-close.html
> 
>   * igt@gem_caching@writes:
>     - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#4873]) +2 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-7/igt@gem_caching@writes.html
> 
>   * igt@gem_ccs@block-multicopy-compressed:
>     - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#9323]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@gem_ccs@block-multicopy-compressed.html
> 
>   * igt@gem_ccs@block-multicopy-inplace:
>     - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#7957])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-5/igt@gem_ccs@block-multicopy-inplace.html
> 
>   * igt@gem_ccs@ctrl-surf-copy-new-ctx:
>     - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#4098] / [i915#9323])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#9323])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@gem_ccs@suspend-resume.html
>     - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#9323]) +2 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-16/igt@gem_ccs@suspend-resume.html
>     - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#9323]) +2 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-8/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][37] ([i915#7297])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-6/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
> 
>   * igt@gem_close_race@multigpu-basic-process:
>     - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#7697]) +3 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@gem_close_race@multigpu-basic-process.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#7697]) +2 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-5/igt@gem_close_race@multigpu-basic-threads.html
>     - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#7697]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][41] ([i915#9364])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-2/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_create@create-ext-cpu-access-sanity-check:
>     - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#6335]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-7/igt@gem_create@create-ext-cpu-access-sanity-check.html
>     - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#6335]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@gem_create@create-ext-cpu-access-sanity-check.html
>     - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#6335]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-2/igt@gem_create@create-ext-cpu-access-sanity-check.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#8562])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-4/igt@gem_create@create-ext-set-pat.html
>     - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#8562])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-17/igt@gem_create@create-ext-set-pat.html
>     - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#8562])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-10/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_create@hog-create@smem0:
>     - shard-mtlp:         NOTRUN -> [FAIL][48] ([i915#8758])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-6/igt@gem_create@hog-create@smem0.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-rkl:          NOTRUN -> [FAIL][49] ([i915#6268])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_isolation@preservation-s3@rcs0:
>     - shard-snb:          NOTRUN -> [DMESG-WARN][50] ([i915#8841]) +33 other tests dmesg-warn
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-snb6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
> 
>   * igt@gem_ctx_param@set-priority-not-supported:
>     - shard-dg1:          NOTRUN -> [SKIP][51] ([fdo#109314])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-16/igt@gem_ctx_param@set-priority-not-supported.html
>     - shard-tglu:         NOTRUN -> [SKIP][52] ([fdo#109314])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-5/igt@gem_ctx_param@set-priority-not-supported.html
>     - shard-mtlp:         NOTRUN -> [SKIP][53] ([fdo#109314])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-2/igt@gem_ctx_param@set-priority-not-supported.html
>     - shard-dg2:          NOTRUN -> [SKIP][54] ([fdo#109314])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-10/igt@gem_ctx_param@set-priority-not-supported.html
>     - shard-rkl:          NOTRUN -> [SKIP][55] ([fdo#109314])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-5/igt@gem_ctx_param@set-priority-not-supported.html
> 
>   * igt@gem_ctx_persistence@engines-mixed-process:
>     - shard-snb:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#1099]) +22 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-snb4/igt@gem_ctx_persistence@engines-mixed-process.html
> 
>   * igt@gem_ctx_persistence@hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#8555]) +6 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-7/igt@gem_ctx_persistence@hang.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#8555]) +4 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-hang.html
> 
>   * igt@gem_ctx_persistence@heartbeat-stop:
>     - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#8555]) +6 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-stop.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-hostile@bsd1:
>     - shard-mtlp:         NOTRUN -> [FAIL][60] ([i915#2410]) +2 other tests fail
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-1/igt@gem_ctx_persistence@legacy-engines-hostile@bsd1.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
>     - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#5882]) +9 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#5882]) +5 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0.html
> 
>   * igt@gem_ctx_persistence@smoketest:
>     - shard-tglu:         NOTRUN -> [FAIL][63] ([i915#9542])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@gem_ctx_persistence@smoketest.html
> 
>   * igt@gem_ctx_sseu@engines:
>     - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#280]) +3 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@gem_ctx_sseu@engines.html
>     - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#280]) +3 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-17/igt@gem_ctx_sseu@engines.html
>     - shard-tglu:         NOTRUN -> [SKIP][66] ([i915#280]) +3 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@gem_ctx_sseu@engines.html
>     - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#280]) +3 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-2/igt@gem_ctx_sseu@engines.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#280]) +2 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-2/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-snb:          NOTRUN -> [FAIL][69] ([i915#8898]) +1 other test fail
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-snb4/igt@gem_eio@unwedge-stress.html
>     - shard-dg1:          NOTRUN -> [FAIL][70] ([i915#5784]) +2 other tests fail
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-17/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@bonded-dual:
>     - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4771]) +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@gem_exec_balancer@bonded-dual.html
> 
>   * igt@gem_exec_balancer@bonded-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4771]) +2 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html
>     - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4771]) +2 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-15/igt@gem_exec_balancer@bonded-sync.html
> 
>   * igt@gem_exec_balancer@bonded-true-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4812]) +5 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-6/igt@gem_exec_balancer@bonded-true-hang.html
> 
>   * igt@gem_exec_balancer@invalid-bonds:
>     - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4036])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-2/igt@gem_exec_balancer@invalid-bonds.html
>     - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4036])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-12/igt@gem_exec_balancer@invalid-bonds.html
>     - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#4036])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@gem_exec_balancer@invalid-bonds.html
> 
>   * igt@gem_exec_balancer@parallel-balancer:
>     - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#4525]) +8 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-5/igt@gem_exec_balancer@parallel-balancer.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-tglu:         NOTRUN -> [FAIL][79] ([i915#6117])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_exec_capture@capture-invisible@lmem0:
>     - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#6334]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-1/igt@gem_exec_capture@capture-invisible@lmem0.html
>     - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#6334]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-13/igt@gem_exec_capture@capture-invisible@lmem0.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-glk:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#6334])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-glk4/igt@gem_exec_capture@capture-invisible@smem0.html
>     - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#6334])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@gem_exec_capture@capture-invisible@smem0.html
>     - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#6334])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-4/igt@gem_exec_capture@capture-invisible@smem0.html
>     - shard-apl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#6334])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-apl1/igt@gem_exec_capture@capture-invisible@smem0.html
>     - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#6334])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-7/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_capture@capture-recoverable:
>     - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#6344])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-5/igt@gem_exec_capture@capture-recoverable.html
>     - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#6344])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@gem_exec_capture@capture-recoverable.html
> 
>   * igt@gem_exec_endless@dispatch@vcs0:
>     - shard-dg1:          NOTRUN -> [TIMEOUT][89] ([i915#3778])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-16/igt@gem_exec_endless@dispatch@vcs0.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-apl:          NOTRUN -> [FAIL][90] ([i915#2846])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-apl1/igt@gem_exec_fair@basic-deadline.html
>     - shard-glk:          NOTRUN -> [FAIL][91] ([i915#2846])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-glk4/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none:
>     - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#3539] / [i915#4852]) +19 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-13/igt@gem_exec_fair@basic-none.html
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][93] ([i915#2842]) +7 other tests fail
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-share:
>     - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#3539] / [i915#4852]) +16 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-2/igt@gem_exec_fair@basic-none-share.html
> 
>   * igt@gem_exec_fair@basic-none-solo:
>     - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#4473]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-1/igt@gem_exec_fair@basic-none-solo.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-apl:          NOTRUN -> [FAIL][96] ([i915#2842])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none@bcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][97] ([i915#2842]) +11 other tests fail
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html
> 
>   * igt@gem_exec_fair@basic-none@rcs0:
>     - shard-tglu:         NOTRUN -> [FAIL][98] ([i915#2842]) +10 other tests fail
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-9/igt@gem_exec_fair@basic-none@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo:
>     - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#3539]) +2 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@gem_exec_fair@basic-pace-solo.html
> 
>   * igt@gem_exec_fair@basic-sync:
>     - shard-mtlp:         NOTRUN -> [SKIP][100] ([i915#4473] / [i915#4771]) +9 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@gem_exec_fair@basic-sync.html
> 
>   * igt@gem_exec_fence@submit:
>     - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#4812]) +14 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-15/igt@gem_exec_fence@submit.html
> 
>   * igt@gem_exec_fence@submit67:
>     - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#4812]) +7 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@gem_exec_fence@submit67.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>     - shard-rkl:          NOTRUN -> [SKIP][103] ([fdo#109313])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
>     - shard-tglu:         NOTRUN -> [SKIP][104] ([fdo#109313])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
>     - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#3711])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> 
>   * igt@gem_exec_flush@basic-uc-prw-default:
>     - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#3539]) +5 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-16/igt@gem_exec_flush@basic-uc-prw-default.html
> 
>   * igt@gem_exec_gttfill@multigpu-basic:
>     - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#7697]) +3 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@gem_exec_gttfill@multigpu-basic.html
> 
>   * igt@gem_exec_params@rsvd2-dirt:
>     - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#5107])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@gem_exec_params@rsvd2-dirt.html
>     - shard-dg2:          NOTRUN -> [SKIP][109] ([fdo#109283] / [i915#5107])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-5/igt@gem_exec_params@rsvd2-dirt.html
>     - shard-rkl:          NOTRUN -> [SKIP][110] ([fdo#109283])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@gem_exec_params@rsvd2-dirt.html
>     - shard-dg1:          NOTRUN -> [SKIP][111] ([fdo#109283])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-18/igt@gem_exec_params@rsvd2-dirt.html
>     - shard-tglu:         NOTRUN -> [SKIP][112] ([fdo#109283])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-10/igt@gem_exec_params@rsvd2-dirt.html
> 
>   * igt@gem_exec_params@secure-non-master:
>     - shard-mtlp:         NOTRUN -> [SKIP][113] ([fdo#112283]) +1 other test skip
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@gem_exec_params@secure-non-master.html
> 
>   * igt@gem_exec_params@secure-non-root:
>     - shard-dg2:          NOTRUN -> [SKIP][114] ([fdo#112283]) +1 other test skip
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-2/igt@gem_exec_params@secure-non-root.html
>     - shard-rkl:          NOTRUN -> [SKIP][115] ([fdo#112283]) +2 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@gem_exec_params@secure-non-root.html
>     - shard-dg1:          NOTRUN -> [SKIP][116] ([fdo#112283]) +2 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-12/igt@gem_exec_params@secure-non-root.html
>     - shard-tglu:         NOTRUN -> [SKIP][117] ([fdo#112283]) +2 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-2/igt@gem_exec_params@secure-non-root.html
> 
>   * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
>     - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#3281]) +43 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
>     - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#3281]) +53 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-wc-read-noreloc:
>     - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#3281]) +40 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@gem_exec_reloc@basic-wc-read-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-write-gtt-active:
>     - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#3281]) +57 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-15/igt@gem_exec_reloc@basic-write-gtt-active.html
> 
>   * igt@gem_exec_schedule@deep@rcs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#4537])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@gem_exec_schedule@deep@rcs0.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts-chain:
>     - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#4537] / [i915#4812]) +4 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-1/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
> 
>   * igt@gem_exec_schedule@reorder-wide:
>     - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#4537] / [i915#4812]) +3 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html
> 
>   * igt@gem_exec_schedule@semaphore-power:
>     - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#7276])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices@lmem0:
>     - shard-dg2:          NOTRUN -> [ABORT][126] ([i915#7975] / [i915#8213])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-1/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices@smem:
>     - shard-rkl:          NOTRUN -> [ABORT][127] ([i915#7975] / [i915#8213]) +1 other test abort
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-5/igt@gem_exec_suspend@basic-s4-devices@smem.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-x:
>     - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#4860]) +6 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-x.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#4860]) +10 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-13/igt@gem_fenced_exec_thrash@no-spare-fences.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#4860]) +10 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#2190])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-5/igt@gem_huc_copy@huc-copy.html
>     - shard-apl:          NOTRUN -> [SKIP][132] ([fdo#109271] / [i915#2190])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-apl1/igt@gem_huc_copy@huc-copy.html
>     - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#2190])
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@gem_huc_copy@huc-copy.html
>     - shard-glk:          NOTRUN -> [SKIP][134] ([fdo#109271] / [i915#2190])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-glk4/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_evict@dontneed-evict-race:
>     - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#4613] / [i915#7582])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-4/igt@gem_lmem_evict@dontneed-evict-race.html
>     - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#4613] / [i915#7582])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-10/igt@gem_lmem_evict@dontneed-evict-race.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi:
>     - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#4613]) +20 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-6/igt@gem_lmem_swapping@heavy-verify-multi.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#4613]) +17 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-apl:          NOTRUN -> [SKIP][139] ([fdo#109271] / [i915#4613]) +20 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-apl1/igt@gem_lmem_swapping@smem-oom.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][140] ([i915#5493])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-1/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_lmem_swapping@verify-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#4613]) +20 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-6/igt@gem_lmem_swapping@verify-ccs.html
>     - shard-glk:          NOTRUN -> [SKIP][142] ([fdo#109271] / [i915#4613]) +19 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-glk3/igt@gem_lmem_swapping@verify-ccs.html
> 
>   * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#4565]) +4 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-16/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html
> 
>   * igt@gem_media_fill@media-fill:
>     - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#8289])
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-6/igt@gem_media_fill@media-fill.html
> 
>   * igt@gem_media_vme:
>     - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#284])
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-6/igt@gem_media_vme.html
>     - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#284])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@gem_media_vme.html
>     - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#284])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-13/igt@gem_media_vme.html
>     - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#284])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-10/igt@gem_media_vme.html
> 
>   * igt@gem_mmap@short-mmap:
>     - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#4083]) +27 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@gem_mmap@short-mmap.html
> 
>   * igt@gem_mmap_gtt@basic-small-bo:
>     - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#4077]) +44 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-3/igt@gem_mmap_gtt@basic-small-bo.html
> 
>   * igt@gem_mmap_gtt@coherency:
>     - shard-tglu:         NOTRUN -> [SKIP][151] ([fdo#111656])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-2/igt@gem_mmap_gtt@coherency.html
>     - shard-rkl:          NOTRUN -> [SKIP][152] ([fdo#111656])
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@gem_mmap_gtt@coherency.html
> 
>   * igt@gem_mmap_gtt@cpuset-medium-copy:
>     - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#4077]) +65 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@gem_mmap_gtt@cpuset-medium-copy.html
> 
>   * igt@gem_mmap_wc@write-prefaulted:
>     - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#4083]) +17 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@gem_mmap_wc@write-prefaulted.html
> 
>   * igt@gem_mmap_wc@write-read:
>     - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#4083]) +28 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-18/igt@gem_mmap_wc@write-read.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#3282]) +26 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-13/igt@gem_pread@exhaustion.html
>     - shard-apl:          NOTRUN -> [WARN][157] ([i915#2658]) +1 other test warn
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-apl1/igt@gem_pread@exhaustion.html
>     - shard-snb:          NOTRUN -> [WARN][158] ([i915#2658]) +1 other test warn
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-snb1/igt@gem_pread@exhaustion.html
>     - shard-tglu:         NOTRUN -> [WARN][159] ([i915#2658]) +1 other test warn
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-7/igt@gem_pread@exhaustion.html
>     - shard-glk:          NOTRUN -> [WARN][160] ([i915#2658]) +1 other test warn
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-glk4/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pread@snoop:
>     - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#3282]) +20 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@gem_pread@snoop.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#3282]) +24 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@display-protected-crc:
>     - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#4270]) +14 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-5/igt@gem_pxp@display-protected-crc.html
> 
>   * igt@gem_pxp@fail-invalid-protected-context:
>     - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#4270]) +19 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-2/igt@gem_pxp@fail-invalid-protected-context.html
> 
>   * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>     - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#4270]) +16 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-4/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> 
>   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>     - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#4270]) +19 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-12/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
>     - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#4270]) +17 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-2/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
> 
>   * igt@gem_readwrite@read-bad-handle:
>     - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#3282]) +26 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@gem_readwrite@read-bad-handle.html
> 
>   * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
>     - shard-apl:          NOTRUN -> [SKIP][169] ([fdo#109271]) +1034 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-apl7/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#8428]) +32 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>     - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#4079]) +2 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-10/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> 
>   * igt@gem_softpin@evict-snoop:
>     - shard-rkl:          NOTRUN -> [SKIP][172] ([fdo#109312]) +1 other test skip
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-4/igt@gem_softpin@evict-snoop.html
>     - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#4885]) +1 other test skip
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-15/igt@gem_softpin@evict-snoop.html
>     - shard-tglu:         NOTRUN -> [SKIP][174] ([fdo#109312]) +1 other test skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-10/igt@gem_softpin@evict-snoop.html
>     - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#4885])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@gem_softpin@evict-snoop.html
> 
>   * igt@gem_softpin@evict-snoop-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#4885])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@gem_softpin@evict-snoop-interruptible.html
> 
>   * igt@gem_spin_batch@user-each:
>     - shard-mtlp:         NOTRUN -> [DMESG-FAIL][177] ([i915#8962])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@gem_spin_batch@user-each.html
> 
>   * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
>     - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#4077]) +60 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-18/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gem_tiled_pread_pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#4079]) +7 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-18/igt@gem_tiled_pread_pwrite.html
>     - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#4079]) +7 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@gem_tiled_pread_pwrite.html
> 
>   * igt@gem_unfence_active_buffers:
>     - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#4879])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-19/igt@gem_unfence_active_buffers.html
>     - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#4879])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-7/igt@gem_unfence_active_buffers.html
> 
>   * igt@gem_userptr_blits@coherency-sync:
>     - shard-tglu:         NOTRUN -> [SKIP][183] ([fdo#110542])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-5/igt@gem_userptr_blits@coherency-sync.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#3297]) +9 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-2/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-apl:          NOTRUN -> [SKIP][185] ([fdo#109271] / [i915#3323])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-apl3/igt@gem_userptr_blits@dmabuf-sync.html
>     - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#3323])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-10/igt@gem_userptr_blits@dmabuf-sync.html
>     - shard-glk:          NOTRUN -> [SKIP][187] ([fdo#109271] / [i915#3323])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-glk8/igt@gem_userptr_blits@dmabuf-sync.html
>     - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#3323])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>     - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#3297] / [i915#4880]) +3 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-16/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
>     - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#3297] / [i915#4880]) +2 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
> 
>   * igt@gem_userptr_blits@mmap-offset-banned@gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#3297]) +15 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-2/igt@gem_userptr_blits@mmap-offset-banned@gtt.html
> 
>   * igt@gem_userptr_blits@readonly-pwrite-unsync:
>     - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#3297]) +10 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>   * igt@gem_userptr_blits@sd-probe:
>     - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#3297] / [i915#4958])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-2/igt@gem_userptr_blits@sd-probe.html
>     - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#3297] / [i915#4958])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-15/igt@gem_userptr_blits@sd-probe.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-after-close:
>     - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#3297]) +8 other tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-after-close.html
>     - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#3297]) +12 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-19/igt@gem_userptr_blits@unsync-unmap-after-close.html
> 
>   * igt@gem_userptr_blits@vma-merge:
>     - shard-rkl:          NOTRUN -> [FAIL][197] ([i915#3318])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-5/igt@gem_userptr_blits@vma-merge.html
>     - shard-dg1:          NOTRUN -> [FAIL][198] ([i915#3318])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-18/igt@gem_userptr_blits@vma-merge.html
>     - shard-snb:          NOTRUN -> [FAIL][199] ([i915#2724])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-snb6/igt@gem_userptr_blits@vma-merge.html
>     - shard-tglu:         NOTRUN -> [FAIL][200] ([i915#3318])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-6/igt@gem_userptr_blits@vma-merge.html
>     - shard-glk:          NOTRUN -> [FAIL][201] ([i915#3318])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-glk3/igt@gem_userptr_blits@vma-merge.html
>     - shard-mtlp:         NOTRUN -> [FAIL][202] ([i915#3318])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@gem_userptr_blits@vma-merge.html
> 
>   * igt@gen3_render_tiledy_blits:
>     - shard-mtlp:         NOTRUN -> [SKIP][203] ([fdo#109289]) +22 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@gen3_render_tiledy_blits.html
> 
>   * igt@gen7_exec_parse@bitmasks:
>     - shard-dg2:          NOTRUN -> [SKIP][204] ([fdo#109289]) +16 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-2/igt@gen7_exec_parse@bitmasks.html
> 
>   * igt@gen7_exec_parse@chained-batch:
>     - shard-rkl:          NOTRUN -> [SKIP][205] ([fdo#109289]) +20 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@gen7_exec_parse@chained-batch.html
> 
>   * igt@gen7_exec_parse@load-register-reg:
>     - shard-tglu:         NOTRUN -> [SKIP][206] ([fdo#109289]) +24 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-10/igt@gen7_exec_parse@load-register-reg.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#2856]) +19 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-6/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@bb-chained:
>     - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#2527]) +13 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@gen9_exec_parse@bb-chained.html
> 
>   * igt@gen9_exec_parse@bb-start-cmd:
>     - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#2527]) +19 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-19/igt@gen9_exec_parse@bb-start-cmd.html
> 
>   * igt@gen9_exec_parse@unaligned-access:
>     - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#2856]) +15 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-6/igt@gen9_exec_parse@unaligned-access.html
> 
>   * igt@gen9_exec_parse@unaligned-jump:
>     - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#2527] / [i915#2856]) +20 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@gen9_exec_parse@unaligned-jump.html
> 
>   * igt@i915_fb_tiling:
>     - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#4881]) +1 other test skip
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@i915_fb_tiling.html
>     - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#4881]) +1 other test skip
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-1/igt@i915_fb_tiling.html
> 
>   * igt@i915_module_load@load:
>     - shard-snb:          NOTRUN -> [SKIP][214] ([fdo#109271] / [i915#6227])
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-snb1/igt@i915_module_load@load.html
>     - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#6227])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-17/igt@i915_module_load@load.html
>     - shard-apl:          NOTRUN -> [SKIP][216] ([fdo#109271] / [i915#6227])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-apl4/igt@i915_module_load@load.html
>     - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#6227])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@i915_module_load@load.html
>     - shard-glk:          NOTRUN -> [SKIP][218] ([fdo#109271] / [i915#6227])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-glk1/igt@i915_module_load@load.html
>     - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#6227])
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@i915_module_load@load.html
>     - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#6227])
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-3/igt@i915_module_load@load.html
>     - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#6227])
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@i915_module_load@load.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-mtlp:         NOTRUN -> [ABORT][222] ([i915#8489] / [i915#8668])
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][223] ([i915#9559])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#6412])
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@i915_module_load@resize-bar.html
>     - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#7178])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-17/igt@i915_module_load@resize-bar.html
>     - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#6412])
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@i915_module_load@resize-bar.html
>     - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#6412])
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-2/igt@i915_module_load@resize-bar.html
> 
>   * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-apl:          NOTRUN -> [FAIL][228] ([i915#7036]) +1 other test fail
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-apl2/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
>     - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#8436])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-7/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@i915_pm_freq_api@freq-basic-api:
>     - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#8399]) +3 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-5/igt@i915_pm_freq_api@freq-basic-api.html
> 
>   * igt@i915_pm_freq_api@freq-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#8399]) +2 other tests skip
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html
> 
>   * igt@i915_pm_freq_mult@media-freq@gt0:
>     - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#6590])
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html
>     - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#6590])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-18/igt@i915_pm_freq_mult@media-freq@gt0.html
>     - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#6590])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-10/igt@i915_pm_freq_mult@media-freq@gt0.html
> 
>   * igt@i915_pm_freq_mult@media-freq@gt1:
>     - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#6590]) +1 other test skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@i915_pm_freq_mult@media-freq@gt1.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>     - shard-tglu:         NOTRUN -> [WARN][236] ([i915#2681]) +4 other tests warn
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
>     - shard-dg1:          NOTRUN -> [FAIL][237] ([i915#3591]) +2 other tests fail
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-mtlp:         NOTRUN -> [SKIP][238] ([fdo#109293])
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
>     - shard-dg2:          NOTRUN -> [SKIP][239] ([fdo#109293] / [fdo#109506])
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
>     - shard-rkl:          NOTRUN -> [SKIP][240] ([fdo#109293] / [fdo#109506])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-4/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
>     - shard-dg1:          NOTRUN -> [SKIP][241] ([fdo#109293] / [fdo#109506])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-19/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
>     - shard-tglu:         NOTRUN -> [SKIP][242] ([fdo#109293] / [fdo#109506])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:
>     - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#8431])
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#6621]) +2 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-13/igt@i915_pm_rps@basic-api.html
>     - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#6621]) +2 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-6/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_pm_rps@engine-order:
>     - shard-apl:          NOTRUN -> [FAIL][246] ([i915#6537])
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-apl1/igt@i915_pm_rps@engine-order.html
> 
>   * igt@i915_pm_rps@min-max-config-idle:
>     - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#6621]) +1 other test skip
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-1/igt@i915_pm_rps@min-max-config-idle.html
> 
>   * igt@i915_pm_rps@thresholds-idle@gt0:
>     - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#8925]) +3 other tests skip
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-12/igt@i915_pm_rps@thresholds-idle@gt0.html
>     - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#8925]) +2 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@i915_pm_rps@thresholds-idle@gt0.html
> 
>   * igt@i915_pm_rps@thresholds@gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#8925]) +2 other tests skip
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-5/igt@i915_pm_rps@thresholds@gt0.html
> 
>   * igt@i915_pm_rps@thresholds@gt1:
>     - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#3555] / [i915#8925]) +2 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@i915_pm_rps@thresholds@gt1.html
> 
>   * igt@i915_pm_rps@waitboost:
>     - shard-mtlp:         NOTRUN -> [FAIL][252] ([i915#8346]) +1 other test fail
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@i915_pm_rps@waitboost.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#4387])
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-6/igt@i915_pm_sseu@full-enable.html
>     - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#4387])
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@i915_pm_sseu@full-enable.html
>     - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#4387])
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-13/igt@i915_pm_sseu@full-enable.html
>     - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#4387])
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-10/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_power@sanity:
>     - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#7984])
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@i915_power@sanity.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#6245])
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-17/igt@i915_query@hwconfig_table.html
>     - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#6245])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@i915_query@hwconfig_table.html
>     - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#6245])
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@i915_query@hwconfig_table.html
> 
>   * igt@i915_query@query-topology-coherent-slice-mask:
>     - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#6188])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-6/igt@i915_query@query-topology-coherent-slice-mask.html
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-dg1:          NOTRUN -> [SKIP][262] ([fdo#109303])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-12/igt@i915_query@query-topology-known-pci-ids.html
>     - shard-tglu:         NOTRUN -> [SKIP][263] ([fdo#109303])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-2/igt@i915_query@query-topology-known-pci-ids.html
>     - shard-mtlp:         NOTRUN -> [SKIP][264] ([fdo#109303])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-7/igt@i915_query@query-topology-known-pci-ids.html
>     - shard-dg2:          NOTRUN -> [SKIP][265] ([fdo#109303])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-2/igt@i915_query@query-topology-known-pci-ids.html
>     - shard-rkl:          NOTRUN -> [SKIP][266] ([fdo#109303])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@i915_query@query-topology-known-pci-ids.html
> 
>   * igt@i915_query@query-topology-unsupported:
>     - shard-rkl:          NOTRUN -> [SKIP][267] ([fdo#109302])
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-5/igt@i915_query@query-topology-unsupported.html
>     - shard-dg1:          NOTRUN -> [SKIP][268] ([fdo#109302])
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-15/igt@i915_query@query-topology-unsupported.html
>     - shard-tglu:         NOTRUN -> [SKIP][269] ([fdo#109302])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@i915_query@query-topology-unsupported.html
>     - shard-mtlp:         NOTRUN -> [SKIP][270] ([fdo#109302])
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@i915_query@query-topology-unsupported.html
>     - shard-dg2:          NOTRUN -> [SKIP][271] ([fdo#109302])
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-1/igt@i915_query@query-topology-unsupported.html
> 
>   * igt@i915_query@test-query-geometry-subslices:
>     - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#5723])
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@i915_query@test-query-geometry-subslices.html
>     - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#5723])
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-12/igt@i915_query@test-query-geometry-subslices.html
>     - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#5723])
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-2/igt@i915_query@test-query-geometry-subslices.html
> 
>   * igt@i915_selftest@mock@memory_region:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][275] ([i915#9311])
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-3/igt@i915_selftest@mock@memory_region.html
>     - shard-dg1:          NOTRUN -> [DMESG-WARN][276] ([i915#9311])
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-13/igt@i915_selftest@mock@memory_region.html
>     - shard-apl:          NOTRUN -> [DMESG-WARN][277] ([i915#9311])
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-apl2/igt@i915_selftest@mock@memory_region.html
>     - shard-snb:          NOTRUN -> [DMESG-WARN][278] ([i915#9311])
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-snb1/igt@i915_selftest@mock@memory_region.html
>     - shard-tglu:         NOTRUN -> [DMESG-WARN][279] ([i915#9311])
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-5/igt@i915_selftest@mock@memory_region.html
>     - shard-glk:          NOTRUN -> [DMESG-WARN][280] ([i915#9311])
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-glk1/igt@i915_selftest@mock@memory_region.html
>     - shard-mtlp:         NOTRUN -> [DMESG-WARN][281] ([i915#9311])
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@i915_selftest@mock@memory_region.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][282] ([i915#7443])
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-8/igt@i915_suspend@basic-s3-without-i915.html
>     - shard-mtlp:         NOTRUN -> [SKIP][283] ([i915#6645])
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#4212]) +8 other tests skip
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#5190])
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#4215])
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-16/igt@kms_addfb_basic@basic-y-tiled-legacy.html
>     - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#4215] / [i915#5190])
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-10/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
>     - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#4212]) +7 other tests skip
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-16/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
> 
>   * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#4212]) +4 other tests skip
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-1/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#3826])
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
>     - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#3826])
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
>     - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#3826])
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_addfb_basic@tile-pitch-mismatch:
>     - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#4212] / [i915#5608])
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@kms_addfb_basic@tile-pitch-mismatch.html
> 
>   * igt@kms_async_flips@crc@pipe-b-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [FAIL][294] ([i915#8247]) +3 other tests fail
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-13/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_async_flips@crc@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [FAIL][295] ([i915#8247]) +3 other tests fail
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-6/igt@kms_async_flips@crc@pipe-d-edp-1.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#6228])
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-1/igt@kms_async_flips@invalid-async-flip.html
>     - shard-mtlp:         NOTRUN -> [SKIP][297] ([i915#6228])
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_async_flips@test-cursor:
>     - shard-mtlp:         NOTRUN -> [SKIP][298] ([i915#6229])
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@kms_async_flips@test-cursor.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#3555]) +2 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>     - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#9531])
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-12/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>     - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#9531])
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#1769] / [i915#3555])
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-snb:          NOTRUN -> [SKIP][303] ([fdo#109271] / [i915#1769]) +1 other test skip
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-snb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>     - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#1769] / [i915#3555]) +1 other test skip
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>     - shard-glk:          NOTRUN -> [SKIP][305] ([fdo#109271] / [i915#1769]) +1 other test skip
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>     - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#1769] / [i915#3555])
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#1769] / [i915#3555]) +1 other test skip
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>     - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#1769] / [i915#3555]) +1 other test skip
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-16/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>     - shard-apl:          NOTRUN -> [SKIP][309] ([fdo#109271] / [i915#1769]) +1 other test skip
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-apl1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-tglu:         NOTRUN -> [SKIP][310] ([fdo#111615] / [i915#5286]) +30 other tests skip
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#5286]) +25 other tests skip
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#5286]) +2 other tests skip
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>     - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#5286]) +2 other tests skip
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-6/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#4538] / [i915#5286]) +30 other tests skip
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-mtlp:         NOTRUN -> [FAIL][315] ([i915#5138]) +1 other test fail
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-tglu:         NOTRUN -> [SKIP][316] ([fdo#111614]) +18 other tests skip
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-5/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][317] ([fdo#111614]) +22 other tests skip
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-6/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][318] ([fdo#111614]) +15 other tests skip
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-tglu:         NOTRUN -> [FAIL][319] ([i915#3743])
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>     - shard-mtlp:         NOTRUN -> [SKIP][320] ([fdo#111615]) +58 other tests skip
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][321] ([fdo#111614] / [i915#3638]) +14 other tests skip
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#3638]) +19 other tests skip
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-18/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#5190]) +51 other tests skip
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#4538] / [i915#5190]) +21 other tests skip
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-rkl:          NOTRUN -> [SKIP][325] ([fdo#111615]) +2 other tests skip
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg1:          NOTRUN -> [SKIP][326] ([fdo#111615]) +2 other tests skip
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-19/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>     - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#6187]) +4 other tests skip
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#4538]) +30 other tests skip
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-rkl:          NOTRUN -> [SKIP][329] ([fdo#110723]) +19 other tests skip
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-tglu:         NOTRUN -> [SKIP][330] ([fdo#111615]) +34 other tests skip
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_joiner@2x-modeset:
>     - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#2705]) +2 other tests skip
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-2/igt@kms_big_joiner@2x-modeset.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-dg1:          NOTRUN -> [SKIP][332] ([i915#2705]) +2 other tests skip
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-15/igt@kms_big_joiner@invalid-modeset.html
>     - shard-tglu:         NOTRUN -> [SKIP][333] ([i915#2705]) +2 other tests skip
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@kms_big_joiner@invalid-modeset.html
>     - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#2705]) +2 other tests skip
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@kms_big_joiner@invalid-modeset.html
>     - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#2705]) +1 other test skip
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-1/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#3742]) +2 other tests skip
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-17/igt@kms_cdclk@mode-transition-all-outputs.html
>     - shard-tglu:         NOTRUN -> [SKIP][337] ([i915#3742]) +2 other tests skip
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-6/igt@kms_cdclk@mode-transition-all-outputs.html
>     - shard-mtlp:         NOTRUN -> [SKIP][338] ([i915#7213])
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-6/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][339] ([i915#7213] / [i915#9010]) +3 other tests skip
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-6/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#4087] / [i915#7213]) +4 other tests skip
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#3742]) +2 other tests skip
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][342] ([i915#4087]) +3 other tests skip
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-6/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg1:          NOTRUN -> [SKIP][343] ([fdo#111827]) +10 other tests skip
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-19/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-mtlp:         NOTRUN -> [SKIP][344] ([fdo#111827]) +9 other tests skip
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-dg2:          NOTRUN -> [SKIP][345] ([fdo#111827]) +7 other tests skip
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-5/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-rkl:          NOTRUN -> [SKIP][346] ([fdo#111827]) +9 other tests skip
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-4/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-tglu:         NOTRUN -> [SKIP][347] ([fdo#111827]) +10 other tests skip
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-5/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][348] ([i915#7828]) +46 other tests skip
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#7828]) +35 other tests skip
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-3/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>     - shard-mtlp:         NOTRUN -> [SKIP][350] ([i915#7828]) +48 other tests skip
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>     - shard-tglu:         NOTRUN -> [SKIP][351] ([i915#7828]) +50 other tests skip
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-9/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#7828]) +49 other tests skip
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-18/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_color@degamma@pipe-d:
>     - shard-mtlp:         NOTRUN -> [FAIL][353] ([i915#9257]) +3 other tests fail
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@kms_color@degamma@pipe-d.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-dg1:          NOTRUN -> [SKIP][354] ([i915#7116]) +6 other tests skip
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-13/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#6944] / [i915#7116] / [i915#7118]) +6 other tests skip
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-5/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#3116] / [i915#3299]) +3 other tests skip
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-0.html
>     - shard-mtlp:         NOTRUN -> [SKIP][357] ([i915#3299]) +3 other tests skip
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-7/igt@kms_content_protection@dp-mst-lic-type-0.html
>     - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#3299]) +2 other tests skip
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-rkl:          NOTRUN -> [SKIP][359] ([i915#3116]) +2 other tests skip
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1.html
>     - shard-dg1:          NOTRUN -> [SKIP][360] ([i915#3299]) +3 other tests skip
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-17/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@lic:
>     - shard-mtlp:         NOTRUN -> [SKIP][361] ([i915#6944]) +5 other tests skip
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@kms_content_protection@lic.html
> 
>   * igt@kms_content_protection@lic@pipe-a-dp-1:
>     - shard-apl:          NOTRUN -> [TIMEOUT][362] ([i915#7173]) +4 other tests timeout
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-apl3/igt@kms_content_protection@lic@pipe-a-dp-1.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][363] ([i915#7173])
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-dg2:          NOTRUN -> [SKIP][364] ([i915#7118]) +3 other tests skip
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-2/igt@kms_content_protection@type1.html
>     - shard-rkl:          NOTRUN -> [SKIP][365] ([i915#7118]) +4 other tests skip
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@kms_content_protection@type1.html
>     - shard-mtlp:         NOTRUN -> [SKIP][366] ([i915#3555] / [i915#6944])
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-7/igt@kms_content_protection@type1.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-1:
>     - shard-apl:          NOTRUN -> [FAIL][367] ([i915#1339])
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-apl2/igt@kms_content_protection@uevent@pipe-a-dp-1.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [FAIL][368] ([i915#1339])
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@kms_content_protection@uevent@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x85:
>     - shard-rkl:          NOTRUN -> [SKIP][369] ([i915#4098]) +44 other tests skip
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-tglu:         NOTRUN -> [SKIP][370] ([fdo#109279] / [i915#3359]) +1 other test skip
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-9/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>     - shard-rkl:          NOTRUN -> [SKIP][371] ([fdo#109279] / [i915#3359]) +1 other test skip
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x10:
>     - shard-mtlp:         NOTRUN -> [SKIP][372] ([i915#3555] / [i915#8814]) +12 other tests skip
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#3359]) +7 other tests skip
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>     - shard-mtlp:         NOTRUN -> [SKIP][374] ([i915#3359]) +9 other tests skip
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-dg2:          NOTRUN -> [SKIP][375] ([i915#3359]) +5 other tests skip
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>     - shard-dg2:          NOTRUN -> [SKIP][376] ([i915#3555]) +21 other tests skip
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-rkl:          NOTRUN -> [SKIP][377] ([i915#3359]) +4 other tests skip
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
>     - shard-dg1:          NOTRUN -> [SKIP][378] ([i915#3359]) +9 other tests skip
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-13/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [FAIL][379] ([fdo#103375]) +6 other tests fail
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-5/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-rkl:          NOTRUN -> [SKIP][380] ([fdo#111767] / [fdo#111825]) +5 other tests skip
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>     - shard-dg1:          NOTRUN -> [SKIP][381] ([fdo#111767] / [fdo#111825]) +5 other tests skip
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-13/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>     - shard-apl:          NOTRUN -> [SKIP][382] ([fdo#109271] / [fdo#111767]) +5 other tests skip
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-apl7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>     - shard-snb:          NOTRUN -> [SKIP][383] ([fdo#109271] / [fdo#111767]) +5 other tests skip
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-snb6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>     - shard-tglu:         NOTRUN -> [SKIP][384] ([fdo#109274] / [fdo#111767]) +2 other tests skip
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-10/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>     - shard-dg2:          NOTRUN -> [SKIP][385] ([fdo#109274] / [fdo#111767] / [i915#5354]) +1 other test skip
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][386] ([i915#4103] / [i915#4213] / [i915#5608]) +1 other test skip
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-rkl:          NOTRUN -> [SKIP][387] ([i915#4103]) +4 other tests skip
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>     - shard-dg1:          NOTRUN -> [SKIP][388] ([i915#4103] / [i915#4213]) +5 other tests skip
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-12/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>     - shard-mtlp:         NOTRUN -> [SKIP][389] ([i915#3546]) +24 other tests skip
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-rkl:          NOTRUN -> [SKIP][390] ([i915#1845] / [i915#4098]) +45 other tests skip
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>     - shard-dg2:          NOTRUN -> [SKIP][391] ([fdo#109274] / [i915#5354]) +20 other tests skip
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-tglu:         NOTRUN -> [SKIP][392] ([fdo#109274]) +25 other tests skip
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-mtlp:         NOTRUN -> [SKIP][393] ([fdo#111767] / [i915#3546]) +2 other tests skip
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-glk:          NOTRUN -> [FAIL][394] ([i915#2346]) +1 other test fail
>    [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@forked-move@all-pipes:
>     - shard-mtlp:         NOTRUN -> [DMESG-WARN][395] ([i915#2017])
>    [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@kms_cursor_legacy@forked-move@all-pipes.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-tglu:         NOTRUN -> [SKIP][396] ([i915#4103]) +5 other tests skip
>    [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>     - shard-mtlp:         NOTRUN -> [SKIP][397] ([i915#4213]) +3 other tests skip
>    [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>     - shard-dg2:          NOTRUN -> [SKIP][398] ([i915#4103] / [i915#4213]) +2 other tests skip
>    [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][399] ([i915#9227])
>    [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-8/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1.html
> 
>   * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][400] ([i915#9227])
>    [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2.html
> 
>   * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][401] ([i915#9227])
>    [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-18/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4.html
> 
>   * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][402] ([i915#9226] / [i915#9261]) +1 other test skip
>    [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-8/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html
> 
>   * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][403] ([i915#9226] / [i915#9261]) +1 other test skip
>    [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-2.html
> 
>   * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][404] ([i915#9226] / [i915#9261]) +1 other test skip
>    [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-18/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-mtlp:         NOTRUN -> [SKIP][405] ([i915#3555] / [i915#8827])
>    [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-4/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2:          NOTRUN -> [SKIP][406] ([i915#8588])
>    [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-1/igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-dg1:          NOTRUN -> [SKIP][407] ([i915#8588])
>    [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-15/igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-tglu:         NOTRUN -> [SKIP][408] ([i915#8588])
>    [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-mtlp:         NOTRUN -> [SKIP][409] ([i915#8588])
>    [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][410] ([i915#3804])
>    [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][411] ([i915#3804])
>    [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-tglu:         NOTRUN -> [SKIP][412] ([i915#1257])
>    [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-5/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][413] ([i915#8812]) +1 other test skip
>    [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-16/igt@kms_draw_crc@draw-method-mmap-gtt.html
>     - shard-mtlp:         NOTRUN -> [SKIP][414] ([i915#3555] / [i915#8812])
>    [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-6/igt@kms_draw_crc@draw-method-mmap-gtt.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][415] ([i915#8812])
>    [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-wc.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][416] ([i915#3555] / [i915#3840]) +3 other tests skip
>    [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-5/igt@kms_dsc@dsc-basic.html
>     - shard-rkl:          NOTRUN -> [SKIP][417] ([i915#3555] / [i915#3840]) +3 other tests skip
>    [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-1/igt@kms_dsc@dsc-basic.html
>     - shard-dg1:          NOTRUN -> [SKIP][418] ([i915#3555] / [i915#3840]) +4 other tests skip
>    [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-17/igt@kms_dsc@dsc-basic.html
>     - shard-mtlp:         NOTRUN -> [SKIP][419] ([i915#3555] / [i915#3840] / [i915#9159])
>    [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-2/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-tglu:         NOTRUN -> [SKIP][420] ([i915#3555] / [i915#3840]) +4 other tests skip
>    [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-7/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-mtlp:         NOTRUN -> [SKIP][421] ([i915#3555] / [i915#3840]) +3 other tests skip
>    [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2:          NOTRUN -> [SKIP][422] ([i915#3469]) +1 other test skip
>    [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-2/igt@kms_fbcon_fbt@psr.html
>     - shard-rkl:          NOTRUN -> [SKIP][423] ([i915#3955])
>    [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-7/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg1:          NOTRUN -> [SKIP][424] ([i915#3469]) +1 other test skip
>    [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-18/igt@kms_fbcon_fbt@psr-suspend.html
>     - shard-tglu:         NOTRUN -> [SKIP][425] ([i915#3469]) +1 other test skip
>    [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-7/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_fence_pin_leak:
>     - shard-dg1:          NOTRUN -> [SKIP][426] ([i915#4881]) +1 other test skip
>    [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-19/igt@kms_fence_pin_leak.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-tglu:         NOTRUN -> [SKIP][427] ([fdo#109274] / [i915#3637] / [i915#3966])
>    [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-7/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>     - shard-tglu:         NOTRUN -> [SKIP][428] ([fdo#109274] / [i915#3637]) +36 other tests skip
>    [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-9/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-dg2:          NOTRUN -> [SKIP][429] ([fdo#109274] / [fdo#111767]) +2 other tests skip
>    [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
>     - shard-tglu:         NOTRUN -> [SKIP][430] ([fdo#109274] / [fdo#111767] / [i915#3637]) +2 other tests skip
>    [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][431] ([fdo#111767] / [i915#3637]) +2 other tests skip
>    [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][432] ([i915#8381]) +3 other tests skip
>    [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg1-13/igt@kms_flip@2x-flip-vs-fences.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-dg2:          NOTRUN -> [SKIP][433] ([fdo#109274]) +26 other tests skip
>    [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-2/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][434] ([i915#3637]) +33 other tests skip
>    [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][435] ([i915#3637] / [i915#4098]) +6 other tests skip
>    [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-rkl-5/igt@kms_flip@basic-flip-vs-dpms.html
> 
>   * igt@kms_flip@flip-vs-fences:
>     - shard-mtlp:         NOTRUN -> [SKIP][436] ([i915#8381]) +3 other tests skip
>    [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-mtlp-8/igt@kms_flip@flip-vs-fences.html
> 
>   * igt@kms_flip@flip-vs-fences-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][437] ([i915#8381]) +3 other tests skip
>    [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-dg2-3/igt@kms_flip@flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][438] ([i915#2587] / [i915#2672]) +23 other tests skip
>    [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.ht
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10073/index.html
