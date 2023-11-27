Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4B110E3AB
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Nov 2023 16:48:21 +0000 (UTC)
Date: Mon, 27 Nov 2023 17:48:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231127164816.kyrvb4tpppar5qdl@kamilkon-desk.igk.intel.com>
References: <20231030110918.8347-1-marcin.bernatowicz@intel.com>
 <169877899403.27664.14887418982140284969@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169877899403.27664.14887418982140284969@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSAgZm9yIGJlbmNo?=
 =?utf-8?q?marks/gem=5Fwsim=3A_introduce_bb=5Fsize_field_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 lgci.bug.filing@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

below is old regression unrelated to benchmarks change,
no need for respin.

Regards,
Kamil

On 2023-10-31 at 19:03:14 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: benchmarks/gem_wsim: introduce bb_size field (rev2)
> URL   : https://patchwork.freedesktop.org/series/125689/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13813_full -> IGTPW_10084_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10084_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10084_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/index.html
> 
> Participating hosts (13 -> 12)
> ------------------------------
> 
>   Missing    (1): shard-tglu0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10084_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0:
>     - shard-apl:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-apl4/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-apl3/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10084_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#8411])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@api_intel_bb@blit-reloc-keep-cache.html
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-mtlp:         NOTRUN -> [SKIP][4] ([i915#8411])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-1/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-tglu:         NOTRUN -> [SKIP][5] ([i915#7701])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-6/igt@device_reset@unbind-cold-reset-rebind.html
> 
>   * igt@drm_fdinfo@busy-idle@bcs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][6] ([i915#8414]) +5 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-2/igt@drm_fdinfo@busy-idle@bcs0.html
> 
>   * igt@drm_fdinfo@idle@rcs0:
>     - shard-rkl:          [PASS][7] -> [FAIL][8] ([i915#7742])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@drm_fdinfo@idle@rcs0.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-2/igt@drm_fdinfo@idle@rcs0.html
> 
>   * igt@drm_fdinfo@most-busy-check-all@bcs0:
>     - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#8414]) +20 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-2/igt@drm_fdinfo@most-busy-check-all@bcs0.html
> 
>   * igt@drm_read@short-buffer-block:
>     - shard-rkl:          [PASS][10] -> [SKIP][11] ([i915#4098]) +6 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-2/igt@drm_read@short-buffer-block.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@drm_read@short-buffer-block.html
> 
>   * igt@fbdev@info:
>     - shard-rkl:          [PASS][12] -> [SKIP][13] ([i915#1849] / [i915#2582])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-1/igt@fbdev@info.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@fbdev@info.html
> 
>   * igt@fbdev@unaligned-read:
>     - shard-rkl:          [PASS][14] -> [SKIP][15] ([i915#2582]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-2/igt@fbdev@unaligned-read.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@fbdev@unaligned-read.html
> 
>   * igt@gem_bad_reloc@negative-reloc:
>     - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#3281])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-17/igt@gem_bad_reloc@negative-reloc.html
> 
>   * igt@gem_barrier_race@remote-request@rcs0:
>     - shard-glk:          [PASS][17] -> [ABORT][18] ([i915#8190])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-glk3/igt@gem_barrier_race@remote-request@rcs0.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-glk4/igt@gem_barrier_race@remote-request@rcs0.html
> 
>   * igt@gem_basic@multigpu-create-close:
>     - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#7697])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-7/igt@gem_basic@multigpu-create-close.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#8562])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-1/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-tglu:         [PASS][21] -> [FAIL][22] ([i915#6268])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-tglu-10/igt@gem_ctx_exec@basic-nohangcheck.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-10/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_freq@sysfs@gt0:
>     - shard-dg2:          [PASS][23] -> [FAIL][24] ([i915#9561])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-dg2-11/igt@gem_ctx_freq@sysfs@gt0.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@gem_ctx_freq@sysfs@gt0.html
> 
>   * igt@gem_ctx_param@set-priority-not-supported:
>     - shard-dg2:          NOTRUN -> [SKIP][25] ([fdo#109314])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@gem_ctx_param@set-priority-not-supported.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hostile:
>     - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#8555]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hostile.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-cleanup:
>     - shard-snb:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#1099]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-snb6/igt@gem_ctx_persistence@legacy-engines-cleanup.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-hostile@vebox:
>     - shard-mtlp:         [PASS][28] -> [FAIL][29] ([i915#2410]) +2 other tests fail
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-mtlp-6/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-5/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
>     - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#5882]) +9 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html
> 
>   * igt@gem_eio@in-flight-1us:
>     - shard-mtlp:         [PASS][31] -> [ABORT][32] ([i915#9414])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-mtlp-7/igt@gem_eio@in-flight-1us.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-3/igt@gem_eio@in-flight-1us.html
> 
>   * igt@gem_exec_balancer@bonded-pair:
>     - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#4771])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-1/igt@gem_exec_balancer@bonded-pair.html
> 
>   * igt@gem_exec_balancer@bonded-semaphore:
>     - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#4812])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-13/igt@gem_exec_balancer@bonded-semaphore.html
> 
>   * igt@gem_exec_balancer@fairslice:
>     - shard-rkl:          [PASS][35] -> [SKIP][36] ([Intel XE#874])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-2/igt@gem_exec_balancer@fairslice.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@gem_exec_balancer@fairslice.html
> 
>   * igt@gem_exec_capture@capture-invisible@lmem0:
>     - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#6334]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-1/igt@gem_exec_capture@capture-invisible@lmem0.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#6334])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-glk3/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-rkl:          [PASS][39] -> [FAIL][40] ([i915#2846])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none-share:
>     - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#4473] / [i915#4771])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-2/igt@gem_exec_fair@basic-none-share.html
> 
>   * igt@gem_exec_fair@basic-none-solo@rcs0:
>     - shard-tglu:         NOTRUN -> [FAIL][42] ([i915#2842]) +1 other test fail
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-3/igt@gem_exec_fair@basic-none-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-none-vip:
>     - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3539] / [i915#4852]) +2 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-6/igt@gem_exec_fair@basic-none-vip.html
> 
>   * igt@gem_exec_fair@basic-pace:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3539])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-3/igt@gem_exec_fair@basic-pace.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][45] ([i915#2842]) +1 other test fail
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_fence@concurrent:
>     - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4812])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-7/igt@gem_exec_fence@concurrent.html
> 
>   * igt@gem_exec_params@secure-non-master:
>     - shard-dg2:          NOTRUN -> [SKIP][47] ([fdo#112283])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@gem_exec_params@secure-non-master.html
> 
>   * igt@gem_exec_reloc@basic-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#3281]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@gem_exec_reloc@basic-wc.html
> 
>   * igt@gem_exec_reloc@basic-write-read:
>     - shard-rkl:          [PASS][49] -> [SKIP][50] ([i915#3281]) +11 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-1/igt@gem_exec_reloc@basic-write-read.html
> 
>   * igt@gem_exec_reloc@basic-write-read-active:
>     - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3281]) +23 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html
> 
>   * igt@gem_exec_schedule@preempt-queue:
>     - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4537] / [i915#4812])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-3/igt@gem_exec_schedule@preempt-queue.html
> 
>   * igt@gem_fenced_exec_thrash@2-spare-fences:
>     - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4860]) +4 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-2/igt@gem_fenced_exec_thrash@2-spare-fences.html
> 
>   * igt@gem_lmem_swapping@heavy-random:
>     - shard-glk:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#4613]) +2 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-glk8/igt@gem_lmem_swapping@heavy-random.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random:
>     - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4613])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-8/igt@gem_lmem_swapping@heavy-verify-random.html
> 
>   * igt@gem_lmem_swapping@massive-random:
>     - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#4613])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-1/igt@gem_lmem_swapping@massive-random.html
> 
>   * igt@gem_lmem_swapping@parallel-multi:
>     - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#4613])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-apl1/igt@gem_lmem_swapping@parallel-multi.html
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-tglu:         NOTRUN -> [SKIP][58] ([i915#4613]) +2 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-5/igt@gem_lmem_swapping@smem-oom.html
> 
>   * igt@gem_media_vme:
>     - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#284])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-3/igt@gem_media_vme.html
> 
>   * igt@gem_mmap_gtt@big-bo-tiledy:
>     - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4077]) +5 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-3/igt@gem_mmap_gtt@big-bo-tiledy.html
> 
>   * igt@gem_mmap_gtt@coherency:
>     - shard-rkl:          NOTRUN -> [SKIP][61] ([fdo#111656])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-4/igt@gem_mmap_gtt@coherency.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-odd:
>     - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4077]) +18 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
> 
>   * igt@gem_mmap_gtt@zero-extend:
>     - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4077])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-15/igt@gem_mmap_gtt@zero-extend.html
> 
>   * igt@gem_mmap_wc@close:
>     - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4083]) +5 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@gem_mmap_wc@close.html
> 
>   * igt@gem_pread@snoop:
>     - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3282]) +8 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-2/igt@gem_pread@snoop.html
> 
>   * igt@gem_pxp@display-protected-crc:
>     - shard-tglu:         NOTRUN -> [SKIP][66] ([i915#4270]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-7/igt@gem_pxp@display-protected-crc.html
> 
>   * igt@gem_pxp@protected-raw-src-copy-not-readible:
>     - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#4270]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-2/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> 
>   * igt@gem_pxp@regular-baseline-src-copy-readible:
>     - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4270])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-1/igt@gem_pxp@regular-baseline-src-copy-readible.html
> 
>   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>     - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4270]) +4 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-6/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>   * igt@gem_readwrite@beyond-eob:
>     - shard-rkl:          [PASS][70] -> [SKIP][71] ([i915#3282]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@gem_readwrite@beyond-eob.html
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@gem_readwrite@beyond-eob.html
> 
>   * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
>     - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#768]) +3 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
>     - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#8428])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-1/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_set_tiling_vs_gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4079])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-5/igt@gem_set_tiling_vs_gtt.html
> 
>   * igt@gem_softpin@evict-snoop:
>     - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4885])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@gem_softpin@evict-snoop.html
> 
>   * igt@gem_spin_batch@spin-all-new:
>     - shard-dg2:          NOTRUN -> [FAIL][76] ([i915#5889])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html
> 
>   * igt@gem_userptr_blits@coherency-sync:
>     - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#3297])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-8/igt@gem_userptr_blits@coherency-sync.html
> 
>   * igt@gem_userptr_blits@dmabuf-unsync:
>     - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#3297])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-19/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>     - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#3297] / [i915#4880])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
> 
>   * igt@gem_userptr_blits@nohangcheck:
>     - shard-mtlp:         [PASS][80] -> [FAIL][81] ([i915#9353])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-mtlp-6/igt@gem_userptr_blits@nohangcheck.html
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-4/igt@gem_userptr_blits@nohangcheck.html
> 
>   * igt@gem_userptr_blits@sd-probe:
>     - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#3297] / [i915#4958])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-2/igt@gem_userptr_blits@sd-probe.html
> 
>   * igt@gem_userptr_blits@unsync-overlap:
>     - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#3297]) +3 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-6/igt@gem_userptr_blits@unsync-overlap.html
>     - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#3297]) +1 other test skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-2/igt@gem_userptr_blits@unsync-overlap.html
> 
>   * igt@gem_userptr_blits@vma-merge:
>     - shard-apl:          NOTRUN -> [FAIL][85] ([i915#3318])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-apl1/igt@gem_userptr_blits@vma-merge.html
> 
>   * igt@gen3_render_mixed_blits:
>     - shard-mtlp:         NOTRUN -> [SKIP][86] ([fdo#109289])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-7/igt@gen3_render_mixed_blits.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#2856]) +4 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@gen9_exec_parse@allowed-all.html
>     - shard-rkl:          [PASS][88] -> [SKIP][89] ([i915#2527])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@gen9_exec_parse@allowed-all.html
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@gen9_exec_parse@allowed-all.html
>     - shard-apl:          [PASS][90] -> [ABORT][91] ([i915#5566])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-apl2/igt@gen9_exec_parse@allowed-all.html
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-apl7/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@gen9_exec_parse@bb-start-far:
>     - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#2527] / [i915#2856]) +2 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-2/igt@gen9_exec_parse@bb-start-far.html
> 
>   * igt@gen9_exec_parse@cmd-crossing-page:
>     - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#2527])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@gen9_exec_parse@cmd-crossing-page.html
> 
>   * igt@gen9_exec_parse@unaligned-jump:
>     - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#2856])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-8/igt@gen9_exec_parse@unaligned-jump.html
> 
>   * igt@i915_hangman@gt-engine-error@bcs0:
>     - shard-rkl:          [PASS][95] -> [SKIP][96] ([i915#9588])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-4/igt@i915_hangman@gt-engine-error@bcs0.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html
> 
>   * igt@i915_pm_freq_mult@media-freq@gt0:
>     - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#6590])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html
> 
>   * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>     - shard-dg2:          NOTRUN -> [SKIP][98] ([fdo#109293] / [fdo#109506])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
> 
>   * igt@i915_pm_rpm@system-suspend:
>     - shard-mtlp:         [PASS][99] -> [ABORT][100] ([i915#8213] / [i915#9414]) +1 other test abort
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-mtlp-6/igt@i915_pm_rpm@system-suspend.html
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-5/igt@i915_pm_rpm@system-suspend.html
> 
>   * igt@i915_pm_rps@min-max-config-loaded:
>     - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#6621])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-6/igt@i915_pm_rps@min-max-config-loaded.html
> 
>   * igt@i915_pm_rps@thresholds-park@gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#8925])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@i915_pm_rps@thresholds-park@gt0.html
> 
>   * igt@i915_selftest@mock@memory_region:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][103] ([i915#9311])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-4/igt@i915_selftest@mock@memory_region.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4212])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#4215] / [i915#5190])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-1/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#3826])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [FAIL][107] ([i915#8247]) +3 other tests fail
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-7/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_async_flips@crc@pipe-c-hdmi-a-1:
>     - shard-dg1:          NOTRUN -> [FAIL][108] ([i915#8247]) +3 other tests fail
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-19/igt@kms_async_flips@crc@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#6228])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-6/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_async_flips@test-cursor@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#4497])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-2/igt@kms_async_flips@test-cursor@pipe-b-edp-1.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-snb:          NOTRUN -> [SKIP][111] ([fdo#109271] / [i915#1769])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-snb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-glk:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#1769])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][113] ([fdo#111614]) +5 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
>     - shard-tglu:         NOTRUN -> [SKIP][114] ([fdo#111615] / [i915#5286])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-9/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         [PASS][115] -> [FAIL][116] ([i915#5138]) +1 other test fail
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][117] ([fdo#111614] / [i915#3638])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-mtlp:         NOTRUN -> [SKIP][118] ([fdo#111614]) +1 other test skip
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-7/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-tglu:         NOTRUN -> [SKIP][119] ([fdo#111614])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-10/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#5190]) +21 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>     - shard-rkl:          [PASS][121] -> [SKIP][122] ([i915#1845] / [i915#4098]) +16 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-mtlp:         NOTRUN -> [SKIP][123] ([fdo#111615])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#6187]) +1 other test skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-tglu:         NOTRUN -> [SKIP][125] ([fdo#111615]) +1 other test skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#4538] / [i915#5190]) +7 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_joiner@2x-modeset:
>     - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#2705])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@kms_big_joiner@2x-modeset.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#2705]) +1 other test skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#3742])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#4087]) +3 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-dg2:          NOTRUN -> [SKIP][131] ([fdo#111827]) +2 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-tglu:         NOTRUN -> [SKIP][132] ([fdo#111827])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-2/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - shard-apl:          NOTRUN -> [SKIP][133] ([fdo#109271]) +75 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-apl1/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
>     - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#7828]) +2 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-multiple:
>     - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#7828]) +11 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>     - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#7828])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>     - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#7828]) +2 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#7828]) +1 other test skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-7/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#3299])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-7/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#3299])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#7116])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-19/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic:
>     - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#6944])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-7/igt@kms_content_protection@lic.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#7118]) +1 other test skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-2/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#3359]) +2 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x256:
>     - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#4098]) +26 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-256x256.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-tglu:         NOTRUN -> [SKIP][146] ([fdo#109279] / [i915#3359])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x10:
>     - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#3555]) +2 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@kms_cursor_crc@cursor-random-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#3555] / [i915#8814]) +1 other test skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-snb:          NOTRUN -> [SKIP][149] ([fdo#109271]) +69 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-snb6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>     - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#3359])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][151] ([fdo#109274] / [fdo#111767] / [i915#5354])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-tglu:         NOTRUN -> [SKIP][152] ([fdo#109274]) +1 other test skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#4213])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][154] ([fdo#111825]) +1 other test skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-mtlp:         NOTRUN -> [SKIP][155] ([fdo#111767] / [i915#3546])
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][156] ([fdo#109274] / [i915#5354]) +5 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#4103] / [i915#4213])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#3555]) +1 other test skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-7/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#8588])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-8/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#3555] / [i915#3840]) +1 other test skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-dg2:          NOTRUN -> [FAIL][161] ([i915#4767])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][162] ([fdo#110189] / [i915#3955])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][163] ([fdo#109274] / [fdo#111767])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-interruptible:
>     - shard-tglu:         NOTRUN -> [SKIP][164] ([fdo#109274] / [i915#3637])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-10/igt@kms_flip@2x-flip-vs-panning-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank:
>     - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#3637])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-1/igt@kms_flip@2x-flip-vs-wf_vblank.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>     - shard-dg2:          NOTRUN -> [SKIP][166] ([fdo#109274]) +8 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@kms_flip@2x-wf_vblank-ts-check.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#3637] / [i915#4098]) +8 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>     - shard-snb:          NOTRUN -> [DMESG-WARN][168] ([i915#8841]) +2 other tests dmesg-warn
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#2672]) +5 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#2587] / [i915#2672])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#3555]) +10 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#2672]) +2 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#3555] / [i915#8810])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#8708]) +3 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
>     - shard-dg2:          [PASS][175] -> [FAIL][176] ([i915#6880]) +1 other test fail
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
>     - shard-rkl:          [PASS][177] -> [SKIP][178] ([i915#1849] / [i915#4098]) +8 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#5354]) +45 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#8708]) +25 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
>     - shard-tglu:         NOTRUN -> [SKIP][181] ([fdo#109280]) +16 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
>     - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#3023]) +6 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][183] ([fdo#111825]) +3 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#1849] / [i915#4098]) +7 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#1825]) +7 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-tglu:         NOTRUN -> [SKIP][186] ([fdo#110189]) +12 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#3458]) +23 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#3458])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][189] ([fdo#111825] / [i915#1825]) +13 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#3555] / [i915#8228]) +1 other test skip
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-7/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#6301])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>     - shard-dg2:          NOTRUN -> [SKIP][192] ([fdo#109289]) +7 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
> 
>   * igt@kms_pipe_crc_basic@bad-source:
>     - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#1845] / [i915#4098]) +18 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_pipe_crc_basic@bad-source.html
> 
>   * igt@kms_plane@pixel-format-source-clamping:
>     - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#4098] / [i915#8825])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_plane@pixel-format-source-clamping.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#8806])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#3555] / [i915#8806])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#3546])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#6953] / [i915#8152])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html
>     - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#6953])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size.html
>     - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#6953])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-8/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
>     - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#3555] / [i915#4098] / [i915#8152])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#5235]) +3 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4:
>     - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#5235]) +19 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-dp-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
>     - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#8152]) +2 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#5235]) +3 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
>     - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3555] / [i915#4098] / [i915#6953] / [i915#8152]) +1 other test skip
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#5235]) +15 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html
> 
>   * igt@kms_prime@basic-crc-vgem:
>     - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#6524] / [i915#6805])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-2/igt@kms_prime@basic-crc-vgem.html
>     - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#6524])
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_prime@basic-crc-vgem.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#6524])
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-2/igt@kms_prime@d3hot.html
> 
>   * igt@kms_properties@plane-properties-atomic:
>     - shard-rkl:          [PASS][211] -> [SKIP][212] ([i915#1849])
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-7/igt@kms_properties@plane-properties-atomic.html
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_properties@plane-properties-atomic.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-glk:          NOTRUN -> [SKIP][213] ([fdo#109271] / [i915#658]) +1 other test skip
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-glk6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][214] ([fdo#111068] / [i915#658])
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-8/igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#658])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>     - shard-apl:          NOTRUN -> [SKIP][216] ([fdo#109271] / [i915#658]) +1 other test skip
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-tglu:         NOTRUN -> [SKIP][217] ([fdo#109642] / [fdo#111068] / [i915#658])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-9/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#658]) +4 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-2/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#1072]) +6 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@kms_psr@dpms.html
> 
>   * igt@kms_psr@primary_page_flip:
>     - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#1072]) +2 other tests skip
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_psr@primary_page_flip.html
> 
>   * igt@kms_psr@psr2_sprite_plane_move:
>     - shard-mtlp:         [PASS][221] -> [FAIL][222] ([i915#9066])
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-mtlp-8/igt@kms_psr@psr2_sprite_plane_move.html
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-7/igt@kms_psr@psr2_sprite_plane_move.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#5461] / [i915#658])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@exhaust-fences:
>     - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#4235]) +3 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@kms_rotation_crc@exhaust-fences.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#5289])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#5289])
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#4235] / [i915#5190]) +2 other tests skip
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#3555] / [i915#4098]) +1 other test skip
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-2/igt@kms_setmode@basic-clone-single-crtc.html
>     - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#3555] / [i915#4098]) +4 other tests skip
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-dg1:          [PASS][230] -> [FAIL][231] ([IGT#2] / [i915#6493])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-dg1-16/igt@kms_sysfs_edid_timing.html
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-15/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#8623])
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>     - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#8623])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-glk:          NOTRUN -> [SKIP][234] ([fdo#109271] / [i915#2437])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-glk6/igt@kms_writeback@writeback-fb-id.html
>     - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#2437]) +1 other test skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-7/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@perf@gen12-mi-rpc:
>     - shard-rkl:          NOTRUN -> [SKIP][236] ([fdo#109289]) +3 other tests skip
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@perf@gen12-mi-rpc.html
> 
>   * igt@perf_pmu@busy-double-start@rcs0:
>     - shard-mtlp:         [PASS][237] -> [FAIL][238] ([i915#4349])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-mtlp-1/igt@perf_pmu@busy-double-start@rcs0.html
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-5/igt@perf_pmu@busy-double-start@rcs0.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          NOTRUN -> [FAIL][239] ([i915#4349]) +3 other tests fail
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@cpu-hotplug:
>     - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#8850])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-6/igt@perf_pmu@cpu-hotplug.html
> 
>   * igt@prime_vgem@basic-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#3708] / [i915#4077])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@prime_vgem@basic-gtt.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][242] ([fdo#109295] / [i915#3708])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@prime_vgem@fence-write-hang:
>     - shard-tglu:         NOTRUN -> [SKIP][243] ([fdo#109295])
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-3/igt@prime_vgem@fence-write-hang.html
> 
>   * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-signaled:
>     - shard-apl:          NOTRUN -> [FAIL][244] ([i915#9583])
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-apl1/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-signaled.html
> 
>   * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted:
>     - shard-glk:          NOTRUN -> [FAIL][245] ([i915#9583])
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-glk8/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted.html
> 
>   * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled:
>     - shard-dg2:          NOTRUN -> [FAIL][246] ([i915#9583]) +2 other tests fail
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-7/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled.html
>     - shard-rkl:          NOTRUN -> [FAIL][247] ([i915#9583]) +1 other test fail
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-1/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled.html
> 
>   * igt@v3d/v3d_perfmon@get-values-invalid-pointer:
>     - shard-tglu:         NOTRUN -> [SKIP][248] ([fdo#109315] / [i915#2575]) +4 other tests skip
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-6/igt@v3d/v3d_perfmon@get-values-invalid-pointer.html
> 
>   * igt@v3d/v3d_submit_cl@multi-and-single-sync:
>     - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#2575])
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-15/igt@v3d/v3d_submit_cl@multi-and-single-sync.html
> 
>   * igt@v3d/v3d_submit_cl@multiple-job-submission:
>     - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#2575]) +2 other tests skip
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-3/igt@v3d/v3d_submit_cl@multiple-job-submission.html
> 
>   * igt@v3d/v3d_submit_cl@simple-flush-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][251] ([fdo#109315]) +3 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@v3d/v3d_submit_cl@simple-flush-cache.html
> 
>   * igt@v3d/v3d_submit_csd@bad-pad:
>     - shard-glk:          NOTRUN -> [SKIP][252] ([fdo#109271]) +68 other tests skip
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-glk3/igt@v3d/v3d_submit_csd@bad-pad.html
> 
>   * igt@v3d/v3d_submit_csd@single-out-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#2575]) +14 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@v3d/v3d_submit_csd@single-out-sync.html
> 
>   * igt@vc4/vc4_label_bo@set-label:
>     - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#7711]) +2 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@vc4/vc4_label_bo@set-label.html
> 
>   * igt@vc4/vc4_purgeable_bo@free-purged-bo:
>     - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#2575]) +3 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-9/igt@vc4/vc4_purgeable_bo@free-purged-bo.html
> 
>   * igt@vc4/vc4_purgeable_bo@mark-purgeable-twice:
>     - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#7711]) +1 other test skip
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-7/igt@vc4/vc4_purgeable_bo@mark-purgeable-twice.html
> 
>   * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
>     - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#7711]) +14 other tests skip
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-rkl:          [SKIP][258] ([i915#8411]) -> [PASS][259] +4 other tests pass
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-4/igt@api_intel_bb@blit-reloc-purge-cache.html
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@drm_fdinfo@most-busy-check-all@rcs0:
>     - shard-rkl:          [FAIL][260] ([i915#7742]) -> [PASS][261]
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all@rcs0.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [FAIL][262] ([i915#5784]) -> [PASS][263]
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-dg1-18/igt@gem_eio@unwedge-stress.html
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-17/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-none-share@rcs0:
>     - shard-rkl:          [FAIL][264] ([i915#2842]) -> [PASS][265]
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-4/igt@gem_exec_fair@basic-none-share@rcs0.html
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-1/igt@gem_exec_fair@basic-none-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-tglu:         [FAIL][266] ([i915#2842]) -> [PASS][267]
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-tglu-5/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-7/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_reloc@basic-write-read-noreloc:
>     - shard-rkl:          [SKIP][268] ([i915#3281]) -> [PASS][269] +8 other tests pass
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-7/igt@gem_exec_reloc@basic-write-read-noreloc.html
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html
> 
>   * igt@gem_exec_schedule@preempt-engines@ccs0:
>     - shard-mtlp:         [FAIL][270] ([i915#9119]) -> [PASS][271] +4 other tests pass
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@ccs0.html
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-2/igt@gem_exec_schedule@preempt-engines@ccs0.html
> 
>   * igt@gem_exec_schedule@preempt-engines@rcs0:
>     - shard-mtlp:         [DMESG-FAIL][272] ([i915#8962]) -> [PASS][273] +1 other test pass
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@rcs0.html
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-2/igt@gem_exec_schedule@preempt-engines@rcs0.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices@lmem0:
>     - shard-dg2:          [ABORT][274] ([i915#7975] / [i915#8213]) -> [PASS][275] +1 other test pass
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-dg2-2/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
> 
>   * igt@gem_mmap_wc@set-cache-level:
>     - shard-rkl:          [SKIP][276] ([i915#1850]) -> [PASS][277]
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@gem_mmap_wc@set-cache-level.html
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-2/igt@gem_mmap_wc@set-cache-level.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads:
>     - shard-rkl:          [SKIP][278] ([i915#3282]) -> [PASS][279] +6 other tests pass
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads.html
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gen9_exec_parse@secure-batches:
>     - shard-rkl:          [SKIP][280] ([i915#2527]) -> [PASS][281]
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-4/igt@gen9_exec_parse@secure-batches.html
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@gen9_exec_parse@secure-batches.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
>     - shard-dg1:          [FAIL][282] ([i915#3591]) -> [PASS][283]
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-snb:          [INCOMPLETE][284] ([i915#7790]) -> [PASS][285]
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-snb2/igt@i915_pm_rps@reset.html
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-snb7/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-rkl:          [SKIP][286] ([i915#4387]) -> [PASS][287]
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-7/igt@i915_pm_sseu@full-enable.html
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_power@sanity:
>     - shard-rkl:          [SKIP][288] ([i915#7984]) -> [PASS][289]
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-4/igt@i915_power@sanity.html
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@i915_power@sanity.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-mtlp:         [FAIL][290] ([i915#5138]) -> [PASS][291]
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-mtlp:         [FAIL][292] ([i915#3743]) -> [PASS][293]
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-mtlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-tglu:         [FAIL][294] ([i915#3743]) -> [PASS][295] +1 other test pass
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_color@degamma@pipe-a:
>     - shard-rkl:          [SKIP][296] ([i915#4098]) -> [PASS][297] +7 other tests pass
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_color@degamma@pipe-a.html
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-4/igt@kms_color@degamma@pipe-a.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>     - shard-rkl:          [SKIP][298] ([i915#1845] / [i915#4098]) -> [PASS][299] +14 other tests pass
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-apl:          [FAIL][300] ([i915#2346]) -> [PASS][301]
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_fbcon_fbt@fbc:
>     - shard-rkl:          [SKIP][302] ([i915#1849] / [i915#4098]) -> [PASS][303] +5 other tests pass
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_fbcon_fbt@fbc.html
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@kms_fbcon_fbt@fbc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
>     - shard-dg1:          [DMESG-WARN][304] ([i915#4391] / [i915#4423]) -> [PASS][305]
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
> 
>   * {igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b}:
>     - shard-dg2:          [FAIL][306] ([fdo#103375]) -> [PASS][307]
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-dg2-11/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-11/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * {igt@kms_pm_rpm@dpms-lpsp}:
>     - shard-dg2:          [SKIP][308] ([i915#9519]) -> [PASS][309]
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-dg2-6/igt@kms_pm_rpm@dpms-lpsp.html
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * {igt@kms_pm_rpm@drm-resources-equal}:
>     - shard-rkl:          [SKIP][310] ([fdo#109308]) -> [PASS][311] +1 other test pass
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_pm_rpm@drm-resources-equal.html
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-4/igt@kms_pm_rpm@drm-resources-equal.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-1:
>     - shard-apl:          [FAIL][312] ([i915#9196]) -> [PASS][313]
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-apl7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-1.html
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-apl3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-1.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-snb:          [INCOMPLETE][314] -> [PASS][315]
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-snb2/igt@perf_pmu@module-unload.html
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-snb5/igt@perf_pmu@module-unload.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_ccs@block-copy-compressed:
>     - shard-rkl:          [SKIP][316] ([i915#3555]) -> [SKIP][317] ([i915#7957])
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-rkl:          [SKIP][318] ([i915#7957]) -> [SKIP][319] ([i915#9323])
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@gem_ccs@suspend-resume.html
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-1/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-rkl:          [SKIP][320] ([i915#3282]) -> [WARN][321] ([i915#2658])
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-4/igt@gem_pread@exhaustion.html
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-rkl:          [WARN][322] ([i915#2658]) -> [SKIP][323] ([i915#3282])
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@gem_pwrite@basic-exhaustion.html
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
>     - shard-tglu:         [FAIL][324] ([i915#2681] / [i915#3591]) -> [WARN][325] ([i915#2681])
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-rkl:          [SKIP][326] ([i915#1845] / [i915#4098]) -> [SKIP][327] ([i915#9531])
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-rkl:          [SKIP][328] ([i915#1845] / [i915#4098]) -> [SKIP][329] ([i915#1769] / [i915#3555]) +1 other test skip
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>     - shard-rkl:          [SKIP][330] ([i915#4098]) -> [SKIP][331] ([i915#5286]) +1 other test skip
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-rkl:          [SKIP][332] ([i915#5286]) -> [SKIP][333] ([i915#4098]) +4 other tests skip
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-rkl:          [SKIP][334] ([fdo#111614] / [i915#3638]) -> [SKIP][335] ([i915#1845] / [i915#4098]) +1 other test skip
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-rkl:          [SKIP][336] ([i915#1845] / [i915#4098]) -> [SKIP][337] ([fdo#111614] / [i915#3638]) +3 other tests skip
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-rkl:          [SKIP][338] ([i915#1845] / [i915#4098]) -> [SKIP][339] ([fdo#111615])
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb.html
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-rkl:          [SKIP][340] ([fdo#111615]) -> [SKIP][341] ([i915#1845] / [i915#4098])
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-rkl:          [SKIP][342] ([fdo#110723]) -> [SKIP][343] ([i915#1845] / [i915#4098]) +3 other tests skip
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-rkl:          [SKIP][344] ([i915#1845] / [i915#4098]) -> [SKIP][345] ([fdo#110723]) +2 other tests skip
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-rkl:          [SKIP][346] ([i915#7118]) -> [SKIP][347] ([i915#1845] / [i915#4098]) +2 other tests skip
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-2/igt@kms_content_protection@srm.html
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-rkl:          [SKIP][348] ([i915#4098]) -> [SKIP][349] ([i915#3359]) +1 other test skip
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-rkl:          [SKIP][350] ([i915#3359]) -> [SKIP][351] ([i915#4098])
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-rkl:          [SKIP][352] ([i915#1845] / [i915#4098]) -> [SKIP][353] ([fdo#111825]) +3 other tests skip
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg1:          [SKIP][354] ([fdo#111825] / [i915#4423]) -> [SKIP][355] ([fdo#111825])
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-dg1-16/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-dg1-17/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-rkl:          [SKIP][356] ([i915#4103]) -> [SKIP][357] ([i915#1845] / [i915#4098])
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-rkl:          [SKIP][358] ([fdo#111825]) -> [SKIP][359] ([i915#1845] / [i915#4098]) +4 other tests skip
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-rkl:          [SKIP][360] ([fdo#111767] / [fdo#111825]) -> [SKIP][361] ([i915#1845] / [i915#4098])
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-rkl:          [SKIP][362] ([i915#1845] / [i915#4098]) -> [SKIP][363] ([fdo#111767] / [fdo#111825])
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-rkl:          [SKIP][364] ([i915#8588]) -> [SKIP][365] ([i915#4098])
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-4/igt@kms_display_modes@mst-extended-mode-negative.html
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-rkl:          [SKIP][366] ([i915#4098]) -> [SKIP][367] ([i915#3555] / [i915#3840])
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - shard-rkl:          [SKIP][368] ([fdo#109285]) -> [SKIP][369] ([fdo#109285] / [i915#4098])
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-4/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
>     - shard-rkl:          [SKIP][370] ([i915#1849] / [i915#4098]) -> [SKIP][371] ([fdo#111825] / [i915#1825]) +18 other tests skip
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>     - shard-rkl:          [SKIP][372] ([fdo#111825] / [i915#1825]) -> [SKIP][373] ([i915#1849] / [i915#4098]) +33 other tests skip
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-rkl:          [SKIP][374] ([i915#5439]) -> [SKIP][375] ([i915#1849] / [i915#4098])
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
>     - shard-rkl:          [SKIP][376] ([i915#1849] / [i915#4098]) -> [SKIP][377] ([i915#3023]) +19 other tests skip
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-rkl:          [SKIP][378] ([i915#1849] / [i915#4098]) -> [SKIP][379] ([i915#5439])
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>     - shard-rkl:          [SKIP][380] ([i915#3023]) -> [SKIP][381] ([i915#1849] / [i915#4098]) +25 other tests skip
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-rkl:          [SKIP][382] ([i915#1845] / [i915#4098]) -> [SKIP][383] ([i915#3555] / [i915#8228])
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_hdr@bpc-switch.html
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-2/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-rkl:          [SKIP][384] ([i915#3555] / [i915#8228]) -> [SKIP][385] ([i915#4098])
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-7/igt@kms_hdr@invalid-hdr.html
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-rkl:          [SKIP][386] ([i915#3555] / [i915#8228]) -> [SKIP][387] ([i915#1845] / [i915#4098])
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-1/igt@kms_hdr@static-swap.html
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          [SKIP][388] ([i915#4070] / [i915#4816]) -> [SKIP][389] ([i915#4816])
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-rkl:          [SKIP][390] ([i915#1845] / [i915#4098]) -> [SKIP][391] ([i915#6301])
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_panel_fitting@legacy.html
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-7/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane_lowres@tiling-4:
>     - shard-rkl:          [SKIP][392] ([i915#4098]) -> [SKIP][393] ([i915#3555]) +4 other tests skip
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_plane_lowres@tiling-4.html
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-1/igt@kms_plane_lowres@tiling-4.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-rkl:          [SKIP][394] ([i915#3555]) -> [SKIP][395] ([i915#4098]) +3 other tests skip
>    [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-2/igt@kms_plane_lowres@tiling-yf.html
>    [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-rkl:          [SKIP][396] ([fdo#111825]) -> [SKIP][397] ([fdo#111825] / [i915#8152])
>    [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-rkl:          [SKIP][398] ([i915#5289]) -> [SKIP][399] ([i915#4098])
>    [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
>    [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-rkl:          [SKIP][400] ([i915#1845] / [i915#4098]) -> [INCOMPLETE][401] ([i915#8875])
>    [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13813/shard-rkl-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/shard-rkl-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [Intel XE#874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/874
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
>   [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
>   [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
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
>   [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
>   [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
>   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
>   [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
>   [i915#4497]: https://gitlab.freedesktop.org/drm/intel/issues/4497
>   [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
>   [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>   [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
>   [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
>   [i915#5882]: https://gitlab.freedesktop.org/drm/intel/issues/5882
>   [i915#5889]: https://gitlab.freedesktop.org/drm/intel/issues/5889
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6187]: https://gitlab.freedesktop.org/drm/intel/issues/6187
>   [i915#6228]: https://gitlab.freedesktop.org/drm/intel/issues/6228
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
>   [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
>   [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
>   [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
>   [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
>   [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7790]: https://gitlab.freedesktop.org/drm/intel/issues/7790
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7957]: https://gitlab.freedesktop.org/drm/intel/issues/7957
>   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>   [i915#7984]: https://gitlab.freedesktop.org/drm/intel/issues/7984
>   [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152
>   [i915#8190]: https://gitlab.freedesktop.org/drm/intel/issues/8190
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
>   [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8430]: https://gitlab.freedesktop.org/drm/intel/issues/8430
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8562]: https://gitlab.freedesktop.org/drm/intel/issues/8562
>   [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
>   [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
>   [i915#8806]: https://gitlab.freedesktop.org/drm/intel/issues/8806
>   [i915#8810]: https://gitlab.freedesktop.org/drm/intel/issues/8810
>   [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
>   [i915#8825]: https://gitlab.freedesktop.org/drm/intel/issues/8825
>   [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
>   [i915#8850]: https://gitlab.freedesktop.org/drm/intel/issues/8850
>   [i915#8875]: https://gitlab.freedesktop.org/drm/intel/issues/8875
>   [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
>   [i915#8962]: https://gitlab.freedesktop.org/drm/intel/issues/8962
>   [i915#9053]: https:
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10084/index.html
