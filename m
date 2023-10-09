Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6709510E281
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 16:17:05 +0000 (UTC)
Date: Mon, 9 Oct 2023 18:17:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231009161700.f3busujaew47jef3@kamilkon-desk.igk.intel.com>
References: <20231009100332.392968-1-mauro.chehab@linux.intel.com>
 <169685554202.24834.9491440951702054670@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169685554202.24834.9491440951702054670@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogIGZhaWx1cmUgZm9yIEZpeCBi?=
 =?utf-8?q?ad_documentation_validation_logic?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

below failures are unrelated to tool change and descriptions,

Regards,
Kamil

On 2023-10-09 at 12:45:42 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix bad documentation validation logic
> URL   : https://patchwork.freedesktop.org/series/124812/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13728_full -> IGTPW_9949_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9949_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9949_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9949_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2:
>     - shard-rkl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-rkl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>     - shard-mtlp:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4}:
>     - shard-dg1:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-dg1-14/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-18/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9949_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@drm_fdinfo@busy-idle@bcs0:
>     - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#8414]) +4 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-17/igt@drm_fdinfo@busy-idle@bcs0.html
> 
>   * igt@drm_fdinfo@most-busy-check-all@rcs0:
>     - shard-rkl:          [PASS][8] -> [FAIL][9] ([i915#7742])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
>     - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8414]) +29 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-3/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html
> 
>   * igt@drm_fdinfo@virtual-busy-idle-all:
>     - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#8414])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-1/igt@drm_fdinfo@virtual-busy-idle-all.html
> 
>   * igt@gem_bad_reloc@negative-reloc-lut:
>     - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#3281]) +7 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-4/igt@gem_bad_reloc@negative-reloc-lut.html
> 
>   * igt@gem_ccs@ctrl-surf-copy-new-ctx:
>     - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#9323])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-16/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#8562])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-17/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_exec@basic-nohangcheck:
>     - shard-mtlp:         [PASS][15] -> [FAIL][16] ([i915#6268])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-1/igt@gem_ctx_exec@basic-nohangcheck.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-6/igt@gem_ctx_exec@basic-nohangcheck.html
> 
>   * igt@gem_ctx_persistence@engines-persistence:
>     - shard-snb:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#1099])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-snb4/igt@gem_ctx_persistence@engines-persistence.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#8555]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-2/igt@gem_ctx_persistence@heartbeat-hang.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hostile:
>     - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#8555])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-hostile.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-hostile@blt:
>     - shard-mtlp:         [PASS][20] -> [ABORT][21] ([i915#9414])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-6/igt@gem_ctx_persistence@legacy-engines-hostile@blt.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-5/igt@gem_ctx_persistence@legacy-engines-hostile@blt.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile@vecs0:
>     - shard-mtlp:         [PASS][22] -> [FAIL][23] ([i915#7816]) +2 other tests fail
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-7/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
> 
>   * igt@gem_ctx_sseu@engines:
>     - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#280])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-8/igt@gem_ctx_sseu@engines.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#280]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-mtlp:         [PASS][26] -> [ABORT][27] ([i915#7892] / [i915#9262])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-8/igt@gem_eio@in-flight-suspend.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-2/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_exec_balancer@bonded-true-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#4812]) +2 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-3/igt@gem_exec_balancer@bonded-true-hang.html
> 
>   * igt@gem_exec_balancer@invalid-bonds:
>     - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#4036])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html
> 
>   * igt@gem_exec_balancer@parallel-out-fence:
>     - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#4525])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html
> 
>   * igt@gem_exec_capture@capture-invisible@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#6334]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-15/igt@gem_exec_capture@capture-invisible@lmem0.html
> 
>   * igt@gem_exec_fair@basic-none-rrul:
>     - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#4473] / [i915#4771])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-3/igt@gem_exec_fair@basic-none-rrul.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-tglu:         NOTRUN -> [FAIL][33] ([i915#2842])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo:
>     - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#3539])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-3/igt@gem_exec_fair@basic-pace-solo.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][35] ([i915#2842])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-throttle:
>     - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#3539]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-16/igt@gem_exec_fair@basic-throttle.html
> 
>   * igt@gem_exec_fence@submit67:
>     - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#4812])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-7/igt@gem_exec_fence@submit67.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>     - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#3539] / [i915#4852]) +3 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
>     - shard-rkl:          NOTRUN -> [SKIP][39] ([fdo#109313])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-wb:
>     - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#3539] / [i915#4852]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-18/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
> 
>   * igt@gem_exec_gttfill@multigpu-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#7697])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-1/igt@gem_exec_gttfill@multigpu-basic.html
> 
>   * igt@gem_exec_params@rsvd2-dirt:
>     - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#5107])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-3/igt@gem_exec_params@rsvd2-dirt.html
>     - shard-dg2:          NOTRUN -> [SKIP][43] ([fdo#109283] / [i915#5107])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-1/igt@gem_exec_params@rsvd2-dirt.html
> 
>   * igt@gem_exec_params@secure-non-root:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([fdo#112283])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-2/igt@gem_exec_params@secure-non-root.html
> 
>   * igt@gem_exec_reloc@basic-wc-read-active:
>     - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3281]) +8 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-16/igt@gem_exec_reloc@basic-wc-read-active.html
> 
>   * igt@gem_exec_reloc@basic-write-read-active:
>     - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3281]) +21 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-7/igt@gem_exec_reloc@basic-write-read-active.html
> 
>   * igt@gem_exec_schedule@noreorder@rcs0:
>     - shard-mtlp:         [PASS][47] -> [DMESG-FAIL][48] ([i915#8962])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-6/igt@gem_exec_schedule@noreorder@rcs0.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-4/igt@gem_exec_schedule@noreorder@rcs0.html
> 
>   * igt@gem_exec_schedule@noreorder@vcs0:
>     - shard-mtlp:         [PASS][49] -> [FAIL][50] ([i915#8758])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-6/igt@gem_exec_schedule@noreorder@vcs0.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-4/igt@gem_exec_schedule@noreorder@vcs0.html
> 
>   * igt@gem_exec_schedule@preempt-queue-chain:
>     - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4537] / [i915#4812])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-chain.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts-chain:
>     - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4537] / [i915#4812])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
> 
>   * igt@gem_exec_schedule@reorder-wide:
>     - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4812]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-15/igt@gem_exec_schedule@reorder-wide.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices@lmem0:
>     - shard-dg1:          [PASS][54] -> [ABORT][55] ([i915#7975] / [i915#8213])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-dg1-12/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4613])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#4613]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-6/igt@gem_lmem_swapping@random.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-odd:
>     - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4077]) +11 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
> 
>   * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
>     - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4077]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-15/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
> 
>   * igt@gem_mmap_gtt@fault-concurrent:
>     - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4077]) +2 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-3/igt@gem_mmap_gtt@fault-concurrent.html
> 
>   * igt@gem_mmap_wc@bad-object:
>     - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4083]) +4 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-5/igt@gem_mmap_wc@bad-object.html
> 
>   * igt@gem_mmap_wc@bad-size:
>     - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4083])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-17/igt@gem_mmap_wc@bad-size.html
> 
>   * igt@gem_mmap_wc@close:
>     - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4083]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-1/igt@gem_mmap_wc@close.html
> 
>   * igt@gem_partial_pwrite_pread@reads-uncached:
>     - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#3282]) +2 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-12/igt@gem_partial_pwrite_pread@reads-uncached.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-display:
>     - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3282]) +8 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-10/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
> 
>   * igt@gem_pxp@protected-raw-src-copy-not-readible:
>     - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#4270]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html
>     - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4270])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-19/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> 
>   * igt@gem_pxp@regular-baseline-src-copy-readible:
>     - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4270]) +5 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-10/igt@gem_pxp@regular-baseline-src-copy-readible.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#8428])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-4/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>     - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4079])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-15/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>     - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4079]) +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-7/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>     - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#3297]) +1 other test skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-17/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>     - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#3297] / [i915#4880])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
> 
>   * igt@gem_userptr_blits@readonly-pwrite-unsync:
>     - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#3297])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-7/igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>   * igt@gem_userptr_blits@unsync-overlap:
>     - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#3297]) +3 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-5/igt@gem_userptr_blits@unsync-overlap.html
>     - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#3297]) +1 other test skip
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-1/igt@gem_userptr_blits@unsync-overlap.html
> 
>   * igt@gem_userptr_blits@unsync-unmap:
>     - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#3297]) +1 other test skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-3/igt@gem_userptr_blits@unsync-unmap.html
> 
>   * igt@gen3_render_linear_blits:
>     - shard-dg1:          NOTRUN -> [SKIP][78] ([fdo#109289]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-18/igt@gen3_render_linear_blits.html
> 
>   * igt@gen3_render_tiledy_blits:
>     - shard-tglu:         NOTRUN -> [SKIP][79] ([fdo#109289])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-3/igt@gen3_render_tiledy_blits.html
> 
>   * igt@gen7_exec_parse@batch-without-end:
>     - shard-dg2:          NOTRUN -> [SKIP][80] ([fdo#109289]) +5 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-3/igt@gen7_exec_parse@batch-without-end.html
> 
>   * igt@gen7_exec_parse@oacontrol-tracking:
>     - shard-rkl:          NOTRUN -> [SKIP][81] ([fdo#109289])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-1/igt@gen7_exec_parse@oacontrol-tracking.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#2527] / [i915#2856])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-2/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@bb-oversize:
>     - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#2527]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-7/igt@gen9_exec_parse@bb-oversize.html
>     - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#2527]) +2 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-14/igt@gen9_exec_parse@bb-oversize.html
> 
>   * igt@gen9_exec_parse@valid-registers:
>     - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#2856]) +5 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-6/igt@gen9_exec_parse@valid-registers.html
> 
>   * igt@i915_hangman@gt-engine-error@vcs0:
>     - shard-mtlp:         [PASS][86] -> [FAIL][87] ([i915#7069])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-4/igt@i915_hangman@gt-engine-error@vcs0.html
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-2/igt@i915_hangman@gt-engine-error@vcs0.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][88] ([i915#8617])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_freq_api@freq-suspend@gt0:
>     - shard-dg2:          [PASS][89] -> [INCOMPLETE][90] ([i915#9407])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-dg2-11/igt@i915_pm_freq_api@freq-suspend@gt0.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html
> 
>   * igt@i915_pm_rc6_residency@media-rc6-accuracy:
>     - shard-mtlp:         NOTRUN -> [SKIP][91] ([fdo#109289])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
> 
>   * igt@i915_pm_rc6_residency@rc6-fence:
>     - shard-tglu:         NOTRUN -> [WARN][92] ([i915#2681])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-fence.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
>     - shard-dg1:          [PASS][93] -> [FAIL][94] ([i915#3591])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
> 
>   * igt@i915_pm_rpm@dpms-lpsp:
>     - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#1397])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-4/igt@i915_pm_rpm@dpms-lpsp.html
>     - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#1397]) +1 other test skip
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-15/igt@i915_pm_rpm@dpms-lpsp.html
> 
>   * igt@i915_pm_rpm@dpms-non-lpsp:
>     - shard-dg1:          [PASS][97] -> [SKIP][98] ([i915#1397])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-dg1-12/igt@i915_pm_rpm@dpms-non-lpsp.html
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:
>     - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#8431])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-7/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp-stress:
>     - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#1397]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-3/igt@i915_pm_rpm@modeset-lpsp-stress.html
>     - shard-rkl:          [PASS][101] -> [SKIP][102] ([i915#1397])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@i915_pm_rpm@modeset-pc8-residency-stress:
>     - shard-tglu:         NOTRUN -> [SKIP][103] ([fdo#109506])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-10/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
> 
>   * igt@i915_pm_rpm@pc8-residency:
>     - shard-dg1:          NOTRUN -> [SKIP][104] ([fdo#109506])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-12/igt@i915_pm_rpm@pc8-residency.html
> 
>   * igt@i915_pm_rpm@system-suspend:
>     - shard-dg2:          NOTRUN -> [FAIL][105] ([fdo#103375]) +1 other test fail
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-5/igt@i915_pm_rpm@system-suspend.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#6621])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-19/igt@i915_pm_rps@basic-api.html
>     - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#6621])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-7/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_query@query-topology-coherent-slice-mask:
>     - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#6188])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-1/igt@i915_query@query-topology-coherent-slice-mask.html
> 
>   * igt@i915_query@query-topology-known-pci-ids:
>     - shard-dg1:          NOTRUN -> [SKIP][109] ([fdo#109303])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-16/igt@i915_query@query-topology-known-pci-ids.html
> 
>   * igt@i915_selftest@mock@memory_region:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][110] ([i915#9311])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@i915_selftest@mock@memory_region.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4212])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
> 
>   * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
>     - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#4212]) +1 other test skip
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-12/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#8502]) +7 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-16/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs.html
> 
>   * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [FAIL][114] ([i915#8247]) +3 other tests fail
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-5/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [FAIL][115] ([i915#8247]) +3 other tests fail
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-17/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#404])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#1769] / [i915#3555])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>     - shard-tglu:         NOTRUN -> [SKIP][118] ([fdo#111615] / [i915#5286])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-10/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#4538] / [i915#5286]) +3 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-12/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>     - shard-mtlp:         [PASS][120] -> [FAIL][121] ([i915#5138])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>     - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#5286])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-19/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#5286]) +1 other test skip
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-mtlp:         NOTRUN -> [SKIP][124] ([fdo#111614]) +2 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-1/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-270:
>     - shard-tglu:         NOTRUN -> [SKIP][125] ([fdo#111614])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-3/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][126] ([fdo#111614]) +7 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][127] ([fdo#111614] / [i915#3638])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#3638])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-19/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#5190]) +13 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-mtlp:         NOTRUN -> [SKIP][130] ([fdo#111615]) +4 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][131] ([fdo#110723]) +2 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#4538] / [i915#5190]) +8 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-tglu:         NOTRUN -> [SKIP][133] ([fdo#111615]) +1 other test skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#4538]) +2 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#2705])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#2705])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-5/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_ccs@pipe-a-bad-rotation-90-yf_tiled_ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#5354] / [i915#6095]) +3 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-5/igt@kms_ccs@pipe-a-bad-rotation-90-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#3689] / [i915#3886] / [i915#5354]) +11 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095]) +1 other test skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-6/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#3886] / [i915#5354] / [i915#6095]) +2 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-6/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#3689] / [i915#5354] / [i915#6095]) +1 other test skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-10/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#3689] / [i915#5354] / [i915#6095]) +7 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-18/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#3689] / [i915#5354]) +30 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-b-ccs-on-another-bo-4_tiled_mtl_rc_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#5354] / [i915#6095]) +6 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-4/igt@kms_ccs@pipe-b-ccs-on-another-bo-4_tiled_mtl_rc_ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#3734] / [i915#5354] / [i915#6095]) +1 other test skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-4/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_ccs.html
> 
>   * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#5354] / [i915#6095]) +5 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095]) +1 other test skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-17/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#3886] / [i915#5354] / [i915#6095]) +2 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-7/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_mtl_mc_ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#5354] / [i915#6095]) +12 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-18/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_mtl_mc_ccs.html
> 
>   * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#5354]) +16 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-4/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#4087] / [i915#7213]) +3 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#4087]) +3 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-7/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-dg1:          NOTRUN -> [SKIP][153] ([fdo#111827]) +1 other test skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-15/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-mtlp:         NOTRUN -> [SKIP][154] ([fdo#111827])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-4/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-rkl:          NOTRUN -> [SKIP][155] ([fdo#111827])
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-4/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-dg2:          NOTRUN -> [SKIP][156] ([fdo#111827]) +2 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-7/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_frames@dp-crc-single:
>     - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#7828]) +4 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-19/igt@kms_chamelium_frames@dp-crc-single.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#7828]) +13 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-1/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#7828]) +1 other test skip
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-3/igt@kms_chamelium_frames@hdmi-crc-single.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#7828]) +4 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#3299]) +2 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#7118]) +1 other test skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-3/igt@kms_content_protection@legacy.html
>     - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#7118])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-6/igt@kms_content_protection@legacy.html
>     - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#7116])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-12/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][165] ([i915#7173])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@kms_content_protection@lic@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-apl:          NOTRUN -> [SKIP][166] ([fdo#109271]) +63 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-apl2/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x10:
>     - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#3555]) +2 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#3555]) +4 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-19/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-tglu:         NOTRUN -> [SKIP][169] ([fdo#109279] / [i915#3359])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#3555]) +3 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#3555]) +10 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#3359]) +3 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>     - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#3359])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>     - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#3359])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-16/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][175] ([fdo#109274] / [fdo#111767] / [i915#5354])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#3546])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][177] ([fdo#111825]) +2 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-tglu:         NOTRUN -> [SKIP][178] ([fdo#109274]) +1 other test skip
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][179] ([fdo#109274] / [i915#5354]) +5 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#4103])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@single-bo@all-pipes:
>     - shard-mtlp:         [PASS][181] -> [DMESG-WARN][182] ([i915#2017]) +1 other test dmesg-warn
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-7/igt@kms_cursor_legacy@single-bo@all-pipes.html
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-4/igt@kms_cursor_legacy@single-bo@all-pipes.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#8588])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-5/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#3555] / [i915#3840])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-8/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#3555] / [i915#3840])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@kms_dsc@dsc-with-output-formats.html
>     - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#3555] / [i915#3840])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats.html
>     - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#3555] / [i915#3840])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-dg2:          [PASS][188] -> [FAIL][189] ([fdo#103375])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-dg2-6/igt@kms_fbcon_fbt@fbc-suspend.html
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][190] ([fdo#110189] / [i915#3955])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_fence_pin_leak:
>     - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#4881])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@kms_fence_pin_leak.html
> 
>   * igt@kms_flip@2x-flip-vs-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#8381])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-12/igt@kms_flip@2x-flip-vs-fences.html
> 
>   * igt@kms_flip@2x-flip-vs-fences-interruptible:
>     - shard-tglu:         NOTRUN -> [SKIP][193] ([fdo#109274] / [i915#3637])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-2/igt@kms_flip@2x-flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][194] ([fdo#109274]) +14 other tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#2672])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
>     - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#2587] / [i915#2672]) +1 other test skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#2672]) +4 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#5274])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-7/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#5354]) +70 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-tglu:         NOTRUN -> [SKIP][200] ([fdo#109280]) +6 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
>     - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#1825]) +4 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html
>     - shard-snb:          [PASS][202] -> [SKIP][203] ([fdo#109271])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg1:          NOTRUN -> [SKIP][204] ([fdo#111825]) +16 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#5439])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][206] ([fdo#110189]) +6 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#8708]) +20 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][208] ([fdo#111825] / [i915#1825]) +13 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
>     - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#3458]) +6 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#8708]) +1 other test skip
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>     - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#3458]) +23 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#8708]) +10 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
>     - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#3023]) +10 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#3555] / [i915#8228])
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-16/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#3555] / [i915#8228]) +2 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-d-edp-1-size-256:
>     - shard-mtlp:         [PASS][216] -> [DMESG-WARN][217] ([i915#1982])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-2/igt@kms_plane_cursor@viewport@pipe-d-edp-1-size-256.html
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-6/igt@kms_plane_cursor@viewport@pipe-d-edp-1-size-256.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#3555] / [i915#8806])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-6/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [FAIL][219] ([i915#8292])
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#5176] / [i915#9423]) +1 other test skip
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#5235]) +3 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:
>     - shard-snb:          NOTRUN -> [SKIP][222] ([fdo#109271]) +28 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-snb4/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#5235]) +19 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html
>     - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#5235]) +15 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-12/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#5235]) +3 other tests skip
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-1.html
> 
>   * igt@kms_prime@basic-crc-vgem:
>     - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#6524])
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-17/igt@kms_prime@basic-crc-vgem.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#658])
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#658]) +4 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-1/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@plane-move-sf-dmg-area:
>     - shard-rkl:          NOTRUN -> [SKIP][229] ([fdo#111068] / [i915#658])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
>     - shard-dg1:          NOTRUN -> [SKIP][230] ([fdo#111068] / [i915#658])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-18/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr@cursor_mmap_gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#1072]) +3 other tests skip
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-2/igt@kms_psr@cursor_mmap_gtt.html
> 
>   * igt@kms_psr@psr2_sprite_plane_move:
>     - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#1072]) +9 other tests skip
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@kms_psr@psr2_sprite_plane_move.html
> 
>   * igt@kms_psr@psr2_sprite_render:
>     - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#1072] / [i915#4078]) +1 other test skip
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-17/igt@kms_psr@psr2_sprite_render.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#5289])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#4235]) +1 other test skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#4235])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg1:          NOTRUN -> [SKIP][237] ([fdo#111615] / [i915#5289])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-15/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#3555] / [i915#4098]) +1 other test skip
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#3555] / [i915#8809])
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-dg2:          [PASS][240] -> [FAIL][241] ([IGT#2])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-dg2-11/igt@kms_sysfs_edid_timing.html
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-7/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#8623])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2:          NOTRUN -> [SKIP][243] ([fdo#109309])
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-2/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vblank@pipe-a-accuracy-idle:
>     - shard-apl:          [PASS][244] -> [SKIP][245] ([fdo#109271]) +73 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-apl3/igt@kms_vblank@pipe-a-accuracy-idle.html
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-apl2/igt@kms_vblank@pipe-a-accuracy-idle.html
> 
>   * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
>     - shard-apl:          [PASS][246] -> [INCOMPLETE][247] ([i915#180] / [i915#9392])
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
>     - shard-dg1:          [PASS][248] -> [FAIL][249] ([fdo#103375])
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-dg1-15/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-15/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@pipe-b-ts-continuation-suspend:
>     - shard-apl:          [PASS][250] -> [DMESG-WARN][251] ([i915#180] / [i915#7634])
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
> 
>   * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
>     - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#4070] / [i915#6768]) +2 other tests skip
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
> 
>   * igt@kms_vblank@pipe-d-wait-forked-busy-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#4070] / [i915#533] / [i915#6768])
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-6/igt@kms_vblank@pipe-d-wait-forked-busy-hang.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#2437])
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-17/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#2437])
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-7/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          [PASS][256] -> [FAIL][257] ([i915#4349]) +3 other tests fail
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@most-busy-idle-check-all@rcs0:
>     - shard-dg1:          [PASS][258] -> [FAIL][259] ([i915#5234])
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-dg1-16/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-19/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
> 
>   * igt@prime_udl:
>     - shard-tglu:         NOTRUN -> [SKIP][260] ([fdo#109291])
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-4/igt@prime_udl.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#3708] / [i915#4077])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-7/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#3708] / [i915#4077])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-18/igt@prime_vgem@basic-gtt.html
> 
>   * igt@prime_vgem@basic-read:
>     - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#3291] / [i915#3708])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-11/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#3708]) +2 other tests skip
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-1/igt@prime_vgem@fence-read-hang.html
>     - shard-rkl:          NOTRUN -> [SKIP][265] ([fdo#109295] / [i915#3708])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-2/igt@prime_vgem@fence-read-hang.html
> 
>   * igt@v3d/v3d_get_bo_offset@create-get-offsets:
>     - shard-tglu:         NOTRUN -> [SKIP][266] ([fdo#109315] / [i915#2575]) +2 other tests skip
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-2/igt@v3d/v3d_get_bo_offset@create-get-offsets.html
> 
>   * igt@v3d/v3d_job_submission@array-job-submission:
>     - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#2575]) +17 other tests skip
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-7/igt@v3d/v3d_job_submission@array-job-submission.html
> 
>   * igt@v3d/v3d_submit_csd@bad-bo:
>     - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#2575]) +1 other test skip
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-2/igt@v3d/v3d_submit_csd@bad-bo.html
> 
>   * igt@v3d/v3d_submit_csd@bad-perfmon:
>     - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#2575]) +4 other tests skip
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-16/igt@v3d/v3d_submit_csd@bad-perfmon.html
> 
>   * igt@v3d/v3d_wait_bo@unused-bo-0ns:
>     - shard-rkl:          NOTRUN -> [SKIP][270] ([fdo#109315]) +3 other tests skip
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-4/igt@v3d/v3d_wait_bo@unused-bo-0ns.html
> 
>   * igt@vc4/vc4_create_bo@create-bo-0:
>     - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#2575]) +1 other test skip
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-10/igt@vc4/vc4_create_bo@create-bo-0.html
> 
>   * igt@vc4/vc4_tiling@get-bad-handle:
>     - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#7711]) +10 other tests skip
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-10/igt@vc4/vc4_tiling@get-bad-handle.html
>     - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#7711]) +1 other test skip
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-6/igt@vc4/vc4_tiling@get-bad-handle.html
> 
>   * igt@vc4/vc4_tiling@get-bad-modifier:
>     - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#7711]) +1 other test skip
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-6/igt@vc4/vc4_tiling@get-bad-modifier.html
> 
>   * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
>     - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#7711]) +4 other tests skip
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-16/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_persistence@engines-hang@ccs0:
>     - shard-mtlp:         [ABORT][276] ([i915#9414]) -> [PASS][277] +1 other test pass
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-4/igt@gem_ctx_persistence@engines-hang@ccs0.html
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-2/igt@gem_ctx_persistence@engines-hang@ccs0.html
> 
>   * igt@gem_ctx_persistence@engines-hang@vcs0:
>     - shard-mtlp:         [FAIL][278] ([i915#2410]) -> [PASS][279] +3 other tests pass
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-4/igt@gem_ctx_persistence@engines-hang@vcs0.html
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-2/igt@gem_ctx_persistence@engines-hang@vcs0.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-rkl:          [FAIL][280] ([i915#2846]) -> [PASS][281]
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-pace-share@rcs0:
>     - shard-glk:          [FAIL][282] ([i915#2842]) -> [PASS][283]
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-rkl:          [FAIL][284] ([i915#2842]) -> [PASS][285]
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-rkl-1/igt@gem_exec_fair@basic-pace@rcs0.html
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_exec_schedule@preempt-engines@ccs0:
>     - shard-mtlp:         [FAIL][286] ([i915#9119]) -> [PASS][287] +4 other tests pass
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@ccs0.html
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-7/igt@gem_exec_schedule@preempt-engines@ccs0.html
> 
>   * igt@gem_exec_schedule@preempt-engines@rcs0:
>     - shard-mtlp:         [DMESG-FAIL][288] ([i915#8962]) -> [PASS][289]
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@rcs0.html
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-7/igt@gem_exec_schedule@preempt-engines@rcs0.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg1:          [TIMEOUT][290] ([i915#5493]) -> [PASS][291]
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_userptr_blits@nohangcheck:
>     - shard-mtlp:         [FAIL][292] ([i915#9353]) -> [PASS][293]
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-1/igt@gem_userptr_blits@nohangcheck.html
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-2/igt@gem_userptr_blits@nohangcheck.html
> 
>   * igt@i915_hangman@gt-engine-hang@vcs0:
>     - shard-mtlp:         [FAIL][294] ([i915#7069]) -> [PASS][295]
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-1/igt@i915_hangman@gt-engine-hang@vcs0.html
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-4/igt@i915_hangman@gt-engine-hang@vcs0.html
> 
>   * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-apl:          [FAIL][296] ([i915#7036]) -> [PASS][297]
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-apl3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-apl3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@i915_pm_rpm@dpms-non-lpsp:
>     - shard-rkl:          [SKIP][298] ([i915#1397]) -> [PASS][299] +1 other test pass
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-6/igt@i915_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@i915_pm_rpm@modeset-lpsp:
>     - shard-dg1:          [SKIP][300] ([i915#1397]) -> [PASS][301]
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-dg1-17/igt@i915_pm_rpm@modeset-lpsp.html
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - shard-apl:          [DMESG-FAIL][302] ([i915#5334]) -> [PASS][303]
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-apl4/igt@i915_selftest@live@gt_heartbeat.html
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         [FAIL][304] ([i915#5138]) -> [PASS][305]
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-tglu:         [FAIL][306] ([i915#3743]) -> [PASS][307] +1 other test pass
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-apl:          [DMESG-WARN][308] ([i915#1982] / [i915#7634]) -> [PASS][309]
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-apl2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-apl1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_cursor_crc@cursor-dpms@pipe-a-edp-1:
>     - shard-mtlp:         [DMESG-WARN][310] ([i915#9157]) -> [PASS][311]
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-2/igt@kms_cursor_crc@cursor-dpms@pipe-a-edp-1.html
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-8/igt@kms_cursor_crc@cursor-dpms@pipe-a-edp-1.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-256x85@pipe-c-dp-1:
>     - shard-apl:          [DMESG-WARN][312] ([i915#180] / [i915#7634]) -> [PASS][313] +4 other tests pass
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-apl2/igt@kms_cursor_crc@cursor-rapid-movement-256x85@pipe-c-dp-1.html
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-apl7/igt@kms_cursor_crc@cursor-rapid-movement-256x85@pipe-c-dp-1.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-apl:          [FAIL][314] ([i915#2346]) -> [PASS][315]
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:
>     - shard-dg2:          [FAIL][316] ([fdo#103375]) -> [PASS][317]
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-dg2-5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
>     - shard-snb:          [INCOMPLETE][318] -> [PASS][319]
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-snb1/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>     - shard-dg2:          [FAIL][320] ([i915#6880]) -> [PASS][321]
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-128:
>     - shard-mtlp:         [DMESG-WARN][322] ([i915#1982]) -> [PASS][323]
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-2/igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-128.html
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-8/igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-128.html
> 
>   * {igt@kms_pm_dc@dc9-dpms}:
>     - shard-tglu:         [SKIP][324] ([i915#4281]) -> [PASS][325]
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-tglu-5/igt@kms_pm_dc@dc9-dpms.html
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-rkl:          [INCOMPLETE][326] ([i915#8875]) -> [PASS][327]
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-rkl-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-tglu:         [FAIL][328] -> [PASS][329] +1 other test pass
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-tglu-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1:
>     - shard-snb:          [FAIL][330] -> [PASS][331]
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-snb2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1.html
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-snb2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
>     - shard-mtlp:         [FAIL][332] -> [PASS][333]
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
> 
>   * igt@perf_pmu@busy-double-start@bcs0:
>     - shard-mtlp:         [FAIL][334] ([i915#4349]) -> [PASS][335] +1 other test pass
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-mtlp-7/igt@perf_pmu@busy-double-start@bcs0.html
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-mtlp-3/igt@perf_pmu@busy-double-start@bcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pipe_stress@stress-xrgb8888-untiled:
>     - shard-apl:          [FAIL][336] ([i915#7036]) -> [SKIP][337] ([fdo#109271])
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-apl6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-apl2/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
> 
>   * igt@i915_pm_rpm@system-suspend-execbuf:
>     - shard-dg2:          [INCOMPLETE][338] ([i915#9142]) -> [FAIL][339] ([fdo#103375])
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-dg2-5/igt@i915_pm_rpm@system-suspend-execbuf.html
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-dg2-5/igt@i915_pm_rpm@system-suspend-execbuf.html
> 
>   * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
>     - shard-apl:          [SKIP][340] ([fdo#109271] / [i915#3886]) -> [SKIP][341] ([fdo#109271]) +8 other tests skip
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-apl1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-apl2/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-rkl:          [SKIP][342] ([i915#3955]) -> [SKIP][343] ([fdo#110189] / [i915#3955])
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-rkl-7/igt@kms_fbcon_fbt@psr.html
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-rkl-2/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_vblank@pipe-d-wait-idle:
>     - shard-apl:          [SKIP][344] ([fdo#109271] / [i915#533]) -> [SKIP][345] ([fdo#109271])
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13728/shard-apl1/igt@kms_vblank@pipe-d-wait-idle.html
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/shard-apl2/igt@kms_vblank@pipe-d-wait-idle.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
>   [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
>   [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
>   [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
>   [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
>   [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
>   [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
>   [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
>   [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
>   [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
>   [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
>   [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
>   [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
>   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>   [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
>   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
>   [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
>   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
>   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
>   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
>   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
>   [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
>   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
>   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
>   [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
>   [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
>   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
>   [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
>   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
>   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
>   [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
>   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
>   [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
>   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
>   [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
>   [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
>   [i915#5107]: https://gitlab.freedesktop.org/drm/intel/issues/5107
>   [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
>   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
>   [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
>   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
>   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
>   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
>   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
>   [i915#6188]: https://gitlab.freedesktop.org/drm/intel/issues/6188
>   [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
>   [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
>   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
>   [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
>   [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
>   [i915#7036]: https://gitlab.freedesktop.org/drm/intel/issues/7036
>   [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
>   [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
>   [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
>   [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
>   [i915#7634]: https://gitlab.freedesktop.org/drm/intel/issues/7634
>   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
>   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
>   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
>   [i915#7816]: https://gitlab.freedesktop.org/drm/intel/issues/7816
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7892]: https://gitlab.freedesktop.org/drm/intel/issues/7892
>   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
>   [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
>   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
>   [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
>   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
>   [i915#8430]: https://gitlab.freedesktop.org/drm/intel/issues/8430
>   [i915#8431]: https://gitlab.freedesktop.org/drm/intel/issues/8431
>   [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
>   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
>   [i915#8562]: https://gitlab.freedesktop.org/drm/intel/issues/8562
>   [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
>   [i915#8617]: https://gitlab.freedesktop.org/drm/intel/issues/8617
>   [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
>   [i915#8758]: https://gitlab.freedesktop.org/drm/intel/issues/8758
>   [i915#8806]: https://gitlab.freedesktop.org/drm/intel/issues/8806
>   [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
>   [i915#8875]: https://gitlab.freedesktop.org/drm/intel/issues/8875
>   [i915#8962]: https://gitlab.freedesktop.org/drm/intel/issues/8962
>   [i915#9053]: https://gitlab.freedesktop.org/drm/intel/issues/9053
>   [i915#9067]: https://gitlab.freedesktop.org/drm/intel/issues/9067
>   [i915#9119]: https://gitlab.freedesktop.org/drm/intel/issues/9119
>   [i915#9142]: https://gitlab.freedesktop.org/drm/intel/issues/9142
>   [i915#9157]: https://gitlab.freedesktop.org/drm/intel/issues/9157
>   [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262
>   [i915#9311]: https://gitlab.freedesktop.org/drm/intel/issues/9311
>   [i915#9323]: https://gitlab.freedesktop.org/drm/intel/issues/9323
>   [i915#9353]: https://gitlab.freedesktop.org/drm/intel/issues/9353
>   [i915#9392]: https://gitlab.freedesktop.org/drm/intel/issues/9392
>   [i915#9407]: https://gitlab.freedesktop.org/drm/intel/issues/9407
>   [i915#9412]: https://gitlab.freedesktop.org/drm/intel/issues/9412
>   [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414
>   [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/intel/issues/9424
>   [i915#9433]: https://gitlab.freedesktop.org/drm/intel/issues/9433
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7520 -> IGTPW_9949
> 
>   CI-20190529: 20190529
>   CI_DRM_13728: e642685fe494c1893ab2fd94e6dc7b6827303d90 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9949: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/index.html
>   IGT_7520: 6435c8825e9269bdac515ca96cba4502b5b770f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9949/index.html

